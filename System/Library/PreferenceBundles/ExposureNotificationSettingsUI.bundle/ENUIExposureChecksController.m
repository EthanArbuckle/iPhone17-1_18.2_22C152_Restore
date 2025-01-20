@interface ENUIExposureChecksController
- (BOOL)fetchCompleted;
- (ENUIExposureChecksExportManager)exportManager;
- (ENUIExposureNotificationsStore)store;
- (NSArray)exposureChecks;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)deleteExposureChecks;
- (void)exportExposureChecks;
- (void)setExportManager:(id)a3;
- (void)setExposureChecks:(id)a3;
- (void)setFetchCompleted:(BOOL)a3;
- (void)setStore:(id)a3;
- (void)viewDidLoad;
@end

@implementation ENUIExposureChecksController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)ENUIExposureChecksController;
  [(ENUIExposureChecksController *)&v8 viewDidLoad];
  v3 = [(ENUIExposureChecksController *)self parentController];
  v4 = [v3 store];
  store = self->_store;
  self->_store = v4;

  v6 = self->_store;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_CFC8;
  v7[3] = &unk_2CE20;
  v7[4] = self;
  [(ENUIExposureNotificationsStore *)v6 fetchExposureChecksWithCompletion:v7];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = ENUILocalizedString();
    [(ENUIExposureChecksController *)v2 setTitle:v5];

    id v6 = objc_alloc_init((Class)NSMutableArray);
    if ([(ENUIExposureChecksController *)v2 fetchCompleted]
      && ([(ENUIExposureChecksController *)v2 exposureChecks],
          v7 = objc_claimAutoreleasedReturnValue(),
          id v8 = [v7 count],
          v7,
          v8))
    {
      uint64_t v35 = v3;
      if (qword_34188 != -1) {
        dispatch_once(&qword_34188, &stru_2CEE0);
      }
      id v37 = (id)qword_34180;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v9 = v2;
      obj = v2->_exposureChecks;
      id v10 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v39;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v39 != v12) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v15 = [v14 session];
            v16 = [v15 date];
            v17 = [v37 stringFromDate:v16];

            v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:v9 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
            v19 = (objc_class *)objc_opt_class();
            v20 = NSStringFromClass(v19);
            [v18 setProperty:v14 forKey:v20];

            [v6 addObject:v18];
          }
          id v11 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v11);
      }

      v21 = +[PSSpecifier emptyGroupSpecifier];
      uint64_t v22 = PSIDKey;
      [v21 setObject:@"EXPORT_EXPOSURE_CHECKS_GROUP" forKeyedSubscript:PSIDKey];
      [v6 addObject:v21];
      v23 = ENUILocalizedString();
      v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:v9 set:0 get:0 detail:0 cell:13 edit:0];

      [v24 setObject:@"EXPORT_EXPOSURE_CHECKS" forKeyedSubscript:v22];
      [v24 setButtonAction:"exportExposureChecks"];
      [v6 addObject:v24];
      v2 = v9;
      v25 = +[PSSpecifier emptyGroupSpecifier];
      [v25 setObject:@"DELETE_EXPOSURE_CHECKS_GROUP" forKeyedSubscript:v22];
      [v6 addObject:v25];
      v26 = ENUILocalizedString();
      v27 = +[PSConfirmationSpecifier preferenceSpecifierNamed:v26 target:v9 set:0 get:0 detail:0 cell:13 edit:0];

      v28 = ENUILocalizedString();
      [v27 setCancelButton:v28];

      v29 = ENUILocalizedString();
      [v27 setTitle:v29];

      v30 = ENUILocalizedString();
      [v27 setPrompt:v30];

      [v27 setObject:&__kCFBooleanTrue forKeyedSubscript:PSConfirmationDestructiveKey];
      [v27 setObject:@"DELETE_EXPOSURE_CHECKS" forKeyedSubscript:v22];
      [v27 setButtonAction:"deleteExposureChecks"];
      [v6 addObject:v27];

      uint64_t v3 = v35;
    }
    else if ([(ENUIExposureChecksController *)v2 fetchCompleted])
    {
      v31 = +[PSSpecifier emptyGroupSpecifier];
      v32 = ENUILocalizedString();
      [v31 setObject:v32 forKeyedSubscript:PSFooterTextGroupKey];

      [v6 addObject:v31];
    }
    v33 = *(void **)&v2->PSListController_opaque[v3];
    *(void *)&v2->PSListController_opaque[v3] = v6;

    v4 = *(void **)&v2->PSListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)ENUIExposureChecksController;
  id v6 = a4;
  v7 = [(ENUIExposureChecksController *)&v16 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = -[ENUIExposureChecksController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v16.receiver, v16.super_class);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 objectForKeyedSubscript:PSIDKey];
    unsigned int v10 = [v9 isEqualToString:@"DELETE_EXPOSURE_CHECKS"];

    if (v10)
    {
      id v11 = v7;
      if ([v11 type] == (char *)&dword_C + 1)
      {
        uint64_t v12 = +[UIColor redColor];
        v13 = [v11 textLabel];
        [v13 setTextColor:v12];

        goto LABEL_7;
      }
    }
  }
  id v14 = v7;
LABEL_7:

  return v7;
}

- (void)exportExposureChecks
{
  uint64_t v3 = (id *)(&stru_B8 + 16);
  exposureChecks = self->_exposureChecks;
  v5 = ENUILogForCategory();
  id v6 = v5;
  if (exposureChecks)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = (id)objc_opt_class();
      id v7 = v21;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting export", buf, 0xCu);
    }
    id v6 = objc_alloc_init((Class)NSDateFormatter);
    id v8 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    [v6 setLocale:v8];

    [v6 setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
    exportManager = self->_exportManager;
    if (exportManager)
    {
      unsigned int v10 = exportManager;
      id v11 = self->_exportManager;
      self->_exportManager = v10;
    }
    else
    {
      uint64_t v12 = [ENUIExposureChecksExportManager alloc];
      v13 = self->_exposureChecks;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_D8D0;
      v18[3] = &unk_2CE48;
      uint64_t v3 = (id *)&v19;
      v19 = v6;
      id v11 = [(NSArray *)v13 enui_map:v18];
      id v14 = [(ENUIExposureChecksExportManager *)v12 initWithJSONSerializedExposureChecks:v11];
      v15 = self->_exportManager;
      self->_exportManager = v14;
    }
    objc_super v16 = self->_exportManager;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_D8DC;
    v17[3] = &unk_2CE98;
    v17[4] = self;
    [(ENUIExposureChecksExportManager *)v16 createExportFileWithCompletion:v17];
    if (!exportManager) {
  }
    }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1D6A4((uint64_t)self, v6);
  }
}

- (void)deleteExposureChecks
{
  store = self->_store;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_DD7C;
  v3[3] = &unk_2CEC0;
  v3[4] = self;
  [(ENUIExposureNotificationsStore *)store resetDataWithFlags:4 completion:v3];
}

- (ENUIExposureNotificationsStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSArray)exposureChecks
{
  return self->_exposureChecks;
}

- (void)setExposureChecks:(id)a3
{
}

- (BOOL)fetchCompleted
{
  return self->_fetchCompleted;
}

- (void)setFetchCompleted:(BOOL)a3
{
  self->_fetchCompleted = a3;
}

- (ENUIExposureChecksExportManager)exportManager
{
  return self->_exportManager;
}

- (void)setExportManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportManager, 0);
  objc_storeStrong((id *)&self->_exposureChecks, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end