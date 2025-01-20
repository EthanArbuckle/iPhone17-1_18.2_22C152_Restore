@interface MapsSyncBatch
+ (void)commitWithItems:(id)a3 completion:(id)a4;
+ (void)deleteWithItems:(id)a3 completion:(id)a4;
+ (void)mapObjectsByContextWithItems:(id)a3 completion:(id)a4;
- (_TtC8MapsSync13MapsSyncBatch)init;
@end

@implementation MapsSyncBatch

+ (void)commitWithItems:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  type metadata accessor for MapsSyncBaseItem();
  unint64_t v5 = sub_1A709D4D8();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  swift_getObjCClassMetadata();
  static MapsSyncBatch.commit(items:completion:)(v5, (uint64_t)sub_1A6F6D7E4, v6);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)mapObjectsByContextWithItems:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  type metadata accessor for MapsSyncBaseItem();
  unint64_t v5 = sub_1A709D4D8();
  _Block_copy(v4);
  sub_1A6FA44B8(v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
  swift_bridgeObjectRelease();
}

+ (void)deleteWithItems:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  type metadata accessor for MapsSyncBaseItem();
  unint64_t v5 = sub_1A709D4D8();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1A6FA5708(v5, (uint64_t)sub_1A6F339E0, v6, ObjCClassMetadata);
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC8MapsSync13MapsSyncBatch)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapsSyncBatch();
  return [(MapsSyncBatch *)&v3 init];
}

@end