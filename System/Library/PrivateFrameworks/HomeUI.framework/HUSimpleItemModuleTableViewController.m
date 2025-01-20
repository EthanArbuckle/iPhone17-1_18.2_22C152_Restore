@interface HUSimpleItemModuleTableViewController
+ (unint64_t)updateMode;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HUSimpleItemModuleTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUSimpleItemModuleTableViewController)initWithTableViewStyle:(int64_t)a3 moduleCreator:(id)a4 moduleControllerBuilder:(id)a5;
- (NSArray)moduleControllers;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)moduleControllerBuilder;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (void)_updateTitle;
- (void)dismissTextViewController;
- (void)setModuleControllerBuilder:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation HUSimpleItemModuleTableViewController

- (HUSimpleItemModuleTableViewController)initWithTableViewStyle:(int64_t)a3 moduleCreator:(id)a4 moduleControllerBuilder:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUSimpleItemModuleTableViewController.m", 30, @"Invalid parameter not satisfying: %@", @"moduleCreator" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HUSimpleItemModuleTableViewController.m", 31, @"Invalid parameter not satisfying: %@", @"moduleControllerBuilder" object file lineNumber description];

LABEL_3:
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:0];
  [v12 setItemModuleCreator:v9];
  v18.receiver = self;
  v18.super_class = (Class)HUSimpleItemModuleTableViewController;
  v13 = [(HUItemTableViewController *)&v18 initWithItemManager:v12 tableViewStyle:a3];
  v14 = v13;
  if (v13) {
    [(HUSimpleItemModuleTableViewController *)v13 setModuleControllerBuilder:v11];
  }

  return v14;
}

- (HUSimpleItemModuleTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithTableViewStyle_moduleCreator_moduleControllerBuilder_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSimpleItemModuleTableViewController.m", 45, @"%s is unavailable; use %@ instead",
    "-[HUSimpleItemModuleTableViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  v5 = [(HUSimpleItemModuleTableViewController *)self moduleControllerBuilder];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

+ (unint64_t)updateMode
{
  return 1;
}

- (void)_updateTitle
{
  id v4 = [(HUSimpleItemModuleTableViewController *)self title];
  v3 = [(HUSimpleItemModuleTableViewController *)self navigationItem];
  [v3 setTitle:v4];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HUSimpleItemModuleTableViewController;
  [(HUItemTableViewController *)&v4 viewDidLayoutSubviews];
  if ([(HUItemTableViewController *)self wantsPreferredContentSize])
  {
    v3 = [(HUSimpleItemModuleTableViewController *)self tableView];
    [v3 contentSize];
    -[HUSimpleItemModuleTableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HUSimpleItemModuleTableViewController;
  v5 = [(HUItemTableViewController *)&v11 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 messageTextView];
    [v9 setDelegate:self];
  }

  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 attributedFooterTitleForSection:a4];

  if (v8)
  {
    id v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"footerReuseIdentifier"];

    if (!v9) {
      id v9 = [[HUItemTableSectionHeaderFooterView alloc] initWithReuseIdentifier:@"footerReuseIdentifier"];
    }
    id v10 = [(HUItemTableViewController *)self itemManager];
    objc_super v11 = [v10 displayedSectionIdentifierForSectionIndex:a4];
    v12 = [(HUItemTableSectionHeaderFooterView *)v9 messageTextView];
    [v12 setIdentifier:v11];

    v13 = [(HUItemTableSectionHeaderFooterView *)v9 messageTextView];
    [v13 setDelegate:self];

    [(HUItemTableSectionHeaderFooterView *)v9 setType:1];
    [(HUItemTableSectionHeaderFooterView *)v9 setMessage:v8];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HUSimpleItemModuleTableViewController;
    id v9 = [(HUItemTableViewController *)&v15 tableView:v6 viewForFooterInSection:a4];
  }

  return v9;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [MEMORY[0x1E4F69378] sharedInstance];
  id v10 = (id)[v9 openURL:v7];

  return 1;
}

- (void)dismissTextViewController
{
  uint64_t v3 = [(HUSimpleItemModuleTableViewController *)self navigationController];
  objc_super v4 = (void *)v3;
  if (v3) {
    v5 = (HUSimpleItemModuleTableViewController *)v3;
  }
  else {
    v5 = self;
  }
  id v6 = v5;

  [(HUSimpleItemModuleTableViewController *)v6 dismissViewControllerAnimated:1 completion:0];
}

- (NSArray)moduleControllers
{
  return self->_moduleControllers;
}

- (id)moduleControllerBuilder
{
  return self->_moduleControllerBuilder;
}

- (void)setModuleControllerBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_moduleControllerBuilder, 0);

  objc_storeStrong((id *)&self->_moduleControllers, 0);
}

@end