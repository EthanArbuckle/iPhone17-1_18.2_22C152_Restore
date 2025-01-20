@interface TipsView
- (_TtC15HealthRecordsUI8TipsView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI8TipsView)initWithFrame:(CGRect)a3;
@end

@implementation TipsView

- (_TtC15HealthRecordsUI8TipsView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI8TipsView *)TipsView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI8TipsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C22A6CF4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI8TipsView_attributedSubtitleText));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI8TipsView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI8TipsView____lazy_storage___subtitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI8TipsView____lazy_storage___imageView);
}

@end