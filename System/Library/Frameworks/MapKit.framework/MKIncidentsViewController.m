@interface MKIncidentsViewController
- (BOOL)_canShowWhileLocked;
- (GEOAdvisoriesInfo)advisoriesInfo;
- (GEOComposedRouteAdvisory)advisory;
- (IncidentsViewControllerDelegate)delegate;
- (MKIncidentsViewController)init;
- (MKIncidentsViewController)initWithTransitIncidents:(id)a3;
- (NSArray)transitIncidents;
- (NSString)incidentsTitle;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_advisoriesInfoCellForIndex:(int64_t)a3;
- (id)_advisoryItemCellForIndex:(int64_t)a3;
- (id)_cellForRow:(int64_t)a3 inSection:(int64_t)a4;
- (id)_transitCellForIndex:(int64_t)a3 inSection:(int64_t)a4;
- (id)accessoryFooterView;
- (id)detailCellInSection:(int64_t)a3;
- (id)extendedDetailCell;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_numberOfRowsInSection:(int64_t)a3;
- (int64_t)_sectionForSectionIndex:(int64_t)a3;
- (int64_t)_transitIncidentIndexForRow:(int64_t)a3 section:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_incidentsCount;
- (unint64_t)_transitIncidentsCount;
- (void)_compileSections;
- (void)_localeDidChange;
- (void)_updateTitle;
- (void)cellDidTapDownloadForLocation:(id)a3;
- (void)dealloc;
- (void)infoCardThemeChanged;
- (void)reloadDataSource;
- (void)setAdvisoriesInfo:(id)a3;
- (void)setAdvisory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTransitIncidents:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MKIncidentsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MKIncidentsViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)MKIncidentsViewController;
  return [(MKIncidentsViewController *)&v3 initWithStyle:1];
}

- (MKIncidentsViewController)initWithTransitIncidents:(id)a3
{
  id v5 = a3;
  v6 = [(MKIncidentsViewController *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitIncidents, a3);
    [(MKIncidentsViewController *)v7 reloadDataSource];
  }

  return v7;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)MKIncidentsViewController;
  [(MKIncidentsViewController *)&v20 viewDidLoad];
  objc_super v3 = [(MKIncidentsViewController *)self view];
  [v3 setAccessibilityIdentifier:@"MKIncidentsView"];

  v4 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  id v5 = [(MKIncidentsViewController *)self tableView];
  [v5 setBackgroundColor:v4];

  v6 = [(MKIncidentsViewController *)self tableView];
  [v6 _setDrawsSeparatorAtTopOfSections:0];

  v7 = [(MKIncidentsViewController *)self tableView];
  [v7 _setTopPadding:0.0];

  v8 = [(MKIncidentsViewController *)self tableView];
  [v8 _setBottomPadding:0.0];

  v9 = [(MKIncidentsViewController *)self tableView];
  [v9 setSectionHeaderHeight:0.0];

  v10 = [(MKIncidentsViewController *)self tableView];
  [v10 setSectionFooterHeight:0.0];

  v11 = [(MKIncidentsViewController *)self tableView];
  objc_msgSend(v11, "setSeparatorInset:", 0.0, 16.0, 0.0, 0.0);

  v12 = [(MKIncidentsViewController *)self tableView];
  uint64_t v13 = objc_opt_class();
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [v12 registerClass:v13 forHeaderFooterViewReuseIdentifier:v15];

  v16 = [(_MKTableViewController *)self separatorColor];
  v17 = [(MKIncidentsViewController *)self tableView];
  [v17 setSeparatorColor:v16];

  v18 = [(MKIncidentsViewController *)self view];
  [v18 setPreservesSuperviewLayoutMargins:1];

  v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v19 addObserver:self selector:sel__localeDidChange name:*MEMORY[0x1E4F1C370] object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKIncidentsViewController;
  [(MKIncidentsViewController *)&v5 viewWillAppear:a3];
  v4 = [(MKIncidentsViewController *)self tableView];
  objc_msgSend(v4, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)infoCardThemeChanged
{
  v5.receiver = self;
  v5.super_class = (Class)MKIncidentsViewController;
  [(UIViewController *)&v5 infoCardThemeChanged];
  objc_super v3 = [(_MKTableViewController *)self separatorColor];
  v4 = [(MKIncidentsViewController *)self tableView];
  [v4 setSeparatorColor:v3];
}

- (void)_updateTitle
{
  objc_super v3 = [(MKIncidentsViewController *)self advisoriesInfo];
  v4 = [v3 genericAdvisorys];
  objc_super v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F644D0]);
    v7 = [v5 detailCardTitle];
    v8 = (void *)[v6 initWithGeoFormattedString:v7];

    v9 = v8;
LABEL_5:
    v11 = [v9 stringWithDefaultOptions];
    incidentsTitle = self->_incidentsTitle;
    self->_incidentsTitle = v11;

    goto LABEL_6;
  }
  v10 = [(GEOComposedRouteAdvisory *)self->_advisory detailCardTitle];

  if (v10)
  {
    v9 = [(GEOComposedRouteAdvisory *)self->_advisory detailCardTitle];
    v8 = v9;
    goto LABEL_5;
  }
LABEL_6:
  if ([(NSString *)self->_incidentsTitle length])
  {
    uint64_t v13 = self->_incidentsTitle;
    v14 = [(MKIncidentsViewController *)self navigationItem];
    [v14 setTitle:v13];
  }
  else
  {
    v15 = _MKLocalizedStringFromThisBundle(@"Advisories_MapKit_Incidents");
    if ([(MKIncidentsViewController *)self _incidentsCount])
    {
      id v21 = 0;
      objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v15, @"%d", &v21, -[MKIncidentsViewController _incidentsCount](self, "_incidentsCount"));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v17 = v21;
      v18 = self->_incidentsTitle;
      self->_incidentsTitle = v16;

      v19 = self->_incidentsTitle;
      objc_super v20 = [(MKIncidentsViewController *)self navigationItem];
      [v20 setTitle:v19];
    }
  }
}

- (void)setTransitIncidents:(id)a3
{
  if (self->_transitIncidents != a3)
  {
    v4 = (NSArray *)[a3 copy];
    transitIncidents = self->_transitIncidents;
    self->_transitIncidents = v4;

    advisory = self->_advisory;
    self->_advisory = 0;

    advisoriesInfo = self->_advisoriesInfo;
    self->_advisoriesInfo = 0;

    [(MKIncidentsViewController *)self reloadDataSource];
  }
}

- (void)setAdvisoriesInfo:(id)a3
{
  id v4 = a3;
  advisoriesInfo = self->_advisoriesInfo;
  unint64_t v12 = (unint64_t)v4;
  id v6 = advisoriesInfo;
  if (v12 | (unint64_t)v6)
  {
    char v7 = [(id)v12 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      v8 = (GEOAdvisoriesInfo *)[(id)v12 copy];
      v9 = self->_advisoriesInfo;
      self->_advisoriesInfo = v8;

      transitIncidents = self->_transitIncidents;
      self->_transitIncidents = 0;

      advisory = self->_advisory;
      self->_advisory = 0;

      [(MKIncidentsViewController *)self reloadDataSource];
    }
  }
}

- (void)setAdvisory:(id)a3
{
  id v4 = a3;
  advisory = self->_advisory;
  unint64_t v12 = (unint64_t)v4;
  id v6 = advisory;
  if (v12 | (unint64_t)v6)
  {
    char v7 = [(id)v12 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      v8 = (GEOComposedRouteAdvisory *)[(id)v12 copy];
      v9 = self->_advisory;
      self->_advisory = v8;

      transitIncidents = self->_transitIncidents;
      self->_transitIncidents = 0;

      advisoriesInfo = self->_advisoriesInfo;
      self->_advisoriesInfo = 0;

      [(MKIncidentsViewController *)self reloadDataSource];
    }
  }
}

- (void)reloadDataSource
{
  [(MKIncidentsViewController *)self _updateTitle];
  [(MKIncidentsViewController *)self _compileSections];
  if ([(MKIncidentsViewController *)self isViewLoaded])
  {
    id v3 = [(MKIncidentsViewController *)self tableView];
    [v3 reloadData];
  }
}

- (void)_localeDidChange
{
  id v2 = [(MKIncidentsViewController *)self tableView];
  [v2 reloadData];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MKIncidentsViewController;
  [(MKIncidentsViewController *)&v4 dealloc];
}

- (id)_cellForRow:(int64_t)a3 inSection:(int64_t)a4
{
  int64_t v7 = [(MKIncidentsViewController *)self _sectionForSectionIndex:a4];
  if (v7 == 1)
  {
    v9 = [(MKIncidentsViewController *)self advisoriesInfo];

    if (v9) {
      [(MKIncidentsViewController *)self _advisoriesInfoCellForIndex:a3];
    }
    else {
    uint64_t v8 = [(MKIncidentsViewController *)self _advisoryItemCellForIndex:a3];
    }
  }
  else
  {
    if (v7)
    {
      v10 = [MKTableViewCell alloc];
      v11 = (objc_class *)objc_opt_class();
      unint64_t v12 = NSStringFromClass(v11);
      uint64_t v13 = [(MKTableViewCell *)v10 initWithStyle:0 reuseIdentifier:v12];

      goto LABEL_10;
    }
    uint64_t v8 = [(MKIncidentsViewController *)self _transitCellForIndex:a3 inSection:a4];
  }
  uint64_t v13 = (MKTableViewCell *)v8;
LABEL_10:
  [(MKTableViewCell *)v13 set_mapkit_separatorStyleOverride:0];

  return v13;
}

- (id)_transitCellForIndex:(int64_t)a3 inSection:(int64_t)a4
{
  id v6 = [(MKIncidentsViewController *)self extendedDetailCell];
  int64_t v7 = [(NSArray *)self->_transitIncidents objectAtIndexedSubscript:a3];
  uint64_t v8 = [v7 title];
  v9 = [v7 lastUpdated];
  v10 = +[MKIncidentDetailCell lastUpdateDisplayString:v9];
  v11 = [v7 fullDescription];
  unint64_t v12 = _MKTransitIncidentImage(v7);
  [v6 configureWithTitle:v8 subtitle:v10 body:v11 image:v12];

  return v6;
}

- (id)_advisoryItemCellForIndex:(int64_t)a3
{
  objc_super v5 = [(GEOComposedRouteAdvisory *)self->_advisory advisoryItems];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  int64_t v7 = [(MKIncidentsViewController *)self extendedDetailCell];
  [v7 setDelegate:self];
  [v7 configureWithAdvisoryItem:v6];

  return v7;
}

- (id)_advisoriesInfoCellForIndex:(int64_t)a3
{
  objc_super v5 = [(GEOAdvisoriesInfo *)self->_advisoriesInfo genericAdvisorys];
  id v6 = [v5 firstObject];

  int64_t v7 = [v6 advisoryItems];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];

  v9 = [(MKIncidentsViewController *)self extendedDetailCell];
  [v9 setDelegate:self];
  v10 = [v6 noticeArtwork];
  [v9 configureWithAdvisories:v8 artwork:v10];

  return v9;
}

- (void)cellDidTapDownloadForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(MKIncidentsViewController *)self delegate];
  [v5 didTapDownloadForLocation:v4];
}

- (id)accessoryFooterView
{
  return 0;
}

- (unint64_t)_incidentsCount
{
  if ([(NSArray *)self->_transitIncidents count])
  {
    transitIncidents = self->_transitIncidents;
    return [(NSArray *)transitIncidents count];
  }
  else
  {
    id v5 = [(MKIncidentsViewController *)self advisoriesInfo];
    id v6 = [v5 genericAdvisorys];

    if (v6)
    {
      int64_t v7 = [(MKIncidentsViewController *)self advisoriesInfo];
      uint64_t v8 = [v7 genericAdvisorys];
      v9 = [v8 firstObject];

      if (v9)
      {
        v10 = [v9 advisoryItems];
        unint64_t v11 = [v10 count];
      }
      else
      {
        unint64_t v11 = 0;
      }
    }
    else
    {
      v9 = [(GEOComposedRouteAdvisory *)self->_advisory advisoryItems];
      unint64_t v11 = [v9 count];
    }

    return v11;
  }
}

- (unint64_t)_transitIncidentsCount
{
  return [(NSArray *)self->_transitIncidents count];
}

- (int64_t)_transitIncidentIndexForRow:(int64_t)a3 section:(int64_t)a4
{
  if (a3 < 0) {
    return -1;
  }
  if ([(MKIncidentsViewController *)self _transitIncidentsCount] <= a3) {
    return -1;
  }
  return a3;
}

- (void)_compileSections
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [(MKIncidentsViewController *)self transitIncidents];
  uint64_t v4 = [v3 count];

  if (v4) {
    [v11 addObject:&unk_1ED97E6B8];
  }
  id v5 = [(MKIncidentsViewController *)self advisory];
  id v6 = [v5 advisoryItems];
  if ([v6 count])
  {
  }
  else
  {
    int64_t v7 = [(MKIncidentsViewController *)self advisoriesInfo];

    uint64_t v8 = v11;
    if (!v7) {
      goto LABEL_7;
    }
  }
  [v11 addObject:&unk_1ED97E6D0];
  uint64_t v8 = v11;
LABEL_7:
  v9 = (NSArray *)[v8 copy];
  sections = self->_sections;
  self->_sections = v9;
}

- (int64_t)_sectionForSectionIndex:(int64_t)a3
{
  id v3 = [(NSArray *)self->_sections objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)detailCellInSection:(int64_t)a3
{
  id v3 = [(MKIncidentsViewController *)self tableView];
  objc_msgSend(v3, "_mapkit_dequeueReusableCellWithIdentifier:", @"kIncidentDetailCellIdentifier");
  int64_t v4 = (MKIncidentDetailCell *)objc_claimAutoreleasedReturnValue();

  if (!v4) {
    int64_t v4 = [[MKIncidentDetailCell alloc] initWithReuseIdentifier:@"kIncidentDetailCellIdentifier"];
  }

  return v4;
}

- (id)extendedDetailCell
{
  id v2 = [(MKIncidentsViewController *)self tableView];
  objc_msgSend(v2, "_mapkit_dequeueReusableCellWithIdentifier:", @"kIncidentExtendedDetailCellIdentifier");
  id v3 = (MKIncidentExtendedDetailCell *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    id v3 = [[MKIncidentExtendedDetailCell alloc] initWithReuseIdentifier:@"kIncidentExtendedDetailCellIdentifier"];
  }

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(MKIncidentsViewController *)self _numberOfRowsInSection:a4];
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  int64_t v4 = [(MKIncidentsViewController *)self _sectionForSectionIndex:a3];
  if (v4 == 1)
  {
    int64_t v7 = [(MKIncidentsViewController *)self advisoriesInfo];

    if (v7)
    {
      uint64_t v8 = [(MKIncidentsViewController *)self advisoriesInfo];
      v9 = [v8 genericAdvisorys];
      id v5 = [v9 firstObject];

      if (!v5)
      {
        int64_t v6 = 0;
        goto LABEL_11;
      }
      v10 = v5;
    }
    else
    {
      v10 = [(MKIncidentsViewController *)self advisory];
      id v5 = v10;
    }
    id v11 = [v10 advisoryItems];
    int64_t v6 = [v11 count];

LABEL_11:
    return v6;
  }
  if (!v4)
  {
    id v5 = [(MKIncidentsViewController *)self transitIncidents];
    int64_t v6 = [v5 count];
    goto LABEL_11;
  }
  return 0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 65.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 row];
  uint64_t v7 = [v5 section];

  return [(MKIncidentsViewController *)self _cellForRow:v6 inSection:v7];
}

- (NSArray)transitIncidents
{
  return self->_transitIncidents;
}

- (NSString)incidentsTitle
{
  return self->_incidentsTitle;
}

- (GEOComposedRouteAdvisory)advisory
{
  return self->_advisory;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  return self->_advisoriesInfo;
}

- (IncidentsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IncidentsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advisoriesInfo, 0);
  objc_storeStrong((id *)&self->_advisory, 0);
  objc_storeStrong((id *)&self->_incidentsTitle, 0);
  objc_storeStrong((id *)&self->_transitIncidents, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

@end