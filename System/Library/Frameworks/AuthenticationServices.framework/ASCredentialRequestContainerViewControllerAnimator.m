@interface ASCredentialRequestContainerViewControllerAnimator
- (ASCredentialRequestContainerViewControllerAnimator)init;
- (ASCredentialRequestContainerViewControllerAnimator)initWithPresenting:(BOOL)a3;
- (BOOL)isPresenting;
- (double)transitionDuration:(id)a3;
- (id)_viewControllerForTransitionContext:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation ASCredentialRequestContainerViewControllerAnimator

- (ASCredentialRequestContainerViewControllerAnimator)init
{
  return [(ASCredentialRequestContainerViewControllerAnimator *)self initWithPresenting:1];
}

- (ASCredentialRequestContainerViewControllerAnimator)initWithPresenting:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASCredentialRequestContainerViewControllerAnimator;
  v4 = [(ASCredentialRequestContainerViewControllerAnimator *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_presenting = a3;
    v6 = v4;
  }

  return v5;
}

- (id)_viewControllerForTransitionContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ASCredentialRequestContainerViewControllerAnimator *)self isPresenting];
  v6 = (void *)MEMORY[0x263F83C10];
  if (!v5) {
    v6 = (void *)MEMORY[0x263F83C00];
  }
  v7 = [v4 viewControllerForKey:*v6];

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ASCredentialRequestContainerViewControllerAnimator *)self _viewControllerForTransitionContext:v4];
  v6 = [v5 view];
  v7 = [v4 containerView];
  [v7 addSubview:v6];
  objc_super v8 = (void *)MEMORY[0x263F82E00];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__ASCredentialRequestContainerViewControllerAnimator_animateTransition___block_invoke;
  v15[3] = &unk_264395428;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performWithoutAnimation:v15];
  v11 = (void *)MEMORY[0x263F82E00];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__ASCredentialRequestContainerViewControllerAnimator_animateTransition___block_invoke_3;
  v13[3] = &unk_264396A08;
  id v14 = v4;
  id v12 = v4;
  [v11 _animateUsingDefaultTimingWithOptions:134 animations:&__block_literal_global_24 completion:v13];
}

uint64_t __72__ASCredentialRequestContainerViewControllerAnimator_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __72__ASCredentialRequestContainerViewControllerAnimator_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

- (double)transitionDuration:(id)a3
{
  return 0.35;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

@end