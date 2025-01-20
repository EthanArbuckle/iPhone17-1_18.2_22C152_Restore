@interface WKScrollView
- (BEScrollViewDelegate)internalDelegate;
- (BOOL)_contentInsetAdjustmentBehaviorWasExternallyOverridden;
- (BOOL)_contentInsetWasExternallyOverridden;
- (BOOL)_setContentScrollInsetInternal:(UIEdgeInsets)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)isScrollEnabled;
- (CGSize)_currentTopLeftRubberbandAmount;
- (UIEdgeInsets)_systemContentInset;
- (WKScrollView)initWithFrame:(CGRect)a3;
- (id).cxx_construct;
- (id)delegate;
- (void)_adjustForAutomaticKeyboardInfo:(id)a3 animated:(BOOL)a4 lastAdjustment:(double *)a5;
- (void)_resetContentInset;
- (void)_resetContentInsetAdjustmentBehavior;
- (void)_restoreContentOffsetWithRubberbandAmount:(CGSize)a3;
- (void)_setBackgroundColorInternal:(id)a3;
- (void)_setBouncesInternal:(BOOL)a3 vertical:(BOOL)a4;
- (void)_setContentInsetAdjustmentBehaviorInternal:(int64_t)a3;
- (void)_setContentScrollInset:(UIEdgeInsets)a3;
- (void)_setContentSizePreservingContentOffsetDuringRubberband:(CGSize)a3;
- (void)_setDecelerationRateInternal:(double)a3;
- (void)_setIndicatorStyleInternal:(int64_t)a3;
- (void)_setScrollEnabledInternal:(BOOL)a3;
- (void)_setZoomEnabledInternal:(BOOL)a3;
- (void)_updateBouncability;
- (void)_updateContentScrollInset;
- (void)_updateDelegate;
- (void)_updateScrollability;
- (void)_updateZoomability;
- (void)setBackgroundColor:(id)a3;
- (void)setBounces:(BOOL)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentInsetAdjustmentBehavior:(int64_t)a3;
- (void)setDecelerationRate:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setIndicatorStyle:(int64_t)a3;
- (void)setInternalDelegate:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setZoomEnabled:(BOOL)a3;
@end

@implementation WKScrollView

- (id)delegate
{
  return objc_loadWeak(&self->_externalDelegate.m_weakReference);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WKScrollView;
  -[WKScrollView setContentInset:](&v4, sel_setContentInset_, a3.top, a3.left, a3.bottom, a3.right);
  self->_contentInsetWasExternallyOverridden = 1;
  [(BEScrollViewDelegate *)self->_internalDelegate _scheduleVisibleContentRectUpdate];
}

- (void)_updateDelegate
{
  m_ptr = self->_delegateForwarder.m_ptr;
  self->_delegateForwarder.m_ptr = 0;
  id WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
  internalDelegate = self->_internalDelegate;
  if (!WeakRetained)
  {
    v10.receiver = self;
    v10.super_class = (Class)WKScrollView;
    [(BEScrollView *)&v10 setDelegate:internalDelegate];
    if (!m_ptr) {
      return;
    }
    goto LABEL_7;
  }
  if (internalDelegate)
  {
    v6 = [[WKScrollViewDelegateForwarder alloc] initWithInternalDelegate:self->_internalDelegate externalDelegate:WeakRetained];
    v7 = self->_delegateForwarder.m_ptr;
    self->_delegateForwarder.m_ptr = v6;
    if (v7)
    {
      CFRelease(v7);
      v6 = (WKScrollViewDelegateForwarder *)self->_delegateForwarder.m_ptr;
    }
    v8.receiver = self;
    v8.super_class = (Class)WKScrollView;
    [(BEScrollView *)&v8 setDelegate:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WKScrollView;
    [(BEScrollView *)&v9 setDelegate:WeakRetained];
  }
  CFRelease(WeakRetained);
  if (m_ptr) {
LABEL_7:
  }
    CFRelease(m_ptr);
}

- (void)setInternalDelegate:(id)a3
{
  if (self->_internalDelegate != a3)
  {
    self->_internalDelegate = (BEScrollViewDelegate *)a3;
    [(WKScrollView *)self _updateDelegate];
  }
}

- (WKScrollView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKScrollView;
  v3 = -[WKBaseScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    v3->_scrollEnabledByClient = 1;
    v3->_scrollEnabledInternal = 1;
    v3->_zoomEnabledByClient = 1;
    v3->_zoomEnabledInternal = 1;
    v3->_bouncesSetByClient = 1;
    v3->_bouncesHorizontalInternal = 1;
    v3->_bouncesVerticalInternal = 1;
    [(WKScrollView *)v3 setAlwaysBounceVertical:1];
    [(WKScrollView *)v4 setDirectionalLockEnabled:1];
    [(WKScrollView *)v4 setAutomaticallyAdjustsScrollIndicatorInsets:1];
    [(WKScrollView *)v4 setAllowsKeyboardScrolling:1];
    v4->_contentInsetAdjustmentBehaviorWasExternallyOverridden = [(WKScrollView *)v4 contentInsetAdjustmentBehavior] != 0;
  }
  return v4;
}

- (void)_setContentInsetAdjustmentBehaviorInternal:(int64_t)a3
{
  if ([(WKScrollView *)self contentInsetAdjustmentBehavior] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WKScrollView;
    [(WKScrollView *)&v5 setContentInsetAdjustmentBehavior:a3];
  }
}

- (BOOL)_contentInsetAdjustmentBehaviorWasExternallyOverridden
{
  return self->_contentInsetAdjustmentBehaviorWasExternallyOverridden;
}

- (UIEdgeInsets)_systemContentInset
{
  v15.receiver = self;
  v15.super_class = (Class)WKScrollView;
  [(WKScrollView *)&v15 _systemContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (([(BEScrollViewDelegate *)self->_internalDelegate _haveSetObscuredInsets] & 1) == 0
    && WTF::linkedOnOrAfterSDKWithBehavior()
    && [(WKScrollView *)self contentInsetAdjustmentBehavior] == 2)
  {
    double v8 = v8 + self->_keyboardBottomInsetAdjustment;
  }
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  self->_contentInsetAdjustmentBehaviorWasExternallyOverridden = 1;
  if ([(WKScrollView *)self contentInsetAdjustmentBehavior] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WKScrollView;
    [(WKScrollView *)&v5 setContentInsetAdjustmentBehavior:a3];
    [(BEScrollViewDelegate *)self->_internalDelegate _scheduleVisibleContentRectUpdate];
  }
}

- (void)_updateZoomability
{
  BOOL v2 = self->_zoomEnabledByClient && self->_zoomEnabledInternal;
  v3.receiver = self;
  v3.super_class = (Class)WKScrollView;
  [(WKScrollView *)&v3 setZoomEnabled:v2];
}

- (void)_updateScrollability
{
  BOOL v2 = self->_scrollEnabledByClient && self->_scrollEnabledInternal;
  v3.receiver = self;
  v3.super_class = (Class)WKScrollView;
  [(WKScrollView *)&v3 setScrollEnabled:v2];
}

- (void)_updateBouncability
{
  BOOL v3 = self->_bouncesSetByClient && self->_bouncesHorizontalInternal;
  v6.receiver = self;
  v6.super_class = (Class)WKScrollView;
  [(WKScrollView *)&v6 setBouncesHorizontally:v3];
  BOOL v4 = self->_bouncesSetByClient && self->_bouncesVerticalInternal;
  v5.receiver = self;
  v5.super_class = (Class)WKScrollView;
  [(WKScrollView *)&v5 setBouncesVertically:v4];
}

- (void)_setZoomEnabledInternal:(BOOL)a3
{
  self->_zoomEnabledInternal = a3;
  [(WKScrollView *)self _updateZoomability];
}

- (void)_setScrollEnabledInternal:(BOOL)a3
{
  self->_scrollEnabledInternal = a3;
  [(WKScrollView *)self _updateScrollability];
}

- (void)_setContentSizePreservingContentOffsetDuringRubberband:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(WKScrollView *)self contentSize];
  double v7 = v6;
  double v9 = v8;
  if (([(WKScrollView *)self isDragging] & 1) == 0
    && (![(WKScrollView *)self isScrollEnabled]
     || ![(UIScrollView *)self _wk_isScrolledBeyondExtents])
    && ![(WKScrollView *)self refreshControl])
  {
    goto LABEL_22;
  }
  double v10 = (double *)MEMORY[0x1E4F1DB30];
  if (v7 == *MEMORY[0x1E4F1DB30] && v9 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    goto LABEL_22;
  }
  BOOL v12 = v7 == width && v9 == height;
  if (!v12
    && (([(WKScrollView *)self zoomScale],
         double v14 = v13,
         [(WKScrollView *)self minimumZoomScale],
         v14 >= v15)
     || ([(WKScrollView *)self zoomScale],
         float v17 = v16,
         v18 = (WebKit *)[(WKScrollView *)self minimumZoomScale],
         float v20 = v19,
         WebKit::scalesAreEssentiallyEqual(v18, v17, v20))))
  {
    [(WKScrollView *)self _currentTopLeftRubberbandAmount];
    double v22 = v21;
    double v24 = v23;
    -[WKScrollView setContentSize:](self, "setContentSize:", width, height);
    if (v22 != *v10 || v24 != v10[1])
    {
      -[WKScrollView _restoreContentOffsetWithRubberbandAmount:](self, "_restoreContentOffsetWithRubberbandAmount:", v22, v24);
    }
  }
  else
  {
LABEL_22:
    -[WKScrollView setContentSize:](self, "setContentSize:", width, height);
  }
}

- (BOOL)isScrollEnabled
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)-[WKScrollView panGestureRecognizer](self, "panGestureRecognizer"), "allowedTouchTypes"), "count");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WKScrollView;
    LOBYTE(v3) = [(WKScrollView *)&v5 isScrollEnabled];
  }
  return v3;
}

- (void)_setBouncesInternal:(BOOL)a3 vertical:(BOOL)a4
{
  self->_bouncesHorizontalInternal = a3;
  self->_bouncesVerticalInternal = a4;
  [(WKScrollView *)self _updateBouncability];
}

- (void)_setIndicatorStyleInternal:(int64_t)a3
{
  if (!self->_indicatorStyleSetByClient)
  {
    v3.receiver = self;
    v3.super_class = (Class)WKScrollView;
    [(WKScrollView *)&v3 setIndicatorStyle:a3];
  }
}

- (void)_setBackgroundColorInternal:(id)a3
{
  if (!self->_backgroundColorSetByClient)
  {
    v4.receiver = self;
    v4.super_class = (Class)WKScrollView;
    [(WKScrollView *)&v4 setBackgroundColor:a3];
    [(BEScrollViewDelegate *)self->_internalDelegate _resetCachedScrollViewBackgroundColor];
  }
}

- (id).cxx_construct
{
  *((void *)self + 276) = 0;
  *((void *)self + 277) = 0;
  *((unsigned char *)self + 2248) = 0;
  *((unsigned char *)self + 2280) = 0;
  *((unsigned char *)self + 2288) = 0;
  *((unsigned char *)self + 2320) = 0;
  return self;
}

- (void)setDelegate:(id)a3
{
  p_externalDelegate = &self->_externalDelegate;
  id WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
  id v7 = WeakRetained;
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  if (v7 != a3)
  {
    objc_storeWeak(&p_externalDelegate->m_weakReference, a3);
    [(WKScrollView *)self _updateDelegate];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [a4 shouldDeferGestureRecognizer:a3];
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [a3 shouldDeferGestureRecognizer:a4];
}

- (void)setBackgroundColor:(id)a3
{
  self->_backgroundColorSetByClient = a3 != 0;
  v4.receiver = self;
  v4.super_class = (Class)WKScrollView;
  -[WKScrollView setBackgroundColor:](&v4, sel_setBackgroundColor_);
  if (!self->_backgroundColorSetByClient)
  {
    [(BEScrollViewDelegate *)self->_internalDelegate _resetCachedScrollViewBackgroundColor];
    [(BEScrollViewDelegate *)self->_internalDelegate _updateScrollViewBackground];
  }
}

- (void)setIndicatorStyle:(int64_t)a3
{
  self->_indicatorStyleSetByClient = a3 != 0;
  v4.receiver = self;
  v4.super_class = (Class)WKScrollView;
  -[WKScrollView setIndicatorStyle:](&v4, sel_setIndicatorStyle_);
  if (!self->_indicatorStyleSetByClient) {
    [(BEScrollViewDelegate *)self->_internalDelegate _updateScrollViewIndicatorStyle];
  }
}

- (void)setDecelerationRate:(double)a3
{
  self->_decelerationRateSetByClient = 1;
  v3.receiver = self;
  v3.super_class = (Class)WKScrollView;
  [(WKScrollView *)&v3 setDecelerationRate:a3];
}

- (void)_setDecelerationRateInternal:(double)a3
{
  if (!self->_decelerationRateSetByClient)
  {
    v3.receiver = self;
    v3.super_class = (Class)WKScrollView;
    [(WKScrollView *)&v3 setDecelerationRate:a3];
  }
}

- (BOOL)_contentInsetWasExternallyOverridden
{
  return self->_contentInsetWasExternallyOverridden;
}

- (void)_resetContentInset
{
  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  v7.receiver = self;
  v7.super_class = (Class)WKScrollView;
  -[WKScrollView setContentInset:](&v7, sel_setContentInset_, v3, v4, v5, v6);
  [(BEScrollViewDelegate *)self->_internalDelegate _scheduleVisibleContentRectUpdate];
}

- (void)_resetContentInsetAdjustmentBehavior
{
  self->_contentInsetAdjustmentBehaviorWasExternallyOverridden = 0;
  [(WKScrollView *)self _setContentInsetAdjustmentBehaviorInternal:0];
}

- (CGSize)_currentTopLeftRubberbandAmount
{
  [(WKScrollView *)self contentInset];
  double v4 = v3;
  double v6 = v5;
  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  [(WKScrollView *)self contentOffset];
  double v11 = v9 - v6;
  if (v9 - v6 > 0.0) {
    double v11 = 0.0;
  }
  if (v9 >= -v6) {
    double v12 = v7;
  }
  else {
    double v12 = v11;
  }
  double v13 = v4 + v10;
  if (v4 + v10 > 0.0) {
    double v13 = 0.0;
  }
  if (v10 >= -v4) {
    double v14 = v8;
  }
  else {
    double v14 = v13;
  }
  result.double height = v14;
  result.double width = v12;
  return result;
}

- (void)_restoreContentOffsetWithRubberbandAmount:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(WKScrollView *)self contentInset];
  double v7 = v6;
  double v9 = v8;
  [(WKScrollView *)self contentOffset];
  if (width < 0.0) {
    double v10 = width - v9;
  }
  if (height < 0.0) {
    double v11 = height - v7;
  }

  -[WKScrollView setContentOffset:](self, "setContentOffset:", v10, v11);
}

- (void)_adjustForAutomaticKeyboardInfo:(id)a3 animated:(BOOL)a4 lastAdjustment:(double *)a5
{
  BOOL v6 = a4;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42C68], "sharedInstance"), "getVerticalOverlapForView:usingKeyboardInfo:", self, a3);
  self->_keyboardBottomInsetAdjustment = v9;
  v10.receiver = self;
  v10.super_class = (Class)WKScrollView;
  [(WKScrollView *)&v10 _adjustForAutomaticKeyboardInfo:a3 animated:v6 lastAdjustment:a5];
}

- (void)setScrollEnabled:(BOOL)a3
{
  self->_scrollEnabledByClient = a3;
  [(WKScrollView *)self _updateScrollability];
}

- (void)setBounces:(BOOL)a3
{
  self->_bouncesSetByClient = a3;
  [(WKScrollView *)self _updateBouncability];
}

- (void)setZoomEnabled:(BOOL)a3
{
  self->_zoomEnabledByClient = a3;
  [(WKScrollView *)self _updateZoomability];
}

- (void)_setContentScrollInset:(UIEdgeInsets)a3
{
  BOOL engaged = self->_contentScrollInsetFromClient.__engaged_;
  self->_contentScrollInsetFromClient.var0.__val_ = a3;
  if (!engaged) {
    self->_contentScrollInsetFromClient.__engaged_ = 1;
  }
  [(WKScrollView *)self _updateContentScrollInset];
}

- (BOOL)_setContentScrollInsetInternal:(UIEdgeInsets)a3
{
  if (self->_contentScrollInsetFromClient.__engaged_) {
    return 0;
  }
  p_contentScrollInsetInternal = &self->_contentScrollInsetInternal;
  if (self->_contentScrollInsetInternal.__engaged_)
  {
    if (self->_contentScrollInsetInternal.var0.__val_.left == a3.left
      && p_contentScrollInsetInternal->var0.__val_.top == a3.top
      && self->_contentScrollInsetInternal.var0.__val_.right == a3.right
      && self->_contentScrollInsetInternal.var0.__val_.bottom == a3.bottom)
    {
      return 0;
    }
    p_contentScrollInsetInternal->var0.__val_.top = a3.top;
    self->_contentScrollInsetInternal.var0.__val_.left = a3.left;
    self->_contentScrollInsetInternal.var0.__val_.bottom = a3.bottom;
    self->_contentScrollInsetInternal.var0.__val_.right = a3.right;
  }
  else
  {
    p_contentScrollInsetInternal->var0.__val_.top = a3.top;
    self->_contentScrollInsetInternal.var0.__val_.left = a3.left;
    self->_contentScrollInsetInternal.var0.__val_.bottom = a3.bottom;
    self->_contentScrollInsetInternal.var0.__val_.right = a3.right;
    self->_contentScrollInsetInternal.__engaged_ = 1;
  }
  [(WKScrollView *)self _updateContentScrollInset];
  return 1;
}

- (void)_updateContentScrollInset
{
  if (self->_contentScrollInsetFromClient.__engaged_)
  {
    double bottom = self->_contentScrollInsetFromClient.var0.__val_.bottom;
    double right = self->_contentScrollInsetFromClient.var0.__val_.right;
    double top = self->_contentScrollInsetFromClient.var0.__val_.top;
    double left = self->_contentScrollInsetFromClient.var0.__val_.left;
    BOOL v6 = &v8;
    v8.receiver = self;
  }
  else
  {
    if (!self->_contentScrollInsetInternal.__engaged_) {
      return;
    }
    double bottom = self->_contentScrollInsetInternal.var0.__val_.bottom;
    double right = self->_contentScrollInsetInternal.var0.__val_.right;
    double top = self->_contentScrollInsetInternal.var0.__val_.top;
    double left = self->_contentScrollInsetInternal.var0.__val_.left;
    BOOL v6 = (objc_super *)&v7;
    double v7 = self;
  }
  v6->super_class = (Class)WKScrollView;
  -[objc_super _setContentScrollInset:](v6, sel__setContentScrollInset_, top, left, bottom, right, v7);
}

- (BEScrollViewDelegate)internalDelegate
{
  return self->_internalDelegate;
}

- (void).cxx_destruct
{
  m_ptr = self->_delegateForwarder.m_ptr;
  self->_delegateForwarder.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }

  objc_destroyWeak(&self->_externalDelegate.m_weakReference);
}

@end