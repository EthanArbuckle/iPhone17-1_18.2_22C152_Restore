@interface SearchCollectionViewLayout
+ (Class)layoutAttributesClass;
- (CGSize)collectionViewContentSize;
- (_TtC22SubscribePageExtension26SearchCollectionViewLayout)init;
- (_TtC22SubscribePageExtension26SearchCollectionViewLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation SearchCollectionViewLayout

+ (Class)layoutAttributesClass
{
  type metadata accessor for SearchCollectionLayoutAttributes();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC22SubscribePageExtension26SearchCollectionViewLayout)init
{
  return (_TtC22SubscribePageExtension26SearchCollectionViewLayout *)sub_100475188();
}

- (_TtC22SubscribePageExtension26SearchCollectionViewLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchCollectionViewLayout_backgroundCornerRadius) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension26SearchCollectionViewLayout_pendingPrepareObserver);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC22SubscribePageExtension26SearchCollectionViewLayout *)sub_100768A40();
  __break(1u);
  return result;
}

- (CGSize)collectionViewContentSize
{
  v2 = self;
  double v3 = sub_100475398();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double x = a3.origin.x;
  double v4 = self;
  uint64_t v5 = sub_10047555C(x);

  if (v5)
  {
    sub_10001A860(0, (unint64_t *)&qword_100934140);
    v6.super.isa = sub_1007677F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }

  return v6.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_100756440();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  v9 = self;
  Class isa = sub_100756340().super.isa;
  v11 = (objc_class *)type metadata accessor for SearchCollectionViewLayout();
  v15.receiver = v9;
  v15.super_class = v11;
  v12 = (_TtC22SubscribePageExtension26SearchCollectionViewLayout *)[(SearchCollectionViewLayout *)&v15 layoutAttributesForItemAtIndexPath:isa];

  if (v12)
  {
    id v13 = sub_100476204(v12);

    v9 = v12;
  }
  else
  {
    id v13 = 0;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

  return v13;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_100756440();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1007675F0();
  uint64_t v12 = v11;
  sub_100756380();
  id v13 = self;
  v14 = (void *)sub_100476734(v10, v12, (uint64_t)v9);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return v14;
}

- (void)prepareLayout
{
  v2 = self;
  sub_100477640();
}

- (void).cxx_destruct
{
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension26SearchCollectionViewLayout_pendingPrepareObserver));
}

@end