@interface _DBAnalyticsAppInfo
- (BOOL)wasVisibleBeforeCarScreen;
- (BOOL)wasVisibleBeforeSiri;
- (BOOL)wasVisibleInClusterBeforeCarScreen;
- (BOOL)wasVisibleInDashboardBeforeCarScreen;
- (DBApplicationInfo)appInfo;
- (NSString)bundleIdentifier;
- (_DBAnalyticsAppInfo)initWithAppInfo:(id)a3 policyEvaluator:(id)a4;
- (_DBAnalyticsAppInfo)initWithBundleIdentifier:(id)a3 appDeclaration:(id)a4 policyEvaluator:(id)a5;
- (id)debugDescription;
- (unint64_t)category;
- (unint64_t)dashboardWidgetType;
- (unint64_t)numberOfSiriPresentations;
- (void)setDashboardWidgetType:(unint64_t)a3;
- (void)setNumberOfSiriPresentations:(unint64_t)a3;
- (void)setWasVisibleBeforeCarScreen:(BOOL)a3;
- (void)setWasVisibleBeforeSiri:(BOOL)a3;
- (void)setWasVisibleInClusterBeforeCarScreen:(BOOL)a3;
- (void)setWasVisibleInDashboardBeforeCarScreen:(BOOL)a3;
- (void)startCountingClusterVisibleTime;
- (void)startCountingDashboardVisibleTime;
- (void)startCountingNavOwnershipTime;
- (void)startCountingVisibleTime;
- (void)stopCountingClusterVisibleTime;
- (void)stopCountingDashboardVisibleTime;
- (void)stopCountingNavOwnershipTime;
- (void)stopCountingVisibleTime;
@end

@implementation _DBAnalyticsAppInfo

- (_DBAnalyticsAppInfo)initWithAppInfo:(id)a3 policyEvaluator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 bundleIdentifier];
  v10 = [v7 carPlayDeclaration];
  v11 = [(_DBAnalyticsAppInfo *)self initWithBundleIdentifier:v9 appDeclaration:v10 policyEvaluator:v8];

  if (v11) {
    objc_storeStrong((id *)&v11->_appInfo, a3);
  }

  return v11;
}

- (_DBAnalyticsAppInfo)initWithBundleIdentifier:(id)a3 appDeclaration:(id)a4 policyEvaluator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_DBAnalyticsAppInfo;
  v12 = [(_DBAnalyticsTimeAccumulator *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleIdentifier, a3);
    v13->_numberOfSiriPresentations = 0;
    if (!v10)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v9 allowPlaceholder:0 error:0];
      id v10 = [MEMORY[0x263F30E68] declarationForAppRecord:v14];
    }
    v15 = [v11 effectivePolicyForAppDeclaration:v10];
    v13->_category = [v15 applicationCategory];
  }
  return v13;
}

- (void)startCountingVisibleTime
{
}

- (void)startCountingDashboardVisibleTime
{
}

- (void)startCountingClusterVisibleTime
{
}

- (void)startCountingNavOwnershipTime
{
}

- (void)stopCountingVisibleTime
{
}

- (void)stopCountingDashboardVisibleTime
{
}

- (void)stopCountingClusterVisibleTime
{
}

- (void)stopCountingNavOwnershipTime
{
}

- (id)debugDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_DBAnalyticsAppInfo;
  v4 = [(_DBAnalyticsAppInfo *)&v8 debugDescription];
  v5 = [(_DBAnalyticsAppInfo *)self bundleIdentifier];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (DBApplicationInfo)appInfo
{
  return self->_appInfo;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)category
{
  return self->_category;
}

- (BOOL)wasVisibleBeforeCarScreen
{
  return self->_wasVisibleBeforeCarScreen;
}

- (void)setWasVisibleBeforeCarScreen:(BOOL)a3
{
  self->_wasVisibleBeforeCarScreen = a3;
}

- (BOOL)wasVisibleInDashboardBeforeCarScreen
{
  return self->_wasVisibleInDashboardBeforeCarScreen;
}

- (void)setWasVisibleInDashboardBeforeCarScreen:(BOOL)a3
{
  self->_wasVisibleInDashboardBeforeCarScreen = a3;
}

- (BOOL)wasVisibleInClusterBeforeCarScreen
{
  return self->_wasVisibleInClusterBeforeCarScreen;
}

- (void)setWasVisibleInClusterBeforeCarScreen:(BOOL)a3
{
  self->_wasVisibleInClusterBeforeCarScreen = a3;
}

- (BOOL)wasVisibleBeforeSiri
{
  return self->_wasVisibleBeforeSiri;
}

- (void)setWasVisibleBeforeSiri:(BOOL)a3
{
  self->_wasVisibleBeforeSiri = a3;
}

- (unint64_t)numberOfSiriPresentations
{
  return self->_numberOfSiriPresentations;
}

- (void)setNumberOfSiriPresentations:(unint64_t)a3
{
  self->_numberOfSiriPresentations = a3;
}

- (unint64_t)dashboardWidgetType
{
  return self->_dashboardWidgetType;
}

- (void)setDashboardWidgetType:(unint64_t)a3
{
  self->_dashboardWidgetType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
}

@end