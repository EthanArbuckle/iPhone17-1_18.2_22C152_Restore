@interface AXHearingAidDisplayController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (HACCShortcutViewController)moduleUIController;
- (HearingAidUIServer)parentController;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)dismissWithCompletion:(id)a3;
- (void)loadView;
- (void)setModuleUIController:(id)a3;
- (void)setParentController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXHearingAidDisplayController

- (void)dealloc
{
  [(AXHearingAidDisplayController *)self setModuleUIController:0];
  v3.receiver = self;
  v3.super_class = (Class)AXHearingAidDisplayController;
  [(AXHearingAidDisplayController *)&v3 dealloc];
}

- (void)dismissWithCompletion:(id)a3
{
  v4 = (void *)MEMORY[0x263F47528];
  id v5 = a3;
  v6 = [v4 sharedInstance];
  [v6 unregisterUpdateListener:self];

  [(AXHearingAidDisplayController *)self dismissViewControllerWithTransition:17 completion:v5];
  v7 = [(AXHearingAidDisplayController *)self moduleUIController];
  v8 = [v7 view];
  [v8 removeFromSuperview];

  v9 = [(AXHearingAidDisplayController *)self moduleUIController];
  [v9 removeFromParentViewController];

  [(AXHearingAidDisplayController *)self setModuleUIController:0];
  id v11 = [(AXHearingAidDisplayController *)self view];
  v10 = [v11 window];
  [v10 setHidden:1];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXHearingAidDisplayController;
  [(AXHearingAidDisplayController *)&v3 viewWillAppear:a3];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)AXHearingAidDisplayController;
  [(AXHearingAidDisplayController *)&v4 loadView];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F474D8]) initWithDelegate:self];
  [v3 setDelegate:self];
  [(AXHearingAidDisplayController *)self setModuleUIController:v3];
}

- (void)didMoveToParentViewController:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AXHearingAidDisplayController;
  [(AXHearingAidDisplayController *)&v12 didMoveToParentViewController:a3];
  uint64_t v4 = [(AXHearingAidDisplayController *)self parentViewController];
  if (v4)
  {
    id v5 = (void *)v4;
    v6 = [(AXHearingAidDisplayController *)self presentedViewController];

    if (!v6)
    {
      v7 = [(AXHearingAidDisplayController *)self moduleUIController];

      if (!v7)
      {
        v8 = (void *)[objc_alloc(MEMORY[0x263F474D8]) initWithDelegate:self];
        [v8 setDelegate:self];
        [(AXHearingAidDisplayController *)self setModuleUIController:v8];
      }
      v9 = [(AXHearingAidDisplayController *)self moduleUIController];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __63__AXHearingAidDisplayController_didMoveToParentViewController___block_invoke;
      v11[3] = &unk_2650A2318;
      v11[4] = self;
      [(AXHearingAidDisplayController *)self presentViewController:v9 animated:1 completion:v11];
    }
  }
  v10 = [(AXHearingAidDisplayController *)self moduleUIController];
  [v10 setDelegate:self];
}

void __63__AXHearingAidDisplayController_didMoveToParentViewController___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE68];
  id v3 = [*(id *)(a1 + 32) moduleUIController];
  v2 = [v3 view];
  UIAccessibilityPostNotification(v1, v2);
}

- (HearingAidUIServer)parentController
{
  return self->_parentController;
}

- (void)setParentController:(id)a3
{
  self->_parentController = (HearingAidUIServer *)a3;
}

- (HACCShortcutViewController)moduleUIController
{
  return self->_moduleUIController;
}

- (void)setModuleUIController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end