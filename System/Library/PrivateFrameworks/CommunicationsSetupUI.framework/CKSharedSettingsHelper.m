@interface CKSharedSettingsHelper
- (id)_syncManager;
- (void)setConversationListFilteringEnabled:(BOOL)a3;
- (void)setReadReceiptsEnabled:(BOOL)a3;
@end

@implementation CKSharedSettingsHelper

- (void)setReadReceiptsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = MEMORY[0x223C3A160](@"com.apple.madrid", @"GlobalReadReceiptVersionID");
  id v10 = v5;
  if (v5) {
    uint64_t v6 = [v5 integerValue] + 1;
  }
  else {
    uint64_t v6 = 1;
  }
  CFPreferencesSetAppValue(@"GlobalReadReceiptVersionID", (CFPropertyListRef)[NSNumber numberWithInteger:v6], @"com.apple.madrid");
  CFPreferencesSetAppValue(@"ReadReceiptsEnabled", (CFPropertyListRef)[NSNumber numberWithBool:v3], @"com.apple.madrid");
  CFPreferencesSynchronize(@"com.apple.madrid", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.ReadReceiptsEnabled.changed", 0, 0, 1u);
  notify_post("com.apple.MobileSMS.ReadReceiptsEnabled.shouldUpdateDevices");
  if (PSIsNanoMirroringDomain())
  {
    v8 = [(CKSharedSettingsHelper *)self _syncManager];
    v9 = [MEMORY[0x263EFFA08] setWithObject:@"ReadReceiptsEnabled"];
    [v8 synchronizeUserDefaultsDomain:@"com.apple.madrid" keys:v9];
  }
}

- (void)setConversationListFilteringEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(@"IncomingMessageAlertFiltration", (CFPropertyListRef)[NSNumber numberWithBool:a3], @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"IncomingMessageAlertFiltrationForcedOn", (CFPropertyListRef)*MEMORY[0x263EFFB38], @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"MessageFilteringSettingsConfirmed", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertFiltration.changed", 0, 0, 1u);
  v5 = (void (*)(void))CUTWeakLinkSymbol();
  if (v5) {
    v5();
  }
  id v7 = [(CKSharedSettingsHelper *)self _syncManager];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"IncomingMessageAlertFiltration", @"IncomingMessageAlertFiltrationForcedOn", @"MessageFilteringSettingsConfirmed", 0);
  [v7 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v6];
}

- (id)_syncManager
{
  v2 = (objc_class *)CUTWeakLinkClass();
  if (v2) {
    v2 = (objc_class *)objc_alloc_init(v2);
  }
  return v2;
}

@end