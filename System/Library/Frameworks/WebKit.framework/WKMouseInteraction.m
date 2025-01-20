@interface WKMouseInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasGesture:(id)a3;
- (BOOL)isEnabled;
- (CGPoint)locationInView:(id)a3;
- (UIGestureRecognizer)mouseTouchGestureRecognizer;
- (UITouch)mouseTouch;
- (UIView)view;
- (WKMouseInteraction)initWithDelegate:(id)a3;
- (WKMouseInteractionDelegate)delegate;
- (id).cxx_construct;
- (id)_activeGesture;
- (optional<CGPoint>)lastLocation;
- (optional<WebKit::NativeWebMouseEvent>)createMouseEventWithType:(optional<WebKit:(optional<WebKit::NativeWebMouseEvent> *)self :NativeWebMouseEvent> *__return_ptr)retstr wasCancelled:;
- (void)_forEachGesture:(id)a3;
- (void)_hoverGestureRecognized:(id)a3;
- (void)_resetCachedState;
- (void)_updateMouseTouches:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation WKMouseInteraction

- (UIView)view
{
  return (UIView *)objc_loadWeak((id *)&self->_view);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __33__WKMouseInteraction_setEnabled___block_invoke;
    v5[3] = &__block_descriptor_33_e29_v16__0__UIGestureRecognizer_8l;
    BOOL v6 = a3;
    [(WKMouseInteraction *)self _forEachGesture:v5];
    if (!a3) {
      [(WKMouseInteraction *)self _resetCachedState];
    }
  }
}

- (WKMouseInteraction)initWithDelegate:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)WKMouseInteraction;
  v4 = [(WKMouseInteraction *)&v13 init];
  if (v4)
  {
    v5 = [[WKMouseTouchGestureRecognizer alloc] initWithInteraction:v4];
    m_ptr = v4->_mouseTouchGestureRecognizer.m_ptr;
    v4->_mouseTouchGestureRecognizer.m_ptr = v5;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v5 = (WKMouseTouchGestureRecognizer *)v4->_mouseTouchGestureRecognizer.m_ptr;
    }
    [(WKMouseTouchGestureRecognizer *)v5 setName:@"WKMouseTouch"];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v4 action:sel__hoverGestureRecognized_];
    v8 = v4->_pencilHoverGestureRecognizer.m_ptr;
    v4->_pencilHoverGestureRecognizer.m_ptr = v7;
    if (v8)
    {
      CFRelease(v8);
      v7 = v4->_pencilHoverGestureRecognizer.m_ptr;
    }
    [v7 setName:@"WKPencilHover"];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v4 action:sel__hoverGestureRecognized_];
    v10 = v4->_mouseHoverGestureRecognizer.m_ptr;
    v4->_mouseHoverGestureRecognizer.m_ptr = v9;
    if (v10)
    {
      CFRelease(v10);
      v9 = v4->_mouseHoverGestureRecognizer.m_ptr;
    }
    [v9 setName:@"WKMouseHover"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__WKMouseInteraction_initWithDelegate___block_invoke;
    v12[3] = &unk_1E58135B0;
    v12[4] = v4;
    [(WKMouseInteraction *)v4 _forEachGesture:v12];
    [v4->_pencilHoverGestureRecognizer.m_ptr setAllowedTouchTypes:&unk_1EEA530B0];
    [v4->_mouseTouchGestureRecognizer.m_ptr setAllowedTouchTypes:&unk_1EEA530C8];
    [v4->_mouseHoverGestureRecognizer.m_ptr setAllowedTouchTypes:&unk_1EEA530E0];
    objc_storeWeak((id *)&v4->_delegate, a3);
    v4->_enabled = 1;
    v4->_cancelledOrExited = 1;
  }
  return v4;
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  if (objc_loadWeak((id *)&self->_view) != a3)
  {
    objc_storeWeak((id *)p_view, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__WKMouseInteraction_didMoveToView___block_invoke;
    v6[3] = &unk_1E58135B0;
    v6[4] = a3;
    [(WKMouseInteraction *)self _forEachGesture:v6];
  }
}

- (void)willMoveToView:(id)a3
{
  if (objc_loadWeak((id *)&self->_view) != a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37__WKMouseInteraction_willMoveToView___block_invoke;
    v4[3] = &unk_1E58135B0;
    v4[4] = self;
    [(WKMouseInteraction *)self _forEachGesture:v4];
    [(WKMouseInteraction *)self _resetCachedState];
  }
}

- (void)_forEachGesture:(id)a3
{
  v7 = (void (**)(id, void *))((char *)a3 + 16);
  (*((void (**)(id, void *))a3 + 2))(a3, self->_mouseTouchGestureRecognizer.m_ptr);
  (*v7)(a3, self->_mouseHoverGestureRecognizer.m_ptr);
  m_ptr = self->_pencilHoverGestureRecognizer.m_ptr;
  BOOL v6 = *v7;

  v6(a3, m_ptr);
}

uint64_t __39__WKMouseInteraction_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

uint64_t __37__WKMouseInteraction_willMoveToView___block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(*(void *)(a1 + 32) + 48));

  return [Weak removeGestureRecognizer:a2];
}

uint64_t __36__WKMouseInteraction_didMoveToView___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addGestureRecognizer:a2];
}

- (void)_resetCachedState
{
  *(_WORD *)&self->_touching = 256;
  self->_lastLocation.var0.__null_state_ = 0;
  self->_lastLocation.__engaged_ = 0;
  self->_pressedButtonMask.var0.__null_state_ = 0;
  self->_pressedButtonMask.__engaged_ = 0;
  m_ptr = self->_currentHoverTouch.m_ptr;
  self->_currentHoverTouch.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_currentMouseTouch.m_ptr;
  self->_currentMouseTouch.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 56) = 0;
  *((unsigned char *)self + 72) = 0;
  *((unsigned char *)self + 80) = 0;
  *((unsigned char *)self + 88) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((void *)self + 5) = 0;
  return self;
}

- (BOOL)hasGesture:(id)a3
{
  return self->_mouseTouchGestureRecognizer.m_ptr == a3
      || self->_mouseHoverGestureRecognizer.m_ptr == a3
      || self->_pencilHoverGestureRecognizer.m_ptr == a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

uint64_t __33__WKMouseInteraction_setEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (UITouch)mouseTouch
{
  uint64_t v2 = 40;
  if (!self->_touching) {
    uint64_t v2 = 32;
  }
  return *(UITouch **)((char *)&self->super.isa + v2);
}

- (UIGestureRecognizer)mouseTouchGestureRecognizer
{
  return (UIGestureRecognizer *)self->_mouseTouchGestureRecognizer.m_ptr;
}

- (id)_activeGesture
{
  if (self->_touching)
  {
    uint64_t v3 = 8;
  }
  else
  {
    uint64_t v4 = [self->_currentHoverTouch.m_ptr type];
    uint64_t v3 = 16;
    if (v4 == 2) {
      uint64_t v3 = 24;
    }
  }
  return *(Class *)((char *)&self->super.isa + v3);
}

- (optional<WebKit::NativeWebMouseEvent>)createMouseEventWithType:(optional<WebKit:(optional<WebKit::NativeWebMouseEvent> *)self :NativeWebMouseEvent> *__return_ptr)retstr wasCancelled:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if ((v2 & 0xFF00) == 0)
  {
    retstr->var0.var0 = 0;
    retstr[5].var0.var0 = 0;
    return self;
  }
  char v5 = v3;
  char v6 = v2;
  v7 = self;
  unint64_t v8 = objc_msgSend((id)unk_1EEAEC398(self, "_activeGesture"), "modifierFlags");
  char v43 = v5;
  if ((v8 & 0x40000) != 0)
  {
    BOOL v10 = *(&v7[3].var0.var0 + 1) == 0;
    BOOL v11 = v6 == 1;
    char v12 = 2;
LABEL_11:
    __int16 v13 = 2;
    goto LABEL_12;
  }
  if (!v7[2].var0.var1.var4[8])
  {
    char v12 = 0;
    BOOL v10 = *(&v7[3].var0.var0 + 1) == 0;
    BOOL v11 = v6 == 1;
    goto LABEL_9;
  }
  uint64_t v9 = *((void *)&v7[2].var0.var15 + 2);
  BOOL v10 = *(&v7[3].var0.var0 + 1) == 0;
  BOOL v11 = v6 == 1;
  if ((v9 & 2) != 0)
  {
    char v12 = v9 & 2;
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_9:
  __int16 v13 = 1;
LABEL_12:
  if (v10) {
    char v14 = -2;
  }
  else {
    char v14 = v12;
  }
  if (v11 || v10) {
    __int16 v15 = 0;
  }
  else {
    __int16 v15 = v13;
  }
  __int16 v42 = v15;
  v16 = (void *)unk_1EEAEC3A0(v7, "mouseTouch");
  unk_1EEAEC3A8(v7, "locationInView:", unk_1EEAEC3B0(v7, "view"));
  *(void *)v47 = v17;
  *(void *)&v47[8] = v18;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v46, (const CGPoint *)v47);
  objc_msgSend(v16, "previousLocationInView:", unk_1EEAEC3B8(v7, "view"));
  *(void *)v47 = v19;
  *(void *)&v47[8] = v20;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v45, (const CGPoint *)v47);
  int v21 = v46;
  int v22 = HIDWORD(v46);
  int v24 = v45;
  int v23 = HIDWORD(v45);
  int v25 = [v16 tapCount];
  [v16 timestamp];
  uint64_t v45 = v26;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&v45);
  double v28 = v27;
  v29 = (WebCore *)[v16 type];
  if (v29 == (WebCore *)2) {
    v30 = (WTF::StringImpl **)WebCore::penPointerEventType((WebCore *)2);
  }
  else {
    v30 = (WTF::StringImpl **)WebCore::mousePointerEventType(v29);
  }
  v31 = *v30;
  if (*v30) {
    *(_DWORD *)v31 += 2;
  }
  v44 = v31;
  WebKit::NativeWebMouseEvent::NativeWebMouseEvent((uint64_t)v47, v6, v14, v42, &v46, &v46, v25, (v8 >> 12) & 0x10 | (v8 >> 17) & 0xF, (float)(v21 - v24), (float)(v22 - v23), 0.0, v28, 0.0, v43, (_DWORD **)&v44);
  retstr->var0.var1.var0.m_value = 0;
  *(_OWORD *)(&retstr->var0.var3 + 2) = *(_OWORD *)&v47[4];
  long long v32 = v48;
  *((_OWORD *)&retstr->var0.var15 + 1) = *(_OWORD *)&v47[16];
  *(_OWORD *)&retstr[1].var0.var0 = v32;
  long long v33 = v50;
  *((_OWORD *)&retstr[1].var0.var15 + 1) = v49;
  *(_OWORD *)&retstr[2].var0.var0 = v33;
  *((_OWORD *)&retstr[2].var0.var15 + 1) = v51;
  retstr[3].var0.var14.m_impl.m_ptr = (StringImpl *)v52;
  *((unsigned char *)&retstr[3].var0.var7 + 8) = v53;
  uint64_t v34 = v54;
  v52 = 0;
  uint64_t v54 = 0;
  *((void *)&retstr[3].var0.var15 + 2) = v34;
  uint64_t v35 = v55;
  uint64_t v55 = 0;
  *((void *)&retstr[3].var0.var18 + 3) = v35;
  v36 = v56;
  v56 = 0;
  retstr[4].var0.var14.m_impl.m_ptr = v36;
  double v37 = v57;
  double v57 = 0.0;
  retstr[4].var0.var1.var3.m_value = v37;
  *((void *)&retstr[4].var0.var15 + 2) = v58;
  retstr[5].var0.var0 = 1;
  uint64_t v58 = 0;
  WTF::Vector<WebKit::WebMouseEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v56, v38);
  WTF::Vector<WebKit::WebMouseEvent,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v54, v39);
  v41 = v52;
  v52 = 0;
  if (v41)
  {
    if (*(_DWORD *)v41 == 2) {
      WTF::StringImpl::destroy(v41, v40);
    }
    else {
      *(_DWORD *)v41 -= 2;
    }
  }
  self = (optional<WebKit::NativeWebMouseEvent> *)v44;
  v44 = 0;
  if (self)
  {
    if (self->var0.var1.var0.m_value == 2) {
      return (optional<WebKit::NativeWebMouseEvent> *)WTF::StringImpl::destroy((WTF::StringImpl *)self, v40);
    }
    else {
      self->var0.var1.var0.m_value -= 2;
    }
  }
  return self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_pencilHoverGestureRecognizer.m_ptr == a3 || (int v7 = [a4 _isPointerTouch]) != 0)
  {
    if (self->_mouseHoverGestureRecognizer.m_ptr == a3 || self->_pencilHoverGestureRecognizer.m_ptr == a3)
    {
      if (a4) {
        CFRetain(a4);
      }
      m_ptr = self->_currentHoverTouch.m_ptr;
      self->_currentHoverTouch.m_ptr = a4;
      if (m_ptr) {
        CFRelease(m_ptr);
      }
    }
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)_hoverGestureRecognized:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_currentHoverTouch.m_ptr)
  {
    uint64_t v5 = [a3 state];
    if ((unint64_t)(v5 - 1) <= 4) {
      self->_cancelledOrExited = 0x101010000uLL >> (8 * (v5 - 1));
    }
    if (![a3 buttonMask])
    {
      objc_msgSend(a3, "locationInView:", -[WKMouseInteraction view](self, "view"));
      BOOL engaged = self->_lastLocation.__engaged_;
      if (v5 == 4)
      {
        self->_lastLocation.var0.__val_.x = v6;
        self->_lastLocation.var0.__val_.y = v7;
        if (engaged)
        {
LABEL_14:
          [(WKMouseInteraction *)self createMouseEventWithType:258 wasCancelled:v5 == 4];
          if (v10[160]) {
            [objc_loadWeak((id *)&self->_delegate) mouseInteraction:self changedWithEvent:v10];
          }
          std::__optional_destruct_base<WebKit::NativeWebMouseEvent,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v10, v9);
          return;
        }
      }
      else
      {
        if (self->_lastLocation.__engaged_)
        {
          if (self->_lastLocation.var0.__val_.x == v6 && self->_lastLocation.var0.__val_.y == v7) {
            return;
          }
          self->_lastLocation.var0.__val_.x = v6;
          self->_lastLocation.var0.__val_.y = v7;
          goto LABEL_14;
        }
        self->_lastLocation.var0.__val_.x = v6;
        self->_lastLocation.var0.__val_.y = v7;
      }
      self->_lastLocation.__engaged_ = 1;
      goto LABEL_14;
    }
  }
}

- (void)_updateMouseTouches:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 anyObject];
  uint64_t v5 = v4;
  if (v4) {
    CFRetain(v4);
  }
  m_ptr = self->_currentMouseTouch.m_ptr;
  self->_currentMouseTouch.m_ptr = v5;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  [self->_mouseTouchGestureRecognizer.m_ptr locationInView:objc_loadWeak((id *)&self->_view)];
  BOOL engaged = self->_lastLocation.__engaged_;
  self->_lastLocation.var0.__val_.x = v8;
  self->_lastLocation.var0.__val_.y = v9;
  if (!engaged) {
    self->_lastLocation.__engaged_ = 1;
  }
  uint64_t v10 = [self->_currentMouseTouch.m_ptr phase];
  uint64_t v11 = v10;
  if ((unint64_t)(v10 - 3) < 2)
  {
    int v14 = 1;
    uint64_t v16 = 256;
    uint64_t v15 = 1;
    char v12 = 1;
  }
  else if (v10 == 1)
  {
    char v12 = 1;
    self->_touching = 1;
    int v14 = 0;
    self->_pressedButtonMask.var0.__val_ = [self->_mouseTouchGestureRecognizer.m_ptr buttonMask];
    self->_pressedButtonMask.__engaged_ = 1;
    uint64_t v16 = 256;
    uint64_t v15 = 2;
  }
  else if (v10)
  {
    int v14 = 0;
    uint64_t v15 = 0;
    char v12 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    char v12 = 1;
    self->_touching = 1;
    int64_t v13 = [self->_mouseTouchGestureRecognizer.m_ptr buttonMask];
    int v14 = 0;
    uint64_t v15 = 0;
    self->_pressedButtonMask.var0.__val_ = v13;
    self->_pressedButtonMask.__engaged_ = 1;
    uint64_t v16 = 256;
  }
  [(WKMouseInteraction *)self createMouseEventWithType:v16 | v15 wasCancelled:v11 == 4];
  char v18 = v12 ^ 1;
  if (!v21) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    id Weak = objc_loadWeak((id *)&self->_delegate);
    if (!v21) {
      __break(1u);
    }
    [Weak mouseInteraction:self changedWithEvent:v20];
    if (v14)
    {
      self->_touching = 0;
      if (self->_pressedButtonMask.__engaged_) {
        self->_pressedButtonMask.__engaged_ = 0;
      }
    }
  }
  std::__optional_destruct_base<WebKit::NativeWebMouseEvent,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v20, v17);
}

- (CGPoint)locationInView:(id)a3
{
  uint64_t v5 = [(WKMouseInteraction *)self mouseTouch];
  if (v5 && !self->_cancelledOrExited)
  {
    [(UITouch *)v5 locationInView:a3];
  }
  else
  {
    double v6 = -1.0;
    double v7 = -1.0;
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (WKMouseInteractionDelegate)delegate
{
  return (WKMouseInteractionDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (optional<CGPoint>)lastLocation
{
  *retstr = *(optional<CGPoint> *)((char *)self + 56);
  return self;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  m_ptr = self->_currentMouseTouch.m_ptr;
  self->_currentMouseTouch.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->_currentHoverTouch.m_ptr;
  self->_currentHoverTouch.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = self->_pencilHoverGestureRecognizer.m_ptr;
  self->_pencilHoverGestureRecognizer.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  double v6 = self->_mouseHoverGestureRecognizer.m_ptr;
  self->_mouseHoverGestureRecognizer.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  double v7 = self->_mouseTouchGestureRecognizer.m_ptr;
  self->_mouseTouchGestureRecognizer.m_ptr = 0;
  if (v7)
  {
    CFRelease(v7);
  }
}

@end