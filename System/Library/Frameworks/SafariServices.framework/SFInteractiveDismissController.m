@interface SFInteractiveDismissController
- (BOOL)popGesture:(id)a3 withRemainingDuration:(double)a4 shouldPopWithVelocity:(double *)a5;
- (CGPoint)translationForStatistics;
- (CGPoint)velocityForStatistics;
- (SFInteractiveDismissController)init;
- (SFInteractiveDismissControllerDelegate)delegate;
- (UIScreenEdgePanGestureRecognizer)edgeSwipeGestureRecognizer;
- (UIView)edgeSwipeView;
- (UIViewController)viewControllerToBeDismissed;
- (double)_percentComplete:(id)a3;
- (double)_translationCoefficient;
- (double)averageAcceleration;
- (double)averageVelocity;
- (double)previousAcceleration;
- (double)previousDisplacement;
- (double)previousTimeStamp;
- (double)previousVelocity;
- (double)skipTimeStamp;
- (double)totalDistance;
- (double)transitionDuration:(id)a3;
- (id)interactionControllerForDismissal:(id)a3;
- (unint64_t)sampleCount;
- (void)_animateDismissalCancelTransition;
- (void)_animateDismissalCompleteTransition;
- (void)_dismissAnimateTransition:(id)a3;
- (void)_presentAnimateTransition:(id)a3;
- (void)_updateStatistics:(id)a3 firstSample:(BOOL)a4 finalSample:(BOOL)a5;
- (void)animateTransition:(id)a3;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
- (void)setAverageAcceleration:(double)a3;
- (void)setAverageVelocity:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeSwipeView:(id)a3;
- (void)setPreviousAcceleration:(double)a3;
- (void)setPreviousDisplacement:(double)a3;
- (void)setPreviousTimeStamp:(double)a3;
- (void)setPreviousVelocity:(double)a3;
- (void)setSampleCount:(unint64_t)a3;
- (void)setSkipTimeStamp:(double)a3;
- (void)setTotalDistance:(double)a3;
- (void)setViewControllerToBeDismissed:(id)a3;
- (void)startInteractiveTransition:(id)a3;
- (void)swiped:(id)a3;
@end

@implementation SFInteractiveDismissController

- (SFInteractiveDismissController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFInteractiveDismissController;
  v2 = [(UIPercentDrivenInteractiveTransition *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB1BB0]) initWithTarget:v2 action:sel_swiped_];
    edgeSwipeGestureRecognizer = v2->_edgeSwipeGestureRecognizer;
    v2->_edgeSwipeGestureRecognizer = (UIScreenEdgePanGestureRecognizer *)v3;

    [(UIScreenEdgePanGestureRecognizer *)v2->_edgeSwipeGestureRecognizer setEdges:2];
    [(UIScreenEdgePanGestureRecognizer *)v2->_edgeSwipeGestureRecognizer _setHysteresis:6.0];
    [(UIScreenEdgePanGestureRecognizer *)v2->_edgeSwipeGestureRecognizer setMaximumNumberOfTouches:1];
    [(UIScreenEdgePanGestureRecognizer *)v2->_edgeSwipeGestureRecognizer _setRequiresSystemGesturesToFail:1];
    v5 = v2;
  }

  return v2;
}

- (void)startInteractiveTransition:(id)a3
{
  p_transitionContext = &self->_transitionContext;
  id v5 = a3;
  objc_storeWeak((id *)p_transitionContext, v5);
  v6.receiver = self;
  v6.super_class = (Class)SFInteractiveDismissController;
  [(UIPercentDrivenInteractiveTransition *)&v6 startInteractiveTransition:v5];
}

- (void)cancelInteractiveTransition
{
  v3.receiver = self;
  v3.super_class = (Class)SFInteractiveDismissController;
  [(UIPercentDrivenInteractiveTransition *)&v3 cancelInteractiveTransition];
  [(SFInteractiveDismissController *)self _animateDismissalCancelTransition];
  self->_dismissMode = 0;
}

- (void)finishInteractiveTransition
{
  v3.receiver = self;
  v3.super_class = (Class)SFInteractiveDismissController;
  [(UIPercentDrivenInteractiveTransition *)&v3 finishInteractiveTransition];
  [(SFInteractiveDismissController *)self _animateDismissalCompleteTransition];
  self->_dismissMode = 0;
}

- (void)swiped:(id)a3
{
  id v4 = a3;
  switch([v4 state])
  {
    case 1:
      self->_interactionState = 1;
      self->_dismissMode = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerToBeDismissed);
      [WeakRetained dismissViewControllerAnimated:1 completion:0];
      objc_super v6 = [WeakRetained view];
      [v6 bounds];
      self->_totalDistance = CGRectGetWidth(v13);

      [(SFInteractiveDismissController *)self _updateStatistics:v4 firstSample:1 finalSample:0];
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [v7 interactiveDismissControllerDidBegin:self];
      }

      break;
    case 2:
      self->_interactionState = 2;
      [(SFInteractiveDismissController *)self _percentComplete:v4];
      -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](self, "updateInteractiveTransition:");
      [(SFInteractiveDismissController *)self _updateStatistics:v4 firstSample:0 finalSample:0];
      break;
    case 3:
      [(SFInteractiveDismissController *)self _updateStatistics:v4 firstSample:0 finalSample:1];
      [(UIPercentDrivenInteractiveTransition *)self duration];
      double v9 = v8;
      [(UIPercentDrivenInteractiveTransition *)self percentComplete];
      uint64_t v12 = 0;
      BOOL v11 = [(SFInteractiveDismissController *)self popGesture:v4 withRemainingDuration:&v12 shouldPopWithVelocity:v9 * (1.0 - v10)];
      self->_interactionState = 3;
      if (!v11) {
        goto LABEL_8;
      }
      [(SFInteractiveDismissController *)self finishInteractiveTransition];
      break;
    case 4:
    case 5:
      self->_interactionState = 0;
LABEL_8:
      [(SFInteractiveDismissController *)self cancelInteractiveTransition];
      break;
    default:
      break;
  }
}

- (double)_percentComplete:(id)a3
{
  edgeSwipeGestureRecognizer = self->_edgeSwipeGestureRecognizer;
  id v5 = a3;
  objc_super v6 = [v5 view];
  [(UIScreenEdgePanGestureRecognizer *)edgeSwipeGestureRecognizer translationInView:v6];
  double v8 = v7;

  [(SFInteractiveDismissController *)self _translationCoefficient];
  double v10 = v8 * v9;
  BOOL v11 = [v5 view];

  uint64_t v12 = [v11 window];
  [v12 bounds];
  double v13 = v10 / CGRectGetWidth(v16);
  if (v13 < 0.0001) {
    double v13 = 0.0001;
  }
  double v14 = fmin(v13, 0.9999);

  return v14;
}

- (void)_animateDismissalCancelTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  id v4 = [WeakRetained viewForKey:*MEMORY[0x1E4FB30C0]];
  id v5 = [WeakRetained viewForKey:*MEMORY[0x1E4FB30D0]];
  objc_super v6 = [WeakRetained containerView];
  [v4 frame];
  uint64_t v8 = v7;
  uint64_t v44 = v10;
  uint64_t v45 = v9;
  [(UIPercentDrivenInteractiveTransition *)self percentComplete];
  double v12 = v11;
  [v4 bounds];
  double v13 = v12 * CGRectGetWidth(v70);
  [(SFInteractiveDismissController *)self _translationCoefficient];
  double v15 = v13 * v14;
  [(UIPercentDrivenInteractiveTransition *)self percentComplete];
  double v17 = 1.0 - v16;
  [v4 bounds];
  CGFloat v18 = CGRectGetWidth(v71) * v17 * -0.25;
  [(SFInteractiveDismissController *)self _translationCoefficient];
  double v20 = v19 * v18;
  [v5 frame];
  uint64_t v22 = v21;
  uint64_t v41 = v23;
  uint64_t v42 = v21;
  uint64_t v24 = v23;
  uint64_t v43 = v25;
  v26 = [v4 layer];
  [v26 removeAnimationForKey:@"position"];

  v27 = [v5 layer];
  [v27 removeAnimationForKey:@"position"];

  v28 = [v6 layer];
  [v28 setBeginTime:0.0];
  [v28 setTimeOffset:0.0];
  LODWORD(v29) = 1.0;
  [v28 setSpeed:v29];
  v30 = (void *)MEMORY[0x1E4FB1EB0];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke;
  v59[3] = &unk_1E5C77DF8;
  id v31 = v4;
  id v60 = v31;
  double v62 = v15;
  uint64_t v63 = v8;
  uint64_t v64 = v45;
  uint64_t v65 = v44;
  id v32 = v5;
  id v61 = v32;
  double v66 = v20;
  uint64_t v67 = v22;
  uint64_t v68 = v24;
  uint64_t v69 = v43;
  [v30 performWithoutAnimation:v59];
  [v32 bounds];
  CGFloat v33 = CGRectGetWidth(v72) * -0.25;
  [(SFInteractiveDismissController *)self _translationCoefficient];
  double v35 = v33 * v34;
  [(UIScreenEdgePanGestureRecognizer *)self->_edgeSwipeGestureRecognizer velocityInView:v31];
  v36 = (void *)MEMORY[0x1E4FB1EB0];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke_2;
  v48[3] = &unk_1E5C77DF8;
  id v49 = v31;
  uint64_t v51 = 0;
  double v38 = fabs(v37 / v15);
  uint64_t v52 = v8;
  uint64_t v53 = v45;
  uint64_t v54 = v44;
  id v50 = v32;
  double v55 = v35;
  uint64_t v56 = v42;
  uint64_t v57 = v41;
  uint64_t v58 = v43;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke_3;
  v46[3] = &unk_1E5C73530;
  v46[4] = self;
  id v47 = v50;
  id v39 = v50;
  id v40 = v31;
  [v36 _animateUsingSpringWithDuration:4 delay:v48 options:v46 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:v38];
}

uint64_t __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = *(double *)(a1 + 80);
  double v3 = *(double *)(a1 + 88);
  double v4 = *(double *)(a1 + 96);
  double v5 = *(double *)(a1 + 104);
  objc_super v6 = *(void **)(a1 + 40);

  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

uint64_t __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = *(double *)(a1 + 80);
  double v3 = *(double *)(a1 + 88);
  double v4 = *(double *)(a1 + 96);
  double v5 = *(double *)(a1 + 104);
  objc_super v6 = *(void **)(a1 + 40);

  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

void __67__SFInteractiveDismissController__animateDismissalCancelTransition__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 184) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 184);
  *(void *)(v2 + 184) = 0;

  [*(id *)(a1 + 40) removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained interactiveDismissControllerDidCancel:*(void *)(a1 + 32)];
  }
}

- (void)_animateDismissalCompleteTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  double v4 = [WeakRetained viewForKey:*MEMORY[0x1E4FB30C0]];
  double v5 = [WeakRetained viewForKey:*MEMORY[0x1E4FB30D0]];
  [v4 frame];
  uint64_t v7 = v6;
  uint64_t v52 = v8;
  uint64_t v53 = v6;
  uint64_t v9 = v8;
  uint64_t v54 = v10;
  double v11 = [WeakRetained containerView];
  [(UIPercentDrivenInteractiveTransition *)self percentComplete];
  double v13 = v12;
  [v4 bounds];
  double v14 = v13 * CGRectGetWidth(v80);
  [(SFInteractiveDismissController *)self _translationCoefficient];
  double v16 = v14 * v15;
  [(UIPercentDrivenInteractiveTransition *)self percentComplete];
  double v18 = 1.0 - v17;
  [v4 bounds];
  CGFloat v19 = CGRectGetWidth(v81) * v18 * -0.25;
  [(SFInteractiveDismissController *)self _translationCoefficient];
  double v21 = v20 * v19;
  [v5 frame];
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v51 = v26;
  v28 = [v4 layer];
  [v28 removeAnimationForKey:@"position"];

  double v29 = [v5 layer];
  [v29 removeAnimationForKey:@"position"];

  v30 = [v11 layer];
  [v30 setBeginTime:0.0];
  [v30 setTimeOffset:0.0];
  LODWORD(v31) = 1.0;
  [v30 setSpeed:v31];
  id v32 = (void *)MEMORY[0x1E4FB1EB0];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke;
  v69[3] = &unk_1E5C77DF8;
  id v33 = v4;
  id v70 = v33;
  double v72 = v16;
  uint64_t v73 = v7;
  uint64_t v74 = v9;
  uint64_t v75 = v54;
  id v34 = v5;
  id v71 = v34;
  double v76 = v21;
  uint64_t v77 = v23;
  uint64_t v35 = v23;
  uint64_t v78 = v25;
  uint64_t v79 = v27;
  uint64_t v36 = v25;
  [v32 performWithoutAnimation:v69];
  [v33 frame];
  double v38 = v37;
  [(SFInteractiveDismissController *)self _translationCoefficient];
  double v40 = v39;
  [(UIScreenEdgePanGestureRecognizer *)self->_edgeSwipeGestureRecognizer velocityInView:v33];
  double v42 = fabs(v41);
  if (v42 <= 3000.0) {
    double v43 = v42;
  }
  else {
    double v43 = 3000.0;
  }
  double v44 = v40 * v38;
  [v33 bounds];
  double v45 = v43 / (CGRectGetWidth(v82) - fabs(v16));
  id v46 = objc_loadWeakRetained((id *)&self->_delegate);
  id v47 = (void *)MEMORY[0x1E4FB1EB0];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke_2;
  v58[3] = &unk_1E5C77DF8;
  double v61 = v44;
  uint64_t v62 = v53;
  uint64_t v63 = v52;
  uint64_t v64 = v54;
  id v59 = v33;
  id v60 = v34;
  uint64_t v65 = 0;
  uint64_t v66 = v35;
  uint64_t v67 = v36;
  uint64_t v68 = v51;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke_3;
  v55[3] = &unk_1E5C74660;
  v55[4] = self;
  id v56 = v59;
  id v57 = v46;
  id v48 = v46;
  id v49 = v59;
  id v50 = v34;
  [v47 _animateUsingSpringWithDuration:4 delay:v58 options:v55 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:v45];
}

uint64_t __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = *(double *)(a1 + 80);
  double v3 = *(double *)(a1 + 88);
  double v4 = *(double *)(a1 + 96);
  double v5 = *(double *)(a1 + 104);
  uint64_t v6 = *(void **)(a1 + 40);

  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

uint64_t __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = *(double *)(a1 + 80);
  double v3 = *(double *)(a1 + 88);
  double v4 = *(double *)(a1 + 96);
  double v5 = *(double *)(a1 + 104);
  uint64_t v6 = *(void **)(a1 + 40);

  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

uint64_t __69__SFInteractiveDismissController__animateDismissalCompleteTransition__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 184) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 184);
  *(void *)(v2 + 184) = 0;

  [*(id *)(a1 + 40) removeFromSuperview];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    double v5 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    return [v5 interactiveDismissControllerDidEnd:v6];
  }
  return result;
}

- (double)_translationCoefficient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerToBeDismissed);
  double v3 = [WeakRetained view];
  if (objc_msgSend(v3, "_sf_usesLeftToRightLayout")) {
    double v4 = 1.0;
  }
  else {
    double v4 = -1.0;
  }

  return v4;
}

- (CGPoint)translationForStatistics
{
  edgeSwipeGestureRecognizer = self->_edgeSwipeGestureRecognizer;
  double v3 = [(UIScreenEdgePanGestureRecognizer *)edgeSwipeGestureRecognizer view];
  [(UIScreenEdgePanGestureRecognizer *)edgeSwipeGestureRecognizer translationInView:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)velocityForStatistics
{
  edgeSwipeGestureRecognizer = self->_edgeSwipeGestureRecognizer;
  double v3 = [(UIScreenEdgePanGestureRecognizer *)edgeSwipeGestureRecognizer view];
  [(UIScreenEdgePanGestureRecognizer *)edgeSwipeGestureRecognizer velocityInView:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_updateStatistics:(id)a3 firstSample:(BOOL)a4 finalSample:(BOOL)a5
{
  BOOL v5 = a4;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  [(SFInteractiveDismissController *)self _translationCoefficient];
  double v9 = v8;
  [(SFInteractiveDismissController *)self translationForStatistics];
  double v11 = v9 * v10;
  [(SFInteractiveDismissController *)self velocityForStatistics];
  double v13 = v9 * v12;
  double totalDistance = self->_totalDistance;
  double v15 = v11 / totalDistance;
  if (v11 < 0.0) {
    double v15 = 0.0;
  }
  double v16 = v13 / totalDistance;
  if (v5)
  {
    self->_double previousTimeStamp = Current;
    self->_skipTimeStamp = Current;
    self->_previousDisplacement = v15;
    self->_previousVelocity = v16;
    self->_double previousAcceleration = 0.0;
    self->_averageVelocity = v16;
    self->_averageAcceleration = 0.0;
    self->_timestamps[0] = 0.0;
    self->_velocities[0] = v16;
    self->_accelerations[0] = 0.0;
    self->_unint64_t sampleCount = 1;
  }
  else
  {
    double previousTimeStamp = self->_previousTimeStamp;
    double v18 = Current - self->_skipTimeStamp;
    self->_skipTimeStamp = Current;
    if (v18 >= 0.01 || v18 > 0.001 && self->_previousDisplacement != v15)
    {
      double v19 = Current - previousTimeStamp;
      unint64_t sampleCount = self->_sampleCount;
      unint64_t v21 = sampleCount % 3;
      if (sampleCount > 2) {
        self->_averageVelocity = (v16 - (self->_velocities[v21] - self->_averageVelocity * 3.0)) / 3.0;
      }
      else {
        self->_averageVelocity = (v16 + (double)sampleCount * self->_averageVelocity) / (double)(sampleCount + 1);
      }
      self->_velocities[v21] = v16;
      self->_timestamps[v21] = v19;
      double v22 = (v16 - self->_previousVelocity) / v19;
      double previousAcceleration = self->_previousAcceleration;
      double v24 = vabdd_f64(v22, previousAcceleration);
      double v25 = -5.0;
      if (v22 - previousAcceleration > 0.0) {
        double v25 = 5.0;
      }
      double v26 = previousAcceleration + v25;
      if (v24 > 5.0) {
        double v22 = v26;
      }
      if (sampleCount > 2)
      {
        self->_averageAcceleration = (v22 - (self->_accelerations[v21] - self->_averageAcceleration * 3.0)) / 3.0;
        unint64_t v28 = sampleCount + 1;
      }
      else
      {
        double v27 = (double)sampleCount;
        unint64_t v28 = sampleCount + 1;
        self->_averageAcceleration = (v22 + v27 * self->_averageAcceleration) / (double)v28;
      }
      self->_accelerations[v21] = v22;
      self->_double previousAcceleration = v22;
      self->_previousVelocity = v16;
      self->_previousDisplacement = v15;
      self->_double previousTimeStamp = Current;
      self->_unint64_t sampleCount = v28;
    }
  }
}

- (BOOL)popGesture:(id)a3 withRemainingDuration:(double)a4 shouldPopWithVelocity:(double *)a5
{
  id v8 = a3;
  double v9 = v8;
  if (self->_sampleCount >= 3 && self->_interactionState == 2)
  {
    [(UIPercentDrivenInteractiveTransition *)self percentComplete];
    double v11 = v10 + self->_averageVelocity * a4 + self->_averageAcceleration * 0.5 * a4 * a4;
    if (v10 >= 0.5) {
      BOOL v12 = v11 >= 0.3;
    }
    else {
      BOOL v12 = v11 > 1.0;
    }
    double v13 = self->_previousVelocity * self->_totalDistance;
  }
  else
  {
    double v14 = [v8 view];
    [v9 velocityInView:v14];
    double v13 = v15;

    BOOL v12 = self->_averageVelocity > 0.0 && self->_interactionState != 1;
  }
  *a5 = v13;

  return v12;
}

- (void)setEdgeSwipeView:(id)a3
{
  double v4 = (UIView *)a3;
  edgeSwipeView = self->_edgeSwipeView;
  if (edgeSwipeView) {
    [(UIView *)edgeSwipeView removeGestureRecognizer:self->_edgeSwipeGestureRecognizer];
  }
  double v6 = self->_edgeSwipeView;
  self->_edgeSwipeView = v4;
  id v8 = v4;

  if ([(UIView *)self->_edgeSwipeView _sf_usesLeftToRightLayout]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 8;
  }
  [(UIScreenEdgePanGestureRecognizer *)self->_edgeSwipeGestureRecognizer setEdges:v7];
  [(UIView *)self->_edgeSwipeView addGestureRecognizer:self->_edgeSwipeGestureRecognizer];
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4FB30C8];
  id v7 = a3;
  BOOL v5 = [v7 viewControllerForKey:v4];
  int v6 = [v5 isBeingPresented];

  if (v6) {
    [(SFInteractiveDismissController *)self _presentAnimateTransition:v7];
  }
  else {
    [(SFInteractiveDismissController *)self _dismissAnimateTransition:v7];
  }
}

- (void)_dismissAnimateTransition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 viewForKey:*MEMORY[0x1E4FB30C0]];
  int v6 = [v4 viewForKey:*MEMORY[0x1E4FB30D0]];
  [v5 frame];
  uint64_t v34 = v7;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  [(SFInteractiveDismissController *)self transitionDuration:v4];
  uint64_t v32 = v14;
  if (!self->_dimmingView)
  {
    double v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    dimmingView = self->_dimmingView;
    self->_dimmingView = v15;
  }
  double v17 = objc_msgSend(v4, "containerView", v32);
  [v17 insertSubview:v6 belowSubview:v5];
  [v17 bounds];
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
  double v18 = [MEMORY[0x1E4FB1618] blackColor];
  [(UIView *)self->_dimmingView setBackgroundColor:v18];

  [(UIView *)self->_dimmingView setAlpha:0.25];
  [(UIView *)self->_dimmingView removeFromSuperview];
  [v17 insertSubview:self->_dimmingView belowSubview:v5];
  [v17 bounds];
  double y = v52.origin.y;
  double width = v52.size.width;
  double height = v52.size.height;
  CGFloat v22 = CGRectGetWidth(v52) * -0.25;
  [(SFInteractiveDismissController *)self _translationCoefficient];
  double v24 = v22 * v23;
  objc_msgSend(v6, "setFrame:", v24, y, width, height);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke;
  v41[3] = &unk_1E5C77E20;
  uint64_t v44 = v34;
  uint64_t v45 = v9;
  uint64_t v46 = v11;
  uint64_t v47 = v13;
  v41[4] = self;
  id v25 = v5;
  id v42 = v25;
  double v48 = v24;
  double v49 = y;
  double v50 = width;
  double v51 = height;
  id v26 = v6;
  id v43 = v26;
  double v27 = (void *)MEMORY[0x1AD0C36A0](v41);
  int v28 = [v4 isInteractive];
  double v29 = (void *)MEMORY[0x1E4FB1EB0];
  if (v28)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke_2;
    v38[3] = &unk_1E5C73530;
    v30 = &v39;
    id v39 = v4;
    id v40 = v25;
    [v29 animateWithDuration:196608 delay:v27 options:v38 animations:v33 completion:0.0];
    double v31 = v40;
  }
  else
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke_3;
    v35[3] = &unk_1E5C74660;
    v30 = (id *)v36;
    v36[0] = v4;
    v36[1] = self;
    id v37 = v25;
    [v29 _animateUsingSpringWithDuration:4 delay:v27 options:v35 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
    double v31 = v37;
  }
}

uint64_t __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke(uint64_t a1)
{
  double v3 = *(double *)(a1 + 56);
  double v2 = *(double *)(a1 + 64);
  double v4 = *(double *)(a1 + 72);
  double v5 = *(double *)(a1 + 80);
  [*(id *)(*(void *)(a1 + 32) + 184) setAlpha:0.0];
  double v6 = *(double *)(a1 + 72);
  [*(id *)(a1 + 32) _translationCoefficient];
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", v3 + v6 * v7, v2, v4, v5);
  double v8 = *(double *)(a1 + 96);
  double v9 = *(double *)(a1 + 104);
  double v10 = *(double *)(a1 + 112);
  uint64_t v11 = *(void **)(a1 + 48);

  return objc_msgSend(v11, "setFrame:", 0.0, v8, v9, v10);
}

uint64_t __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) transitionWasCancelled] & 1) == 0) {
    [*(id *)(a1 + 40) removeFromSuperview];
  }
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;

  return [v2 completeTransition:v3];
}

void __60__SFInteractiveDismissController__dismissAnimateTransition___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransition:1];
  [*(id *)(*(void *)(a1 + 40) + 184) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v2 + 184);
  *(void *)(v2 + 184) = 0;
}

- (void)_presentAnimateTransition:(id)a3
{
  id v4 = a3;
  double v5 = [v4 containerView];
  double v6 = [v4 viewForKey:*MEMORY[0x1E4FB30D0]];
  double v7 = [v4 viewForKey:*MEMORY[0x1E4FB30C0]];
  [v5 addSubview:v6];
  [v5 bounds];
  CGFloat y = v49.origin.y;
  CGFloat width = v49.size.width;
  CGFloat height = v49.size.height;
  double MaxX = CGRectGetMaxX(v49);
  [(SFInteractiveDismissController *)self _translationCoefficient];
  double v28 = MaxX * v12;
  objc_msgSend(v6, "setFrame:");
  if (!self->_dimmingView)
  {
    uint64_t v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    dimmingView = self->_dimmingView;
    self->_dimmingView = v13;
  }
  [v5 bounds];
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
  double v15 = [MEMORY[0x1E4FB1618] blackColor];
  [(UIView *)self->_dimmingView setBackgroundColor:v15];

  [(UIView *)self->_dimmingView setAlpha:0.0];
  [(UIView *)self->_dimmingView removeFromSuperview];
  [v5 insertSubview:self->_dimmingView belowSubview:v6];
  [v7 frame];
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  double v24 = (void *)MEMORY[0x1E4FB1EB0];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __60__SFInteractiveDismissController__presentAnimateTransition___block_invoke;
  v37[3] = &unk_1E5C77E20;
  double v41 = v28;
  CGFloat v42 = y;
  CGFloat v43 = width;
  CGFloat v44 = height;
  id v38 = v6;
  id v39 = self;
  uint64_t v45 = v16;
  uint64_t v46 = v20;
  uint64_t v47 = v22;
  uint64_t v48 = v18;
  id v40 = v7;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __60__SFInteractiveDismissController__presentAnimateTransition___block_invoke_2;
  v29[3] = &unk_1E5C77E48;
  id v30 = v4;
  double v31 = self;
  id v32 = v40;
  uint64_t v33 = v17;
  uint64_t v34 = v21;
  uint64_t v35 = v23;
  uint64_t v36 = v19;
  id v25 = v40;
  id v26 = v4;
  id v27 = v6;
  [v24 _animateUsingSpringWithDuration:4 delay:v37 options:v29 mass:0.5 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
}

uint64_t __60__SFInteractiveDismissController__presentAnimateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", 0.0, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(*(void *)(a1 + 40) + 184) setAlpha:0.25];
  v11.origin.x = *(CGFloat *)(a1 + 88);
  double v2 = *(double *)(a1 + 96);
  double v3 = *(double *)(a1 + 104);
  double v4 = *(double *)(a1 + 112);
  v11.origin.CGFloat y = v2;
  v11.size.CGFloat width = v3;
  v11.size.CGFloat height = v4;
  CGFloat v5 = CGRectGetWidth(v11) * -0.25;
  [*(id *)(a1 + 40) _translationCoefficient];
  double v7 = v5 * v6;
  double v8 = *(void **)(a1 + 48);

  return objc_msgSend(v8, "setFrame:", v7, v2, v3, v4);
}

void __60__SFInteractiveDismissController__presentAnimateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransition:1];
  [*(id *)(*(void *)(a1 + 40) + 184) removeFromSuperview];
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = *(void **)(v2 + 184);
  *(void *)(v2 + 184) = 0;
}

- (id)interactionControllerForDismissal:(id)a3
{
  if (!self->_dismissMode) {
    self = 0;
  }
  return self;
}

- (UIScreenEdgePanGestureRecognizer)edgeSwipeGestureRecognizer
{
  return self->_edgeSwipeGestureRecognizer;
}

- (UIViewController)viewControllerToBeDismissed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerToBeDismissed);

  return (UIViewController *)WeakRetained;
}

- (void)setViewControllerToBeDismissed:(id)a3
{
}

- (UIView)edgeSwipeView
{
  return self->_edgeSwipeView;
}

- (SFInteractiveDismissControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFInteractiveDismissControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unint64_t)a3
{
  self->_unint64_t sampleCount = a3;
}

- (double)totalDistance
{
  return self->_totalDistance;
}

- (void)setTotalDistance:(double)a3
{
  self->_double totalDistance = a3;
}

- (double)skipTimeStamp
{
  return self->_skipTimeStamp;
}

- (void)setSkipTimeStamp:(double)a3
{
  self->_skipTimeStamp = a3;
}

- (double)previousTimeStamp
{
  return self->_previousTimeStamp;
}

- (void)setPreviousTimeStamp:(double)a3
{
  self->_double previousTimeStamp = a3;
}

- (double)previousDisplacement
{
  return self->_previousDisplacement;
}

- (void)setPreviousDisplacement:(double)a3
{
  self->_previousDisplacement = a3;
}

- (double)previousVelocity
{
  return self->_previousVelocity;
}

- (void)setPreviousVelocity:(double)a3
{
  self->_previousVelocitCGFloat y = a3;
}

- (double)previousAcceleration
{
  return self->_previousAcceleration;
}

- (void)setPreviousAcceleration:(double)a3
{
  self->_double previousAcceleration = a3;
}

- (double)averageVelocity
{
  return self->_averageVelocity;
}

- (void)setAverageVelocity:(double)a3
{
  self->_averageVelocitCGFloat y = a3;
}

- (double)averageAcceleration
{
  return self->_averageAcceleration;
}

- (void)setAverageAcceleration:(double)a3
{
  self->_averageAcceleration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_edgeSwipeView, 0);
  objc_destroyWeak((id *)&self->_viewControllerToBeDismissed);
  objc_storeStrong((id *)&self->_edgeSwipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);

  objc_destroyWeak((id *)&self->_transitionContext);
}

@end