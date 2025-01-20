@interface SearchHeadingView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension17SearchHeadingView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension17SearchHeadingView)initWithFrame:(CGRect)a3;
- (void)didPressWithDetailButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation SearchHeadingView

- (_TtC22SubscribePageExtension17SearchHeadingView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension17SearchHeadingView *)sub_1001C7578(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension17SearchHeadingView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_metrics);
  v4[3] = &type metadata for CGFloat;
  v4[4] = &protocol witness table for CGFloat;
  void *v4 = 0;
  v4[8] = &type metadata for CGFloat;
  v4[9] = &protocol witness table for CGFloat;
  v4[5] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_detailButtonHandler);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC22SubscribePageExtension17SearchHeadingView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001C7DF8();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  double v7 = sub_1001C80C8(a4);
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

- (void)didPressWithDetailButton:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_detailButtonHandler);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_10001A4E0((uint64_t)v3);
    v3(v6);
    sub_10001A4D0((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_detailButton));
  sub_1001CA110((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_metrics);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_detailButtonHandler);

  sub_10001A4D0(v3);
}

@end