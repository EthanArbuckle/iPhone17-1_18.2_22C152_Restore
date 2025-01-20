@interface FavoriteColorPickerView.Coordinator
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (_TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator)init;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)showDeleteCallout:(id)a3;
@end

@implementation FavoriteColorPickerView.Coordinator

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100033D28();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)showDeleteCallout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10002AB78(v4);
}

- (_TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator)init
{
  result = (_TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end