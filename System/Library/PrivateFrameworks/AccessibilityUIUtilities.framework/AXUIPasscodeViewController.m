@interface AXUIPasscodeViewController
- (AXUIPasscodeViewController)initWithCoder:(id)a3;
- (AXUIPasscodeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AXUIPasscodeViewController)initWithPresentationStyle:(int)a3 forSetup:(BOOL)a4 pinLength:(unint64_t)a5;
- (AXUIPasscodeViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldAllowMultipleEntryAttempts;
- (BOOL)_shouldShowCancelButton;
- (BOOL)asynchronouslyCheckedPinWasValid;
- (BOOL)isNumericPIN;
- (BOOL)isPasscodeViewVisible;
- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)requiresKeyboard;
- (BOOL)simplePIN;
- (BOOL)switchFromKeypadToKeyboard;
- (BOOL)useProgressiveDelays;
- (NSString)passcode;
- (NSString)pinViewTitle;
- (UINavigationController)hostingNavigationController;
- (UIViewController)presentorViewController;
- (id)stringsBundle;
- (int)pinLength;
- (int)presentationStyle;
- (int64_t)_activeInterfaceOrientation;
- (unint64_t)supportedInterfaceOrientations;
- (void)_didFinishDismissingPasscodeViewWithReason:(int64_t)a3;
- (void)_dismissPasscodeViewAnimated:(BOOL)a3 withReason:(int64_t)a4;
- (void)_notifyDelegateOfPasscodeViewDismissalWithReason:(int64_t)a3;
- (void)_notifyDelegateOfPasscodeViewVisibilityChange;
- (void)_presentPasscodeViewWithParentViewController:(id)a3 animated:(BOOL)a4;
- (void)_slidePasscodeField;
- (void)_updateErrorTextAndFailureCount:(BOOL)a3;
- (void)cancelButtonTapped;
- (void)didAcceptEnteredPIN;
- (void)didAcceptSetPIN;
- (void)loadView;
- (void)pinEntered:(id)a3;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAsynchronouslyCheckedPinWasValid:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHostingNavigationController:(id)a3;
- (void)setPasscode:(id)a3;
- (void)setPasscodeViewVisible:(BOOL)a3;
- (void)setPinLength:(int)a3;
- (void)setPinViewTitle:(id)a3;
- (void)setPresentationStyle:(int)a3;
- (void)setPresentorViewController:(id)a3;
@end

@implementation AXUIPasscodeViewController

- (AXUIPasscodeViewController)initWithPresentationStyle:(int)a3 forSetup:(BOOL)a4 pinLength:(unint64_t)a5
{
  int v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)AXUIPasscodeViewController;
  v8 = [(AXUIPasscodeViewController *)&v17 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    if (v6) {
      int v10 = 0;
    }
    else {
      int v10 = 3;
    }
    uint64_t v11 = (int)*MEMORY[0x1E4F92ED0];
    *(_DWORD *)((char *)&v8->super.super.super.super.super.super.isa + v11) = v10;
    if (v6) {
      *(_DWORD *)((char *)&v8->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92ED8]) = 1;
    }
    v12 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    [v12 setProperty:v9 forKey:*MEMORY[0x1E4F93258]];
    v13 = [NSNumber numberWithInt:*(unsigned int *)((char *)&v9->super.super.super.super.super.super.isa + v11)];
    [v12 setProperty:v13 forKey:@"mode"];

    [(DevicePINController *)v9 setSpecifier:v12];
    [(AXUIPasscodeViewController *)v9 setPresentationStyle:v7];
    v14 = [[AXUIPasscodePaneContainingNavigationController alloc] initWithRootViewController:v9];
    [(AXUIPasscodePaneContainingNavigationController *)v14 setDelegate:v9];
    [(AXUIPasscodeViewController *)v9 setHostingNavigationController:v14];
    if (v7)
    {
      if (v7 == 1)
      {
        [(AXUIPasscodeViewController *)v9 preferredContentSize];
        -[AXUIPasscodeViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
        [(AXUIPasscodePaneContainingNavigationController *)v14 setModalPresentationStyle:2];
        v15 = [(AXUIPasscodePaneContainingNavigationController *)v14 popoverPresentationController];
        [v15 setPermittedArrowDirections:0];
        [v15 setDelegate:v9];
      }
    }
    else
    {
      [(AXUIPasscodePaneContainingNavigationController *)v14 setModalPresentationStyle:0];
    }
    v9->_pinLength = v5;
  }
  return v9;
}

- (AXUIPasscodeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AXUIPasscodeViewController;
  v4 = [(AXUIPasscodeViewController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {

  }
  return 0;
}

- (AXUIPasscodeViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXUIPasscodeViewController;
  v3 = [(AXUIPasscodeViewController *)&v5 initWithCoder:a3];
  if (v3) {

  }
  return 0;
}

- (void)loadView
{
  v3 = [MEMORY[0x1E4FB1618] labelColor];
  v4 = [MEMORY[0x1E4F92E40] appearance];
  [v4 setTextColor:v3];

  v19.receiver = self;
  v19.super_class = (Class)AXUIPasscodeViewController;
  [(DevicePINController *)&v19 loadView];
  objc_super v5 = [(AXUIPasscodeViewController *)self view];
  objc_super v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  [v5 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = -[DevicePINPane initWithFrame:]([GuidedAccessDevicePINPane alloc], "initWithFrame:", v7, v9, v11, v13);
  v16 = [v5 backgroundColor];
  [(GuidedAccessDevicePINPane *)v15 setBackgroundColor:v16];

  [(PSEditingPane *)v15 setDelegate:self];
  [(DevicePINController *)self setPane:v15];
  objc_super v17 = [(AXUIPasscodeViewController *)self pinViewTitle];

  if (v17)
  {
    v18 = [(AXUIPasscodeViewController *)self pinViewTitle];
    [(DevicePINPane *)v15 setTitle:v18];
  }
  -[GuidedAccessDevicePINPane setFrame:](v15, "setFrame:", v8, v10, v12, v14);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_presentPasscodeViewWithParentViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  [(AXUIPasscodeViewController *)self setPresentorViewController:v5];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__AXUIPasscodeViewController__presentPasscodeViewWithParentViewController_animated___block_invoke;
  aBlock[3] = &unk_1E649BED8;
  aBlock[4] = self;
  objc_super v6 = _Block_copy(aBlock);
  double v7 = [(AXUIPasscodeViewController *)self navigationItem];
  [v7 setHidesBackButton:1];
  if (![(AXUIPasscodeViewController *)self _shouldShowCancelButton])
  {
    [v7 setRightBarButtonItem:0];
    [v7 setLeftBarButtonItem:0];
  }
  if ([(AXUIPasscodeViewController *)self presentationStyle] == 1)
  {
    double v8 = [v5 view];
    double v9 = [(AXUIPasscodeViewController *)self hostingNavigationController];
    double v10 = [v9 popoverPresentationController];

    [v10 setSourceView:v8];
    [v8 bounds];
    objc_msgSend(v10, "setSourceRect:");
  }
  double v11 = [(AXUIPasscodeViewController *)self hostingNavigationController];
  [v5 presentViewController:v11 animated:1 completion:v6];
}

uint64_t __84__AXUIPasscodeViewController__presentPasscodeViewWithParentViewController_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPasscodeViewVisible:1];
  UIAccessibilityNotifications v2 = *MEMORY[0x1E4FB24B0];
  uint64_t v3 = [*(id *)(a1 + 32) pane];
  UIAccessibilityPostNotification(v2, v3);

  v4 = *(void **)(a1 + 32);
  return [v4 _notifyDelegateOfPasscodeViewVisibilityChange];
}

- (void)_dismissPasscodeViewAnimated:(BOOL)a3 withReason:(int64_t)a4
{
  BOOL v5 = a3;
  double v7 = [(AXUIPasscodeViewController *)self presentorViewController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__AXUIPasscodeViewController__dismissPasscodeViewAnimated_withReason___block_invoke;
  v8[3] = &unk_1E649C310;
  v8[4] = self;
  v8[5] = a4;
  [v7 dismissViewControllerAnimated:v5 completion:v8];
}

uint64_t __70__AXUIPasscodeViewController__dismissPasscodeViewAnimated_withReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishDismissingPasscodeViewWithReason:*(void *)(a1 + 40)];
}

- (void)_didFinishDismissingPasscodeViewWithReason:(int64_t)a3
{
  if ([(AXUIPasscodeViewController *)self presentationStyle] == 1)
  {
    BOOL v5 = [(AXUIPasscodeViewController *)self hostingNavigationController];
    objc_super v6 = [v5 popoverPresentationController];
    [v6 setDelegate:0];
  }
  double v7 = [(AXUIPasscodeViewController *)self hostingNavigationController];
  [v7 setDelegate:0];

  [(AXUIPasscodeViewController *)self setHostingNavigationController:0];
  [(AXUIPasscodeViewController *)self _notifyDelegateOfPasscodeViewDismissalWithReason:a3];
  [(AXUIPasscodeViewController *)self setPresentorViewController:0];
  [(AXUIPasscodeViewController *)self setPasscodeViewVisible:0];
  [(AXUIPasscodeViewController *)self _notifyDelegateOfPasscodeViewVisibilityChange];
}

- (void)_notifyDelegateOfPasscodeViewVisibilityChange
{
  id v3 = [(AXUIPasscodeViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "passcodeViewController:passcodeViewIsVisible:", self, -[AXUIPasscodeViewController isPasscodeViewVisible](self, "isPasscodeViewVisible"));
  }
}

- (void)_notifyDelegateOfPasscodeViewDismissalWithReason:(int64_t)a3
{
  id v5 = [(AXUIPasscodeViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 passcodeViewController:self wasDismissedWithReason:a3];
  }
}

- (BOOL)_shouldShowCancelButton
{
  id v3 = [(AXUIPasscodeViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 shouldShowCancelButtonForPasscodeViewController:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (int64_t)_activeInterfaceOrientation
{
  id v3 = [(AXUIPasscodeViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v4 = [v3 activeInterfaceOrientationForPasscodeViewController:self];
  }
  else
  {
    id v5 = [(AXUIPasscodeViewController *)self view];
    objc_super v6 = [v5 window];
    int64_t v4 = [v6 interfaceOrientation];
  }
  return v4;
}

- (BOOL)_shouldAllowMultipleEntryAttempts
{
  id v3 = [(AXUIPasscodeViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 shouldAllowMultipleEntryAttemptsForPasscodeViewController:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)stringsBundle
{
  UIAccessibilityNotifications v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (BOOL)switchFromKeypadToKeyboard
{
  return 0;
}

- (BOOL)useProgressiveDelays
{
  return 0;
}

- (BOOL)requiresKeyboard
{
  return 0;
}

- (BOOL)isNumericPIN
{
  return 1;
}

- (BOOL)simplePIN
{
  return 1;
}

- (void)pinEntered:(id)a3
{
  id v4 = a3;
  [(AXUIPasscodeViewController *)self setAsynchronouslyCheckedPinWasValid:0];
  if ([(DevicePINController *)self mode] == 3)
  {
    id v5 = [(AXUIPasscodeViewController *)self delegate];
    uint64_t v6 = [MEMORY[0x1E4FB1438] isRunningInStoreDemoMode];
    if ([(DevicePINController *)self mode] == 3 && (v6 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __41__AXUIPasscodeViewController_pinEntered___block_invoke;
      v9[3] = &unk_1E649C338;
      v9[4] = self;
      id v10 = v4;
      [v5 passcodeViewController:self isPasscode:v10 correctWithCompletionHandler:v9];
    }
    else
    {
      [(AXUIPasscodeViewController *)self setAsynchronouslyCheckedPinWasValid:v6];
      v8.receiver = self;
      v8.super_class = (Class)AXUIPasscodeViewController;
      [(DevicePINController *)&v8 pinEntered:v4];
      [(AXUIPasscodeViewController *)self setAsynchronouslyCheckedPinWasValid:0];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AXUIPasscodeViewController;
    [(DevicePINController *)&v7 pinEntered:v4];
  }
}

uint64_t __41__AXUIPasscodeViewController_pinEntered___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setAsynchronouslyCheckedPinWasValid:a2];
  uint64_t v3 = *(void *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)AXUIPasscodeViewController;
  objc_msgSendSuper2(&v5, sel_pinEntered_, v3);
  return [*(id *)(a1 + 32) setAsynchronouslyCheckedPinWasValid:0];
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  id v4 = a3;
  BOOL v5 = [v4 length] == 6 || objc_msgSend(v4, "length") == 4;

  return v5;
}

- (void)_slidePasscodeField
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92EF8]);
  BOOL v4 = [(AXUIPasscodeViewController *)self simplePIN];
  BOOL v5 = [(AXUIPasscodeViewController *)self requiresKeyboard];
  [v3 slideToNewPasscodeField:v4 requiresKeyboard:v5 numericOnly:1];
}

- (void)_updateErrorTextAndFailureCount:(BOOL)a3
{
  BOOL v3 = a3;
  if (*(_DWORD *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92ED0]) == 3
    && ![(AXUIPasscodeViewController *)self _shouldAllowMultipleEntryAttempts])
  {
    [(AXUIPasscodeViewController *)self _dismissPasscodeViewAnimated:1 withReason:1];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXUIPasscodeViewController;
    [(DevicePINController *)&v5 _updateErrorTextAndFailureCount:v3];
  }
}

- (void)cancelButtonTapped
{
}

- (void)didAcceptEnteredPIN
{
}

- (void)didAcceptSetPIN
{
  id v4 = [(AXUIPasscodeViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(AXUIPasscodeViewController *)self passcode];
    [v4 passcodeViewController:self didFinishSettingUpPasscode:v3];
  }
  [(AXUIPasscodeViewController *)self _dismissPasscodeViewAnimated:1 withReason:4];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v11 = [(AXUIPasscodeViewController *)self presentorViewController];
  uint64_t v6 = [v11 view];
  [v6 bounds];
  a4->origin.x = v7;
  a4->origin.y = v8;
  a4->size.width = v9;
  a4->size.height = v10;
}

- (int)pinLength
{
  return self->_pinLength;
}

- (void)setPinLength:(int)a3
{
  self->_pinLength = a3;
}

- (AXUIPasscodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXUIPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPasscodeViewVisible
{
  return self->_asynchronouslyCheckedPinWasValid;
}

- (void)setPasscodeViewVisible:(BOOL)a3
{
  self->_asynchronouslyCheckedPinWasValid = a3;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int)a3
{
  self->_presentationStyle = a3;
}

- (UIViewController)presentorViewController
{
  return self->_presentorViewController;
}

- (void)setPresentorViewController:(id)a3
{
}

- (UINavigationController)hostingNavigationController
{
  return self->_hostingNavigationController;
}

- (void)setHostingNavigationController:(id)a3
{
}

- (NSString)pinViewTitle
{
  return self->_pinViewTitle;
}

- (void)setPinViewTitle:(id)a3
{
}

- (BOOL)asynchronouslyCheckedPinWasValid
{
  return *(&self->_asynchronouslyCheckedPinWasValid + 1);
}

- (void)setAsynchronouslyCheckedPinWasValid:(BOOL)a3
{
  *(&self->_asynchronouslyCheckedPinWasValid + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinViewTitle, 0);
  objc_storeStrong((id *)&self->_hostingNavigationController, 0);
  objc_storeStrong((id *)&self->_presentorViewController, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end