@interface CARTemplateUIDashboardSceneViewController
+ (Class)sceneSpecificationClass;
+ (id)sceneIdentifierSuffix;
- (id)workspaceIdentifier;
- (void)contentReady;
- (void)prepareSettings:(id)a3;
- (void)setScene:(id)a3;
@end

@implementation CARTemplateUIDashboardSceneViewController

+ (id)sceneIdentifierSuffix
{
  return @":dashboard";
}

- (void)contentReady
{
  objc_opt_class();
  v3 = [(CARTemplateUIDashboardSceneViewController *)self view];
  id v4 = [v3 window];
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  [v5 setContentReady];
}

- (void)prepareSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CARTemplateUIDashboardSceneViewController;
  [(CARTemplateUISceneViewController *)&v9 prepareSettings:v4];
  objc_opt_class();
  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v7 = [(CARTemplateUISceneViewController *)self templateInstance];
  v8 = [v7 dashboardEndpoint];
  [v6 setTemplateEndpoint:v8];
}

+ (Class)sceneSpecificationClass
{
  return (Class)objc_opt_class();
}

- (void)setScene:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CARTemplateUIDashboardSceneViewController;
  [(CARTemplateUISceneViewController *)&v6 setScene:v4];
  if (v4)
  {
    id v5 = [(CARTemplateUISceneViewController *)self templateInstance];
    [v5 setMapWidgetScene:v4];
  }
}

- (id)workspaceIdentifier
{
  return @"kCARTemplateUIDashboardWorkspaceIdentifier";
}

@end