@interface PlayerItem
- (_TtC11CloudAssets10PlayerItem)initWithAsset:(id)a3 automaticallyLoadedAssetKeys:(id)a4;
- (id)copyWithZone:(void *)a3;
- (void)dealloc;
@end

@implementation PlayerItem

- (void)dealloc
{
  v2 = self;
  PlayerItem.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11CloudAssets10PlayerItem_id;
  uint64_t v3 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_unknownObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  sub_24A1883A4(v6);

  sub_24A1234A8(v6, v6[3]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_24A123580((uint64_t)v6);
  return v4;
}

- (_TtC11CloudAssets10PlayerItem)initWithAsset:(id)a3 automaticallyLoadedAssetKeys:(id)a4
{
  if (a4) {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a3;
  PlayerItem.init(asset:automaticallyLoadedAssetKeys:)();
}

@end