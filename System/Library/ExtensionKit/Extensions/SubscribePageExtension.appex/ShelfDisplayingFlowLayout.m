@interface ShelfDisplayingFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC22SubscribePageExtension25ShelfDisplayingFlowLayout)init;
- (_TtC22SubscribePageExtension25ShelfDisplayingFlowLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation ShelfDisplayingFlowLayout

- (_TtC22SubscribePageExtension25ShelfDisplayingFlowLayout)init
{
  return (_TtC22SubscribePageExtension25ShelfDisplayingFlowLayout *)sub_100032C38();
}

- (_TtC22SubscribePageExtension25ShelfDisplayingFlowLayout)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension25ShelfDisplayingFlowLayout_multiColumnMinYBySection;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_100424E64((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v6 = OBJC_IVAR____TtC22SubscribePageExtension25ShelfDisplayingFlowLayout_multiColumnOrigins;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_100420C58((uint64_t)_swiftEmptyArrayStorage);

  result = (_TtC22SubscribePageExtension25ShelfDisplayingFlowLayout *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShelfDisplayingFlowLayout();
  id v2 = v3.receiver;
  [(ShelfDisplayingFlowLayout *)&v3 prepareLayout];
  sub_100033E84();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  id v8 = sub_100032E48(x, y, width, height);

  if (v8)
  {
    sub_10001A860(0, (unint64_t *)&qword_100934140);
    v9.super.isa = sub_1007677F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_100756440();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  NSArray v9 = self;
  id v10 = sub_10003337C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

  return v10;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_100756440();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  NSArray v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1007675F0();
  uint64_t v12 = v11;
  sub_100756380();
  if (v10 == 0xD00000000000001FLL && v12 == 0x80000001007789A0 || (sub_100768B50() & 1) != 0)
  {
    v13 = self;
    id v14 = sub_100033A78();

    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = self;
    NSString v16 = sub_1007675C0();
    Class isa = sub_100756340().super.isa;
    v18 = (objc_class *)type metadata accessor for ShelfDisplayingFlowLayout();
    v20.receiver = v15;
    v20.super_class = v18;
    id v14 = [(ShelfDisplayingFlowLayout *)&v20 layoutAttributesForDecorationViewOfKind:v16 atIndexPath:isa];

    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return v14;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  id v8 = [(ShelfDisplayingFlowLayout *)v7 collectionView];
  if (v8)
  {
    NSArray v9 = v8;
    [v8 bounds];
    double v11 = v10;
    double v13 = v12;

    if (v11 != width) {
      goto LABEL_7;
    }
  }
  else
  {
    double v13 = 0.0;
    if (width != 0.0)
    {
LABEL_7:

      return 1;
    }
  }
  if (v13 != height) {
    goto LABEL_7;
  }
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for ShelfDisplayingFlowLayout();
  BOOL v14 = -[ShelfDisplayingFlowLayout shouldInvalidateLayoutForBoundsChange:](&v16, "shouldInvalidateLayoutForBoundsChange:", x, y, width, height);

  return v14;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  id v8 = sub_1000338DC(x, y, width, height);

  return v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end