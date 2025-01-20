@interface ASTIconPickerTableViewController
- (AssistiveTouchCustomizeController)iconPickerDelegate;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setIconPickerDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ASTIconPickerTableViewController

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASTIconPickerTableViewController;
  [(ASTIconPickerTableViewController *)&v7 viewWillAppear:a3];
  v4 = [(ASTIconPickerTableViewController *)self tableView];
  [v4 setRowHeight:UITableViewAutomaticDimension];

  double v5 = UITableDefaultRowHeight;
  v6 = [(ASTIconPickerTableViewController *)self tableView];
  [v6 setEstimatedRowHeight:v5];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v5 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  id v6 = [v5 astNumberOfRowsInSection:a4];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  v9 = [v8 astPickerCellForRowAtIndexPath:v6 tableView:v7];

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  [v11 astTableView:v10 willDisplayCell:v9 forRowAtIndexPath:v8];

  v12 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  id v18 = [v12 iconForIndexPath:v8];

  v13 = +[AXSettings sharedInstance];
  v14 = [v13 assistiveTouchMainScreenCustomization];

  v15 = [v14 allValues];
  LODWORD(v8) = [v15 containsObject:v18];

  uint64_t v16 = v8 ^ 1;
  v17 = [v9 textLabel];

  [v17 setEnabled:v16];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  id v4 = [v3 astNumberOfSections];

  return (int64_t)v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  [v8 astTableView:v7 didSelectRowAtIndexPath:v6];

  id v9 = +[AXSettings sharedInstance];
  id v10 = [v9 assistiveTouchMainScreenCustomization];
  id v25 = [v10 mutableCopy];

  v11 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  v12 = [v11 selectedPopoverIcon];
  v13 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  v14 = [v13 selectedPopoverLocation];
  [v25 setObject:v12 forKeyedSubscript:v14];

  v15 = +[AXSettings sharedInstance];
  [v15 setAssistiveTouchMainScreenCustomization:v25];

  uint64_t v16 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  v17 = [v16 customizeCell];
  id v18 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  v19 = [v18 selectedPopoverLocation];
  v20 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  v21 = [v20 selectedPopoverIcon];
  v22 = +[AXSettings sharedInstance];
  v23 = [v22 assistiveTouchMainScreenCustomization];
  [v23 count];
  [v17 updateButton:v19 withIcon:v21 layout:AXAssistiveTouchNamedLayout()];

  v24 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  [v24 didUpdateCustomizeCellHeight];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v5 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  id v6 = [v5 astTitleForSection:a4];

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ASTIconPickerTableViewController *)self iconPickerDelegate];
  id v7 = [v6 iconForIndexPath:v5];

  id v8 = +[AXSettings sharedInstance];
  id v9 = [v8 assistiveTouchMainScreenCustomization];

  id v10 = [v9 allValues];
  unsigned __int8 v11 = [v10 containsObject:v7];

  if (v11) {
    id v12 = 0;
  }
  else {
    id v12 = v5;
  }

  return v12;
}

- (AssistiveTouchCustomizeController)iconPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconPickerDelegate);

  return (AssistiveTouchCustomizeController *)WeakRetained;
}

- (void)setIconPickerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end