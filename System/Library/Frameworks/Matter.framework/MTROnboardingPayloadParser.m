@interface MTROnboardingPayloadParser
+ (MTRSetupPayload)setupPayloadForOnboardingPayload:(NSString *)onboardingPayload error:(NSError *)error;
@end

@implementation MTROnboardingPayloadParser

+ (MTRSetupPayload)setupPayloadForOnboardingPayload:(NSString *)onboardingPayload error:(NSError *)error
{
  v4 = objc_msgSend_setupPayloadWithOnboardingPayload_error_(MTRSetupPayload, a2, (uint64_t)onboardingPayload, error);

  return (MTRSetupPayload *)v4;
}

@end