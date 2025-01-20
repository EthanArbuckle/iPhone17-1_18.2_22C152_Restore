@interface DMCRMConfigurationsViewController
- (DMCRMConfigurationsViewController)initWithRMConfigurationsSpecifierProvider:(id)a3 scope:(int64_t)a4;
- (NSArray)rmSectionTitles;
- (NSArray)rmTableSectionCells;
- (RMConfigurationsSpecifierProvider)rmSpecifierProvider;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_rmConfigsChanged:(id)a3;
- (void)_setSections;
- (void)setRmSectionTitles:(id)a3;
- (void)setRmSpecifierProvider:(id)a3;
- (void)setRmTableSectionCells:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation DMCRMConfigurationsViewController

- (DMCRMConfigurationsViewController)initWithRMConfigurationsSpecifierProvider:(id)a3 scope:(int64_t)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMCRMConfigurationsViewController;
  v7 = [(DMCProfileTableViewController *)&v18 initWithStyle:2];
  if (v7)
  {
    int v8 = [MEMORY[0x263F38BA0] isSharediPad];
    v9 = @"DMC_USER_CONFIGURATIONS_TITLE";
    if (a4 == 1) {
      v9 = @"DMC_DEVICE_CONFIGURATIONS_TITLE";
    }
    if (v8) {
      v10 = v9;
    }
    else {
      v10 = @"DMC_CONFIGURATIONS_TITLE";
    }
    v11 = DMCEnrollmentLocalizedString(v10);
    [(DMCRMConfigurationsViewController *)v7 setTitle:v11];

    v17.receiver = v7;
    v17.super_class = (Class)DMCRMConfigurationsViewController;
    [(DMCProfileTableViewController *)&v17 updateExtendedLayoutIncludesOpaqueBars];
    v16.receiver = v7;
    v16.super_class = (Class)DMCRMConfigurationsViewController;
    [(DMCProfileTableViewController *)&v16 reloadTableOnContentSizeCategoryChange];
    [(DMCRMConfigurationsViewController *)v7 setRmSpecifierProvider:v6];
    v12 = [(DMCRMConfigurationsViewController *)v7 rmSpecifierProvider];
    v13 = [(DMCRMConfigurationsViewController *)v7 tableView];
    [v12 registerSpecifierBridgeForTableView:v13];

    [(DMCRMConfigurationsViewController *)v7 _setSections];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v7 selector:sel__rmConfigsChanged_ name:@"RMConfigurationsSpecifiersDidChangeNotification" object:0];
  }
  return v7;
}

- (void)_setSections
{
  v3 = [(DMCRMConfigurationsViewController *)self rmSpecifierProvider];
  v4 = [(DMCRMConfigurationsViewController *)self tableView];
  v5 = [v3 tableSectionCellsForSpecifiersInTableView:v4];
  [(DMCRMConfigurationsViewController *)self setRmTableSectionCells:v5];

  id v7 = [(DMCRMConfigurationsViewController *)self rmSpecifierProvider];
  id v6 = [v7 sectionTitles];
  [(DMCRMConfigurationsViewController *)self setRmSectionTitles:v6];
}

- (void)_rmConfigsChanged:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__DMCRMConfigurationsViewController__rmConfigsChanged___block_invoke;
  v3[3] = &unk_2645E9398;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __55__DMCRMConfigurationsViewController__rmConfigsChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setSections];
    v2 = [v3 tableView];
    [v2 reloadData];

    id WeakRetained = v3;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(DMCRMConfigurationsViewController *)self rmTableSectionCells];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(DMCRMConfigurationsViewController *)self rmTableSectionCells];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  int64_t v7 = [v6 count];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(DMCRMConfigurationsViewController *)self rmSectionTitles];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(DMCRMConfigurationsViewController *)self rmTableSectionCells];
  int64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  uint64_t v8 = [v5 row];

  v9 = [v7 objectAtIndexedSubscript:v8];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a4;
  id v5 = [(DMCRMConfigurationsViewController *)self rmTableSectionCells];
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));
  int64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
  uint64_t v8 = [v7 detailViewController];

  if (v8) {
    [(DMCProfileTableViewController *)self presentViewController:v8];
  }
  else {
    NSLog(&cfstr_Dmcrmconfigura.isa, v9);
  }
}

- (RMConfigurationsSpecifierProvider)rmSpecifierProvider
{
  return self->_rmSpecifierProvider;
}

- (void)setRmSpecifierProvider:(id)a3
{
}

- (NSArray)rmTableSectionCells
{
  return self->_rmTableSectionCells;
}

- (void)setRmTableSectionCells:(id)a3
{
}

- (NSArray)rmSectionTitles
{
  return self->_rmSectionTitles;
}

- (void)setRmSectionTitles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmSectionTitles, 0);
  objc_storeStrong((id *)&self->_rmTableSectionCells, 0);
  objc_storeStrong((id *)&self->_rmSpecifierProvider, 0);
}

@end