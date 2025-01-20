@interface HUAddGuestViewController
- (BOOL)requiresPresentingViewControllerDismissal;
- (HUAddGuestViewController)initWithPinCodeManager:(id)a3 home:(id)a4;
- (HUPinCodeDetailsViewController)pinCodeDetailsController;
- (HUPresentationDelegate)presentationDelegate;
- (UIBarButtonItem)addButtonItem;
- (UIBarButtonItem)saveButtonItem;
- (void)saveButtonPressed:(id)a3;
- (void)setAddButtonItem:(id)a3;
- (void)setPinCodeDetailsController:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setSaveButtonItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUAddGuestViewController

- (HUAddGuestViewController)initWithPinCodeManager:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HUPinCodeDetailsViewController alloc] initWithItem:0 pinCodeManager:v7 home:v6];

  v9 = _HULocalizedStringWithDefaultValue(@"HUAddGuestPinCodeTitle", @"HUAddGuestPinCodeTitle", 1);
  v12.receiver = self;
  v12.super_class = (Class)HUAddGuestViewController;
  v10 = [(HUItemTableOBWelcomeController *)&v12 initWithTitle:v9 detailText:0 icon:0 contentLayout:3 itemTableViewController:v8];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_pinCodeDetailsController, v8);
    [(HUPinCodeDetailsViewController *)v10->_pinCodeDetailsController setDelegate:v10];
  }

  return v10;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)HUAddGuestViewController;
  [(HUItemTableOBWelcomeController *)&v11 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  v4 = _HULocalizedStringWithDefaultValue(@"HUPinCodeAddButtonTitle", @"HUPinCodeAddButtonTitle", 1);
  v5 = (void *)[v3 initWithTitle:v4 style:2 target:self action:sel_saveButtonPressed_];
  [(HUAddGuestViewController *)self setSaveButtonItem:v5];

  id v6 = [(HUAddGuestViewController *)self saveButtonItem];
  [v6 setEnabled:0];

  id v7 = [(HUAddGuestViewController *)self saveButtonItem];
  v8 = [(OBBaseWelcomeController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  v9 = [(OBBaseWelcomeController *)self navigationItem];
  v10 = [v9 rightBarButtonItem];
  [v10 setAccessibilityIdentifier:@"Home.Locks.Guest.Pincode.Add"];
}

- (UIBarButtonItem)addButtonItem
{
  v2 = [(OBBaseWelcomeController *)self navigationItem];
  id v3 = [v2 rightBarButtonItem];

  return (UIBarButtonItem *)v3;
}

- (void)setAddButtonItem:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(HUAddGuestViewController *)self saveButtonItem];
  }
  id v6 = v4;
  v5 = [(OBBaseWelcomeController *)self navigationItem];
  [v5 setRightBarButtonItem:v6];
}

- (void)saveButtonPressed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HUAddGuestViewController *)self pinCodeDetailsController];
  id v6 = [v5 commitNewPinCode];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__HUAddGuestViewController_saveButtonPressed___block_invoke;
  v8[3] = &unk_1E6389BC8;
  objc_copyWeak(&v9, &location);
  id v7 = (id)[v6 addCompletionBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__HUAddGuestViewController_saveButtonPressed___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRequiresPresentingViewControllerDismissal:1];
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F69110] sharedHandler];
    uint64_t v7 = *MEMORY[0x1E4F68750];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__HUAddGuestViewController_saveButtonPressed___block_invoke_2;
    v10[3] = &unk_1E63850E0;
    id v11 = v4;
    id v12 = WeakRetained;
    [v6 handleError:v11 operationType:v7 options:0 retryBlock:0 cancelBlock:v10];
  }
  else
  {
    v8 = [WeakRetained presentationDelegate];
    id v9 = (id)[v8 finishPresentation:WeakRetained animated:1];
  }
}

void __46__HUAddGuestViewController_saveButtonPressed___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F68410]])
  {
    uint64_t v2 = [*(id *)(a1 + 32) code];

    if (v2 != 80) {
      return;
    }
    id v4 = [*(id *)(a1 + 40) presentationDelegate];
    id v3 = (id)[v4 finishPresentation:*(void *)(a1 + 40) animated:1];
  }
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (HUPinCodeDetailsViewController)pinCodeDetailsController
{
  return self->_pinCodeDetailsController;
}

- (void)setPinCodeDetailsController:(id)a3
{
}

- (UIBarButtonItem)saveButtonItem
{
  return self->_saveButtonItem;
}

- (void)setSaveButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveButtonItem, 0);
  objc_storeStrong((id *)&self->_pinCodeDetailsController, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end