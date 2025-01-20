@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC16CarPlayWallpaper15CPWAssetLibrary)assetLibrary;
- (_TtC16CarPlayWallpaper22CPWWallpaperImageCache)wallpaperCache;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)setAssetLibrary:(id)a3;
- (void)setWallpaperCache:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = objc_alloc_init(_TtC16CarPlayWallpaper15CPWAssetLibrary);
  [(AppDelegate *)self setAssetLibrary:v5];

  if (MGGetBoolAnswer()) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = 9;
  }
  v7 = [[_TtC16CarPlayWallpaper19CPWMappedImageCache alloc] initWithCacheID:@"com.apple.CarPlayApp.wallpaper-images" persistenceOptions:v6];
  v8 = [_TtC16CarPlayWallpaper22CPWPreferencesLRUCache alloc];
  v9 = [(CPWPreferencesLRUCache *)v8 initWithCapacity:6 domain:@"com.apple.CarPlayApp" versionKey:CRSUIWallpaperCacheVersionKey cachedDataKey:CRSUIWallpaperCacheImageIDsKey];
  v10 = [[_TtC16CarPlayWallpaper22CPWWallpaperImageCache alloc] initWithImageCache:v7 imageIDsCache:v9];
  [(AppDelegate *)self setWallpaperCache:v10];

  v11 = [(AppDelegate *)self wallpaperCache];
  [v11 updateCacheVersionIfNeededWithVersion:CRSUIWallpaperCacheCurrentVersion];

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = a4;
  id v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = [v5 role];

  id v8 = [v6 initWithName:@"Default Configuration" sessionRole:v7];

  return v8;
}

- (_TtC16CarPlayWallpaper15CPWAssetLibrary)assetLibrary
{
  return self->_assetLibrary;
}

- (void)setAssetLibrary:(id)a3
{
}

- (_TtC16CarPlayWallpaper22CPWWallpaperImageCache)wallpaperCache
{
  return self->_wallpaperCache;
}

- (void)setWallpaperCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperCache, 0);

  objc_storeStrong((id *)&self->_assetLibrary, 0);
}

@end