@interface SearchActionContentView
- (_TtC20ProductPageExtension23SearchActionContentView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23SearchActionContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SearchActionContentView

- (_TtC20ProductPageExtension23SearchActionContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23SearchActionContentView *)sub_1005872E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23SearchActionContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10058B768();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100587B10();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SearchActionContentView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SearchActionContentView_linkLabel));
  sub_10058B6C0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension23SearchActionContentView_metrics, type metadata accessor for SearchActionContentView.Layout.Metrics);
}

@end