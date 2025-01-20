@interface SearchActionContentView
- (_TtC18ASMessagesProvider23SearchActionContentView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider23SearchActionContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SearchActionContentView

- (_TtC18ASMessagesProvider23SearchActionContentView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider23SearchActionContentView *)sub_6C7150(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider23SearchActionContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_6CB590();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_6C7980();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider23SearchActionContentView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider23SearchActionContentView_linkLabel));
  sub_6CB4E8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider23SearchActionContentView_metrics, type metadata accessor for SearchActionContentView.Layout.Metrics);
}

@end