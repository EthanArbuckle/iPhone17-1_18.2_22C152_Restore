@interface INUserActivityExecutionInfo
+ (void)initialize;
- (BOOL)canRunOnLocalDevice;
- (INUserActivityExecutionInfo)initWithUserActivityType:(id)a3 launchableAppBundleId:(id)a4;
- (NSString)userActivityType;
- (id)_initWithUserActivityType:(id)a3 launchableAppBundleId:(id)a4 containingAppBundleURL:(id)a5 extensionBundleId:(id)a6;
@end

@implementation INUserActivityExecutionInfo

- (void).cxx_destruct
{
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (BOOL)canRunOnLocalDevice
{
  v3 = [(INExecutionInfo *)self _applicationRecord];
  v4 = [v3 applicationState];
  int v5 = [v4 isInstalled];

  if (!v5) {
    return 0;
  }
  v6 = [(INExecutionInfo *)self _appInfo];
  v7 = [v6 supportedActions];
  v8 = [(INUserActivityExecutionInfo *)self userActivityType];
  char v9 = [v7 containsObject:v8];

  return (v9 & 1) != 0;
}

- (id)_initWithUserActivityType:(id)a3 launchableAppBundleId:(id)a4 containingAppBundleURL:(id)a5 extensionBundleId:(id)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INUserActivityExecutionInfo;
  v11 = [(INExecutionInfo *)&v15 _initWithLaunchableAppBundleId:a4 displayableAppBundleId:0 containingAppBundleURL:a5 extensionBundleId:a6];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    v13 = (void *)v11[6];
    v11[6] = v12;
  }
  return v11;
}

- (INUserActivityExecutionInfo)initWithUserActivityType:(id)a3 launchableAppBundleId:(id)a4
{
  return (INUserActivityExecutionInfo *)[(INUserActivityExecutionInfo *)self _initWithUserActivityType:a3 launchableAppBundleId:a4 containingAppBundleURL:0 extensionBundleId:0];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

@end