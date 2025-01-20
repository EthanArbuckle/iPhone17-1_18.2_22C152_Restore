@interface WKFullscreenAnimationController
- (BOOL)isAnimatingIn;
- (CGRect)finalFrame;
- (CGRect)initialFrame;
- (UIViewController)viewController;
- (UIViewControllerContextTransitioning)context;
- (double)transitionDuration:(id)a3;
- (id).cxx_construct;
- (void)_createViewsForTransitionContext:(id)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)configureInitialAndFinalStatesForTransition:(id)a3;
- (void)dealloc;
- (void)end:(BOOL)a3;
- (void)setAnimatingIn:(BOOL)a3;
- (void)setFinalFrame:(CGRect)a3;
- (void)setInitialFrame:(CGRect)a3;
- (void)setViewController:(id)a3;
- (void)startInteractiveTransition:(id)a3;
- (void)updateWithProgress:(double)a3;
- (void)updateWithProgress:(double)a3 scale:(double)a4 translation:(CGSize)a5 anchor:(CGPoint)a6;
- (void)updateWithProgress:(double)a3 translation:(CGSize)a4 anchor:(CGPoint)a5;
@end

@implementation WKFullscreenAnimationController

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WKFullscreenAnimationController;
  [(WKFullscreenAnimationController *)&v3 dealloc];
}

- (UIViewControllerContextTransitioning)context
{
  return (UIViewControllerContextTransitioning *)self->_context.m_ptr;
}

- (void)_createViewsForTransitionContext:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  m_ptr = self->_maskView.m_ptr;
  self->_maskView.m_ptr = v5;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    id v5 = self->_maskView.m_ptr;
  }
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "blackColor"));
  objc_msgSend(self->_maskView.m_ptr, "setBounds:", self->_initialMaskViewBounds.origin.x, self->_initialMaskViewBounds.origin.y, self->_initialMaskViewBounds.size.width, self->_initialMaskViewBounds.size.height);
  objc_msgSend(self->_maskView.m_ptr, "setCenter:", self->_initialMaskViewCenter.x, self->_initialMaskViewCenter.y);
  [self->_animatingView.m_ptr setMaskView:self->_maskView.m_ptr];
  v7 = self->_animatingView.m_ptr;
  long long v8 = *(_OWORD *)&self->_initialAnimatingViewTransform.c;
  v9[0] = *(_OWORD *)&self->_initialAnimatingViewTransform.a;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&self->_initialAnimatingViewTransform.tx;
  [v7 setTransform:v9];
  objc_msgSend((id)objc_msgSend(a3, "containerView"), "addSubview:", self->_animatingView.m_ptr);
}

- (double)transitionDuration:(id)a3
{
  return 0.2;
}

- (void)configureInitialAndFinalStatesForTransition:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_context.m_ptr;
  self->_context.m_ptr = a3;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v6 = [a3 viewForKey:*MEMORY[0x1E4F43EB8]];
  uint64_t v7 = [a3 viewForKey:*MEMORY[0x1E4F43EC8]];
  BOOL v8 = !self->_animatingIn;
  if (self->_animatingIn) {
    p_initialFrame = &self->_initialFrame;
  }
  else {
    p_initialFrame = &self->_finalFrame;
  }
  CGSize size = p_initialFrame->size;
  v56.origin = p_initialFrame->origin;
  v56.CGSize size = size;
  if (v8) {
    p_finalFrame = &self->_initialFrame;
  }
  else {
    p_finalFrame = &self->_finalFrame;
  }
  CGSize v12 = p_finalFrame->size;
  v55.origin = p_finalFrame->origin;
  v55.CGSize size = v12;
  if (v8) {
    v13 = (void *)v6;
  }
  else {
    v13 = (void *)v7;
  }
  if (v13) {
    CFRetain(v13);
  }
  v14 = self->_animatingView.m_ptr;
  self->_animatingView.m_ptr = v13;
  if (v14) {
    CFRelease(v14);
  }
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v53, &v56);
  float v15 = *(float *)&v53.b / *((float *)&v53.b + 1);
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v52, &v55);
  WebCore::largestRectWithAspectRatioInsideRect((WebCore *)&v52, v15, v16);
  *(void *)&v54.a = __PAIR64__(v18, v17);
  *(void *)&v54.b = __PAIR64__(v20, v19);
  WebCore::FloatRect::operator CGRect();
  CGFloat v23 = v21;
  CGFloat v24 = v22;
  CGFloat v25 = *MEMORY[0x1E4F1DAD8];
  double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v27 = *MEMORY[0x1E4F1DAD8];
  CGFloat v28 = v26;
  if (!self->_animatingIn) {
    objc_msgSend(self->_animatingView.m_ptr, "bounds", v27, v26);
  }
  self->_initialMaskViewBounds.origin.x = v27;
  self->_initialMaskViewBounds.origin.y = v28;
  self->_initialMaskViewBounds.size.width = v21;
  self->_initialMaskViewBounds.size.height = v22;
  [self->_animatingView.m_ptr bounds];
  CGFloat MidX = CGRectGetMidX(v57);
  [self->_animatingView.m_ptr bounds];
  CGFloat MidY = CGRectGetMidY(v58);
  self->_initialMaskViewCenter.x = MidX;
  self->_initialMaskViewCenter.y = MidY;
  if (self->_animatingIn)
  {
    [self->_animatingView.m_ptr bounds];
    CGFloat v25 = v31;
    double v26 = v32;
    CGFloat v23 = v33;
    CGFloat v24 = v34;
  }
  self->_finalMaskViewBounds.origin.x = v25;
  self->_finalMaskViewBounds.origin.y = v26;
  self->_finalMaskViewBounds.size.width = v23;
  self->_finalMaskViewBounds.size.height = v24;
  [self->_animatingView.m_ptr bounds];
  CGFloat v35 = CGRectGetMidX(v59);
  [self->_animatingView.m_ptr bounds];
  CGFloat v36 = CGRectGetMidY(v60);
  self->_finalMaskViewCenter.x = v35;
  self->_finalMaskViewCenter.y = v36;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v54, &v55);
  *(float *)&CGFloat v35 = *(float *)&v54.b / *((float *)&v54.b + 1);
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v53, &v56);
  WebCore::smallestRectWithAspectRatioAroundRect((WebCore *)&v53, *(float *)&v35, v37);
  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeScale(&v54, v38 / v55.size.width, v39 / v55.size.height);
  memset(&v53, 0, sizeof(v53));
  double v40 = CGRectGetMidX(v56);
  CGFloat v41 = v40 - CGRectGetMidX(v55);
  double v42 = CGRectGetMidY(v56);
  CGFloat v43 = CGRectGetMidY(v55);
  CGAffineTransformMakeTranslation(&v53, v41, v42 - v43);
  CGAffineTransform t1 = v54;
  memset(&v52, 0, sizeof(v52));
  CGAffineTransform v50 = v53;
  CGAffineTransformConcat(&v52, &t1, &v50);
  BOOL animatingIn = self->_animatingIn;
  v45 = (CGAffineTransform *)MEMORY[0x1E4F1DAB8];
  if (self->_animatingIn) {
    v46 = &v52;
  }
  else {
    v46 = (CGAffineTransform *)MEMORY[0x1E4F1DAB8];
  }
  long long v47 = *(_OWORD *)&v46->c;
  *(_OWORD *)&self->_initialAnimatingViewTransform.a = *(_OWORD *)&v46->a;
  *(_OWORD *)&self->_initialAnimatingViewTransform.c = v47;
  *(_OWORD *)&self->_initialAnimatingViewTransform.tx = *(_OWORD *)&v46->tx;
  if (!animatingIn) {
    v45 = &v52;
  }
  long long v48 = *(_OWORD *)&v45->c;
  *(_OWORD *)&self->_finalAnimatingViewTransform.a = *(_OWORD *)&v45->a;
  *(_OWORD *)&self->_finalAnimatingViewTransform.c = v48;
  *(_OWORD *)&self->_finalAnimatingViewTransform.tx = *(_OWORD *)&v45->tx;
  double v49 = 0.0;
  if (!animatingIn) {
    double v49 = 1.0;
  }
  self->_initialBackgroundAlpha = v49;
  self->_finalBackgroundAlpha = (double)animatingIn;
}

- (void)animateTransition:(id)a3
{
  -[WKFullscreenAnimationController configureInitialAndFinalStatesForTransition:](self, "configureInitialAndFinalStatesForTransition:");
  [(WKFullscreenAnimationController *)self _createViewsForTransitionContext:a3];
  id v5 = objc_msgSend((id)objc_msgSend(a3, "containerView"), "window");
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 0.0, self->_initialBackgroundAlpha));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__WKFullscreenAnimationController_animateTransition___block_invoke;
  v7[3] = &unk_1E5812158;
  v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__WKFullscreenAnimationController_animateTransition___block_invoke_2;
  v6[3] = &unk_1E58138B0;
  v6[4] = self;
  v6[5] = a3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v7 options:v6 animations:0.2 completion:0.0];
}

uint64_t __53__WKFullscreenAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithProgress:1.0];
}

uint64_t __53__WKFullscreenAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "animationEnded:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;

  return [v2 completeTransition:v3];
}

- (void)animationEnded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WKFullscreenAnimationController *)self isAnimatingIn] && !v3
    || ![(WKFullscreenAnimationController *)self isAnimatingIn] && v3)
  {
    [self->_animatingView.m_ptr removeFromSuperview];
  }
  [self->_animatingView.m_ptr setMaskView:0];
  m_ptr = self->_maskView.m_ptr;
  self->_maskView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v6 = self->_animatingView.m_ptr;
  self->_animatingView.m_ptr = 0;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (void)startInteractiveTransition:(id)a3
{
  -[WKFullscreenAnimationController configureInitialAndFinalStatesForTransition:](self, "configureInitialAndFinalStatesForTransition:");

  [(WKFullscreenAnimationController *)self _createViewsForTransitionContext:a3];
}

- (void)updateWithProgress:(double)a3
{
  float64x2_t v4 = vmlaq_n_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.a, vsubq_f64(*(float64x2_t *)&self->_finalAnimatingViewTransform.a, *(float64x2_t *)&self->_initialAnimatingViewTransform.a), a3);
  float64x2_t v5 = vmlaq_n_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.c, vsubq_f64(*(float64x2_t *)&self->_finalAnimatingViewTransform.c, *(float64x2_t *)&self->_initialAnimatingViewTransform.c), a3);
  m_ptr = self->_animatingView.m_ptr;
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = vmlaq_n_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.tx, vsubq_f64(*(float64x2_t *)&self->_finalAnimatingViewTransform.tx, *(float64x2_t *)&self->_initialAnimatingViewTransform.tx), a3);
  [m_ptr setTransform:v9];
  objc_msgSend(self->_maskView.m_ptr, "setBounds:", self->_initialMaskViewBounds.origin.x+ a3 * (self->_finalMaskViewBounds.origin.x - self->_initialMaskViewBounds.origin.x), self->_initialMaskViewBounds.origin.y+ a3 * (self->_finalMaskViewBounds.origin.y - self->_initialMaskViewBounds.origin.y), self->_initialMaskViewBounds.size.width+ a3 * (self->_finalMaskViewBounds.size.width - self->_initialMaskViewBounds.size.width), self->_initialMaskViewBounds.size.height+ a3 * (self->_finalMaskViewBounds.size.height - self->_initialMaskViewBounds.size.height));
  objc_msgSend(self->_maskView.m_ptr, "setCenter:", self->_initialMaskViewCenter.x + a3 * (self->_finalMaskViewCenter.x - self->_finalMaskViewCenter.x), self->_initialMaskViewCenter.y + a3 * (self->_finalMaskViewCenter.y - self->_finalMaskViewCenter.y));
  uint64_t v7 = (void *)[self->_animatingView.m_ptr window];
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 0.0, self->_initialBackgroundAlpha + a3 * (self->_finalBackgroundAlpha - self->_initialBackgroundAlpha)));
}

- (void)updateWithProgress:(double)a3 scale:(double)a4 translation:(CGSize)a5 anchor:(CGPoint)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  long long v10 = *(_OWORD *)&self->_initialAnimatingViewTransform.c;
  *(_OWORD *)&v17.a = *(_OWORD *)&self->_initialAnimatingViewTransform.a;
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tx = *(_OWORD *)&self->_initialAnimatingViewTransform.tx;
  *(_OWORD *)&v16.a = *(_OWORD *)&v17.a;
  *(_OWORD *)&v16.c = v10;
  *(_OWORD *)&v16.tx = *(_OWORD *)&v17.tx;
  CGAffineTransformScale(&v17, &v16, a4, a4);
  CGAffineTransform v14 = v17;
  CGAffineTransformTranslate(&v15, &v14, width, height);
  CGAffineTransform v17 = v15;
  m_ptr = self->_animatingView.m_ptr;
  CGAffineTransform v13 = v15;
  [m_ptr setTransform:&v13];
  CGSize v12 = (void *)[self->_animatingView.m_ptr window];
  objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 0.0, self->_initialBackgroundAlpha + a3 * (self->_finalBackgroundAlpha - self->_initialBackgroundAlpha)));
}

- (void)updateWithProgress:(double)a3 translation:(CGSize)a4 anchor:(CGPoint)a5
{
  float64x2_t v6 = vmlaq_n_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.a, vsubq_f64(*(float64x2_t *)&self->_finalAnimatingViewTransform.a, *(float64x2_t *)&self->_initialAnimatingViewTransform.a), a3);
  float64x2_t v7 = vmlaq_n_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.c, vsubq_f64(*(float64x2_t *)&self->_finalAnimatingViewTransform.c, *(float64x2_t *)&self->_initialAnimatingViewTransform.c), a3);
  m_ptr = self->_animatingView.m_ptr;
  v13[0] = v6;
  CGFloat height = a4.height;
  float64x2_t v10 = vaddq_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.tx, vaddq_f64((float64x2_t)a4, *(float64x2_t *)&self->_initialAnimatingViewTransform.tx));
  v13[1] = v7;
  v13[2] = v10;
  [m_ptr setTransform:v13];
  v11 = (void *)[self->_animatingView.m_ptr window];
  objc_msgSend(v11, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 0.0, self->_initialBackgroundAlpha + a3 * (self->_finalBackgroundAlpha - self->_initialBackgroundAlpha)));
}

- (void)end:(BOOL)a3
{
  if (a3)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    CGFloat v22 = __39__WKFullscreenAnimationController_end___block_invoke;
    CGFloat v23 = &unk_1E5812158;
    CGFloat v24 = self;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    CGAffineTransform v17 = __39__WKFullscreenAnimationController_end___block_invoke_2;
    unsigned int v18 = &unk_1E5813860;
    unsigned int v19 = self;
    BOOL v3 = &v20;
    float64x2_t v4 = &v15;
  }
  else
  {
    v9 = self;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    CGSize v12 = __39__WKFullscreenAnimationController_end___block_invoke_3;
    CGAffineTransform v13 = &unk_1E5812158;
    CGAffineTransform v14 = self;
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    float64x2_t v7 = __39__WKFullscreenAnimationController_end___block_invoke_4;
    BOOL v8 = &unk_1E5813860;
    BOOL v3 = &v10;
    float64x2_t v4 = &v5;
  }
  objc_msgSend(MEMORY[0x1E4F42FF0], "animateWithDuration:animations:completion:", v3, v4, 0.2, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18,
    v19,
    v20,
    v21,
    v22,
    v23,
    v24);
}

uint64_t __39__WKFullscreenAnimationController_end___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithProgress:0.0];
}

uint64_t __39__WKFullscreenAnimationController_end___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 216) cancelInteractiveTransition];
  v2 = *(void **)(*(void *)(a1 + 32) + 216);

  return [v2 completeTransition:0];
}

uint64_t __39__WKFullscreenAnimationController_end___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithProgress:1.0];
}

uint64_t __39__WKFullscreenAnimationController_end___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 216) finishInteractiveTransition];
  v2 = *(void **)(*(void *)(a1 + 32) + 216);

  return [v2 completeTransition:1];
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (CGRect)initialFrame
{
  double x = self->_initialFrame.origin.x;
  double y = self->_initialFrame.origin.y;
  double width = self->_initialFrame.size.width;
  double height = self->_initialFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (CGRect)finalFrame
{
  double x = self->_finalFrame.origin.x;
  double y = self->_finalFrame.origin.y;
  double width = self->_finalFrame.size.width;
  double height = self->_finalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFinalFrame:(CGRect)a3
{
  self->_finalFrame = a3;
}

- (BOOL)isAnimatingIn
{
  return self->_animatingIn;
}

- (void)setAnimatingIn:(BOOL)a3
{
  self->_BOOL animatingIn = a3;
}

- (void).cxx_destruct
{
  m_ptr = self->_context.m_ptr;
  self->_context.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  float64x2_t v4 = self->_animatingView.m_ptr;
  self->_animatingView.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = self->_maskView.m_ptr;
  self->_maskView.m_ptr = 0;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 27) = 0;
  return self;
}

@end