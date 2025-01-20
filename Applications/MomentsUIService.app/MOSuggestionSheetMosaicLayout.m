@interface MOSuggestionSheetMosaicLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC16MomentsUIService29MOSuggestionSheetMosaicLayout)init;
- (_TtC16MomentsUIService29MOSuggestionSheetMosaicLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation MOSuggestionSheetMosaicLayout

- (void)prepareLayout
{
  v2 = self;
  MOSuggestionSheetMosaicLayout.prepare()();
}

- (CGSize)collectionViewContentSize
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.isa) + 0x88);
  v3 = self;
  v2();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double v5 = self;
  id v6 = [(MOSuggestionSheetMosaicLayout *)v5 collectionView];
  if (v6)
  {
    double v7 = v6;
    [v6 bounds];
    v10.CGFloat width = width;
    v10.CGFloat height = height;
    BOOL v8 = CGSizeEqualToSize(v10, v11);

    return !v8;
  }
  else
  {

    return 0;
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v8 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.isa) + 0x70);
  double v9 = self;
  unint64_t v10 = v8();
  if (v10 >> 62) {
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (IndexPath.item.getter() >= v11)
  {

    v15 = 0;
    goto LABEL_10;
  }
  unint64_t v12 = IndexPath.item.getter();
  id result = (id)v8();
  if (((unint64_t)result & 0xC000000000000001) != 0)
  {
    id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_8;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v12 >= *(void *)(((unint64_t)result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_16:
    __break(1u);
    return result;
  }
  id v14 = *((id *)result + v12 + 4);
LABEL_8:
  v15 = v14;

  swift_bridgeObjectRelease();
LABEL_10:
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v15;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  unint64_t v8 = MOSuggestionSheetMosaicLayout.layoutAttributesForElements(in:)(x, y, width, height);

  if (v8)
  {
    type metadata accessor for UICollectionViewLayoutAttributes();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (_TtC16MomentsUIService29MOSuggestionSheetMosaicLayout)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_cachedAttributes) = (Class)_swiftEmptyArrayStorage;
  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_contentBounds);
  _OWORD *v3 = 0u;
  v3[1] = 0u;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_isFullHeight) = 1;
  *(void *)&self->cachedAttributes[OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_mosaicSegmentDelegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionSheetMosaicLayout();
  return [(MOSuggestionSheetMosaicLayout *)&v5 init];
}

- (_TtC16MomentsUIService29MOSuggestionSheetMosaicLayout)initWithCoder:(id)a3
{
  return (_TtC16MomentsUIService29MOSuggestionSheetMosaicLayout *)MOSuggestionSheetMosaicLayout.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionSheetMosaicLayout_mosaicSegmentDelegate;

  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)v3);
}

@end