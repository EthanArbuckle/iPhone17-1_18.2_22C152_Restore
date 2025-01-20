@interface MKCompactDeveloperPlaceCardRemoteUIHostViewController
- (MKCompactDeveloperPlaceCardRemoteUIHostViewController)initWithMapItem:(id)a3;
- (void)_configureConnection:(id)a3;
@end

@implementation MKCompactDeveloperPlaceCardRemoteUIHostViewController

- (MKCompactDeveloperPlaceCardRemoteUIHostViewController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA43158];
  v7 = objc_alloc_init(MKCompactDeveloperPlaceCardLoadingView);
  v10.receiver = self;
  v10.super_class = (Class)MKCompactDeveloperPlaceCardRemoteUIHostViewController;
  v8 = [(MKPlaceCardRemoteUIHostViewController *)&v10 initWithSceneIdentifier:@"MKCompactAccessoryPlaceCardScene" remoteObjectInterface:v6 placeholderView:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_mapItem, a3);
  }

  return v8;
}

- (void)_configureConnection:(id)a3
{
  v4 = [a3 remoteObjectProxy];
  id v5 = [(MKMapItem *)self->_mapItem _geoMapItemStorageForPersistence];
  v6 = +[MKSystemController sharedInstance];
  v7.receiver = self;
  v7.super_class = (Class)MKCompactDeveloperPlaceCardRemoteUIHostViewController;
  objc_msgSend(v4, "configureWithMapItemStorage:idiom:interfaceStyle:", v5, objc_msgSend(v6, "userInterfaceIdiom"), -[MKPlaceCardRemoteUIHostViewController _mapkit_userInterfaceStyle](&v7, sel__mapkit_userInterfaceStyle));
}

- (void).cxx_destruct
{
}

@end