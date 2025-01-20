@interface SensitivityFeatureFlags
+ (BOOL)isCommunicationSafetyEnabled;
+ (BOOL)isContactNudityDetectionEnabled;
+ (BOOL)isSensitivityAvatarTreatmentEnabled;
- (_TtC13InCallService23SensitivityFeatureFlags)init;
@end

@implementation SensitivityFeatureFlags

+ (BOOL)isSensitivityAvatarTreatmentEnabled
{
  return sub_1001C3760() & 1;
}

+ (BOOL)isContactNudityDetectionEnabled
{
  return sub_1001C3798() & 1;
}

+ (BOOL)isCommunicationSafetyEnabled
{
  return sub_1001C3858() & 1;
}

- (_TtC13InCallService23SensitivityFeatureFlags)init
{
  return (_TtC13InCallService23SensitivityFeatureFlags *)sub_1001831FC();
}

@end