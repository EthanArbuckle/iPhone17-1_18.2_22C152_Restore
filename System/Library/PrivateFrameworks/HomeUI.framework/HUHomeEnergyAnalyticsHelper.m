@interface HUHomeEnergyAnalyticsHelper
+ (void)sendUtilityAccountLookupViewEventWithUtilityID:(id)a3 presentingVC:(int64_t)a4;
+ (void)sendUtilityDisconnectedByUserEvent;
+ (void)sendUtilityIntroAndSelectionSheetViewEventWithNumOfUtilities:(int64_t)a3;
+ (void)sendUtilityOTPMethodSelectedByUserEventWithUtilityID:(id)a3 selectedOTPMethod:(id)a4;
+ (void)sendUtilityOTPMethodSelectionSheetViewEventWithUtilityID:(id)a3 numOfMethods:(int64_t)a4;
+ (void)sendUtilityOnboardingCancelledEventWithUtilityID:(id)a3 sourceViewController:(int64_t)a4;
+ (void)sendUtilityOnboardingCompletedEventWithUtilityID:(id)a3 onboardingMethod:(int64_t)a4 didAttemptPasswordless:(BOOL)a5;
+ (void)sendUtilityOnboardingEntryPointInSettingsTappedEvent;
+ (void)sendUtilityOnboardingEntryPointInSettingsViewEvent;
- (HUHomeEnergyAnalyticsHelper)init;
@end

@implementation HUHomeEnergyAnalyticsHelper

+ (void)sendUtilityOnboardingEntryPointInSettingsViewEvent
{
}

+ (void)sendUtilityOnboardingEntryPointInSettingsTappedEvent
{
}

+ (void)sendUtilityIntroAndSelectionSheetViewEventWithNumOfUtilities:(int64_t)a3
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA118210);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1BE9C14B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C13F8();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4F69DD8], v6);
  sub_1BE9C1498();
  uint64_t v10 = sub_1BE9C14A8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 0, 1, v10);
  sub_1BE9C1458();
  swift_allocObject();
  sub_1BE9C1448();
  MEMORY[0x1C18929B0]();
  swift_release();
}

+ (void)sendUtilityAccountLookupViewEventWithUtilityID:(id)a3 presentingVC:(int64_t)a4
{
}

+ (void)sendUtilityOTPMethodSelectionSheetViewEventWithUtilityID:(id)a3 numOfMethods:(int64_t)a4
{
}

+ (void)sendUtilityOTPMethodSelectedByUserEventWithUtilityID:(id)a3 selectedOTPMethod:(id)a4
{
  id v4 = a4;
  if (a3)
  {
    uint64_t v5 = sub_1BE9C49F8();
    uint64_t v7 = v6;
    if (v4)
    {
LABEL_3:
      uint64_t v8 = sub_1BE9C49F8();
      id v4 = v9;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  sub_1BE453104(v5, v7, v8, (uint64_t)v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)sendUtilityOnboardingCancelledEventWithUtilityID:(id)a3 sourceViewController:(int64_t)a4
{
}

+ (void)sendUtilityOnboardingCompletedEventWithUtilityID:(id)a3 onboardingMethod:(int64_t)a4 didAttemptPasswordless:(BOOL)a5
{
  if (a3) {
    sub_1BE9C49F8();
  }
  sub_1BE453708();

  swift_bridgeObjectRelease();
}

+ (void)sendUtilityDisconnectedByUserEvent
{
}

- (HUHomeEnergyAnalyticsHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HomeEnergyAnalyticsHelper();
  return [(HUHomeEnergyAnalyticsHelper *)&v3 init];
}

@end