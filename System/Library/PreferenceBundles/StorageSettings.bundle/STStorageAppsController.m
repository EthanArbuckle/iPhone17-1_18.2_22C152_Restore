@interface STStorageAppsController
- (NSArray)apps;
- (id)specifiers;
- (void)setApps:(id)a3;
@end

@implementation STStorageAppsController

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v37 = OBJC_IVAR___PSListController__specifiers;
    int v4 = STStorageDeviceIsiPad();
    v5 = +[STStorageAppsMonitor sharedMonitor];
    v6 = [v5 apps];
    apps = self->_apps;
    self->_apps = v6;

    v48 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_apps count]];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v38 = self;
    v8 = self->_apps;
    id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (!v9) {
      goto LABEL_50;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v54;
    uint64_t v52 = STStorageCloudIconHiddenKey;
    uint64_t v51 = comAppleCompass;
    uint64_t v42 = iCloudDriveFakeAppID;
    uint64_t v41 = iCloudDriveFPFSFakeAppID;
    uint64_t v47 = STStorageInfoKey;
    uint64_t v46 = PSValueKey;
    uint64_t v45 = PSIDKey;
    uint64_t v44 = STStorageAppKey;
    int v43 = v4;
    uint64_t v49 = *(void *)v54;
    v50 = v8;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v12);
        if ([v13 userVisible])
        {
          v14 = +[STStorageAppCell specifierForStorageApp:v13];
          if (v14)
          {
            v15 = [v13 bundleIdentifier];
            if ([v13 isDemoted]
              && [v15 isEqualToString:@"com.apple.Health"])
            {
              v16 = STStorageLocStr(@"HEALTH_DATA");
              [v13 setName:v16];

              v17 = +[NSNumber numberWithBool:1];
              [v14 setProperty:v17 forKey:v52];
            }
            if ([v13 isDemoted]
              && [v15 isEqualToString:@"com.apple.Maps"])
            {
              v18 = STStorageLocStr(@"MAPS_DATA");
              [v13 setName:v18];

              v19 = +[NSNumber numberWithBool:1];
              [v14 setProperty:v19 forKey:v52];
            }
            if (!v4 || ([v15 isEqualToString:v51] & 1) == 0)
            {
              v20 = [v13 appSizeIfComputed];
              id v21 = [v20 userTotal];
              uint64_t v22 = (uint64_t)v21;
              if (!v20 || (uint64_t)v21 > 4096)
              {
                unsigned int v23 = [v13 appKind];
                if (v23 == 2)
                {
                  if (v22 >= 10000000) {
                    goto LABEL_29;
                  }
                }
                else
                {
                  if (v23 == 5)
                  {
                    [v14 setDetailControllerClass:objc_opt_class()];
                    v24 = STStorageDeviceKey();
                    v25 = +[NSString stringWithFormat:@"LOCAL_FILES_TITLE_%@", v24];
                    v26 = STStorageLocStr(v25);
                    [v13 setName:v26];

                    int v4 = v43;
                  }
                  else
                  {
                    if (v23 == 3)
                    {
                      if (([v15 isEqualToString:v42] & 1) == 0) {
LABEL_28:
                      }
                        [v15 isEqualToString:v41];
                    }
                    else if (([v15 isEqualToString:v42] & 1) == 0)
                    {
                      goto LABEL_28;
                    }
LABEL_29:
                    [v14 setDetailControllerClass:objc_opt_class()];
                  }
                  if ([v13 isPseudoApp])
                  {
                    [v14 setProperty:0 forKey:v47];
                    if (v22) {
                      goto LABEL_32;
                    }
LABEL_42:
                    v27 = 0;
                    goto LABEL_43;
                  }
                  v28 = [v13 appRecord];
                  v27 = [v28 applicationState];

                  if (!v27 || [v27 isValid])
                  {
                    v29 = [v13 lastUsedDate];
                    v30 = v29;
                    if (!v29 || ([v29 timeIntervalSinceReferenceDate], v31 == 0.0))
                    {
                      [v14 setProperty:0 forKey:v47];
                    }
                    else
                    {
                      if (qword_3A4E0 != -1) {
                        dispatch_once(&qword_3A4E0, &stru_2C9D8);
                      }
                      id v39 = (id)qword_3A4D8;
                      v40 = STFormattedShortDate();
                      v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v39, v40);

                      [v14 setProperty:v32 forKey:v47];
                    }

                    int v4 = v43;
                    if (!v22) {
                      goto LABEL_42;
                    }
LABEL_32:
                    v27 = +[NSNumber numberWithLongLong:v22];
LABEL_43:
                    [v14 setProperty:v27 forKey:v46];
                    v33 = [v13 appIdentifier];
                    [v14 setProperty:v33 forKey:v45];

                    [v14 setProperty:v13 forKey:v44];
                    [v14 setProperty:v13 forKey:@"USAGE_APP"];
                    [v48 addObject:v14];
                  }

                  uint64_t v11 = v49;
                  v8 = v50;
                }
              }
            }
          }
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (!v10)
      {
LABEL_50:

        uint64_t v34 = [v48 sortedArrayUsingComparator:&stru_2C9B8];
        v35 = *(void **)&v38->PSListController_opaque[v37];
        *(void *)&v38->PSListController_opaque[v37] = v34;

        v3 = *(void **)&v38->PSListController_opaque[v37];
        break;
      }
    }
  }

  return v3;
}

- (NSArray)apps
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end