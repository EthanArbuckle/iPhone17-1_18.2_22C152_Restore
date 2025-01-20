@interface GuidedSearchTokenCell
- (_TtC18ASMessagesProvider21GuidedSearchTokenCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider21GuidedSearchTokenCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation GuidedSearchTokenCell

- (_TtC18ASMessagesProvider21GuidedSearchTokenCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider21GuidedSearchTokenCell *)sub_47726C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider21GuidedSearchTokenCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_478990();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_477A74();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_477E8C(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21GuidedSearchTokenCell_pill));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21GuidedSearchTokenCell_label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider21GuidedSearchTokenCell_closeImage);
}

@end