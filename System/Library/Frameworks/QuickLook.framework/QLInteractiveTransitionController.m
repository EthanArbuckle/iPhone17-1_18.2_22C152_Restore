@interface QLInteractiveTransitionController
- (double)completeProgress;
- (double)transitionDuration:(id)a3;
- (void)_performForcedDismissal;
- (void)completeTransition:(BOOL)a3 withDuration:(double)a4;
- (void)setCompleteProgress:(double)a3;
- (void)startInteractiveTransition:(id)a3;
- (void)updateTransitionWithProgress:(double)a3;
- (void)updateTransitionWithProgress:(double)a3 isFinal:(BOOL)a4;
@end

@implementation QLInteractiveTransitionController

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)startInteractiveTransition:(id)a3
{
  [(QLTransitionController *)self setUpWithTransitionContext:a3 completionHandler:0];
  [(QLInteractiveTransitionController *)self setCompleteProgress:0.0];
  id v5 = [(QLTransitionController *)self animatedController];
  v4 = [v5 transitioningView];
  [v4 frame];
  self->_initialTransitioningViewWidth = CGRectGetWidth(v7);
}

- (void)setCompleteProgress:(double)a3
{
  double v3 = fmax(a3, 0.0);
  if (v3 > 1.0) {
    double v3 = 1.0;
  }
  self->_completeProgress = v3;
  double v4 = -(v3 * (v3 + -2.0));
  id v5 = [(QLTransitionController *)self transitionContext];
  [v5 updateInteractiveTransition:v4];
}

- (void)updateTransitionWithProgress:(double)a3
{
}

- (void)updateTransitionWithProgress:(double)a3 isFinal:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v4 = 0.999;
  if (a4) {
    double v4 = 1.0;
  }
  if (v4 >= a3) {
    double v5 = a3;
  }
  else {
    double v5 = v4;
  }
  v6 = (NSObject **)MEMORY[0x263F62940];
  CGRect v7 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    CGRect v7 = *v6;
  }
  double v8 = fmax(v5, 0.0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = v7;
    v10 = NSStringFromBOOL();
    *(_DWORD *)buf = 134218242;
    double v12 = v8;
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_INFO, "[QLInteractiveTransitionController updateTransitionWithProgress:%f isFinal:%@] #AppearanceTransition", buf, 0x16u);
  }
  QLRunInMainThread();
}

id __74__QLInteractiveTransitionController_updateTransitionWithProgress_isFinal___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCompleteProgress:*(double *)(a1 + 40)];
  double v2 = *(double *)(*(void *)(a1 + 32) + 104);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)QLInteractiveTransitionController;
  return objc_msgSendSuper2(&v4, sel_updateTransitionWithProgress_, v2);
}

- (void)completeTransition:(BOOL)a3 withDuration:(double)a4
{
}

void __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) hasPerformedTransition] & 1) == 0)
  {
    [*(id *)(a1 + 32) setHasPerformedTransition:1];
    double v2 = (NSObject **)MEMORY[0x263F62940];
    double v3 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      double v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_super v4 = v3;
      double v5 = NSStringFromBOOL();
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_INFO, "[QLInteractiveTransitionController completeTransition didComplete:%@] #AppearanceTransition", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setDuration:*(double *)(a1 + 40)];
    double v6 = *(double *)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_1;
    v12[3] = &unk_2642F55E0;
    uint64_t v13 = *(void *)(a1 + 32);
    char v14 = *(unsigned char *)(a1 + 48);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_3;
    v10[3] = &unk_2642F6338;
    v10[4] = v13;
    char v11 = v14;
    [MEMORY[0x263F82E00] animateWithDuration:v12 animations:v10 completion:v6];
    int v7 = *(unsigned __int8 *)(a1 + 48);
    double v8 = [*(id *)(a1 + 32) transitionContext];
    v9 = v8;
    if (v7) {
      [v8 finishInteractiveTransition];
    }
    else {
      [v8 cancelInteractiveTransition];
    }
  }
}

void __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_1(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x263F82E00];
  CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v12.minimum;
  float maximum = v12.maximum;
  float preferred = v12.preferred;
  double v6 = [*(id *)(a1 + 32) transitionContext];
  if (v6) {
    uint64_t v9 = 2097154;
  }
  else {
    uint64_t v9 = 2097155;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_2;
  v10[3] = &unk_2642F55E0;
  v10[4] = *(void *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 40);
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v9, v10, COERCE_DOUBLE((unint64_t)LODWORD(minimum)), v7, v8);
}

uint64_t __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_2(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) updateTransitionWithProgress:1 isFinal:v1];
}

uint64_t __69__QLInteractiveTransitionController_completeTransition_withDuration___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransition:*(unsigned __int8 *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 tearDownTransition:v3];
}

- (void)_performForcedDismissal
{
}

uint64_t __60__QLInteractiveTransitionController__performForcedDismissal__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1 withDuration:0.4];
}

- (double)completeProgress
{
  return self->_completeProgress;
}

@end