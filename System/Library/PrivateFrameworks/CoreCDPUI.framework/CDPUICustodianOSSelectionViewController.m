@interface CDPUICustodianOSSelectionViewController
- (CDPUICustodianOSSelectionViewController)initWithViewModel:(id)a3 cdpContext:(id)a4;
- (double)heightForFooterInTableView:(id)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_makeEventForEscapeOptionSelected:(id)a3;
- (id)_makeViewAppearedEvent;
- (id)_offersJoinedByComma;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)viewForFooterInTableView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CDPUICustodianOSSelectionViewController

- (CDPUICustodianOSSelectionViewController)initWithViewModel:(id)a3 cdpContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 title];
  v10 = [v7 message];
  v14.receiver = self;
  v14.super_class = (Class)CDPUICustodianOSSelectionViewController;
  v11 = [(CDPTableViewController *)&v14 initWithTitle:v9 subTitle:v10];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewModel, a3);
    objc_storeStrong((id *)&v11->_cdpContext, a4);
    v12 = [(CDPUICustodianOSSelectionViewModel *)v11->_viewModel icon];
    [(CDPTableViewController *)v11 setIcon:v12];

    [(CDPTableViewController *)v11 setTableViewStyle:[(CDPUICustodianOSSelectionViewModel *)v11->_viewModel tableViewStyle]];
  }

  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDPUICustodianOSSelectionViewController;
  [(CDPUICustodianOSSelectionViewController *)&v6 viewDidAppear:a3];
  v4 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  v5 = [(CDPUICustodianOSSelectionViewController *)self _makeViewAppearedEvent];
  [v4 sendEvent:v5];
}

- (id)_makeViewAppearedEvent
{
  v3 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F346E0] category:*MEMORY[0x263F34830]];
  v4 = [(CDPUICustodianOSSelectionViewController *)self _offersJoinedByComma];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F345E8]];
  }

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v5 = [(CDPUICustodianOSSelectionViewModel *)self->_viewModel tableViewStyle] == 2;
  objc_super v6 = [(CDPUICustodianOSSelectionViewModel *)self->_viewModel options];
  int64_t v7 = [v6 count] - v5;

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(CDPTableViewController *)self tableView];
  int64_t v7 = [v6 dequeueReusableCellWithIdentifier:@"CDPOSCell"];

  if (!v7)
  {
    int64_t v7 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"CDPOSCell"];
    [v7 setAccessoryType:1];
  }
  uint64_t v8 = [v5 row];
  if ([(CDPUICustodianOSSelectionViewModel *)self->_viewModel tableViewStyle] == 2) {
    ++v8;
  }
  v9 = [(CDPUICustodianOSSelectionViewModel *)self->_viewModel options];
  v10 = [v9 objectAtIndexedSubscript:v8];

  v11 = [v10 title];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  v13 = (void *)MEMORY[0x263F81708];
  objc_super v14 = [v7 textLabel];
  v15 = [v14 font];
  [v15 pointSize];
  v16 = objc_msgSend(v13, "systemFontOfSize:");
  v17 = [v7 textLabel];
  [v17 setFont:v16];

  if ([(CDPUICustodianOSSelectionViewModel *)self->_viewModel tableViewStyle] == 2) {
    [MEMORY[0x263F825C8] systemGray6Color];
  }
  else {
  v18 = [MEMORY[0x263F825C8] systemBackgroundColor];
  }
  [v7 setBackgroundColor:v18];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(CDPUICustodianOSSelectionViewModel *)self->_viewModel tableViewStyle] == 2)
  {
    id v5 = [(CDPUICustodianOSSelectionViewModel *)self->_viewModel options];
    objc_super v6 = [v5 objectAtIndexedSubscript:0];
    int64_t v7 = [v6 title];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  if ([(CDPUICustodianOSSelectionViewModel *)self->_viewModel tableViewStyle] == 2) {
    ++v5;
  }
  objc_super v6 = [(CDPUICustodianOSSelectionViewModel *)self->_viewModel options];
  id v11 = [v6 objectAtIndexedSubscript:v5];

  int64_t v7 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  uint64_t v8 = [(CDPUICustodianOSSelectionViewController *)self _makeEventForEscapeOptionSelected:v11];
  [v7 sendEvent:v8];

  v9 = [v11 escapeAction];

  if (v9)
  {
    v10 = [v11 escapeAction];
    v10[2]();
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if ([a3 style] == 2) {
    double v5 = 44.0;
  }
  else {
    double v5 = 60.0;
  }
  objc_super v6 = [(CDPUICustodianOSSelectionViewController *)self traitCollection];
  int64_t v7 = [v6 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v7)) {
    double v5 = *MEMORY[0x263F839B8];
  }

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (double)heightForFooterInTableView:(id)a3
{
  return 90.0;
}

- (id)viewForFooterInTableView:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F82BF8]);
  [v4 setAxis:1];
  [v4 setAlignment:3];
  [v4 setDistribution:3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(CDPUICustodianOSSelectionViewModel *)self->_viewModel escapeOffers];
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = [MEMORY[0x263F824E8] buttonWithType:1];
        id v11 = [v9 escapeOfferName];
        [v10 setTitle:v11 forState:0];

        v12 = [v10 titleLabel];
        v13 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
        [v12 setFont:v13];

        objc_super v14 = [v10 titleLabel];
        [v14 setTextAlignment:1];

        [v10 addTarget:v9 action:sel_handleEscapeAction_ forControlEvents:64];
        [v10 sizeToFit];
        [v4 addArrangedSubview:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_offersJoinedByComma
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(CDPUICustodianOSSelectionViewController *)self navigationItem];
  uint64_t v5 = [v4 backBarButtonItem];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263F34850];
  }
  else
  {
    uint64_t v7 = [(CDPUICustodianOSSelectionViewController *)self navigationItem];
    uint64_t v8 = [v7 leftBarButtonItem];

    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v6 = (void *)MEMORY[0x263F34858];
  }
  [v3 addObject:*v6];
LABEL_6:
  v9 = [(CDPUICustodianOSSelectionViewModel *)self->_viewModel options];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __63__CDPUICustodianOSSelectionViewController__offersJoinedByComma__block_invoke;
  v20[3] = &unk_26433DCA0;
  id v10 = v3;
  id v21 = v10;
  [v9 enumerateObjectsUsingBlock:v20];

  id v11 = [(CDPUICustodianOSSelectionViewModel *)self->_viewModel escapeOffers];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  long long v17 = __63__CDPUICustodianOSSelectionViewController__offersJoinedByComma__block_invoke_2;
  long long v18 = &unk_26433D470;
  id v12 = v10;
  id v19 = v12;
  [v11 enumerateObjectsUsingBlock:&v15];

  if (objc_msgSend(v12, "count", v15, v16, v17, v18))
  {
    v13 = objc_msgSend(v12, "aaf_arrayAsCommaSeperatedString");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __63__CDPUICustodianOSSelectionViewController__offersJoinedByComma__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 titleTelemetryKey];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v6 titleTelemetryKey];
    [v4 addObject:v5];
  }
}

void __63__CDPUICustodianOSSelectionViewController__offersJoinedByComma__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 titleTelemetryKey];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v6 titleTelemetryKey];
    [v4 addObject:v5];
  }
}

- (id)_makeEventForEscapeOptionSelected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_cdpContext eventName:*MEMORY[0x263F34600] category:*MEMORY[0x263F34830]];
  id v6 = [v4 titleTelemetryKey];

  if (v6)
  {
    uint64_t v7 = [v4 titleTelemetryKey];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F345F8]];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end