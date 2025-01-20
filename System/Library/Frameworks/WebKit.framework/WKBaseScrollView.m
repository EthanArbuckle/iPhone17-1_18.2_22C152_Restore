@interface WKBaseScrollView
+ (void)_overrideAddGestureRecognizerIfNeeded;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (WKBaseScrollView)initWithFrame:(CGRect)a3;
- (WKBaseScrollViewDelegate)baseScrollViewDelegate;
- (id).cxx_construct;
- (unint64_t)_axesToPreventScrollingFromDelegate;
- (unint64_t)axesToPreventMomentumScrolling;
- (void)_updatePanGestureToPreventScrolling;
- (void)_wk_addGestureRecognizer:(id)a3;
- (void)removeFromSuperview;
- (void)removeGestureRecognizer:(id)a3;
- (void)setBaseScrollViewDelegate:(id)a3;
@end

@implementation WKBaseScrollView

- (void)setBaseScrollViewDelegate:(id)a3
{
}

- (WKBaseScrollView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  +[WKBaseScrollView _overrideAddGestureRecognizerIfNeeded];
  v11.receiver = self;
  v11.super_class = (Class)WKBaseScrollView;
  v8 = -[WKBaseScrollView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_axesToPreventMomentumScrolling = 0;
    objc_msgSend((id)-[WKBaseScrollView panGestureRecognizer](v8, "panGestureRecognizer"), "addTarget:action:", v8, sel__updatePanGestureToPreventScrolling);
  }
  return v9;
}

+ (void)_overrideAddGestureRecognizerIfNeeded
{
  char v2 = +[WKBaseScrollView _overrideAddGestureRecognizerIfNeeded]::hasOverridenAddGestureRecognizer;
  +[WKBaseScrollView _overrideAddGestureRecognizerIfNeeded]::hasOverridenAddGestureRecognizer = 1;
  if ((v2 & 1) == 0
    && (!WebCore::IOSApplication::isHimalaya((WebCore::IOSApplication *)a1)
     || WTF::linkedOnOrAfterSDKWithBehavior()))
  {
    v3 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v3, sel__wk_addGestureRecognizer_);
    v5 = (objc_class *)objc_opt_class();
    Implementation = method_getImplementation(InstanceMethod);
    TypeEncoding = method_getTypeEncoding(InstanceMethod);
    class_addMethod(v5, sel_addGestureRecognizer_, Implementation, TypeEncoding);
  }
}

- (void)_wk_addGestureRecognizer:(id)a3
{
  if ((id)[(WKBaseScrollView *)self panGestureRecognizer] == a3)
  {
    m_ptr = self->_axisLockingPanGestureRecognizer.m_ptr;
    if (!m_ptr)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__updatePanGestureToPreventScrolling];
      v7 = self->_axisLockingPanGestureRecognizer.m_ptr;
      self->_axisLockingPanGestureRecognizer.m_ptr = v6;
      if (v7)
      {
        CFRelease(v7);
        v6 = self->_axisLockingPanGestureRecognizer.m_ptr;
      }
      [v6 setName:@"Scroll axis locking"];
      [self->_axisLockingPanGestureRecognizer.m_ptr setDelegate:self];
      m_ptr = self->_axisLockingPanGestureRecognizer.m_ptr;
    }
    [(WKBaseScrollView *)self addGestureRecognizer:m_ptr];
  }
  v8.receiver = self;
  v8.super_class = (Class)WKBaseScrollView;
  [(WKBaseScrollView *)&v8 addGestureRecognizer:a3];
}

- (id).cxx_construct
{
  *((void *)self + 259) = 0;
  return self;
}

- (void)removeGestureRecognizer:(id)a3
{
  if ((id)[(WKBaseScrollView *)self panGestureRecognizer] == a3)
  {
    m_ptr = self->_axisLockingPanGestureRecognizer.m_ptr;
    self->_axisLockingPanGestureRecognizer.m_ptr = 0;
    if (m_ptr)
    {
      [(WKBaseScrollView *)self removeGestureRecognizer:m_ptr];
      CFRelease(m_ptr);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)WKBaseScrollView;
  [(WKBaseScrollView *)&v6 removeGestureRecognizer:a3];
}

- (void)_updatePanGestureToPreventScrolling
{
  v3 = (void *)[(WKBaseScrollView *)self panGestureRecognizer];
  unint64_t v4 = objc_msgSend((id)-[WKBaseScrollView panGestureRecognizer](self, "panGestureRecognizer"), "state");
  if (v4 <= 5 && ((1 << v4) & 0x39) != 0) {
    return;
  }
  if (([self->_axisLockingPanGestureRecognizer.m_ptr state] & 0xFFFFFFFFFFFFFFFELL) == 4) {
    return;
  }
  unint64_t v6 = [(WKBaseScrollView *)self _axesToPreventScrollingFromDelegate];
  if (!v6) {
    return;
  }
  char v7 = v6;
  [v3 translationInView:0];
  if ((v7 & 1) == 0 || fabs(v8) <= 2.22044605e-16)
  {
    if ((v7 & 2) == 0 || fabs(v9) <= 2.22044605e-16) {
      return;
    }
    unint64_t axesToPreventMomentumScrolling = self->_axesToPreventMomentumScrolling;
    goto LABEL_16;
  }
  unint64_t axesToPreventMomentumScrolling = self->_axesToPreventMomentumScrolling | 1;
  self->_unint64_t axesToPreventMomentumScrolling = axesToPreventMomentumScrolling;
  double v8 = 0.0;
  if ((v7 & 2) != 0 && fabs(v9) > 2.22044605e-16)
  {
LABEL_16:
    self->_unint64_t axesToPreventMomentumScrolling = axesToPreventMomentumScrolling | 2;
    double v9 = 0.0;
  }

  objc_msgSend(v3, "setTranslation:inView:", 0, v8, v9);
}

- (void)removeFromSuperview
{
  BOOL isBeingRemovedFromSuperview = self->_isBeingRemovedFromSuperview;
  self->_BOOL isBeingRemovedFromSuperview = 1;
  v4.receiver = self;
  v4.super_class = (Class)WKBaseScrollView;
  [(WKBaseScrollView *)&v4 removeFromSuperview];
  self->_BOOL isBeingRemovedFromSuperview = isBeingRemovedFromSuperview;
}

- (unint64_t)_axesToPreventScrollingFromDelegate
{
  if (self->_isBeingRemovedFromSuperview) {
    return 0;
  }
  if (![(WKBaseScrollView *)self window]) {
    return 0;
  }
  objc_super v4 = [(WKBaseScrollView *)self baseScrollViewDelegate];
  if (!v4) {
    return 0;
  }

  return [(WKBaseScrollViewDelegate *)v4 axesToPreventScrollingForPanGestureInScrollView:self];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id m_ptr = self->_axisLockingPanGestureRecognizer.m_ptr;
  if (m_ptr == a3 || m_ptr == a4) {
    return 1;
  }
  if (byte_1E93CF7BD)
  {
    if (byte_1E93CF7BC)
    {
LABEL_9:
      v9.receiver = self;
      v9.super_class = (Class)WKBaseScrollView;
      return -[WKBaseScrollView gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:](&v9, sel_gestureRecognizer_shouldRecognizeSimultaneouslyWithGestureRecognizer_);
    }
  }
  else
  {
    double v8 = self;
    int v7 = [MEMORY[0x1E4F42DB0] instancesRespondToSelector:sel_gestureRecognizer_shouldRecognizeSimultaneouslyWithGestureRecognizer_];
    self = v8;
    byte_1E93CF7BC = v7;
    byte_1E93CF7BD = 1;
    if (v7) {
      goto LABEL_9;
    }
  }
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if ((id)[(WKBaseScrollView *)self panGestureRecognizer] == a3) {
    self->_unint64_t axesToPreventMomentumScrolling = 0;
  }
  if (byte_1E93CF7BF)
  {
    if (byte_1E93CF7BE)
    {
LABEL_5:
      v7.receiver = self;
      v7.super_class = (Class)WKBaseScrollView;
      return [(WKBaseScrollView *)&v7 gestureRecognizerShouldBegin:a3];
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4F42DB0] instancesRespondToSelector:sel_gestureRecognizerShouldBegin_];
    byte_1E93CF7BE = v6;
    byte_1E93CF7BF = 1;
    if (v6) {
      goto LABEL_5;
    }
  }
  return 1;
}

- (WKBaseScrollViewDelegate)baseScrollViewDelegate
{
  return (WKBaseScrollViewDelegate *)objc_loadWeak((id *)&self->_baseScrollViewDelegate);
}

- (unint64_t)axesToPreventMomentumScrolling
{
  return self->_axesToPreventMomentumScrolling;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_baseScrollViewDelegate);
  id m_ptr = self->_axisLockingPanGestureRecognizer.m_ptr;
  self->_axisLockingPanGestureRecognizer.id m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

@end