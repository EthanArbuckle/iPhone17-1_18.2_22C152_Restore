@interface AKAuthorizationEmailEditPaneViewController
- (AKAuthorizationScopeChoices)editableScopeChoices;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSString)applicationName;
- (id)tableView:(id)a3 anonymousCellForRow:(unint64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 emailCellForRow:(unint64_t)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setApplicationName:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AKAuthorizationEmailEditPaneViewController

- (void)viewDidLoad
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)AKAuthorizationEmailEditPaneViewController;
  [(AKAuthorizationPaneViewController *)&v28 viewDidLoad];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"AUTHORIZE_EMAIL_CONTACT" value:&stru_1F1EE8138 table:@"Localizable"];
  [(AKAuthorizationEmailEditPaneViewController *)self setTitle:v4];

  v5 = [(AKAuthorizationPaneViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKAuthorizationEmailAddressesTableViewCell"];

  v6 = [(AKAuthorizationPaneViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKAuthorizationEmailAnonymousTableViewCell"];

  v7 = [(AKAuthorizationPaneViewController *)self tableView];
  [v7 setDataSource:self];

  v8 = [(AKAuthorizationPaneViewController *)self tableView];
  [v8 setDelegate:self];

  id v9 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F43870], 0x8000);
  [v9 setFont:v10];

  [v9 setTextAlignment:1];
  [v9 setNumberOfLines:0];
  [v9 setAdjustsFontSizeToFitWidth:0];
  v11 = [(AKAuthorizationEmailEditPaneViewController *)self applicationName];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = NSString;
    v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"AUTHORIZE_EMAIL_EDIT_INFO_FORMAT" value:&stru_1F1EE8138 table:@"Localizable"];
    v16 = [(AKAuthorizationEmailEditPaneViewController *)self applicationName];
    v17 = objc_msgSend(v13, "stringWithFormat:", v15, v16);
    [v9 setText:v17];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"AUTHORIZE_EMAIL_EDIT_INFO" value:&stru_1F1EE8138 table:@"Localizable"];
    [v9 setText:v15];
  }

  v18 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  [v18 addArrangedSubview:v9];

  v19 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  id v20 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v19 addArrangedSubview:v20];

  v21 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [v9 widthAnchor];
  v23 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  v24 = [v23 widthAnchor];
  +[AKAuthorizationPaneMetrics editPaneInfoLabelHorizontalPadding];
  v26 = [v22 constraintEqualToAnchor:v24 constant:v25 * -2.0];
  v29[0] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  [v21 activateConstraints:v27];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationEmailEditPaneViewController;
  [(AKAuthorizationEmailEditPaneViewController *)&v5 viewWillDisappear:a3];
  v4 = [(AKAuthorizationPaneViewController *)self editableDataSources];
  [v4 setEditableScopeChoicesChanged:1];
}

- (AKAuthorizationScopeChoices)editableScopeChoices
{
  v2 = [(AKAuthorizationPaneViewController *)self editableDataSources];
  v3 = [v2 editableScopeChoices];

  return (AKAuthorizationScopeChoices *)v3;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] || objc_msgSend(v5, "row"))
  {
    if ([v5 section] == 1)
    {
      uint64_t v6 = [v5 row];
      v7 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
      BOOL v8 = v6 < [v7 emailCount];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 section];
  if (v8 == 1)
  {
    uint64_t v10 = [v6 row];
    v11 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
    uint64_t v12 = [v11 emailCount];

    if (v10 < v12)
    {
      v13 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
      [v13 setWantsPrivateEmail:0];

      uint64_t v14 = [v6 row];
      id v9 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
      [v9 setIndexOfChosenEmail:v14];
LABEL_12:

      goto LABEL_13;
    }
    v15 = _AKLogSiwa();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AKAuthorizationEmailEditPaneViewController tableView:didSelectRowAtIndexPath:](v6, self);
    }
  }
  else if (!v8)
  {
    if ([v6 row])
    {
      id v9 = _AKLogSiwa();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AKAuthorizationEmailEditPaneViewController tableView:didSelectRowAtIndexPath:](v6, v9);
      }
    }
    else
    {
      id v9 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
      [v9 setWantsPrivateEmail:1];
    }
    goto LABEL_12;
  }
LABEL_13:
  [v7 deselectRowAtIndexPath:v6 animated:0];
  [v7 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"AUTHORIZE_YOUR_EMAIL_ADDRESSES" value:&stru_1F1EE8138 table:@"Localizable"];
    id v6 = [v5 localizedUppercaseString];
    id v7 = [@"\n\n" stringByAppendingString:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    v4 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v4 = [v5 localizedStringForKey:@"AUTHORIZE_PRIVATE_EMAIL_FOOTER" value:&stru_1F1EE8138 table:@"Localizable"];
  }

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return 1;
  }
  if (a4 != 1) {
    return 0;
  }
  v4 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
  int64_t v5 = [v4 emailCount];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == 1)
  {
    uint64_t v9 = -[AKAuthorizationEmailEditPaneViewController tableView:emailCellForRow:](self, "tableView:emailCellForRow:", v6, [v7 row]);
    goto LABEL_5;
  }
  if (!v8)
  {
    uint64_t v9 = -[AKAuthorizationEmailEditPaneViewController tableView:anonymousCellForRow:](self, "tableView:anonymousCellForRow:", v6, [v7 row]);
LABEL_5:
    uint64_t v10 = (void *)v9;
    goto LABEL_7;
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

- (id)tableView:(id)a3 emailCellForRow:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
  unint64_t v8 = [v7 emailCount];

  if (v8 > a4)
  {
    uint64_t v9 = [v6 dequeueReusableCellWithIdentifier:@"AKAuthorizationEmailAddressesTableViewCell"];
    uint64_t v10 = [MEMORY[0x1E4F428B8] clearColor];
    [v9 setBackgroundColor:v10];

    [v9 setSelectionStyle:1];
    v11 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
    uint64_t v12 = [v11 emailAtIndex:a4];
    v13 = [v9 textLabel];
    [v13 setText:v12];

    uint64_t v14 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
    if ([v14 indexOfChosenEmail] == a4)
    {
      v15 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
      int v16 = [v15 wantsPrivateEmail];

      if (!v16)
      {
        uint64_t v17 = 3;
LABEL_10:
        [v9 setAccessoryType:v17];
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v17 = 0;
    goto LABEL_10;
  }
  v18 = _AKLogSiwa();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[AKAuthorizationEmailEditPaneViewController tableView:emailCellForRow:](a4, self);
  }

  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (id)tableView:(id)a3 anonymousCellForRow:(unint64_t)a4
{
  id v6 = [a3 dequeueReusableCellWithIdentifier:@"AKAuthorizationEmailAnonymousTableViewCell"];
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  unint64_t v8 = [v7 localizedStringForKey:@"AUTHORIZE_PRIVATE_EMAIL_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  uint64_t v9 = [v6 textLabel];
  [v9 setText:v8];

  uint64_t v10 = NSString;
  v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"AUTHORIZE_FORWARDED_TO_FORMAT" value:&stru_1F1EE8138 table:@"Localizable"];
  v13 = [(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices];
  uint64_t v14 = [v13 forwardingEmail];
  v15 = objc_msgSend(v10, "stringWithFormat:", v12, v14);
  int v16 = [v6 detailTextLabel];
  [v16 setText:v15];

  if (a4
    || ([(AKAuthorizationEmailEditPaneViewController *)self editableScopeChoices],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = [v17 wantsPrivateEmail],
        v17,
        (v18 & 1) == 0))
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 3;
  }
  [v6 setAccessoryType:v19];

  return v6;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "row"));
  int v4 = 138412290;
  int64_t v5 = v3;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "unexpected row %@ selected in Anonymous Email section", (uint8_t *)&v4, 0xCu);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(void *)a2 .cold.2(void *a1, void *a2)
{
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "row"));
  int v4 = NSNumber;
  int64_t v5 = [a2 editableScopeChoices];
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "emailCount"));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1C38C1000, v7, v8, "row %@ selected >= %@ emails available", v9, v10, v11, v12, v13);
}

- (void)tableView:(uint64_t)a1 emailCellForRow:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  v3 = [NSNumber numberWithUnsignedInteger:a1];
  int v4 = NSNumber;
  int64_t v5 = [a2 editableScopeChoices];
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "emailCount"));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1C38C1000, v7, v8, "cell row %@ >= %@ rows available", v9, v10, v11, v12, v13);
}

@end