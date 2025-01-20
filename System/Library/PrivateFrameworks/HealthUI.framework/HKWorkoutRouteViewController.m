@interface HKWorkoutRouteViewController
- (BOOL)sharingEnabled;
- (HKHealthStore)healthStore;
- (HKLocationReadings)unsmoothedLocationReadings;
- (HKRouteView)routeView;
- (HKWorkoutRouteViewController)initWithLocationReadings:(id)a3 title:(id)a4 sharingEnabled:(BOOL)a5 shareText:(id)a6 excludedActivityTypes:(id)a7;
- (NSArray)excludedActivityTypes;
- (NSString)shareText;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase;
- (void)_internalDebuggingOnly_toggleUnsmoothedLocations:(id)a3;
- (void)_shareButtonPressed:(id)a3;
- (void)_toggleRouteViewMapType:(id)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setRouteView:(id)a3;
- (void)setShareText:(id)a3;
- (void)setSharingEnabled:(BOOL)a3;
- (void)setUnsmoothedLocationReadings:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HKWorkoutRouteViewController

- (HKWorkoutRouteViewController)initWithLocationReadings:(id)a3 title:(id)a4 sharingEnabled:(BOOL)a5 shareText:(id)a6 excludedActivityTypes:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HKWorkoutRouteViewController;
  v17 = [(HKWorkoutRouteViewController *)&v21 init];
  if (v17)
  {
    uint64_t v18 = [v13 workout];
    workout = v17->_workout;
    v17->_workout = (HKWorkout *)v18;

    objc_storeStrong((id *)&v17->_locationReadings, a3);
    v17->_sharingEnabled = a5;
    objc_storeStrong((id *)&v17->_shareText, a6);
    objc_storeStrong((id *)&v17->_excludedActivityTypes, a7);
    [(HKWorkoutRouteViewController *)v17 setTitle:v14];
  }

  return v17;
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)HKWorkoutRouteViewController;
  [(HKWorkoutRouteViewController *)&v22 viewDidLoad];
  v3 = objc_alloc_init(HKRouteView);
  routeView = self->_routeView;
  self->_routeView = v3;

  if (self->_locationReadings) {
    -[HKRouteView setLocationReadings:](self->_routeView, "setLocationReadings:");
  }
  v5 = [(HKWorkoutRouteViewController *)self view];
  [v5 addSubview:self->_routeView];

  v6 = self->_routeView;
  v7 = [(HKWorkoutRouteViewController *)self view];
  [(UIView *)v6 hk_alignConstraintsWithView:v7];

  v8 = [(HKRouteView *)self->_routeView toggleMapTypeButton];
  [v8 addTarget:self action:sel__toggleRouteViewMapType_ forControlEvents:64];

  if (self->_sharingEnabled)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel__shareButtonPressed_];
    v10 = [(HKWorkoutRouteViewController *)self navigationItem];
    [v10 setRightBarButtonItem:v9];
  }
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__internalDebuggingOnly_toggleUnsmoothedLocations_];
    [v11 setNumberOfTapsRequired:4];
    [v11 setNumberOfTouchesRequired:2];
    v12 = [(HKWorkoutRouteViewController *)self navigationController];
    id v13 = [v12 navigationBar];
    [v13 addGestureRecognizer:v11];
  }
  id v14 = [(HKWorkoutRouteViewController *)self routeView];
  id v15 = [(HKWorkoutRouteViewController *)self routeView];
  id v16 = [v15 toggleMapTypeButton];
  [v14 bringSubviewToFront:v16];

  id v17 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v17 configureWithDefaultBackground];
  uint64_t v18 = [(HKWorkoutRouteViewController *)self navigationItem];
  [v18 setScrollEdgeAppearance:v17];

  v19 = [(HKWorkoutRouteViewController *)self navigationItem];
  [v19 setStandardAppearance:v17];

  v20 = [(HKWorkoutRouteViewController *)self navigationItem];
  [v20 setCompactAppearance:v17];

  objc_super v21 = [(HKWorkoutRouteViewController *)self navigationItem];
  [v21 setCompactScrollEdgeAppearance:v17];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKWorkoutRouteViewController;
  [(HKWorkoutRouteViewController *)&v8 viewWillAppear:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1CE8]);
  [v4 configureWithDefaultBackground];
  v5 = [(HKWorkoutRouteViewController *)self tabBarController];
  v6 = [v5 tabBar];
  v7 = [v6 selectedItem];

  [v7 setStandardAppearance:v4];
  [v7 setScrollEdgeAppearance:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKWorkoutRouteViewController;
  [(HKWorkoutRouteViewController *)&v7 viewWillDisappear:a3];
  id v4 = [(HKWorkoutRouteViewController *)self tabBarController];
  v5 = [v4 tabBar];
  v6 = [v5 selectedItem];

  [v6 setStandardAppearance:0];
  [v6 setScrollEdgeAppearance:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_internalDebuggingOnly_toggleUnsmoothedLocations:(id)a3
{
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_DEFAULT, "[routes] Apple internal: toggle unsmoothed locations.", v11, 2u);
  }
  BOOL showUnsmoothedRoute = self->_showUnsmoothedRoute;
  self->_BOOL showUnsmoothedRoute = !showUnsmoothedRoute;
  if (showUnsmoothedRoute)
  {
    routeView = self->_routeView;
    locationReadings = self->_locationReadings;
  }
  else
  {
    locationReadings = self->_unsmoothedLocationReadings;
    if (!locationReadings)
    {
      [(HKWorkoutRouteViewController *)self _internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase];
      goto LABEL_8;
    }
    routeView = self->_routeView;
  }
  [(HKRouteView *)routeView setLocationReadings:locationReadings];
LABEL_8:
  objc_super v8 = [(HKWorkoutRouteViewController *)self routeView];
  v9 = [(HKWorkoutRouteViewController *)self routeView];
  v10 = [v9 toggleMapTypeButton];
  [v8 bringSubviewToFront:v10];
}

- (void)_internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (!self->_healthStore)
  {
    v3 = (HKHealthStore *)objc_alloc_init(MEMORY[0x1E4F2B0B8]);
    healthStore = self->_healthStore;
    self->_healthStore = v3;
  }
  v5 = (void *)MEMORY[0x1E4F2B3C0];
  v6 = [(HKWorkout *)self->_workout UUID];
  objc_super v7 = [v6 UUIDString];
  v16[0] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v9 = [v5 predicateForObjectsWithMetadataKey:*MEMORY[0x1E4F2BBE8] allowedValues:v8];

  v10 = [MEMORY[0x1E4F2B448] dataTypeWithCode:102];
  objc_initWeak(&location, self);
  id v11 = objc_alloc(MEMORY[0x1E4F2B440]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke;
  v13[3] = &unk_1E6D553B8;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  v12 = (void *)[v11 initWithSampleType:v10 predicate:v9 limit:0 sortDescriptors:0 resultsHandler:v13];
  [(HKHealthStore *)self->_healthStore executeQuery:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 || ![v8 count])
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_1E0B26000, v10, OS_LOG_TYPE_DEFAULT, "[routes] No unsmoothed series, error: %@", buf, 0xCu);
    }
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F2B9A8]);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v13 = [WeakRetained healthStore];
    id v14 = (void *)[v11 initWithHealthStore:v13];

    [v14 setWorkoutRoutes:v8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke_477;
    v15[3] = &unk_1E6D55390;
    v15[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v16, (id *)(a1 + 40));
    [v14 fetchAllLocationsWithCompletion:v15];
    objc_destroyWeak(&v16);
  }
}

void __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke_477(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[HKLocationReadings alloc] initWithLocations:v3 workout:*(void *)(*(void *)(a1 + 32) + 984) isSmoothed:0];

  a1 += 40;
  id WeakRetained = objc_loadWeakRetained((id *)a1);
  [WeakRetained setUnsmoothedLocationReadings:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke_2;
  v7[3] = &unk_1E6D527B8;
  objc_copyWeak(&v9, (id *)a1);
  id v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v9);
}

void __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained routeView];
  [v2 setLocationReadings:*(void *)(a1 + 32)];
}

- (void)_shareButtonPressed:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HKRouteView *)self->_routeView routeImageForSharing];
  v6 = (void *)v5;
  if (self->_shareText) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F9F2E8]);
    v12[0] = self;
    v12[1] = v6;
    v12[2] = self->_shareText;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    v10 = (void *)[v8 initWithActivityItems:v9 applicationActivities:0];

    id v11 = [v10 popoverPresentationController];
    [v11 setSourceItem:v4];

    [v10 setExcludedActivityTypes:self->_excludedActivityTypes];
    [(HKWorkoutRouteViewController *)self presentViewController:v10 animated:1 completion:0];
  }
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)HKWorkoutRouteViewController;
  [(HKWorkoutRouteViewController *)&v10 viewWillLayoutSubviews];
  id v3 = [(HKWorkoutRouteViewController *)self navigationController];
  id v4 = [v3 navigationBar];
  [v4 frame];
  double MaxY = CGRectGetMaxY(v11);

  v6 = [(HKWorkoutRouteViewController *)self view];
  [v6 bounds];
  double v8 = v7 + -45.0 + -12.0;

  id v9 = [(HKRouteView *)self->_routeView toggleMapTypeButton];
  objc_msgSend(v9, "setFrame:", v8, MaxY + 12.0, 45.0, 45.0);
}

- (void)_toggleRouteViewMapType:(id)a3
{
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1F3B9CF20;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  uint64_t v5 = [(HKRouteView *)self->_routeView routeImageForSharing];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F30A38]);
    double v7 = UIImagePNGRepresentation(v5);
    double v8 = (void *)[v6 initWithData:v7 MIMEType:@"image/png"];
    [v4 setImage:v8];
  }
  return v4;
}

- (HKRouteView)routeView
{
  return self->_routeView;
}

- (void)setRouteView:(id)a3
{
}

- (HKLocationReadings)unsmoothedLocationReadings
{
  return self->_unsmoothedLocationReadings;
}

- (void)setUnsmoothedLocationReadings:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (void)setSharingEnabled:(BOOL)a3
{
  self->_sharingEnabled = a3;
}

- (NSString)shareText
{
  return self->_shareText;
}

- (void)setShareText:(id)a3
{
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_shareText, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_unsmoothedLocationReadings, 0);
  objc_storeStrong((id *)&self->_routeView, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
}

@end