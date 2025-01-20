@interface STStorageHLSController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (id)hlsSpecifiers;
- (id)specifierAtIndexPath:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)deleteAssets:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)updateHLSSpecs;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STStorageHLSController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)STStorageHLSController;
  [(STStorageHLSController *)&v4 viewDidLoad];
  v3 = [(STStorageHLSController *)self table];
  [v3 setAllowsMultipleSelectionDuringEditing:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STStorageHLSController;
  [(STStorageHLSController *)&v6 viewWillAppear:a3];
  objc_super v4 = STStorageLocStr(@"REVIEW_VIDEOS_TITLE");
  v5 = [(STStorageHLSController *)self navigationItem];
  [v5 setTitle:v4];
}

- (id)hlsSpecifiers
{
  v2 = +[NSMutableDictionary dictionary];
  v3 = +[NSMutableArray array];
  v64 = _NSConcreteStackBlock;
  uint64_t v65 = 3221225472;
  v66 = sub_FE04;
  v67 = &unk_2CE90;
  id v68 = v2;
  id v4 = v3;
  id v69 = v4;
  CacheManagementEnumerateAssets();
  id v45 = v68;
  v5 = [v68 allKeys];
  objc_super v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v61;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v61 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if ([v12 length])
        {
          id v13 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v12 allowPlaceholder:1 error:0];
          if (v13) {
            [v6 addObject:v13];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v60 objects:v73 count:16];
    }
    while (v9);
  }
  id v42 = v7;

  [v6 sortUsingComparator:&stru_2CED0];
  v14 = +[NSMutableArray array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v6;
  id v46 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
  if (v46)
  {
    uint64_t v44 = *(void *)v57;
    do
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(void *)v57 != v44) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
        v17 = objc_msgSend(v16, "localizedName", v42);
        if (![v17 length])
        {
          uint64_t v18 = [v16 bundleIdentifier];
          v19 = (void *)v18;
          v20 = @"???";
          if (v18) {
            v20 = (__CFString *)v18;
          }
          v21 = v20;

          v17 = v21;
        }
        v47 = v17;
        v22 = +[PSSpecifier groupSpecifierWithName:v17];
        [v14 addObject:v22];

        v23 = [v16 bundleIdentifier];
        v24 = [v45 objectForKey:v23];

        [v24 sortUsingComparator:&stru_2CF10];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v25 = v24;
        id v26 = [v25 countByEnumeratingWithState:&v52 objects:v71 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v53;
          do
          {
            for (k = 0; k != v27; k = (char *)k + 1)
            {
              if (*(void *)v53 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v52 + 1) + 8 * (void)k);
              v31 = +[STStorageCacheAssetCell specifierForAsset:v30];
              [v14 addObject:v31];

              [v4 removeObject:v30];
            }
            id v27 = [v25 countByEnumeratingWithState:&v52 objects:v71 count:16];
          }
          while (v27);
        }
      }
      id v46 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
    }
    while (v46);
  }

  v32 = v42;
  if ([v4 count])
  {
    [v4 sortUsingComparator:&stru_2CF30];
    v33 = STStorageLocStr(@"OTHER");
    v34 = +[PSSpecifier groupSpecifierWithName:v33];
    [v14 addObject:v34];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v35 = v4;
    id v36 = [v35 countByEnumeratingWithState:&v48 objects:v70 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v49;
      do
      {
        for (m = 0; m != v37; m = (char *)m + 1)
        {
          if (*(void *)v49 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = +[STStorageCacheAssetCell specifierForAsset:](STStorageCacheAssetCell, "specifierForAsset:", *(void *)(*((void *)&v48 + 1) + 8 * (void)m), v42);
          [v14 addObject:v40];
        }
        id v37 = [v35 countByEnumeratingWithState:&v48 objects:v70 count:16];
      }
      while (v37);
    }
  }

  return v14;
}

- (void)updateHLSSpecs
{
  BOOL v3 = *(NSArray **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers] != self->_hlsSpecs;
  id v4 = dispatch_get_global_queue(25, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_102E8;
  v5[3] = &unk_2CF58;
  v5[4] = self;
  BOOL v6 = v3;
  dispatch_async(v4, v5);
}

- (id)specifiers
{
  BOOL v3 = (void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!*v3)
  {
    objc_storeStrong((id *)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers], self->_hlsSpecs);
    if (!*v3)
    {
      id v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D2C0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
      id v9 = v4;
      uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
      BOOL v6 = *v3;
      void *v3 = (void *)v5;
    }
  }
  [(STStorageHLSController *)self updateHLSSpecs];
  id v7 = *v3;

  return v7;
}

- (void)deleteAssets:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "propertyForKey:", @"stCacheAsset", v11, v12, v13, v14, v15, v16);
        if (v10)
        {
          v11 = _NSConcreteStackBlock;
          uint64_t v12 = 3221225472;
          id v13 = sub_10670;
          v14 = &unk_2CD18;
          v15 = self;
          v16 = v9;
          CacheManagementRemove();
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (id)specifierAtIndexPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STStorageHLSController;
  BOOL v3 = [(STStorageHLSController *)&v6 specifierAtIndexPath:a3];
  id v4 = [v3 propertyForKey:@"stCacheAsset"];

  if (v4) {
    id v4 = v3;
  }

  return v4;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(STStorageHLSController *)self specifierAtIndexPath:a4];

  return v4 != 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    uint64_t v6 = [(STStorageHLSController *)self specifierAtIndexPath:a5];
    uint64_t v7 = (void *)v6;
    if (v6)
    {
      uint64_t v9 = v6;
      id v8 = +[NSArray arrayWithObjects:&v9 count:1];
      [(STStorageHLSController *)self deleteAssets:v8];
    }
  }
}

- (void).cxx_destruct
{
}

@end