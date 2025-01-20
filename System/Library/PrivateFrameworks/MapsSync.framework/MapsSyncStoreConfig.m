@interface MapsSyncStoreConfig
+ (_TtC8MapsSync19MapsSyncStoreConfig)defaultStoreConfig;
+ (id)withConfigWithPrimary:(int64_t)a3 cache:(int64_t)a4;
- (_TtC8MapsSync19MapsSyncStoreConfig)init;
- (int64_t)cache;
- (int64_t)primary;
@end

@implementation MapsSyncStoreConfig

- (int64_t)primary
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_primary);
}

- (int64_t)cache
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_cache);
}

+ (id)withConfigWithPrimary:(int64_t)a3 cache:(int64_t)a4
{
  v6 = (objc_class *)type metadata accessor for MapsSyncStoreConfig();
  v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_primary] = a3;
  *(void *)&v7[OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_cache] = a4;
  v10.receiver = v7;
  v10.super_class = v6;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  return v8;
}

+ (_TtC8MapsSync19MapsSyncStoreConfig)defaultStoreConfig
{
  id v2 = _s8MapsSync0aB11StoreConfigC07defaultcD0ACvgZ_0();
  return (_TtC8MapsSync19MapsSyncStoreConfig *)v2;
}

- (_TtC8MapsSync19MapsSyncStoreConfig)init
{
  result = (_TtC8MapsSync19MapsSyncStoreConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end