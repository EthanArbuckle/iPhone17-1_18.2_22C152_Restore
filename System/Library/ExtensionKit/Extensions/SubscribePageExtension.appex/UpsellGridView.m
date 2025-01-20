@interface UpsellGridView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension14UpsellGridView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension14UpsellGridView)initWithFrame:(CGRect)a3;
- (id)impressionItems;
- (void)layoutSubviews;
@end

@implementation UpsellGridView

- (_TtC22SubscribePageExtension14UpsellGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10046A070();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100467F3C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_100469014();
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

- (id)impressionItems
{
  sub_10046A030();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1007677F0().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (_TtC22SubscribePageExtension14UpsellGridView)initWithFrame:(CGRect)a3
{
  JUMeasurements result = (_TtC22SubscribePageExtension14UpsellGridView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end