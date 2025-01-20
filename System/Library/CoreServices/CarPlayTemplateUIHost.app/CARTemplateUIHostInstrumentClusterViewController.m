@interface CARTemplateUIHostInstrumentClusterViewController
+ (id)_stringForClusterSetting:(unint64_t)a3;
- (BOOL)invalidated;
- (CARTemplateUIHostInstrumentClusterViewController)initWithWindowScene:(id)a3 templateInstance:(id)a4 bundleIdentifier:(id)a5;
- (CARTemplateUIInstrumentClusterSceneViewController)sceneViewController;
- (CPSInstrumentClusterCardViewController)mapViewETATray;
- (CPSInstrumentClusterCardViewController)navigationViewController;
- (CPSInstrumentClusterViewController)guidanceCardViewController;
- (CPSTemplateInstance)templateInstance;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBScene)scene;
- (NSString)bundleIdentifier;
- (UILabel)label;
- (UILabel)settingsLabel;
- (id)_clusterWindow;
- (id)_lastZoomDirectionString;
- (int64_t)lastZoomDirection;
- (unint64_t)itemType;
- (unint64_t)layoutJustification;
- (unint64_t)showCompassSetting;
- (unint64_t)showETASetting;
- (unint64_t)showSpeedLimitSetting;
- (unint64_t)zoomCount;
- (void)_addChildSceneViewController;
- (void)_addGuidanceCardViewController;
- (void)_addNavigationViewController;
- (void)_addViewControllerForMapView;
- (void)_handleItemTypeUpdate;
- (void)_removeChildSceneViewController;
- (void)_removeGuidanceCardViewController;
- (void)_removeNavigationViewController;
- (void)_removeViewControllerForMapView;
- (void)_updateSettingsText;
- (void)clusterWindow:(id)a3 didChangeCompassSetting:(unint64_t)a4;
- (void)clusterWindow:(id)a3 didChangeETASetting:(unint64_t)a4;
- (void)clusterWindow:(id)a3 didChangeItemType:(unint64_t)a4;
- (void)clusterWindow:(id)a3 didChangeLayoutJustification:(unint64_t)a4;
- (void)clusterWindow:(id)a3 didChangeSpeedLimitSetting:(unint64_t)a4;
- (void)clusterWindow:(id)a3 didZoomInDirection:(int64_t)a4;
- (void)invalidate;
- (void)setBundleIdentifier:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setGuidanceCardViewController:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setItemType:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setLastZoomDirection:(int64_t)a3;
- (void)setLayoutJustification:(unint64_t)a3;
- (void)setMapViewETATray:(id)a3;
- (void)setNavigationViewController:(id)a3;
- (void)setScene:(id)a3;
- (void)setSceneViewController:(id)a3;
- (void)setSettingsLabel:(id)a3;
- (void)setShowCompassSetting:(unint64_t)a3;
- (void)setShowETASetting:(unint64_t)a3;
- (void)setShowSpeedLimitSetting:(unint64_t)a3;
- (void)setTemplateInstance:(id)a3;
- (void)setZoomCount:(unint64_t)a3;
- (void)templateInstanceDidFinishClusterSetup:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CARTemplateUIHostInstrumentClusterViewController

- (CARTemplateUIHostInstrumentClusterViewController)initWithWindowScene:(id)a3 templateInstance:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CARTemplateUIHostInstrumentClusterViewController;
  v11 = [(CARTemplateUIHostInstrumentClusterViewController *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_templateInstance, a4);
    [(CPSTemplateInstance *)v12->_templateInstance setClusterSetupDelegate:v12];
    v13 = (NSString *)[v10 copy];
    bundleIdentifier = v12->_bundleIdentifier;
    v12->_bundleIdentifier = v13;

    v15 = [v8 _FBSScene];
    v16 = [v15 settings];
    uint64_t v17 = [v16 displayConfiguration];
    displayConfiguration = v12->_displayConfiguration;
    v12->_displayConfiguration = (FBSDisplayConfiguration *)v17;
  }
  return v12;
}

- (void)invalidate
{
  [(CARTemplateUIHostInstrumentClusterViewController *)self setInvalidated:1];
  id v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self sceneViewController];
  [v3 invalidate];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CARTemplateUIHostInstrumentClusterViewController;
  [(CARTemplateUIHostInstrumentClusterViewController *)&v6 viewDidLoad];
  objc_opt_class();
  id v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self view];
  id v4 = [v3 window];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    -[CARTemplateUIHostInstrumentClusterViewController setShowETASetting:](self, "setShowETASetting:", [v5 etaSetting]);
    -[CARTemplateUIHostInstrumentClusterViewController setShowCompassSetting:](self, "setShowCompassSetting:", [v5 compassSetting]);
    -[CARTemplateUIHostInstrumentClusterViewController setShowSpeedLimitSetting:](self, "setShowSpeedLimitSetting:", [v5 speedLimitSetting]);
    -[CARTemplateUIHostInstrumentClusterViewController setItemType:](self, "setItemType:", [v5 itemType]);
    [(CARTemplateUIHostInstrumentClusterViewController *)self _handleItemTypeUpdate];
  }
}

- (void)_handleItemTypeUpdate
{
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self itemType];
  switch(v3)
  {
    case 3uLL:
      [(CARTemplateUIHostInstrumentClusterViewController *)self _removeGuidanceCardViewController];
      [(CARTemplateUIHostInstrumentClusterViewController *)self _removeViewControllerForMapView];
      [(CARTemplateUIHostInstrumentClusterViewController *)self _addNavigationViewController];
      break;
    case 2uLL:
      [(CARTemplateUIHostInstrumentClusterViewController *)self _removeNavigationViewController];
      [(CARTemplateUIHostInstrumentClusterViewController *)self _removeViewControllerForMapView];
      [(CARTemplateUIHostInstrumentClusterViewController *)self _addGuidanceCardViewController];
      break;
    case 1uLL:
      [(CARTemplateUIHostInstrumentClusterViewController *)self _removeNavigationViewController];
      [(CARTemplateUIHostInstrumentClusterViewController *)self _removeGuidanceCardViewController];
      [(CARTemplateUIHostInstrumentClusterViewController *)self _addViewControllerForMapView];
      break;
  }
}

- (void)setScene:(id)a3
{
  id v4 = a3;
  id v5 = [(CARTemplateUIHostInstrumentClusterViewController *)self sceneViewController];
  [v5 setScene:v4];
}

- (FBScene)scene
{
  v2 = [(CARTemplateUIHostInstrumentClusterViewController *)self sceneViewController];
  unint64_t v3 = [v2 scene];

  return (FBScene *)v3;
}

- (void)_addChildSceneViewController
{
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self sceneViewController];

  if (!v3)
  {
    id v4 = [CARTemplateUIInstrumentClusterSceneViewController alloc];
    id v5 = [(CARTemplateUIHostInstrumentClusterViewController *)self view];
    objc_super v6 = [v5 window];
    v7 = [v6 windowScene];
    id v8 = [(CARTemplateUIHostInstrumentClusterViewController *)self templateInstance];
    id v9 = [(CARTemplateUIHostInstrumentClusterViewController *)self bundleIdentifier];
    id v10 = [(CARTemplateUISceneViewController *)v4 initWithWindowScene:v7 templateInstance:v8 bundleIdentifier:v9];

    [(CARTemplateUIHostInstrumentClusterViewController *)self setSceneViewController:v10];
    v11 = [(CARTemplateUIHostInstrumentClusterViewController *)self view];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000AA10;
    v13[3] = &unk_10001C600;
    v14 = v10;
    v15 = self;
    v12 = v10;
    [(CARTemplateUIHostInstrumentClusterViewController *)self bs_addChildViewController:v12 withSuperview:v11 animated:0 transitionBlock:v13];
  }
}

- (void)_addViewControllerForMapView
{
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self templateInstance];
  id v4 = [v3 instrumentClusterMapETAViewController];

  if (!self->_mapViewETATray && self->_sceneViewController && v4 != 0)
  {
    objc_super v6 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding template content for Map type", buf, 2u);
    }

    [(CARTemplateUIHostInstrumentClusterViewController *)self setMapViewETATray:v4];
    objc_msgSend(v4, "setShowETA:", (id)-[CARTemplateUIHostInstrumentClusterViewController showETASetting](self, "showETASetting") == (id)1);
    v7 = [(CARTemplateUIHostInstrumentClusterViewController *)self view];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000AEDC;
    v8[3] = &unk_10001C600;
    id v9 = v4;
    id v10 = self;
    [(CARTemplateUIHostInstrumentClusterViewController *)self bs_addChildViewController:v9 withSuperview:v7 animated:0 transitionBlock:v8];
  }
}

- (void)_removeViewControllerForMapView
{
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self mapViewETATray];

  if (v3)
  {
    id v4 = [(CARTemplateUIHostInstrumentClusterViewController *)self mapViewETATray];
    [(CARTemplateUIHostInstrumentClusterViewController *)self bs_removeChildViewController:v4];

    [(CARTemplateUIHostInstrumentClusterViewController *)self setMapViewETATray:0];
  }
}

- (void)_addGuidanceCardViewController
{
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self guidanceCardViewController];

  if (!v3)
  {
    id v4 = [(CARTemplateUIHostInstrumentClusterViewController *)self templateInstance];
    id v5 = [(CARTemplateUIHostInstrumentClusterViewController *)self displayConfiguration];
    objc_super v6 = [v5 hardwareIdentifier];
    v7 = [v4 instrumentClusterViewControllerForDisplayIdentifier:v6];

    [(CARTemplateUIHostInstrumentClusterViewController *)self setGuidanceCardViewController:v7];
    id v8 = [(CARTemplateUIHostInstrumentClusterViewController *)self view];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000B2C0;
    v10[3] = &unk_10001C600;
    id v11 = v7;
    v12 = self;
    id v9 = v7;
    [(CARTemplateUIHostInstrumentClusterViewController *)self bs_addChildViewController:v9 withSuperview:v8 animated:0 transitionBlock:v10];
  }
}

- (void)_addNavigationViewController
{
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self templateInstance];
  id v4 = [v3 instrumentClusterCardViewController];

  if (!self->_navigationViewController && self->_sceneViewController && v4 != 0)
  {
    objc_super v6 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding template content for Navigation App type", buf, 2u);
    }

    [(CARTemplateUIHostInstrumentClusterViewController *)self setNavigationViewController:v4];
    objc_msgSend(v4, "setShowETA:", (id)-[CARTemplateUIHostInstrumentClusterViewController showETASetting](self, "showETASetting") == (id)1);
    v7 = [(CARTemplateUIHostInstrumentClusterViewController *)self view];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000B664;
    v8[3] = &unk_10001C600;
    id v9 = v4;
    id v10 = self;
    [(CARTemplateUIHostInstrumentClusterViewController *)self bs_addChildViewController:v9 withSuperview:v7 animated:0 transitionBlock:v8];
  }
}

- (void)_removeNavigationViewController
{
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self navigationViewController];

  if (v3)
  {
    id v4 = [(CARTemplateUIHostInstrumentClusterViewController *)self navigationViewController];
    [(CARTemplateUIHostInstrumentClusterViewController *)self bs_removeChildViewController:v4];

    [(CARTemplateUIHostInstrumentClusterViewController *)self setNavigationViewController:0];
  }
}

- (void)_removeGuidanceCardViewController
{
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self guidanceCardViewController];

  if (v3)
  {
    id v4 = [(CARTemplateUIHostInstrumentClusterViewController *)self guidanceCardViewController];
    [(CARTemplateUIHostInstrumentClusterViewController *)self bs_removeChildViewController:v4];

    [(CARTemplateUIHostInstrumentClusterViewController *)self setGuidanceCardViewController:0];
  }
}

- (void)_removeChildSceneViewController
{
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self sceneViewController];

  if (v3)
  {
    id v4 = [(CARTemplateUIHostInstrumentClusterViewController *)self sceneViewController];
    [(CARTemplateUIHostInstrumentClusterViewController *)self bs_removeChildViewController:v4];

    [(CARTemplateUIHostInstrumentClusterViewController *)self setSceneViewController:0];
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CARTemplateUIHostInstrumentClusterViewController;
  [(CARTemplateUIHostInstrumentClusterViewController *)&v6 viewDidLayoutSubviews];
  [(CARTemplateUIHostInstrumentClusterViewController *)self _addChildSceneViewController];
  objc_opt_class();
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self view];
  id v4 = [v3 window];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    -[CARTemplateUIHostInstrumentClusterViewController setShowETASetting:](self, "setShowETASetting:", [v5 etaSetting]);
    -[CARTemplateUIHostInstrumentClusterViewController setShowCompassSetting:](self, "setShowCompassSetting:", [v5 compassSetting]);
    -[CARTemplateUIHostInstrumentClusterViewController setShowSpeedLimitSetting:](self, "setShowSpeedLimitSetting:", [v5 speedLimitSetting]);
    -[CARTemplateUIHostInstrumentClusterViewController setItemType:](self, "setItemType:", [v5 itemType]);
    [(CARTemplateUIHostInstrumentClusterViewController *)self _handleItemTypeUpdate];
  }
  [(CARTemplateUIHostInstrumentClusterViewController *)self _updateSettingsText];
}

- (id)_clusterWindow
{
  objc_opt_class();
  unint64_t v3 = [(CARTemplateUIHostInstrumentClusterViewController *)self view];
  id v4 = [v3 window];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)_updateSettingsText
{
  id v10 = [(CARTemplateUIHostInstrumentClusterViewController *)self _clusterWindow];
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "_stringForClusterSetting:", objc_msgSend(v10, "etaSetting"));
  id v4 = objc_msgSend((id)objc_opt_class(), "_stringForClusterSetting:", objc_msgSend(v10, "compassSetting"));
  id v5 = objc_msgSend((id)objc_opt_class(), "_stringForClusterSetting:", objc_msgSend(v10, "speedLimitSetting"));
  objc_super v6 = [(CARTemplateUIHostInstrumentClusterViewController *)self _lastZoomDirectionString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Settings: showsETA: %@; showsCompass: %@; showsSpeedLimit: %@; last zoom direction: %@ count: %lu",
    v3,
    v4,
    v5,
    v6,
  v7 = [(CARTemplateUIHostInstrumentClusterViewController *)self zoomCount]);

  id v8 = [(CARTemplateUIHostInstrumentClusterViewController *)self settingsLabel];
  [v8 setText:v7];

  id v9 = [(CARTemplateUIHostInstrumentClusterViewController *)self settingsLabel];
  [v9 sizeToFit];
}

+ (id)_stringForClusterSetting:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"unspecified";
  }
  else {
    return *(&off_10001C640 + a3 - 1);
  }
}

- (id)_lastZoomDirectionString
{
  int64_t v2 = [(CARTemplateUIHostInstrumentClusterViewController *)self lastZoomDirection];
  CFStringRef v3 = @"None";
  if (v2 == 2) {
    CFStringRef v3 = @"Out";
  }
  if (v2 == 1) {
    return @"In";
  }
  else {
    return (id)v3;
  }
}

- (void)clusterWindow:(id)a3 didZoomInDirection:(int64_t)a4
{
  id v11 = a3;
  if (self->_lastZoomDirection == a4)
  {
    uint64_t v6 = (uint64_t)[(CARTemplateUIHostInstrumentClusterViewController *)self zoomCount] + 1;
  }
  else
  {
    self->_lastZoomDirection = a4;
    uint64_t v6 = 1;
  }
  [(CARTemplateUIHostInstrumentClusterViewController *)self setZoomCount:v6];
  [(CARTemplateUIHostInstrumentClusterViewController *)self _updateSettingsText];
  v7 = [(CARTemplateUIHostInstrumentClusterViewController *)self scene];

  if (v7)
  {
    id v8 = [objc_alloc((Class)CRSUIClusterZoomAction) initWithZoomDirection:a4];
    id v9 = [(CARTemplateUIHostInstrumentClusterViewController *)self scene];
    id v10 = +[NSSet setWithObject:v8];
    [v9 sendActions:v10];
  }
}

- (void)clusterWindow:(id)a3 didChangeETASetting:(unint64_t)a4
{
  [(CARTemplateUIHostInstrumentClusterViewController *)self _updateSettingsText];
  navigationViewController = self->_navigationViewController;
  if (a4 == 1)
  {
    if (!navigationViewController)
    {
      navigationViewController = self->_mapViewETATray;
      if (!navigationViewController) {
        return;
      }
    }
    uint64_t v7 = 1;
  }
  else
  {
    if (!navigationViewController)
    {
      navigationViewController = self->_mapViewETATray;
      if (!navigationViewController) {
        return;
      }
    }
    uint64_t v7 = 0;
  }

  [(CPSInstrumentClusterCardViewController *)navigationViewController setShowETA:v7];
}

- (void)clusterWindow:(id)a3 didChangeCompassSetting:(unint64_t)a4
{
  [(CARTemplateUIHostInstrumentClusterViewController *)self _updateSettingsText];
  uint64_t v6 = [(CARTemplateUIHostInstrumentClusterViewController *)self scene];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000BFA4;
  v7[3] = &unk_10001C620;
  v7[4] = a4;
  [v6 updateClusterSceneSettingsWithBlock:v7];
}

- (void)clusterWindow:(id)a3 didChangeSpeedLimitSetting:(unint64_t)a4
{
  [(CARTemplateUIHostInstrumentClusterViewController *)self _updateSettingsText];
  uint64_t v6 = [(CARTemplateUIHostInstrumentClusterViewController *)self scene];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C044;
  v7[3] = &unk_10001C620;
  v7[4] = a4;
  [v6 updateClusterSceneSettingsWithBlock:v7];
}

- (void)clusterWindow:(id)a3 didChangeItemType:(unint64_t)a4
{
  [(CARTemplateUIHostInstrumentClusterViewController *)self setItemType:a4];
  [(CARTemplateUIHostInstrumentClusterViewController *)self _handleItemTypeUpdate];
  uint64_t v6 = [(CARTemplateUIHostInstrumentClusterViewController *)self scene];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C0F0;
  v7[3] = &unk_10001C620;
  v7[4] = a4;
  [v6 updateClusterSceneSettingsWithBlock:v7];
}

- (void)clusterWindow:(id)a3 didChangeLayoutJustification:(unint64_t)a4
{
  [(CARTemplateUIHostInstrumentClusterViewController *)self setLayoutJustification:a4];
  uint64_t v6 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "clusterWindow:didChangeLayoutJustification %@", buf, 0xCu);
  }
  id v8 = [(CARTemplateUIHostInstrumentClusterViewController *)self navigationViewController];

  if (a4 && v8)
  {
    switch(a4)
    {
      case 3uLL:
        id v9 = [(CARTemplateUIHostInstrumentClusterViewController *)self navigationViewController];
        id v10 = v9;
        uint64_t v11 = 3;
        goto LABEL_11;
      case 2uLL:
        id v9 = [(CARTemplateUIHostInstrumentClusterViewController *)self navigationViewController];
        id v10 = v9;
        uint64_t v11 = 2;
        goto LABEL_11;
      case 1uLL:
        id v9 = [(CARTemplateUIHostInstrumentClusterViewController *)self navigationViewController];
        id v10 = v9;
        uint64_t v11 = 1;
LABEL_11:
        [v9 setLayoutOverride:v11];

        break;
    }
  }
  v12 = [(CARTemplateUIHostInstrumentClusterViewController *)self scene];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C2B8;
  v13[3] = &unk_10001C620;
  void v13[4] = a4;
  [v12 updateClusterSceneSettingsWithBlock:v13];
}

- (void)templateInstanceDidFinishClusterSetup:(id)a3
{
  id v4 = a3;
  id v5 = [(CARTemplateUIHostInstrumentClusterViewController *)self templateInstance];

  if (v5 == v4)
  {
    uint64_t v6 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ready to draw cluster template content", v7, 2u);
    }

    [(CARTemplateUIHostInstrumentClusterViewController *)self _handleItemTypeUpdate];
  }
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setDisplayConfiguration:(id)a3
{
}

- (CPSTemplateInstance)templateInstance
{
  return self->_templateInstance;
}

- (void)setTemplateInstance:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (unint64_t)showETASetting
{
  return self->_showETASetting;
}

- (void)setShowETASetting:(unint64_t)a3
{
  self->_showETASetting = a3;
}

- (unint64_t)showSpeedLimitSetting
{
  return self->_showSpeedLimitSetting;
}

- (void)setShowSpeedLimitSetting:(unint64_t)a3
{
  self->_showSpeedLimitSetting = a3;
}

- (unint64_t)showCompassSetting
{
  return self->_showCompassSetting;
}

- (void)setShowCompassSetting:(unint64_t)a3
{
  self->_showCompassSetting = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (unint64_t)layoutJustification
{
  return self->_layoutJustification;
}

- (void)setLayoutJustification:(unint64_t)a3
{
  self->_layoutJustification = a3;
}

- (UILabel)settingsLabel
{
  return self->_settingsLabel;
}

- (void)setSettingsLabel:(id)a3
{
}

- (int64_t)lastZoomDirection
{
  return self->_lastZoomDirection;
}

- (void)setLastZoomDirection:(int64_t)a3
{
  self->_lastZoomDirection = a3;
}

- (unint64_t)zoomCount
{
  return self->_zoomCount;
}

- (void)setZoomCount:(unint64_t)a3
{
  self->_zoomCount = a3;
}

- (CARTemplateUIInstrumentClusterSceneViewController)sceneViewController
{
  return self->_sceneViewController;
}

- (void)setSceneViewController:(id)a3
{
}

- (CPSInstrumentClusterViewController)guidanceCardViewController
{
  return self->_guidanceCardViewController;
}

- (void)setGuidanceCardViewController:(id)a3
{
}

- (CPSInstrumentClusterCardViewController)navigationViewController
{
  return self->_navigationViewController;
}

- (void)setNavigationViewController:(id)a3
{
}

- (CPSInstrumentClusterCardViewController)mapViewETATray
{
  return self->_mapViewETATray;
}

- (void)setMapViewETATray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewETATray, 0);
  objc_storeStrong((id *)&self->_navigationViewController, 0);
  objc_storeStrong((id *)&self->_guidanceCardViewController, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_settingsLabel, 0);
  objc_storeStrong((id *)&self->_templateInstance, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end