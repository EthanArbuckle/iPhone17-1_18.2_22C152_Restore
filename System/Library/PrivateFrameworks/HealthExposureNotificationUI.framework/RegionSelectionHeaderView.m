@interface RegionSelectionHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)titleLabel;
- (_TtC28HealthExposureNotificationUI25RegionSelectionHeaderView)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI25RegionSelectionHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RegionSelectionHeaderView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC28HealthExposureNotificationUI25RegionSelectionHeaderView_titleLabel));
}

- (_TtC28HealthExposureNotificationUI25RegionSelectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2293C6B90();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2293C3B8C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_2293C3D54(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (_TtC28HealthExposureNotificationUI25RegionSelectionHeaderView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC28HealthExposureNotificationUI25RegionSelectionHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI25RegionSelectionHeaderView_globeImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI25RegionSelectionHeaderView_titleLabel);
}

@end