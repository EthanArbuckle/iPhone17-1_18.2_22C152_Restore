@interface CKBrowserDragManager
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)usesSeparateDragWindow;
- (CGPoint)locationInView;
- (CKBrowserDragControllerDelegate)delegate;
- (CKBrowserDragControllerTranscriptDelegate)transcriptDelegate;
- (CKBrowserDragManager)initWithTargetView:(id)a3;
- (CKBrowserDragViewController)dragViewController;
- (UILongPressGestureRecognizer)gestureRecognizer;
- (UIView)targetView;
- (UIViewController)presentingViewController;
- (UIWindow)dragWindow;
- (id)browserDragViewControllerTargetView:(id)a3;
- (id)currentItem;
- (id)draggedSticker;
- (id)superviewOfView:(id)a3 matchingClass:(Class)a4;
- (void)beginDraggingItem:(id)a3 withAnimatedDragImage:(id)a4 fromRect:(CGRect)a5;
- (void)beginDraggingItem:(id)a3 withDragImage:(id)a4 fromRect:(CGRect)a5;
- (void)browserDragViewController:(id)a3 dragEndedWithTarget:(id)a4;
- (void)browserDragViewController:(id)a3 draggedWithTarget:(id)a4;
- (void)dealloc;
- (void)setCurrentItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragViewController:(id)a3;
- (void)setDragWindow:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setLocationInView:(CGPoint)a3;
- (void)setPlusButtonHidden:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTargetView:(id)a3;
- (void)setTranscriptDelegate:(id)a3;
- (void)tapRecognized:(id)a3;
@end

@implementation CKBrowserDragManager

- (CKBrowserDragManager)initWithTargetView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKBrowserDragManager;
  v5 = [(CKBrowserDragManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(CKBrowserDragManager *)v5 setTargetView:v4];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v6 action:sel_tapRecognized_];
    [v7 setMinimumPressDuration:2.22507386e-308];
    [v7 setDelegate:v6];
    [v7 setCancelsTouchesInView:0];
    [v4 addGestureRecognizer:v7];
    [(CKBrowserDragManager *)v6 setGestureRecognizer:v7];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(CKBrowserDragManager *)self gestureRecognizer];
  [v3 setEnabled:0];

  id v4 = [(CKBrowserDragManager *)self targetView];
  v5 = [(CKBrowserDragManager *)self gestureRecognizer];
  [v4 removeGestureRecognizer:v5];

  v6.receiver = self;
  v6.super_class = (Class)CKBrowserDragManager;
  [(CKBrowserDragManager *)&v6 dealloc];
}

- (BOOL)usesSeparateDragWindow
{
  if (IMIsRunningIniMessageAppsViewService()
    || IMIsRunningIniMessageAppExtension()
    || CKIsRunningInInCallService())
  {
    return 0;
  }
  else
  {
    return [MEMORY[0x1E4F42B08] usesInputSystemUI] ^ 1;
  }
}

- (void)beginDraggingItem:(id)a3 withDragImage:(id)a4 fromRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (a4)
  {
    id v12 = a4;
    v13 = [CKAnimatedImage alloc];
    v19[0] = v12;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

    v15 = [(CKAnimatedImage *)v13 initWithImages:v14 durations:&unk_1EDF15320];
    -[CKBrowserDragManager beginDraggingItem:withAnimatedDragImage:fromRect:](self, "beginDraggingItem:withAnimatedDragImage:fromRect:", v11, v15, x, y, width, height);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CA00];
    id v17 = 0;
    v18 = [v16 exceptionWithName:@"CKBrowserDragManagerDragException", @"beginDraggingItem, should not be called with a nil image parameter", 0 reason userInfo];

    IMLogSimulateCrashForException();
  }
}

- (id)superviewOfView:(id)a3 matchingClass:(Class)a4
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_super v6 = v4;
    do
    {
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v7 = [v6 superview];

      objc_super v6 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (void)beginDraggingItem:(id)a3 withAnimatedDragImage:(id)a4 fromRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  v13 = [(CKBrowserDragManager *)self gestureRecognizer];
  uint64_t v14 = [v13 state];

  if (CKIsRunningInMacCatalyst())
  {
    v15 = [(CKBrowserDragManager *)self currentItem];

    if (!v15) {
      goto LABEL_12;
    }
LABEL_30:
    if (IMOSLoggingEnabled())
    {
      v90 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v90, OS_LOG_TYPE_INFO, "Drag and drop cancelled, current gesture recognizer state is not recognized, changed, or began", buf, 2u);
      }
    }
    v91 = [(CKBrowserDragManager *)self delegate];
    char v92 = objc_opt_respondsToSelector();

    if (v92)
    {
      v93 = [(CKBrowserDragManager *)self delegate];
      [v93 dragManager:self didEndDraggingItem:v11 toDragTarget:0 dropArea:0];
    }
    goto LABEL_36;
  }
  v16 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v16 userInterfaceIdiom] == 1)
  {
    int v17 = CKIsRunningInCameraAppsClient();

    if (!v17)
    {
      v18 = (void *)MEMORY[0x1E4F42F08];
      v19 = [MEMORY[0x1E4F43058] keyWindow];
      v20 = [v19 windowScene];
      v21 = [v18 sharedTextEffectsWindowForWindowScene:v20];

      LODWORD(v19) = [v21 _isFullscreen];
      if (!v19) {
        goto LABEL_30;
      }
    }
  }
  else
  {
  }
  v22 = [(CKBrowserDragManager *)self currentItem];
  if (v22)
  {

    goto LABEL_30;
  }
  if ((unint64_t)(v14 - 1) > 2) {
    goto LABEL_30;
  }
LABEL_12:
  v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v23 postNotificationName:@"CKBrowserDragManagerWillStartDraggingNotification" object:0];

  [(CKBrowserDragManager *)self setCurrentItem:v11];
  BOOL v24 = [(CKBrowserDragManager *)self usesSeparateDragWindow];
  v25 = [(CKBrowserDragManager *)self targetView];
  v26 = [v25 window];

  if (v24)
  {
    v27 = [CKBrowserDragWindow alloc];
    v28 = [MEMORY[0x1E4F42D90] mainScreen];
    [v28 bounds];
    uint64_t v29 = -[CKPresentationControllerWindow initWithFrame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:](v27, "initWithFrame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:", 0, 0, 0);

    v26 = (void *)v29;
  }
  [(CKBrowserDragManager *)self setDragWindow:v26];
  v30 = [(CKBrowserDragManager *)self targetView];
  objc_msgSend(v30, "convertRect:toView:", 0, x, y, width, height);
  double v100 = v32;
  double v101 = v31;
  double v98 = v34;
  double v99 = v33;

  v35 = [(CKBrowserDragManager *)self gestureRecognizer];
  v36 = [(CKBrowserDragManager *)self targetView];
  [v35 locationInView:v36];
  double v38 = v37;
  double v40 = v39;

  v41 = [(CKBrowserDragManager *)self targetView];
  objc_msgSend(v41, "convertPoint:toView:", 0, v38, v40);
  double v43 = v42;
  double v45 = v44;

  v46 = [(CKBrowserDragManager *)self targetView];
  v47 = [(CKBrowserDragManager *)self superviewOfView:v46 matchingClass:objc_opt_class()];

  v48 = [(CKBrowserDragManager *)self targetView];
  objc_msgSend(v48, "convertRect:toView:", v47, x, y, width, height);
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v56 = v55;

  v57 = [(CKBrowserDragManager *)self gestureRecognizer];
  [v57 locationInView:v47];
  double v59 = v58;
  double v61 = v60;

  v62 = [(CKBrowserDragManager *)self targetView];
  objc_msgSend(v62, "convertPoint:toView:", v47, v59, v61);
  uint64_t v64 = v63;
  uint64_t v66 = v65;

  v67 = [CKBrowserDragViewController alloc];
  v68 = [(CKBrowserDragManager *)self gestureRecognizer];
  v69 = -[CKBrowserDragViewController initWithDragImage:inSourceRect:withSourcePoint:keyboardSourceRect:keyboardSourcePoint:withGestureRecognizer:](v67, "initWithDragImage:inSourceRect:withSourcePoint:keyboardSourceRect:keyboardSourcePoint:withGestureRecognizer:", v12, v68, v101, v100, v99, v98, v43, v45, v50, v52, v54, v56, v64, v66);

  v70 = [MEMORY[0x1E4F43058] keyWindow];
  v71 = [v70 windowScene];
  int v72 = [v71 _enhancedWindowingEnabled];

  if (v72) {
    [(CKBrowserDragViewController *)v69 setKeyboardWindowSourceView:v47];
  }
  [(CKBrowserDragViewController *)v69 setDelegate:self];
  [(CKBrowserDragManager *)self setDragViewController:v69];
  if (v24) {
    uint64_t v73 = 0;
  }
  else {
    uint64_t v73 = 5;
  }
  [(CKBrowserDragViewController *)v69 setModalPresentationStyle:v73];
  v74 = [(CKBrowserDragManager *)self delegate];
  char v75 = objc_opt_respondsToSelector();

  if (v75)
  {
    v76 = [(CKBrowserDragManager *)self delegate];
    -[CKBrowserDragViewController setCanScale:](v69, "setCanScale:", [v76 dragManager:self canScaleItem:v11]);
  }
  v77 = [(CKBrowserDragManager *)self delegate];
  char v78 = objc_opt_respondsToSelector();

  if (v78)
  {
    v79 = [(CKBrowserDragManager *)self delegate];
    -[CKBrowserDragViewController setCanRotate:](v69, "setCanRotate:", [v79 dragManager:self canRotateItem:v11]);
  }
  v80 = [(CKBrowserDragManager *)self delegate];
  char v81 = objc_opt_respondsToSelector();

  if (v81)
  {
    v82 = [(CKBrowserDragManager *)self delegate];
    -[CKBrowserDragViewController setCanPeel:](v69, "setCanPeel:", [v82 dragManager:self canPeelItem:v11]);
  }
  [v26 setHidden:0];
  v83 = [v26 rootViewController];
  if (!v24)
  {
    uint64_t v94 = 10;
    while (1)
    {
      uint64_t v95 = [v83 presentedViewController];
      if (!v95) {
        break;
      }
      v96 = (void *)v95;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      v84 = [v83 presentedViewController];

      v83 = v84;
      if (!--v94) {
        goto LABEL_27;
      }
    }
  }
  v84 = v83;
LABEL_27:
  [v84 presentViewController:v69 animated:0 completion:0];
  [(CKBrowserDragManager *)self setPresentingViewController:v84];
  v85 = [(CKBrowserDragManager *)self transcriptDelegate];
  [v85 dragManagerDidBeginDragging:self];

  v86 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v86 postNotificationName:@"CKBrowserDragManagerDidStartDraggingNotification" object:0];

  v87 = [(CKBrowserDragManager *)self delegate];
  char v88 = objc_opt_respondsToSelector();

  if (v88)
  {
    v89 = [(CKBrowserDragManager *)self delegate];
    [v89 dragManager:self didBeginDraggingItem:v11];
  }
LABEL_36:
}

- (void)setPlusButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKBrowserDragManager *)self dragViewController];
  [v4 setPlusImageViewHidden:v3];
}

- (void)tapRecognized:(id)a3
{
  id v4 = a3;
  v5 = [(CKBrowserDragManager *)self targetView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  -[CKBrowserDragManager setLocationInView:](self, "setLocationInView:", v7, v9);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)browserDragViewController:(id)a3 draggedWithTarget:(id)a4
{
  id v10 = a4;
  v5 = [(CKBrowserDragManager *)self transcriptDelegate];
  [v5 dragManager:self draggedItemWithTarget:v10];

  double v6 = [(CKBrowserDragManager *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(CKBrowserDragManager *)self delegate];
    double v9 = [(CKBrowserDragManager *)self currentItem];
    [v8 dragManager:self didDragItem:v9 toDragTarget:v10];
  }
}

- (id)browserDragViewControllerTargetView:(id)a3
{
  id v4 = [(CKBrowserDragManager *)self transcriptDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(CKBrowserDragManager *)self transcriptDelegate];
    char v7 = [v6 dragManagerTargetView:self];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)browserDragViewController:(id)a3 dragEndedWithTarget:(id)a4
{
  id v5 = a4;
  double v6 = [(CKBrowserDragManager *)self currentItem];
  if (v5)
  {
    char v7 = [(CKBrowserDragManager *)self transcriptDelegate];
    uint64_t v8 = [v7 dragManager:self dropAreaForDragTarget:v5];
  }
  else
  {
    uint64_t v8 = 0;
  }
  double v9 = [(CKBrowserDragManager *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(CKBrowserDragManager *)self delegate];
    int v12 = [v11 dragManager:self shouldCancelDraggingForItem:v6 toDragTarget:v5 dropArea:v8];
  }
  else
  {
    int v12 = 0;
  }
  if (!v8) {
    int v12 = 1;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke;
  aBlock[3] = &unk_1E56259D8;
  aBlock[4] = self;
  id v13 = v6;
  id v29 = v13;
  id v14 = v5;
  id v30 = v14;
  int v31 = v8;
  char v32 = v12;
  v15 = (void (**)(void))_Block_copy(aBlock);
  if (v12 == 1)
  {
    v16 = [(CKBrowserDragManager *)self dragViewController];
    [v16 animateBackToSourceCompletionBlock:v15];
  }
  else
  {
    int v17 = [(CKBrowserDragManager *)self delegate];
    v18 = [(CKBrowserDragManager *)self currentItem];
    int v19 = [v17 dragManager:self canPeelItem:v18];

    if (v19)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_2;
      v26[3] = &unk_1E5625A00;
      v26[4] = self;
      v27 = v15;
      v20 = _Block_copy(v26);
      v21 = [(CKBrowserDragManager *)self transcriptDelegate];
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        v23 = [(CKBrowserDragManager *)self transcriptDelegate];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_4;
        v24[3] = &unk_1E5625A50;
        id v25 = v20;
        [v23 dragManager:self overrideDropPointForTarget:v14 completion:v24];
      }
      else
      {
        [v14 screenCoordinate];
        (*((void (**)(void *, void))v20 + 2))(v20, 0);
      }
    }
    else
    {
      v15[2](v15);
    }
  }
}

void __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 dragManager:*(void *)(a1 + 32) didEndDraggingItem:*(void *)(a1 + 40) toDragTarget:*(void *)(a1 + 48) dropArea:*(unsigned int *)(a1 + 56)];
  }
  if (*(unsigned char *)(a1 + 60))
  {
    id v11 = @"CKBrowserDragManagerDidEndDragSuccessKey";
    v12[0] = MEMORY[0x1E4F1CC28];
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    id v5 = 0;
  }
  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"CKBrowserDragManagerDidEndDraggingNotification" object:0 userInfo:v5];

  char v7 = [*(id *)(a1 + 32) presentingViewController];
  [v7 dismissViewControllerAnimated:0 completion:0];

  [*(id *)(a1 + 32) setPresentingViewController:0];
  if ([*(id *)(a1 + 32) usesSeparateDragWindow])
  {
    uint64_t v8 = [*(id *)(a1 + 32) dragWindow];
    [v8 setHidden:1];
  }
  double v9 = [*(id *)(a1 + 32) dragViewController];
  [v9 setDelegate:0];

  [*(id *)(a1 + 32) setDragViewController:0];
  [*(id *)(a1 + 32) setDragWindow:0];
  char v10 = [*(id *)(a1 + 32) transcriptDelegate];
  [v10 dragManagerDidEndDragging:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) setCurrentItem:0];
}

void __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8 = [*(id *)(a1 + 32) dragViewController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_3;
  v9[3] = &unk_1E5620F48;
  id v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "animatePlacementAtPoint:shouldShrink:completionBlock:", a2, v9, a3, a4);
}

uint64_t __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_4(uint64_t a1, double a2, double a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_5;
  block[3] = &unk_1E5625A28;
  id v6 = *(id *)(a1 + 32);
  double v7 = a2;
  double v8 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__CKBrowserDragManager_browserDragViewController_dragEndedWithTarget___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)draggedSticker
{
  v2 = [(CKBrowserDragManager *)self dragViewController];
  char v3 = [v2 draggedSticker];

  return v3;
}

- (CKBrowserDragControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBrowserDragControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKBrowserDragControllerTranscriptDelegate)transcriptDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transcriptDelegate);

  return (CKBrowserDragControllerTranscriptDelegate *)WeakRetained;
}

- (void)setTranscriptDelegate:(id)a3
{
}

- (id)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(id)a3
{
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (CGPoint)locationInView
{
  double x = self->_locationInView.x;
  double y = self->_locationInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocationInView:(CGPoint)a3
{
  self->_locationInView = a3;
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
}

- (CKBrowserDragViewController)dragViewController
{
  return self->_dragViewController;
}

- (void)setDragViewController:(id)a3
{
}

- (UIWindow)dragWindow
{
  return self->_dragWindow;
}

- (void)setDragWindow:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_dragWindow, 0);
  objc_storeStrong((id *)&self->_dragViewController, 0);
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong(&self->_currentItem, 0);
  objc_destroyWeak((id *)&self->_transcriptDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end