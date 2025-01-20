@interface CPWAssetLibrary
- (NSString)wallpaperOverlayPath;
- (_TtC16CarPlayWallpaper15CPWAssetLibrary)init;
- (void)addObserver:(id)a3;
- (void)setWallpaperOverlayPath:(id)a3;
@end

@implementation CPWAssetLibrary

- (NSString)wallpaperOverlayPath
{
  v2 = (char *)self + OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_wallpaperOverlayPath;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setWallpaperOverlayPath:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  sub_10000CE28(v4, v6);
  v8 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC16CarPlayWallpaper15CPWAssetLibrary_wallpaperOverlayPath);
  swift_beginAccess();
  uint64_t *v8 = v4;
  v8[1] = v6;
  swift_bridgeObjectRelease();
  sub_10000D080();
}

- (_TtC16CarPlayWallpaper15CPWAssetLibrary)init
{
  return (_TtC16CarPlayWallpaper15CPWAssetLibrary *)CPWAssetLibrary.init()();
}

- (void)addObserver:(id)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  swift_release();
}

@end