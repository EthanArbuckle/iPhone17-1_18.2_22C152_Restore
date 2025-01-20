@interface FPUIAuthenticationCredentialsViewController
- (BOOL)_canMoveToNextStep;
- (BOOL)textFieldShouldReturn:(id)a3;
- (FPUIAuthenticationCredentialsViewController)initWithCredentialDescriptors:(id)a3;
- (id)_rowDescriptorForCredentialDescriptor:(id)a3;
- (id)defaultRightBarButtonItem;
- (void)_next:(id)a3;
- (void)_updateCanTransitionToNextStepState;
- (void)_updateCurrentlyVisibleSections;
- (void)_updateCurrentlyVisibleSectionsNeedsReloadData:(BOOL)a3;
- (void)_updateTextFieldConstraints;
- (void)setupTableViewSections;
- (void)textFieldDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation FPUIAuthenticationCredentialsViewController

- (FPUIAuthenticationCredentialsViewController)initWithCredentialDescriptors:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationCredentialsViewController;
  v6 = [(FPUIAuthenticationTableViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_credentialDescriptors, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)FPUIAuthenticationCredentialsViewController;
  [(FPUIAuthenticationTableViewController *)&v3 viewDidLoad];
  [(FPUIAuthenticationTableViewController *)self setCanTransitionToNextStep:[(FPUIAuthenticationCredentialsViewController *)self _canMoveToNextStep]];
}

- (id)defaultRightBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  v11 = FPUILoc(@"NEXT_NAV_BAR_BUTTON_TITLE", v4, v5, v6, v7, v8, v9, v10, v14);
  v12 = (void *)[v3 initWithTitle:v11 style:2 target:self action:sel__next_];

  return v12;
}

- (id)_rowDescriptorForCredentialDescriptor:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [v5 type];

  switch(v7)
  {
    case 2:
      v15 = @"APPLE_ID_OPTION";
      goto LABEL_7;
    case 1:
      v15 = @"REGISTERED_USER_OPTION";
      goto LABEL_7;
    case 0:
      v15 = @"GUEST_OPTION";
LABEL_7:
      v16 = FPUILoc(v15, v8, v9, v10, v11, v12, v13, v14, v20);
      goto LABEL_9;
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2 object:self file:@"FPUIAuthenticationCredentialsViewController.m" lineNumber:74 description:@"bad credential descriptor type"];

  v16 = 0;
LABEL_9:
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __85__FPUIAuthenticationCredentialsViewController__rowDescriptorForCredentialDescriptor___block_invoke;
  v22[3] = &unk_264C6CD10;
  id v23 = v16;
  v24 = self;
  id v18 = v16;
  [v6 setCellCustomizationHandler:v22];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __85__FPUIAuthenticationCredentialsViewController__rowDescriptorForCredentialDescriptor___block_invoke_2;
  v21[3] = &unk_264C6CE48;
  v21[4] = self;
  [v6 setSelectionHandler:v21];

  return v6;
}

void __85__FPUIAuthenticationCredentialsViewController__rowDescriptorForCredentialDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v11 = a2;
  uint64_t v7 = [v11 textLabel];
  [v7 setText:v5];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 1064);
  uint64_t v9 = [v6 row];

  if (v8 == v9) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [v11 setAccessoryType:v10];
}

void __85__FPUIAuthenticationCredentialsViewController__rowDescriptorForCredentialDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1064);
  if (v4 != [v3 row])
  {
    *(void *)(*(void *)(a1 + 32) + 1064) = [v3 row];
    uint64_t v5 = [*(id *)(a1 + 32) tableView];
    id v6 = [v5 cellForRowAtIndexPath:v3];

    [v6 setAccessoryType:3];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "tableView", 0);
    uint64_t v8 = [v7 visibleCells];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
          uint64_t v14 = [*(id *)(a1 + 32) tableView];
          v15 = [v14 indexPathForCell:v13];

          uint64_t v16 = [v15 section];
          if (v16 == [v3 section])
          {
            uint64_t v17 = [v15 row];
            if (v17 != [v3 row]) {
              [v13 setAccessoryType:0];
            }
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [*(id *)(a1 + 32) _updateCurrentlyVisibleSections];
    objc_msgSend(*(id *)(a1 + 32), "setCanTransitionToNextStep:", objc_msgSend(*(id *)(a1 + 32), "_canMoveToNextStep"));
  }
}

- (void)setupTableViewSections
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  uint64_t v11 = FPUILoc(@"CONNECT_AS", v4, v5, v6, v7, v8, v9, v10, v33);
  [v3 setHeaderTitle:v11];

  [v3 setHeaderHeight:*MEMORY[0x263F1D600]];
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v13 = self->_credentialDescriptors;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if ([v19 type] == 1) {
          self->_selectedCredentialRow = v16 + i;
        }
        long long v20 = [(FPUIAuthenticationCredentialsViewController *)self _rowDescriptorForCredentialDescriptor:v19];
        [v12 addObject:v20];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v41 objects:v50 count:16];
      v16 += i;
    }
    while (v15);
  }

  long long v21 = (FPUIAuthenticationSectionDescriptor *)objc_opt_new();
  credentialsInputSection = self->_credentialsInputSection;
  self->_credentialsInputSection = v21;

  [(FPUIAuthenticationSectionDescriptor *)self->_credentialsInputSection setHeaderHeight:36.0];
  uint64_t v23 = objc_opt_new();
  [v23 setCellReuseIdentifier:@"TextInputReuseIdentifier"];
  [v23 setCellClass:objc_opt_class()];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke;
  v40[3] = &unk_264C6CEB8;
  v40[4] = self;
  [v23 setCellCustomizationHandler:v40];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_2;
  v39[3] = &unk_264C6CE00;
  v39[4] = self;
  [v23 setCellWillDisplayHandler:v39];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_3;
  v38[3] = &unk_264C6CE48;
  v38[4] = self;
  [v23 setSelectionHandler:v38];
  v24 = (void *)[v23 copy];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_4;
  v37[3] = &unk_264C6CEB8;
  v37[4] = self;
  [v24 setCellCustomizationHandler:v37];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_5;
  v36[3] = &unk_264C6CE00;
  v36[4] = self;
  [v24 setCellWillDisplayHandler:v36];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_6;
  v35[3] = &unk_264C6CE48;
  v35[4] = self;
  [v24 setSelectionHandler:v35];
  v25 = (FPUIAuthenticationSectionDescriptor *)objc_opt_new();
  rememberPasswordSection = self->_rememberPasswordSection;
  self->_rememberPasswordSection = v25;

  v27 = objc_opt_new();
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_7;
  v34[3] = &unk_264C6CE00;
  v34[4] = self;
  [v27 setCellCustomizationHandler:v34];
  v28 = self->_credentialsInputSection;
  v49[0] = v3;
  v49[1] = v28;
  v49[2] = self->_rememberPasswordSection;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:3];
  [(FPUIAuthenticationTableViewController *)self setSectionDescriptors:v29];

  v48[0] = v12;
  v47[0] = &unk_26E908BC8;
  v47[1] = &unk_26E908BE0;
  v46[0] = v23;
  v46[1] = v24;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
  v48[1] = v30;
  v47[2] = &unk_26E908BF8;
  v45 = v27;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
  v48[2] = v31;
  v32 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
  [(FPUIAuthenticationTableViewController *)self setRowDescriptors:v32];

  [(FPUIAuthenticationCredentialsViewController *)self _updateCurrentlyVisibleSectionsNeedsReloadData:0];
}

void __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke(uint64_t a1, void *a2)
{
  id v29 = a2;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1056) objectAtIndexedSubscript:*(void *)(*(void *)(a1 + 32) + 1064)];
  uint64_t v11 = FPUILoc(@"NAME", v4, v5, v6, v7, v8, v9, v10, v27);
  uint64_t v12 = [v29 label];
  [v12 setText:v11];

  if ([v3 type] == 2) {
    long long v20 = @"APPLE_ID_PLACEHOLDER";
  }
  else {
    long long v20 = @"USERNAME_PLACEHOLDER";
  }
  long long v21 = FPUILoc(v20, v13, v14, v15, v16, v17, v18, v19, v28);
  v22 = [v29 textField];
  [v22 setPlaceholder:v21];

  uint64_t v23 = [v29 textField];
  uint64_t v24 = *(void *)(a1 + 32);
  v25 = *(void **)(v24 + 1088);
  *(void *)(v24 + 1088) = v23;

  v26 = [v3 username];
  [*(id *)(*(void *)(a1 + 32) + 1088) setText:v26];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1088), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 1088) setAutocorrectionType:1];
  [*(id *)(*(void *)(a1 + 32) + 1088) setAutocapitalizationType:0];
  [*(id *)(*(void *)(a1 + 32) + 1088) setTextContentType:&stru_26E905938];
  [*(id *)(*(void *)(a1 + 32) + 1088) addTarget:*(void *)(a1 + 32) action:sel_textFieldDidChange_ forControlEvents:0x20000];
  [*(id *)(*(void *)(a1 + 32) + 1088) setAccessibilityIdentifier:@"Username"];
  [*(id *)(a1 + 32) _updateTextFieldConstraints];
  [*(id *)(a1 + 32) _updateCanTransitionToNextStepState];
}

uint64_t __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTextFieldConstraints];
}

uint64_t __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) selectTextFieldAtIndexPath:a2];
}

void __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = FPUILoc(@"PASSWORD", v4, v5, v6, v7, v8, v9, v10, v38);
  uint64_t v12 = [v3 label];
  [v12 setText:v11];

  id v41 = [*(id *)(*(void *)(a1 + 32) + 1056) objectAtIndexedSubscript:*(void *)(*(void *)(a1 + 32) + 1064)];
  long long v20 = FPUILoc(@"PASSWORD_OPTIONAL", v13, v14, v15, v16, v17, v18, v19, v39);
  long long v21 = [v3 textField];
  [v21 setPlaceholder:v20];

  v22 = [v3 textField];
  [v22 setSecureTextEntry:1];

  uint64_t v23 = [v41 password];
  uint64_t v24 = [v3 textField];
  [v24 setText:v23];

  v25 = [v3 textField];
  [v25 setAccessibilityIdentifier:@"Password"];

  uint64_t v33 = FPUILoc(@"PASSWORD", v26, v27, v28, v29, v30, v31, v32, v40);
  v34 = [v3 textField];
  [v34 setAccessibilityLabel:v33];

  uint64_t v35 = [v3 textField];

  uint64_t v36 = *(void *)(a1 + 32);
  v37 = *(void **)(v36 + 1096);
  *(void *)(v36 + 1096) = v35;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1096), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 1096) addTarget:*(void *)(a1 + 32) action:sel_textFieldDidChange_ forControlEvents:0x20000];
  [*(id *)(*(void *)(a1 + 32) + 1096) setTextContentType:&stru_26E905938];
  [*(id *)(a1 + 32) _updateCanTransitionToNextStepState];
}

uint64_t __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTextFieldConstraints];
}

uint64_t __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) selectTextFieldAtIndexPath:a2];
}

void __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_7(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v10 = FPUILoc(@"REMEMBER_PASSWORD", v3, v4, v5, v6, v7, v8, v9, v15);
  uint64_t v11 = [v16 textLabel];
  [v11 setText:v10];

  uint64_t v12 = objc_opt_new();
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 1104);
  *(void *)(v13 + 1104) = v12;

  [v16 setAccessoryView:*(void *)(*(void *)(a1 + 32) + 1104)];
}

- (void)_updateTextFieldConstraints
{
  p_textFieldLeadingAnchorConstraint = &self->_textFieldLeadingAnchorConstraint;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textFieldLeadingAnchorConstraint);

  if (!WeakRetained)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__FPUIAuthenticationCredentialsViewController__updateTextFieldConstraints__block_invoke;
    v10[3] = &unk_264C6CF98;
    v10[4] = self;
    uint64_t v5 = (unsigned int (**)(void, void))MEMORY[0x237DF0A80](v10);
    if (((unsigned int (**)(void, UITextField *))v5)[2](v5, self->_nameInputTextField))
    {
      if (((unsigned int (**)(void, UITextField *))v5)[2](v5, self->_passwordInputTextField))
      {
        uint64_t v6 = [(UITextField *)self->_nameInputTextField leadingAnchor];
        uint64_t v7 = [(UITextField *)self->_passwordInputTextField leadingAnchor];
        uint64_t v8 = [v6 constraintEqualToAnchor:v7];
        objc_storeWeak((id *)p_textFieldLeadingAnchorConstraint, v8);

        id v9 = objc_loadWeakRetained((id *)p_textFieldLeadingAnchorConstraint);
        [v9 setActive:1];
      }
    }
  }
}

BOOL __74__FPUIAuthenticationCredentialsViewController__updateTextFieldConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  do
  {
    uint64_t v5 = [*(id *)(a1 + 32) tableView];

    BOOL v6 = v4 == v5;
    BOOL v7 = v4 == v5;
    if (v6) {
      break;
    }
    uint64_t v8 = [v4 superview];

    uint64_t v4 = (void *)v8;
  }
  while (v8);

  return v7;
}

- (void)_updateCurrentlyVisibleSections
{
}

- (void)_updateCurrentlyVisibleSectionsNeedsReloadData:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v6 = [(NSArray *)self->_credentialDescriptors objectAtIndexedSubscript:self->_selectedCredentialRow];
  id v9 = v6;
  if (!v6)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"FPUIAuthenticationCredentialsViewController.m" lineNumber:247 description:@"nil currentlySelectedDescriptor"];

    BOOL v6 = 0;
  }
  -[FPUIAuthenticationSectionDescriptor setActive:](self->_credentialsInputSection, "setActive:", [v6 type] != 0);
  [(FPUIAuthenticationSectionDescriptor *)self->_rememberPasswordSection setActive:0];
  if (v3)
  {
    BOOL v7 = [(FPUIAuthenticationCredentialsViewController *)self tableView];
    [v7 reloadData];
  }
}

- (void)_next:(id)a3
{
  [(FPUIAuthenticationTableViewController *)self setNavBarActivityIndicatorHidden:0];
  id v8 = [(NSArray *)self->_credentialDescriptors objectAtIndexedSubscript:self->_selectedCredentialRow];
  uint64_t v4 = objc_opt_new();
  objc_msgSend(v4, "setType:", objc_msgSend(v8, "type"));
  uint64_t v5 = [v8 username];
  [v4 setUsername:v5];

  BOOL v6 = [v8 password];
  [v4 setPassword:v6];

  [(FPUIAuthenticationTableViewController *)self setTransitioning:1];
  BOOL v7 = [(FPUIAuthenticationTableViewController *)self authenticationDelegate];
  [v7 connectionFlowDelegate:self didInputCredentials:v4];
}

- (BOOL)_canMoveToNextStep
{
  BOOL v3 = [(NSArray *)self->_credentialDescriptors objectAtIndexedSubscript:self->_selectedCredentialRow];
  if ([v3 type])
  {
    uint64_t v4 = [(UITextField *)self->_nameInputTextField text];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  if ([(UITextField *)self->_nameInputTextField isFirstResponder])
  {
    [(UITextField *)self->_passwordInputTextField becomeFirstResponder];
  }
  else
  {
    if (![(FPUIAuthenticationCredentialsViewController *)self _canMoveToNextStep])
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
    [(FPUIAuthenticationCredentialsViewController *)self _next:v4];
  }
  BOOL v5 = 0;
LABEL_7:

  return v5;
}

- (void)textFieldDidChange:(id)a3
{
  BOOL v6 = (UITextField *)a3;
  id v4 = [(NSArray *)self->_credentialDescriptors objectAtIndexedSubscript:self->_selectedCredentialRow];
  if (self->_nameInputTextField == v6)
  {
    BOOL v5 = [(UITextField *)v6 text];
    [v4 setUsername:v5];
  }
  else
  {
    if (self->_passwordInputTextField != v6) {
      goto LABEL_6;
    }
    BOOL v5 = [(UITextField *)v6 text];
    [v4 setPassword:v5];
  }

LABEL_6:
  [(FPUIAuthenticationCredentialsViewController *)self _updateCanTransitionToNextStepState];
}

- (void)_updateCanTransitionToNextStepState
{
  BOOL v3 = [(FPUIAuthenticationCredentialsViewController *)self _canMoveToNextStep];

  [(FPUIAuthenticationTableViewController *)self setCanTransitionToNextStep:v3];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textFieldLeadingAnchorConstraint);
  objc_storeStrong((id *)&self->_rememberPasswordSwitch, 0);
  objc_storeStrong((id *)&self->_passwordInputTextField, 0);
  objc_storeStrong((id *)&self->_nameInputTextField, 0);
  objc_storeStrong((id *)&self->_rememberPasswordSection, 0);
  objc_storeStrong((id *)&self->_credentialsInputSection, 0);

  objc_storeStrong((id *)&self->_credentialDescriptors, 0);
}

@end