@interface HKWorkoutRouteTableViewController
- (HKHealthStore)healthStore;
- (HKMapRouteTableViewCell)mapRouteTableViewCell;
- (HKWorkoutRoute)workoutRoute;
- (HKWorkoutRouteTableViewController)initWithSample:(id)a3 usingInsetStyling:(BOOL)a4 profileName:(id)a5 delegate:(id)a6;
- (HKWorkoutRouteTableViewController)initWithWorkoutRoute:(id)a3 healthStore:(id)a4 usingInsetStyling:(BOOL)a5 profileName:(id)a6 delegate:(id)a7;
- (NSMutableArray)routeData;
- (_HKLocationShifter)locationShifter;
- (id)_convertIndexPathToSuper:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addRouteData:(id)a3 hasFinishedQuery:(BOOL)a4;
- (void)loadRoute;
- (void)parseAndDisplayRouteData;
- (void)setHealthStore:(id)a3;
- (void)setLocationShifter:(id)a3;
- (void)setMapRouteTableViewCell:(id)a3;
- (void)setRouteData:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HKWorkoutRouteTableViewController

- (HKWorkoutRouteTableViewController)initWithWorkoutRoute:(id)a3 healthStore:(id)a4 usingInsetStyling:(BOOL)a5 profileName:(id)a6 delegate:(id)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKWorkoutRouteTableViewController;
  v13 = [(HKDataMetadataViewController *)&v17 initWithSample:a3 usingInsetStyling:v9 profileName:a6 delegate:a7];
  v14 = v13;
  if (v13)
  {
    [(HKWorkoutRouteTableViewController *)v13 setHealthStore:v12];
    id v15 = objc_alloc_init(MEMORY[0x1E4F2B908]);
    [(HKWorkoutRouteTableViewController *)v14 setLocationShifter:v15];
  }
  return v14;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)HKWorkoutRouteTableViewController;
  [(HKDataMetadataViewController *)&v6 viewDidLoad];
  v3 = [(HKWorkoutRouteTableViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = +[HKMapRouteTableViewCell defaultReuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];
}

- (HKWorkoutRouteTableViewController)initWithSample:(id)a3 usingInsetStyling:(BOOL)a4 profileName:(id)a5 delegate:(id)a6
{
  BOOL v7 = a4;
  v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3C8];
  id v12 = a6;
  id v13 = a5;
  v14 = NSStringFromSelector(a2);
  [v10 raise:v11, @"The -%@ method is not available on %@", v14, objc_opt_class() format];

  id v15 = [(HKWorkoutRouteTableViewController *)self initWithWorkoutRoute:0 healthStore:0 usingInsetStyling:v7 profileName:v13 delegate:v12];
  return v15;
}

- (HKWorkoutRoute)workoutRoute
{
  v3 = [(HKDataMetadataViewController *)self sample];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(HKDataMetadataViewController *)self sample];
  }
  else
  {
    v5 = 0;
  }
  return (HKWorkoutRoute *)v5;
}

- (void)loadRoute
{
  id v3 = objc_alloc(MEMORY[0x1E4F2B7B8]);
  uint64_t v4 = [(HKWorkoutRouteTableViewController *)self workoutRoute];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HKWorkoutRouteTableViewController_loadRoute__block_invoke;
  v7[3] = &unk_1E6D538B0;
  v7[4] = self;
  v5 = (void *)[v3 initWithRoute:v4 dataHandler:v7];

  objc_super v6 = [(HKWorkoutRouteTableViewController *)self healthStore];
  [v6 executeQuery:v5];
}

uint64_t __46__HKWorkoutRouteTableViewController_loadRoute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRouteData:hasFinishedQuery:");
}

- (void)addRouteData:(id)a3 hasFinishedQuery:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = self;
  objc_sync_enter(v7);
  v8 = [(HKWorkoutRouteTableViewController *)v7 routeData];

  if (!v8)
  {
    BOOL v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    [(HKWorkoutRouteTableViewController *)v7 setRouteData:v9];
  }
  v10 = [(HKWorkoutRouteTableViewController *)v7 routeData];
  [v10 addObjectsFromArray:v6];

  objc_sync_exit(v7);
  if (v4)
  {
    uint64_t v11 = [(HKWorkoutRouteTableViewController *)v7 routeData];
    if (v11
      && (id v12 = (void *)v11,
          id v13 = (void *)MEMORY[0x1E4F2B908],
          [(HKWorkoutRouteTableViewController *)v7 routeData],
          v14 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v13) = [v13 isShiftRequiredForLocations:v14],
          v14,
          v12,
          v13))
    {
      id v15 = [(HKWorkoutRouteTableViewController *)v7 locationShifter];
      v16 = [(HKWorkoutRouteTableViewController *)v7 routeData];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __67__HKWorkoutRouteTableViewController_addRouteData_hasFinishedQuery___block_invoke;
      v17[3] = &unk_1E6D538D8;
      v17[4] = v7;
      [v15 shiftLocations:v16 withCompletion:v17];
    }
    else
    {
      [(HKWorkoutRouteTableViewController *)v7 parseAndDisplayRouteData];
    }
  }
}

uint64_t __67__HKWorkoutRouteTableViewController_addRouteData_hasFinishedQuery___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) parseAndDisplayRouteData];
}

- (void)parseAndDisplayRouteData
{
  id v3 = [(HKWorkoutRouteTableViewController *)self routeData];
  BOOL v4 = (char *)malloc_type_malloc(16 * [v3 count], 0x1000040451B5BE8uLL);

  v5 = [(HKWorkoutRouteTableViewController *)self routeData];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    v8 = v4 + 8;
    do
    {
      BOOL v9 = [(HKWorkoutRouteTableViewController *)self routeData];
      v10 = [v9 objectAtIndexedSubscript:v7];
      [v10 coordinate];
      *(MKMapPoint *)(v8 - 8) = MKMapPointForCoordinate(v34);

      ++v7;
      uint64_t v11 = [(HKWorkoutRouteTableViewController *)self routeData];
      unint64_t v12 = [v11 count];

      v8 += 16;
    }
    while (v7 < v12);
  }
  id v13 = (void *)MEMORY[0x1E4F30FF0];
  v14 = [(HKWorkoutRouteTableViewController *)self routeData];
  id v15 = objc_msgSend(v13, "polylineWithPoints:count:", v4, objc_msgSend(v14, "count"));

  [v15 boundingMapRect];
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  v24 = self;
  objc_sync_enter(v24);
  [(HKWorkoutRouteTableViewController *)v24 setRouteData:0];
  objc_sync_exit(v24);

  v25 = [MEMORY[0x1E4F28F08] mainQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__HKWorkoutRouteTableViewController_parseAndDisplayRouteData__block_invoke;
  v27[3] = &unk_1E6D53900;
  v27[4] = v24;
  id v28 = v15;
  v29 = v4;
  uint64_t v30 = v17;
  uint64_t v31 = v19;
  uint64_t v32 = v21;
  uint64_t v33 = v23;
  id v26 = v15;
  [v25 addOperationWithBlock:v27];
}

void __61__HKWorkoutRouteTableViewController_parseAndDisplayRouteData__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mapRouteTableViewCell];
  id v3 = [v2 mapView];
  [v3 addOverlay:*(void *)(a1 + 40) level:0];

  free(*(void **)(a1 + 48));
  id v5 = [*(id *)(a1 + 32) mapRouteTableViewCell];
  BOOL v4 = [v5 mapView];
  objc_msgSend(v4, "setVisibleMapRect:edgePadding:animated:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), 50.0, 20.0, 50.0, 20.0);
}

- (id)_convertIndexPathToSuper:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28D58];
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  return (id)[v3 indexPathForRow:v5 inSection:v6 - 1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKWorkoutRouteTableViewController;
  return [(HKDataMetadataViewController *)&v4 numberOfSectionsInTableView:a3] + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutRouteTableViewController;
  return [(HKDataMetadataViewController *)&v5 tableView:a3 numberOfRowsInSection:a4 - 1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    v8 = [(HKWorkoutRouteTableViewController *)self _convertIndexPathToSuper:v7];
    v14.receiver = self;
    v14.super_class = (Class)HKWorkoutRouteTableViewController;
    BOOL v9 = [(HKDataMetadataViewController *)&v14 tableView:v6 cellForRowAtIndexPath:v8];
  }
  else
  {
    v10 = [(HKWorkoutRouteTableViewController *)self tableView];
    uint64_t v11 = +[HKMapRouteTableViewCell defaultReuseIdentifier];
    unint64_t v12 = [v10 dequeueReusableCellWithIdentifier:v11];
    [(HKWorkoutRouteTableViewController *)self setMapRouteTableViewCell:v12];

    [(HKWorkoutRouteTableViewController *)self loadRoute];
    BOOL v9 = [(HKWorkoutRouteTableViewController *)self mapRouteTableViewCell];
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)HKWorkoutRouteTableViewController;
    objc_super v4 = [(HKDataMetadataViewController *)&v7 tableView:a3 titleForHeaderInSection:a4 - 1];
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    objc_super v4 = [v5 localizedStringForKey:@"WORKOUT_ROUTE_MAP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }
  return v4;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)HKWorkoutRouteTableViewController;
    objc_super v5 = [(HKDataMetadataViewController *)&v7 tableView:a3 viewForFooterInSection:a4 - 1];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)HKWorkoutRouteTableViewController;
    objc_super v5 = [(HKDataMetadataViewController *)&v7 tableView:a3 titleForFooterInSection:a4 - 1];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    uint64_t v8 = [(HKWorkoutRouteTableViewController *)self _convertIndexPathToSuper:v7];

    v9.receiver = self;
    v9.super_class = (Class)HKWorkoutRouteTableViewController;
    [(HKDataMetadataViewController *)&v9 tableView:v6 didSelectRowAtIndexPath:v8];
    id v7 = (id)v8;
  }
  else
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKMapRouteTableViewCell)mapRouteTableViewCell
{
  return self->_mapRouteTableViewCell;
}

- (void)setMapRouteTableViewCell:(id)a3
{
}

- (NSMutableArray)routeData
{
  return self->_routeData;
}

- (void)setRouteData:(id)a3
{
}

- (_HKLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void)setLocationShifter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_mapRouteTableViewCell, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end