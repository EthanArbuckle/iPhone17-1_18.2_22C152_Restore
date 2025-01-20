@interface ArcadeWelcomeContentView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension24ArcadeWelcomeContentView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension24ArcadeWelcomeContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ArcadeWelcomeContentView

- (_TtC22SubscribePageExtension24ArcadeWelcomeContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension24ArcadeWelcomeContentView *)sub_1003912E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension24ArcadeWelcomeContentView)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension24ArcadeWelcomeContentView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100391AFC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_100391E90();
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

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1003921E0((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24ArcadeWelcomeContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24ArcadeWelcomeContentView_subtitleLabel));

  swift_bridgeObjectRelease();
}

@end