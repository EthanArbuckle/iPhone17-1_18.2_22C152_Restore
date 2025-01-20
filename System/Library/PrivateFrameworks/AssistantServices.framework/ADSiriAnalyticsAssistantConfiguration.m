@interface ADSiriAnalyticsAssistantConfiguration
- (BOOL)assistantEnabled;
- (BOOL)dictationEnabled;
- (BOOL)gmCapableDevice;
- (BOOL)optedInToDataSharing;
- (BOOL)removePersistentIdentifiers;
@end

@implementation ADSiriAnalyticsAssistantConfiguration

- (BOOL)removePersistentIdentifiers
{
  v2 = +[AFPreferences sharedPreferences];
  char v3 = [v2 longLivedIdentifierUploadingEnabled] ^ 1;

  return v3;
}

- (BOOL)gmCapableDevice
{
  return _AFDeviceSupportsSAEByDeviceCapabilityAndFeatureFlags(self, a2);
}

- (BOOL)optedInToDataSharing
{
  v2 = +[AFPreferences sharedPreferences];
  BOOL v3 = [v2 siriDataSharingOptInStatus] == (id)1;

  return v3;
}

- (BOOL)dictationEnabled
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 dictationIsEnabled];

  return v3;
}

- (BOOL)assistantEnabled
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  return v3;
}

@end