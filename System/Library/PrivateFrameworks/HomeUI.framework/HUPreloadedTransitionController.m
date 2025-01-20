@interface HUPreloadedTransitionController
- (HUPreloadedTransitionController)init;
- (NAFuture)completionFuture;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation HUPreloadedTransitionController

- (HUPreloadedTransitionController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HUPreloadedTransitionController;
  v2 = [(HUPreloadedTransitionController *)&v6 init];
  if (v2)
  {
    v3 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    completionFuture = v2->_completionFuture;
    v2->_completionFuture = v3;
  }
  return v2;
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x1E4F43EC0]];
  objc_super v6 = [v4 containerView];
  v7 = [(HUPreloadedTransitionController *)self completionFuture];
  if ([v5 conformsToProtocol:&unk_1F19C09F0])
  {
    v8 = _HUPreloadViewController(v5, 0, &__block_literal_global_39);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__HUPreloadedTransitionController_animateTransition___block_invoke_2;
    v11[3] = &unk_1E63859D0;
    id v12 = v6;
    id v13 = v5;
    id v14 = v4;
    id v15 = v7;
    id v9 = (id)[v8 addCompletionBlock:v11];
  }
  else
  {
    v10 = [v5 view];
    [v6 addSubview:v10];

    [v4 completeTransition:1];
    [v7 finishWithNoResult];
  }
}

uint64_t __53__HUPreloadedTransitionController_animateTransition___block_invoke()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

void __53__HUPreloadedTransitionController_animateTransition___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  objc_super v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v9 = a2;
  v8 = [v6 view];
  [v5 addSubview:v8];

  [*(id *)(a1 + 48) completeTransition:v7 == 0];
  [*(id *)(a1 + 56) finishWithResult:v9 error:v7];
}

- (NAFuture)completionFuture
{
  return self->_completionFuture;
}

- (void).cxx_destruct
{
}

@end