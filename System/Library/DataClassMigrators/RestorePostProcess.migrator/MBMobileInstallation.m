@interface MBMobileInstallation
+ (id)_defaultSubdirectoriesForMCMContainerType:(unint64_t)a3 withError:(id *)a4;
+ (id)defaultSubdirectoriesForMBContainerType:(int)a3 withNestedSubdirectories:(BOOL)a4;
+ (id)displayNameForBundleIdentifier:(id)a3;
+ (id)displayNameForDomain:(id)a3 isSystemDomain:(BOOL)a4;
+ (id)displayNamesForDomainNames:(id)a3 domainManager:(id)a4;
+ (unint64_t)_containerClassForMBContainerType:(int)a3;
- (BOOL)registerSafeHarborWithIdentifier:(id)a3 path:(id)a4 type:(int)a5 error:(id *)a6;
- (BOOL)removeSafeHarborWithIdentifier:(id)a3 type:(int)a4 error:(id *)a5;
- (BOOL)uninstallAppWithBundleID:(id)a3 error:(id *)a4;
- (MBIgnoredAccountsTracker)accountsTracker;
- (MBMobileInstallation)init;
- (MBMobileInstallation)initWithSafeHarborDir:(id)a3;
- (NSString)safeHarborDir;
- (id)_systemContainersWithError:(id *)a3 shared:(BOOL)a4;
- (id)safeHarborsWithError:(id *)a3;
- (id)systemContainersWithError:(id *)a3;
- (id)systemPluginsForPersona:(id)a3 error:(id *)a4;
- (id)systemSharedContainersWithError:(id *)a3;
- (id)userAppWithBundleID:(id)a3 placeholder:(BOOL)a4 persona:(id)a5 error:(id *)a6;
- (id)userAppsForPersona:(id)a3 dataSeparatedBundleIDs:(id)a4 error:(id *)a5;
- (void)_enumerateAppsWithEnumerationOptions:(unint64_t)a3 to:(id)a4 persona:(id)a5 dataSeparatedBundleIDs:(id)a6;
- (void)setSafeHarborDir:(id)a3;
@end

@implementation MBMobileInstallation

- (MBMobileInstallation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MBMobileInstallation;
  v2 = [(MBMobileInstallation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    accountsTracker = v2->_accountsTracker;
    v2->_accountsTracker = (MBIgnoredAccountsTracker *)v3;
  }
  return v2;
}

- (MBMobileInstallation)initWithSafeHarborDir:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(MBMobileInstallation *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_safeHarborDir, a3);
  }

  return v7;
}

- (void)_enumerateAppsWithEnumerationOptions:(unint64_t)a3 to:(id)a4 persona:(id)a5 dataSeparatedBundleIDs:(id)a6
{
  id v57 = a4;
  v9 = a5;
  id v51 = a6;
  uint64_t v10 = [v9 user];
  unsigned int v11 = [(id)v10 isPrimaryUser];

  LODWORD(v10) = [v9 isPersonalPersona];
  v53 = v9;
  unsigned int v12 = [v9 isDataSeparatedPersona];
  unsigned int v13 = v12;
  int v54 = v10;
  if ((v10 & 1) == 0 && (v12 & 1) == 0) {
    sub_19B90();
  }
  v58 = [v53 personaIdentifier];
  if (!v58) {
    sub_19B64();
  }
  unsigned int v55 = v13;
  v14 = +[UMUserPersonaAttributes personaAttributesForPersonaType:3];
  uint64_t v15 = [v14 userPersonaUniqueString];

  v52 = (void *)v15;
  if (v15) {
    unsigned int v16 = 0;
  }
  else {
    unsigned int v16 = v11;
  }
  if (v16 == 1)
  {
    v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_FAULT, "Could not fetch system persona for primary user", buf, 2u);
      _MBLog();
    }
  }
  v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v65 = a3;
    __int16 v66 = 2112;
    v67 = v53;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Starting app enumeration (options = %llu) for %@", buf, 0x16u);
    unint64_t v47 = a3;
    v48 = v53;
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v20 = v19;
  unint64_t v50 = a3;
  +[LSApplicationRecord enumeratorWithOptions:a3];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = [v21 countByEnumeratingWithState:&v60 objects:v72 count:16];
  id v59 = v21;
  if (v22)
  {
    id v23 = v22;
    int v56 = v54 & v11;
    uint64_t v24 = *(void *)v61;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v61 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v25);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v28 = MBGetDefaultLog();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_29;
          }
          v32 = [v26 bundleIdentifier];
          *(_DWORD *)buf = 138412290;
          unint64_t v65 = (unint64_t)v32;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Skipping isKindOfClass for %@", buf, 0xCu);

          v31 = [v26 bundleIdentifier];
          unint64_t v47 = (unint64_t)v31;
          goto LABEL_27;
        }
        v28 = [v26 bundleIdentifier];
        if (objc_msgSend(v26, "mb_isContainerized"))
        {
          v29 = objc_msgSend(v26, "mb_applicationType");
          unsigned int v30 = [v29 isEqualToString:@"Hidden"];

          if (!v30)
          {
            if ([v26 isPlaceholder])
            {
              v33 = [v57 objectForKeyedSubscript:v28];
              v31 = v33;
              if (v33)
              {
                v34 = [v33 objectForKeyedSubscript:@"IsPlaceholder"];
                unsigned __int8 v35 = [v34 BOOLValue];

                if ((v35 & 1) == 0)
                {
                  v41 = MBGetDefaultLog();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    unint64_t v65 = (unint64_t)v28;
                    _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "Skipping placeholder for %@", buf, 0xCu);
                    unint64_t v47 = (unint64_t)v28;
                    _MBLog();
                  }

                  id v21 = v59;
                  goto LABEL_28;
                }
              }

              id v21 = v59;
            }
            v31 = objc_msgSend(v26, "managedPersonas", v47, v48, v49);
            if (![v31 count])
            {
              if ((v54 & 1) == 0) {
                goto LABEL_40;
              }
              goto LABEL_51;
            }
            v36 = MBGetDefaultLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              unint64_t v65 = (unint64_t)v28;
              __int16 v66 = 2114;
              v67 = v31;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Found app %@ with managed personae: %{public}@", buf, 0x16u);
              unint64_t v47 = (unint64_t)v28;
              v48 = v31;
              _MBLog();
            }

LABEL_40:
            unsigned __int8 v37 = -[NSObject containsObject:](v31, "containsObject:", v58, v47);
            if (v56)
            {
              if ((v37 & 1) == 0 && ([v31 containsObject:v52] & 1) == 0)
              {
                v38 = MBGetDefaultLog();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543874;
                  unint64_t v65 = (unint64_t)v28;
                  __int16 v66 = 2112;
                  v67 = v58;
                  __int16 v68 = 2112;
                  double v69 = *(double *)&v52;
                  _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ since it's not managed by the personal:%@ persona nor system:%@ persona", buf, 0x20u);
                  v48 = v58;
                  v49 = v52;
                  id v21 = v59;
                  unint64_t v47 = (unint64_t)v28;
                  goto LABEL_63;
                }
                goto LABEL_64;
              }
LABEL_51:
              uint64_t v39 = MBExcludedAppTypeFromAppRecord(v26);
              if (v39 == 2)
              {
                v38 = MBGetDefaultLog();
                if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_64;
                }
                *(_DWORD *)buf = 138412290;
                unint64_t v65 = (unint64_t)v28;
                _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "Skipping %@ (Swift Playgrounds app)", buf, 0xCu);
                unint64_t v47 = (unint64_t)v28;
              }
              else
              {
                if (v39 != 1)
                {
                  v38 = [v53 userDataVolume];
                  v40 = sub_D774(v26, v38);
                  [v57 setObject:v40 forKeyedSubscript:v28];

                  id v21 = v59;
                  goto LABEL_64;
                }
                v38 = MBGetDefaultLog();
                if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
LABEL_64:

                  goto LABEL_28;
                }
                *(_DWORD *)buf = 138412290;
                unint64_t v65 = (unint64_t)v28;
                _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "Skipping %@ (app clip)", buf, 0xCu);
                unint64_t v47 = (unint64_t)v28;
              }
            }
            else if (v55)
            {
              if (v37 & 1) != 0 || ([v51 containsObject:v28]) {
                goto LABEL_51;
              }
              v38 = MBGetDefaultLog();
              if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              *(_DWORD *)buf = 138543618;
              unint64_t v65 = (unint64_t)v28;
              __int16 v66 = 2114;
              v67 = v58;
              _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ for data-separated persona %{public}@ since it's not in the list of managed personae", buf, 0x16u);
              unint64_t v47 = (unint64_t)v28;
              v48 = v58;
              id v21 = v59;
            }
            else
            {
              if (v37) {
                goto LABEL_51;
              }
              v38 = MBGetDefaultLog();
              if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_64;
              }
              *(_DWORD *)buf = 138543618;
              unint64_t v65 = (unint64_t)v28;
              __int16 v66 = 2114;
              v67 = v58;
              _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ for persona %{public}@ since it's not in the list of managed personae", buf, 0x16u);
              unint64_t v47 = (unint64_t)v28;
              v48 = v58;
              id v21 = v59;
            }
LABEL_63:
            _MBLog();
            goto LABEL_64;
          }
          v31 = MBGetDefaultLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v65 = (unint64_t)v28;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Skipping %@ as of Hidden type", buf, 0xCu);
            unint64_t v47 = (unint64_t)v28;
LABEL_27:
            _MBLog();
          }
        }
        else
        {
          v31 = MBGetDefaultLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v65 = (unint64_t)v28;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEBUG, "Skipping isContainerized for %@", buf, 0xCu);
            unint64_t v47 = (unint64_t)v28;
            goto LABEL_27;
          }
        }
LABEL_28:

LABEL_29:
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v42 = [v21 countByEnumeratingWithState:&v60 objects:v72 count:16];
      id v23 = v42;
    }
    while (v42);
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v44 = v43;
  v45 = MBGetDefaultLog();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    id v46 = [v57 count];
    *(_DWORD *)buf = 134218754;
    unint64_t v65 = v50;
    __int16 v66 = 2112;
    v67 = v53;
    __int16 v68 = 2048;
    double v69 = v44 - v20;
    __int16 v70 = 2048;
    id v71 = v46;
    _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "Finished app enumeration (options = %llu) for %@ in %0.3fs: %lu apps", buf, 0x2Au);
    id v21 = v59;
    [v57 count];
    _MBLog();
  }
}

- (id)userAppsForPersona:(id)a3 dataSeparatedBundleIDs:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[NSMutableDictionary dictionary];
  [(MBMobileInstallation *)self _enumerateAppsWithEnumerationOptions:0 to:v9 persona:v7 dataSeparatedBundleIDs:v8];
  [(MBMobileInstallation *)self _enumerateAppsWithEnumerationOptions:64 to:v9 persona:v7 dataSeparatedBundleIDs:v8];

  return v9;
}

- (id)userAppWithBundleID:(id)a3 placeholder:(BOOL)a4 persona:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v15 = 0;
  id v11 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v8 allowPlaceholder:v7 error:&v15];
  unsigned int v12 = [v9 userDataVolume];
  unsigned int v13 = sub_D774(v11, v12);

  return v13;
}

- (id)systemPluginsForPersona:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  +[LSApplicationExtensionRecord enumeratorWithOptions:0];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v73;
    __int16 v68 = v5;
    id v63 = v6;
    id v64 = v4;
    uint64_t v62 = *(void *)v73;
    do
    {
      uint64_t v10 = 0;
      id v65 = v8;
      do
      {
        if (*(void *)v73 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v10);
        if (objc_msgSend(v11, "mb_isContainerized"))
        {
          unsigned int v13 = [v11 containingBundleRecord];

          if (!v13)
          {
            double v69 = v12;
            v14 = [v4 userDataVolume];
            id v15 = v11;
            id v70 = v14;
            unsigned int v16 = [v15 dataContainerURL];

            if (v16)
            {
              v17 = objc_msgSend(v15, "mb_bundleURL");

              if (v17)
              {
                v18 = objc_msgSend(v15, "mb_pluginIdentifier");

                if (v18)
                {
                  double v19 = objc_msgSend(v15, "mb_entitlements");
                  if (!v19)
                  {
                    double v20 = MBGetDefaultLog();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                    {
                      id v21 = objc_msgSend(v15, "mb_pluginIdentifier");
                      *(_DWORD *)buf = 138412290;
                      id v88 = v21;
                      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEBUG, "Plugin %@ found without entitlements.", buf, 0xCu);

                      id v57 = objc_msgSend(v15, "mb_pluginIdentifier");
                      _MBLog();
                    }
                    double v19 = &__NSDictionary0__struct;
                  }
                  __int16 v66 = v19;
                  v67 = v10;
                  uint64_t v22 = +[NSMutableArray array];
                  long long v76 = 0u;
                  long long v77 = 0u;
                  long long v78 = 0u;
                  long long v79 = 0u;
                  id obj = [v15 groupContainerURLs];
                  id v23 = [obj countByEnumeratingWithState:&v76 objects:buf count:16];
                  if (v23)
                  {
                    id v24 = v23;
                    uint64_t v25 = *(void *)v77;
                    do
                    {
                      v26 = 0;
                      do
                      {
                        v27 = (void *)v22;
                        if (*(void *)v77 != v25) {
                          objc_enumerationMutation(obj);
                        }
                        v28 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v26);
                        v29 = objc_msgSend(v15, "groupContainerURLs", v57);
                        unsigned int v30 = [v29 objectForKeyedSubscript:v28];

                        if (v30)
                        {
                          v31 = sub_108DC(v30);
                          if (MBPathHasVolumePrefix())
                          {
                            v86[0] = v28;
                            v85[0] = kCFBundleIdentifierKey;
                            v85[1] = @"ContainerContentClass";
                            v32 = MBStringForContainerType(3);
                            v85[2] = @"Container";
                            v86[1] = v32;
                            v86[2] = v31;
                            v33 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:3];

                            uint64_t v22 = (uint64_t)v27;
                            [v27 addObject:v33];
LABEL_28:

                            goto LABEL_29;
                          }
                          v33 = MBGetDefaultLog();
                          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                          {
                            unsigned __int8 v35 = objc_msgSend(v15, "mb_pluginIdentifier");
                            *(_DWORD *)v82 = 138413058;
                            *(void *)&v82[4] = v35;
                            *(_WORD *)&v82[12] = 2112;
                            *(void *)&v82[14] = v28;
                            *(_WORD *)&v82[22] = 2112;
                            v83 = v31;
                            LOWORD(v84) = 2112;
                            *(void *)((char *)&v84 + 2) = v70;
                            _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", v82, 0x2Au);

                            objc_msgSend(v15, "mb_pluginIdentifier");
                            id v59 = v31;
                            id v57 = v60 = v70;
                            v58 = v28;
                            _MBLog();
                          }
LABEL_27:
                          uint64_t v22 = (uint64_t)v27;
                          goto LABEL_28;
                        }
                        v31 = MBGetDefaultLog();
                        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                        {
                          v34 = objc_msgSend(v15, "mb_pluginIdentifier");
                          *(_DWORD *)v82 = 138412546;
                          *(void *)&v82[4] = v34;
                          *(_WORD *)&v82[12] = 2112;
                          *(void *)&v82[14] = v28;
                          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ found without a container - will not be backed up", v82, 0x16u);

                          v33 = objc_msgSend(v15, "mb_pluginIdentifier");
                          id v57 = v33;
                          v58 = v28;
                          _MBLog();
                          goto LABEL_27;
                        }
                        uint64_t v22 = (uint64_t)v27;
LABEL_29:

                        v26 = (char *)v26 + 1;
                      }
                      while (v24 != v26);
                      id v36 = [obj countByEnumeratingWithState:&v76 objects:buf count:16];
                      id v24 = v36;
                    }
                    while (v36);
                  }

                  v81[0] = kCFBundleIdentifierKey;
                  unsigned __int8 v37 = objc_msgSend(v15, "mb_pluginIdentifier");
                  *(void *)v82 = v37;
                  v81[1] = @"ContainerContentClass";
                  v38 = MBStringForContainerType(2);
                  *(void *)&v82[8] = v38;
                  v81[2] = @"Path";
                  uint64_t v39 = objc_msgSend(v15, "mb_bundleURL");
                  v40 = sub_108DC(v39);
                  *(void *)&v82[16] = v40;
                  v81[3] = @"Container";
                  v41 = [v15 dataContainerURL];
                  id v42 = sub_108DC(v41);
                  v83 = v42;
                  double v43 = v66;
                  *(void *)&long long v84 = v66;
                  v81[4] = @"Entitlements";
                  v81[5] = @"GroupContainers";
                  *((void *)&v84 + 1) = v22;
                  +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:6];
                  v45 = double v44 = (void *)v22;

                  id v6 = v63;
                  id v46 = v64;
                  id v8 = v65;
                  uint64_t v9 = v62;
                  uint64_t v10 = v67;
LABEL_41:

                  id v4 = v46;
                  id v5 = v68;
LABEL_43:

                  v53 = objc_msgSend(v15, "mb_pluginIdentifier");
                  [v5 setObject:v45 forKeyedSubscript:v53];

                  unsigned int v12 = v69;
                  goto LABEL_44;
                }
                double v43 = MBGetDefaultLog();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  id v46 = v4;
                  id v51 = objc_msgSend(v15, "mb_pluginIdentifier");
                  v52 = objc_msgSend(v15, "mb_pluginIdentifier");
                  *(_DWORD *)buf = 138412546;
                  id v88 = v51;
                  __int16 v89 = 2112;
                  v90 = v52;
                  _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a pluginIdentifier (%@) - will not be backed up.", buf, 0x16u);

                  double v44 = objc_msgSend(v15, "mb_pluginIdentifier");
                  unsigned __int8 v37 = objc_msgSend(v15, "mb_pluginIdentifier");
                  id v57 = v44;
                  v58 = v37;
                  goto LABEL_40;
                }
LABEL_42:
                v45 = 0;
                goto LABEL_43;
              }
              double v43 = MBGetDefaultLog();
              if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_42;
              }
              id v46 = v4;
              v49 = objc_msgSend(v15, "mb_pluginIdentifier");
              unint64_t v50 = objc_msgSend(v15, "mb_bundleURL");
              *(_DWORD *)buf = 138412546;
              id v88 = v49;
              __int16 v89 = 2112;
              v90 = v50;
              _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a bundle URL (%@) - will not be backed up.", buf, 0x16u);

              double v44 = objc_msgSend(v15, "mb_pluginIdentifier");
              unsigned __int8 v37 = objc_msgSend(v15, "mb_bundleURL");
              id v57 = v44;
              v58 = v37;
            }
            else
            {
              double v43 = MBGetDefaultLog();
              if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_42;
              }
              id v46 = v4;
              unint64_t v47 = objc_msgSend(v15, "mb_pluginIdentifier");
              v48 = [v15 dataContainerURL];
              *(_DWORD *)buf = 138412546;
              id v88 = v47;
              __int16 v89 = 2112;
              v90 = v48;
              _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a data container (%@) - will not be backed up.", buf, 0x16u);

              double v44 = objc_msgSend(v15, "mb_pluginIdentifier");
              unsigned __int8 v37 = [v15 dataContainerURL];
              id v57 = v44;
              v58 = v37;
            }
LABEL_40:
            _MBLog();
            v45 = 0;
            goto LABEL_41;
          }
        }
LABEL_44:
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [v6 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }
    while (v8);
  }

  int v54 = MBGetDefaultLog();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    id v55 = [v5 count];
    *(_DWORD *)buf = 134217984;
    id v88 = v55;
    _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, "Finished app enumeration PLUGINS: %lu apps", buf, 0xCu);
    [v5 count];
    _MBLog();
  }

  return v5;
}

- (id)_systemContainersWithError:(id *)a3 shared:(BOOL)a4
{
  id v4 = +[NSMutableDictionary dictionary];
  container_get_all_with_class_for_current_user();
  container_free_array_of_containers();
  id v5 = v4;

  return v5;
}

- (id)systemContainersWithError:(id *)a3
{
  id v5 = objc_opt_class();
  objc_sync_enter(v5);
  if (qword_2EB10)
  {
    id v7 = 0;
  }
  else
  {
    id v12 = 0;
    uint64_t v8 = [(MBMobileInstallation *)self _systemContainersWithError:&v12 shared:0];
    id v7 = v12;
    uint64_t v9 = (void *)qword_2EB10;
    qword_2EB10 = v8;
  }
  if (a3) {
    *a3 = v7;
  }
  id v10 = (id)qword_2EB10;

  objc_sync_exit(v5);

  return v10;
}

- (id)systemSharedContainersWithError:(id *)a3
{
  id v5 = objc_opt_class();
  objc_sync_enter(v5);
  if (qword_2EB18)
  {
    id v7 = 0;
  }
  else
  {
    id v12 = 0;
    uint64_t v8 = [(MBMobileInstallation *)self _systemContainersWithError:&v12 shared:1];
    id v7 = v12;
    uint64_t v9 = (void *)qword_2EB18;
    qword_2EB18 = v8;
  }
  if (a3) {
    *a3 = v7;
  }
  id v10 = (id)qword_2EB18;

  objc_sync_exit(v5);

  return v10;
}

+ (unint64_t)_containerClassForMBContainerType:(int)a3
{
  if ((a3 - 1) > 4) {
    return 15;
  }
  else {
    return qword_1DB70[a3 - 1];
  }
}

+ (id)_defaultSubdirectoriesForMCMContainerType:(unint64_t)a3 withError:(id *)a4
{
  id v6 = (void *)container_subdirectories_for_class();
  if (v6)
  {
    id v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else
  {
    uint64_t v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v11 = 2;
      __int16 v12 = 2048;
      uint64_t v13 = 1;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Failed to get subdirectory names for container class %llu : %llu", buf, 0x16u);
      _MBLog();
    }

    if (a4)
    {
      +[MBError errorWithCode:1, @"container_subdirectories_for_class failed for class %llu with error %llu", a3, 1 format];
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

+ (id)defaultSubdirectoriesForMBContainerType:(int)a3 withNestedSubdirectories:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = a1;
  objc_sync_enter(v6);
  if (!qword_2EB20)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = (void *)qword_2EB20;
    qword_2EB20 = v7;
  }
  uint64_t v9 = (char *)[v6 _containerClassForMBContainerType:v5];
  if (v9 == (unsigned char *)&dword_C + 3)
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v26 = 15;
      __int16 v27 = 1024;
      int v28 = v5;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Unknown MCM container type %llu for MB container type %u", buf, 0x12u);
      _MBLog();
    }
    uint64_t v11 = 0;
  }
  else
  {
    id v10 = +[NSNumber numberWithUnsignedLongLong:v9];
    __int16 v12 = [(id)qword_2EB20 objectForKeyedSubscript:v10];
    if (!v12)
    {
      __int16 v12 = [v6 _defaultSubdirectoriesForMCMContainerType:v9 withError:0];
      [(id)qword_2EB20 setObject:v12 forKeyedSubscript:v10];
    }
    if (v4)
    {
      uint64_t v11 = +[NSSet setWithArray:v12];
    }
    else
    {
      uint64_t v11 = +[NSMutableSet set];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v21;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = [*(id *)(*((void *)&v20 + 1) + 8 * i) pathComponents];
            v18 = [v17 objectAtIndexedSubscript:0];

            [v11 addObject:v18];
          }
          id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
    }
  }

  objc_sync_exit(v6);

  return v11;
}

- (BOOL)uninstallAppWithBundleID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  [v6 setRequestUserConfirmation:0];
  [v6 setWaitForDeletion:1];
  [v6 setShowArchiveOption:0];
  [v6 setSystemAppNotAllowed:0];
  unsigned __int8 v7 = +[IXAppInstallCoordinator uninstallAppWithBundleID:v5 options:v6 disposition:0 error:a4];
  if ((v7 & 1) == 0)
  {
    uint64_t v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = *a4;
      *(_DWORD *)buf = 138412802;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Error uninstalling app with bundleID:%@{public} options:%@ error:%@", buf, 0x20u);
      _MBLog();
    }
  }
  return v7;
}

- (id)safeHarborsWithError:(id *)a3
{
  BOOL v4 = (void *)MobileInstallationCopySafeHarbors();
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else if (a3)
  {
    *a3 = +[MBError errorWithCode:1 format:@"MobileInstallationCopySafeHarbors failed"];
  }

  return v5;
}

- (BOOL)registerSafeHarborWithIdentifier:(id)a3 path:(id)a4 type:(int)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  int v11 = MCMContainerContentClassForMBContainerType(a5);
  int v12 = MobileInstallationRegisterSafeHarborForContainerType();
  __int16 v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 1024;
    int v21 = v11;
    __int16 v22 = 1024;
    int v23 = v12;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "MobileInstallationRegisterSafeHarborForContainerType(\"%@\", \"%@\", %d, NULL): %d", buf, 0x22u);
    _MBLog();
  }

  if (a6) {
    char v14 = v12;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    *a6 = +[MBError errorWithCode:1, @"MobileInstallationRegisterSafeHarborForContainerType failed: %@: %@", v9, v10 format];
  }

  return v12;
}

- (BOOL)removeSafeHarborWithIdentifier:(id)a3 type:(int)a4 error:(id *)a5
{
  id v7 = a3;
  if (a4) {
    int v8 = MCMContainerContentClassForMBContainerType(a4);
  }
  else {
    int v8 = 1;
  }
  int v9 = MobileInstallationRemoveSafeHarborForContainerType();
  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v14 = v7;
    __int16 v15 = 1024;
    int v16 = v8;
    __int16 v17 = 1024;
    int v18 = v9;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "MobileInstallationRemoveSafeHarborForContainerType(\"%@\", %d, NULL): %d", buf, 0x18u);
    _MBLog();
  }

  if (a5) {
    char v11 = v9;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    *a5 = +[MBError errorWithCode:1, @"MobileInstallationRemoveSafeHarborForContainerType failed: %@", v7 format];
  }

  return v9;
}

+ (id)displayNameForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v15 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v15];
  id v5 = v15;
  if (!v4)
  {
    int v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v3;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Failed to find the app record for %{public}@: %{public}@", buf, 0x16u);
LABEL_9:
      _MBLog();
    }
LABEL_10:
    __int16 v13 = 0;
    goto LABEL_11;
  }
  id v6 = [v4 applicationState];
  unsigned __int8 v7 = [v6 isInstalled];

  if ((v7 & 1) == 0)
  {
    int v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v3;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Found an app record for %{public}@ but it's not installed", buf, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  int v8 = MBLocalizations();
  int v9 = [v4 localizedNameWithPreferredLocalizations:v8];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v4 localizedName];
  }
  __int16 v13 = v11;

  int v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v3;
    __int16 v18 = 2114;
    id v19 = v13;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "Mapped %{public}@ to %{public}@", buf, 0x16u);
    _MBLog();
  }
LABEL_11:

  return v13;
}

+ (id)displayNameForDomain:(id)a3 isSystemDomain:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v5)
  {
    if ((+[MBDomain isSystemContainerName:v5] & 1) != 0
      || +[MBDomain isSystemSharedContainerName:v5])
    {
      MBLocalizedStringFromTable();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = +[MBDomain containerIDWithName:v5];
      if (!v7) {
        id v7 = v5;
      }
      int v8 = [&off_2A228 objectForKeyedSubscript:v7];
      int v9 = v8;
      if (v8)
      {
        id v10 = v8;

        id v7 = v10;
      }
      id v11 = [(id)objc_opt_class() displayNameForBundleIdentifier:v7];
      if (v11)
      {
        id v6 = v11;
      }
      else
      {

        if (v4)
        {
          MBLocalizedStringFromTable();
          id v6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v6 = 0;
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)displayNamesForDomainNames:(id)a3 domainManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    sub_19BBC();
  }
  id v7 = v6;
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        int v16 = +[MBMobileInstallation displayNameForDomain:isSystemDomain:](MBMobileInstallation, "displayNameForDomain:isSystemDomain:", v14, objc_msgSend(v7, "isSystemDomainName:", v14, (void)v18));
        if (v16) {
          [v8 addObject:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (NSString)safeHarborDir
{
  return self->_safeHarborDir;
}

- (void)setSafeHarborDir:(id)a3
{
}

- (MBIgnoredAccountsTracker)accountsTracker
{
  return self->_accountsTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsTracker, 0);

  objc_storeStrong((id *)&self->_safeHarborDir, 0);
}

@end