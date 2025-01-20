@interface CAMViewfinderTransitionController
- (CAMViewfinderFlipTransition)_flipTransition;
- (CAMViewfinderOpenAndCloseTransition)_openAndCloseTransition;
- (CAMViewfinderTransitionable)target;
- (void)_setFlipTransition:(id)a3;
- (void)_setOpenAndCloseTransition:(id)a3;
- (void)closeAndRotateWithDirection:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)closeWithBlur:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)handleApplicationDidEnterBackground;
- (void)openForReason:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)setTarget:(id)a3;
@end

@implementation CAMViewfinderTransitionController

- (void)closeWithBlur:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v11 = (void (**)(void))a5;
  v8 = [(CAMViewfinderTransitionController *)self _openAndCloseTransition];
  if (!v8)
  {
    v9 = [CAMViewfinderOpenAndCloseTransition alloc];
    v10 = [(CAMViewfinderTransitionController *)self target];
    v8 = [(CAMViewfinderOpenAndCloseTransition *)v9 initWithTransitionableViewfinder:v10];

    [(CAMViewfinderTransitionController *)self _setOpenAndCloseTransition:v8];
  }
  if (v6)
  {
    [(CAMViewfinderOpenAndCloseTransition *)v8 closeAnimated:v5 withCompletionHandler:v11];
  }
  else
  {
    [(CAMViewfinderOpenAndCloseTransition *)v8 closeWithoutBlurring];
    if (v11) {
      v11[2]();
    }
  }
}

- (void)closeAndRotateWithDirection:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v9 = a4;
  BOOL v6 = [(CAMViewfinderTransitionController *)self _flipTransition];
  if (!v6)
  {
    v7 = [CAMViewfinderFlipTransition alloc];
    v8 = [(CAMViewfinderTransitionController *)self target];
    BOOL v6 = [(CAMViewfinderFlipTransition *)v7 initWithTransitionableViewfinder:v8];

    [(CAMViewfinderTransitionController *)self _setFlipTransition:v6];
  }
  [(CAMViewfinderFlipTransition *)v6 performFlipTransitionWithDirection:a3 completionHandler:v9];
}

- (void)openForReason:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  v8 = [(CAMViewfinderTransitionController *)self _openAndCloseTransition];
  uint64_t v9 = [(CAMViewfinderTransitionController *)self _flipTransition];
  v10 = (void *)v9;
  if (v8)
  {
    [(CAMViewfinderTransitionController *)self _setOpenAndCloseTransition:0];
    [v8 openAnimated:v5 withCompletionHandler:v7];
    if (!v10) {
      goto LABEL_12;
    }
  }
  else if (!v9)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Attempting to open the viewfinder with a missing transition! Maybe the viewfinder is already open?";
      v13 = buf;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  [(CAMViewfinderTransitionController *)self _setFlipTransition:0];
  [v10 completeTransitionToLivePreviewWithCompletionHandler:v7];
  if (v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      v12 = "Opened the viewfinder removing both an open/close and a flip transtion.";
      v13 = (uint8_t *)&v14;
LABEL_10:
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)handleApplicationDidEnterBackground
{
  id v2 = [(CAMViewfinderTransitionController *)self _openAndCloseTransition];
  [v2 setDidEnterBackground:1];
}

- (CAMViewfinderTransitionable)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return (CAMViewfinderTransitionable *)WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (CAMViewfinderOpenAndCloseTransition)_openAndCloseTransition
{
  return self->__openAndCloseTransition;
}

- (void)_setOpenAndCloseTransition:(id)a3
{
}

- (CAMViewfinderFlipTransition)_flipTransition
{
  return self->__flipTransition;
}

- (void)_setFlipTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__flipTransition, 0);
  objc_storeStrong((id *)&self->__openAndCloseTransition, 0);
  objc_destroyWeak((id *)&self->_target);
}

@end