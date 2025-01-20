@interface MOSuggestionCarouselView
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC16MomentsUIService24MOSuggestionCarouselView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService24MOSuggestionCarouselView)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation MOSuggestionCarouselView

- (_TtC16MomentsUIService24MOSuggestionCarouselView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionCarouselView.init(coder:)();
}

- (_TtC16MomentsUIService24MOSuggestionCarouselView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService24MOSuggestionCarouselView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService24MOSuggestionCarouselView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService24MOSuggestionCarouselView_pageControl));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService24MOSuggestionCarouselView_delegate);

  swift_unknownObjectWeakDestroy();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xB0);
  id v6 = a3;
  v7 = self;
  unint64_t v8 = v5();
  if (v8 >> 62) {
    int64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    int64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  swift_bridgeObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  MOSuggestionCarouselView.collectionView(_:cellForItemAt:)(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  MOSuggestionCarouselView.collectionView(_:willDisplay:forItemAt:)((uint64_t)v12, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  self;
  id v12 = (void *)swift_dynamicCastObjCClass();
  id v13 = a4;
  v14 = v13;
  if (v12)
  {
    id v15 = v13;
    id v16 = a3;
    v17 = self;
    [v12 minimumInteritemSpacing];
    double v19 = v18;
    [v12 sectionInset];
    double v21 = v19 + v20;
  }
  else
  {
    id v22 = a3;
    v23 = self;
    double v21 = 0.0;
  }
  [a3 frame];
  double v25 = v24;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v26 = v25 - v21 + -40.0;
  double v27 = v26;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v8 = a3;
  uint64_t v9 = self;
  MOSuggestionCarouselView.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v8, &a5->x, x);
}

@end