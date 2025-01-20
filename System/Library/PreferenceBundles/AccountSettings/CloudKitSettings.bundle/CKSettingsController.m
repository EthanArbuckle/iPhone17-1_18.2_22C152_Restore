@interface CKSettingsController
+ (id)cloudKitNumAppGroups;
- (BOOL)_isApplicationHiddenFromSettings:(id)a3;
- (BOOL)isLookingUpAppNames;
- (BOOL)needsToDisplayAppPermission;
- (NSMutableArray)displayableAppPermissionGroups;
- (NSMutableDictionary)enabledByAppID;
- (PSTableCell)serviceSectionCell;
- (id)appPermissionEnabledForSpecifier:(id)a3;
- (id)specifiers;
- (void)fetchAppPermissionGroupsWithCompletionHandler:(id)a3;
- (void)networkReachabilityDidChange:(id)a3;
- (void)setAppPermissionEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setDisplayableAppPermissionGroups:(id)a3;
- (void)setEnabledByAppID:(id)a3;
- (void)setIsLookingUpAppNames:(BOOL)a3;
- (void)setNeedsToDisplayAppPermission:(BOOL)a3;
- (void)setServiceSectionCell:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKSettingsController

+ (id)cloudKitNumAppGroups
{
  return &off_16240;
}

- (void)networkReachabilityDidChange:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKSettingsController;
  [(CKSettingsController *)&v5 viewWillAppear:a3];
  v4 = +[CPNetworkObserver sharedNetworkObserver];
  [v4 addNetworkReachableObserver:self selector:"networkReachabilityDidChange:"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[CPNetworkObserver sharedNetworkObserver];
  [v5 removeNetworkReachableObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)CKSettingsController;
  [(CKSettingsController *)&v6 viewDidDisappear:v3];
}

- (BOOL)_isApplicationHiddenFromSettings:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.cloudkit"] & 1) == 0)
  {
    id v13 = 0;
    id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v13];
    id v6 = v13;
    if (v6)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v7 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v3;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Bundle ID %@ doesn't belong to an application: %@", buf, 0x16u);
      }
    }
    else
    {
      v8 = [v5 applicationState];
      unsigned int v9 = [v8 isInstalled];

      if (v9)
      {
        v10 = [v5 entitlements];
        v11 = [v10 objectForKey:@"com.apple.private.appleaccount.app-hidden-from-icloud-settings" ofClass:objc_opt_class()];

        unsigned __int8 v4 = [v11 BOOLValue];
LABEL_11:

        goto LABEL_12;
      }
    }
    unsigned __int8 v4 = 0;
    goto LABEL_11;
  }
  unsigned __int8 v4 = 1;
LABEL_12:

  return v4;
}

- (void)setAppPermissionEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  v37 = [a4 propertyForKey:@"CKSettingsDisplayableAppPermissionGroup"];
  id v6 = [v37 applicationPermissionGroup];
  v7 = dispatch_group_create();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v38 = v6;
  id obj = [v6 containerIDs];
  id v8 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v52;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v11);
        id v13 = objc_alloc_init((Class)CKContainerOptions);
        [v13 setApplicationBundleIdentifierOverride:@"com.apple.cloudkit"];
        id v14 = [objc_alloc((Class)CKContainer) initWithContainerID:v12 options:v13];
        if (v14)
        {
          dispatch_group_enter(v7);
          id v15 = v14;
          id v16 = [v5 BOOLValue];
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_9210;
          v45[3] = &unk_14670;
          id v46 = v37;
          id v47 = v5;
          id v48 = v38;
          v49 = v7;
          id v50 = v15;
          id v17 = v15;
          [v17 setApplicationPermission:1 enabled:v16 completionHandler:v45];
        }
        else
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          v18 = ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v57 = v12;
            _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "Couldn't get a container with ID %{public}@", buf, 0xCu);
          }
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v9);
  }

  dispatch_time_t v19 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(v7, v19))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v20 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "Couldn't set app permissions within 30 seconds, bailing", buf, 2u);
    }
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obja = [v38 applicationBundleIDs];
    id v21 = [obja countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v21)
    {
      id v23 = v21;
      uint64_t v24 = *(void *)v42;
      v34 = v40;
      *(void *)&long long v22 = 138412290;
      long long v33 = v22;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(obja);
          }
          v26 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v27 = +[NSBundle mainBundle];
          v28 = [v27 bundleIdentifier];
          unsigned int v29 = [v26 isEqual:v28];

          if (v29)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v30 = ck_log_facility_ck;
            if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v33;
              v57 = v26;
              _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Skipping termination of process after CloudKit permissions change (%@)", buf, 0xCu);
            }
          }
          else
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v31 = ck_log_facility_ck;
            if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v33;
              v57 = v26;
              _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Terminating process to reset state after CloudKit permissions change (%@)", buf, 0xCu);
            }
            v32 = +[FBSSystemService sharedService];
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v40[0] = sub_9390;
            v40[1] = &unk_14698;
            v40[2] = v26;
            [v32 terminateApplication:v26 forReason:3 andReport:0 withDescription:@"Terminating process to reset state after CloudKit permissions change." completion:v39];
          }
        }
        id v23 = [obja countByEnumeratingWithState:&v41 objects:v55 count:16];
      }
      while (v23);
    }
  }
}

- (id)appPermissionEnabledForSpecifier:(id)a3
{
  id v3 = [a3 propertyForKey:@"CKSettingsDisplayableAppPermissionGroup"];
  unsigned __int8 v4 = [v3 applicationPermissionGroup];
  if ((unint64_t)[v4 enabledPermissions]) {
    id v5 = &__kCFBooleanTrue;
  }
  else {
    id v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (void)fetchAppPermissionGroupsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:@"com.apple.cloudkit.ckctl.container" environment:1];
  id v5 = [objc_alloc((Class)CKContainer) initWithContainerID:v4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_95E4;
  v7[3] = &unk_146C0;
  id v8 = v3;
  id v6 = v3;
  [v5 statusGroupsForApplicationPermission:1 completionHandler:v7];
}

- (id)specifiers
{
  v2 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v41 = OBJC_IVAR___PSListController__specifiers;
    id v4 = +[CPNetworkObserver sharedNetworkObserver];
    unsigned __int8 v40 = [v4 isNetworkReachable];

    id v5 = self;
    objc_sync_enter(v5);
    if (v5->_isLookingUpAppNames || v5->_displayableAppPermissionGroups)
    {
      objc_sync_exit(v5);
    }
    else
    {
      v5->_isLookingUpAppNames = 1;
      objc_sync_exit(v5);

      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_9BE8;
      v48[3] = &unk_147D0;
      v48[4] = v5;
      dispatch_semaphore_t v49 = dispatch_semaphore_create(0);
      long long v33 = v49;
      [(CKSettingsController *)v5 fetchAppPermissionGroupsWithCompletionHandler:v48];
      dispatch_time_t v34 = dispatch_time(0, 150000000);
      dispatch_semaphore_wait(v33, v34);
    }
    id v6 = v5;
    objc_sync_enter(v6);
    id v36 = [(NSMutableArray *)v6->_displayableAppPermissionGroups copy];
    v6->_needsToDisplayAppPermission = 0;
    objc_sync_exit(v6);

    uint64_t v7 = objc_opt_new();
    id v8 = *(void **)&self->PSListController_opaque[v41];
    *(void *)&self->PSListController_opaque[v41] = v7;

    v37 = +[PSSpecifier emptyGroupSpecifier];
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = CKLocalizedStringFromTableInBundle();
    [v37 setProperty:v10 forKey:PSFooterTextGroupKey];

    [*(id *)&self->PSListController_opaque[v41] addObject:v37];
    if (v36)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id obj = v36;
      id v11 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v45;
        uint64_t v38 = PSEnabledKey;
        uint64_t v39 = PSIconImageKey;
        do
        {
          id v13 = 0;
          do
          {
            if (*(void *)v45 != v12) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v13);
            id v15 = [v14 primaryAppNameImage];
            id v16 = [v15 appDisplayName];

            if (v16)
            {
              id v17 = [v14 appNameImages];
              v18 = (char *)[v17 count];

              if (v18)
              {
                dispatch_time_t v19 = +[NSBundle bundleForClass:objc_opt_class()];
                v35 = v18 - 1;
                v20 = CKLocalizedStringFromTableInBundle();

                BOOL v21 = v18 == (unsigned char *)&dword_0 + 1;
                if (v18 == (unsigned char *)&dword_0 + 1) {
                  long long v22 = "setAppPermissionEnabled:forSpecifier:";
                }
                else {
                  long long v22 = 0;
                }
                if (v21)
                {
                  uint64_t v24 = 0;
                  uint64_t v25 = 6;
                }
                else
                {
                  uint64_t v24 = objc_opt_class();
                  uint64_t v25 = 1;
                }
                v26 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, v6, v22, "appPermissionEnabledForSpecifier:", v24, v25, 0, v35);
                v27 = v26;
                if ((v40 & 1) == 0) {
                  [v26 setProperty:&__kCFBooleanFalse forKey:v38];
                }
                v28 = [v14 primaryAppNameImage];
                unsigned int v29 = [v28 appImage];

                if (v29)
                {
                  v30 = [v14 primaryAppNameImage];
                  v31 = [v30 appImage];
                  [v27 setProperty:v31 forKey:v39];
                }
                [v27 setProperty:v14 forKey:@"CKSettingsDisplayableAppPermissionGroup"];
                [*(id *)&self->PSListController_opaque[v41] addObject:v27];
              }
              else
              {
                if (ck_log_initialization_predicate != -1) {
                  dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
                }
                id v23 = ck_log_facility_ck;
                if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v51 = v14;
                  _os_log_error_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Ignoring app permission group %@", buf, 0xCu);
                }
              }
            }

            id v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v11);
      }
    }
    else
    {
      id obj = +[PSSpecifier preferenceSpecifierNamed:0 target:v6 set:0 get:0 detail:0 cell:15 edit:0];
      [*(id *)&self->PSListController_opaque[v41] addObject:obj];
    }

    id v3 = *(id *)&self->PSListController_opaque[v41];
  }

  return v3;
}

- (NSMutableDictionary)enabledByAppID
{
  return self->_enabledByAppID;
}

- (void)setEnabledByAppID:(id)a3
{
}

- (PSTableCell)serviceSectionCell
{
  return self->_serviceSectionCell;
}

- (void)setServiceSectionCell:(id)a3
{
}

- (NSMutableArray)displayableAppPermissionGroups
{
  return self->_displayableAppPermissionGroups;
}

- (void)setDisplayableAppPermissionGroups:(id)a3
{
}

- (BOOL)isLookingUpAppNames
{
  return self->_isLookingUpAppNames;
}

- (void)setIsLookingUpAppNames:(BOOL)a3
{
  self->_isLookingUpAppNames = a3;
}

- (BOOL)needsToDisplayAppPermission
{
  return self->_needsToDisplayAppPermission;
}

- (void)setNeedsToDisplayAppPermission:(BOOL)a3
{
  self->_needsToDisplayAppPermission = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayableAppPermissionGroups, 0);
  objc_storeStrong((id *)&self->_serviceSectionCell, 0);

  objc_storeStrong((id *)&self->_enabledByAppID, 0);
}

@end