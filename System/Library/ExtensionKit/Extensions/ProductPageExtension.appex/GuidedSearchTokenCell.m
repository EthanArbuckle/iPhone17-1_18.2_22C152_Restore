@interface GuidedSearchTokenCell
- (_TtC20ProductPageExtension21GuidedSearchTokenCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension21GuidedSearchTokenCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation GuidedSearchTokenCell

- (_TtC20ProductPageExtension21GuidedSearchTokenCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21GuidedSearchTokenCell *)sub_10066269C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension21GuidedSearchTokenCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100663DC0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100662EA4();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006632BC(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21GuidedSearchTokenCell_pill));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21GuidedSearchTokenCell_label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension21GuidedSearchTokenCell_closeImage);
}

@end