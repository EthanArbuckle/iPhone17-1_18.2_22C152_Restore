@interface AKSignaturesViewController_iOS
- (AKController)controller;
- (AKSignaturesViewControllerDelegate)delegate;
- (AKSignaturesViewController_iOS)initWithController:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsEdits;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)presentedInAlert;
- (BOOL)showAddEditButtonRow;
- (BOOL)showsNavigationBar;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (CGSize)preferredContentSize;
- (NSArray)editingLeftBarItems;
- (NSArray)leftBarItems;
- (NSArray)rightBarItems;
- (UIColor)tableBackgroundColor;
- (UINavigationBar)navBar;
- (UIResponder)responderToRestore;
- (UITableView)tableView;
- (double)idealHeight;
- (id)_signatures;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)positionForBar:(id)a3;
- (int64_t)signatureImageContentMode;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelPicker:(id)a3;
- (void)_configureUI;
- (void)_continueToCreateSignature:(id)a3;
- (void)_deleteSignature:(id)a3;
- (void)_updateSignatureCellLayout;
- (void)setAllowsEdits:(BOOL)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingLeftBarItems:(id)a3;
- (void)setLeftBarItems:(id)a3;
- (void)setNavBar:(id)a3;
- (void)setPresentedInAlert:(BOOL)a3;
- (void)setResponderToRestore:(id)a3;
- (void)setRightBarItems:(id)a3;
- (void)setShowAddEditButtonRow:(BOOL)a3;
- (void)setShowsNavigationBar:(BOOL)a3;
- (void)setSignatureImageContentMode:(int64_t)a3;
- (void)setTableBackgroundColor:(id)a3;
- (void)setTableView:(id)a3;
- (void)signatureCreationControllerDidCreateSignature:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AKSignaturesViewController_iOS

- (AKSignaturesViewController_iOS)initWithController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSignaturesViewController_iOS;
  v5 = [(AKSignaturesViewController_iOS *)&v9 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(AKSignaturesViewController_iOS *)v5 setController:v4];
    v7 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(AKSignaturesViewController_iOS *)v6 setTableBackgroundColor:v7];

    [(AKSignaturesViewController_iOS *)v6 setAllowsEdits:0];
    [(AKSignaturesViewController_iOS *)v6 setShowsNavigationBar:0];
  }

  return v6;
}

- (CGSize)preferredContentSize
{
  BOOL v3 = [(AKSignaturesViewController_iOS *)self presentedInAlert];
  [(AKSignaturesViewController_iOS *)self idealHeight];
  double v5 = v4;
  double v6 = 540.0;
  if (v3) {
    double v6 = 0.0;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)AKSignaturesViewController_iOS;
  [(AKSignaturesViewController_iOS *)&v21 viewDidLoad];
  BOOL v3 = +[AKController akBundle];
  double v4 = [v3 localizedStringForKey:@"Signatures" value:&stru_26EA57918 table:@"AKSignaturesViewController_iOS"];
  [(AKSignaturesViewController_iOS *)self setTitle:v4];

  id v5 = objc_alloc(MEMORY[0x263F1CA40]);
  double v6 = [(AKSignaturesViewController_iOS *)self view];
  [v6 bounds];
  v7 = objc_msgSend(v5, "initWithFrame:style:", 0);
  [(AKSignaturesViewController_iOS *)self setTableView:v7];

  v8 = [(AKSignaturesViewController_iOS *)self tableView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = [(AKSignaturesViewController_iOS *)self tableView];
  [v9 setDelegate:self];

  v10 = [(AKSignaturesViewController_iOS *)self tableView];
  [v10 setDataSource:self];

  uint64_t v11 = [(AKSignaturesViewController_iOS *)self presentedInAlert] ^ 1;
  v12 = [(AKSignaturesViewController_iOS *)self tableView];
  [v12 setAlwaysBounceVertical:v11];

  v13 = [(AKSignaturesViewController_iOS *)self tableView];
  [v13 setRowHeight:86.0];

  v14 = [(AKSignaturesViewController_iOS *)self view];
  v15 = [(AKSignaturesViewController_iOS *)self tableView];
  [v14 addSubview:v15];

  v16 = _NSDictionaryOfVariableBindings(&cfstr_Tableview.isa, self->_tableView, 0);
  v17 = [(AKSignaturesViewController_iOS *)self view];
  v18 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:0 views:v16];
  [v17 addConstraints:v18];

  v19 = [(AKSignaturesViewController_iOS *)self view];
  v20 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:v16 views:v16];
  [v19 addConstraints:v20];

  [(AKSignaturesViewController_iOS *)self _configureUI];
}

- (BOOL)becomeFirstResponder
{
  BOOL v3 = [(AKSignaturesViewController_iOS *)self view];
  double v4 = [v3 window];
  id v5 = [v4 firstResponder];

  v9.receiver = self;
  v9.super_class = (Class)AKSignaturesViewController_iOS;
  BOOL v6 = [(AKSignaturesViewController_iOS *)&v9 becomeFirstResponder];
  if (v6 && v5 != self) {
    [(AKSignaturesViewController_iOS *)self setResponderToRestore:v5];
  }

  return v6;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKSignaturesViewController_iOS;
  [(AKSignaturesViewController_iOS *)&v4 viewDidAppear:a3];
  if (([(AKSignaturesViewController_iOS *)self isFirstResponder] & 1) == 0) {
    [(AKSignaturesViewController_iOS *)self becomeFirstResponder];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(AKSignaturesViewController_iOS *)self resignFirstResponder];
  id v5 = [(AKSignaturesViewController_iOS *)self responderToRestore];
  BOOL v6 = v5;
  if (v5) {
    [v5 becomeFirstResponder];
  }
  [(AKSignaturesViewController_iOS *)self setResponderToRestore:0];
  v7.receiver = self;
  v7.super_class = (Class)AKSignaturesViewController_iOS;
  [(AKSignaturesViewController_iOS *)&v7 viewDidDisappear:v3];
}

- (double)idealHeight
{
  BOOL v3 = [(AKSignaturesViewController_iOS *)self controller];
  objc_super v4 = [v3 signatureModelController];
  id v5 = [v4 signatures];
  uint64_t v6 = [v5 count];

  if ([(AKSignaturesViewController_iOS *)self presentedInAlert])
  {
    unint64_t v7 = 3;
    if (v6 < 3) {
      unint64_t v7 = v6;
    }
  }
  else
  {
    unint64_t v7 = 4;
    if (v6 > 4) {
      unint64_t v7 = v6;
    }
    if (v7 > 6)
    {
      double v8 = 559.0;
      goto LABEL_10;
    }
  }
  double v8 = (double)(uint64_t)(86 * v7);
LABEL_10:
  double v9 = v8 + -1.0;
  if ([(AKSignaturesViewController_iOS *)self showsNavigationBar])
  {
    v10 = [(AKSignaturesViewController_iOS *)self navBar];
    [v10 bounds];
    double v9 = v9 + v11;
  }
  return v9;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_configureUI
{
  v34[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(AKSignaturesViewController_iOS *)self tableBackgroundColor];
  objc_super v4 = [(AKSignaturesViewController_iOS *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(AKSignaturesViewController_iOS *)self tableBackgroundColor];
  uint64_t v6 = [(AKSignaturesViewController_iOS *)self tableView];
  [v6 setBackgroundColor:v5];

  BOOL v7 = [(AKSignaturesViewController_iOS *)self allowsEdits];
  double v8 = [(AKSignaturesViewController_iOS *)self tableView];
  [v8 setEditing:v7];

  if ([(AKSignaturesViewController_iOS *)self showsNavigationBar])
  {
    id v9 = objc_alloc(MEMORY[0x263F1C7E0]);
    v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setDelegate:self];
    double v11 = [(AKSignaturesViewController_iOS *)self view];
    [v11 addSubview:v10];

    [(AKSignaturesViewController_iOS *)self setNavBar:v10];
    v12 = _NSDictionaryOfVariableBindings(&cfstr_Navbar_0.isa, v10, 0);
    v13 = [(AKSignaturesViewController_iOS *)self view];
    v14 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[navBar]|" options:0 metrics:0 views:v12];
    [v13 addConstraints:v14];

    v15 = [v10 topAnchor];
    v16 = [(AKSignaturesViewController_iOS *)self view];
    v17 = [v16 safeAreaLayoutGuide];
    v18 = [v17 topAnchor];
    v19 = [v15 constraintEqualToAnchor:v18];

    [v19 setActive:1];
    id v20 = objc_alloc(MEMORY[0x263F1C800]);
    objc_super v21 = [(AKSignaturesViewController_iOS *)self title];
    v22 = (void *)[v20 initWithTitle:v21];

    v23 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:4 target:self action:sel__continueToCreateSignature_];
    v24 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel__cancelPicker_];
    v34[0] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
    [(AKSignaturesViewController_iOS *)self setRightBarItems:v25];

    v33 = v23;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
    [(AKSignaturesViewController_iOS *)self setLeftBarItems:v26];

    v27 = [(AKSignaturesViewController_iOS *)self leftBarItems];
    [v22 setLeftBarButtonItems:v27];

    v28 = [(AKSignaturesViewController_iOS *)self rightBarItems];
    [v22 setRightBarButtonItems:v28];

    v29 = [(AKSignaturesViewController_iOS *)self title];
    [v22 setTitle:v29];

    v32 = v22;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    [v10 setItems:v30];

    v31 = [(AKSignaturesViewController_iOS *)self view];
    [v31 layoutIfNeeded];
  }
  [(AKSignaturesViewController_iOS *)self _updateSignatureCellLayout];
}

- (void)viewDidLayoutSubviews
{
  BOOL v3 = [(AKSignaturesViewController_iOS *)self navBar];

  if (v3)
  {
    id v7 = [(AKSignaturesViewController_iOS *)self navBar];
    [v7 frame];
    double v5 = v4;
    uint64_t v6 = [(AKSignaturesViewController_iOS *)self tableView];
    objc_msgSend(v6, "setContentInset:", v5, 0.0, 0.0, 0.0);
  }
}

- (void)_continueToCreateSignature:(id)a3
{
  AKLog(@"%s");
  -[AKSignaturesViewController_iOS delegate](self, "delegate", "-[AKSignaturesViewController_iOS _continueToCreateSignature:]");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector()) {
    [v4 signaturesViewControllerContinueToCreateSignature:self];
  }
}

- (void)_cancelPicker:(id)a3
{
  AKLog(@"%s");
  -[AKSignaturesViewController_iOS delegate](self, "delegate", "-[AKSignaturesViewController_iOS _cancelPicker:]");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_respondsToSelector()) {
    [v4 signaturesViewControllerDidCancel:self];
  }
}

- (id)_signatures
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [(AKSignaturesViewController_iOS *)self controller];
  BOOL v3 = [v2 signatureModelController];
  id v4 = [v3 signatures];

  double v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:0];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v7 = [v4 sortedArrayUsingDescriptors:v6];

  return v7;
}

- (void)_deleteSignature:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v7 = [(AKSignaturesViewController_iOS *)self controller];
    double v5 = [v7 signatureModelController];
    uint64_t v6 = [v5 mutableArrayValueForKey:@"signatures"];

    AKLog(@"Delete signature %@");
    objc_msgSend(v6, "removeObject:", v4, v4);
  }
}

- (void)_updateSignatureCellLayout
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(AKSignaturesViewController_iOS *)self presentedInAlert])
  {
    BOOL v3 = [(AKSignaturesViewController_iOS *)self controller];
    id v4 = [v3 signatureModelController];
    double v5 = [v4 signatures];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      int64_t v10 = 4;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v25 + 1) + 8 * i) descriptionTag])
          {
            v12 = [(AKSignaturesViewController_iOS *)self view];
            if ([v12 effectiveUserInterfaceLayoutDirection] == 1) {
              int64_t v10 = 8;
            }
            else {
              int64_t v10 = 7;
            }

            goto LABEL_19;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      int64_t v10 = 4;
    }
LABEL_19:
  }
  else
  {
    id v6 = [(AKSignaturesViewController_iOS *)self view];
    if ([v6 effectiveUserInterfaceLayoutDirection] == 1) {
      int64_t v10 = 8;
    }
    else {
      int64_t v10 = 7;
    }
  }

  if (v10 != self->_signatureImageContentMode)
  {
    self->_int64_t signatureImageContentMode = v10;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = [(AKSignaturesViewController_iOS *)self tableView];
    v14 = [v13 visibleCells];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          int64_t signatureImageContentMode = self->_signatureImageContentMode;
          id v20 = [*(id *)(*((void *)&v21 + 1) + 8 * j) signatureImageView];
          [v20 setContentMode:signatureImageContentMode];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(AKSignaturesViewController_iOS *)self _signatures];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(AKSignaturesViewController_iOS *)self tableView];
  uint64_t v7 = [v6 dequeueReusableCellWithIdentifier:@"AKSignatureCellIdentifier"];

  if (!v7) {
    uint64_t v7 = [[AKSignatureTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"AKSignatureCellIdentifier"];
  }
  uint64_t v8 = [MEMORY[0x263F1C550] clearColor];
  uint64_t v9 = [(AKSignatureTableViewCell *)v7 contentView];
  [v9 setBackgroundColor:v8];

  int64_t v10 = [MEMORY[0x263F1C550] clearColor];
  [(AKSignatureTableViewCell *)v7 setBackgroundColor:v10];

  int64_t v11 = [(AKSignaturesViewController_iOS *)self signatureImageContentMode];
  v12 = [(AKSignatureTableViewCell *)v7 signatureImageView];
  [v12 setContentMode:v11];

  v13 = [(AKSignaturesViewController_iOS *)self _signatures];
  uint64_t v14 = [v5 row];

  uint64_t v15 = [v13 objectAtIndex:v14];

  [(AKSignatureTableViewCell *)v7 setSignature:v15];

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v15 = a4;
  id v7 = a5;
  if ([(AKSignaturesViewController_iOS *)self presentedInAlert])
  {
    double v8 = *MEMORY[0x263F1D1C0];
    double v9 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v10 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v11 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    objc_msgSend(v15, "setLayoutMargins:", *MEMORY[0x263F1D1C0], v9, v10, v11);
    objc_msgSend(v15, "setSeparatorInset:", v8, v9, v10, v11);
    [v15 setPreservesSuperviewLayoutMargins:0];
    uint64_t v12 = [v7 row];
    v13 = [(AKSignaturesViewController_iOS *)self _signatures];
    BOOL v14 = v12 != [v13 count] - 1;

    [v15 setSeparatorStyle:v14];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [(AKSignaturesViewController_iOS *)self controller];
  double v8 = [(AKSignaturesViewController_iOS *)self _signatures];
  double v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));

  double v10 = [v12 signatureModelController];
  [v10 setSelectedSignature:v9];

  AKLog(@"Selected signature %@");
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v9);

  double v11 = [(AKSignaturesViewController_iOS *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 signaturesViewControllerDidSelectSignature:self];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return ![(AKSignaturesViewController_iOS *)self presentedInAlert];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a4 == 1)
  {
    id v6 = a5;
    id v7 = [(AKSignaturesViewController_iOS *)self _signatures];
    double v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "row"));

    [(AKSignaturesViewController_iOS *)self _deleteSignature:v8];
    double v9 = [(AKSignaturesViewController_iOS *)self tableView];
    v11[0] = v6;
    double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

    [v9 deleteRowsAtIndexPaths:v10 withRowAnimation:100];
  }
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)signatureCreationControllerDidCreateSignature:(id)a3
{
  id v4 = [(AKSignaturesViewController_iOS *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 signaturesViewControllerDidSelectSignature:self];
  }
  [(AKSignaturesViewController_iOS *)self _updateSignatureCellLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AKSignaturesViewController_iOS;
  id v4 = a3;
  [(AKSignaturesViewController_iOS *)&v9 traitCollectionDidChange:v4];
  id v5 = objc_msgSend(MEMORY[0x263F1C550], "systemBackgroundColor", v9.receiver, v9.super_class);
  [(AKSignaturesViewController_iOS *)self setTableBackgroundColor:v5];

  id v6 = [(AKSignaturesViewController_iOS *)self traitCollection];
  int v7 = [v6 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v7)
  {
    double v8 = [(AKSignaturesViewController_iOS *)self tableView];
    [v8 reloadData];
  }
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (AKSignaturesViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKSignaturesViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)presentedInAlert
{
  return self->_presentedInAlert;
}

- (void)setPresentedInAlert:(BOOL)a3
{
  self->_presentedInAlert = a3;
}

- (BOOL)showsNavigationBar
{
  return self->_showsNavigationBar;
}

- (void)setShowsNavigationBar:(BOOL)a3
{
  self->_showsNavigationBar = a3;
}

- (BOOL)allowsEdits
{
  return self->_allowsEdits;
}

- (void)setAllowsEdits:(BOOL)a3
{
  self->_allowsEdits = a3;
}

- (BOOL)showAddEditButtonRow
{
  return self->_showAddEditButtonRow;
}

- (void)setShowAddEditButtonRow:(BOOL)a3
{
  self->_showAddEditButtonRow = a3;
}

- (UIColor)tableBackgroundColor
{
  return self->_tableBackgroundColor;
}

- (void)setTableBackgroundColor:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
}

- (NSArray)rightBarItems
{
  return self->_rightBarItems;
}

- (void)setRightBarItems:(id)a3
{
}

- (NSArray)editingLeftBarItems
{
  return self->_editingLeftBarItems;
}

- (void)setEditingLeftBarItems:(id)a3
{
}

- (NSArray)leftBarItems
{
  return self->_leftBarItems;
}

- (void)setLeftBarItems:(id)a3
{
}

- (UIResponder)responderToRestore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responderToRestore);

  return (UIResponder *)WeakRetained;
}

- (void)setResponderToRestore:(id)a3
{
}

- (int64_t)signatureImageContentMode
{
  return self->_signatureImageContentMode;
}

- (void)setSignatureImageContentMode:(int64_t)a3
{
  self->_int64_t signatureImageContentMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_responderToRestore);
  objc_storeStrong((id *)&self->_leftBarItems, 0);
  objc_storeStrong((id *)&self->_editingLeftBarItems, 0);
  objc_storeStrong((id *)&self->_rightBarItems, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_controller);
}

@end