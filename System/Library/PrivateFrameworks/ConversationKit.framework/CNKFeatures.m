@interface CNKFeatures
+ (CNKFeatures)sharedInstance;
- (BOOL)buttonRemoteControlEnabled;
- (BOOL)callManagerEnabled;
- (BOOL)callRecordingDominoEnabled;
- (BOOL)callRecordingEnabled;
- (BOOL)isButtonLayoutEnabled;
- (BOOL)isDialPadEnabled;
- (BOOL)isDominoEnabled;
- (BOOL)isEnhancedEmergencyEnabled;
- (BOOL)isHeroImageEnabled;
- (BOOL)isHeroTitleEnabled;
- (BOOL)isIncomingCallBannerEnabled;
- (BOOL)isNameAndPhotoC3Enabled;
- (BOOL)isSADMessagesEnabled;
- (BOOL)isSystemApertureEnabled;
- (BOOL)isUIFluidTransitionsEnabled;
- (BOOL)lvm_allowLockScreenSleepEnabled;
- (BOOL)lvm_endCallImmediately;
- (BOOL)lvm_stopEnabled;
- (BOOL)requestToScreenShareEnabled;
- (BOOL)shouldEmbedSwapBanner;
- (BOOL)shouldShowFullScreenCallWaiting;
@end

@implementation CNKFeatures

- (BOOL)isUIFluidTransitionsEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isUIFluidTransitionsEnabled];

  return v3;
}

void __29__CNKFeatures_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CNKFeatures);
  v1 = (void *)sharedInstance_sFeatures;
  sharedInstance_sFeatures = (uint64_t)v0;
}

+ (CNKFeatures)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sFeatures;
  return (CNKFeatures *)v2;
}

- (BOOL)isSystemApertureEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isSystemApertureEnabled];

  return v3;
}

- (BOOL)isIncomingCallBannerEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isIncomingCallBannerEnabled];

  return v3;
}

- (BOOL)isHeroImageEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isHeroImageEnabled];

  return v3;
}

- (BOOL)isHeroTitleEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isHeroTitleEnabled];

  return v3;
}

- (BOOL)isButtonLayoutEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isButtonLayoutEnabled];

  return v3;
}

- (BOOL)isDialPadEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isDialPadEnabled];

  return v3;
}

- (BOOL)isEnhancedEmergencyEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isEnhancedEmergencyEnabled];

  return v3;
}

- (BOOL)isSADMessagesEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isSADMessagesEnabled];

  return v3;
}

- (BOOL)shouldEmbedSwapBanner
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 shouldEmbedSwapBanner];

  return v3;
}

- (BOOL)shouldShowFullScreenCallWaiting
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 shouldShowFullScreenCallWaiting];

  return v3;
}

- (BOOL)callManagerEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 callManagerEnabled];

  return v3;
}

- (BOOL)isDominoEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isDominoEnabled];

  return v3;
}

- (BOOL)isNameAndPhotoC3Enabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 isNameAndPhotoC3Enabled];

  return v3;
}

- (BOOL)buttonRemoteControlEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 buttonRemoteControlEnabled];

  return v3;
}

- (BOOL)callRecordingEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 callRecordingEnabled];

  return v3;
}

- (BOOL)callRecordingDominoEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 callRecordingDominoEnabled];

  return v3;
}

- (BOOL)requestToScreenShareEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = [v2 requestToScreenShareEnabled];

  return v3;
}

- (BOOL)lvm_stopEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = objc_msgSend(v2, "lvm_stopEnabled");

  return v3;
}

- (BOOL)lvm_endCallImmediately
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = objc_msgSend(v2, "lvm_endCallImmediately");

  return v3;
}

- (BOOL)lvm_allowLockScreenSleepEnabled
{
  v2 = +[_CNKFeatures sharedInstance];
  char v3 = objc_msgSend(v2, "lvm_allowLockScreenSleepEnabled");

  return v3;
}

@end