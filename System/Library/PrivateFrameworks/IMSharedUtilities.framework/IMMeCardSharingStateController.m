@interface IMMeCardSharingStateController
+ (id)sharedInstance;
- (BOOL)imageForkedFromMeCard;
- (BOOL)nameForkedFromMeCard;
- (BOOL)sharingEnabled;
- (BOOL)wasSharingEverEnabled;
- (IMMeCardSharingStateController)init;
- (unint64_t)nameFormat;
- (unint64_t)sharingAudience;
- (void)_incrementSharingVersion;
- (void)_migrateMeCardDomains;
- (void)_syncPreferenceDidChange;
- (void)postNameFormatChangedNotification;
- (void)setImageForkedFromMeCard:(BOOL)a3;
- (void)setNameForkedFromMeCard:(BOOL)a3;
- (void)setNameFormat:(unint64_t)a3;
- (void)setSharingAudience:(unint64_t)a3;
- (void)setSharingEnabled:(BOOL)a3;
@end

@implementation IMMeCardSharingStateController

+ (id)sharedInstance
{
  if (qword_1EB4A66D8 != -1) {
    dispatch_once(&qword_1EB4A66D8, &unk_1EF2BF220);
  }
  return (id)qword_1EB4A6638;
}

- (IMMeCardSharingStateController)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMMeCardSharingStateController;
  v2 = [(IMMeCardSharingStateController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IMMeCardSharingStateController *)v2 _migrateMeCardDomains];
  }
  return v3;
}

- (void)_migrateMeCardDomains
{
  if (IMIsRunningInMobileSMS())
  {
    char v2 = IMGetDomainBoolForKey();
    uint64_t v3 = IMGetCachedDomainValueForKey();
    v4 = (void *)IMGetCachedDomainValueForKey();
    uint64_t v5 = IMGetCachedDomainValueForKey();
    if ((v2 & 1) == 0)
    {
      uint64_t v6 = v5;
      if (v3 || v4 || v5)
      {
        if (v3) {
          IMSetDomainValueForKey();
        }
        if (v4)
        {
          [v4 unsignedIntegerValue];
          IMSetDomainIntForKey();
        }
        if (v6) {
          IMSetDomainValueForKey();
        }
        IMSetDomainBoolForKey();
        IMSetDomainValueForKey();
        IMSetDomainValueForKey();
        IMSetDomainValueForKey();
      }
    }
  }
}

- (BOOL)sharingEnabled
{
  return IMGetDomainBoolForKey();
}

- (void)setSharingEnabled:(BOOL)a3
{
  [NSNumber numberWithBool:a3];
  IMSetDomainValueForKey();

  MEMORY[0x1F4181798](self, sel__syncPreferenceDidChange);
}

- (unint64_t)sharingAudience
{
  unint64_t v3 = IMGetCachedDomainIntForKeyWithDefaultValue();
  if (!v3)
  {
    unint64_t v3 = 1;
    [(IMMeCardSharingStateController *)self setSharingAudience:1];
  }
  return v3;
}

- (void)setSharingAudience:(unint64_t)a3
{
  if (a3 <= 1) {
    a3 = 1;
  }
  [NSNumber numberWithUnsignedInteger:a3];
  IMSetDomainValueForKey();

  MEMORY[0x1F4181798](self, sel__syncPreferenceDidChange);
}

- (unint64_t)nameFormat
{
  return IMGetDomainIntForKey();
}

- (void)setNameFormat:(unint64_t)a3
{
  [NSNumber numberWithUnsignedInteger:a3];

  IMSetDomainValueForKey();
}

- (void)postNameFormatChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.MeCardSharingNameFormat.changed", 0, 0, 1u);
}

- (BOOL)nameForkedFromMeCard
{
  return IMGetDomainIntForKey() != 0;
}

- (void)setNameForkedFromMeCard:(BOOL)a3
{
  [NSNumber numberWithBool:a3];
  IMSetDomainValueForKey();

  MEMORY[0x1F4181798](self, sel__syncPreferenceDidChange);
}

- (BOOL)imageForkedFromMeCard
{
  return IMGetDomainIntForKey() != 0;
}

- (void)setImageForkedFromMeCard:(BOOL)a3
{
  [NSNumber numberWithBool:a3];
  IMSetDomainValueForKey();

  MEMORY[0x1F4181798](self, sel__syncPreferenceDidChange);
}

- (void)_incrementSharingVersion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IMGetDomainIntForKey();
  uint64_t v3 = v2 + 1;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412546;
      uint64_t v6 = [NSNumber numberWithUnsignedInteger:v2];
      __int16 v7 = 2112;
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v3];
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Incrementing our MeCard Sharing pref version number from %@ to %@", (uint8_t *)&v5, 0x16u);
    }
  }
  [NSNumber numberWithUnsignedInteger:v3];
  IMSetDomainValueForKey();
}

- (void)_syncPreferenceDidChange
{
  [(IMMeCardSharingStateController *)self _incrementSharingVersion];
  uint64_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  [v2 postNotificationName:@"__kIMNicknamePreferencesDidChangeNotification" object:0];
}

- (BOOL)wasSharingEverEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(@"MeCardSharingEnabled", @"com.apple.messages.nicknames", &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat != 0;
}

@end