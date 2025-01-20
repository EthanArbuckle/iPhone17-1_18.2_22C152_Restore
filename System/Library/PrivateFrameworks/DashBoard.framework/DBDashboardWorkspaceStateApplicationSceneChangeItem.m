@interface DBDashboardWorkspaceStateApplicationSceneChangeItem
- (BOOL)prefersAnimation;
- (DBActivationSettings)activationSettings;
- (DBApplication)application;
- (DBDashboardWorkspaceStateApplicationSceneChangeItem)initWithApplication:(id)a3;
- (id)_newEntityFromChangeItemWithPolicyProvider:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_buildDescriptionWithBuilder:(id)a3;
- (void)setActivationSettings:(id)a3;
- (void)setApplication:(id)a3;
@end

@implementation DBDashboardWorkspaceStateApplicationSceneChangeItem

- (DBDashboardWorkspaceStateApplicationSceneChangeItem)initWithApplication:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBDashboardWorkspaceStateApplicationSceneChangeItem;
  v6 = [(DBDashboardWorkspaceStateChangeItem *)&v9 _init];
  v7 = (DBDashboardWorkspaceStateApplicationSceneChangeItem *)v6;
  if (v6) {
    objc_storeStrong(v6 + 3, a3);
  }

  return v7;
}

- (BOOL)prefersAnimation
{
  v7.receiver = self;
  v7.super_class = (Class)DBDashboardWorkspaceStateApplicationSceneChangeItem;
  if (![(DBDashboardWorkspaceStateChangeItem *)&v7 prefersAnimation]) {
    return 0;
  }
  v3 = [(DBDashboardWorkspaceStateApplicationSceneChangeItem *)self activationSettings];

  if (!v3) {
    return 1;
  }
  v4 = [(DBDashboardWorkspaceStateApplicationSceneChangeItem *)self activationSettings];
  char v5 = [v4 isAnimated];

  return v5;
}

- (id)_newEntityFromChangeItemWithPolicyProvider:(id)a3
{
  v4 = [(DBDashboardWorkspaceStateApplicationSceneChangeItem *)self application];
  char v5 = [v4 appPolicy];

  v6 = self->_application;
  if ([v5 launchUsingTemplateUI])
  {
    objc_super v7 = +[DBApplicationController sharedInstance];
    uint64_t v8 = [v7 templateUIHostApplication];
  }
  else
  {
    if (([v5 launchUsingMusicUIService] & 1) == 0)
    {
      if ([v5 isCarPlayCapable]) {
        goto LABEL_9;
      }
      objc_super v9 = [(DBApplication *)v6 info];
      int v10 = [v9 supportsBackgroundMode:*MEMORY[0x263F833D0]];

      if (!v10) {
        goto LABEL_9;
      }
    }
    objc_super v7 = +[DBApplicationController sharedInstance];
    uint64_t v8 = [v7 musicUIServiceApplication];
  }
  v11 = (void *)v8;

  if (!v11)
  {
LABEL_9:
    v13 = +[DBDashboardApplicationSceneEntity applicationSceneEntityForApplication:v6];
    goto LABEL_10;
  }
  v12 = +[DBDashboardApplicationSceneEntity applicationSceneEntityForApplication:v11];
  v13 = +[DBDashboardProxiedApplicationSceneEntity application:v6 proxiedByEntity:v12];

LABEL_10:
  return v13;
}

- (void)_buildDescriptionWithBuilder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DBDashboardWorkspaceStateApplicationSceneChangeItem;
  [(DBDashboardWorkspaceStateChangeItem *)&v7 _buildDescriptionWithBuilder:v4];
  char v5 = [(DBApplication *)self->_application bundleIdentifier];
  id v6 = (id)[v4 appendObject:v5 withName:@"bundleID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DBDashboardWorkspaceStateApplicationSceneChangeItem;
  id v4 = [(DBDashboardWorkspaceStateChangeItem *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 3, self->_application);
  return v4;
}

- (DBApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (DBActivationSettings)activationSettings
{
  return self->_activationSettings;
}

- (void)setActivationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationSettings, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end