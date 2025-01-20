@interface CPWMappedImageCache
- (NSArray)allImageKeys;
- (_TtC16CarPlayWallpaper19CPWMappedImageCache)init;
- (_TtC16CarPlayWallpaper19CPWMappedImageCache)initWithCacheID:(id)a3 persistenceOptions:(unint64_t)a4;
- (id)imageWith:(id)a3;
- (void)removeAllImagesWithCompletion:(id)a3;
- (void)removeImageWith:(id)a3;
- (void)saveWithImage:(id)a3 with:(id)a4 completion:(id)a5;
@end

@implementation CPWMappedImageCache

- (_TtC16CarPlayWallpaper19CPWMappedImageCache)initWithCacheID:(id)a3 persistenceOptions:(unint64_t)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = objc_allocWithZone((Class)BSUIMappedImageCache);
  v7 = self;
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v9 = (objc_class *)[v6 initWithUniqueIdentifier:v8];

  if (v9)
  {
    *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache) = v9;
    *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_persistenceOptions) = (Class)a4;

    v11.receiver = v7;
    v11.super_class = (Class)type metadata accessor for CPWMappedImageCache();
    return [(CPWMappedImageCache *)&v11 init];
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)imageWith:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache);
  v5 = self;
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v4 imageForKey:v6];

  swift_bridgeObjectRelease();

  return v7;
}

- (void)saveWithImage:(id)a3 with:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v7;
    id v7 = sub_10000C874;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  v13 = self;
  CPWMappedImageCache.save(image:with:completion:)((uint64_t)v12, v8, v10, (uint64_t)v7, v11);
  sub_10000C81C((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)removeImageWith:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache);
  v5 = self;
  NSString v6 = String._bridgeToObjectiveC()();
  [v4 removeImageForKey:v6];

  swift_bridgeObjectRelease();
}

- (void)removeAllImagesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10000C864;
  }
  else
  {
    uint64_t v5 = 0;
  }
  NSString v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v5;
  v10[4] = sub_10000CB20;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100007DB8;
  v10[3] = &unk_100014A40;
  uint64_t v8 = _Block_copy(v10);
  uint64_t v9 = self;
  sub_100009770((uint64_t)v4);
  swift_release();
  [v6 removeAllImagesWithCompletion:v8];
  _Block_release(v8);
  sub_10000C81C((uint64_t)v4);
}

- (NSArray)allImageKeys
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper19CPWMappedImageCache_cache);
  v3 = self;
  result = (NSArray *)[v2 allKeys];
  if (result)
  {
    uint64_t v5 = result;
    static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return (NSArray *)v6.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC16CarPlayWallpaper19CPWMappedImageCache)init
{
  result = (_TtC16CarPlayWallpaper19CPWMappedImageCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end