@interface WideFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC26GameCenterMessageExtension14WideFlowLayout)init;
- (_TtC26GameCenterMessageExtension14WideFlowLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)prepareLayout;
@end

@implementation WideFlowLayout

- (_TtC26GameCenterMessageExtension14WideFlowLayout)init
{
  return (_TtC26GameCenterMessageExtension14WideFlowLayout *)sub_100026134();
}

- (_TtC26GameCenterMessageExtension14WideFlowLayout)initWithCoder:(id)a3
{
  return (_TtC26GameCenterMessageExtension14WideFlowLayout *)sub_100026258(a3);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (CGSize)collectionViewContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_contentSize);
  double v3 = *(double *)&self->maxRowsPerSection[OBJC_IVAR____TtC26GameCenterMessageExtension14WideFlowLayout_contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareLayout
{
  double v2 = self;
  sub_100026838();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  id v8 = sub_100027054(x, y, width, height);

  if (v8)
  {
    sub_10002840C();
    v9.super.isa = sub_100047F48().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_100047608();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100047E68();
  uint64_t v11 = v10;
  sub_1000475E8();
  v12 = self;
  v13 = sub_10002767C(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end