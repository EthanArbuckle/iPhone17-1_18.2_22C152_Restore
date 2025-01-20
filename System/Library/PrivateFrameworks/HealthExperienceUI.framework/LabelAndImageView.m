@interface LabelAndImageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (_TtC18HealthExperienceUI17LabelAndImageView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI17LabelAndImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LabelAndImageView

- (_TtC18HealthExperienceUI17LabelAndImageView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI17LabelAndImageView *)LabelAndImageView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI17LabelAndImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD268318();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD2675C8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1AD267888(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (NSString)description
{
  v2 = self;
  sub_1AD267A48();

  id v3 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17LabelAndImageView_font));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17LabelAndImageView____lazy_storage___titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI17LabelAndImageView_imageView);
}

@end