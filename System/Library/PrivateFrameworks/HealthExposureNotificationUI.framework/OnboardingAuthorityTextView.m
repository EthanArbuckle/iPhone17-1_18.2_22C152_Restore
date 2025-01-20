@interface OnboardingAuthorityTextView
- (_TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView)initWithFrame:(CGRect)a3;
@end

@implementation OnboardingAuthorityTextView

- (_TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView_textView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82D60]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView *)sub_2294195F8();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView_headerView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI27OnboardingAuthorityTextView_textView);
}

@end