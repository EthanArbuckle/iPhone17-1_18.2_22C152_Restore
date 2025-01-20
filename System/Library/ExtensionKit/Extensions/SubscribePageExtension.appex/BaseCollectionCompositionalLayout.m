@interface BaseCollectionCompositionalLayout
+ (Class)layoutAttributesClass;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithSection:(id)a3;
- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5;
- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3;
- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)prepareLayout;
@end

@implementation BaseCollectionCompositionalLayout

+ (Class)layoutAttributesClass
{
  type metadata accessor for BaseCollectionViewLayoutAttributes();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout *)sub_10073E978((uint64_t)sub_100740538, v6, a4);
}

- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_indexPathsRequiringRubberbanding) = (Class)&_swiftEmptySetSingleton;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout *)sub_100768A40();
  __break(1u);
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
  id v7 = v14.receiver;
  id v8 = -[BaseCollectionCompositionalLayout layoutAttributesForElementsInRect:](&v14, "layoutAttributesForElementsInRect:", x, y, width, height);
  if (v8)
  {
    v9 = v8;
    sub_1000F5604();
    unint64_t v10 = sub_100767800();

    id v11 = v7;
    sub_10073FE24(v10);

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
  id v11 = (objc_class *)type metadata accessor for BaseCollectionCompositionalLayout();
  v15.receiver = v9;
  v15.super_class = v11;
  NSArray v12 = (char *)[(BaseCollectionCompositionalLayout *)&v15 layoutAttributesForItemAtIndexPath:isa];

  if (v12)
  {
    v13 = v12;
    NSArray v12 = sub_10073E220(v13);

    v9 = (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout *)v13;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

  return v12;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_10073F210(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_layoutAttributesForSupplementaryViewOfKind_atIndexPath_);
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_10073F210(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_layoutAttributesForDecorationViewOfKind_atIndexPath_);
}

- (void)prepareLayout
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
  v2 = (char *)v6.receiver;
  [(BaseCollectionCompositionalLayout *)&v6 prepareLayout];
  v3 = (uint64_t *)&v2[OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver];
  uint64_t v4 = *(void (**)(char *))&v2[OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver];
  if (v4)
  {
    swift_retain();
    v4(v2);
    sub_10001A4D0((uint64_t)v4);
    uint64_t v5 = *v3;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t *v3 = 0;
  v3[1] = 0;
  sub_10001A4D0(v5);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  char v8 = sub_10073F45C(x, y, width, height);

  return v8 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  id v8 = sub_10073F70C(x, y, width, height);

  return v8;
}

- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithSection:(id)a3
{
  id v3 = a3;
  result = (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithSectionProvider:(id)a3
{
  id v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  _Block_copy(a4);
  id v7 = a3;
  id v8 = a5;
  result = (_TtC22SubscribePageExtension33BaseCollectionCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver);

  sub_10001A4D0(v3);
}

@end