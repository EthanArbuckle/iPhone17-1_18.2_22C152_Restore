@interface CCUIContentModuleContainerReducedMotionTransition
- (CGAffineTransform)snapshotCorrectiveTransform;
- (UIView)snapshotView;
- (UIWindow)snapshotHostWindow;
- (id)customAnimator;
- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)setSnapshotCorrectiveTransform:(CGAffineTransform *)a3;
- (void)setSnapshotHostWindow:(id)a3;
- (void)setSnapshotView:(id)a3;
@end

@implementation CCUIContentModuleContainerReducedMotionTransition

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4FB1EB0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__CCUIContentModuleContainerReducedMotionTransition_performTransitionFromView_toView_containerView___block_invoke;
  v19[3] = &unk_1E6A8A778;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  v23 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performWithoutAnimation:v19];
  v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v16 = [v15 snapshotViewAfterScreenUpdates:0];
  snapshotView = self->_snapshotView;
  self->_snapshotView = v16;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__CCUIContentModuleContainerReducedMotionTransition_performTransitionFromView_toView_containerView___block_invoke_2;
  v18[3] = &unk_1E6A898F8;
  v18[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v18];
  [(UIView *)self->_snapshotView setAlpha:0.0];
}

id __100__CCUIContentModuleContainerReducedMotionTransition_performTransitionFromView_toView_containerView___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 56);
  v5.super_class = (Class)CCUIContentModuleContainerReducedMotionTransition;
  return objc_msgSendSuper2(&v5, sel_performTransitionFromView_toView_containerView_, v1, v2, v3);
}

uint64_t __100__CCUIContentModuleContainerReducedMotionTransition_performTransitionFromView_toView_containerView___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) viewController];
  uint64_t v3 = [v2 view];
  [v3 layoutIfNeeded];

  v4 = [*(id *)(a1 + 32) snapshotHostWindow];
  [v4 addSubview:*(void *)(*(void *)(a1 + 32) + 64)];

  objc_super v5 = *(void **)(a1 + 32);
  v6 = (void *)v5[8];
  v7 = [v5 snapshotHostWindow];
  [v7 center];
  objc_msgSend(v6, "setCenter:");

  id v8 = *(void **)(a1 + 32);
  id v9 = (void *)v8[8];
  [v8 snapshotCorrectiveTransform];
  return [v9 setTransform:&v11];
}

- (id)customAnimator
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:0 curve:0 animations:0.2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__CCUIContentModuleContainerReducedMotionTransition_customAnimator__block_invoke;
  v5[3] = &unk_1E6A8A7A0;
  v5[4] = self;
  [v3 addCompletion:v5];

  return v3;
}

uint64_t __67__CCUIContentModuleContainerReducedMotionTransition_customAnimator__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) snapshotView];
  [v2 removeFromSuperview];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setSnapshotView:0];
}

- (UIWindow)snapshotHostWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotHostWindow);

  return (UIWindow *)WeakRetained;
}

- (void)setSnapshotHostWindow:(id)a3
{
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (CGAffineTransform)snapshotCorrectiveTransform
{
  long long v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].b;
  return self;
}

- (void)setSnapshotCorrectiveTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_snapshotCorrectiveTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_snapshotCorrectiveTransform.c = v4;
  *(_OWORD *)&self->_snapshotCorrectiveTransform.tx = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);

  objc_destroyWeak((id *)&self->_snapshotHostWindow);
}

@end