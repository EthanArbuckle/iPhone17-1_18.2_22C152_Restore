@interface CPWPreferencesLRUCache
- (NSArray)entries;
- (_TtC16CarPlayWallpaper22CPWPreferencesLRUCache)init;
- (_TtC16CarPlayWallpaper22CPWPreferencesLRUCache)initWithCapacity:(int64_t)a3 domain:(id)a4 versionKey:(id)a5 cachedDataKey:(id)a6;
- (int64_t)capacity;
- (int64_t)version;
- (void)markEntryAsRecentlyUsed:(id)a3;
- (void)setEntries:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation CPWPreferencesLRUCache

- (int64_t)capacity
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_capacity);
}

- (_TtC16CarPlayWallpaper22CPWPreferencesLRUCache)initWithCapacity:(int64_t)a3 domain:(id)a4 versionKey:(id)a5 cachedDataKey:(id)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_capacity) = (Class)a3;
  v8 = self;
  v9 = (objc_class *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain) = v9;
  v10 = (objc_class *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_versionKey) = v10;
  v11 = (objc_class *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_cachedDataKey) = v11;

  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for CPWPreferencesLRUCache();
  return [(CPWPreferencesLRUCache *)&v13 init];
}

- (int64_t)version
{
  return CFPreferencesGetAppIntegerValue(*(CFStringRef *)((char *)&self->super.isa+ OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_versionKey), *(CFStringRef *)((char *)&self->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain), 0);
}

- (void)setVersion:(int64_t)a3
{
  CFStringRef v3 = *(const __CFString **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_versionKey);
  v4 = self;
  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  CFPreferencesSetAppValue(v3, isa, *(CFStringRef *)((char *)&v4->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain));
}

- (NSArray)entries
{
  v2 = self;
  CPWPreferencesLRUCache.entries.getter();

  v3.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)setEntries:(id)a3
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  CFStringRef v4 = *(const __CFString **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_cachedDataKey);
  v5 = self;
  Class value = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  CFPreferencesSetAppValue(v4, value, *(CFStringRef *)((char *)&v5->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_domain));
}

- (void)markEntryAsRecentlyUsed:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  CPWPreferencesLRUCache.markEntryAsRecentlyUsed(_:)(v8);

  swift_bridgeObjectRelease();
}

- (_TtC16CarPlayWallpaper22CPWPreferencesLRUCache)init
{
  result = (_TtC16CarPlayWallpaper22CPWPreferencesLRUCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSArray v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CarPlayWallpaper22CPWPreferencesLRUCache_cachedDataKey);
}

@end