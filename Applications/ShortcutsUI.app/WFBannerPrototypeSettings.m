@interface WFBannerPrototypeSettings
+ (id)settingsControllerModule;
+ (id)sharedSettings;
- (BOOL)bannerFramesEnabled;
- (BOOL)blurFilterEnabled;
- (BOOL)debugMorphTransitions;
- (BOOL)debugShadowsEnabled;
- (BOOL)simulateStatusBannerDevice;
- (BOOL)useRemoteAlertsForActionInterfaceDialogRequests;
- (WFBannerGestureSettings)gestureSettings;
- (WFBannerTransitionSettings)transitionSettings;
- (void)setBannerFramesEnabled:(BOOL)a3;
- (void)setBlurFilterEnabled:(BOOL)a3;
- (void)setDebugMorphTransitions:(BOOL)a3;
- (void)setDebugShadowsEnabled:(BOOL)a3;
- (void)setDefaultValues;
- (void)setGestureSettings:(id)a3;
- (void)setSimulateStatusBannerDevice:(BOOL)a3;
- (void)setTransitionSettings:(id)a3;
- (void)setUseRemoteAlertsForActionInterfaceDialogRequests:(BOOL)a3;
@end

@implementation WFBannerPrototypeSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureSettings, 0);

  objc_storeStrong((id *)&self->_transitionSettings, 0);
}

- (void)setUseRemoteAlertsForActionInterfaceDialogRequests:(BOOL)a3
{
  self->_useRemoteAlertsForActionInterfaceDialogRequests = a3;
}

- (BOOL)useRemoteAlertsForActionInterfaceDialogRequests
{
  return self->_useRemoteAlertsForActionInterfaceDialogRequests;
}

- (void)setSimulateStatusBannerDevice:(BOOL)a3
{
  self->_simulateStatusBannerDevice = a3;
}

- (BOOL)simulateStatusBannerDevice
{
  return self->_simulateStatusBannerDevice;
}

- (void)setDebugMorphTransitions:(BOOL)a3
{
  self->_debugMorphTransitions = a3;
}

- (BOOL)debugMorphTransitions
{
  return self->_debugMorphTransitions;
}

- (void)setBlurFilterEnabled:(BOOL)a3
{
  self->_blurFilterEnabled = a3;
}

- (BOOL)blurFilterEnabled
{
  return self->_blurFilterEnabled;
}

- (void)setDebugShadowsEnabled:(BOOL)a3
{
  self->_debugShadowsEnabled = a3;
}

- (BOOL)debugShadowsEnabled
{
  return self->_debugShadowsEnabled;
}

- (void)setBannerFramesEnabled:(BOOL)a3
{
  self->_bannerFramesEnabled = a3;
}

- (BOOL)bannerFramesEnabled
{
  return self->_bannerFramesEnabled;
}

- (void)setGestureSettings:(id)a3
{
}

- (WFBannerGestureSettings)gestureSettings
{
  return self->_gestureSettings;
}

- (void)setTransitionSettings:(id)a3
{
}

- (WFBannerTransitionSettings)transitionSettings
{
  return self->_transitionSettings;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)WFBannerPrototypeSettings;
  [(WFBannerPrototypeSettings *)&v3 setDefaultValues];
  [(WFBannerPrototypeSettings *)self setBannerFramesEnabled:0];
  [(WFBannerPrototypeSettings *)self setDebugShadowsEnabled:0];
  [(WFBannerPrototypeSettings *)self setBlurFilterEnabled:1];
  [(WFBannerPrototypeSettings *)self setDebugMorphTransitions:0];
  [(WFBannerPrototypeSettings *)self setSimulateStatusBannerDevice:0];
  [(WFBannerPrototypeSettings *)self setUseRemoteAlertsForActionInterfaceDialogRequests:1];
}

+ (id)settingsControllerModule
{
  v2 = +[PTRestoreDefaultSettingsRowAction actionWithSettingsKeyPath:0];
  objc_super v3 = +[PTButtonRow rowWithTitle:@"Restore Defaults" action:v2];
  v27 = v3;
  v4 = +[NSArray arrayWithObjects:&v27 count:1];
  v5 = +[PTModule sectionWithRows:v4];

  v6 = +[PTDrillDownRow rowWithTitle:@"Transition" childSettingsKeyPath:@"transitionSettings"];
  v26[0] = v6;
  v7 = +[PTDrillDownRow rowWithTitle:@"Gesture" childSettingsKeyPath:@"gestureSettings"];
  v26[1] = v7;
  v8 = +[NSArray arrayWithObjects:v26 count:2];
  v9 = +[PTModule sectionWithRows:v8 title:0];

  id v10 = objc_alloc((Class)NSMutableArray);
  v11 = +[PTSwitchRow rowWithTitle:@"Show Banner Frames" valueKeyPath:@"bannerFramesEnabled"];
  v25[0] = v11;
  v12 = +[PTSwitchRow rowWithTitle:@"Shadow Debugging" valueKeyPath:@"debugShadowsEnabled"];
  v25[1] = v12;
  v13 = +[PTSwitchRow rowWithTitle:@"Blur Filter" valueKeyPath:@"blurFilterEnabled"];
  v25[2] = v13;
  v14 = +[PTSwitchRow rowWithTitle:@"Debug Morph Transitions" valueKeyPath:@"debugMorphTransitions"];
  v25[3] = v14;
  v15 = +[PTSwitchRow rowWithTitle:@"Remote Alert Action Interface" valueKeyPath:@"useRemoteAlertsForActionInterfaceDialogRequests"];
  v25[4] = v15;
  v16 = +[NSArray arrayWithObjects:v25 count:5];
  id v17 = [v10 initWithArray:v16];

  v18 = +[WFDevice currentDevice];
  LODWORD(v12) = [v18 hasSystemAperture];

  if (v12)
  {
    v19 = +[PTSwitchRow rowWithTitle:@"Test Status Banners" valueKeyPath:@"simulateStatusBannerDevice"];
    [v17 addObject:v19];
  }
  v20 = +[PTModule sectionWithRows:v17 title:@"Debug"];
  v24[0] = v5;
  v24[1] = v9;
  v24[2] = v20;
  v21 = +[NSArray arrayWithObjects:v24 count:3];
  v22 = +[PTModule moduleWithTitle:@"Custom Banner Transitions" contents:v21];

  return v22;
}

+ (id)sharedSettings
{
  if (qword_100044090 != -1) {
    dispatch_once(&qword_100044090, &stru_1000388E8);
  }
  v2 = (void *)qword_100044088;

  return v2;
}

@end