@interface GKStateMachine
@end

@implementation GKStateMachine

id __56___GKStateMachine__validateTransitionFromState_toState___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  char v3 = objc_opt_respondsToSelector();

  v4 = (id *)a1[4];
  if (v3)
  {
    id v5 = objc_loadWeakRetained(v4 + 3);
    v6 = [v5 missingTransitionFromState:a1[5] toState:a1[6]];
  }
  else
  {
    v6 = [v4 missingTransitionFromState:a1[5] toState:a1[6]];
  }

  return v6;
}

@end