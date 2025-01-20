@interface LinkableHeaderView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension18LinkableHeaderView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension18LinkableHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LinkableHeaderView

- (_TtC22SubscribePageExtension18LinkableHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension18LinkableHeaderView *)sub_10058C628(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension18LinkableHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10058D374();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10058CAB0();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain();
  v7 = self;
  double v8 = sub_10058CCC4((uint64_t)a4, width);
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18LinkableHeaderView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18LinkableHeaderView_topDivider));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension18LinkableHeaderView_bottomDivider);
}

@end