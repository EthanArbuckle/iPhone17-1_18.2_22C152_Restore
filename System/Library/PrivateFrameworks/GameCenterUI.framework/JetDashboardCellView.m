@interface JetDashboardCellView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSString)accessibilityLabel;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC12GameCenterUI20JetDashboardCellView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI20JetDashboardCellView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation JetDashboardCellView

- (_TtC12GameCenterUI20JetDashboardCellView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI20JetDashboardCellView *)sub_1AF4057D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI20JetDashboardCellView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF405D98();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1AF406044(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_getObjectType();
  swift_unknownObjectRetain();
  double v7 = self;
  double v8 = sub_1AF407148((uint64_t)a4, v7, width);
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

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF406284();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1AF406A70();
  uint64_t v4 = v3;

  if (v4)
  {
    double v5 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AF7AE0E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  double v7 = self;
  sub_1AF406D14(v4, v6);
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  id v2 = sub_1AF406DC8();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  id v2 = sub_1AF406E0C();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI20JetDashboardCellView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI20JetDashboardCellView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI20JetDashboardCellView_chevronGlyph));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI20JetDashboardCellView_contentViewBackground);
}

@end