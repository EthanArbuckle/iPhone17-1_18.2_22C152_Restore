@interface NPHBSCellularFauxCardInfoViewController
- (BOOL)textFieldShouldReturn:(id)a3;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NPHBSCellularFauxCardInfoViewController)init;
- (NSLayoutConstraint)infoTableViewHeightConstraint;
- (UILabel)enterActivationLabel;
- (UIScrollView)scrollView;
- (UITableView)infoTableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)completion;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)activatePlan:(id)a3;
- (void)configureCell:(id)a3 atIndexPath:(id)a4;
- (void)keyboardWasShown:(id)a3;
- (void)keyboardWillBeHidden:(id)a3;
- (void)scrollViewForKeyboardIfNecessary;
- (void)setCompletion:(id)a3;
- (void)setEnterActivationLabel:(id)a3;
- (void)setInfoTableView:(id)a3;
- (void)setInfoTableViewHeightConstraint:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSubscriptionContext:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NPHBSCellularFauxCardInfoViewController

- (NPHBSCellularFauxCardInfoViewController)init
{
  v31[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v24.receiver = self;
  v24.super_class = (Class)NPHBSCellularFauxCardInfoViewController;
  v4 = [(NPHBSCellularFauxCardInfoViewController *)&v24 initWithNibName:@"NPHBSCellularFauxCardInfo" bundle:v3];

  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    tableData = v4->_tableData;
    v4->_tableData = (NSArray *)v5;

    v30 = @"TITLE_KEY";
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_SMDP_LABEL" value:&stru_26E895688 table:0];
    v31[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v23 = (void *)[v9 mutableCopy];

    v28 = @"TITLE_KEY";
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_ACTIVATION_CODE_LABEL" value:&stru_26E895688 table:0];
    v29 = v11;
    v12 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v13 = (void *)[v12 mutableCopy];

    v26[0] = @"TITLE_KEY";
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_CONFIRMATION_CODE_LABEL" value:&stru_26E895688 table:0];
    v26[1] = @"PLACEHOLDER_KEY";
    v27[0] = v15;
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_CONFIRMATION_CODE_PLACEHOLDER" value:&stru_26E895688 table:0];
    v27[1] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    v19 = (void *)[v18 mutableCopy];

    v25[0] = v23;
    v25[1] = v13;
    v25[2] = v19;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
    v21 = v4->_tableData;
    v4->_tableData = (NSArray *)v20;
  }
  return v4;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)NPHBSCellularFauxCardInfoViewController;
  [(NPHBSCellularFauxCardInfoViewController *)&v8 viewDidLoad];
  v3 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2F0]];
  v4 = (void *)MEMORY[0x263F1C658];
  uint64_t v5 = [v3 fontDescriptorWithSymbolicTraits:2];
  v6 = [v4 fontWithDescriptor:v5 size:0.0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_enterActivationLabel);
  [WeakRetained setFont:v6];
}

- (void)viewDidLayoutSubviews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoTableView);
  v4 = [MEMORY[0x263F088C8] indexPathWithIndex:0];
  [(NPHBSCellularFauxCardInfoViewController *)self tableView:WeakRetained heightForRowAtIndexPath:v4];
  double v6 = v5;

  id v7 = objc_loadWeakRetained((id *)&self->_infoTableViewHeightConstraint);
  [v7 setConstant:v6 * 3.0 + -0.5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NPHBSCellularFauxCardInfoViewController;
  [(NPHBSCellularFauxCardInfoViewController *)&v6 viewWillAppear:a3];
  self->_keyboardSize = (CGSize)*MEMORY[0x263F001B0];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_keyboardWasShown_ name:*MEMORY[0x263F1D418] object:0];

  double v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_keyboardWillBeHidden_ name:*MEMORY[0x263F1D480] object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NPHBSCellularFauxCardInfoViewController;
  [(NPHBSCellularFauxCardInfoViewController *)&v6 viewWillDisappear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D418] object:0];

  double v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F1D480] object:0];
}

- (void)keyboardWasShown:(id)a3
{
  id v7 = [a3 userInfo];
  v4 = [v7 objectForKey:*MEMORY[0x263F1D420]];
  [v4 CGRectValue];
  self->_keyboardSize.width = v5;
  self->_keyboardSize.height = v6;

  [(NPHBSCellularFauxCardInfoViewController *)self scrollViewForKeyboardIfNecessary];
}

- (void)keyboardWillBeHidden:(id)a3
{
  double v3 = *MEMORY[0x263F1D1C0];
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v6 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  p_scrollView = &self->_scrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "setContentInset:", v3, v4, v5, v6);

  id v9 = objc_loadWeakRetained((id *)p_scrollView);
  objc_msgSend(v9, "setScrollIndicatorInsets:", v3, v4, v5, v6);
}

- (void)scrollViewForKeyboardIfNecessary
{
  if (self->_activeTextField)
  {
    p_height = &self->_keyboardSize.height;
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
  }
  else
  {
    double v6 = *MEMORY[0x263F1D1C0];
    double v5 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v4 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    p_height = (CGFloat *)(MEMORY[0x263F1D1C0] + 16);
  }
  double v7 = *p_height;
  p_scrollView = &self->_scrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "setContentInset:", v6, v5, v7, v4);

  id v10 = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(v10, "setScrollIndicatorInsets:", v6, v5, v7, v4);

  if (self->_activeTextField)
  {
    v11 = [(NPHBSCellularFauxCardInfoViewController *)self view];
    [v11 frame];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    double v19 = v18;

    CGFloat v20 = v19 - self->_keyboardSize.height;
    activeTextField = self->_activeTextField;
    [(UITextField *)activeTextField bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    id v30 = objc_loadWeakRetained((id *)p_scrollView);
    -[UITextField convertRect:toView:](activeTextField, "convertRect:toView:", v30, v23, v25, v27, v29);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;

    v41.origin.x = v13;
    v41.origin.y = v15;
    v41.size.width = v17;
    v41.size.height = v20;
    v42.origin.x = v32;
    v42.origin.y = v34;
    v42.size.width = v36;
    v42.size.height = v38;
    if (!CGRectContainsRect(v41, v42))
    {
      id v39 = objc_loadWeakRetained((id *)p_scrollView);
      objc_msgSend(v39, "scrollRectToVisible:animated:", 1, v32, v34, v36, v38);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NPHBSCellularFauxCardInfoViewController;
  [(NPHBSCellularFauxCardInfoViewController *)&v14 viewDidAppear:a3];
  id v4 = objc_alloc(MEMORY[0x263F1C468]);
  double v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_NEXT" value:&stru_26E895688 table:0];
  double v7 = (void *)[v4 initWithTitle:v6 style:2 target:self action:sel_activatePlan_];

  objc_super v8 = [(NPHBSCellularFauxCardInfoViewController *)self navigationController];
  id v9 = [v8 navigationBar];

  id v10 = [v9 topItem];
  [v10 setRightBarButtonItem:v7];
  v11 = [(NSArray *)self->_tableData objectAtIndexedSubscript:0];
  double v12 = [v11 objectForKeyedSubscript:@"TABLE_CELL_KEY"];

  CGFloat v13 = [v12 editableTextField];
  [v13 becomeFirstResponder];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_tableData count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", [v5 row]);
  double v7 = [v6 objectForKeyedSubscript:@"TABLE_CELL_KEY"];

  if (!v7)
  {
    double v7 = -[NPHSetupTableViewCell initWithTag:delegate:]([NPHSetupTableViewCell alloc], "initWithTag:delegate:", [v5 row], self);
    objc_super v8 = -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", [v5 row]);
    [v8 setObject:v7 forKeyedSubscript:@"TABLE_CELL_KEY"];
  }
  [(NPHBSCellularFauxCardInfoViewController *)self configureCell:v7 atIndexPath:v5];

  return v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", [v6 row]);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v8 = [v15 objectForKeyedSubscript:@"TITLE_KEY"];
  id v9 = [v7 textLabel];
  [v9 setText:v8];

  id v10 = [v15 objectForKeyedSubscript:@"PLACEHOLDER_KEY"];
  v11 = [v7 editableTextField];
  [v11 setPlaceholder:v10];

  double v12 = [v15 objectForKeyedSubscript:@"VALUE_KEY"];
  CGFloat v13 = [v7 editableTextField];
  [v13 setText:v12];

  uint64_t v14 = [v6 row];
  [v7 setTag:v14];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  +[NPHSetupTableViewCell rowHeight];
  return result;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  [v4 resignFirstResponder];
  uint64_t v5 = [v4 tag];

  switch(v5)
  {
    case 2:
      [(NPHBSCellularFauxCardInfoViewController *)self activatePlan:0];
      break;
    case 1:
      tableData = self->_tableData;
      uint64_t v7 = 2;
      goto LABEL_7;
    case 0:
      tableData = self->_tableData;
      uint64_t v7 = 1;
LABEL_7:
      objc_super v8 = [(NSArray *)tableData objectAtIndexedSubscript:v7];
      id v9 = [v8 objectForKeyedSubscript:@"TABLE_CELL_KEY"];

      id v10 = [v9 editableTextField];
      [v10 becomeFirstResponder];

      break;
  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = (UITextField *)a3;
  if ([(UITextField *)v4 tag] == 2) {
    uint64_t v5 = 11;
  }
  else {
    uint64_t v5 = 4;
  }
  [(UITextField *)v4 setReturnKeyType:v5];
  activeTextField = self->_activeTextField;
  self->_activeTextField = v4;

  [(NPHBSCellularFauxCardInfoViewController *)self scrollViewForKeyboardIfNecessary];
}

- (void)textFieldDidEndEditing:(id)a3
{
  tableData = self->_tableData;
  id v5 = a3;
  -[NSArray objectAtIndexedSubscript:](tableData, "objectAtIndexedSubscript:", [v5 tag]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 text];

  uint64_t v7 = (void *)[v6 copy];
  [v9 setObject:v7 forKeyedSubscript:@"VALUE_KEY"];

  activeTextField = self->_activeTextField;
  self->_activeTextField = 0;
}

- (void)activatePlan:(id)a3
{
  id v4 = a3;
  id v5 = [(NPHBSCellularFauxCardInfoViewController *)self view];
  [v5 endEditing:1];

  id v6 = [(NPHBSCellularFauxCardInfoViewController *)self presentingViewController];
  [v6 dismissViewControllerAnimated:1 completion:0];

  objc_initWeak(&location, self);
  uint64_t v7 = +[NPHCellularBridgeUIManager sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__NPHBSCellularFauxCardInfoViewController_activatePlan___block_invoke;
  v8[3] = &unk_264C53D28;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  [v7 _prePromptForUserConsentIfNecessary:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__NPHBSCellularFauxCardInfoViewController_activatePlan___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 32;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 984) objectAtIndexedSubscript:0];
  CGFloat v17 = [v4 objectForKeyedSubscript:@"VALUE_KEY"];

  id v5 = [*(id *)(*(void *)v3 + 984) objectAtIndexedSubscript:1];
  double v16 = [v5 objectForKeyedSubscript:@"VALUE_KEY"];

  id v6 = [*(id *)(*(void *)v3 + 984) objectAtIndexedSubscript:2];
  id v15 = [v6 objectForKeyedSubscript:@"VALUE_KEY"];

  uint64_t v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "-[NPHBSCellularFauxCardInfoViewController activatePlan:]_block_invoke";
    __int16 v22 = 2112;
    double v23 = v17;
    __int16 v24 = 2112;
    double v25 = v16;
    __int16 v26 = 2112;
    double v27 = v15;
    _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "%s - addressField:%@, activationCode:%@, confirmationCode:%@", buf, 0x2Au);
  }

  objc_super v8 = [MEMORY[0x263F31978] sharedManager];
  uint64_t v9 = IsCurrentDevicePairing();
  id v10 = +[NPHCellularBridgeUIManager sharedInstance];
  v11 = [v10 _currentDeviceCSN];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CGFloat v13 = [WeakRetained subscriptionContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__NPHBSCellularFauxCardInfoViewController_activatePlan___block_invoke_57;
  v18[3] = &unk_264C53890;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  v18[4] = *(void *)(a1 + 32);
  [v8 addNewRemotePlanWithAddress:v17 matchingId:v16 oid:0 confirmationCode:v15 isPairing:v9 withCSN:v11 withContext:v13 userConsent:a2 completion:v18];

  objc_destroyWeak(&v19);
}

void __56__NPHBSCellularFauxCardInfoViewController_activatePlan___block_invoke_57(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__NPHBSCellularFauxCardInfoViewController_activatePlan___block_invoke_2;
  v5[3] = &unk_264C53868;
  id v4 = v3;
  id v6 = v4;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  nph_ensure_on_main_queue(v5);
  objc_destroyWeak(&v8);
}

void __56__NPHBSCellularFauxCardInfoViewController_activatePlan___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[NPHBSCellularFauxCardInfoViewController activatePlan:]_block_invoke_2";
    __int16 v10 = 2112;
    id v11 = v2;
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s - error:%@", (uint8_t *)&v8, 0x16u);
  }

  if (v2)
  {
    id v4 = (void *)MEMORY[0x263F087E8];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = [WeakRetained subscriptionContext];
    uint64_t v7 = [v4 NPHCellularSanitizedError:v2 forSubscriptionContext:v6];

    +[NPHCellularBridgeUIManager presentCellularError:v7 onViewController:*(void *)(a1 + 40)];
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
  self->_subscriptionContext = (CTXPCServiceSubscriptionContext *)a3;
}

- (UILabel)enterActivationLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enterActivationLabel);
  return (UILabel *)WeakRetained;
}

- (void)setEnterActivationLabel:(id)a3
{
}

- (UITableView)infoTableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoTableView);
  return (UITableView *)WeakRetained;
}

- (void)setInfoTableView:(id)a3
{
}

- (NSLayoutConstraint)infoTableViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoTableViewHeightConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setInfoTableViewHeightConstraint:(id)a3
{
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_infoTableViewHeightConstraint);
  objc_destroyWeak((id *)&self->_infoTableView);
  objc_destroyWeak((id *)&self->_enterActivationLabel);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_activeTextField, 0);
  objc_storeStrong((id *)&self->_tableData, 0);
  objc_storeStrong((id *)&self->_fauxCardData, 0);
}

@end