@interface GuidedSearchTokenPaletteCollectionViewLayout
+ (Class)layoutAttributesClass;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout)init;
- (_TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout)initWithCoder:(id)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)finalizeCollectionViewUpdates;
- (void)prepareForCollectionViewUpdates:(id)a3;
@end

@implementation GuidedSearchTokenPaletteCollectionViewLayout

- (_TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout)init
{
  return (_TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout *)sub_100104B20();
}

- (_TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout)initWithCoder:(id)a3
{
  *(void *)&self->pinningEnabled[OBJC_IVAR____TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout_layoutDelegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout *)sub_100768A40();
  __break(1u);
  return result;
}

+ (Class)layoutAttributesClass
{
  type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout.LayoutAttributes();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  sub_10001A860(0, &qword_100939BA8);
  unint64_t v4 = sub_100767800();
  id v5 = self;
  sub_100104CE8(v4);

  swift_bridgeObjectRelease();
}

- (void)finalizeCollectionViewUpdates
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  v2 = (char *)v5.receiver;
  [(GuidedSearchTokenPaletteCollectionViewLayout *)&v5 finalizeCollectionViewUpdates];
  v3 = &v2[OBJC_IVAR____TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout_indexPathsToSlideInAppearAnimate];
  swift_beginAccess();
  *(void *)v3 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  unint64_t v4 = &v2[OBJC_IVAR____TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout_indexPathsToFadeDisappearAnimate];
  swift_beginAccess();
  *(void *)unint64_t v4 = _swiftEmptyArrayStorage;

  swift_bridgeObjectRelease();
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  return sub_10010583C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_100105528);
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  return sub_10010583C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1001056BC);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  id v7 = v14.receiver;
  id v8 = -[GuidedSearchTokenPaletteCollectionViewLayout layoutAttributesForElementsInRect:](&v14, "layoutAttributesForElementsInRect:", x, y, width, height);
  if (v8)
  {
    v9 = v8;
    sub_10001A860(0, (unint64_t *)&qword_100934140);
    unint64_t v10 = sub_100767800();

    v11 = (char *)v7;
    sub_100106364(v10, v11);
    swift_bridgeObjectRelease();

    v12.super.isa = sub_1007677F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {

    v12.super.isa = 0;
  }

  return v12.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_100756440();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  v9 = self;
  Class isa = sub_100756340().super.isa;
  v11 = (objc_class *)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  v15.receiver = v9;
  v15.super_class = v11;
  NSArray v12 = (_TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout *)[(GuidedSearchTokenPaletteCollectionViewLayout *)&v15 layoutAttributesForItemAtIndexPath:isa];

  if (v12)
  {
    id v13 = sub_100105F8C(v12);

    v9 = v12;
  }
  else
  {
    id v13 = 0;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

  return v13;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for GuidedSearchTokenPaletteCollectionViewLayout();
  uint64_t v7 = v10.receiver;
  if (-[GuidedSearchTokenPaletteCollectionViewLayout shouldInvalidateLayoutForBoundsChange:](&v10, "shouldInvalidateLayoutForBoundsChange:", x, y, width, height))
  {
    char v8 = 1;
  }
  else
  {
    char v8 = v7[OBJC_IVAR____TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout_pinningEnabled];
  }

  return v8;
}

- (void).cxx_destruct
{
  sub_10000FB1C((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension44GuidedSearchTokenPaletteCollectionViewLayout_layoutDelegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end