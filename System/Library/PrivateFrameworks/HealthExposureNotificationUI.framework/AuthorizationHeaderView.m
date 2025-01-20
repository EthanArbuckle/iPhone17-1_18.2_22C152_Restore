@interface AuthorizationHeaderView
- (_TtC28HealthExposureNotificationUI23AuthorizationHeaderView)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI23AuthorizationHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation AuthorizationHeaderView

- (_TtC28HealthExposureNotificationUI23AuthorizationHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC28HealthExposureNotificationUI23AuthorizationHeaderView *)sub_2293EEF94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC28HealthExposureNotificationUI23AuthorizationHeaderView)initWithCoder:(id)a3
{
  return (_TtC28HealthExposureNotificationUI23AuthorizationHeaderView *)sub_2293EF294(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationHeaderView_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationHeaderView_arrowImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationHeaderView_peopleImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationHeaderView____lazy_storage___iconStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationHeaderView____lazy_storage___sharrowImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationHeaderView_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationHeaderView_bodyLabel);
}

@end