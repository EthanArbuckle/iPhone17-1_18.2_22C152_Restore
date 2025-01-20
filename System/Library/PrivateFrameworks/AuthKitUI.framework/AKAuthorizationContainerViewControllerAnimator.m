@interface AKAuthorizationContainerViewControllerAnimator
- (AKAuthorizationContainerViewControllerAnimator)init;
- (AKAuthorizationContainerViewControllerAnimator)initWithPresenting:(BOOL)a3;
- (BOOL)isPresenting;
- (double)transitionDuration:(id)a3;
- (id)_viewControllerForTransitionContext:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation AKAuthorizationContainerViewControllerAnimator

- (AKAuthorizationContainerViewControllerAnimator)init
{
  return [(AKAuthorizationContainerViewControllerAnimator *)self initWithPresenting:1];
}

- (AKAuthorizationContainerViewControllerAnimator)initWithPresenting:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationContainerViewControllerAnimator;
  result = [(AKAuthorizationContainerViewControllerAnimator *)&v5 init];
  if (result) {
    result->_presenting = a3;
  }
  return result;
}

- (id)_viewControllerForTransitionContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AKAuthorizationContainerViewControllerAnimator *)self isPresenting];
  v6 = (void *)MEMORY[0x1E4F43EC0];
  if (!v5) {
    v6 = (void *)MEMORY[0x1E4F43EB0];
  }
  v7 = [v4 viewControllerForKey:*v6];

  return v7;
}

- (void)animateTransition:(id)a3
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  v25 = [(AKAuthorizationContainerViewControllerAnimator *)self _viewControllerForTransitionContext:v24];
  id v4 = [v25 view];
  BOOL v5 = [v24 containerView];
  [v5 addSubview:v4];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [v4 leadingAnchor];
  v22 = [v5 leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v30[0] = v21;
  v20 = [v4 trailingAnchor];
  v19 = [v5 trailingAnchor];
  v6 = [v20 constraintEqualToAnchor:v19];
  v30[1] = v6;
  v7 = [v4 topAnchor];
  v8 = [v5 topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v30[2] = v9;
  v10 = [v4 bottomAnchor];
  v11 = [v5 bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v30[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [v18 activateConstraints:v13];

  v14 = (void *)MEMORY[0x1E4F42FF0];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __68__AKAuthorizationContainerViewControllerAnimator_animateTransition___block_invoke;
  v28[3] = &unk_1E648EF28;
  id v29 = v4;
  id v15 = v4;
  [v14 performWithoutAnimation:v28];
  v16 = (void *)MEMORY[0x1E4F42FF0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__AKAuthorizationContainerViewControllerAnimator_animateTransition___block_invoke_3;
  v26[3] = &unk_1E648F208;
  id v27 = v24;
  id v17 = v24;
  [v16 _animateUsingDefaultTimingWithOptions:134 animations:&__block_literal_global_1 completion:v26];
}

uint64_t __68__AKAuthorizationContainerViewControllerAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __68__AKAuthorizationContainerViewControllerAnimator_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
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