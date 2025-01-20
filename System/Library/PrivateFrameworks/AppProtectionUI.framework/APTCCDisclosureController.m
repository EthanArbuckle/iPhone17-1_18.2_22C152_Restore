@interface APTCCDisclosureController
- (APTCCDisclosureController)initWithApplication:(id)a3 users:(id)a4 includeDoneButton:(BOOL)a5 scrollViewAssistant:(id)a6;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addDoneButtonTarget:(id)a3 action:(SEL)a4;
- (void)setScrollContentInsets;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation APTCCDisclosureController

- (APTCCDisclosureController)initWithApplication:(id)a3 users:(id)a4 includeDoneButton:(BOOL)a5 scrollViewAssistant:(id)a6
{
  BOOL v44 = a5;
  v56[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v43 = a4;
  id v52 = a4;
  id v42 = a6;
  id v51 = a6;
  v50 = [v9 findApplicationRecordWithError:0];
  uint64_t v10 = [v50 localizedName];
  v11 = APUIFrameworkBundle();
  v12 = [v11 localizedStringForKey:@"TCC_ACCESS_HEADER_FMT" value:&stru_26FC11A68 table:@"Localizable"];

  v49 = (void *)v10;
  v13 = objc_msgSend(NSString, "stringWithFormat:", v12, v10);

  v14 = APUIDataclassLocalizedName(v9);
  v15 = NSString;
  v16 = APGetPreferredAuthenticationMechanismLocKey();
  v17 = [v15 stringWithFormat:@"TCC_ACCESS_DETAIL_FMT_%@", v16];
  v18 = APUILocStr(v17);

  v19 = objc_msgSend(NSString, "stringWithFormat:", v18, v14);

  v55.receiver = self;
  v55.super_class = (Class)APTCCDisclosureController;
  v20 = [(OBTableWelcomeController *)&v55 initWithTitle:v13 detailText:v19 icon:0 adoptTableViewScrollView:1];

  v21 = [APSymbolBadgedAppIconView alloc];
  +[APSymbolBadgedAppIconView metricsForEducation];
  v53 = v9;
  v22 = [(APSymbolBadgedAppIconView *)v21 initWithApplication:v9 symbolType:@"com.apple.appprotection.lock.education" metrics:v54];
  [(APSymbolBadgedAppIconView *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [(APTCCDisclosureController *)v20 headerView];
  v24 = [v23 customIconContainerView];
  [v24 addSubview:v22];

  v45 = (void *)MEMORY[0x263F08938];
  v46 = [(APSymbolBadgedAppIconView *)v22 centerXAnchor];
  v47 = [(APTCCDisclosureController *)v20 headerView];
  v25 = [v47 customIconContainerView];
  v26 = [v25 centerXAnchor];
  v27 = [v46 constraintEqualToAnchor:v26];
  v56[0] = v27;
  v48 = v22;
  v28 = [(APSymbolBadgedAppIconView *)v22 centerYAnchor];
  v29 = [(APTCCDisclosureController *)v20 headerView];
  v30 = [v29 customIconContainerView];
  v31 = [v30 centerYAnchor];
  v32 = [v28 constraintEqualToAnchor:v31];
  v56[1] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  [v45 activateConstraints:v33];

  if (v20)
  {
    objc_storeStrong((id *)&v20->_app, a3);
    objc_storeStrong((id *)&v20->_scrollViewAssistant, v42);
    objc_storeStrong((id *)&v20->_users, v43);
    if (v44)
    {
      uint64_t v34 = [MEMORY[0x263F5B898] boldButton];
      doneButton = v20->_doneButton;
      v20->_doneButton = (OBBoldTrayButton *)v34;

      v36 = v20->_doneButton;
      v37 = APUIFrameworkBundle();
      v38 = [v37 localizedStringForKey:@"DONE" value:&stru_26FC11A68 table:@"Localizable"];
      [(OBBoldTrayButton *)v36 setTitle:v38 forState:0];

      v39 = [(APTCCDisclosureController *)v20 buttonTray];
      [v39 addButton:v20->_doneButton];
    }
  }

  return v20;
}

- (void)addDoneButtonTarget:(id)a3 action:(SEL)a4
{
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)APTCCDisclosureController;
  [(OBTableWelcomeController *)&v12 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  v5 = [(OBTableWelcomeController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"APTCCDisclosureCell"];

  v6 = [(OBTableWelcomeController *)self tableView];
  [v6 setDataSource:self];

  v7 = [(OBTableWelcomeController *)self tableView];
  [v7 setDelegate:self];

  v8 = [(OBTableWelcomeController *)self tableView];
  id v9 = [MEMORY[0x263F825C8] clearColor];
  [v8 setBackgroundColor:v9];

  uint64_t v10 = [(OBTableWelcomeController *)self tableView];
  [v10 setBackgroundView:0];

  v11 = [(OBTableWelcomeController *)self tableView];
  [v11 reloadData];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(OBTableWelcomeController *)self tableView];
  v7 = [v6 dequeueReusableCellWithIdentifier:@"APTCCDisclosureCell"];

  users = self->_users;
  uint64_t v9 = [v5 row];

  uint64_t v10 = [(NSArray *)users objectAtIndex:v9];
  [v7 configureForRecord:v10];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return [(NSArray *)self->_users count];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)setScrollContentInsets
{
  scrollViewAssistant = self->_scrollViewAssistant;
  id v3 = [(OBTableWelcomeController *)self scrollView];
  [(APButtonTrayScrollViewAssistant *)scrollViewAssistant performAdjustmentsForScrollView:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)APTCCDisclosureController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  [(APTCCDisclosureController *)self setScrollContentInsets];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)APTCCDisclosureController;
  [(OBTableWelcomeController *)&v3 viewDidLayoutSubviews];
  [(APTCCDisclosureController *)self setScrollContentInsets];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_scrollViewAssistant, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersWithAccess, 0);

  objc_storeStrong((id *)&self->_app, 0);
}

@end