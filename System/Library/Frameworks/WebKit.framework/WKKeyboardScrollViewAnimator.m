@interface WKKeyboardScrollViewAnimator
- (BOOL)beginWithEvent:(id)a3;
- (BOOL)isKeyboardScrollable;
- (BOOL)scrollTriggeringKeyIsPressed;
- (CGPoint)boundedContentOffset:(CGPoint)a3;
- (CGPoint)contentOffset;
- (CGSize)interactiveScrollVelocity;
- (RectEdges<BOOL>)rubberbandableDirections;
- (RectEdges<BOOL>)scrollableDirectionsFromOffset:(CGPoint)a3;
- (WKKeyboardScrollViewAnimator)init;
- (WKKeyboardScrollViewAnimator)initWithScrollView:(id)a3;
- (WKKeyboardScrollViewAnimatorDelegate)delegate;
- (double)distanceForIncrement:(unsigned __int8)a3 inDirection:(unsigned __int8)a4;
- (id).cxx_construct;
- (void)dealloc;
- (void)didFinishScrolling;
- (void)handleKeyEvent:(id)a3;
- (void)invalidate;
- (void)scrollToContentOffset:(FloatPoint)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)stopScrollingImmediately;
- (void)willBeginScrollingToExtentWithAnimationInTrackingView:(id)a3;
- (void)willStartInteractiveScroll;
@end

@implementation WKKeyboardScrollViewAnimator

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  objc_storeWeak((id *)&self->_delegate, a3);
  objc_loadWeak((id *)p_delegate);
  self->_delegateRespondsToIsKeyboardScrollable = objc_opt_respondsToSelector() & 1;
  objc_loadWeak((id *)p_delegate);
  self->_delegateRespondsToDistanceForIncrement = objc_opt_respondsToSelector() & 1;
  objc_loadWeak((id *)p_delegate);
  self->_delegateRespondsToWillScroll = objc_opt_respondsToSelector() & 1;
  objc_loadWeak((id *)p_delegate);
  self->_delegateRespondsToDidFinishScrolling = objc_opt_respondsToSelector() & 1;
}

- (WKKeyboardScrollViewAnimator)initWithScrollView:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WKKeyboardScrollViewAnimator;
  v4 = [(WKKeyboardScrollViewAnimator *)&v9 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_scrollView, a3);
    v6 = [[WKKeyboardScrollingAnimator alloc] initWithScrollable:v5];
    m_ptr = v5->_animator.m_ptr;
    v5->_animator.m_ptr = v6;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v5;
}

- (WKKeyboardScrollViewAnimator)init
{
  return 0;
}

- (void)dealloc
{
  [self->_animator.m_ptr invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WKKeyboardScrollViewAnimator;
  [(WKKeyboardScrollViewAnimator *)&v3 dealloc];
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_scrollView, 0);
  [self->_animator.m_ptr invalidate];
  m_ptr = self->_animator.m_ptr;
  self->_animator.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)stopScrollingImmediately
{
}

- (void)willStartInteractiveScroll
{
}

- (BOOL)beginWithEvent:(id)a3
{
  return [self->_animator.m_ptr beginWithEvent:a3];
}

- (void)handleKeyEvent:(id)a3
{
}

- (BOOL)scrollTriggeringKeyIsPressed
{
  return [self->_animator.m_ptr scrollTriggeringKeyIsPressed];
}

- (BOOL)isKeyboardScrollable
{
  if (!self->_delegateRespondsToIsKeyboardScrollable) {
    return 1;
  }
  id Weak = objc_loadWeak((id *)&self->_delegate);

  return [Weak isScrollableForKeyboardScrollViewAnimator:self];
}

- (double)distanceForIncrement:(unsigned __int8)a3 inDirection:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  p_scrollView = &self->_scrollView;
  id Weak = objc_loadWeak((id *)&self->_scrollView);
  double result = 0.0;
  if (!Weak) {
    return result;
  }
  if (self->_delegateRespondsToDistanceForIncrement)
  {
    id v10 = objc_loadWeak((id *)&self->_delegate);
    [v10 keyboardScrollViewAnimator:self distanceForIncrement:v5 inDirection:v4];
    return result;
  }
  if (!v5)
  {
    [objc_loadWeak((id *)p_scrollView) zoomScale];
    double v14 = 40.0;
    return v13 * v14;
  }
  int v11 = v4 & 0xFE;
  if (v5 == 1)
  {
    [objc_loadWeak((id *)p_scrollView) frame];
    if (v11 == 2) {
      double v13 = v15;
    }
    else {
      double v13 = v16;
    }
    double v14 = 0.8;
    return v13 * v14;
  }
  if (v5 == 2)
  {
    [objc_loadWeak((id *)p_scrollView) contentSize];
    if (v11 != 2) {
      return v12;
    }
  }
  return result;
}

- (void)scrollToContentOffset:(FloatPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_scrollView = &self->_scrollView;
  if (objc_loadWeak((id *)&self->_scrollView))
  {
    if (self->_delegateRespondsToWillScroll) {
      [objc_loadWeak((id *)&self->_delegate) keyboardScrollViewAnimatorWillScroll:self];
    }
    id Weak = objc_loadWeak((id *)p_scrollView);
    WebCore::FloatPoint::operator CGPoint();
    objc_msgSend(Weak, "_wk_setContentOffsetAndShowScrollIndicators:animated:", v4);
  }
}

- (void)willBeginScrollingToExtentWithAnimationInTrackingView:(id)a3
{
  p_scrollView = &self->_scrollView;
  [objc_loadWeak((id *)&self->_scrollView) addSubview:a3];
  id Weak = objc_loadWeak((id *)p_scrollView);

  [Weak flashScrollIndicators];
}

- (CGPoint)contentOffset
{
  p_scrollView = &self->_scrollView;
  if (objc_loadWeak((id *)&self->_scrollView))
  {
    [objc_loadWeak((id *)p_scrollView) contentOffset];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)boundedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id Weak = objc_loadWeak((id *)&self->_scrollView);

  objc_msgSend(Weak, "_wk_clampToScrollExtents:", x, y);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGSize)interactiveScrollVelocity
{
  id Weak = objc_loadWeak((id *)&self->_scrollView);

  [Weak interactiveScrollVelocityInPointsPerSecond];
  result.height = v4;
  result.width = v3;
  return result;
}

- (RectEdges<BOOL>)scrollableDirectionsFromOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_scrollView = &self->_scrollView;
  id Weak = objc_loadWeak((id *)&self->_scrollView);
  if (Weak)
  {
    [objc_loadWeak((id *)p_scrollView) adjustedContentInset];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [objc_loadWeak((id *)p_scrollView) contentSize];
    double v16 = v15;
    double v18 = v17;
    [objc_loadWeak((id *)p_scrollView) bounds];
    double v21 = v14 + v16 - v20;
    if (v21 <= -v10) {
      double v21 = -v10;
    }
    double v22 = v12 + v18 - v19;
    if (v22 <= -v8) {
      double v22 = -v8;
    }
    LODWORD(Weak) = (y > -v8) | ((x > -v10) << 24) | ((y < v22) << 16) | ((x < v21) << 8);
  }
  return (RectEdges<BOOL>)Weak;
}

- (RectEdges<BOOL>)rubberbandableDirections
{
  p_scrollView = &self->_scrollView;
  id Weak = objc_loadWeak((id *)&self->_scrollView);
  if (Weak)
  {
    int v4 = objc_msgSend(objc_loadWeak((id *)p_scrollView), "_wk_canScrollVerticallyWithoutBouncing");
    LODWORD(Weak) = objc_msgSend(objc_loadWeak((id *)p_scrollView), "_wk_canScrollHorizontallyWithoutBouncing");
  }
  else
  {
    int v4 = 0;
  }
  return (RectEdges<BOOL>)((Weak << 24) | (v4 << 16) | (Weak << 8) | v4);
}

- (void)didFinishScrolling
{
  if (self->_delegateRespondsToDidFinishScrolling)
  {
    id Weak = objc_loadWeak((id *)&self->_delegate);
    [Weak keyboardScrollViewAnimatorDidFinishScrolling:self];
  }
}

- (WKKeyboardScrollViewAnimatorDelegate)delegate
{
  return (WKKeyboardScrollViewAnimatorDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  m_ptr = self->_animator.m_ptr;
  self->_animator.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }

  objc_destroyWeak((id *)&self->_scrollView);
}

@end