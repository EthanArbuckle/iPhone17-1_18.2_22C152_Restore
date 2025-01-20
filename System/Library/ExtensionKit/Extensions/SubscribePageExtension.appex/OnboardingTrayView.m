@interface OnboardingTrayView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension18OnboardingTrayView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension18OnboardingTrayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation OnboardingTrayView

- (_TtC22SubscribePageExtension18OnboardingTrayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension18OnboardingTrayView_itemViewLayoutItems) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension18OnboardingTrayView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100706108();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain();
  v7 = self;
  double v8 = sub_1007062C0((uint64_t)a4, width);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease();

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (_TtC22SubscribePageExtension18OnboardingTrayView)initWithFrame:(CGRect)a3
{
  JUMeasurements result = (_TtC22SubscribePageExtension18OnboardingTrayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension18OnboardingTrayView_layoutMetrics;

  sub_1000EC190((uint64_t)v3);
}

@end