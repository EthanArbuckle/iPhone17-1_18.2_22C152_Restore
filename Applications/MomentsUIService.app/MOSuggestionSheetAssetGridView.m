@interface MOSuggestionSheetAssetGridView
- (_TtC16MomentsUIService30MOSuggestionSheetAssetGridView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService30MOSuggestionSheetAssetGridView)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
@end

@implementation MOSuggestionSheetAssetGridView

- (_TtC16MomentsUIService30MOSuggestionSheetAssetGridView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService30MOSuggestionSheetAssetGridView *)MOSuggestionSheetAssetGridView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService30MOSuggestionSheetAssetGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionSheetAssetGridView.init(coder:)();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOSuggestionSheetAssetGridView();
  v2 = v4.receiver;
  id v3 = [(MOSuggestionSheetAssetGridView *)&v4 layoutSubviews];
  (*(void (**)(id))((swift_isaMask & *v2) + 0x1E8))(v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_gridCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_mosaicLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_addedView));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_delegate);
  outlined consume of MOWeakArray<MOSuggestionSheetAssetViewModel>?(*(uint64_t *)((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_assetViewModels));

  swift_bridgeObjectRelease();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x150);
  id v6 = a3;
  v7 = self;
  unint64_t v8 = v5();
  if (v8)
  {
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      int64_t v9 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      int64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = swift_bridgeObjectRelease();
    int64_t v11 = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v7->super.super.super.isa) + 0x1F8))(v10);

    if (v11 >= v9) {
      return v9;
    }
    else {
      return v11;
    }
  }
  else
  {

    return 0;
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  int64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for MOSuggestionSheetMosaicCell();
  v12 = (void *)swift_dynamicCastClass();
  if (v12)
  {
    v13 = *(void (**)(void))((swift_isaMask & *v12) + 0x170);
    id v14 = a3;
    id v15 = a4;
    v16 = self;
    v13();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = ((char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  int64_t v11 = self;
  MOSuggestionSheetAssetGridView.collectionView(_:cellForItemAt:)(v10, v9);
  v13 = v12;

  (*(void (**)(NSObject *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  int64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  MOSuggestionSheetAssetGridView.collectionView(_:willDisplay:forItemAt:)(v12, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

@end