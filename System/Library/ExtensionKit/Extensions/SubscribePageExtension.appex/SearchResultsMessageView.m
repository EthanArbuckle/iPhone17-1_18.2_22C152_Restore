@interface SearchResultsMessageView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension24SearchResultsMessageView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension24SearchResultsMessageView)initWithFrame:(CGRect)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
@end

@implementation SearchResultsMessageView

- (_TtC22SubscribePageExtension24SearchResultsMessageView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension24SearchResultsMessageView *)sub_100456548(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension24SearchResultsMessageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100457948();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10045689C();
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(SearchResultsMessageView *)&v3 layoutMarginsDidChange];
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_100457740();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24SearchResultsMessageView_primaryLabel));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension24SearchResultsMessageView_secondaryLabel);
}

@end