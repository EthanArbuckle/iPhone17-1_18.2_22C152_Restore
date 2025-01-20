@interface OnboardingDelegate
- (_TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate)init;
- (void)didDismissOnboarding;
@end

@implementation OnboardingDelegate

- (void)didDismissOnboarding
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate_onboardingManager) = 0;
  MEMORY[0x270F9A758]();
}

- (_TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate)init
{
  result = (_TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5HeartP33_8DCA3C15E4C4BF158196465BE488169318OnboardingDelegate_onboardingManager));
}

@end