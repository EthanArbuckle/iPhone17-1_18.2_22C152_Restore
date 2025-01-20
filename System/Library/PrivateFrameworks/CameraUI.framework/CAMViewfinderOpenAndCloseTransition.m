@interface CAMViewfinderOpenAndCloseTransition
- (BOOL)didEnterBackground;
- (CAMSnapshotView)_snapshotView;
- (CAMViewfinderOpenAndCloseTransition)initWithTransitionableViewfinder:(id)a3;
- (CAMViewfinderTransitionable)_transitionableViewfinder;
- (id)_existingSnapshotViewCreateIfNecessary:(BOOL)a3 removedOnCompletion:(BOOL)a4;
- (void)_closeViewfinder:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)_setSnapshotView:(id)a3;
- (void)closeAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)closeWithoutBlurring;
- (void)openAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)setDidEnterBackground:(BOOL)a3;
@end

@implementation CAMViewfinderOpenAndCloseTransition

- (void)closeAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
}

- (void)_closeViewfinder:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  CAMSignpostWithIDAndArgs(5, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v9 = [(CAMViewfinderOpenAndCloseTransition *)self _existingSnapshotViewCreateIfNecessary:v6 removedOnCompletion:v6 ^ 1];
  v10 = [(CAMViewfinderOpenAndCloseTransition *)self _transitionableViewfinder];
  v11 = [v10 previewView];
  [v11 setHidden:v6];

  objc_initWeak(&location, v9);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __87__CAMViewfinderOpenAndCloseTransition__closeViewfinder_animated_withCompletionHandler___block_invoke;
  v19 = &unk_263FA3210;
  BOOL v22 = !v6;
  objc_copyWeak(&v21, &location);
  id v12 = v8;
  id v20 = v12;
  v13 = _Block_copy(&v16);
  BOOL v14 = [(CAMViewfinderOpenAndCloseTransition *)self didEnterBackground];
  if (v14) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 0;
  }
  if (!v14 && !v6)
  {
    if (([v9 blurred] & 1) == 0)
    {
      [v9 fadeOutAnimatedWithStyle:0 completion:v13];
      goto LABEL_9;
    }
    uint64_t v15 = 0;
  }
  [v9 setBlurred:v6 animated:v5 style:v15 withCompletionBlock:v13];
LABEL_9:

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (id)_existingSnapshotViewCreateIfNecessary:(BOOL)a3 removedOnCompletion:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(CAMViewfinderOpenAndCloseTransition *)self _snapshotView];
  if (!v7 && v5)
  {
    id v8 = [(CAMViewfinderOpenAndCloseTransition *)self _transitionableViewfinder];
    v9 = [v8 previewView];
    v10 = [v9 superview];
    v7 = -[CAMSnapshotView initWithView:desiredAspectRatio:]([CAMSnapshotView alloc], "initWithView:desiredAspectRatio:", v9, [v8 desiredAspectRatio]);
    [v10 insertSubview:v7 aboveSubview:v9];
    [(CAMViewfinderOpenAndCloseTransition *)self _setSnapshotView:v7];
  }
  if (v7 && v4) {
    [(CAMViewfinderOpenAndCloseTransition *)self _setSnapshotView:0];
  }
  return v7;
}

- (CAMSnapshotView)_snapshotView
{
  return self->__snapshotView;
}

- (void)_setSnapshotView:(id)a3
{
}

- (BOOL)didEnterBackground
{
  return self->_didEnterBackground;
}

uint64_t __87__CAMViewfinderOpenAndCloseTransition__closeViewfinder_animated_withCompletionHandler___block_invoke(uint64_t a1)
{
  CAMSignpostWithIDAndArgs(6, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained removeFromSuperview];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)setDidEnterBackground:(BOOL)a3
{
  self->_didEnterBackground = a3;
}

- (CAMViewfinderOpenAndCloseTransition)initWithTransitionableViewfinder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMViewfinderOpenAndCloseTransition;
  BOOL v5 = [(CAMViewfinderOpenAndCloseTransition *)&v9 init];
  BOOL v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__transitionableViewfinder, v4);
    v6->_didEnterBackground = 0;
    v7 = v6;
  }

  return v6;
}

- (void)openAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
}

- (void)closeWithoutBlurring
{
  id v3 = [(CAMViewfinderOpenAndCloseTransition *)self _existingSnapshotViewCreateIfNecessary:1 removedOnCompletion:0];
  id v5 = [(CAMViewfinderOpenAndCloseTransition *)self _transitionableViewfinder];
  id v4 = [v5 previewView];
  [v4 setHidden:1];
}

- (CAMViewfinderTransitionable)_transitionableViewfinder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__transitionableViewfinder);
  return (CAMViewfinderTransitionable *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__snapshotView, 0);
  objc_destroyWeak((id *)&self->__transitionableViewfinder);
}

@end