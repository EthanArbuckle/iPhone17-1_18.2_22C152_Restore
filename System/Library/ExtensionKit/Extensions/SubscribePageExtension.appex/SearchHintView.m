@interface SearchHintView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension14SearchHintView)init;
- (_TtC22SubscribePageExtension14SearchHintView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension14SearchHintView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SearchHintView

- (_TtC22SubscribePageExtension14SearchHintView)init
{
  return (_TtC22SubscribePageExtension14SearchHintView *)sub_100676AEC();
}

- (_TtC22SubscribePageExtension14SearchHintView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_isHighlighted) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_showSeparator) = 0;
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_separatorView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SeparatorView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_iconImage) = 0;

  result = (_TtC22SubscribePageExtension14SearchHintView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006770BC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  double v7 = sub_10067819C(a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (_TtC22SubscribePageExtension14SearchHintView)initWithFrame:(CGRect)a3
{
  JUMeasurements result = (_TtC22SubscribePageExtension14SearchHintView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_separatorView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension14SearchHintView_iconImage);
}

@end