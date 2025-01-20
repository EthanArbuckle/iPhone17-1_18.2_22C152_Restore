@interface DOCSourceBuilder
- (DOCManagedPermission)managedPermission;
- (DOCSourceBuilder)initWithUserAction:(unint64_t)a3 hostIdentifier:(id)a4;
- (DOCSourceBuilder)initWithUserAction:(unint64_t)a3 hostIdentifier:(id)a4 managedPermissions:(id)a5;
- (NSString)hostIdentifier;
- (id)buildSourcesFromLegacyPickerExtensions:(id)a3 legacyProviders:(id)a4;
- (id)buildSourcesFromProviderDomains:(id)a3;
- (id)buildSourcesProviders:(id)a3 legacyWebViewFileProviders:(id)a4;
- (id)containingAppBundleIdentifierForBundleURL:(id)a3;
- (id)containingAppBundleIdentifierForPicker:(id)a3;
- (id)containingAppBundleIdentifierForProvider:(id)a3;
- (id)filterNonObsoleteLegacyPickersFromPickers:(id)a3 modernProviders:(id)a4;
- (id)matchingLegacyProviderIdentifierForPicker:(id)a3;
- (unint64_t)userAction;
- (void)setHostIdentifier:(id)a3;
- (void)setManagedPermission:(id)a3;
- (void)setUserAction:(unint64_t)a3;
@end

@implementation DOCSourceBuilder

- (DOCSourceBuilder)initWithUserAction:(unint64_t)a3 hostIdentifier:(id)a4
{
  id v6 = a4;
  v7 = +[DOCManagedPermission defaultPermission];
  v8 = [(DOCSourceBuilder *)self initWithUserAction:a3 hostIdentifier:v6 managedPermissions:v7];

  return v8;
}

- (DOCSourceBuilder)initWithUserAction:(unint64_t)a3 hostIdentifier:(id)a4 managedPermissions:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)DOCSourceBuilder;
  v10 = [(DOCSourceBuilder *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(DOCSourceBuilder *)v10 setUserAction:a3];
    [(DOCSourceBuilder *)v11 setHostIdentifier:v8];
    [(DOCSourceBuilder *)v11 setManagedPermission:v9];
  }

  return v11;
}

- (id)buildSourcesProviders:(id)a3 legacyWebViewFileProviders:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  +[NSMutableArray array];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100005BA8;
  v19 = &unk_1005B7350;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v9;
  id v10 = v8;
  id v21 = v10;
  [v7 enumerateObjectsUsingBlock:&v16];

  if (v6)
  {
    v11 = -[DOCSourceBuilder filterNonObsoleteLegacyPickersFromPickers:modernProviders:](self, "filterNonObsoleteLegacyPickersFromPickers:modernProviders:", v6, v9, v16, v17, v18, v19, v20);
    v12 = [(DOCSourceBuilder *)self buildSourcesFromLegacyPickerExtensions:v11 legacyProviders:v10];
  }
  else
  {
    v12 = 0;
  }
  objc_super v13 = -[DOCSourceBuilder buildSourcesFromProviderDomains:](self, "buildSourcesFromProviderDomains:", v9, v16, v17, v18, v19);
  v14 = [v13 arrayByAddingObjectsFromArray:v12];

  return v14;
}

- (id)buildSourcesFromProviderDomains:(id)a3
{
  id v4 = a3;
  id v20 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v4 count] + 1);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v11 = +[DOCAppProtectionManager sharedManager];
        unsigned int v12 = [v11 hostAppCanSeeFileProviderDomain:v10];

        if (v12)
        {
          objc_super v13 = +[DOCManagedPermission defaultPermission];
          unsigned int v14 = objc_msgSend(v13, "canHostAppPerformAction:fileProviderDomain:", -[DOCSourceBuilder userAction](self, "userAction"), v10);

          if (v14)
          {
            v15 = [(DOCSourceBuilder *)self hostIdentifier];
            v16 = +[DOCFileProviderSource createSourceFrom:v10 with:v15];

            [v20 addObject:v16];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  uint64_t v17 = +[DOCFileProviderSource createSpotlightSources];
  [v20 addObjectsFromArray:v17];

  id v18 = [v20 copy];
  return v18;
}

- (id)buildSourcesFromLegacyPickerExtensions:(id)a3 legacyProviders:(id)a4
{
  id v6 = a3;
  id v31 = a4;
  v30 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v38;
    v11 = &_sSo25NSMutableAttributedStringC26DocumentManagerExecutables32BidiDirectionalIsolationUpdatingACWP_ptr;
    *(void *)&long long v8 = 136315650;
    long long v29 = v8;
    do
    {
      unsigned int v12 = 0;
      id v32 = v9;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v12);
        unsigned int v14 = objc_msgSend(v11[252], "defaultPermission", v29);
        unsigned int v15 = objc_msgSend(v14, "canHostAppPerformAction:legacyPickerExtension:", -[DOCSourceBuilder userAction](self, "userAction"), v13);

        v16 = [(DOCSourceBuilder *)self matchingLegacyProviderIdentifierForPicker:v13];
        uint64_t v17 = v16;
        if (v16) {
          BOOL v18 = v15 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_100006228;
          v35[3] = &unk_1005B7378;
          id v19 = v16;
          id v36 = v19;
          id v20 = +[NSPredicate predicateWithBlock:v35];
          long long v21 = [v31 filteredArrayUsingPredicate:v20];
          long long v22 = [v21 firstObject];

          if (!v22)
          {
            long long v23 = docLogHandle;
            if (!docLogHandle)
            {
              DOCInitLogging();
              long long v23 = docLogHandle;
            }
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v42 = "-[DOCSourceBuilder buildSourcesFromLegacyPickerExtensions:legacyProviders:]";
              __int16 v43 = 2112;
              id v44 = v19;
              _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s falling back to fetching domain manually for legacy V1 file provider for ID: %@", buf, 0x16u);
            }
            id v34 = 0;
            long long v22 = +[FPProviderDomain providerDomainWithID:v19 cachePolicy:1 error:&v34];
            id v24 = v34;
            if (v24)
            {
              v25 = docLogHandle;
              if (!docLogHandle)
              {
                DOCInitLogging();
                v25 = docLogHandle;
              }
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v29;
                v42 = "-[DOCSourceBuilder buildSourcesFromLegacyPickerExtensions:legacyProviders:]";
                __int16 v43 = 2112;
                id v44 = v19;
                __int16 v45 = 2112;
                id v46 = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s failed to fetch domain manually for legacy V1 file provider for ID: %@ error: %@", buf, 0x20u);
              }
            }
          }
          v26 = [[DOCPickerSource alloc] initWithPicker:v13 providerDomain:v22];
          if (v26) {
            [v30 addObject:v26];
          }

          id v9 = v32;
          v11 = &_sSo25NSMutableAttributedStringC26DocumentManagerExecutables32BidiDirectionalIsolationUpdatingACWP_ptr;
        }

        unsigned int v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v9 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v9);
  }

  id v27 = [v30 copy];
  return v27;
}

- (id)filterNonObsoleteLegacyPickersFromPickers:(id)a3 modernProviders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v7 count]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = [(DOCSourceBuilder *)self containingAppBundleIdentifierForProvider:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        if (v14) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  long long v21 = sub_10000646C;
  long long v22 = &unk_1005B73A0;
  long long v23 = self;
  id v24 = v8;
  id v15 = v8;
  v16 = +[NSPredicate predicateWithBlock:&v19];
  uint64_t v17 = objc_msgSend(v6, "filteredArrayUsingPredicate:", v16, v19, v20, v21, v22, v23);

  return v17;
}

- (id)containingAppBundleIdentifierForPicker:(id)a3
{
  id v4 = [a3 infoDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"Path"];

  if (v5)
  {
    id v6 = +[NSURL fileURLWithPath:v5];
    id v7 = [(DOCSourceBuilder *)self containingAppBundleIdentifierForBundleURL:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)containingAppBundleIdentifierForProvider:(id)a3
{
  id v4 = [a3 extensionBundleURL];
  id v5 = [(DOCSourceBuilder *)self containingAppBundleIdentifierForBundleURL:v4];

  return v5;
}

- (id)containingAppBundleIdentifierForBundleURL:(id)a3
{
  v3 = +[LSBundleRecord doc_applicationExtensionRecordAtURL:a3];
  id v4 = [v3 containingApplicationRecord];

  id v5 = [v4 bundleIdentifier];

  return v5;
}

- (id)matchingLegacyProviderIdentifierForPicker:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)LSApplicationExtensionRecord);
  id v5 = [v3 identifier];
  id v6 = [v4 initWithBundleIdentifier:v5 error:0];

  id v7 = [v6 containingBundleRecord];
  objc_opt_class();
  long long v8 = 0;
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = [v7 applicationExtensionRecords];
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      id v18 = v3;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned int v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v15 = [v14 extensionPointRecord];
          v16 = [v15 identifier];

          if ([v16 isEqualToString:@"com.apple.fileprovider-nonui"])
          {
            long long v8 = [v14 bundleIdentifier];

            goto LABEL_12;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      long long v8 = 0;
LABEL_12:
      id v3 = v18;
    }
    else
    {
      long long v8 = 0;
    }
  }
  return v8;
}

- (unint64_t)userAction
{
  return self->_userAction;
}

- (void)setUserAction:(unint64_t)a3
{
  self->_userAction = a3;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void)setHostIdentifier:(id)a3
{
}

- (DOCManagedPermission)managedPermission
{
  return self->_managedPermission;
}

- (void)setManagedPermission:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedPermission, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

@end