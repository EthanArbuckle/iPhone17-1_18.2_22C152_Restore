@interface DMCEnrollmentESSOApplicationDisclosureViewController
- (DMCEnrollmentESSOApplicationDisclosureViewController)initWithDelegate:(id)a3 lockupRequest:(id)a4 lockupViewGroup:(id)a5 requiredEntitlements:(id)a6;
- (DMCEnrollmentESSOApplicationDisclosureViewControllerDelegate)delegate;
- (NSArray)requiredEntitlements;
- (void)_setupNavigationBar;
- (void)leftBarButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequiredEntitlements:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DMCEnrollmentESSOApplicationDisclosureViewController

- (DMCEnrollmentESSOApplicationDisclosureViewController)initWithDelegate:(id)a3 lockupRequest:(id)a4 lockupViewGroup:(id)a5 requiredEntitlements:(id)a6
{
  v32[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = DMCLocalizedString();
  v31.receiver = self;
  v31.super_class = (Class)DMCEnrollmentESSOApplicationDisclosureViewController;
  v15 = [(DMCEnrollmentTemplateTableViewController *)&v31 initWithIconNames:&unk_26D44B050 title:v14 subTitle:0];

  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v10);
    uint64_t v16 = [v13 copy];
    requiredEntitlements = v15->_requiredEntitlements;
    v15->_requiredEntitlements = (NSArray *)v16;

    v18 = [DMCEnrollmentTableViewTextCell alloc];
    v19 = DMCLocalizedString();
    v20 = [(DMCEnrollmentTableViewTextCell *)v18 initWithText:v19 bold:0];
    v32[0] = v20;
    v21 = [[DMCEnrollmentTableViewAppLockupCell alloc] initWithLockupRequest:v11 lockupViewGroup:v12 presentingViewController:v15];
    v32[1] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    [(DMCEnrollmentTemplateTableViewController *)v15 addCellData:v22 animated:0];

    v23 = [DMCEnrollmentInstallAppButtonView alloc];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __124__DMCEnrollmentESSOApplicationDisclosureViewController_initWithDelegate_lockupRequest_lockupViewGroup_requiredEntitlements___block_invoke;
    v29[3] = &unk_2645E90A0;
    v30 = v15;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __124__DMCEnrollmentESSOApplicationDisclosureViewController_initWithDelegate_lockupRequest_lockupViewGroup_requiredEntitlements___block_invoke_3;
    v27[3] = &unk_2645E90A0;
    v24 = v30;
    v28 = v24;
    v25 = [(DMCEnrollmentInstallAppButtonView *)v23 initWithLockupRequest:v11 lockupViewGroup:v12 beginInstallationHandler:v29 completionHandler:v27];
    [(DMCEnrollmentTemplateTableViewController *)v24 addBottomView:v25];
  }
  return v15;
}

void __124__DMCEnrollmentESSOApplicationDisclosureViewController_initWithDelegate_lockupRequest_lockupViewGroup_requiredEntitlements___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__DMCEnrollmentESSOApplicationDisclosureViewController_initWithDelegate_lockupRequest_lockupViewGroup_requiredEntitlements___block_invoke_2;
  block[3] = &unk_2645E90A0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __124__DMCEnrollmentESSOApplicationDisclosureViewController_initWithDelegate_lockupRequest_lockupViewGroup_requiredEntitlements___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 setUserInteractionEnabled:0];
}

void __124__DMCEnrollmentESSOApplicationDisclosureViewController_initWithDelegate_lockupRequest_lockupViewGroup_requiredEntitlements___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__DMCEnrollmentESSOApplicationDisclosureViewController_initWithDelegate_lockupRequest_lockupViewGroup_requiredEntitlements___block_invoke_4;
  block[3] = &unk_2645E90A0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __124__DMCEnrollmentESSOApplicationDisclosureViewController_initWithDelegate_lockupRequest_lockupViewGroup_requiredEntitlements___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 setUserInteractionEnabled:1];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 ESSOApplicationDisclosurViewController:*(void *)(a1 + 32) didReceiveUserAction:1 error:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentESSOApplicationDisclosureViewController;
  [(DMCEnrollmentTemplateTableViewController *)&v4 viewWillAppear:a3];
  if (([(DMCEnrollmentESSOApplicationDisclosureViewController *)self isBeingPresented] & 1) != 0
    || [(DMCEnrollmentESSOApplicationDisclosureViewController *)self isMovingToParentViewController])
  {
    [(DMCEnrollmentESSOApplicationDisclosureViewController *)self _setupNavigationBar];
  }
  [(DMCEnrollmentESSOApplicationDisclosureViewController *)self setModalInPresentation:1];
}

- (void)_setupNavigationBar
{
}

- (void)leftBarButtonTapped:(id)a3
{
  id v4 = [(DMCEnrollmentESSOApplicationDisclosureViewController *)self delegate];
  [v4 ESSOApplicationDisclosurViewController:self didReceiveUserAction:0 error:0];
}

- (DMCEnrollmentESSOApplicationDisclosureViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCEnrollmentESSOApplicationDisclosureViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)requiredEntitlements
{
  return self->_requiredEntitlements;
}

- (void)setRequiredEntitlements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredEntitlements, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end