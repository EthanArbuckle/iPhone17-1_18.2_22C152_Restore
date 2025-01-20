@interface ENUIExposureCheckDetailController
- (id)dataSource;
- (id)matchedKeyText;
- (id)specifiers;
- (id)timestampText;
- (void)viewDidLoad;
@end

@implementation ENUIExposureCheckDetailController

- (void)viewDidLoad
{
  v3 = [(ENUIExposureCheckDetailController *)self specifier];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 propertyForKey:v5];
  check = self->_check;
  self->_check = v6;

  v8.receiver = self;
  v8.super_class = (Class)ENUIExposureCheckDetailController;
  [(ENUIExposureCheckDetailController *)&v8 viewDidLoad];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = ENUILocalizedString();
    [(ENUIExposureCheckDetailController *)v2 setTitle:v5];

    id v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = &CFBundleGetIdentifier_ptr;
    objc_super v8 = ENUILocalizedString();
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:v2 set:0 get:"timestampText" detail:0 cell:4 edit:0];

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = PSCellClassKey;
    [v9 setProperty:v10 forKey:PSCellClassKey];
    v12 = ENUILocalizedString();
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:v2 set:0 get:"matchedKeyText" detail:0 cell:4 edit:0];

    [v13 setProperty:objc_opt_class() forKey:v11];
    v14 = ENUILocalizedString();
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:v2 set:0 get:"dataSource" detail:0 cell:4 edit:0];

    [v15 setProperty:objc_opt_class() forKey:v11];
    v16 = +[PSSpecifier emptyGroupSpecifier];
    v46[0] = v16;
    v46[1] = v9;
    v46[2] = v13;
    v46[3] = v15;
    v17 = +[NSArray arrayWithObjects:v46 count:4];
    [v6 addObjectsFromArray:v17];

    v18 = [(ENExposureDetectionHistoryCheck *)v2->_check files];
    id v19 = [v18 count];

    if (v19)
    {
      v36 = v15;
      v37 = v13;
      v38 = v9;
      uint64_t v39 = v3;
      v20 = ENUILocalizedString();
      v21 = +[PSSpecifier groupSpecifierWithName:v20];
      [v6 addObject:v21];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v22 = v2;
      id obj = [(ENExposureDetectionHistoryCheck *)v2->_check files];
      id v23 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v42;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            v27 = v6;
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(obj);
            }
            v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            v29 = objc_msgSend(v28, "enui_hashText");
            v30 = v7;
            v31 = [v7[136] preferenceSpecifierNamed:v29 target:v22 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
            v32 = (objc_class *)objc_opt_class();
            v33 = NSStringFromClass(v32);
            [v31 setProperty:v28 forKey:v33];

            id v6 = v27;
            [v27 addObject:v31];

            v7 = v30;
          }
          id v24 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v24);
      }

      v2 = v22;
      v9 = v38;
      uint64_t v3 = v39;
      v15 = v36;
      v13 = v37;
    }
    v34 = *(void **)&v2->PSListController_opaque[v3];
    *(void *)&v2->PSListController_opaque[v3] = v6;

    v4 = *(void **)&v2->PSListController_opaque[v3];
  }

  return v4;
}

- (id)matchedKeyText
{
  if (qword_341B8 != -1) {
    dispatch_once(&qword_341B8, &stru_2D1F8);
  }
  check = self->_check;
  id v4 = (id)qword_341B0;
  v5 = [(ENExposureDetectionHistoryCheck *)check session];
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 matchCount]);
  v7 = [v4 stringFromNumber:v6];

  return v7;
}

- (id)timestampText
{
  if (qword_341C8 != -1) {
    dispatch_once(&qword_341C8, &stru_2D218);
  }
  check = self->_check;
  id v4 = (id)qword_341C0;
  v5 = [(ENExposureDetectionHistoryCheck *)check session];
  id v6 = [v5 date];
  v7 = [v4 stringFromDate:v6];

  return v7;
}

- (id)dataSource
{
  uint64_t v3 = [(ENExposureDetectionHistoryCheck *)self->_check session];
  id v4 = [v3 appBundleIdentifier];

  if (v4)
  {
    v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
    id v6 = [v5 appState];
    if ([v6 isValid])
    {
      id v7 = [v5 localizedName];
    }
    else
    {
      id v7 = v4;
    }
  }
  else
  {
    v5 = [(ENExposureDetectionHistoryCheck *)self->_check session];
    id v6 = [v5 region];
    id v7 = [v6 regionCode];
  }
  objc_super v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
}

@end