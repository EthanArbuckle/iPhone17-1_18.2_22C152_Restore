@interface SmallBreakoutCollectionViewCell
- (UIColor)backgroundColor;
- (_TtC20ProductPageExtension19BreakoutDetailsView)accessibilityDetailsView;
- (_TtC20ProductPageExtension31SmallBreakoutCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31SmallBreakoutCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SmallBreakoutCollectionViewCell

- (_TtC20ProductPageExtension31SmallBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31SmallBreakoutCollectionViewCell *)sub_100653E80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31SmallBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100654C6C();
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(SmallBreakoutCollectionViewCell *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v12.receiver = self;
  v12.super_class = ObjectType;
  id v6 = a3;
  v7 = self;
  [(SmallBreakoutCollectionViewCell *)&v12 setBackgroundColor:v6];
  v8 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_iconView);
  v11.receiver = v7;
  v11.super_class = ObjectType;
  id v9 = v8;
  v10 = [(SmallBreakoutCollectionViewCell *)&v11 backgroundColor];
  sub_10076C5C0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10065448C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10065369C();
}

- (_TtC20ProductPageExtension19BreakoutDetailsView)accessibilityDetailsView
{
  return (_TtC20ProductPageExtension19BreakoutDetailsView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_detailsView);
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31SmallBreakoutCollectionViewCell_detailsView));

  swift_unknownObjectRelease();
}

@end