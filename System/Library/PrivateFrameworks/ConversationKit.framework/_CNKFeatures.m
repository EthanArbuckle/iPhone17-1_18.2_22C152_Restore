@interface _CNKFeatures
+ (_CNKFeatures)sharedInstance;
- (BOOL)buttonRemoteControlEnabled;
- (BOOL)callManagerEnabled;
- (BOOL)callRecordingDominoEnabled;
- (BOOL)callRecordingEnabled;
- (BOOL)hudActivityManagerEnabled;
- (BOOL)isAppProtectionEnabled;
- (BOOL)isButtonLayoutEnabled;
- (BOOL)isDialPadEnabled;
- (BOOL)isDominoEnabled;
- (BOOL)isEnhancedEmergencyEnabled;
- (BOOL)isFaceTimeMyselfEnabled;
- (BOOL)isHeroImageEnabled;
- (BOOL)isHeroTitleEnabled;
- (BOOL)isIncomingCallBannerEnabled;
- (BOOL)isNameAndPhotoC3Enabled;
- (BOOL)isSADMessagesEnabled;
- (BOOL)isScreeningLiveActivityEnabled;
- (BOOL)isSystemApertureEnabled;
- (BOOL)isUIFluidTransitionsEnabled;
- (BOOL)lvm_allowLockScreenSleepEnabled;
- (BOOL)lvm_endCallImmediately;
- (BOOL)lvm_stopEnabled;
- (BOOL)requestToScreenShareEnabled;
- (BOOL)shouldEmbedSwapBanner;
- (BOOL)shouldShowFullScreenCallWaiting;
- (BOOL)usesModernScreenSharingFromMessages;
- (_CNKFeatures)init;
@end

@implementation _CNKFeatures

+ (_CNKFeatures)sharedInstance
{
  id v2 = static Features.shared.getter();
  return (_CNKFeatures *)v2;
}

- (BOOL)isUIFluidTransitionsEnabled
{
  id v2 = self;
  char v3 = Features.isUIFluidTransitionsEnabled.getter();

  return v3 & 1;
}

- (_CNKFeatures)init
{
  return (_CNKFeatures *)Features.init()();
}

- (BOOL)isSystemApertureEnabled
{
  id v2 = self;
  char v3 = Features.isSystemApertureEnabled.getter();

  return v3 & 1;
}

- (BOOL)isIncomingCallBannerEnabled
{
  id v2 = self;
  char v3 = Features.isIncomingCallBannerEnabled.getter();

  return v3 & 1;
}

- (BOOL)isHeroImageEnabled
{
  id v2 = self;
  char v3 = Features.isHeroImageEnabled.getter();

  return v3 & 1;
}

- (BOOL)isHeroTitleEnabled
{
  id v2 = self;
  char v3 = Features.isHeroTitleEnabled.getter();

  return v3 & 1;
}

- (BOOL)isEnhancedEmergencyEnabled
{
  id v2 = self;
  char v3 = Features.isEnhancedEmergencyEnabled.getter();

  return v3 & 1;
}

- (BOOL)isSADMessagesEnabled
{
  id v2 = self;
  char v3 = Features.isSADMessagesEnabled.getter();

  return v3 & 1;
}

- (BOOL)isDialPadEnabled
{
  id v2 = self;
  char v3 = Features.isDialPadEnabled.getter();

  return v3 & 1;
}

- (BOOL)isButtonLayoutEnabled
{
  id v2 = self;
  char v3 = Features.isButtonLayoutEnabled.getter();

  return v3 & 1;
}

- (BOOL)isScreeningLiveActivityEnabled
{
  id v2 = self;
  char v3 = Features.isScreeningLiveActivityEnabled.getter();

  return v3 & 1;
}

- (BOOL)shouldEmbedSwapBanner
{
  id v2 = self;
  char v3 = Features.shouldEmbedSwapBanner.getter();

  return v3 & 1;
}

- (BOOL)isFaceTimeMyselfEnabled
{
  id v2 = self;
  char v3 = Features.isFaceTimeMyselfEnabled.getter();

  return v3 & 1;
}

- (BOOL)shouldShowFullScreenCallWaiting
{
  id v2 = self;
  char v3 = Features.shouldShowFullScreenCallWaiting.getter();

  return v3 & 1;
}

- (BOOL)isDominoEnabled
{
  id v2 = self;
  char v3 = Features.isDominoEnabled.getter();

  return v3 & 1;
}

- (BOOL)isNameAndPhotoC3Enabled
{
  id v2 = self;
  char v3 = Features.isNameAndPhotoC3Enabled.getter();

  return v3 & 1;
}

- (BOOL)callManagerEnabled
{
  id v2 = self;
  char v3 = Features.callManagerEnabled.getter();

  return v3 & 1;
}

- (BOOL)hudActivityManagerEnabled
{
  id v2 = self;
  char v3 = Features.hudActivityManagerEnabled.getter();

  return v3 & 1;
}

- (BOOL)requestToScreenShareEnabled
{
  id v2 = self;
  char v3 = Features.requestToScreenShareEnabled.getter();

  return v3 & 1;
}

- (BOOL)usesModernScreenSharingFromMessages
{
  id v2 = self;
  char v3 = Features.usesModernScreenSharingFromMessages.getter();

  return v3 & 1;
}

- (BOOL)isAppProtectionEnabled
{
  id v2 = self;
  char v3 = Features.isAppProtectionEnabled.getter();

  return v3 & 1;
}

- (BOOL)buttonRemoteControlEnabled
{
  id v2 = self;
  char v3 = Features.buttonRemoteControlEnabled.getter();

  return v3 & 1;
}

- (BOOL)callRecordingEnabled
{
  id v2 = self;
  char v3 = Features.callRecordingEnabled.getter();

  return v3 & 1;
}

- (BOOL)callRecordingDominoEnabled
{
  id v2 = self;
  char v3 = Features.callRecordingDominoEnabled.getter();

  return v3 & 1;
}

- (BOOL)lvm_stopEnabled
{
  id v2 = self;
  char v3 = Features.lvm_stopEnabled.getter();

  return v3 & 1;
}

- (BOOL)lvm_allowLockScreenSleepEnabled
{
  id v2 = self;
  char v3 = Features.lvm_allowLockScreenSleepEnabled.getter();

  return v3 & 1;
}

- (BOOL)lvm_endCallImmediately
{
  id v2 = self;
  char v3 = Features.lvm_endCallImmediately.getter();

  return v3 & 1;
}

@end