@interface MOSuggestionSheetFilterCollectionView
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView)init;
- (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
@end

@implementation MOSuggestionSheetFilterCollectionView

- (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView)init
{
  return (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView *)MOSuggestionSheetFilterCollectionView.init()();
}

- (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionSheetFilterCollectionView.init(coder:)();
}

- (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4 = a4;
  result = (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView_layout));
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView_filterDelegate;

  outlined destroy of MOSuggestionSheetFilterCollectionViewDelegate?((uint64_t)v3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa) + 0x68);
  id v6 = a3;
  v7 = self;
  uint64_t v8 = v5();
  int64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 112))(v8);

  swift_release();
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)MOSuggestionSheetFilterCollectionView.collectionView(_:cellForItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  specialized MOSuggestionSheetFilterCollectionView.collectionView(_:layout:sizeForItemAt:)();
  double v10 = v9;
  double v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  double v11 = self;
  MOSuggestionSheetFilterCollectionView.collectionView(_:didSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end