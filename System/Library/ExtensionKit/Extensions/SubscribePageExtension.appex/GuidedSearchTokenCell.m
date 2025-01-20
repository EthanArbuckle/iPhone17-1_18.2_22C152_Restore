@interface GuidedSearchTokenCell
- (_TtC22SubscribePageExtension21GuidedSearchTokenCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension21GuidedSearchTokenCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation GuidedSearchTokenCell

- (_TtC22SubscribePageExtension21GuidedSearchTokenCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension21GuidedSearchTokenCell *)sub_1006DBF60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension21GuidedSearchTokenCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006DD378();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006DC768();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006DCB80(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21GuidedSearchTokenCell_pill));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21GuidedSearchTokenCell_label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension21GuidedSearchTokenCell_closeImage);
}

@end