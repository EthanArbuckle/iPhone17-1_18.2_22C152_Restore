@interface CNCapabilities
+ (BOOL)shouldUseLegacyMessages;
- (BOOL)areTelephonyCallsSupported;
- (BOOL)isFaceTimeAudioSupported;
- (BOOL)isFaceTimeVideoSupported;
- (BOOL)isPaySupported;
- (BOOL)isiMessageSupported;
@end

@implementation CNCapabilities

- (BOOL)areTelephonyCallsSupported
{
  kdebug_trace();
  if (MGGetBoolAnswer()) {
    char v2 = 1;
  }
  else {
    char v2 = [(objc_class *)getTUCallCapabilitiesClass() supportsTelephonyCalls];
  }
  kdebug_trace();
  return v2;
}

- (BOOL)isiMessageSupported
{
  kdebug_trace();
  char v2 = 1;
  if ((_mergedCarrierBundleValue(@"AllowiMessage", 1) & 1) == 0)
  {
    v3 = [(objc_class *)getFTiMessageStatusClass() sharedInstance];
    char v2 = [v3 iMessageSupported];
  }
  kdebug_trace();
  return v2;
}

- (BOOL)isFaceTimeVideoSupported
{
  kdebug_trace();
  if (MGGetBoolAnswer()) {
    char v2 = 1;
  }
  else {
    char v2 = [(objc_class *)getTUCallCapabilitiesClass() supportsDisplayingFaceTimeVideoCalls];
  }
  kdebug_trace();
  return v2;
}

- (BOOL)isFaceTimeAudioSupported
{
  kdebug_trace();
  int v2 = _mergedCarrierBundleValue(@"AllowsFaceTimeAudio", 0);
  char v3 = MGGetBoolAnswer();
  int v4 = MGGetBoolAnswer();
  char v5 = 0;
  if ((v3 & 1) == 0)
  {
    if (v4 & v2) {
      char v5 = 1;
    }
    else {
      char v5 = [(objc_class *)getTUCallCapabilitiesClass() supportsDisplayingFaceTimeAudioCalls];
    }
    kdebug_trace();
  }
  return v5;
}

- (BOOL)isPaySupported
{
  return +[CNUIPassKitWrapper isPeerPaymentAvailable];
}

+ (BOOL)shouldUseLegacyMessages
{
  if (shouldUseLegacyMessages_cn_once_token_2 != -1) {
    dispatch_once(&shouldUseLegacyMessages_cn_once_token_2, &__block_literal_global_37);
  }
  int v2 = (void *)shouldUseLegacyMessages_cn_once_object_2;
  return [v2 BOOLValue];
}

uint64_t __41__CNCapabilities_shouldUseLegacyMessages__block_invoke()
{
  shouldUseLegacyMessages_cn_once_object_2 = [NSNumber numberWithBool:CFPreferencesGetAppBooleanValue(@"ABUseLegacyMessages", @"com.apple.AddressBook", 0) != 0];
  return MEMORY[0x270F9A758]();
}

@end