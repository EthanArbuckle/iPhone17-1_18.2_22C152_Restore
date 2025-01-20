@interface WDFixedChartViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (HKDataMetadataDetailSection)metadataSection;
- (HKInteractiveChartViewController)chartController;
- (HKValueRange)fixedRange;
- (WDFixedChartViewController)initWithInteractiveChartViewController:(id)a3 sessionSample:(id)a4 profile:(id)a5 title:(id)a6;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)cellForChart;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation WDFixedChartViewController

- (WDFixedChartViewController)initWithInteractiveChartViewController:(id)a3 sessionSample:(id)a4 profile:(id)a5 title:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)WDFixedChartViewController;
  v15 = [(WDFixedChartViewController *)&v23 initWithStyle:1];
  v16 = v15;
  if (v15)
  {
    [(WDFixedChartViewController *)v15 setTitle:v14];
    objc_storeStrong((id *)&v16->_chartController, a3);
    id v17 = objc_alloc(MEMORY[0x263F466B0]);
    v18 = [v13 displayTypeController];
    v19 = [v13 unitController];
    uint64_t v20 = [v17 initWithSample:v12 displayTypeController:v18 unitController:v19];
    metadataSection = v16->_metadataSection;
    v16->_metadataSection = (HKDataMetadataDetailSection *)v20;
  }
  return v16;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WDFixedChartViewController;
  [(HKTableViewController *)&v7 viewDidLoad];
  v3 = [(WDFixedChartViewController *)self tableView];
  [v3 setRowHeight:*MEMORY[0x263F1D600]];
  [v3 setEstimatedRowHeight:300.0];
  id v4 = objc_alloc(MEMORY[0x263F1CB60]);
  v5 = [(WDFixedChartViewController *)self tableView];
  [v5 bounds];
  v6 = objc_msgSend(v4, "initWithFrame:", 0.0, 0.0);
  [v3 setTableHeaderView:v6];
}

- (id)cellForChart
{
  v3 = [(WDFixedChartViewController *)self tableView];
  id v4 = [v3 dequeueReusableCellWithIdentifier:@"FixedChartReuseIdentifier"];

  if (!v4) {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F46A58]) initWithReuseIdentifier:@"FixedChartReuseIdentifier"];
  }
  v5 = [(HKInteractiveChartViewController *)self->_chartController view];
  [v4 setHostedView:v5];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1) {
    return [(HKDataMetadataDetailSection *)self->_metadataSection numberOfRowsInSection];
  }
  else {
    return 1;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 section];
  if (v9 == 1)
  {
    uint64_t v10 = -[HKDataMetadataDetailSection cellForIndex:tableView:](self->_metadataSection, "cellForIndex:tableView:", [v8 row], v7);
  }
  else
  {
    if (v9) {
      goto LABEL_6;
    }
    uint64_t v10 = [(WDFixedChartViewController *)self cellForChart];
  }
  id v4 = (void *)v10;
LABEL_6:

  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.5;
}

- (HKValueRange)fixedRange
{
  return self->_fixedRange;
}

- (HKInteractiveChartViewController)chartController
{
  return self->_chartController;
}

- (HKDataMetadataDetailSection)metadataSection
{
  return self->_metadataSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataSection, 0);
  objc_storeStrong((id *)&self->_chartController, 0);

  objc_storeStrong((id *)&self->_fixedRange, 0);
}

@end