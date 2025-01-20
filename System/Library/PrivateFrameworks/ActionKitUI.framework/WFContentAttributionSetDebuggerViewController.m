@interface WFContentAttributionSetDebuggerViewController
- (NSArray)contentItems;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setContentItems:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFContentAttributionSetDebuggerViewController

- (void).cxx_destruct
{
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(WFContentAttributionSetDebuggerViewController *)self contentItems];
  v6 = [v5 objectAtIndexedSubscript:a4];
  v7 = [v6 name];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"WFContentAttributionCellIdentifier" forIndexPath:v6];
  v8 = [(WFContentAttributionSetDebuggerViewController *)self contentItems];
  v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v10 = [v9 attributionSet];
  v11 = [v10 attributions];
  uint64_t v12 = [v6 row];

  v13 = [v11 objectAtIndexedSubscript:v12];

  [v7 updateCellWithContentAttribution:v13];
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(WFContentAttributionSetDebuggerViewController *)self contentItems];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  v7 = [v6 attributionSet];
  v8 = [v7 attributions];
  int64_t v9 = [v8 count];

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(WFContentAttributionSetDebuggerViewController *)self contentItems];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)WFContentAttributionSetDebuggerViewController;
  [(WFContentAttributionSetDebuggerViewController *)&v6 viewDidLoad];
  [(WFContentAttributionSetDebuggerViewController *)self setTitle:@"Content Source"];
  v3 = [(WFContentAttributionSetDebuggerViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"WFContentAttributionCellIdentifier"];

  double v4 = *MEMORY[0x263F839B8];
  v5 = [(WFContentAttributionSetDebuggerViewController *)self tableView];
  [v5 setRowHeight:v4];
}

- (void)setContentItems:(id)a3
{
  double v4 = (NSArray *)[a3 copy];
  contentItems = self->_contentItems;
  self->_contentItems = v4;

  if ([(WFContentAttributionSetDebuggerViewController *)self isViewLoaded])
  {
    id v6 = [(WFContentAttributionSetDebuggerViewController *)self tableView];
    [v6 reloadData];
  }
}

@end