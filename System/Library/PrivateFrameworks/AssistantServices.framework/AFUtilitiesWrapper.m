@interface AFUtilitiesWrapper
+ (BOOL)deviceSupportsOnDeviceDictation;
+ (BOOL)isDictationLanguageInstalledForOnDeviceDictation:(id)a3 offlineDictationStatus:(id)a4;
+ (BOOL)uodStatusSupportedFull:(id)a3 languageCode:(id)a4;
@end

@implementation AFUtilitiesWrapper

+ (BOOL)uodStatusSupportedFull:(id)a3 languageCode:(id)a4
{
  return AFUODStatusSupportedFull(a3, a4);
}

+ (BOOL)isDictationLanguageInstalledForOnDeviceDictation:(id)a3 offlineDictationStatus:(id)a4
{
  return AFIsDictationLanguageInstalledForOnDeviceDictation(a3, a4);
}

+ (BOOL)deviceSupportsOnDeviceDictation
{
  if (AFDeviceHighestLanguageModelCapabilityIdentifier_onceToken != -1) {
    dispatch_once(&AFDeviceHighestLanguageModelCapabilityIdentifier_onceToken, &__block_literal_global_705);
  }
  return AFDeviceHighestLanguageModelCapabilityIdentifier_deviceHighestCapabilityIdentifier;
}

@end