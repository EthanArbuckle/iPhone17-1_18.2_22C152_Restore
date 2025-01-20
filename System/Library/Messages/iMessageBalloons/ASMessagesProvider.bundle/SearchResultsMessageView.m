@interface SearchResultsMessageView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC18ASMessagesProvider24SearchResultsMessageView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider24SearchResultsMessageView)initWithFrame:(CGRect)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
@end

@implementation SearchResultsMessageView

- (_TtC18ASMessagesProvider24SearchResultsMessageView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider24SearchResultsMessageView *)sub_24D9FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider24SearchResultsMessageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24EE44();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24DD50();
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
  double v6 = sub_24EBF4();
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
                     + OBJC_IVAR____TtC18ASMessagesProvider24SearchResultsMessageView_primaryLabel));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider24SearchResultsMessageView_secondaryLabel);
}

@end