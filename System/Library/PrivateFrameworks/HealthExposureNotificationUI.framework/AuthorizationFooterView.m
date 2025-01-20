@interface AuthorizationFooterView
- (_TtC28HealthExposureNotificationUI23AuthorizationFooterView)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI23AuthorizationFooterView)initWithFrame:(CGRect)a3;
- (void)didTapPrimaryButton;
- (void)didTapSecondaryButton;
@end

@implementation AuthorizationFooterView

- (_TtC28HealthExposureNotificationUI23AuthorizationFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC28HealthExposureNotificationUI23AuthorizationFooterView *)sub_2293A5188(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC28HealthExposureNotificationUI23AuthorizationFooterView)initWithCoder:(id)a3
{
  return (_TtC28HealthExposureNotificationUI23AuthorizationFooterView *)sub_2293A5358(a3);
}

- (void)didTapPrimaryButton
{
  v3 = (char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_delegate;
  if (MEMORY[0x22A6B8930]((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_delegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (void)didTapSecondaryButton
{
  v3 = (char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_delegate;
  if (MEMORY[0x22A6B8930]((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_delegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  sub_2293A5F58((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_footerLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_visualEffectView);
}

@end