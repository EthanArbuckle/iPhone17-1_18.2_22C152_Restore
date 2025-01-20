@interface MKFullDeveloperPlaceCardRemoteUIHostViewController
- (id)initAsAccessoryWithMapItem:(id)a3 dismissButtonDisplayed:(BOOL)a4;
- (id)initAsStandAloneWithMapItem:(id)a3 dismissButtonDisplayed:(BOOL)a4 hideInlineMap:(BOOL)a5;
- (void)_configureConnection:(id)a3;
@end

@implementation MKFullDeveloperPlaceCardRemoteUIHostViewController

- (id)initAsAccessoryWithMapItem:(id)a3 dismissButtonDisplayed:(BOOL)a4
{
  id v7 = a3;
  v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA43158];
  v9 = objc_alloc_init(MKFullDeveloperPlaceCardLoadingView);
  v12.receiver = self;
  v12.super_class = (Class)MKFullDeveloperPlaceCardRemoteUIHostViewController;
  v10 = [(MKPlaceCardRemoteUIHostViewController *)&v12 initWithSceneIdentifier:@"MKFullAccessoryPlaceCardScene" remoteObjectInterface:v8 placeholderView:v9];

  if (v10)
  {
    v10->_isStandAlonePlaceCard = 0;
    objc_storeStrong((id *)&v10->_mapItem, a3);
    v10->_dismissButtonDisplayed = a4;
    v10->_hideInlineMap = 1;
  }

  return v10;
}

- (id)initAsStandAloneWithMapItem:(id)a3 dismissButtonDisplayed:(BOOL)a4 hideInlineMap:(BOOL)a5
{
  id v9 = a3;
  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA43730];
  v11 = objc_alloc_init(MKFullDeveloperPlaceCardLoadingView);
  v14.receiver = self;
  v14.super_class = (Class)MKFullDeveloperPlaceCardRemoteUIHostViewController;
  objc_super v12 = [(MKPlaceCardRemoteUIHostViewController *)&v14 initWithSceneIdentifier:@"MKStandAlonePlaceCardScene" remoteObjectInterface:v10 placeholderView:v11];

  if (v12)
  {
    v12->_isStandAlonePlaceCard = 1;
    objc_storeStrong((id *)&v12->_mapItem, a3);
    v12->_dismissButtonDisplayed = a4;
    v12->_hideInlineMap = a5;
  }

  return v12;
}

- (void)_configureConnection:(id)a3
{
  BOOL isStandAlonePlaceCard = self->_isStandAlonePlaceCard;
  v5 = [a3 remoteObjectProxy];
  v6 = [(MKMapItem *)self->_mapItem _geoMapItemStorageForPersistence];
  if (isStandAlonePlaceCard)
  {
    BOOL hideInlineMap = self->_hideInlineMap;
    v8 = +[MKSystemController sharedInstance];
    v10.receiver = self;
    v10.super_class = (Class)MKFullDeveloperPlaceCardRemoteUIHostViewController;
    objc_msgSend(v5, "configureWithMapItemStorage:hideInlineMap:idiom:interfaceStyle:", v6, hideInlineMap, objc_msgSend(v8, "userInterfaceIdiom"), -[MKPlaceCardRemoteUIHostViewController _mapkit_userInterfaceStyle](&v10, sel__mapkit_userInterfaceStyle));
  }
  else
  {
    v8 = +[MKSystemController sharedInstance];
    v9.receiver = self;
    v9.super_class = (Class)MKFullDeveloperPlaceCardRemoteUIHostViewController;
    objc_msgSend(v5, "configureWithMapItemStorage:idiom:interfaceStyle:", v6, objc_msgSend(v8, "userInterfaceIdiom"), -[MKPlaceCardRemoteUIHostViewController _mapkit_userInterfaceStyle](&v9, sel__mapkit_userInterfaceStyle));
  }
}

- (void).cxx_destruct
{
}

@end