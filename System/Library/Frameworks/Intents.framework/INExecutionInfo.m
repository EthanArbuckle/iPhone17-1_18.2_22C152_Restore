@interface INExecutionInfo
+ (void)initialize;
- (BOOL)canRunOnLocalDevice;
- (INAppInfo)_appInfo;
- (LSApplicationRecord)_applicationRecord;
- (NSString)displayableAppBundleId;
- (NSString)extensionBundleId;
- (NSString)launchableAppBundleId;
- (NSURL)containingAppBundleURL;
- (id)_initWithLaunchableAppBundleId:(id)a3 displayableAppBundleId:(id)a4 containingAppBundleURL:(id)a5 extensionBundleId:(id)a6;
@end

@implementation INExecutionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingAppBundleURL, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_displayableAppBundleId, 0);
  objc_storeStrong((id *)&self->_launchableAppBundleId, 0);

  objc_storeStrong((id *)&self->_appInfo, 0);
}

- (NSURL)containingAppBundleURL
{
  return self->_containingAppBundleURL;
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (NSString)displayableAppBundleId
{
  return self->_displayableAppBundleId;
}

- (NSString)launchableAppBundleId
{
  return self->_launchableAppBundleId;
}

- (BOOL)canRunOnLocalDevice
{
  return 0;
}

- (LSApplicationRecord)_applicationRecord
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(INExecutionInfo *)self launchableAppBundleId];
  if ([v2 length])
  {
    id v7 = 0;
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v2 allowPlaceholder:0 error:&v7];
    id v4 = v7;
    if (v4)
    {
      v5 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v9 = "-[INExecutionInfo _applicationRecord]";
        __int16 v10 = 2112;
        v11 = v2;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_error_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_ERROR, "%s Unable to create application record for %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return (LSApplicationRecord *)v3;
}

- (INAppInfo)_appInfo
{
  appInfo = self->_appInfo;
  if (!appInfo)
  {
    id v4 = [(INExecutionInfo *)self _applicationRecord];
    v5 = v4;
    if (v4)
    {
      id v4 = +[INAppInfo appInfoWithApplicationRecord:v4];
    }
    v6 = self->_appInfo;
    self->_appInfo = v4;

    appInfo = self->_appInfo;
  }

  return appInfo;
}

- (id)_initWithLaunchableAppBundleId:(id)a3 displayableAppBundleId:(id)a4 containingAppBundleURL:(id)a5 extensionBundleId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)INExecutionInfo;
  uint64_t v14 = [(INExecutionInfo *)&v28 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    p_launchableAppBundleId = (void **)&v14->_launchableAppBundleId;
    launchableAppBundleId = v14->_launchableAppBundleId;
    v14->_launchableAppBundleId = (NSString *)v15;

    uint64_t v18 = [v11 copy];
    displayableAppBundleId = v14->_displayableAppBundleId;
    v14->_displayableAppBundleId = (NSString *)v18;

    uint64_t v20 = [v12 copy];
    containingAppBundleURL = v14->_containingAppBundleURL;
    v14->_containingAppBundleURL = (NSURL *)v20;

    uint64_t v22 = [v13 copy];
    extensionBundleId = v14->_extensionBundleId;
    v14->_extensionBundleId = (NSString *)v22;

    v24 = v14->_displayableAppBundleId;
    if (v14->_launchableAppBundleId)
    {
      if (!v24)
      {
        v24 = *p_launchableAppBundleId;
        p_launchableAppBundleId = (void **)&v14->_displayableAppBundleId;
LABEL_6:
        id v25 = v24;
        v26 = *p_launchableAppBundleId;
        *p_launchableAppBundleId = v25;
      }
    }
    else if (v24)
    {
      goto LABEL_6;
    }
  }

  return v14;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

@end