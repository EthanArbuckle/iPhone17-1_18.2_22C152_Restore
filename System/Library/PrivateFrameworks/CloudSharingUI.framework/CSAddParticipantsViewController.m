@interface CSAddParticipantsViewController
- (BOOL)commitEditingAndReturnError:(id *)a3;
- (CKContainerSetupInfo)containerSetupInfo;
- (CKShare)share;
- (CSAddParticipantsViewController)initWithCKShare:(id)a3 containerSetupInfo:(id)a4 fileURL:(id)a5 collaborationOptionsGroups:(id)a6 headerImageData:(id)a7 headerTitle:(id)a8 loadingText:(id)a9 supplementaryText:(id)a10 primaryButtonText:(id)a11 secondaryButtonText:(id)a12;
- (CSAddParticipantsViewControllerDelegate)delegate;
- (CSAddressingViewModel)addressingViewModel;
- (NSArray)collaborationOptionsGroups;
- (NSURL)fileURL;
- (_UIResilientRemoteViewContainerViewController)childViewController;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)dismissViewControllerWithError:(id)a3 shareURL:(id)a4 ckShare:(id)a5;
- (void)embedViewController:(id)a3;
- (void)setAddressingViewModel:(id)a3;
- (void)setChildViewController:(id)a3;
- (void)setCollaborationOptionsGroups:(id)a3;
- (void)setContainerSetupInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setShare:(id)a3;
- (void)showContactPickerFromSourceRect:(id)a3;
- (void)viewDidLoad;
@end

@implementation CSAddParticipantsViewController

- (CSAddParticipantsViewController)initWithCKShare:(id)a3 containerSetupInfo:(id)a4 fileURL:(id)a5 collaborationOptionsGroups:(id)a6 headerImageData:(id)a7 headerTitle:(id)a8 loadingText:(id)a9 supplementaryText:(id)a10 primaryButtonText:(id)a11 secondaryButtonText:(id)a12
{
  id v38 = a3;
  id v33 = a4;
  id v37 = a4;
  id obj = a5;
  id v18 = a5;
  id v19 = a6;
  id v36 = v18;
  id v35 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v24 = v20;
  id v25 = a11;
  id v26 = a12;
  v39.receiver = self;
  v39.super_class = (Class)CSAddParticipantsViewController;
  v27 = [(CSAddParticipantsViewController *)&v39 initWithNibName:0 bundle:0];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_share, a3);
    objc_storeStrong((id *)&v28->_collaborationOptionsGroups, v19);
    v29 = [[CSAddressingViewModel alloc] initWithHeaderImageData:v24 headerTitle:v21 loadingText:v22 supplementaryText:v23 userInfoText:0 primaryButtonText:v25 secondaryButtonText:v26];
    addressingViewModel = v28->_addressingViewModel;
    v28->_addressingViewModel = v29;

    objc_storeStrong((id *)&v28->_fileURL, obj);
    objc_storeStrong((id *)&v28->_containerSetupInfo, v33);
    [(CSAddParticipantsViewController *)v28 setTitle:v21];
  }

  return v28;
}

- (void)viewDidLoad
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21809D000, a2, OS_LOG_TYPE_ERROR, "No CloudSharingAddParticipantsViewService extension: %@", (uint8_t *)&v2, 0xCu);
}

void __46__CSAddParticipantsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [v14 serviceViewControllerProxy];
    [v14 setPublicController:WeakRetained];
    v5 = [WeakRetained share];

    if (v5)
    {
      v6 = [WeakRetained share];
      [v4 setShare:v6];
    }
    v7 = [WeakRetained collaborationOptionsGroups];

    if (v7)
    {
      v8 = [WeakRetained collaborationOptionsGroups];
      [v4 setCollaborationOptionsGroups:v8];
    }
    v9 = [WeakRetained addressingViewModel];
    [v4 setAddressingViewModel:v9];

    v10 = [WeakRetained fileURL];

    if (v10)
    {
      v11 = [WeakRetained fileURL];
      [v4 setFileURL:v11];
    }
    v12 = [WeakRetained containerSetupInfo];

    if (v12)
    {
      v13 = [WeakRetained containerSetupInfo];
      [v4 setContainerSetupInfo:v13];
    }
  }
}

uint64_t __46__CSAddParticipantsViewController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)embedViewController:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [v18 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:1];

  v5 = [v18 view];
  [v5 setAutoresizingMask:18];

  v6 = [(CSAddParticipantsViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [v18 view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  [(CSAddParticipantsViewController *)self addChildViewController:v18];
  v16 = [(CSAddParticipantsViewController *)self view];
  v17 = [v18 view];
  [v16 addSubview:v17];

  [v18 didMoveToParentViewController:self];
}

- (void)dismissViewControllerWithError:(id)a3 shareURL:(id)a4 ckShare:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  id v26 = __83__CSAddParticipantsViewController_dismissViewControllerWithError_shareURL_ckShare___block_invoke;
  v27 = &unk_2642FEED8;
  id v28 = v8;
  v29 = self;
  id v30 = v9;
  id v31 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  double v14 = (void (**)(void))_Block_copy(&v24);
  v15 = [(CSAddParticipantsViewController *)self presentingViewController];

  if (v15)
  {
    uint64_t v16 = [(CSAddParticipantsViewController *)self navigationController];
    if (!v16) {
      goto LABEL_6;
    }
    v17 = (void *)v16;
    id v18 = [(CSAddParticipantsViewController *)self navigationController];
    id v19 = [v18 viewControllers];
    id v20 = [v19 firstObject];

    if (v20 == self)
    {
LABEL_6:
      id v23 = [(CSAddParticipantsViewController *)self presentingViewController];
      [v23 dismissViewControllerAnimated:1 completion:v14];

      goto LABEL_7;
    }
    id v21 = [(CSAddParticipantsViewController *)self navigationController];
    id v22 = (id)[v21 popViewControllerAnimated:1];
  }
  v14[2](v14);
LABEL_7:
}

void __83__CSAddParticipantsViewController_dismissViewControllerWithError_shareURL_ckShare___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) delegate];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v2) {
    [v3 addParticipantsViewController:v4 failedToSaveShareWithError:*(void *)(a1 + 32)];
  }
  else {
    [v3 addParticipantsViewController:v4 completedSharingWithShareURL:*(void *)(a1 + 48) ckShare:*(void *)(a1 + 56)];
  }
}

- (void)showContactPickerFromSourceRect:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = (objc_class *)MEMORY[0x263EFEBE0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithNibName:0 bundle:0];
  uint64_t v7 = *MEMORY[0x263EFDF80];
  v22[0] = *MEMORY[0x263EFE070];
  v22[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  [v6 setDisplayedPropertyKeys:v8];

  [v6 setDelegate:self];
  [v6 setAllowsEditing:0];
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"];
  [v6 setPredicateForEnablingContact:v9];

  id v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"((emailAddresses.@count == 1) AND (phoneNumbers.@count == 0)) OR ((emailAddresses.@count == 0) AND (phoneNumbers.@count == 1))"];
  [v6 setPredicateForSelectionOfContact:v10];

  id v11 = [(CSAddParticipantsViewController *)self view];
  id v12 = [v6 popoverPresentationController];
  [v12 setSourceView:v11];

  [v5 CGRectValue];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  id v21 = [v6 popoverPresentationController];
  objc_msgSend(v21, "setSourceRect:", v14, v16, v18, v20);

  [v6 setModalPresentationStyle:6];
  [(CSAddParticipantsViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5 = a4;
  v6 = [(CSAddParticipantsViewController *)self childViewController];
  uint64_t v7 = [v6 remoteViewController];
  id v8 = [v7 serviceViewControllerProxy];

  [v8 userDidSelectContact:v5 contactProperty:0];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v5 = a4;
  v6 = [(CSAddParticipantsViewController *)self childViewController];
  uint64_t v7 = [v6 remoteViewController];
  id v8 = [v7 serviceViewControllerProxy];

  [v8 userDidSelectContact:0 contactProperty:v5];
}

- (BOOL)commitEditingAndReturnError:(id *)a3
{
  return 0;
}

- (CSAddParticipantsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSAddParticipantsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (NSArray)collaborationOptionsGroups
{
  return self->_collaborationOptionsGroups;
}

- (void)setCollaborationOptionsGroups:(id)a3
{
}

- (CSAddressingViewModel)addressingViewModel
{
  return self->_addressingViewModel;
}

- (void)setAddressingViewModel:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
}

- (_UIResilientRemoteViewContainerViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_addressingViewModel, 0);
  objc_storeStrong((id *)&self->_collaborationOptionsGroups, 0);
  objc_storeStrong((id *)&self->_share, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end