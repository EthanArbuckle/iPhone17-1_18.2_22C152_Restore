@interface IMGenerativeModelsAvailabilityProvider
+ (BOOL)generativePlaygroundModelsAvailable;
+ (BOOL)messageSummarizationEnabled;
+ (BOOL)summarizationModelsAvailable;
+ (BOOL)summarizationUserPreferenceEnabled;
+ (void)setMessageSummarizationUserPreference:(BOOL)a3;
- (IMGenerativeModelsAvailabilityProvider)init;
@end

@implementation IMGenerativeModelsAvailabilityProvider

+ (BOOL)messageSummarizationEnabled
{
  return static IMGenerativeModelsAvailabilityProvider.messageSummarizationEnabled()() & 1;
}

+ (BOOL)summarizationUserPreferenceEnabled
{
  return _sSo38IMGenerativeModelsAvailabilityProviderC17IMSharedUtilitiesE34summarizationUserPreferenceEnabledSbyFZ_0() & 1;
}

- (IMGenerativeModelsAvailabilityProvider)init
{
  return (IMGenerativeModelsAvailabilityProvider *)sub_1A0791370();
}

+ (BOOL)generativePlaygroundModelsAvailable
{
  return sub_1A079185C((uint64_t)a1, (uint64_t)a2, &OBJC_IVAR___IMGenerativeModelsAvailabilityProvider_generativePlaygroundModelsAvailable);
}

+ (BOOL)summarizationModelsAvailable
{
  return sub_1A079185C((uint64_t)a1, (uint64_t)a2, &OBJC_IVAR___IMGenerativeModelsAvailabilityProvider_summarizationModelsAvailable);
}

+ (void)setMessageSummarizationUserPreference:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)sub_1A09F3DE8();
  v5 = (void *)sub_1A09F3DE8();
  id v6 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v3);
  IMSetDomainValueForKey();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end