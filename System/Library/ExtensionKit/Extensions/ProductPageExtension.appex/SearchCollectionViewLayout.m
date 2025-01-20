@interface SearchCollectionViewLayout
+ (Class)layoutAttributesClass;
- (CGSize)collectionViewContentSize;
- (_TtC20ProductPageExtension26SearchCollectionViewLayout)init;
- (_TtC20ProductPageExtension26SearchCollectionViewLayout)initWithCoder:(id)a3;
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

- (_TtC20ProductPageExtension26SearchCollectionViewLayout)init
{
  return (_TtC20ProductPageExtension26SearchCollectionViewLayout *)sub_10018CDD4();
}

- (_TtC20ProductPageExtension26SearchCollectionViewLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension26SearchCollectionViewLayout_backgroundCornerRadius) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension26SearchCollectionViewLayout_pendingPrepareObserver);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC20ProductPageExtension26SearchCollectionViewLayout *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGSize)collectionViewContentSize
{
  v2 = self;
  double v3 = sub_10018CFE4();
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
  uint64_t v5 = sub_10018D1A8(x);

  if (v5)
  {
    sub_100019840(0, (unint64_t *)&qword_10094B6C0);
    v6.super.isa = sub_10077BEC0().super.isa;
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
  uint64_t v4 = sub_10076A5F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  v8 = self;
  Class isa = sub_10076A4F0().super.isa;
  v10 = (objc_class *)type metadata accessor for SearchCollectionViewLayout();
  v14.receiver = v8;
  v14.super_class = v10;
  v11 = (_TtC20ProductPageExtension26SearchCollectionViewLayout *)[(SearchCollectionViewLayout *)&v14 layoutAttributesForItemAtIndexPath:isa];

  if (v11)
  {
    id v12 = sub_10018DE50(v11);

    v8 = v11;
  }
  else
  {
    id v12 = 0;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v12;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_10076A5F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10077BCB0();
  uint64_t v11 = v10;
  sub_10076A530();
  id v12 = self;
  v13 = (void *)sub_10018E380(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (void)prepareLayout
{
  v2 = self;
  sub_10018F28C();
}

- (void).cxx_destruct
{
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension26SearchCollectionViewLayout_pendingPrepareObserver));
}

@end