@interface AAUIDataclassPickerViewController
+ (BOOL)supportsSecureCoding;
- (AAUIDataclassPickerViewController)initWithCoder:(id)a3;
- (AAUIDataclassPickerViewController)initWithDataclassOptions:(id)a3 account:(id)a4;
- (AAUIDataclassPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AAUIDataclassPickerViewControllerDelegate)delegate;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (NSDictionary)dataclassOptions;
- (NSString)telemetryFlowID;
- (double)_compressedHeightForView:(id)a3 containedInView:(id)a4;
- (double)heightForHeaderInTableView:(id)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_cancelBarButtonItem;
- (id)_messageText;
- (id)_nextBarButtonItem;
- (id)_signOutFooterText;
- (id)_tableFooterView;
- (id)_tableHeaderView;
- (id)_tableView;
- (id)_titleText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_additionalInformationSelected:(id)a3;
- (void)_cancelButtonSelected:(id)a3;
- (void)_delegate_signOutViewControllerDidCancel;
- (void)_delegate_signOutViewControllerDidCompleteWithDataclassActions:(id)a3;
- (void)_dismissAdditionalInformation:(id)a3;
- (void)_nextButtonSelected:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadView;
- (void)setDataclassOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
- (void)switchTableViewCellDidUpdateValue:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AAUIDataclassPickerViewController

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAUIDataclassPickerViewController)initWithDataclassOptions:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIDataclassPickerViewController;
  v8 = [(AAUIDataclassPickerViewController *)&v12 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = [[_AAUIDataclassOptionCache alloc] initWithDataclassOptions:v6];
    dataclassOptionCache = v8->_dataclassOptionCache;
    v8->_dataclassOptionCache = v9;

    objc_storeStrong((id *)&v8->_account, a4);
  }

  return v8;
}

- (AAUIDataclassPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(AAUIDataclassPickerViewController *)self initWithDataclassOptions:0 account:0];
}

- (AAUIDataclassPickerViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AAUIDataclassPickerViewController;
  v5 = [(AAUIDataclassPickerViewController *)&v14 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_dataclassOptions"];

    v11 = [[_AAUIDataclassOptionCache alloc] initWithDataclassOptions:v10];
    dataclassOptionCache = v5->_dataclassOptionCache;
    v5->_dataclassOptionCache = v11;
  }
  return v5;
}

- (void)loadView
{
  v3 = [AAUIBuddyView alloc];
  id v4 = -[AAUIBuddyView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AAUIDataclassPickerViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v42[4] = *MEMORY[0x263EF8340];
  v40.receiver = self;
  v40.super_class = (Class)AAUIDataclassPickerViewController;
  [(AAUIDataclassPickerViewController *)&v40 viewDidLoad];
  v3 = [(AAUIDataclassPickerViewController *)self navigationItem];
  id v4 = [(AAUIDataclassPickerViewController *)self _cancelBarButtonItem];
  [v3 setLeftBarButtonItem:v4];

  v5 = [(AAUIDataclassPickerViewController *)self navigationItem];
  id v6 = [(AAUIDataclassPickerViewController *)self _nextBarButtonItem];
  [v5 setRightBarButtonItem:v6];

  uint64_t v7 = [(AAUIDataclassPickerViewController *)self _tableView];
  uint64_t v8 = [(AAUIDataclassPickerViewController *)self view];
  [v8 addSubview:v7];

  v29 = (void *)MEMORY[0x263F08938];
  v37 = [v7 topAnchor];
  v38 = [(AAUIDataclassPickerViewController *)self view];
  v36 = [v38 contentLayoutGuide];
  v35 = [v36 topAnchor];
  v34 = [v37 constraintEqualToAnchor:v35];
  v42[0] = v34;
  v32 = [v7 leftAnchor];
  v33 = [(AAUIDataclassPickerViewController *)self view];
  v31 = [v33 contentLayoutGuide];
  v30 = [v31 leftAnchor];
  v28 = [v32 constraintEqualToAnchor:v30];
  v42[1] = v28;
  v39 = v7;
  v26 = [v7 rightAnchor];
  v27 = [(AAUIDataclassPickerViewController *)self view];
  v9 = [v27 contentLayoutGuide];
  v10 = [v9 rightAnchor];
  v11 = [v26 constraintEqualToAnchor:v10];
  v42[2] = v11;
  objc_super v12 = [v7 bottomAnchor];
  v13 = [(AAUIDataclassPickerViewController *)self view];
  objc_super v14 = [v13 contentLayoutGuide];
  v15 = [v14 bottomAnchor];
  v16 = [v12 constraintEqualToAnchor:v15];
  v42[3] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  [v29 activateConstraints:v17];

  v18 = (void *)MEMORY[0x263F202A8];
  uint64_t v19 = *MEMORY[0x263F25A50];
  v20 = [(ACAccount *)self->_account aa_altDSID];
  v21 = [v18 analyticsEventWithName:v19 altDSID:v20 flowID:self->_telemetryFlowID];

  uint64_t v22 = *MEMORY[0x263F25C00];
  v41[0] = *MEMORY[0x263F25BF8];
  v41[1] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  v24 = objc_msgSend(v23, "aaf_arrayAsCommaSeperatedString");
  [v21 setObject:v24 forKeyedSubscript:*MEMORY[0x263F345E8]];

  v25 = [MEMORY[0x263F25780] reporter];
  [v25 sendEvent:v21];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIDataclassPickerViewController;
  [(AAUIDataclassPickerViewController *)&v5 viewWillAppear:a3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AAUIDataclassPickerViewController_viewWillAppear___block_invoke;
  block[3] = &unk_263F92168;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__AAUIDataclassPickerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) reloadData];
}

- (void)viewWillLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)AAUIDataclassPickerViewController;
  [(AAUIDataclassPickerViewController *)&v11 viewWillLayoutSubviews];
  v3 = [(AAUIDataclassPickerViewController *)self topLayoutGuide];
  [v3 length];
  double v5 = v4;
  id v6 = [(AAUIDataclassPickerViewController *)self bottomLayoutGuide];
  [v6 length];
  double v8 = v7;
  [(UITableView *)self->_tableView frame];
  double MaxX = CGRectGetMaxX(v12);
  v10 = [(AAUIDataclassPickerViewController *)self view];
  [v10 bounds];
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v5, 0.0, v8, MaxX - CGRectGetWidth(v13));
}

- (NSDictionary)dataclassOptions
{
  return [(_AAUIDataclassOptionCache *)self->_dataclassOptionCache dataclassOptions];
}

- (void)setDataclassOptions:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(_AAUIDataclassOptionCache *)self->_dataclassOptionCache setDataclassOptions:v4];

  tableView = self->_tableView;
  [(UITableView *)tableView reloadData];
}

- (id)_cancelBarButtonItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonSelected_];
  return v2;
}

- (id)_nextBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v5 = [v4 localizedStringForKey:@"SIGN_OUT_NAVBAR_NEXT" value:&stru_26BD39CD8 table:@"Localizable"];
  id v6 = (void *)[v3 initWithTitle:v5 style:2 target:self action:sel__nextButtonSelected_];

  return v6;
}

- (id)_tableHeaderView
{
  v31[4] = *MEMORY[0x263EF8340];
  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    id v4 = [AAUIBuddyView alloc];
    double v5 = -[AAUIBuddyView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = self->_tableHeaderView;
    self->_tableHeaderView = v5;

    id v7 = objc_alloc(MEMORY[0x263F5B8C0]);
    double v8 = [(AAUIDataclassPickerViewController *)self _titleText];
    v9 = [(AAUIDataclassPickerViewController *)self _messageText];
    v10 = (void *)[v7 initWithTitle:v8 detailText:v9 icon:0];

    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AAUIBuddyView *)self->_tableHeaderView addSubview:v10];
    id v23 = objc_alloc(MEMORY[0x263EFF980]);
    v29 = [v10 topAnchor];
    v30 = [(AAUIBuddyView *)self->_tableHeaderView contentLayoutGuide];
    v28 = [v30 topAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v31[0] = v27;
    v26 = [v10 leadingAnchor];
    v25 = [(AAUIBuddyView *)self->_tableHeaderView leadingAnchor];
    uint64_t v22 = [v26 constraintEqualToAnchor:v25];
    v31[1] = v22;
    v21 = [v10 trailingAnchor];
    objc_super v11 = [(AAUIBuddyView *)self->_tableHeaderView trailingAnchor];
    CGRect v12 = [v21 constraintEqualToAnchor:v11];
    v31[2] = v12;
    CGRect v13 = [v10 bottomAnchor];
    objc_super v14 = [(AAUIBuddyView *)self->_tableHeaderView contentLayoutGuide];
    v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v31[3] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
    v24 = (void *)[v23 initWithArray:v17];

    [MEMORY[0x263F08938] activateConstraints:v24];
    v18 = self->_tableHeaderView;
    uint64_t v19 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(AAUIBuddyView *)v18 setBackgroundColor:v19];

    [(AAUIBuddyView *)self->_tableHeaderView setAccessibilityIdentifier:@"header-view"];
    tableHeaderView = self->_tableHeaderView;
  }
  return tableHeaderView;
}

- (id)_tableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82C78]);
    double v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = self->_tableView;
    self->_tableView = v5;

    [(UITableView *)self->_tableView setAllowsSelection:0];
    id v7 = self->_tableView;
    double v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UITableView *)v7 setBackgroundColor:v8];

    [(UITableView *)self->_tableView setClipsToBounds:0];
    [(UITableView *)self->_tableView setDataSource:self];
    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView _setDrawsSeparatorAtTopOfSections:1];
    [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x263F839B8]];
    [(UITableView *)self->_tableView setSeparatorStyle:0];
    [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"DataclassCellIdentifier"];
    [(UITableView *)self->_tableView setAccessibilityIdentifier:@"tableView"];
    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_tableFooterView
{
  tableFooterView = self->_tableFooterView;
  if (!tableFooterView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82CA0]);
    double v5 = (UITableViewHeaderFooterView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = self->_tableFooterView;
    self->_tableFooterView = v5;

    id v7 = [(AAUIDataclassPickerViewController *)self _signOutFooterText];
    if (v7)
    {
      double v8 = [MEMORY[0x263F82918] groupedFooterConfiguration];
      [v8 setText:v7];
      [(UITableViewHeaderFooterView *)self->_tableFooterView setContentConfiguration:v8];
      [(UITableViewHeaderFooterView *)self->_tableFooterView setAccessibilityIdentifier:@"footer-view"];
    }
    v9 = self->_tableFooterView;
    v10 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UITableViewHeaderFooterView *)v9 setBackgroundColor:v10];

    tableFooterView = self->_tableFooterView;
  }
  return tableFooterView;
}

- (id)_signOutFooterText
{
  id v3 = [(AAUIDataclassPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 footerTextForDataclassPickerViewController:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_titleText
{
  id v3 = [(AAUIDataclassPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 titleTextForDataclassPickerViewController:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_messageText
{
  id v3 = [(AAUIDataclassPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 messageTextForDataclassPickerViewController:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_cancelButtonSelected:(id)a3
{
  id v4 = (void *)MEMORY[0x263F202A8];
  uint64_t v5 = *MEMORY[0x263F25A98];
  id v6 = [(ACAccount *)self->_account aa_altDSID];
  id v8 = [v4 analyticsEventWithName:v5 altDSID:v6 flowID:self->_telemetryFlowID];

  [v8 setObject:*MEMORY[0x263F25BF8] forKeyedSubscript:*MEMORY[0x263F345F8]];
  id v7 = [MEMORY[0x263F25780] reporter];
  [v7 sendEvent:v8];

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(AAUIDataclassPickerViewController *)self _delegate_signOutViewControllerDidCancel];
}

- (void)_nextButtonSelected:(id)a3
{
  id v4 = (void *)MEMORY[0x263F202A8];
  uint64_t v5 = *MEMORY[0x263F25A98];
  id v6 = [(ACAccount *)self->_account aa_altDSID];
  id v10 = [v4 analyticsEventWithName:v5 altDSID:v6 flowID:self->_telemetryFlowID];

  [v10 setObject:*MEMORY[0x263F25C00] forKeyedSubscript:*MEMORY[0x263F345F8]];
  id v7 = [MEMORY[0x263F25780] reporter];
  [v7 sendEvent:v10];

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v8 = [(_AAUIDataclassOptionCache *)self->_dataclassOptionCache dataclassOptions];
  v9 = objc_msgSend(v8, "aaf_map:", &__block_literal_global_129);

  [(AAUIDataclassPickerViewController *)self _delegate_signOutViewControllerDidCompleteWithDataclassActions:v9];
}

id __57__AAUIDataclassPickerViewController__nextButtonSelected___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 isEnabled]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }
  id v4 = [MEMORY[0x263EFB238] actionWithType:v3];
  return v4;
}

- (void)_additionalInformationSelected:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v14 = objc_alloc_init(MEMORY[0x263F5FAB8]);
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"SIGN_OUT_ADDITIONAL_INFO" value:&stru_26BD39CD8 table:@"Localizable"];
  [v14 setHTMLContent:v5 isFragment:1];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel__dismissAdditionalInformation_];
  id v7 = [v14 navigationItem];
  [v7 setRightBarButtonItem:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v14];
  [v8 setModalPresentationStyle:2];
  v9 = [v8 navigationBar];
  id v10 = objc_opt_new();
  [v9 setBackgroundImage:v10 forBarMetrics:0];

  objc_super v11 = [v8 navigationBar];
  CGRect v12 = objc_opt_new();
  [v11 setShadowImage:v12];

  CGRect v13 = [v8 navigationBar];
  [v13 setTranslucent:1];

  [(AAUIDataclassPickerViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)_dismissAdditionalInformation:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(AAUIDataclassPickerViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_delegate_signOutViewControllerDidCancel
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(AAUIDataclassPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 dataclassPickerViewControllerDidCancel:self];
  }
}

- (void)_delegate_signOutViewControllerDidCompleteWithDataclassActions:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v4 = [(AAUIDataclassPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 dataclassPickerViewController:self didCompleteWithDataclassActions:v5];
  }
}

- (void)switchTableViewCellDidUpdateValue:(id)a3
{
  dataclassOptionCache = self->_dataclassOptionCache;
  id v4 = a3;
  id v5 = [(_AAUIDataclassOptionCache *)dataclassOptionCache dataclassOptions];
  id v6 = [v4 dataclass];
  id v8 = [v5 objectForKeyedSubscript:v6];

  id v7 = [v4 control];

  objc_msgSend(v8, "setEnabled:", objc_msgSend(v7, "isOn"));
}

- (void)encodeWithCoder:(id)a3
{
  dataclassOptionCache = self->_dataclassOptionCache;
  id v4 = a3;
  id v5 = [(_AAUIDataclassOptionCache *)dataclassOptionCache dataclassOptions];
  [v4 encodeObject:v5 forKey:@"_dataclassOptions"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return self->_tableView == a3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_tableView != a3) {
    return 0;
  }
  id v5 = [(_AAUIDataclassOptionCache *)self->_dataclassOptionCache filteredDataclasses];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  dataclassOptionCache = self->_dataclassOptionCache;
  id v7 = a4;
  id v8 = a3;
  v9 = [(_AAUIDataclassOptionCache *)dataclassOptionCache filteredDataclasses];
  id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  objc_super v11 = [v8 dequeueReusableCellWithIdentifier:@"DataclassCellIdentifier" forIndexPath:v7];

  CGRect v12 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v11 setBackgroundColor:v12];

  [v11 setDelegate:self];
  [v11 setDataclass:v10];
  CGRect v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:v10 value:&stru_26BD39CD8 table:@"Localizable"];

  v15 = [v11 textLabel];
  [v15 setText:v14];

  v16 = [(_AAUIDataclassOptionCache *)self->_dataclassOptionCache dataclassOptions];
  v17 = [v16 objectForKeyedSubscript:v10];

  v18 = [v11 control];
  objc_msgSend(v18, "setEnabled:", objc_msgSend(v17, "isEditable"));

  uint64_t v19 = [v11 control];
  objc_msgSend(v19, "setOn:", objc_msgSend(v17, "isEnabled"));

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4
    || ([(_AAUIDataclassOptionCache *)self->_dataclassOptionCache filteredDataclasses],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        !v6))
  {
    id v4 = 0;
  }
  else
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"SIGN_OUT_TABLE_HEADER" value:&stru_26BD39CD8 table:@"Localizable"];
    id v4 = [v8 localizedUppercaseString];
  }
  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x263F839B8];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 setSeparatorStyle:1];
  [v5 _setShouldHaveFullLengthBottomSeparator:0];
  [v5 _setShouldHaveFullLengthTopSeparator:0];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(AAUIDataclassPickerViewController *)self _tableFooterView];
  }
  return v6;
}

- (double)heightForHeaderInTableView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AAUIDataclassPickerViewController *)self _tableHeaderView];
  [(AAUIDataclassPickerViewController *)self _compressedHeightForView:v5 containedInView:v4];
  double v7 = v6;

  return v7;
}

- (double)_compressedHeightForView:(id)a3 containedInView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v6 widthAnchor];
  [v5 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  v16 = [v7 constraintEqualToConstant:CGRectGetWidth(v20)];

  [v16 setActive:1];
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  double v18 = v17;

  [v16 setActive:0];
  return v18;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (AAUIDataclassPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIDataclassPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_dataclassOptionCache, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableFooterView, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
}

@end