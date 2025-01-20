@interface NSBundle
@end

@implementation NSBundle

void __66__NSBundle_GKAdditions___gkBundleIdentifierIsRelatedToContactsUI___block_invoke()
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.iosframeworksqa.GKContactsUITester";
  v4[1] = @"com.apple.mobilephone";
  v4[2] = @"com.apple.MobileSMS";
  v4[3] = @"com.apple.MobileAddressBook";
  v4[4] = @"com.apple.ContactsUI.ContactViewViewService";
  v4[5] = @"com.apple.ContactsUI.ContactsViewService";
  v4[6] = @"com.apple.ContactsUI";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_gkBundleIdentifierIsRelatedToContactsUI__contactsUIBundleIdentifiers;
  _gkBundleIdentifierIsRelatedToContactsUI__contactsUIBundleIdentifiers = v2;
}

void __63__NSBundle_GKAdditions___gkMainBundleIsGameCenterSystemProcess__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  if (([v1 _gkIsGameCenter] & 1) != 0
    || ([v1 _gkIsGameCenterExtension] & 1) != 0
    || ([v1 _gkIsPreferences] & 1) != 0
    || ([v1 _gkIsGameDaemon] & 1) != 0)
  {
    char v0 = 1;
  }
  else
  {
    char v0 = [v1 _gkIsKnownFirstParty];
  }
  _gkMainBundleIsGameCenterSystemProcess_isGameCenterSystemProcess = v0;
}

void __45__NSBundle_GKAdditions___gkIsKnownFirstParty__block_invoke()
{
  v4[13] = *MEMORY[0x1E4F143B8];
  char v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.AppStore";
  v4[1] = @"com.apple.Arcade";
  v4[2] = @"com.apple.Messages";
  v4[3] = @"com.apple.TVAppStore";
  v4[4] = @"com.apple.AppStore.ProductPageExtension";
  v4[5] = @"com.apple.AppStore.SubscribePageExtension";
  v4[6] = @"com.apple.TVAppStore.AppStoreTopShelfExtension";
  v4[7] = @"com.apple.AppStore.Widgets";
  void v4[8] = @"com.apple.Arcade.Widgets";
  v4[9] = @"com.apple.CopresenceCore";
  v4[10] = @"com.apple.RealityHUD";
  v4[11] = @"com.apple.GameCenterOverlay";
  v4[12] = @"com.apple.GameCenterRemoteAlert";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:13];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_gkIsKnownFirstParty_firstPartySetIdentifiers;
  _gkIsKnownFirstParty_firstPartySetIdentifiers = v2;
}

id __68__NSBundle_GKAdditions___gkSystemLocalizedStringForKey_value_table___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v10 = (void *)MEMORY[0x1E4F1CB10];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [a2 bundlePath];
  CFURLRef v16 = [v10 fileURLWithPath:v15];
  CFBundleRef v17 = CFBundleCreate(0, v16);

  v18 = (void *)CFBundleCopyLocalizedStringForLocalization();
  CFRelease(v17);

  return v18;
}

void __53__NSBundle_GKAdditions___gkIsEligibleForOnboardingUI__block_invoke(uint64_t a1)
{
  v8[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = @"com.apple.AppStore";
  v8[1] = @"com.apple.TVAppStore";
  v8[2] = @"com.apple.GameCenterRemoteAlert";
  v8[3] = @"com.apple.RealityHUD";
  v8[4] = @"com.apple.MuseBuddy";
  v8[5] = @"com.apple.internal.appleAccountSetupTool";
  v8[6] = @"com.apple.systempreferences.AppleIDSettings";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:7];
  v4 = [v2 setWithArray:v3];

  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = v5;
  if (_GKIsRemoteUI
    || ([v5 _gkIsGameCenter] & 1) != 0
    || ([v6 _gkIsPreferences] & 1) != 0
    || ([v6 _gkIsContacts] & 1) != 0
    || ([v6 _gkIsGameCenterExtension] & 1) != 0
    || ([v6 _gkIsPurpleBuddy] & 1) != 0
    || [v6 _gkIsAnyOverlayUI])
  {
    _gkIsEligibleForOnboardingUI_isEligible = 0;
  }
  else
  {
    v7 = [*(id *)(a1 + 32) bundleIdentifier];
    _gkIsEligibleForOnboardingUI_isEligible = [v4 containsObject:v7] ^ 1;
  }
}

@end