@interface DBDashboardApplicationSceneEntity
+ (id)applicationSceneEntityForApplication:(id)a3;
- (BOOL)isApplicationEntity;
- (BOOL)isFullScreenEntity;
- (DBApplication)application;
- (id)_initWithApplication:(id)a3;
- (void)_buildDescriptionWithBuilder:(id)a3;
@end

@implementation DBDashboardApplicationSceneEntity

- (id)_initWithApplication:(id)a3
{
  id v5 = a3;
  v6 = [v5 bundleIdentifier];
  v9.receiver = self;
  v9.super_class = (Class)DBDashboardApplicationSceneEntity;
  v7 = [(DBDashboardEntity *)&v9 _initWithIdentifier:v6];

  if (v7) {
    objc_storeStrong(v7 + 2, a3);
  }

  return v7;
}

+ (id)applicationSceneEntityForApplication:(id)a3
{
  id v3 = a3;
  id v4 = [[DBDashboardApplicationSceneEntity alloc] _initWithApplication:v3];

  return v4;
}

- (BOOL)isApplicationEntity
{
  return 1;
}

- (void)_buildDescriptionWithBuilder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DBDashboardApplicationSceneEntity;
  [(DBDashboardEntity *)&v7 _buildDescriptionWithBuilder:v4];
  id v5 = [(DBApplication *)self->_application bundleIdentifier];
  id v6 = (id)[v4 appendObject:v5 withName:@"bundleID"];
}

- (BOOL)isFullScreenEntity
{
  return [(DBApplication *)self->_application presentsFullScreen];
}

- (DBApplication)application
{
  return self->_application;
}

- (void).cxx_destruct
{
}

@end