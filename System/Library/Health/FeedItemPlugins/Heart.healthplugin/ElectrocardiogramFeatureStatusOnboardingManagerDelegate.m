@interface ElectrocardiogramFeatureStatusOnboardingManagerDelegate
- (_TtC5HeartP33_83D08B8D42E0F7375EF54A8E4D22046B55ElectrocardiogramFeatureStatusOnboardingManagerDelegate)init;
- (void)didDismissOnboarding;
@end

@implementation ElectrocardiogramFeatureStatusOnboardingManagerDelegate

- (void)didDismissOnboarding
{
  v1 = (char *)MEMORY[0x24560BA20](a1+ OBJC_IVAR____TtC5HeartP33_83D08B8D42E0F7375EF54A8E4D22046B55ElectrocardiogramFeatureStatusOnboardingManagerDelegate_delegate);
  if (v1)
  {
    id v2 = *(id *)&v1[qword_26AFD84C0];
    *(void *)&v1[qword_26AFD84C0] = 0;
  }
}

- (_TtC5HeartP33_83D08B8D42E0F7375EF54A8E4D22046B55ElectrocardiogramFeatureStatusOnboardingManagerDelegate)init
{
  result = (_TtC5HeartP33_83D08B8D42E0F7375EF54A8E4D22046B55ElectrocardiogramFeatureStatusOnboardingManagerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end