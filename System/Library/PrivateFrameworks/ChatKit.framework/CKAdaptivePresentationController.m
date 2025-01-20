@interface CKAdaptivePresentationController
+ (id)sharedInstance;
- (CKPresentationControllerWindow)presentationWindow;
- (UIPopoverPresentationController)currentPresentationController;
- (UIViewController)presentedViewController;
- (id)dismissalHandler;
- (id)presentationHandler;
- (void)_cleanup;
- (void)_presentViewController:(id)a3 fromViewController:(id)a4 presentationHandler:(id)a5 barButtonItemPresentationHandler:(id)a6 dismissalHandler:(id)a7 animated:(BOOL)a8 completion:(id)a9;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)presentViewController:(id)a3 fromViewController:(id)a4 barButtonItemPresentationHandler:(id)a5 dismissalHandler:(id)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)presentViewController:(id)a3 fromViewController:(id)a4 presentationHandler:(id)a5 dismissalHandler:(id)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)setCurrentPresentationController:(id)a3;
- (void)setDismissalHandler:(id)a3;
- (void)setPresentationHandler:(id)a3;
- (void)setPresentationWindow:(id)a3;
- (void)setPresentedViewController:(id)a3;
@end

@implementation CKAdaptivePresentationController

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_98);
  }
  v2 = (void *)sharedInstance_sSharedInstance_0;

  return v2;
}

void __50__CKAdaptivePresentationController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKAdaptivePresentationController);
  v1 = (void *)sharedInstance_sSharedInstance_0;
  sharedInstance_sSharedInstance_0 = (uint64_t)v0;
}

- (void)dealloc
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIViewController *)self->_presentedViewController setAlertDelegate:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)CKAdaptivePresentationController;
  [(CKAdaptivePresentationController *)&v3 dealloc];
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  presentationHandler = (void (**)(id, CGRect *, id *))self->_presentationHandler;
  if (presentationHandler) {
    presentationHandler[2](presentationHandler, a4, a5);
  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v7 = a3;
  id v4 = [(CKAdaptivePresentationController *)self currentPresentationController];

  v5 = v7;
  if (v4 == v7)
  {
    dismissalHandler = (void (**)(id, id))self->_dismissalHandler;
    if (dismissalHandler) {
      dismissalHandler[2](dismissalHandler, v7);
    }
    [(CKAdaptivePresentationController *)self _cleanup];
    v5 = v7;
  }
}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 barButtonItemPresentationHandler:(id)a5 dismissalHandler:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 presentationHandler:(id)a5 dismissalHandler:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
}

- (void)_presentViewController:(id)a3 fromViewController:(id)a4 presentationHandler:(id)a5 barButtonItemPresentationHandler:(id)a6 dismissalHandler:(id)a7 animated:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  v17 = (void (**)(id, _OWORD *, id *))a5;
  v18 = (void (**)(id, id *))a6;
  id v19 = a7;
  v20 = (void (**)(void))a9;
  id v21 = [(CKAdaptivePresentationController *)self presentedViewController];

  if (v21 == v15)
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    if (v20) {
      v20[2](v20);
    }
  }
  else
  {
    v22 = [(CKAdaptivePresentationController *)self presentedViewController];

    if (v22) {
      [(CKAdaptivePresentationController *)self dismissViewControllerAnimated:0 completion:0];
    }
    [(CKAdaptivePresentationController *)self setPresentedViewController:v15];
    [(CKAdaptivePresentationController *)self setPresentationHandler:v17];
    [(CKAdaptivePresentationController *)self setDismissalHandler:v19];
    if (objc_opt_respondsToSelector()) {
      int v23 = [v15 forceWindowedPresentation];
    }
    else {
      int v23 = 0;
    }
    v24 = +[CKUIBehavior sharedBehaviors];
    if ([v24 canPresentOverKeyboard]
      && ([v15 wantsWindowedPresentation] & 1) != 0)
    {
      int v23 = 1;
    }

    char v25 = [v15 preserveModalPresentationStyle];
    id v68 = v19;
    v69 = v18;
    v26 = v16;
    if (objc_opt_respondsToSelector()) {
      int v27 = [v15 constrainToPresentingVCBounds] ^ 1;
    }
    else {
      int v27 = 1;
    }
    BOOL v67 = v9;
    if (v25)
    {
      v28 = 0;
    }
    else
    {
      [v15 setModalPresentationStyle:7];
      v28 = [v15 popoverPresentationController];
      [v28 setDelegate:self];
      if ((v23 & 1) == 0)
      {
        if (v17)
        {
          long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
          long long v72 = *MEMORY[0x1E4F1DB28];
          long long v73 = v29;
          id v71 = 0;
          v17[2](v17, &v72, &v71);
          id v30 = v71;
          [v28 setSourceView:v30];
          objc_msgSend(v28, "setSourceRect:", v72, v73);
        }
        if (v18)
        {
          id v70 = 0;
          v18[2](v18, &v70);
          id v31 = v70;
          [v28 setBarButtonItem:v31];
        }
      }
    }
    [(CKAdaptivePresentationController *)self setCurrentPresentationController:v28];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v15 setAlertDelegate:self];
    }
    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unsigned int v65 = [v15 allowsRotation];
      }
      else {
        unsigned int v65 = 0;
      }
      v66 = v17;
      if (v27)
      {
        v32 = [MEMORY[0x1E4F42D90] mainScreen];
        [v32 bounds];
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;
        v41 = v26;
      }
      else
      {
        v32 = [MEMORY[0x1E4F43058] keyWindow];
        v41 = v26;
        v42 = [v26 view];
        [v42 bounds];
        double v44 = v43;
        double v46 = v45;
        double v48 = v47;
        double v50 = v49;
        v51 = [v26 view];
        objc_msgSend(v32, "convertRect:fromView:", v51, v44, v46, v48, v50);
        double v34 = v52;
        double v36 = v53;
        double v38 = v54;
        double v40 = v55;
      }
      v56 = [CKPresentationControllerWindow alloc];
      v57 = v41;
      v58 = [v41 view];
      v59 = [v58 window];
      v60 = [v59 windowScene];
      v61 = [(CKPresentationControllerWindow *)v56 initWithWindowScene:v60 allowsRotation:v65 allowsStatusBarChanges:0 restrictedToPortraitOrientation:0];

      -[CKPresentationControllerWindow setFrame:](v61, "setFrame:", v34, v36, v38, v40);
      [(CKAdaptivePresentationController *)self setPresentationWindow:v61];
      char v62 = objc_opt_respondsToSelector();
      uint64_t v63 = 0;
      if (v62) {
        uint64_t v63 = objc_msgSend(v15, "shouldHidePresentingWindow", 0);
      }
      [(CKPresentationControllerWindow *)v61 setHidden:v63];
      v64 = [(CKPresentationControllerWindow *)v61 rootViewController];
      [v64 presentViewController:v15 animated:v67 completion:v20];

      id v16 = v57;
      v17 = v66;
    }
    else
    {
      id v16 = v26;
      [v26 presentViewController:v15 animated:v67 completion:v20];
    }
    id v19 = v68;
    v18 = v69;
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(CKAdaptivePresentationController *)self presentedViewController];
  if (!v7) {
    goto LABEL_4;
  }
  v8 = (void *)v7;
  BOOL v9 = [(CKAdaptivePresentationController *)self presentedViewController];
  v10 = [v9 presentingViewController];

  if (v10)
  {
    v11 = [(CKAdaptivePresentationController *)self presentedViewController];
    v12 = [v11 presentingViewController];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __77__CKAdaptivePresentationController_dismissViewControllerAnimated_completion___block_invoke;
    id v16 = &unk_1E5623828;
    v17 = self;
    id v18 = v6;
    [v12 dismissViewControllerAnimated:v4 completion:&v13];

    -[CKAdaptivePresentationController setPresentedViewController:](self, "setPresentedViewController:", 0, v13, v14, v15, v16);
  }
  else
  {
LABEL_4:
    [(CKAdaptivePresentationController *)self _cleanup];
  }
}

uint64_t __77__CKAdaptivePresentationController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[5];
  if (v4)
  {
    (*(void (**)(void, void))(v4 + 16))(v3[5], 0);
    objc_super v3 = *(void **)(a1 + 32);
  }

  return [v3 _cleanup];
}

- (void)_cleanup
{
  [(CKAdaptivePresentationController *)self setPresentedViewController:0];
  [(CKAdaptivePresentationController *)self setCurrentPresentationController:0];
  objc_super v3 = [(CKAdaptivePresentationController *)self presentationWindow];
  [v3 setHidden:1];

  [(CKAdaptivePresentationController *)self setPresentationWindow:0];
  [(CKAdaptivePresentationController *)self setPresentationHandler:0];

  [(CKAdaptivePresentationController *)self setDismissalHandler:0];
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
}

- (UIPopoverPresentationController)currentPresentationController
{
  return self->_currentPresentationController;
}

- (void)setCurrentPresentationController:(id)a3
{
}

- (CKPresentationControllerWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
}

- (id)presentationHandler
{
  return self->_presentationHandler;
}

- (void)setPresentationHandler:(id)a3
{
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong(&self->_presentationHandler, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
  objc_storeStrong((id *)&self->_currentPresentationController, 0);

  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

@end