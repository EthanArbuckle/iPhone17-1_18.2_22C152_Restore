@interface DBDashboardProxiedApplicationSceneEntity
+ (id)application:(id)a3 proxiedByEntity:(id)a4;
- (BOOL)isProxiedApplicationEntity;
- (DBApplication)applicationToProxy;
- (DBDashboardApplicationSceneEntity)proxyEntity;
- (id)_initWithApplication:(id)a3 proxiedByEntity:(id)a4;
- (void)_buildDescriptionWithBuilder:(id)a3;
@end

@implementation DBDashboardProxiedApplicationSceneEntity

- (id)_initWithApplication:(id)a3 proxiedByEntity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = NSString;
  v10 = [v8 identifier];
  v11 = [v7 bundleIdentifier];
  v12 = [v9 stringWithFormat:@"%@.%@", v10, v11];
  v15.receiver = self;
  v15.super_class = (Class)DBDashboardProxiedApplicationSceneEntity;
  v13 = [(DBDashboardEntity *)&v15 _initWithIdentifier:v12];

  if (v13)
  {
    objc_storeStrong(v13 + 2, a3);
    objc_storeStrong(v13 + 3, a4);
  }

  return v13;
}

- (void)_buildDescriptionWithBuilder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DBDashboardProxiedApplicationSceneEntity;
  [(DBDashboardEntity *)&v10 _buildDescriptionWithBuilder:v4];
  v5 = [(DBApplication *)self->_applicationToProxy bundleIdentifier];
  id v6 = (id)[v4 appendObject:v5 withName:@"applicationToProxy"];

  id v7 = [(DBDashboardApplicationSceneEntity *)self->_proxyEntity application];
  id v8 = [v7 bundleIdentifier];
  id v9 = (id)[v4 appendObject:v8 withName:@"proxyApp"];
}

+ (id)application:(id)a3 proxiedByEntity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[DBDashboardProxiedApplicationSceneEntity alloc] _initWithApplication:v6 proxiedByEntity:v5];

  return v7;
}

- (BOOL)isProxiedApplicationEntity
{
  return 1;
}

- (DBApplication)applicationToProxy
{
  return self->_applicationToProxy;
}

- (DBDashboardApplicationSceneEntity)proxyEntity
{
  return self->_proxyEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyEntity, 0);
  objc_storeStrong((id *)&self->_applicationToProxy, 0);
}

@end