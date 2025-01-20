@interface MKLookAroundTransitionController
- (CGRect)initialFrame;
- (UIView)sourceView;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)_dismiss:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_present:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)beginFullScreenDismissalOfViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)beginFullScreenPresentationOfViewController:(id)a3 fromView:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setInitialFrame:(CGRect)a3;
- (void)setSourceView:(id)a3;
@end

@implementation MKLookAroundTransitionController

- (void)beginFullScreenDismissalOfViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 presentingViewController];
  v11 = [v8 transitionCoordinator];
  if (v11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__MKLookAroundTransitionController_beginFullScreenDismissalOfViewController_animated_completion___block_invoke;
    v12[3] = &unk_1E54B8110;
    v12[4] = self;
    id v13 = v8;
    id v14 = v10;
    BOOL v16 = v6;
    id v15 = v9;
    [v11 animateAlongsideTransition:0 completion:v12];
  }
  else
  {
    [(MKLookAroundTransitionController *)self _dismiss:v8 fromViewController:v10 animated:v6 completion:v9];
  }
}

uint64_t __97__MKLookAroundTransitionController_beginFullScreenDismissalOfViewController_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss:*(void *)(a1 + 40) fromViewController:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)beginFullScreenPresentationOfViewController:(id)a3 fromView:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(MKLookAroundTransitionController *)self setSourceView:v11];
  [v10 setTransitioningDelegate:self];
  if (v11
    && ([MEMORY[0x1E4F42FF8] _viewControllerForFullScreenPresentationFromView:v11],
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v14 = (void *)v13;
  }
  else
  {
    id v15 = (id *)MEMORY[0x1E4F43630];
    if ([(id)*MEMORY[0x1E4F43630] supportsMultipleScenes])
    {
      id v14 = 0;
    }
    else
    {

      v18 = objc_msgSend(*v15, "_mklookaround_possibleWindowForControllingOverallAppearance");
      for (uint64_t i = [v18 rootViewController];
      {
        id v14 = (void *)i;

        id v11 = [v14 presentedViewController];

        if (!v11) {
          break;
        }
        v18 = v14;
        [v14 presentedViewController];
      }
    }
  }
  if (v10)
  {
    BOOL v16 = (void *)[v12 copy];

    v17 = [v14 transitionCoordinator];
    if (v17)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __109__MKLookAroundTransitionController_beginFullScreenPresentationOfViewController_fromView_animated_completion___block_invoke;
      v20[3] = &unk_1E54B8110;
      v20[4] = self;
      id v21 = v10;
      id v22 = v14;
      BOOL v24 = v7;
      id v23 = v16;
      [v17 animateAlongsideTransition:0 completion:v20];
    }
    else
    {
      [(MKLookAroundTransitionController *)self _present:v10 fromViewController:v14 animated:v7 completion:v16];
    }
  }
  else
  {
    BOOL v16 = v12;
  }
}

uint64_t __109__MKLookAroundTransitionController_beginFullScreenPresentationOfViewController_fromView_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _present:*(void *)(a1 + 40) fromViewController:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (id)animationControllerForDismissedController:(id)a3
{
  v4 = [MKLookAroundDismissAnimationController alloc];
  v5 = [(MKLookAroundTransitionController *)self sourceView];
  [(MKLookAroundTransitionController *)self initialFrame];
  BOOL v6 = -[MKLookAroundDismissAnimationController initWithSourceView:finalFrame:](v4, "initWithSourceView:finalFrame:", v5);

  return v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  BOOL v6 = [MKLookAroundPresentAnimationController alloc];
  BOOL v7 = [(MKLookAroundTransitionController *)self sourceView];
  [(MKLookAroundTransitionController *)self initialFrame];
  id v8 = -[MKLookAroundPresentAnimationController initWithSourceView:initialFrame:](v6, "initWithSourceView:initialFrame:", v7);

  return v8;
}

- (void)_dismiss:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a3;
  [a4 dismissViewControllerAnimated:v6 completion:0];
  id v11 = [v10 transitionCoordinator];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__MKLookAroundTransitionController__dismiss_fromViewController_animated_completion___block_invoke;
  v13[3] = &unk_1E54B8138;
  id v14 = v9;
  id v12 = v9;
  [v11 animateAlongsideTransition:0 completion:v13];
}

uint64_t __84__MKLookAroundTransitionController__dismiss_fromViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 isCancelled] ^ 1;
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (void)_present:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v11 view];
  id v14 = [(MKLookAroundTransitionController *)self sourceView];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  id v23 = [(MKLookAroundTransitionController *)self sourceView];
  objc_msgSend(v13, "convertRect:fromView:", v23, v16, v18, v20, v22);
  -[MKLookAroundTransitionController setInitialFrame:](self, "setInitialFrame:");

  [v11 presentViewController:v12 animated:v6 completion:0];
  BOOL v24 = [v12 transitionCoordinator];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __84__MKLookAroundTransitionController__present_fromViewController_animated_completion___block_invoke;
  v26[3] = &unk_1E54B8138;
  id v27 = v10;
  id v25 = v10;
  [v24 animateAlongsideTransition:0 completion:v26];
}

uint64_t __84__MKLookAroundTransitionController__present_fromViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 isCancelled] ^ 1;
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (void)setSourceView:(id)a3
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

- (void).cxx_destruct
{
}

@end