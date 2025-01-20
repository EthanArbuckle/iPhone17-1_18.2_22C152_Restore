@interface CSLPRFLiveActivitiesAppMutableSettings
- (BOOL)allowLiveActivitiesForApp;
- (BOOL)globalAllowLiveActivities;
- (BOOL)globalAutoLaunchLiveActivities;
- (BOOL)isEqualToSettings:(id)a3;
- (BOOL)supportsSmartStack;
- (CSLPRFLiveActivitiesAppMutableSettings)initWithSettings:(id)a3;
- (unint64_t)autoLaunchBehaviorForApp;
- (void)setAllowLiveActivitiesForApp:(BOOL)a3;
- (void)setAutoLaunchBehaviorForApp:(unint64_t)a3;
- (void)setGlobalAllowLiveActivities:(BOOL)a3;
- (void)setGlobalAutoLaunchLiveActivities:(BOOL)a3;
@end

@implementation CSLPRFLiveActivitiesAppMutableSettings

- (void)setAutoLaunchBehaviorForApp:(unint64_t)a3
{
  self->_autoLaunchBehaviorForApp = a3;
}

- (unint64_t)autoLaunchBehaviorForApp
{
  return self->_autoLaunchBehaviorForApp;
}

- (void)setAllowLiveActivitiesForApp:(BOOL)a3
{
  self->_allowLiveActivitiesForApp = a3;
}

- (BOOL)allowLiveActivitiesForApp
{
  return self->_allowLiveActivitiesForApp;
}

- (BOOL)supportsSmartStack
{
  return self->_supportsSmartStack;
}

- (void)setGlobalAutoLaunchLiveActivities:(BOOL)a3
{
  self->_globalAutoLaunchLiveActivities = a3;
}

- (BOOL)globalAutoLaunchLiveActivities
{
  return self->_globalAutoLaunchLiveActivities;
}

- (void)setGlobalAllowLiveActivities:(BOOL)a3
{
  self->_globalAllowLiveActivities = a3;
}

- (BOOL)globalAllowLiveActivities
{
  return self->_globalAllowLiveActivities;
}

- (BOOL)isEqualToSettings:(id)a3
{
  return CSLPRFEqualLiveActivitiesAppSettingsValues(self, a3);
}

- (CSLPRFLiveActivitiesAppMutableSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSLPRFLiveActivitiesAppMutableSettings;
  v5 = [(CSLPRFLiveActivitiesAppMutableSettings *)&v7 init];
  if (v5)
  {
    v5->_globalAllowLiveActivities = [v4 globalAllowLiveActivities];
    v5->_globalAutoLaunchLiveActivities = [v4 globalAutoLaunchLiveActivities];
    v5->_supportsSmartStack = [v4 supportsSmartStack];
    v5->_allowLiveActivitiesForApp = [v4 allowLiveActivitiesForApp];
    v5->_autoLaunchBehaviorForApp = [v4 autoLaunchBehaviorForApp];
  }

  return v5;
}

@end