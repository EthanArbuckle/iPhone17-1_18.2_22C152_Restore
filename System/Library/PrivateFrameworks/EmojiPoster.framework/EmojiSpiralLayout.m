@interface EmojiSpiralLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC11EmojiPoster17EmojiSpiralLayout)init;
- (_TtC11EmojiPoster17EmojiSpiralLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation EmojiSpiralLayout

- (CGSize)collectionViewContentSize
{
  v2 = self;
  id v3 = [(EmojiSpiralLayout *)v2 collectionView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    double v6 = v5;
    double v8 = v7;
  }
  else
  {

    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)prepareLayout
{
  double v6 = self;
  id v2 = [(EmojiSpiralLayout *)v6 collectionView];
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, sel_bounds);
    double v5 = v4;

    *(double *)((char *)&v6->super.super.isa + OBJC_IVAR____TtC11EmojiPoster17EmojiSpiralLayout_radius) = (v5 + 40.0) * 0.5;
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_20B9267B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20B926778();
  double v8 = self;
  id v9 = sub_20B8F7288();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  id v3 = self;
  uint64_t v4 = sub_20B8F79B8();

  if (v4)
  {
    sub_20B8F7C70();
    uint64_t v5 = (void *)sub_20B926A78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  uint64_t v5 = self;
  id v6 = [(EmojiSpiralLayout *)v5 collectionView];
  if (v6)
  {
    double v7 = v6;
    objc_msgSend(v6, sel_bounds);
    v12.CGFloat width = v8;
    v12.CGFloat height = v9;
    v13.CGFloat width = width;
    v13.CGFloat height = height;
    BOOL v10 = CGSizeEqualToSize(v12, v13);

    return !v10;
  }
  else
  {

    return 0;
  }
}

- (_TtC11EmojiPoster17EmojiSpiralLayout)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11EmojiPoster17EmojiSpiralLayout_radius) = (Class)0x3FF0000000000000;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11EmojiPoster17EmojiSpiralLayout_startingAngle) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiSpiralLayout();
  return [(EmojiSpiralLayout *)&v3 init];
}

- (_TtC11EmojiPoster17EmojiSpiralLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11EmojiPoster17EmojiSpiralLayout_radius) = (Class)0x3FF0000000000000;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11EmojiPoster17EmojiSpiralLayout_startingAngle) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiSpiralLayout();
  return [(EmojiSpiralLayout *)&v5 initWithCoder:a3];
}

@end