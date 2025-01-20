@interface ExternalHangTracerController
- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4;
- (BOOL)shouldEnableSelectButtonItem;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (ExternalHangTracerController)init;
- (HTDeveloperAppsFinder)appsFinder;
- (HTDeveloperSettings)hangTracerSettings;
- (HTHangsDataFinder)hangsDataFinder;
- (NSArray)cachedDeveloperAppsSpecifiers;
- (NSArray)cachedHangEventsSpecifiers;
- (NSArray)developerApps;
- (NSDateFormatter)formatter;
- (NSDictionary)hangsEvents;
- (NSDictionary)processingHangsEvents;
- (NSDictionary)unifiedHangsEvents;
- (NSMeasurementFormatter)durationFormatter;
- (id)developerAppsSpecifiersFromList:(id)a3;
- (id)hangEventDetails:(id)a3;
- (id)hangEventsSpecifiersForDict:(id)a3;
- (id)hangTracerThreshold;
- (id)isHangTracerEnabled;
- (id)specifiers;
- (id)specifiersOnlyWhenEnabled;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)thresholdSpecifiers;
- (int64_t)appsState;
- (int64_t)logsState;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)delayedAsyncLoadSpecifiersWithCompletion:(id)a3;
- (void)developerAppsDidChangeForFinder:(id)a3;
- (void)enableHangTracer:(id)a3 forSpecifier:(id)a4;
- (void)goToNextAppsState;
- (void)goToNextLogsState;
- (void)markGroup:(id)a3 asLoading:(BOOL)a4;
- (void)presentErrorWithTitle:(id)a3 message:(id)a4;
- (void)reloadAsyncSpecifiersWithCompletion:(id)a3;
- (void)reloadSpecifiers;
- (void)setAppsFinder:(id)a3;
- (void)setAppsState:(int64_t)a3;
- (void)setCachedDeveloperAppsSpecifiers:(id)a3;
- (void)setCachedHangEventsSpecifiers:(id)a3;
- (void)setDeveloperApps:(id)a3;
- (void)setDurationFormatter:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFormatter:(id)a3;
- (void)setHangTracerSettings:(id)a3;
- (void)setHangTracerThreshold:(id)a3 forSpecifier:(id)a4;
- (void)setHangsDataFinder:(id)a3;
- (void)setHangsEvents:(id)a3;
- (void)setLogsState:(int64_t)a3;
- (void)setProcessingHangsEvents:(id)a3;
- (void)setUnifiedHangsEvents:(id)a3;
- (void)shareLogs:(id)a3 sender:(id)a4;
- (void)shareSelectedHangs:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDeveloperAppsWithCompletion:(id)a3;
- (void)updateFromHangEventSpecifiers:(id)a3 toSpecifiers:(id)a4;
- (void)updateHangEventsWithCompletion:(id)a3;
- (void)updateProcessingHangEventsWithCompletion:(id)a3;
- (void)updateRightBarButtonItemAnimated:(BOOL)a3;
- (void)updateShareButtonEnabled;
- (void)updateSpecifiersWithHangEvents:(id)a3 processingHangEvents:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ExternalHangTracerController

- (ExternalHangTracerController)init
{
  v41.receiver = self;
  v41.super_class = (Class)ExternalHangTracerController;
  v2 = [(ExternalHangTracerController *)&v41 init];
  v3 = v2;
  if (v2)
  {
    [(ExternalHangTracerController *)v2 setReusesCells:1];
    v4 = (NSMeasurementFormatter *)objc_alloc_init((Class)NSMeasurementFormatter);
    durationFormatter = v3->_durationFormatter;
    v3->_durationFormatter = v4;

    [(NSMeasurementFormatter *)v3->_durationFormatter setUnitStyle:1];
    [(NSMeasurementFormatter *)v3->_durationFormatter setUnitOptions:1];
    id v6 = objc_alloc_init((Class)NSNumberFormatter);
    [v6 setNumberStyle:0];
    [v6 setMaximumFractionDigits:0];
    [(NSMeasurementFormatter *)v3->_durationFormatter setNumberFormatter:v6];
    v7 = (HTDeveloperSettings *)objc_alloc_init((Class)HTDeveloperSettings);
    hangTracerSettings = v3->_hangTracerSettings;
    v3->_hangTracerSettings = v7;

    v9 = (HTDeveloperAppsFinder *)objc_alloc_init((Class)HTDeveloperAppsFinder);
    appsFinder = v3->_appsFinder;
    v3->_appsFinder = v9;

    [(HTDeveloperAppsFinder *)v3->_appsFinder setDelegate:v3];
    developerApps = v3->_developerApps;
    v3->_developerApps = (NSArray *)&__NSArray0__struct;

    v3->_appsState = 0;
    objc_initWeak(&location, v3);
    id v12 = objc_alloc((Class)HTHangsDataFinder);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_6C68;
    v38[3] = &unk_34C08;
    objc_copyWeak(&v39, &location);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_6D94;
    v36[3] = &unk_34C08;
    objc_copyWeak(&v37, &location);
    v13 = (HTHangsDataFinder *)[v12 initWithLogUpdateCallback:v38 tailspinSavedCallback:v36];
    hangsDataFinder = v3->_hangsDataFinder;
    v3->_hangsDataFinder = v13;

    hangsEvents = v3->_hangsEvents;
    v3->_hangsEvents = (NSDictionary *)&__NSDictionary0__struct;

    processingHangsEvents = v3->_processingHangsEvents;
    v3->_processingHangsEvents = (NSDictionary *)&__NSDictionary0__struct;

    unifiedHangsEvents = v3->_unifiedHangsEvents;
    v3->_unifiedHangsEvents = (NSDictionary *)&__NSDictionary0__struct;

    v3->_logsState = 0;
    v18 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    formatter = v3->_formatter;
    v3->_formatter = v18;

    [(NSDateFormatter *)v3->_formatter setDateStyle:2];
    [(NSDateFormatter *)v3->_formatter setTimeStyle:1];
    [(ExternalHangTracerController *)v3 setCachedHangEventsSpecifiers:&__NSArray0__struct];
    [(ExternalHangTracerController *)v3 setCachedDeveloperAppsSpecifiers:&__NSArray0__struct];
    [(ExternalHangTracerController *)v3 delayedAsyncLoadSpecifiersWithCompletion:0];
    id v20 = objc_alloc((Class)UIBarButtonItem);
    v21 = HTUIShareButton();
    v22 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_6DD8;
    v34[3] = &unk_34B70;
    objc_copyWeak(&v35, &location);
    v23 = +[UIAction actionWithTitle:v21 image:v22 identifier:0 handler:v34];
    v24 = (UIBarButtonItem *)[v20 initWithPrimaryAction:v23];
    shareButtonItem = v3->_shareButtonItem;
    v3->_shareButtonItem = v24;

    id v26 = objc_alloc((Class)UIBarButtonItem);
    v27 = HTUISelectButton();
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_6E4C;
    v32[3] = &unk_34B70;
    objc_copyWeak(&v33, &location);
    v28 = +[UIAction actionWithTitle:v27 image:0 identifier:0 handler:v32];
    v29 = (UIBarButtonItem *)[v26 initWithPrimaryAction:v28];
    selectButtonItem = v3->_selectButtonItem;
    v3->_selectButtonItem = v29;

    [(ExternalHangTracerController *)v3 updateRightBarButtonItemAnimated:0];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ExternalHangTracerController;
  [(ExternalHangTracerController *)&v14 viewDidAppear:a3];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 bundleURL];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  v7 = +[NSLocale currentLocale];
  id v8 = [v6 initWithKey:@"DEVELOPER" table:@"DTSettings" locale:v7 bundleURL:v5];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  v10 = +[NSLocale currentLocale];
  id v11 = [v9 initWithKey:@"HANGTRACER_EXTERNAL_CONFIGURE" table:@"DTSettings" locale:v10 bundleURL:v5];

  id v15 = v8;
  id v12 = +[NSArray arrayWithObjects:&v15 count:1];
  v13 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Developer/HANGTRACER_EXTERNAL_CONFIGURE"];
  [(ExternalHangTracerController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.developer-tools" title:v11 localizedNavigationComponents:v12 deepLink:v13];
}

- (void)goToNextAppsState
{
  self->_appsState = 2;
}

- (void)goToNextLogsState
{
  int64_t v2 = 1;
  if (self->_logsState) {
    int64_t v2 = 2;
  }
  self->_logsState = v2;
}

- (void)markGroup:(id)a3 asLoading:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7120;
  block[3] = &unk_34C30;
  block[4] = self;
  id v7 = a3;
  BOOL v8 = a4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateHangEventsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ExternalHangTracerController *)self isHangTracerEnabled];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    objc_initWeak(&location, self);
    if (!self->_logsState) {
      [(ExternalHangTracerController *)self markGroup:@"HANGTRACER_EXTERNAL_HANG_EVENTS" asLoading:1];
    }
    id v7 = [(ExternalHangTracerController *)self hangsDataFinder];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_7380;
    v8[3] = &unk_34C58;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v7 findEventsFilteringDeveloperApps:1 completionHandler:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)updateDeveloperAppsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ExternalHangTracerController *)self isHangTracerEnabled];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    objc_initWeak(&location, self);
    if (!self->_appsState) {
      [(ExternalHangTracerController *)self markGroup:@"HANGTRACER_EXTERNAL_DEVELOPER_APPS" asLoading:1];
    }
    id v7 = [(ExternalHangTracerController *)self appsFinder];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_759C;
    v8[3] = &unk_34C80;
    objc_copyWeak(&v10, &location);
    void v8[4] = self;
    id v9 = v4;
    [v7 findApps:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)updateProcessingHangEventsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (!self->_logsState) {
    [(ExternalHangTracerController *)self markGroup:@"HANGTRACER_EXTERNAL_HANG_EVENTS" asLoading:1];
  }
  hangsDataFinder = self->_hangsDataFinder;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7A40;
  v7[3] = &unk_34C58;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(HTHangsDataFinder *)hangsDataFinder findProcessingEventsFilteringDeveloperApps:1 completionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updateSpecifiersWithHangEvents:(id)a3 processingHangEvents:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [v6 mutableCopy];
  [v7 setValuesForKeysWithDictionary:v13];
  id v8 = +[NSMutableArray array];
  [(ExternalHangTracerController *)self goToNextLogsState];
  [(ExternalHangTracerController *)self markGroup:@"HANGTRACER_EXTERNAL_HANG_EVENTS" asLoading:self->_logsState != 2];
  if ([v7 count])
  {
    id v9 = [(ExternalHangTracerController *)self hangEventsSpecifiersForDict:v7];
    [v8 addObjectsFromArray:v9];
  }
  else
  {
    id v10 = HTUIPlaceholderNoLogs();
    id v9 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

    uint64_t v11 = +[NSMutableArray arrayWithObject:v9];

    id v8 = (void *)v11;
  }

  id v12 = [(ExternalHangTracerController *)self cachedHangEventsSpecifiers];
  [(ExternalHangTracerController *)self setHangsEvents:v13];
  [(ExternalHangTracerController *)self setProcessingHangsEvents:v6];

  [(ExternalHangTracerController *)self setUnifiedHangsEvents:v7];
  [(ExternalHangTracerController *)self setCachedHangEventsSpecifiers:v8];
  [(ExternalHangTracerController *)self updateFromHangEventSpecifiers:v12 toSpecifiers:v8];
  [(UIBarButtonItem *)self->_selectButtonItem setEnabled:[(ExternalHangTracerController *)self shouldEnableSelectButtonItem]];
  [(ExternalHangTracerController *)self updateShareButtonEnabled];
  if ([(ExternalHangTracerController *)self isEditing]
    && ![(ExternalHangTracerController *)self shouldEnableSelectButtonItem])
  {
    [(ExternalHangTracerController *)self setEditing:0 animated:1];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ExternalHangTracerController;
  [(ExternalHangTracerController *)&v4 viewDidDisappear:a3];
  self->_appsState = 0;
  self->_logsState = 0;
}

- (void)updateFromHangEventSpecifiers:(id)a3 toSpecifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ExternalHangTracerController *)self indexOfSpecifierID:@"HANGTRACER_EXTERNAL_HANG_EVENTS"];
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = (unint64_t)v8;
    id v10 = [v7 differenceFromArray:v6 withOptions:0 usingEquivalenceTest:&stru_34CC0];
    uint64_t v11 = OBJC_IVAR___PSListController__specifiers;
    id v12 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] mutableCopy];
    if ([v6 count])
    {
      id v13 = *(void **)&self->PSListController_opaque[v11];
      objc_super v14 = [v6 firstObject];
      id v15 = (char *)[v13 indexOfObject:v14];
    }
    else
    {
      id v15 = (char *)(v9 + 1);
    }
    id v42 = v7;
    objc_msgSend(v12, "replaceObjectsInRange:withObjectsFromArray:", v15, objc_msgSend(v6, "count"), v7);
    objc_super v41 = v12;
    id v16 = [v12 copy];
    v17 = *(void **)&self->PSListController_opaque[v11];
    *(void *)&self->PSListController_opaque[v11] = v16;

    v18 = [(ExternalHangTracerController *)self table];
    [v18 beginUpdates];

    v19 = &v15[~v9];
    id v20 = [v10 insertions];
    id v21 = [v20 count];

    v43 = v10;
    if (v21)
    {
      v22 = +[NSMutableArray array];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v23 = [v10 insertions];
      id v24 = [v23 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v49;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v49 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", &v19[(void)[*(id *)(*((void *)&v48 + 1) + 8 * i) index]], 3);
            [v22 addObject:v28];
          }
          id v25 = [v23 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v25);
      }

      v29 = [(ExternalHangTracerController *)self table];
      [v29 insertRowsAtIndexPaths:v22 withRowAnimation:0];

      id v10 = v43;
    }
    v30 = [v10 removals];
    id v31 = [v30 count];

    if (v31)
    {
      v32 = +[NSMutableArray array];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v33 = [v10 removals];
      id v34 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v45;
        do
        {
          for (j = 0; j != v35; j = (char *)j + 1)
          {
            if (*(void *)v45 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", &v19[(void)[*(id *)(*((void *)&v44 + 1) + 8 * (void)j) index]], 3);
            [v32 addObject:v38];
          }
          id v35 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v35);
      }

      id v39 = [(ExternalHangTracerController *)self table];
      [v39 deleteRowsAtIndexPaths:v32 withRowAnimation:0];

      id v10 = v43;
    }
    v40 = [(ExternalHangTracerController *)self table];
    [v40 endUpdates];

    [(ExternalHangTracerController *)self prepareSpecifiersMetadata];
    id v7 = v42;
  }
}

- (void)presentErrorWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3042000000;
  v15[3] = sub_8454;
  v15[4] = sub_8460;
  objc_initWeak(&v16, self);
  id v8 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  unint64_t v9 = HTUIDialogOKButton();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_8468;
  v14[3] = &unk_34CE8;
  v14[4] = v15;
  id v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v14];
  [v8 addAction:v10];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_84B8;
  block[3] = &unk_34D10;
  block[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);
}

- (void)reloadAsyncSpecifiersWithCompletion:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3042000000;
  v20[3] = sub_8454;
  v20[4] = sub_8460;
  objc_initWeak(&v21, self);
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_8738;
  v17[3] = &unk_34D38;
  id v6 = v5;
  v18 = v6;
  v19 = v20;
  [(ExternalHangTracerController *)self updateDeveloperAppsWithCompletion:v17];
  dispatch_group_enter(v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_87D8;
  v14[3] = &unk_34D38;
  id v7 = v6;
  id v15 = v7;
  id v16 = v20;
  [(ExternalHangTracerController *)self updateHangEventsWithCompletion:v14];
  dispatch_group_enter(v7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8878;
  v12[3] = &unk_34BE0;
  id v8 = v7;
  id v13 = v8;
  [(ExternalHangTracerController *)self updateProcessingHangEventsWithCompletion:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_8880;
  v10[3] = &unk_34D60;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, v10);

  _Block_object_dispose(v20, 8);
  objc_destroyWeak(&v21);
}

- (void)updateRightBarButtonItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ExternalHangTracerController *)self navigationItem];
  if ([(HTDeveloperSettings *)self->_hangTracerSettings isEnabled])
  {
    if ([(ExternalHangTracerController *)self isEditing])
    {
      objc_initWeak(&location, self);
      [v5 setRightBarButtonItem:self->_shareButtonItem animated:v3];
      id v6 = objc_alloc((Class)UIBarButtonItem);
      id v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      id v11 = sub_8A74;
      id v12 = &unk_34B70;
      objc_copyWeak(&v13, &location);
      id v7 = +[UIAction actionWithHandler:&v9];
      id v8 = objc_msgSend(v6, "initWithBarButtonSystemItem:primaryAction:", 1, v7, v9, v10, v11, v12);

      [v5 setLeftBarButtonItem:v8 animated:v3];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      [(UIBarButtonItem *)self->_selectButtonItem setEnabled:[(ExternalHangTracerController *)self shouldEnableSelectButtonItem]];
      [v5 setRightBarButtonItem:self->_selectButtonItem animated:v3];
      [v5 setLeftBarButtonItem:0 animated:v3];
    }
  }
  else
  {
    [v5 setLeftBarButtonItem:0 animated:v3];
    [v5 setRightBarButtonItem:0 animated:v3];
  }
}

- (BOOL)shouldEnableSelectButtonItem
{
  int64_t v2 = [(ExternalHangTracerController *)self unifiedHangsEvents];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = [(ExternalHangTracerController *)self isEditing];
  v22.receiver = self;
  v22.super_class = (Class)ExternalHangTracerController;
  [(ExternalHangTracerController *)&v22 setEditing:v5 animated:v4];
  if (v7 != v5)
  {
    [(ExternalHangTracerController *)self updateRightBarButtonItemAnimated:v4];
    id v8 = [(ExternalHangTracerController *)self table];
    [v8 setEditing:v5 animated:v4];

    id v9 = [(ExternalHangTracerController *)self table];
    [v9 setAllowsMultipleSelection:v5];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [(ExternalHangTracerController *)self table];
    id v11 = [v10 indexPathsForSelectedRows];

    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v15);
          v17 = [(ExternalHangTracerController *)self table];
          [v17 deselectRowAtIndexPath:v16 animated:v4];

          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v13);
    }

    [(ExternalHangTracerController *)self updateShareButtonEnabled];
  }
}

- (void)updateShareButtonEnabled
{
  if ([(ExternalHangTracerController *)self isEditing])
  {
    id v5 = [(ExternalHangTracerController *)self table];
    BOOL v3 = [v5 indexPathsForSelectedRows];
    -[UIBarButtonItem setEnabled:](self->_shareButtonItem, "setEnabled:", [v3 count] != 0);
  }
  else
  {
    shareButtonItem = self->_shareButtonItem;
    [(UIBarButtonItem *)shareButtonItem setEnabled:0];
  }
}

- (void)shareSelectedHangs:(id)a3
{
  id v16 = a3;
  long long v19 = self;
  BOOL v4 = [(ExternalHangTracerController *)self table];
  id v5 = [v4 indexPathsForSelectedRows];

  id v6 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  id v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        id v8 = [(ExternalHangTracerController *)v19 specifierAtIndexPath:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v21 = v8;
        id v9 = [v8 objectForKeyedSubscript:@"HangsDataControllerHangData"];
        id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) path];
              id v15 = +[NSURL fileURLWithPath:v14];

              [v6 addObject:v15];
              +[HTHangsAnalytics sendLogSharedEvent];
            }
            id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v11);
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }

  [(ExternalHangTracerController *)v19 shareLogs:v6 sender:v16];
}

- (void)shareLogs:(id)a3 sender:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)UIActivityViewController) initWithActivityItems:v6 applicationActivities:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 popoverPresentationController];
    [v8 setBarButtonItem:v9];
  }
  [(ExternalHangTracerController *)self presentViewController:v7 animated:1 completion:0];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = [(ExternalHangTracerController *)self specifierAtIndexPath:a4];
  id v6 = [v5 objectForKeyedSubscript:@"HangsDataControllerIsProcessing"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    char v8 = 0;
  }
  else if ([(ExternalHangTracerController *)self isEditing])
  {
    id v9 = [v5 objectForKeyedSubscript:@"HangsDataControllerHangEvent"];
    char v8 = v9 != 0;
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ExternalHangTracerController *)self updateShareButtonEnabled];
  if (([(ExternalHangTracerController *)self isEditing] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)ExternalHangTracerController;
    [(ExternalHangTracerController *)&v8 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ExternalHangTracerController *)self isEditing]
    && [(ExternalHangTracerController *)self tableView:v6 shouldHighlightRowAtIndexPath:v7])
  {
    int64_t v8 = 3;
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  BOOL v4 = [(ExternalHangTracerController *)self specifierAtIndexPath:a4];
  id v5 = [v4 objectForKeyedSubscript:@"HangsDataControllerHangEvent"];
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v21 = a3;
  id v7 = a4;
  if ([(ExternalHangTracerController *)self isEditing])
  {
    int64_t v8 = 0;
  }
  else
  {
    long long v22 = [(ExternalHangTracerController *)self specifierAtIndexPath:v7];
    id v20 = [v22 objectForKeyedSubscript:@"HangsDataControllerHangEvent"];
    id v9 = [v22 objectForKeyedSubscript:@"HangsDataControllerIsProcessing"];
    unsigned __int8 v10 = [v9 BOOLValue];

    int64_t v8 = 0;
    if ((v10 & 1) == 0 && v20)
    {
      id v11 = +[NSMutableArray array];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v12 = [v22 objectForKeyedSubscript:@"HangsDataControllerHangData"];
      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v28;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = [*(id *)(*((void *)&v27 + 1) + 8 * i) path];
            v17 = +[NSURL fileURLWithPath:v16];
            [v11 addObject:v17];
          }
          id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v13);
      }

      objc_initWeak(&location, self);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_9588;
      v23[3] = &unk_34DF0;
      objc_copyWeak(&v25, &location);
      id v18 = v11;
      id v24 = v18;
      int64_t v8 = +[UIContextMenuConfiguration configurationWithIdentifier:v20 previewProvider:&stru_34DA0 actionProvider:v23];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }

  return v8;
}

- (void)developerAppsDidChangeForFinder:(id)a3
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3042000000;
  v4[3] = sub_8454;
  v4[4] = sub_8460;
  objc_initWeak(&v5, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9884;
  block[3] = &unk_34E40;
  block[4] = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  _Block_object_dispose(v4, 8);
  objc_destroyWeak(&v5);
}

- (id)thresholdSpecifiers
{
  BOOL v3 = HTUILogsThresholdSelectorTitle();
  BOOL v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:"setHangTracerThreshold:forSpecifier:" get:"hangTracerThreshold" detail:0 cell:9 edit:0];

  [v4 setIdentifier:@"HANGTRACER_EXTERNAL_HANG_THRESHOLD"];
  [v4 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
  id v5 = [(HTDeveloperSettings *)self->_hangTracerSettings availableThresholdsValues];
  BOOL v6 = [(HTDeveloperSettings *)self->_hangTracerSettings availableThresholdsShortNames];
  [v4 setValues:v5 titles:v6];
  id v7 = HTUILogsThresholdSelectorTitle();
  int64_t v8 = +[PSSpecifier groupSpecifierWithID:@"HANGTRACER_EXTERNAL_HANG_THRESHOLD_GROUP" name:v7];
  v11[0] = v8;
  v11[1] = v4;
  id v9 = +[NSArray arrayWithObjects:v11 count:2];

  return v9;
}

- (id)specifiersOnlyWhenEnabled
{
  BOOL v3 = +[NSMutableArray array];
  BOOL v4 = [(ExternalHangTracerController *)self thresholdSpecifiers];
  [v3 addObjectsFromArray:v4];

  id v5 = HTUIAppsSectionTitle();
  BOOL v6 = +[PSSpecifier groupSpecifierWithID:@"HANGTRACER_EXTERNAL_DEVELOPER_APPS" name:v5];

  id v7 = (objc_class *)objc_opt_class();
  int64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = PSHeaderCellClassGroupKey;
  [v6 setObject:v8 forKeyedSubscript:PSHeaderCellClassGroupKey];

  if (self->_appsState)
  {
    unsigned __int8 v10 = HTUIAppsSectionFooter();
    [v6 setObject:v10 forKeyedSubscript:PSFooterTextGroupKey];
  }
  else
  {
    [v6 setObject:0 forKeyedSubscript:PSFooterTextGroupKey];
  }
  [v3 addObject:v6];
  [v3 addObjectsFromArray:self->_cachedDeveloperAppsSpecifiers];
  id v11 = HTUILogsSectionTitle();
  uint64_t v12 = +[PSSpecifier groupSpecifierWithID:@"HANGTRACER_EXTERNAL_HANG_EVENTS" name:v11];

  id v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  [v12 setObject:v14 forKeyedSubscript:v9];

  [v12 setObject:&off_382F8 forKeyedSubscript:@"top-margin"];
  [v3 addObject:v12];
  [v3 addObjectsFromArray:self->_cachedHangEventsSpecifiers];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  BOOL v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = HTUIActivationToggleTitle();
    BOOL v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"enableHangTracer:forSpecifier:" get:"isHangTracerEnabled" detail:0 cell:6 edit:0];

    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    [v6 setIdentifier:@"HANGTRACER_EXTERNAL_HANG_TOGGLE"];
    id v7 = +[PSSpecifier emptyGroupSpecifier];
    [v7 setTarget:self];
    int64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v7 setObject:v9 forKeyedSubscript:PSFooterCellClassGroupKey];

    v17[0] = v7;
    v17[1] = v6;
    unsigned __int8 v10 = +[NSArray arrayWithObjects:v17 count:2];
    id v11 = +[NSMutableArray arrayWithArray:v10];

    uint64_t v12 = [(ExternalHangTracerController *)self isHangTracerEnabled];
    unsigned int v13 = [v12 BOOLValue];

    if (v13)
    {
      uint64_t v14 = [(ExternalHangTracerController *)self specifiersOnlyWhenEnabled];
      [v11 addObjectsFromArray:v14];
    }
    id v15 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v11;

    BOOL v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)developerAppsSpecifiersFromList:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    uint64_t v8 = PSLazyIconAppID;
    uint64_t v9 = PSLazyIconLoading;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 name];
        unsigned int v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:4 edit:0];

        uint64_t v14 = [v11 bundleID];
        [v13 setIdentifier:v14];

        id v15 = [v11 bundleID];
        [v13 setObject:v15 forKeyedSubscript:v8];

        [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:v9];
        [v4 addObject:v13];
      }
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)hangEventsSpecifiersForDict:(id)a3
{
  id v4 = a3;
  id v29 = +[NSMutableArray array];
  +[HTHangsDataEntry sortedHangIDsByCreationDate:v4];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v30 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v30)
  {
    uint64_t v27 = PSCellClassKey;
    uint64_t v28 = *(void *)v32;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v7 = [v4 objectForKeyedSubscript:v6];
        uint64_t v8 = [v7 firstObject];

        uint64_t v9 = [v8 displayName];
        if ([v8 isBeingProcessed]) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = objc_opt_class();
        }
        if ([v8 isBeingProcessed]) {
          uint64_t v11 = 15;
        }
        else {
          uint64_t v11 = 2;
        }
        uint64_t v12 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:"hangEventDetails:" detail:v10 cell:v11 edit:0];

        unsigned int v13 = [v8 hangID];
        [v12 setIdentifier:v13];

        [v12 setObject:objc_opt_class() forKeyedSubscript:v27];
        [v12 setObject:v6 forKeyedSubscript:@"HangsDataControllerHangEvent"];
        uint64_t v14 = [v4 objectForKeyedSubscript:v6];
        [v12 setObject:v14 forKeyedSubscript:@"HangsDataControllerHangData"];

        id v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isBeingProcessed]);
        [v12 setObject:v15 forKeyedSubscript:@"HangsDataControllerIsProcessing"];

        [v8 duration];
        id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v12 setObject:v16 forKeyedSubscript:@"HangsDataControllerDuration"];

        v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 durationLevel]);
        [v12 setObject:v17 forKeyedSubscript:@"HangsDataControllerDurationLevel"];

        [v8 duration];
        if (v18 > 0.0)
        {
          id v19 = objc_alloc((Class)NSMeasurement);
          [v8 duration];
          double v21 = v20;
          long long v22 = +[NSUnitDuration milliseconds];
          id v23 = [v19 initWithDoubleValue:v22 unit:v21];

          id v24 = [(NSMeasurementFormatter *)self->_durationFormatter stringFromMeasurement:v23];
          [v12 setObject:v24 forKeyedSubscript:@"HangsDataControllerFormattedDuration"];
        }
        [v29 addObject:v12];
      }
      id v30 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v30);
  }

  return v29;
}

- (id)hangEventDetails:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"HangsDataControllerHangEvent"];
  if (v4)
  {
    id v5 = [(ExternalHangTracerController *)self unifiedHangsEvents];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];
    uint64_t v7 = [v6 firstObject];

    uint64_t v8 = [v7 creationDate];

    if (v8)
    {
      formatter = self->_formatter;
      uint64_t v10 = [v7 creationDate];
      uint64_t v11 = [(NSDateFormatter *)formatter stringFromDate:v10];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)setHangTracerThreshold:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = (int)[a3 intValue];
  NSLog(@"Setting external hang tracer threshold to %ld", v5);
  +[HTHangsAnalytics sendHangThresholdChangedEvent:v5];
  id v6 = [(ExternalHangTracerController *)self hangTracerSettings];
  [v6 setHangTracerThreshold:v5];
}

- (id)hangTracerThreshold
{
  int64_t v2 = [(ExternalHangTracerController *)self hangTracerSettings];
  id v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 hangTracerThreshold]);

  return v3;
}

- (void)enableHangTracer:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 BOOLValue];
  NSLog(@"Setting external hang tracer enabled to %d", v8);
  uint64_t v9 = [(ExternalHangTracerController *)self hangTracerSettings];
  [v9 setEnabled:v8];

  if (v8)
  {
    uint64_t v10 = [(ExternalHangTracerController *)self specifiersOnlyWhenEnabled];
    [(ExternalHangTracerController *)self insertContiguousSpecifiers:v10 afterSpecifierID:@"HANGTRACER_EXTERNAL_HANG_TOGGLE" animated:1];

    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3042000000;
    v16[3] = sub_8454;
    v16[4] = sub_8460;
    objc_initWeak(&v17, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_A994;
    v14[3] = &unk_34E68;
    void v14[4] = v16;
    char v15 = 1;
    [(ExternalHangTracerController *)self delayedAsyncLoadSpecifiersWithCompletion:v14];
    _Block_object_dispose(v16, 8);
    objc_destroyWeak(&v17);
  }
  else
  {
    uint64_t v11 = [(ExternalHangTracerController *)self developerApps];
    id v12 = [v11 count];

    +[HTHangsAnalytics sendActivationEvent:0 developerAppCount:v12];
    [(ExternalHangTracerController *)self setDeveloperApps:&__NSArray0__struct];
    [(ExternalHangTracerController *)self setCachedDeveloperAppsSpecifiers:&__NSArray0__struct];
    [(ExternalHangTracerController *)self setHangsEvents:&__NSDictionary0__struct];
    [(ExternalHangTracerController *)self setProcessingHangsEvents:&__NSDictionary0__struct];
    [(ExternalHangTracerController *)self setUnifiedHangsEvents:&__NSDictionary0__struct];
    [(ExternalHangTracerController *)self setCachedHangEventsSpecifiers:&__NSArray0__struct];
    [(ExternalHangTracerController *)self removeSpecifierID:@"HANGTRACER_EXTERNAL_HANG_THRESHOLD_GROUP" animated:1];
    [(ExternalHangTracerController *)self removeSpecifierID:@"HANGTRACER_EXTERNAL_DEVELOPER_APPS" animated:1];
    [(ExternalHangTracerController *)self removeSpecifierID:@"HANGTRACER_EXTERNAL_HANG_EVENTS" animated:1];
  }
  [(ExternalHangTracerController *)self updateRightBarButtonItemAnimated:1];
  unsigned int v13 = +[NSNotificationCenter defaultCenter];
  [v13 postNotificationName:@"com.apple.Preferences.hangTracerStateChanged" object:0];
}

- (id)isHangTracerEnabled
{
  int64_t v2 = [(ExternalHangTracerController *)self hangTracerSettings];
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 isEnabled]);

  return v3;
}

- (void)delayedAsyncLoadSpecifiersWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3042000000;
  v9[3] = sub_8454;
  v9[4] = sub_8460;
  objc_initWeak(&v10, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_ABA0;
  v6[3] = &unk_34E90;
  id v8 = v9;
  id v5 = v4;
  id v7 = v5;
  [(ExternalHangTracerController *)self reloadAsyncSpecifiersWithCompletion:v6];

  _Block_object_dispose(v9, 8);
  objc_destroyWeak(&v10);
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)ExternalHangTracerController;
  [(ExternalHangTracerController *)&v3 reloadSpecifiers];
  [(ExternalHangTracerController *)self delayedAsyncLoadSpecifiersWithCompletion:0];
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
  if (v6)
  {
    id v7 = [(ExternalHangTracerController *)self specifierForID:v5];
    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (HTDeveloperSettings)hangTracerSettings
{
  return self->_hangTracerSettings;
}

- (void)setHangTracerSettings:(id)a3
{
}

- (HTHangsDataFinder)hangsDataFinder
{
  return self->_hangsDataFinder;
}

- (void)setHangsDataFinder:(id)a3
{
}

- (NSDictionary)hangsEvents
{
  return self->_hangsEvents;
}

- (void)setHangsEvents:(id)a3
{
}

- (NSArray)cachedHangEventsSpecifiers
{
  return self->_cachedHangEventsSpecifiers;
}

- (void)setCachedHangEventsSpecifiers:(id)a3
{
}

- (NSDictionary)processingHangsEvents
{
  return self->_processingHangsEvents;
}

- (void)setProcessingHangsEvents:(id)a3
{
}

- (NSDictionary)unifiedHangsEvents
{
  return self->_unifiedHangsEvents;
}

- (void)setUnifiedHangsEvents:(id)a3
{
}

- (int64_t)logsState
{
  return self->_logsState;
}

- (void)setLogsState:(int64_t)a3
{
  self->_logsState = a3;
}

- (HTDeveloperAppsFinder)appsFinder
{
  return self->_appsFinder;
}

- (void)setAppsFinder:(id)a3
{
}

- (NSArray)developerApps
{
  return self->_developerApps;
}

- (void)setDeveloperApps:(id)a3
{
}

- (NSArray)cachedDeveloperAppsSpecifiers
{
  return self->_cachedDeveloperAppsSpecifiers;
}

- (void)setCachedDeveloperAppsSpecifiers:(id)a3
{
}

- (int64_t)appsState
{
  return self->_appsState;
}

- (void)setAppsState:(int64_t)a3
{
  self->_appsState = a3;
}

- (NSDateFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (NSMeasurementFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void)setDurationFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_cachedDeveloperAppsSpecifiers, 0);
  objc_storeStrong((id *)&self->_developerApps, 0);
  objc_storeStrong((id *)&self->_appsFinder, 0);
  objc_storeStrong((id *)&self->_unifiedHangsEvents, 0);
  objc_storeStrong((id *)&self->_processingHangsEvents, 0);
  objc_storeStrong((id *)&self->_cachedHangEventsSpecifiers, 0);
  objc_storeStrong((id *)&self->_hangsEvents, 0);
  objc_storeStrong((id *)&self->_hangsDataFinder, 0);
  objc_storeStrong((id *)&self->_hangTracerSettings, 0);
  objc_storeStrong((id *)&self->_selectButtonItem, 0);

  objc_storeStrong((id *)&self->_shareButtonItem, 0);
}

@end