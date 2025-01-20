@interface _CRKCardViewControllerTransitionAnimator
+ (id)sectionShuffleTransitionAnimator;
- (_CRKCardViewControllerTransitionAnimatorDelegate)delegate;
- (void)_prepareAnimationFromCardViewController:(id)a3 toCardViewController:(id)a4 withAnimationCoordinator:(id)a5;
- (void)setDelegate:(id)a3;
- (void)transitionFromCardViewController:(id)a3 toCardViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
@end

@implementation _CRKCardViewControllerTransitionAnimator

- (void)transitionFromCardViewController:(id)a3 toCardViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 parentViewController];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 view];
    v16 = [v10 view];
    uint64_t v17 = [v11 view];
    v18 = objc_alloc_init(_CRKCardViewControllerTransitionCoordinator);
    BOOL v31 = v7;
    [(_CRKCardViewControllerTransitionCoordinator *)v18 setAnimated:v7];
    [(_CRKCardViewControllerTransitionCoordinator *)v18 setContainerView:v15];
    [(_CRKCardViewControllerTransitionAnimator *)self _prepareAnimationFromCardViewController:v10 toCardViewController:v11 withAnimationCoordinator:v18];
    uint64_t v19 = [(_CRKCardViewControllerTransitionCoordinator *)v18 initialSetup];
    v20 = (void *)v19;
    if (v19) {
      (*(void (**)(uint64_t))(v19 + 16))(v19);
    }
    [(_CRKCardViewControllerTransitionCoordinator *)v18 setInitialSetup:0];
    [v14 addChildViewController:v11];
    v30 = v15;
    v32 = (void *)v17;
    [v15 addSubview:v17];
    [v11 didMoveToParentViewController:v14];
    uint64_t v21 = [(_CRKCardViewControllerTransitionCoordinator *)v18 finalSetup];
    v22 = (void *)v21;
    if (v21) {
      (*(void (**)(uint64_t))(v21 + 16))(v21);
    }
    [(_CRKCardViewControllerTransitionCoordinator *)v18 setFinalSetup:0];
    v23 = [(_CRKCardViewControllerTransitionAnimator *)self delegate];
    [v23 transitionAnimator:self willTransitionFromCardViewController:v10 toCardViewController:v11 withAnimationCoordinator:v18];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __118___CRKCardViewControllerTransitionAnimator_transitionFromCardViewController_toCardViewController_animated_completion___block_invoke;
    v34[3] = &unk_26470E960;
    v24 = v18;
    v35 = v24;
    id v25 = v10;
    id v36 = v25;
    id v37 = v16;
    id v33 = v12;
    id v38 = v12;
    id v26 = v16;
    v27 = (void (**)(void, void))MEMORY[0x22A6282E0](v34);
    uint64_t v28 = [(_CRKCardViewControllerTransitionCoordinator *)v24 animations];
    v29 = (void *)v28;
    if (v31)
    {
      [v14 transitionFromViewController:v25 toViewController:v11 duration:129 options:v28 animations:v27 completion:0.2];
    }
    else
    {
      if (v28) {
        (*(void (**)(uint64_t))(v28 + 16))(v28);
      }
      v27[2](v27, 1);
    }

    id v12 = v33;
  }
  else if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

- (void)_prepareAnimationFromCardViewController:(id)a3 toCardViewController:(id)a4 withAnimationCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 view];
  id v10 = [v7 view];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke;
  v27[3] = &unk_26470E988;
  id v11 = v10;
  id v28 = v11;
  [v8 setInitialSetup:v27];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_2;
  v23[3] = &unk_26470E9B0;
  id v12 = v9;
  id v24 = v12;
  id v13 = v11;
  id v25 = v13;
  id v26 = v7;
  id v14 = v7;
  [v8 setFinalSetup:v23];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_3;
  v20[3] = &unk_26470E9D8;
  id v15 = v13;
  id v21 = v15;
  id v22 = v12;
  id v16 = v12;
  [v8 setAnimations:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __130___CRKCardViewControllerTransitionAnimator__prepareAnimationFromCardViewController_toCardViewController_withAnimationCoordinator___block_invoke_4;
  v18[3] = &unk_26470EA00;
  id v19 = v15;
  id v17 = v15;
  [v8 setCompletion:v18];
}

- (_CRKCardViewControllerTransitionAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_CRKCardViewControllerTransitionAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sectionShuffleTransitionAnimator
{
  v2 = objc_alloc_init(_CRKSectionShuffleTransitionAnimator);

  return v2;
}

@end