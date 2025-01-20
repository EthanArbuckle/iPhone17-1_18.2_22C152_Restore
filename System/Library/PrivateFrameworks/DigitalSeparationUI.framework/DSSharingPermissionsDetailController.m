@interface DSSharingPermissionsDetailController
+ (id)detailControllerWithPeople:(id)a3 startingViewController:(id)a4 delegate:(id)a5;
+ (id)detailControllerWithSharingTypes:(id)a3 startingViewController:(id)a4 delegate:(id)a5;
+ (void)initialize;
- (DSSharingPermissionsDetailDelegate)delegate;
- (DSSharingPerson)sharingPerson;
- (DSSharingType)sharingType;
- (NSArray)remainingPeople;
- (NSArray)remainingSharingTypes;
- (NSArray)sortedPeople;
- (NSArray)sortedSourceNames;
- (UIViewController)startingViewController;
- (id)alertTextForSources:(id)a3;
- (id)personForIndexPath:(id)a3;
- (id)sourceNameForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateButton;
- (void)next;
- (void)reloadTableViewData;
- (void)setDelegate:(id)a3;
- (void)setRemainingPeople:(id)a3;
- (void)setRemainingSharingTypes:(id)a3;
- (void)setSharingPerson:(id)a3;
- (void)setSharingType:(id)a3;
- (void)setSortedPeople:(id)a3;
- (void)setSortedSourceNames:(id)a3;
- (void)setStartingViewController:(id)a3;
- (void)sharingStoppedForPerson:(id)a3 sourceNames:(id)a4 error:(id)a5;
- (void)sharingStoppedForType:(id)a3 people:(id)a4 error:(id)a5;
- (void)stopAllSharing;
- (void)stopSelectedSharing;
- (void)stopSharingSources:(id)a3 people:(id)a4 alertLabel:(id)a5 alertDetail:(id)a6 completion:(id)a7;
- (void)viewDidLoad;
@end

@implementation DSSharingPermissionsDetailController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLogSharingPermissionsDetail = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSSharingByPersonDetail");
    MEMORY[0x270F9A758]();
  }
}

+ (id)detailControllerWithPeople:(id)a3 startingViewController:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v23 = a5;
  id v8 = a4;
  v9 = [v7 firstObject];
  if ((unint64_t)[v7 count] < 2)
  {
    v10 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v10 = objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
  }
  v11 = DSUILocStringForKey(@"REVIEW_SHARING_WITH_FORMAT");
  v12 = NSString;
  v13 = [v9 displayName];
  v14 = objc_msgSend(v12, "stringWithFormat:", v11, v13);

  v15 = DSUILocStringForKey(@"SHARING_PERMISSION_DETAIL_TEXT_FORMAT");
  v16 = NSString;
  v17 = [v9 displayName];
  v18 = objc_msgSend(v16, "stringWithFormat:", v15, v17);

  v19 = [DSSharingPermissionsDetailController alloc];
  v20 = [v9 iconForDetail];
  v21 = [(DSTableWelcomeController *)v19 initWithTitle:v14 detailText:v18 icon:v20 adoptTableViewScrollView:1 shouldShowSearchBar:0];

  [(DSSharingPermissionsDetailController *)v21 setSharingPerson:v9];
  [(DSSharingPermissionsDetailController *)v21 setRemainingPeople:v10];
  [(DSSharingPermissionsDetailController *)v21 setStartingViewController:v8];

  [(DSSharingPermissionsDetailController *)v21 setDelegate:v23];
  return v21;
}

+ (id)detailControllerWithSharingTypes:(id)a3 startingViewController:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 firstObject];
  if ((unint64_t)[v7 count] < 2)
  {
    v11 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v11 = objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
  }
  v12 = (void *)MEMORY[0x263F3A378];
  v13 = [v10 source];
  v14 = [v13 name];
  v15 = [v12 sourceDescriptorForSource:v14];

  v16 = [v15 localizedStopByTypeSubtitleForSharingType:v10];
  v17 = [DSSharingPermissionsDetailController alloc];
  v18 = [v10 displayName];
  v19 = [(DSTableWelcomeController *)v17 initWithTitle:v18 detailText:v16 icon:0 adoptTableViewScrollView:1 shouldShowSearchBar:0];

  v20 = [v10 iconForDetail];
  [(DSTableWelcomeController *)v19 addBorderedIcon:v20];

  [(DSSharingPermissionsDetailController *)v19 setSharingType:v10];
  [(DSSharingPermissionsDetailController *)v19 setRemainingSharingTypes:v11];
  [(DSSharingPermissionsDetailController *)v19 setStartingViewController:v9];

  [(DSSharingPermissionsDetailController *)v19 setDelegate:v8];
  return v19;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)DSSharingPermissionsDetailController;
  [(DSTableWelcomeController *)&v7 viewDidLoad];
  [(DSSharingPermissionsDetailController *)self reloadTableViewData];
  v3 = DSUILocStringForKey(@"SKIP");
  v4 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:self selector:sel_next];
  [(DSTableWelcomeController *)self setBoldButton:v4];

  v5 = DSUILocStringForKey(@"STOP_ALL_SHARING");
  v6 = +[DSUIUtilities setUpLinkButtonForController:self title:v5 target:self selector:sel_stopAllSharing];
  [(DSTableWelcomeController *)self setLinkButton:v6];
}

- (void)reloadTableViewData
{
  v3 = [(DSSharingPermissionsDetailController *)self sharingPerson];
  v4 = [v3 sortedSourceNames];
  [(DSSharingPermissionsDetailController *)self setSortedSourceNames:v4];

  v5 = [(DSSharingPermissionsDetailController *)self sharingType];
  v6 = [v5 sortedPeople];
  [(DSSharingPermissionsDetailController *)self setSortedPeople:v6];

  objc_super v7 = [(OBTableWelcomeController *)self tableView];
  [v7 reloadData];

  id v8 = [(OBTableWelcomeController *)self tableView];
  [v8 layoutIfNeeded];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(DSSharingPermissionsDetailController *)self sharingPerson];

  if (v6)
  {
    objc_super v7 = [(DSSharingPermissionsDetailController *)self sourceNameForIndexPath:v5];

    if (v7)
    {
      id v8 = [MEMORY[0x263F3A378] sourceDescriptorForSource:v7];
      id v9 = [(DSSharingPermissionsDetailController *)self sharingPerson];
      v10 = [v8 localizedStopByPerson:v9];

      if (v10)
      {
        v11 = [(OBTableWelcomeController *)self tableView];
        v12 = [v8 localizedName];
        v13 = [v8 iconForTable];
        v14 = +[DSIconTableViewCell iconTableViewCellFromTableView:v11 withText:v12 detail:v10 icon:v13];
      }
      else
      {
        v14 = 0;
      }
      goto LABEL_9;
    }
LABEL_7:
    v14 = 0;
    goto LABEL_10;
  }
  objc_super v7 = [(DSSharingPermissionsDetailController *)self personForIndexPath:v5];

  if (!v7) {
    goto LABEL_7;
  }
  v15 = [DSIconTableViewCell alloc];
  id v8 = [v7 displayName];
  v10 = [v7 iconForTable];
  v14 = [(DSIconTableViewCell *)v15 initWithRightAlignedLabel:v8 detail:&stru_26E9097D0 icon:v10];
LABEL_9:

  [(DSIconTableViewCell *)v14 setAccessoryType:0];
LABEL_10:
  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(DSSharingPermissionsDetailController *)self sharingPerson];

  if (v5) {
    [(DSSharingPermissionsDetailController *)self sortedSourceNames];
  }
  else {
  v6 = [(DSSharingPermissionsDetailController *)self sortedPeople];
  }
  int64_t v7 = [v6 count];

  if (v7 < 0)
  {
    id v8 = DSLogSharingPermissionsDetail;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissionsDetail, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissionsDetailController tableView:numberOfRowsInSection:](v8);
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (id)sourceNameForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 row] < 0
    || (uint64_t v5 = [v4 row],
        [(DSSharingPermissionsDetailController *)self sortedSourceNames],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5 >= v7))
  {
    v11 = DSLogSharingPermissionsDetail;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissionsDetail, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissionsDetailController sourceNameForIndexPath:]((uint64_t)v4, v11);
    }
    v10 = 0;
  }
  else
  {
    uint64_t v8 = [v4 row];
    id v9 = [(DSSharingPermissionsDetailController *)self sortedSourceNames];
    v10 = [v9 objectAtIndexedSubscript:v8];
  }
  return v10;
}

- (id)personForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 row] < 0
    || (uint64_t v5 = [v4 row],
        [(DSSharingPermissionsDetailController *)self sortedPeople],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5 >= v7))
  {
    v11 = DSLogSharingPermissionsDetail;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissionsDetail, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissionsDetailController personForIndexPath:]((uint64_t)v4, v11);
    }
    v10 = 0;
  }
  else
  {
    uint64_t v8 = [v4 row];
    id v9 = [(DSSharingPermissionsDetailController *)self sortedPeople];
    v10 = [v9 objectAtIndexedSubscript:v8];
  }
  return v10;
}

- (void)stopAllSharing
{
  v41[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v3 = [(DSSharingPermissionsDetailController *)self sortedSourceNames];
  v31 = (void *)[v3 copy];

  id v4 = [(DSSharingPermissionsDetailController *)self sharingPerson];

  if (v4)
  {
    uint64_t v5 = [(DSSharingPermissionsDetailController *)self sharingPerson];
    v6 = [v5 displayName];

    uint64_t v7 = [(DSSharingPermissionsDetailController *)self sharingPerson];
    uint64_t v8 = [v7 termsOfAddress];

    id v9 = DSUILocStringForKey(@"STOP_ALL_SHARING_BY_PEOPLE_ALERT_LABEL");
    id v10 = objc_alloc(MEMORY[0x263F086A0]);
    v11 = DSUILocAttributedStringForKey(@"STOP_ALL_SHARING_BY_PEOPLE_ALERT_DETAIL");
    uint64_t v12 = *MEMORY[0x263F08150];
    uint64_t v40 = *MEMORY[0x263F08150];
    v39 = v8;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
    v41[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    v15 = objc_msgSend(v10, "initWithFormat:options:locale:context:", v11, 0, 0, v14, v6, v6, v6);

    v16 = [v15 string];
    if ([v31 containsObject:*MEMORY[0x263F3A320]])
    {
      id v17 = objc_alloc(MEMORY[0x263F086A0]);
      v18 = DSUILocAttributedStringForKey(@"FIND_MY_NOTIFICATION_WARNING_SPECIFIC");
      v36 = v8;
      uint64_t v37 = v12;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
      v38 = v19;
      v20 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v21 = objc_msgSend(v17, "initWithFormat:options:locale:context:", v18, 0, 0, v20, v6);

      v35[0] = v16;
      v22 = [v21 string];
      v35[1] = v22;
      id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
      uint64_t v24 = [v23 componentsJoinedByString:@" "];

      v16 = (void *)v24;
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x263F3A378];
    v26 = [(DSSharingPermissionsDetailController *)self sharingType];
    v27 = [v26 source];
    v28 = [v27 name];
    v6 = [v25 sourceDescriptorForSource:v28];

    id v9 = [v6 localizedStopAllAlertLabel];
    if (![v6 supportsResourceTypes])
    {
      v16 = [v6 localizedStopAllAlertDetail];
      goto LABEL_7;
    }
    uint64_t v8 = [(DSSharingPermissionsDetailController *)self sharingType];
    v15 = [v8 allPeople];
    v16 = [v6 localizedStopAllAlertDetailForPeople:v15];
  }

LABEL_7:
  v29 = [(DSSharingPermissionsDetailController *)self sortedPeople];
  v30 = (void *)[v29 copy];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __54__DSSharingPermissionsDetailController_stopAllSharing__block_invoke;
  v32[3] = &unk_264C6EA20;
  objc_copyWeak(&v33, &location);
  [(DSSharingPermissionsDetailController *)self stopSharingSources:v31 people:v30 alertLabel:v9 alertDetail:v16 completion:v32];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __54__DSSharingPermissionsDetailController_stopAllSharing__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadTableViewData];
  [WeakRetained next];
}

- (id)alertTextForSources:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F3A328];
  int v6 = [v4 containsObject:*MEMORY[0x263F3A328]];
  uint64_t v7 = *MEMORY[0x263F3A320];
  if (v6 && [v4 containsObject:*MEMORY[0x263F3A320]])
  {
    uint64_t v8 = DSUILocStringForKey(@"HEALTH_AND_FIND_MY_COMBO_STOP_BY_PERSON_ALERT");
    id v9 = NSString;
    id v10 = [(DSSharingPermissionsDetailController *)self sharingPerson];
    v11 = [v10 displayName];
    uint64_t v12 = [(DSSharingPermissionsDetailController *)self sharingPerson];
    v13 = [v12 displayName];
    v14 = objc_msgSend(v9, "stringWithFormat:", v8, v11, v13);

    goto LABEL_11;
  }
  if ([v4 containsObject:v7])
  {
    v15 = (void *)MEMORY[0x263F3A378];
    uint64_t v16 = v7;
  }
  else
  {
    int v17 = [v4 containsObject:v5];
    v18 = (void *)MEMORY[0x263F3A378];
    if (!v17)
    {
      v19 = [v4 firstObject];
      uint64_t v8 = [v18 sourceDescriptorForSource:v19];

      goto LABEL_10;
    }
    v15 = (void *)MEMORY[0x263F3A378];
    uint64_t v16 = v5;
  }
  uint64_t v8 = [v15 sourceDescriptorForSource:v16];
LABEL_10:
  id v10 = [(DSSharingPermissionsDetailController *)self sharingPerson];
  v14 = [v8 localizedAlertTextForPerson:v10];
LABEL_11:

  return v14;
}

- (void)stopSelectedSharing
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [(OBTableWelcomeController *)self tableView];
  id v4 = [v3 indexPathsForSelectedRows];

  uint64_t v5 = [MEMORY[0x263EFF980] array];
  int v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [(DSSharingPermissionsDetailController *)self sharingPerson];

  if (v7)
  {
    long long v33 = 0uLL;
    long long v34 = 0uLL;
    long long v31 = 0uLL;
    long long v32 = 0uLL;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = [(DSSharingPermissionsDetailController *)self sourceNameForIndexPath:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          if (v12) {
            [v5 addObject:v12];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }

    v13 = [(DSSharingPermissionsDetailController *)self alertTextForSources:v5];
    v14 = DSUILocStringForKey(@"STOP_SHARING_MULTIPLE_BY_PERSON_ALERT_LABEL");
  }
  else
  {
    long long v29 = 0uLL;
    long long v30 = 0uLL;
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    id v15 = v4;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = [(DSSharingPermissionsDetailController *)self personForIndexPath:*(void *)(*((void *)&v27 + 1) + 8 * j)];
          if (v19) {
            [v6 addObject:v19];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v16);
    }

    v20 = [(DSSharingPermissionsDetailController *)self sharingType];
    v21 = [v20 source];
    v22 = [v21 name];

    id v23 = [MEMORY[0x263F3A378] sourceDescriptorForSource:v22];
    v13 = [v23 localizedAlertDetailForSelectedPeople:v6];
    v14 = [v23 localizedAlertButtonLabel];
  }
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __59__DSSharingPermissionsDetailController_stopSelectedSharing__block_invoke;
  v24[3] = &unk_264C6EA20;
  objc_copyWeak(&v25, &location);
  [(DSSharingPermissionsDetailController *)self stopSharingSources:v5 people:v6 alertLabel:v14 alertDetail:v13 completion:v24];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __59__DSSharingPermissionsDetailController_stopSelectedSharing__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(WeakRetained, "tableView", 0);
  v3 = [v2 indexPathsForSelectedRows];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = [WeakRetained tableView];
        [v9 deselectRowAtIndexPath:v8 animated:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [WeakRetained _updateButton];
  [WeakRetained reloadTableViewData];
  [WeakRetained next];
}

- (void)sharingStoppedForPerson:(id)a3 sourceNames:(id)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(DSSharingPermissionsDetailController *)self delegate];
  long long v12 = v11;
  if (v10)
  {
    long long v13 = DSLogSharingPermissionsDetail;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissionsDetail, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543874;
      id v15 = v8;
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_error_impl(&dword_235BFC000, v13, OS_LOG_TYPE_ERROR, "Failed to stop sharing %{public}@ from %{public}@ because %{public}@", (uint8_t *)&v14, 0x20u);
    }
    [v12 stopSharingFailedWithError:v10];
  }
  else
  {
    [v11 sharingStoppedForPerson:v8 sourceNames:v9];
  }
}

- (void)sharingStoppedForType:(id)a3 people:(id)a4 error:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(DSSharingPermissionsDetailController *)self delegate];
  long long v12 = v11;
  if (v10)
  {
    long long v13 = (void *)DSLogSharingPermissionsDetail;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissionsDetail, OS_LOG_TYPE_ERROR))
    {
      int v14 = v13;
      id v15 = [v8 displayName];
      int v16 = 138543874;
      id v17 = v15;
      __int16 v18 = 2114;
      id v19 = v9;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_error_impl(&dword_235BFC000, v14, OS_LOG_TYPE_ERROR, "Failed to stop sharing %{public}@ with %{public}@ because %{public}@", (uint8_t *)&v16, 0x20u);
    }
    [v12 stopSharingFailedWithError:v10];
  }
  else
  {
    [v11 sharingStoppedForType:v8 people:v9];
  }
}

- (void)stopSharingSources:(id)a3 people:(id)a4 alertLabel:(id)a5 alertDetail:(id)a6 completion:(id)a7
{
  id v30 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v31 = a5;
  id v15 = [(DSSharingPermissionsDetailController *)self sharingPerson];
  int v16 = [(DSSharingPermissionsDetailController *)self sharingType];
  id v17 = [(DSSharingPermissionsDetailController *)self delegate];
  __int16 v18 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:v14 preferredStyle:0];

  id v19 = (void *)MEMORY[0x263F82400];
  __int16 v20 = DSUILocStringForKey(@"CANCEL");
  long long v29 = [v19 actionWithTitle:v20 style:1 handler:&__block_literal_global_1];

  id v21 = (void *)MEMORY[0x263F82400];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_2;
  v32[3] = &unk_264C6EA70;
  void v32[4] = self;
  id v33 = v15;
  id v37 = v12;
  id v38 = v13;
  id v34 = v30;
  id v35 = v17;
  id v36 = v16;
  id v22 = v12;
  id v23 = v16;
  id v24 = v17;
  id v25 = v13;
  id v26 = v30;
  id v27 = v15;
  long long v28 = [v21 actionWithTitle:v31 style:2 handler:v32];

  [v18 addAction:v28];
  [v18 addAction:v29];
  [(DSSharingPermissionsDetailController *)self presentViewController:v18 animated:1 completion:0];
}

void __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_2(id *a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v2 = [a1[4] buttonTray];
  [v2 showButtonsBusy];

  if (a1[5])
  {
    uint64_t v3 = [a1[6] count];
    uint64_t v4 = [a1[5] sortedSourceNames];
    uint64_t v5 = [v4 count];

    id v6 = a1[5];
    if (v3 == v5)
    {
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_3;
      v51[3] = &unk_264C6EA48;
      id v7 = a1[5];
      v51[4] = a1[4];
      id v52 = v7;
      id v53 = a1[6];
      id v54 = a1[10];
      [v6 stopAllSharingOnQueue:MEMORY[0x263EF83A0] completion:v51];

      id v8 = v52;
    }
    else
    {
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_4;
      v47[3] = &unk_264C6EA48;
      id v25 = a1[5];
      id v26 = a1[6];
      v47[4] = a1[4];
      id v48 = v25;
      id v49 = a1[6];
      id v50 = a1[10];
      [v6 stopSharingSourceNames:v26 queue:MEMORY[0x263EF83A0] completion:v47];

      id v8 = v48;
    }
  }
  else
  {
    id v9 = [a1[7] permissions];
    uint64_t v10 = [v9 allPublicSharingTypes];
    long long v11 = (void *)v10;
    id v12 = (void *)MEMORY[0x263EFFA68];
    if (v10) {
      id v12 = (void *)v10;
    }
    id v13 = v12;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v43 + 1) + 8 * v18) source];
          __int16 v20 = [v19 name];
          id v21 = [a1[8] source];
          id v22 = [v21 name];
          char v23 = [v20 isEqualToString:v22];

          if (v23)
          {
            char v24 = 1;
            goto LABEL_18;
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    char v24 = 0;
LABEL_18:

    uint64_t v27 = [a1[9] count];
    long long v28 = [a1[8] sortedPeople];
    uint64_t v29 = [v28 count];

    id v30 = a1[8];
    if ((v24 & 1) != 0 || v27 != v29)
    {
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      void v35[2] = __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_6;
      v35[3] = &unk_264C6EA48;
      v35[4] = a1[4];
      id v31 = &v36;
      id v34 = a1[9];
      id v36 = a1[8];
      long long v32 = &v37;
      id v37 = a1[9];
      id v33 = &v38;
      id v38 = a1[10];
      [v30 stopSharingPeople:v34 queue:MEMORY[0x263EF83A0] completion:v35];
    }
    else
    {
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_5;
      v39[3] = &unk_264C6EA48;
      v39[4] = a1[4];
      id v31 = &v40;
      id v40 = a1[8];
      long long v32 = &v41;
      id v41 = a1[9];
      id v33 = &v42;
      id v42 = a1[10];
      [v30 stopAllSharingOnQueue:MEMORY[0x263EF83A0] completion:v39];
    }
  }
}

uint64_t __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) sharingStoppedForPerson:*(void *)(a1 + 40) sourceNames:*(void *)(a1 + 48) error:a2];
  uint64_t v3 = [*(id *)(a1 + 32) buttonTray];
  [v3 showButtonsAvailable];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v4();
}

uint64_t __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) sharingStoppedForPerson:*(void *)(a1 + 40) sourceNames:*(void *)(a1 + 48) error:a2];
  uint64_t v3 = [*(id *)(a1 + 32) buttonTray];
  [v3 showButtonsAvailable];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v4();
}

uint64_t __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) sharingStoppedForType:*(void *)(a1 + 40) people:*(void *)(a1 + 48) error:a2];
  uint64_t v3 = [*(id *)(a1 + 32) buttonTray];
  [v3 showButtonsAvailable];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v4();
}

uint64_t __100__DSSharingPermissionsDetailController_stopSharingSources_people_alertLabel_alertDetail_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) sharingStoppedForType:*(void *)(a1 + 40) people:*(void *)(a1 + 48) error:a2];
  uint64_t v3 = [*(id *)(a1 + 32) buttonTray];
  [v3 showButtonsAvailable];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v4();
}

- (void)next
{
  id v12 = [(DSSharingPermissionsDetailController *)self delegate];
  uint64_t v3 = [(DSSharingPermissionsDetailController *)self remainingPeople];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(DSSharingPermissionsDetailController *)self remainingPeople];
    id v6 = [(DSSharingPermissionsDetailController *)self startingViewController];
    uint64_t v7 = +[DSSharingPermissionsDetailController detailControllerWithPeople:v5 startingViewController:v6 delegate:v12];
  }
  else
  {
    id v8 = [(DSSharingPermissionsDetailController *)self remainingSharingTypes];
    uint64_t v9 = [v8 count];

    if (!v9) {
      goto LABEL_7;
    }
    uint64_t v5 = [(DSSharingPermissionsDetailController *)self remainingSharingTypes];
    id v6 = [(DSSharingPermissionsDetailController *)self startingViewController];
    uint64_t v7 = +[DSSharingPermissionsDetailController detailControllerWithSharingTypes:v5 startingViewController:v6 delegate:v12];
  }
  uint64_t v10 = (void *)v7;

  if (v10)
  {
    long long v11 = [(DSSharingPermissionsDetailController *)self navigationController];
    [v11 pushViewController:v10 animated:1];

    goto LABEL_8;
  }
LABEL_7:
  [v12 reviewSelectedSharingFlowCompleted];
LABEL_8:
}

- (void)_updateButton
{
  uint64_t v3 = [(DSTableWelcomeController *)self boldButton];
  [v3 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  uint64_t v4 = [(OBTableWelcomeController *)self tableView];
  uint64_t v5 = [v4 indexPathsForSelectedRows];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [(DSTableWelcomeController *)self boldButton];
  if (v6) {
    id v8 = @"STOP_SHARING";
  }
  else {
    id v8 = @"SKIP";
  }
  if (v6) {
    uint64_t v9 = &selRef_stopSelectedSharing;
  }
  else {
    uint64_t v9 = &selRef_next;
  }
  uint64_t v10 = DSUILocStringForKey(v8);
  [v7 setTitle:v10 forState:0];

  id v11 = [(DSTableWelcomeController *)self boldButton];
  [v11 addTarget:self action:*v9 forControlEvents:64];
}

- (DSSharingPerson)sharingPerson
{
  return self->_sharingPerson;
}

- (void)setSharingPerson:(id)a3
{
}

- (NSArray)remainingPeople
{
  return self->_remainingPeople;
}

- (void)setRemainingPeople:(id)a3
{
}

- (DSSharingType)sharingType
{
  return self->_sharingType;
}

- (void)setSharingType:(id)a3
{
}

- (NSArray)remainingSharingTypes
{
  return self->_remainingSharingTypes;
}

- (void)setRemainingSharingTypes:(id)a3
{
}

- (NSArray)sortedSourceNames
{
  return self->_sortedSourceNames;
}

- (void)setSortedSourceNames:(id)a3
{
}

- (NSArray)sortedPeople
{
  return self->_sortedPeople;
}

- (void)setSortedPeople:(id)a3
{
}

- (UIViewController)startingViewController
{
  return self->_startingViewController;
}

- (void)setStartingViewController:(id)a3
{
}

- (DSSharingPermissionsDetailDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSSharingPermissionsDetailDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_startingViewController, 0);
  objc_storeStrong((id *)&self->_sortedPeople, 0);
  objc_storeStrong((id *)&self->_sortedSourceNames, 0);
  objc_storeStrong((id *)&self->_remainingSharingTypes, 0);
  objc_storeStrong((id *)&self->_sharingType, 0);
  objc_storeStrong((id *)&self->_remainingPeople, 0);
  objc_storeStrong((id *)&self->_sharingPerson, 0);
}

- (void)tableView:(os_log_t)log numberOfRowsInSection:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_235BFC000, log, OS_LOG_TYPE_FAULT, "Too many sources to count", v1, 2u);
}

- (void)sourceNameForIndexPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_235BFC000, a2, OS_LOG_TYPE_FAULT, "Failed to find a source for index path %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)personForIndexPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_235BFC000, a2, OS_LOG_TYPE_FAULT, "Failed to find a person for index path %{public}@", (uint8_t *)&v2, 0xCu);
}

@end