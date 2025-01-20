@interface WKKeyboardScrollingAnimator
- (BOOL)beginWithEvent:(id)a3;
- (BOOL)scrollTriggeringKeyIsPressed;
- (WKKeyboardScrollingAnimator)init;
- (WKKeyboardScrollingAnimator)initWithScrollable:(id)a3;
- (id).cxx_construct;
- (optional<WebCore::KeyboardScroll>)keyboardScrollForEvent:(SEL)a3;
- (void)displayLinkFired:(id)a3;
- (void)handleKeyEvent:(id)a3;
- (void)invalidate;
- (void)resetViewForScrollToExtentAnimation;
- (void)startDisplayLinkIfNeeded;
- (void)stopAnimatedScroll;
- (void)stopDisplayLink;
- (void)stopScrollingImmediately;
- (void)willStartInteractiveScroll;
@end

@implementation WKKeyboardScrollingAnimator

- (id).cxx_construct
{
  *((unsigned char *)self + 60) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((unsigned char *)self + 32) = 0;
  *(_OWORD *)((char *)self + 68) = 0u;
  *(_OWORD *)((char *)self + 84) = 0u;
  return self;
}

- (WKKeyboardScrollingAnimator)initWithScrollable:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKKeyboardScrollingAnimator;
  result = [(WKKeyboardScrollingAnimator *)&v5 init];
  if (result) {
    result->_scrollable = (WKKeyboardScrollableInternal *)a3;
  }
  return result;
}

- (WKKeyboardScrollingAnimator)init
{
  return 0;
}

- (void)invalidate
{
  self->_scrollable = 0;
}

- (optional<WebCore::KeyboardScroll>)keyboardScrollForEvent:(SEL)a3
{
  result = (optional<WebCore::KeyboardScroll> *)[(WKKeyboardScrollableInternal *)self->_scrollable isKeyboardScrollable];
  if ((result & 1) == 0) {
    goto LABEL_15;
  }
  result = (optional<WebCore::KeyboardScroll> *)[a4 keyboardFlags];
  if ((result & 0x20) != 0) {
    goto LABEL_15;
  }
  v8 = (void *)[a4 charactersIgnoringModifiers];
  result = (optional<WebCore::KeyboardScroll> *)[v8 length];
  if (!result) {
    goto LABEL_15;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __54__WKKeyboardScrollingAnimator_keyboardScrollForEvent___block_invoke;
  v27[3] = &unk_1E58134B0;
  v27[4] = v8;
  result = (optional<WebCore::KeyboardScroll> *)__54__WKKeyboardScrollingAnimator_keyboardScrollForEvent___block_invoke((uint64_t)v27);
  if (!result) {
    goto LABEL_15;
  }
  int v9 = (int)result;
  int v10 = [a4 modifierFlags];
  int v11 = [a4 modifierFlags] & 0x480000;
  uint64_t v12 = v11 != 0;
  result = (optional<WebCore::KeyboardScroll> *)[a4 modifierFlags];
  BOOL v13 = (v10 & 0x220000) == 0;
  BOOL v14 = (v10 & 0x220000) != 0;
  if (v13) {
    unsigned int v15 = v11 != 0;
  }
  else {
    unsigned int v15 = v12 + 1;
  }
  unsigned int v16 = result & 0x1010000;
  if ((result & 0x1010000) != 0) {
    ++v15;
  }
  if (v15 < 2
    && ((v9 - 3) > 4u ? (int v17 = 19070976) : (int v17 = dword_1994F6E90[(char)v9 - 3]),
        result = (optional<WebCore::KeyboardScroll> *)[a4 modifierFlags],
        (result & v17) == 0))
  {
    if ((v9 - 3) < 2)
    {
      if (v11) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = 2 * (v16 != 0);
      }
    }
    else if ((v9 - 1) > 1)
    {
      uint64_t v12 = 1;
    }
    switch(v9)
    {
      case 2:
        uint64_t v19 = 3;
        break;
      case 3:
      case 5:
        uint64_t v19 = 0;
        break;
      case 4:
      case 6:
        uint64_t v19 = 1;
        break;
      case 7:
        uint64_t v19 = !v14;
        break;
      default:
        uint64_t v19 = 2;
        break;
    }
    [(WKKeyboardScrollableInternal *)self->_scrollable distanceForIncrement:v12 inDirection:v19];
    double v21 = v20;
    result = (optional<WebCore::KeyboardScroll> *)WebCore::unitVectorForScrollDirection();
    float v22 = v21;
    float v24 = v23 * v22;
    float v26 = v25 * v22;
    retstr->var0.__val_.offset.m_width = v24;
    retstr->var0.__val_.offset.m_height = v26;
    retstr->var0.__val_.maximumVelocity.m_width = v24 * 25.0;
    retstr->var0.__val_.maximumVelocity.m_height = v26 * 25.0;
    retstr->var0.__val_.force.m_width = v24 * 25.0;
    retstr->var0.__val_.force.m_height = v26 * 25.0;
    retstr->var0.__val_.granularity = v12;
    retstr->var0.__val_.direction = v19;
    BOOL v18 = 1;
  }
  else
  {
LABEL_15:
    BOOL v18 = 0;
    retstr->var0.__null_state_ = 0;
  }
  retstr->__engaged_ = v18;
  return result;
}

uint64_t __54__WKKeyboardScrollingAnimator_keyboardScrollForEvent___block_invoke(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) characterAtIndex:0];
  if (v1 > 63275)
  {
    if (v1 == 63276)
    {
      return 5;
    }
    else if (v1 == 63277)
    {
      return 6;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    int v2 = v1 - 63232;
    uint64_t result = 1;
    switch(v2)
    {
      case 0:
        uint64_t result = 3;
        break;
      case 1:
        uint64_t result = 4;
        break;
      case 2:
        return result;
      case 3:
        uint64_t result = 2;
        break;
      default:
        return 0;
    }
  }
  return result;
}

uint64_t __54__WKKeyboardScrollingAnimator_keyboardScrollForEvent___block_invoke_2(uint64_t a1)
{
  unint64_t v1 = *(char *)(a1 + 32);
  if (v1 > 7) {
    return 4718592;
  }
  else {
    return dword_1994F6EA4[v1];
  }
}

uint64_t __54__WKKeyboardScrollingAnimator_keyboardScrollForEvent___block_invoke_3(unsigned __int8 *a1)
{
  int v1 = a1[32];
  if ((v1 - 1) < 2)
  {
    return a1[33];
  }
  else if ((v1 - 3) >= 2)
  {
    return v1 != 0;
  }
  else if (a1[33])
  {
    return 1;
  }
  else
  {
    return (2 * a1[34]);
  }
}

uint64_t __54__WKKeyboardScrollingAnimator_keyboardScrollForEvent___block_invoke_4(uint64_t a1)
{
  unsigned __int8 v1 = 2;
  switch(*(unsigned char *)(a1 + 32))
  {
    case 0:
    case 4:
    case 6:
      unsigned __int8 v1 = 1;
      break;
    case 2:
      unsigned __int8 v1 = 3;
      break;
    case 3:
    case 5:
      unsigned __int8 v1 = 0;
      break;
    case 7:
      unsigned __int8 v1 = *(unsigned char *)(a1 + 33) ^ 1;
      break;
    default:
      return v1;
  }
  return v1;
}

- (BOOL)beginWithEvent:(id)a3
{
  if ([a3 type] != 4) {
    return 0;
  }
  if (!self) {
    return 0;
  }
  [(WKKeyboardScrollingAnimator *)self keyboardScrollForEvent:a3];
  if (!v35[28]) {
    return 0;
  }
  if (self->_scrollTriggeringKeyIsPressed) {
    return 0;
  }
  LODWORD(v33.x) = [(WKKeyboardScrollableInternal *)self->_scrollable rubberbandableDirections];
  unsigned int v7 = v35[25] - 1;
  uint64_t v8 = v7 > 2 ? 0 : qword_1994F6EC8[(char)v7];
  if (!*((unsigned char *)&v33.x + v8)) {
    return 0;
  }
  self->_scrollTriggeringKeyIsPressed = 1;
  *(_OWORD *)&self->_currentScroll.var0.__null_state_ = *(_OWORD *)v35;
  *(_OWORD *)((char *)&self->_currentScroll.var0.__val_.maximumVelocity.m_height + 1) = *(_OWORD *)&v35[13];
  [(WKKeyboardScrollingAnimator *)self resetViewForScrollToExtentAnimation];
  if (!v35[28])
  {
LABEL_28:
    __break(1u);
    JUMPOUT(0x198D9EDF0);
  }
  if (v35[24] != 2)
  {
    [(WKKeyboardScrollingAnimator *)self startDisplayLinkIfNeeded];
    [(WKKeyboardScrollableInternal *)self->_scrollable interactiveScrollVelocity];
    v33.x = v25;
    v33.y = v26;
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v34, (const CGSize *)&v33);
    if (v35[28])
    {
      switch(v35[25])
      {
        case 0:
          float v27 = fminf(v34.f32[1], 0.0);
          goto LABEL_22;
        case 1:
          float v27 = fmaxf(v34.f32[1], 0.0);
LABEL_22:
          v34.f32[1] = v27;
          break;
        case 2:
          float v28 = fminf(v34.f32[0], 0.0);
          goto LABEL_25;
        case 3:
          float v28 = fmaxf(v34.f32[0], 0.0);
LABEL_25:
          v34.f32[0] = v28;
          break;
        default:
          break;
      }
      [(WKKeyboardScrollableInternal *)self->_scrollable contentOffset];
      v33.x = v29;
      v33.y = v30;
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v32, &v33);
      float32x2_t v31 = (float32x2_t)v32;
      self->_currentPosition = v32;
      self->_velocity = (FloatSize)vadd_f32((float32x2_t)self->_velocity, v34);
      if (self->_currentScroll.__engaged_)
      {
        self->_idealPositionForMinimumTravel = (FloatPoint)vadd_f32(*(float32x2_t *)&self->_currentScroll.var0.__null_state_, v31);
        return 1;
      }
    }
    goto LABEL_28;
  }
  self->_velocity.m_width = 0.0;
  self->_velocity.m_height = 0.0;
  [(WKKeyboardScrollingAnimator *)self stopAnimatedScroll];
  [(WKKeyboardScrollableInternal *)self->_scrollable contentOffset];
  if (!v35[28]) {
    goto LABEL_28;
  }
  double v11 = v9;
  double v12 = v10;
  scrollable = self->_scrollable;
  *(float32x2_t *)&v33.x = vadd_f32((float32x2_t)self->_currentPosition, *(float32x2_t *)v35);
  WebCore::FloatPoint::operator CGPoint();
  -[WKKeyboardScrollableInternal boundedContentOffset:](scrollable, "boundedContentOffset:");
  double v15 = v14;
  double v17 = v16;
  BOOL v18 = objc_opt_new();
  m_ptr = self->_viewForTrackingScrollToExtentAnimation.m_ptr;
  self->_viewForTrackingScrollToExtentAnimation.m_ptr = v18;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    BOOL v18 = self->_viewForTrackingScrollToExtentAnimation.m_ptr;
  }
  BOOL v5 = 1;
  [v18 setHidden:1];
  [self->_viewForTrackingScrollToExtentAnimation.m_ptr setUserInteractionEnabled:0];
  [(WKKeyboardScrollableInternal *)self->_scrollable willBeginScrollingToExtentWithAnimationInTrackingView:self->_viewForTrackingScrollToExtentAnimation.m_ptr];
  double v20 = (void *)[MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  [v20 setMass:1.0];
  [v20 setStiffness:109.662271];
  [v20 setDamping:20.943951];
  [v20 setDuration:1.6];
  LODWORD(v21) = 1045220557;
  LODWORD(v22) = 1.0;
  LODWORD(v23) = 1.0;
  objc_msgSend(v20, "setTimingFunction:", objc_msgSend(MEMORY[0x1E4F39C10], "functionWithControlPoints::::", 0.0, v21, v22, v23));
  objc_msgSend(v20, "setFromValue:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v11, v12));
  objc_msgSend(v20, "setToValue:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v15, v17));
  float v24 = (void *)[self->_viewForTrackingScrollToExtentAnimation.m_ptr layer];
  objc_msgSend(v24, "setPosition:", v11, v12);
  [v24 removeAllAnimations];
  [v24 addAnimation:v20 forKey:@"ScrollToExtentAnimation"];
  objc_msgSend(v24, "setPosition:", v15, v17);
  [(WKKeyboardScrollingAnimator *)self startDisplayLinkIfNeeded];
  return v5;
}

- (void)handleKeyEvent:(id)a3
{
  if (self->_scrollTriggeringKeyIsPressed)
  {
    -[WKKeyboardScrollingAnimator keyboardScrollForEvent:](self, "keyboardScrollForEvent:");
    if (!v5 || [a3 type] == 5 || (objc_msgSend(a3, "modifierFlags") & 0x1010000) != 0)
    {
      [(WKKeyboardScrollingAnimator *)self stopAnimatedScroll];
      self->_scrollTriggeringKeyIsPressed = 0;
    }
  }
}

- (void)stopAnimatedScroll
{
  if (self->_currentScroll.__engaged_)
  {
    scrollable = self->_scrollable;
    v2.i32[0] = LODWORD(self->_velocity.m_width);
    v3.i32[0] = LODWORD(self->_velocity.m_height);
    *(float *)v4.i32 = sqrtf((float)(*(float *)v2.i32 * *(float *)v2.i32) * 0.0091743);
    v7.i64[0] = 0x8000000080000000;
    v7.i64[1] = 0x8000000080000000;
    float v8 = *(float *)vbslq_s8(v7, v4, v2).i32;
    *(float *)v4.i32 = sqrtf((float)(*(float *)v3.i32 * *(float *)v3.i32) * 0.0091743);
    *(float *)v2.i32 = v8 + self->_currentPosition.m_x;
    *(float *)v3.i32 = *(float *)vbslq_s8(v7, v4, v3).i32 + self->_currentPosition.m_y;
    float m_x = self->_idealPositionForMinimumTravel.m_x;
    float m_y = self->_idealPositionForMinimumTravel.m_y;
    switch(self->_currentScroll.var0.__val_.direction)
    {
      case 0u:
        BOOL v11 = m_y < *(float *)v3.i32;
        goto LABEL_6;
      case 1u:
        BOOL v11 = *(float *)v3.i32 < m_y;
LABEL_6:
        if (v11) {
          v3.i32[0] = LODWORD(self->_idealPositionForMinimumTravel.m_y);
        }
        break;
      case 2u:
        BOOL v12 = m_x < *(float *)v2.i32;
        goto LABEL_11;
      case 3u:
        BOOL v12 = *(float *)v2.i32 < m_x;
LABEL_11:
        if (v12) {
          v2.i32[0] = LODWORD(self->_idealPositionForMinimumTravel.m_x);
        }
        break;
      default:
        v2.i32[0] = 0;
        v3.i32[0] = 0;
        break;
    }
    unint64_t v15 = __PAIR64__(v3.u32[0], v2.u32[0]);
    WebCore::FloatPoint::operator CGPoint();
    [(WKKeyboardScrollableInternal *)scrollable boundedContentOffset:v15];
    v16.x = v13;
    v16.y = v14;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v17, &v16);
    self->_idealPosition = v17;
    if (self->_currentScroll.__engaged_) {
      self->_currentScroll.__engaged_ = 0;
    }
  }
}

- (BOOL)scrollTriggeringKeyIsPressed
{
  return self->_scrollTriggeringKeyIsPressed;
}

- (void)willStartInteractiveScroll
{
  self->_velocity.m_width = 0.0;
  self->_velocity.m_height = 0.0;
  [(WKKeyboardScrollingAnimator *)self resetViewForScrollToExtentAnimation];
  [(WKKeyboardScrollingAnimator *)self stopAnimatedScroll];

  [(WKKeyboardScrollingAnimator *)self stopDisplayLink];
}

- (void)startDisplayLinkIfNeeded
{
  if (!self->_displayLink.m_ptr)
  {
    int8x16_t v3 = (void *)[MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_displayLinkFired_];
    int8x16_t v7 = v3;
    if (v3) {
      CFRetain(v3);
    }
    m_ptr = self->_displayLink.m_ptr;
    self->_displayLink.m_ptr = v7;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      int8x16_t v7 = self->_displayLink.m_ptr;
    }
    if (_MergedGlobals_38 == 1)
    {
      LODWORD(v4) = dword_1E93CF7DC;
      LODWORD(v5) = unk_1E93CF7E0;
      LODWORD(v6) = dword_1E93CF7E4;
    }
    else
    {
      *(CAFrameRateRange *)&double v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      dword_1E93CF7DC = LODWORD(v4);
      unk_1E93CF7E0 = LODWORD(v5);
      dword_1E93CF7E4 = LODWORD(v6);
      _MergedGlobals_38 = 1;
    }
    objc_msgSend(v7, "setPreferredFrameRateRange:", v4, v5, v6);
    [self->_displayLink.m_ptr setHighFrameRateReason:2883586];
    double v9 = self->_displayLink.m_ptr;
    uint64_t v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    uint64_t v11 = *MEMORY[0x1E4F1C4B0];
    [v9 addToRunLoop:v10 forMode:v11];
  }
}

- (void)resetViewForScrollToExtentAnimation
{
  objc_msgSend((id)objc_msgSend(self->_viewForTrackingScrollToExtentAnimation.m_ptr, "layer"), "removeAllAnimations");
  [self->_viewForTrackingScrollToExtentAnimation.m_ptr removeFromSuperview];
  m_ptr = self->_viewForTrackingScrollToExtentAnimation.m_ptr;
  self->_viewForTrackingScrollToExtentAnimation.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)stopDisplayLink
{
  [self->_displayLink.m_ptr invalidate];
  m_ptr = self->_displayLink.m_ptr;
  self->_displayLink.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)stopScrollingImmediately
{
  self->_velocity.m_width = 0.0;
  self->_velocity.m_height = 0.0;
}

- (void)displayLinkFired:(id)a3
{
  m_ptr = self->_viewForTrackingScrollToExtentAnimation.m_ptr;
  if (m_ptr)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(m_ptr, "layer", a3), "animationKeys"), "containsObject:", @"ScrollToExtentAnimation"))
    {
      double v5 = objc_msgSend((id)objc_msgSend(self->_viewForTrackingScrollToExtentAnimation.m_ptr, "layer"), "presentationLayer");
      if (v5)
      {
        scrollable = self->_scrollable;
        [v5 position];
        v37.x = v7;
        v37.y = v8;
        WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v38, &v37);
        LODWORD(v9) = v38[0];
        LODWORD(v10) = v38[1];
        -[WKKeyboardScrollableInternal scrollToContentOffset:animated:](scrollable, "scrollToContentOffset:animated:", 0, v9, v10);
      }
    }
    else
    {
      [(WKKeyboardScrollableInternal *)self->_scrollable didFinishScrolling];
      [(WKKeyboardScrollingAnimator *)self resetViewForScrollToExtentAnimation];
      [(WKKeyboardScrollingAnimator *)self stopDisplayLink];
    }
    return;
  }
  if (self->_currentScroll.__engaged_)
  {
    BOOL v12 = self->_scrollable;
    WebCore::FloatPoint::operator CGPoint();
    LODWORD(v37.x) = -[WKKeyboardScrollableInternal scrollableDirectionsFromOffset:](v12, "scrollableDirectionsFromOffset:");
    if (self->_currentScroll.__engaged_)
    {
      int direction = self->_currentScroll.var0.__val_.direction;
      if ((direction - 1) > 2) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = qword_1994F6EC8[(char)(direction - 1)];
      }
      if (*((unsigned char *)&v37.x + v14))
      {
        _D8 = (float32x2_t)vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32((direction & 0xFE) == 2), 0x1FuLL)), (int8x8_t)0x3F80000000000000, (int8x8_t)1065353216);
        FloatSize force = self->_currentScroll.var0.__val_.force;
LABEL_18:
        float32x2_t v20 = (float32x2_t)vbic_s8((int8x8_t)force, (int8x8_t)vcage_f32((float32x2_t)self->_velocity, (float32x2_t)self->_currentScroll.var0.__val_.maximumVelocity));
        goto LABEL_19;
      }
      WebCore::unitVectorForScrollDirection();
      if (self->_currentScroll.__engaged_)
      {
        v22.i32[1] = v23;
        FloatSize force = (FloatSize)vmul_f32(v22, (float32x2_t)vdup_n_s32(0x459C4000u));
        __asm { FMOV            V8.2S, #1.0 }
        goto LABEL_18;
      }
    }
    __break(1u);
    return;
  }
  __asm { FMOV            V8.2S, #1.0 }
  float32x2_t v20 = 0;
LABEL_19:
  float v24 = self->_scrollable;
  WebCore::FloatPoint::operator CGPoint();
  -[WKKeyboardScrollableInternal boundedContentOffset:](v24, "boundedContentOffset:");
  v37.x = v25;
  v37.y = v26;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v36, &v37);
  __asm { FMOV            V2.2S, #-20.0 }
  float32x2_t v28 = vadd_f32(v20, vmul_f32(_D8, vadd_f32(vmul_f32(vsub_f32((float32x2_t)self->_currentPosition, v36), (float32x2_t)vdup_n_s32(0xC2DA0000)), vmul_f32((float32x2_t)self->_velocity, _D2))));
  [a3 targetTimestamp];
  double v30 = v29;
  [a3 timestamp];
  *(float *)&double v31 = v30 - v31;
  FloatSize v32 = (FloatSize)vadd_f32((float32x2_t)self->_velocity, vmul_n_f32(v28, *(float *)&v31));
  self->_velocity = v32;
  float32x2_t v33 = vmul_n_f32((float32x2_t)v32, *(float *)&v31);
  FloatPoint currentPosition = self->_currentPosition;
  FloatPoint v35 = (FloatPoint)vadd_f32(v33, (float32x2_t)currentPosition);
  self->_FloatPoint currentPosition = v35;
  currentPosition.float m_x = v35.m_y;
  -[WKKeyboardScrollableInternal scrollToContentOffset:animated:](self->_scrollable, "scrollToContentOffset:animated:", 0, *(double *)&v35, *(double *)&currentPosition);
  if (!self->_scrollTriggeringKeyIsPressed
    && (float)((float)(self->_velocity.m_height * self->_velocity.m_height)
             + (float)(self->_velocity.m_width * self->_velocity.m_width)) < 1.0)
  {
    [(WKKeyboardScrollableInternal *)self->_scrollable didFinishScrolling];
    [(WKKeyboardScrollingAnimator *)self stopDisplayLink];
    self->_velocity.m_width = 0.0;
    self->_velocity.m_height = 0.0;
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_viewForTrackingScrollToExtentAnimation.m_ptr;
  self->_viewForTrackingScrollToExtentAnimation.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  double v4 = self->_displayLink.m_ptr;
  self->_displayLink.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

@end