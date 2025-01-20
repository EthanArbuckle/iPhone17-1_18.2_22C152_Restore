@interface SearchActionContentView
- (_TtC22SubscribePageExtension23SearchActionContentView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension23SearchActionContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SearchActionContentView

- (_TtC22SubscribePageExtension23SearchActionContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension23SearchActionContentView *)sub_10065BF78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension23SearchActionContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006603E0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10065C7A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SearchActionContentView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SearchActionContentView_linkLabel));
  sub_10065F918((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension23SearchActionContentView_metrics, type metadata accessor for SearchActionContentView.Layout.Metrics);
}

@end