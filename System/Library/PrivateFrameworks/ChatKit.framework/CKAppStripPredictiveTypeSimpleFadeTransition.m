@interface CKAppStripPredictiveTypeSimpleFadeTransition
- (void)transitionFromView:(id)a3 toView:(id)a4 withDirection:(int64_t)a5 completion:(id)a6;
@end

@implementation CKAppStripPredictiveTypeSimpleFadeTransition

- (void)transitionFromView:(id)a3 toView:(id)a4 withDirection:(int64_t)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  v11 = [v9 superview];
  [v11 bringSubviewToFront:v9];

  v12 = (void *)MEMORY[0x1E4F42FF0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__CKAppStripPredictiveTypeSimpleFadeTransition_transitionFromView_toView_withDirection_completion___block_invoke;
  v15[3] = &unk_1E5620AF8;
  id v16 = v9;
  id v17 = v8;
  id v13 = v8;
  id v14 = v9;
  [v12 animateWithDuration:v15 animations:v10 completion:0.1];
}

uint64_t __99__CKAppStripPredictiveTypeSimpleFadeTransition_transitionFromView_toView_withDirection_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

@end