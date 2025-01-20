@interface CARTemplateUIInstrumentClusterSceneViewController
+ (Class)sceneSpecificationClass;
+ (id)sceneIdentifierSuffix;
- (id)workspaceIdentifier;
- (void)prepareSettings:(id)a3;
- (void)setScene:(id)a3;
@end

@implementation CARTemplateUIInstrumentClusterSceneViewController

+ (id)sceneIdentifierSuffix
{
  return @":instrumentCluster";
}

+ (Class)sceneSpecificationClass
{
  return (Class)objc_opt_class();
}

- (void)prepareSettings:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CARTemplateUIInstrumentClusterSceneViewController;
  [(CARTemplateUISceneViewController *)&v13 prepareSettings:v4];
  objc_opt_class();
  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  objc_opt_class();
  v7 = [(CARTemplateUISceneViewController *)self windowScene];
  v8 = [v7 _FBSScene];
  id v9 = [v8 settings];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  objc_msgSend(v6, "setItemType:", objc_msgSend(v10, "itemType"));
  objc_msgSend(v6, "setShowsSpeedLimit:", objc_msgSend(v10, "showsSpeedLimit"));
  objc_msgSend(v6, "setShowsCompass:", objc_msgSend(v10, "showsCompass"));
  objc_msgSend(v6, "setLayoutJustification:", objc_msgSend(v10, "layoutJustification"));
  v11 = [(CARTemplateUISceneViewController *)self templateInstance];
  v12 = [v11 instrumentClusterEndpoint];
  [v6 setTemplateEndpoint:v12];

  objc_msgSend(v6, "setMapStyle:", -[CARTemplateUISceneViewController mapStyle](self, "mapStyle"));
}

- (void)setScene:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CARTemplateUIInstrumentClusterSceneViewController;
  [(CARTemplateUISceneViewController *)&v6 setScene:v4];
  if (v4)
  {
    id v5 = [(CARTemplateUISceneViewController *)self templateInstance];
    [v5 setInstrumentClusterScene:v4];
  }
}

- (id)workspaceIdentifier
{
  return @"kCARTemplateUIClusterWorkspaceIdentifier";
}

@end