@interface CKAppContainerNavigationController
- (CKAppContainerNavigationController)initWithRemoteViewController:(id)a3;
- (CKBrowserViewControllerProtocol)browserVC;
- (id)dragControllerTranscriptDelegate;
- (void)_sheetPresentationController:(id)a3 didChangeIndexOfCurrentDetent:(int64_t)a4;
- (void)closeButtonPressed:(id)a3;
- (void)requestPresentationStyleExpanded:(BOOL)a3;
- (void)setBrowserVC:(id)a3;
- (void)transitionBrowserToLargeDetent;
- (void)transitionBrowserToMediumDetent;
@end

@implementation CKAppContainerNavigationController

- (CKAppContainerNavigationController)initWithRemoteViewController:(id)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKAppContainerNavigationController;
  v6 = [(CKAppContainerNavigationController *)&v32 initWithRootViewController:v5];
  v7 = v6;
  if (v6)
  {
    [(CKAppContainerNavigationController *)v6 setModalPresentationStyle:2];
    v8 = [(CKAppContainerNavigationController *)v7 presentationController];
    v9 = [MEMORY[0x1E4F42DE8] mediumDetent];
    v34[0] = v9;
    v10 = [MEMORY[0x1E4F42DE8] largeDetent];
    v34[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    [v8 setDetents:v11];

    [v8 setDelegate:v7];
    [v8 setPrefersGrabberVisible:1];
    v12 = objc_alloc_init(CKAppContainerTitleView);
    v13 = [v5 balloonPlugin];
    v14 = [(CKAppContainerNavigationController *)v7 traitCollection];
    v15 = objc_msgSend(v13, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v14, "userInterfaceStyle"));

    [(CKAppContainerTitleView *)v12 setIconImage:v15];
    v16 = [v5 balloonPlugin];
    v17 = [v16 browserDisplayName];
    v18 = [(CKAppContainerTitleView *)v12 label];
    [v18 setText:v17];

    v19 = [(CKAppContainerTitleView *)v12 closeButton];
    [v19 addTarget:v7 action:sel_closeButtonPressed_ forEvents:0x2000];

    v20 = [v5 navigationItem];
    [v20 setTitleView:v12];

    v21 = [(CKAppContainerNavigationController *)v7 navigationBar];
    v22 = objc_opt_new();
    [v21 setShadowImage:v22];

    v23 = [(CKAppContainerNavigationController *)v7 navigationBar];
    [v23 setTranslucent:0];

    uint64_t v24 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    v25 = [(CKAppContainerNavigationController *)v7 view];
    [v25 setBackgroundColor:v24];

    [v5 setSendDelegate:v7];
    objc_storeStrong((id *)&v7->_browserVC, a3);
    [(CKAppContainerNavigationController *)v7 setModalPresentationStyle:2];
    v26 = [(CKAppContainerNavigationController *)v7 presentationController];
    objc_opt_class();
    LOBYTE(v24) = objc_opt_isKindOfClass();

    if (v24)
    {
      v27 = [(CKAppContainerNavigationController *)v7 presentationController];
      v28 = [MEMORY[0x1E4F42DE8] mediumDetent];
      v33[0] = v28;
      v29 = [MEMORY[0x1E4F42DE8] largeDetent];
      v33[1] = v29;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      [v27 setDetents:v30];

      [v27 setDelegate:v7];
      [v27 setPrefersGrabberVisible:1];
    }
    [(CKAppContainerNavigationController *)v7 transitionBrowserToMediumDetent];
  }
  return v7;
}

- (void)closeButtonPressed:(id)a3
{
}

- (void)_sheetPresentationController:(id)a3 didChangeIndexOfCurrentDetent:(int64_t)a4
{
  if (a4 == 1) {
    [(CKAppContainerNavigationController *)self transitionBrowserToLargeDetent];
  }
  else {
    [(CKAppContainerNavigationController *)self transitionBrowserToMediumDetent];
  }
}

- (void)transitionBrowserToLargeDetent
{
  [(CKAppContainerNavigationController *)self setNavigationBarHidden:0];
  -[CKBrowserViewControllerProtocol setAdditionalSafeAreaInsets:](self->_browserVC, "setAdditionalSafeAreaInsets:", 0.0, 0.0, 0.0, 0.0);
  v3 = [(CKAppContainerNavigationController *)self browserVC];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CKAppContainerNavigationController *)self browserVC];
    [v5 viewWillTransitionToExpandedPresentation];
  }
  v6 = [(CKAppContainerNavigationController *)self browserVC];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CKAppContainerNavigationController *)self browserVC];
    [v8 viewDidTransitionToExpandedPresentation];
  }
}

- (void)transitionBrowserToMediumDetent
{
  [(CKAppContainerNavigationController *)self setNavigationBarHidden:1];
  -[CKBrowserViewControllerProtocol setAdditionalSafeAreaInsets:](self->_browserVC, "setAdditionalSafeAreaInsets:", 15.0, 0.0, 0.0, 0.0);
  v3 = [(CKAppContainerNavigationController *)self browserVC];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CKAppContainerNavigationController *)self browserVC];
    [v5 viewWillTransitionToCompactPresentation];
  }
  v6 = [(CKAppContainerNavigationController *)self browserVC];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CKAppContainerNavigationController *)self browserVC];
    [v8 viewDidTransitionToCompactPresentation];
  }
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKAppContainerNavigationController *)self presentationController];
  v6 = v5;
  if (v3)
  {
    [v5 setSelectedDetentIdentifier:*MEMORY[0x1E4F43CE8]];
    [(CKAppContainerNavigationController *)self transitionBrowserToLargeDetent];
  }
  else
  {
    [v5 setSelectedDetentIdentifier:*MEMORY[0x1E4F43CF0]];
    [(CKAppContainerNavigationController *)self transitionBrowserToMediumDetent];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CKAppContainerNavigationController_requestPresentationStyleExpanded___block_invoke;
  v7[3] = &unk_1E5620C40;
  v7[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:0.5];
}

void __71__CKAppContainerNavigationController_requestPresentationStyleExpanded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  v1 = [v2 window];
  [v1 layoutIfNeeded];
}

- (CKBrowserViewControllerProtocol)browserVC
{
  return self->_browserVC;
}

- (void)setBrowserVC:(id)a3
{
}

- (void).cxx_destruct
{
}

@end