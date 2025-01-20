@interface AssistantDetailController
- (BOOL)_isApplicationHiddenCheck:(id)a3;
- (BOOL)_isApplicationLockedCheck:(id)a3;
- (id)_appName;
- (id)_bundleId;
- (id)_enableSiriAppSpecifiersWithAppId:(id)a3 accessGranted:(BOOL)a4;
- (id)_siriSuggestionsClients;
- (id)_suggestionsFooterString;
- (id)_suggestionsShowToggleLableString;
- (id)_watchBundleToMirrorWithBundleId:(id)a3;
- (id)askSiriUseWithAskSiriEnabled:(id)a3;
- (id)inAppLearnFromAppEnabled:(id)a3;
- (id)specifiers;
- (id)suggestionsShowInAppEnabled:(id)a3;
- (id)suggestionsShowOnHomeScreenEnabled:(id)a3;
- (id)suggestionsSuggestAppEnabled:(id)a3;
- (id)suggestionsSuggestionNotificationEnabled:(id)a3;
- (void)_addInAppSpecifiersToSpecifiers:(id)a3;
- (void)_addSuggestionsSpecifiersToSpecifiers:(id)a3;
- (void)_asyncAddAskSiriSettingsIfNecessary;
- (void)_authenticateForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)_fetchIntentsSpecifiersWithCompletion:(id)a3;
- (void)setAskSiriUseWithAskSiriEnabled:(id)a3 specifier:(id)a4;
- (void)setInAppLearnFromAppEnabled:(id)a3 specifier:(id)a4;
- (void)setNanoInAppShowSiriSuggestionsEnabled:(BOOL)a3 bundleId:(id)a4;
- (void)setSuggestionsShowInAppEnabled:(id)a3 specifier:(id)a4;
- (void)setSuggestionsShowOnHomeScreenEnabled:(id)a3 specifier:(id)a4;
- (void)setSuggestionsSuggestAppEnabled:(id)a3 specifier:(id)a4;
- (void)setSuggestionsSuggestionNotificationsEnabled:(id)a3 specifier:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AssistantDetailController

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AssistantDetailController;
  [(AssistantDetailController *)&v5 viewWillAppear:a3];
  if ([(AssistantDetailController *)self isMovingToParentViewController])
  {
    v4 = [(AssistantDetailController *)self _bundleId];
    +[AssistantMetrics didDetailVisit:v4];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if (!self->_suggestionsController)
    {
      objc_super v5 = [MEMORY[0x263F287B0] sharedController];
      suggestionsController = self->_suggestionsController;
      self->_suggestionsController = v5;
    }
    v7 = [(AssistantDetailController *)self _bundleId];
    self->_isApplicationHidden = [(AssistantDetailController *)self _isApplicationHiddenCheck:v7];

    v8 = [(AssistantDetailController *)self _bundleId];
    self->_isApplicationLocked = [(AssistantDetailController *)self _isApplicationLockedCheck:v8];

    v9 = [MEMORY[0x263EFF980] array];
    [(AssistantDetailController *)self _addInAppSpecifiersToSpecifiers:v9];
    [(AssistantDetailController *)self _addSuggestionsSpecifiersToSpecifiers:v9];
    [(AssistantDetailController *)self _asyncAddAskSiriSettingsIfNecessary];
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (BOOL)_isApplicationHiddenCheck:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:a3];
  v4 = [MEMORY[0x263F251D0] hiddenApplications];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)_isApplicationLockedCheck:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:a3];
  v4 = [MEMORY[0x263F251D0] lockedApplications];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (void)_addInAppSpecifiersToSpecifiers:(id)a3
{
  id v35 = a3;
  v4 = (void *)MEMORY[0x263F5FC40];
  char v5 = NSString;
  v6 = +[AssistantController bundle];
  v7 = [v6 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_INAPP_HEADER" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v8 = [(AssistantDetailController *)self _appName];
  v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8);
  v10 = [v4 groupSpecifierWithName:v9];

  v11 = NSString;
  v12 = +[AssistantController bundle];
  v13 = [v12 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_INAPP_FOOTER" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v14 = [(AssistantDetailController *)self _appName];
  v15 = [(AssistantDetailController *)self _appName];
  v16 = objc_msgSend(v11, "stringWithFormat:", v13, v14, v15);
  uint64_t v17 = *MEMORY[0x263F600F8];
  [v10 setProperty:v16 forKey:*MEMORY[0x263F600F8]];

  v18 = (void *)MEMORY[0x263F600A8];
  if (self->_isApplicationHidden)
  {
    v19 = (void *)MEMORY[0x263F5FC40];
    v20 = NSString;
    v21 = +[AssistantController bundle];
    v22 = [v21 localizedStringForKey:&stru_26D2AB140 value:&stru_26D2AB140 table:@"AssistantSettings"];
    v23 = [v20 stringWithFormat:v22];
    v24 = [v19 groupSpecifierWithName:v23];

    v25 = NSString;
    v26 = +[AssistantController bundle];
    v27 = [v26 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_INAPP_HEADER_DETAIL" value:&stru_26D2AB140 table:@"AssistantSettings"];
    v28 = [(AssistantDetailController *)self _appName];
    v29 = [(AssistantDetailController *)self _appName];
    v30 = objc_msgSend(v25, "stringWithFormat:", v27, v28, v29);
    [v24 setProperty:v30 forKey:v17];

    v18 = (void *)MEMORY[0x263F600A8];
    [v35 addObject:v24];
    [v10 setProperty:MEMORY[0x263EFFA80] forKey:*v18];
  }
  [v35 addObject:v10];
  v31 = (void *)MEMORY[0x263F5FC40];
  v32 = +[AssistantController bundle];
  v33 = [v32 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_INAPP_LEARNFROMAPP_TOGGLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v34 = [v31 preferenceSpecifierNamed:v33 target:self set:sel_setInAppLearnFromAppEnabled_specifier_ get:sel_inAppLearnFromAppEnabled_ detail:0 cell:6 edit:0];

  [v34 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  if (self->_isApplicationHidden) {
    [v34 setProperty:MEMORY[0x263EFFA80] forKey:*v18];
  }
  [v35 addObject:v34];
}

- (void)setNanoInAppShowSiriSuggestionsEnabled:(BOOL)a3 bundleId:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  char v5 = (void *)CFPreferencesCopyAppValue(@"NanoAppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  v6 = v5;
  if (v5) {
    v7 = (void *)[v5 mutableCopy];
  }
  else {
    v7 = objc_opt_new();
  }
  v8 = v7;
  if (v4)
  {
    [v7 removeObject:v10];
  }
  else if (([v7 containsObject:v10] & 1) == 0)
  {
    [v8 addObject:v10];
  }
  CFPreferencesSetAppValue(@"NanoAppCanShowSiriSuggestionsBlacklist", v8, @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (id)inAppLearnFromAppEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  BOOL v4 = [(AssistantDetailController *)self _bundleId];
  char v5 = (void *)CFPreferencesCopyAppValue(@"SiriCanLearnFromAppBlacklist", @"com.apple.suggestions");
  uint64_t v6 = [v5 containsObject:v4] ^ 1;

  v7 = [v3 numberWithBool:v6];

  return v7;
}

- (void)_authenticateForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (self->_isApplicationLocked)
  {
    v8 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:a3];
    v9 = [MEMORY[0x263F251F8] sharedGuard];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __73__AssistantDetailController__authenticateForBundleIdentifier_completion___block_invoke;
    v10[3] = &unk_26457D920;
    id v11 = v7;
    [v9 authenticateForSubject:v8 relayingAuditToken:1 completion:v10];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
  }
}

uint64_t __73__AssistantDetailController__authenticateForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setInAppLearnFromAppEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__AssistantDetailController_setInAppLearnFromAppEnabled_specifier___block_invoke;
  aBlock[3] = &unk_26457D530;
  objc_copyWeak(&v21, &location);
  id v8 = v6;
  id v20 = v8;
  v9 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__AssistantDetailController_setInAppLearnFromAppEnabled_specifier___block_invoke_2;
  v17[3] = &unk_26457CF60;
  objc_copyWeak(&v18, &location);
  id v10 = _Block_copy(v17);
  id v11 = [(AssistantDetailController *)self _bundleId];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__AssistantDetailController_setInAppLearnFromAppEnabled_specifier___block_invoke_3;
  v14[3] = &unk_26457D948;
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [(AssistantDetailController *)self _authenticateForBundleIdentifier:v11 completion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __67__AssistantDetailController_setInAppLearnFromAppEnabled_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained _bundleId];
  int v3 = [*(id *)(a1 + 32) BOOLValue];
  id v4 = v2;
  char v5 = (void *)CFPreferencesCopyAppValue(@"SiriCanLearnFromAppBlacklist", @"com.apple.suggestions");
  id v6 = v5;
  if (v5) {
    id v7 = (void *)[v5 mutableCopy];
  }
  else {
    id v7 = objc_opt_new();
  }
  id v8 = v7;
  if (v3)
  {
    [v7 removeObject:v4];
  }
  else if (([v7 containsObject:v4] & 1) == 0)
  {
    [v8 addObject:v4];
  }
  CFPreferencesSetAppValue(@"SiriCanLearnFromAppBlacklist", v8, @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);

  id v10 = [WeakRetained _bundleId];
  +[AssistantMetrics didDetailToggle:bundleId:on:](AssistantMetrics, "didDetailToggle:bundleId:on:", @"inAppLearn", v10, [*(id *)(a1 + 32) BOOLValue]);
}

void __67__AssistantDetailController_setInAppLearnFromAppEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __67__AssistantDetailController_setInAppLearnFromAppEnabled_specifier___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2 = 40;
  if (a2) {
    uint64_t v2 = 32;
  }
  dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + v2));
}

- (void)_addSuggestionsSpecifiersToSpecifiers:(id)a3
{
  id v39 = a3;
  id v4 = (void *)MEMORY[0x263F5FC40];
  char v5 = NSString;
  id v6 = +[AssistantController bundle];
  id v7 = [v6 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_SUGGESTIONS_HEADER" value:&stru_26D2AB140 table:@"AssistantSettings"];
  id v8 = [(AssistantDetailController *)self _appName];
  v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8);
  id v10 = [v4 groupSpecifierWithName:v9];

  id v11 = NSString;
  id v12 = [(AssistantDetailController *)self _suggestionsFooterString];
  id v13 = [(AssistantDetailController *)self _appName];
  v14 = [(AssistantDetailController *)self _appName];
  id v15 = objc_msgSend(v11, "stringWithFormat:", v12, v13, v14);
  [v10 setProperty:v15 forKey:*MEMORY[0x263F600F8]];

  id v16 = (void *)MEMORY[0x263F600A8];
  if (self->_isApplicationHidden) {
    [v10 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  [v39 addObject:v10];
  uint64_t v17 = [(AssistantDetailController *)self _siriSuggestionsClients];
  id v18 = [(AssistantDetailController *)self _bundleId];
  char v19 = [v17 containsObject:v18];

  if (v19)
  {
    id v20 = (void *)MEMORY[0x263F5FC40];
    id v21 = [(AssistantDetailController *)self _suggestionsShowToggleLableString];
    v22 = [v20 preferenceSpecifierNamed:v21 target:self set:sel_setSuggestionsShowInAppEnabled_specifier_ get:sel_suggestionsShowInAppEnabled_ detail:0 cell:6 edit:0];

    uint64_t v23 = *MEMORY[0x263F5FEF8];
    [v22 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    if (self->_isApplicationHidden) {
      [v22 setProperty:MEMORY[0x263EFFA80] forKey:*v16];
    }
    [v39 addObject:v22];
  }
  else
  {
    uint64_t v23 = *MEMORY[0x263F5FEF8];
  }
  v24 = (void *)MEMORY[0x263F5FC40];
  v25 = +[AssistantController bundle];
  v26 = [v25 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_SUGGESTIONS_SHOWONHOMESCREEN_TOGGLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v27 = [v24 preferenceSpecifierNamed:v26 target:self set:sel_setSuggestionsShowOnHomeScreenEnabled_specifier_ get:sel_suggestionsShowOnHomeScreenEnabled_ detail:0 cell:6 edit:0];

  [v27 setProperty:MEMORY[0x263EFFA88] forKey:v23];
  if (self->_isApplicationHidden) {
    [v27 setProperty:MEMORY[0x263EFFA80] forKey:*v16];
  }
  [v39 addObject:v27];
  v28 = (void *)MEMORY[0x263F5FC40];
  v29 = +[AssistantController bundle];
  v30 = [v29 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_SUGGESTIONS_SUGGESTAPP_TOGGLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v31 = [v28 preferenceSpecifierNamed:v30 target:self set:sel_setSuggestionsSuggestAppEnabled_specifier_ get:sel_suggestionsSuggestAppEnabled_ detail:0 cell:6 edit:0];

  [v31 setProperty:MEMORY[0x263EFFA88] forKey:v23];
  if (self->_isApplicationHidden) {
    [v31 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  [v39 addObject:v31];
  v32 = (void *)CFPreferencesCopyAppValue(@"LockScreenSuggestionsDisabled", @"com.apple.lockscreen.shared");
  if (!v32 || (v33 = v32, char v34 = [v32 BOOLValue], v33, (v34 & 1) == 0))
  {
    if (!+[AssistantUtilities deviceIsVision])
    {
      id v35 = (void *)MEMORY[0x263F5FC40];
      v36 = +[AssistantController bundle];
      v37 = [v36 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_SUGGESTIONS_SUGGESTION_NOTIFICATIONS_TOGGLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
      v38 = [v35 preferenceSpecifierNamed:v37 target:self set:sel_setSuggestionsSuggestionNotificationsEnabled_specifier_ get:sel_suggestionsSuggestionNotificationEnabled_ detail:0 cell:6 edit:0];

      [v38 setProperty:MEMORY[0x263EFFA88] forKey:v23];
      if (self->_isApplicationHidden) {
        [v38 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
      }
      [v39 addObject:v38];
    }
  }
}

- (id)_suggestionsShowToggleLableString
{
  uint64_t v2 = [(AssistantDetailController *)self _bundleId];
  if ([v2 isEqualToString:@"com.apple.MobileAddressBook"])
  {
    int v3 = +[AssistantController bundle];
    id v4 = v3;
    char v5 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_SHOWINAPP_TOGGLE_CONTACTSAPP";
  }
  else
  {
    int v6 = [v2 isEqualToString:@"com.apple.mobilephone"];
    int v3 = +[AssistantController bundle];
    id v4 = v3;
    if (v6) {
      char v5 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_SHOWINAPP_TOGGLE_PHONEAPP";
    }
    else {
      char v5 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_SHOWINAPP_TOGGLE";
    }
  }
  id v7 = [v3 localizedStringForKey:v5 value:&stru_26D2AB140 table:@"AssistantSettings"];

  return v7;
}

- (id)_suggestionsFooterString
{
  int v3 = [(AssistantDetailController *)self _bundleId];
  if ([v3 isEqualToString:@"com.apple.MobileAddressBook"])
  {
    id v4 = (void *)CFPreferencesCopyAppValue(@"LockScreenSuggestionsDisabled", @"com.apple.lockscreen.shared");
    if (v4 && (char v5 = v4, v6 = [v4 BOOLValue], v5, (v6 & 1) != 0))
    {
      id v7 = +[AssistantController bundle];
      id v8 = v7;
      v9 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_CONTACTSAPP_NONOTIFICATIONS";
    }
    else
    {
      id v7 = +[AssistantController bundle];
      id v8 = v7;
      v9 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_CONTACTSAPP_WITHNOTIFICATIONS";
    }
  }
  else if ([v3 isEqualToString:@"com.apple.mobilephone"])
  {
    id v10 = (void *)CFPreferencesCopyAppValue(@"LockScreenSuggestionsDisabled", @"com.apple.lockscreen.shared");
    if (v10 && (id v11 = v10, v12 = [v10 BOOLValue], v11, (v12 & 1) != 0))
    {
      id v7 = +[AssistantController bundle];
      id v8 = v7;
      v9 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_PHONEAPP_NONOTIFICATIONS";
    }
    else
    {
      id v7 = +[AssistantController bundle];
      id v8 = v7;
      v9 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_PHONEAPP_WITHNOTIFICATIONS";
    }
  }
  else
  {
    id v13 = [(AssistantDetailController *)self _siriSuggestionsClients];
    int v14 = [v13 containsObject:v3];

    BOOL v15 = +[AssistantUtilities deviceIsVision];
    if (v14)
    {
      if (v15)
      {
        id v7 = +[AssistantController bundle];
        id v8 = v7;
        v9 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_WITHSHOW_VISION";
      }
      else
      {
        id v16 = (void *)CFPreferencesCopyAppValue(@"LockScreenSuggestionsDisabled", @"com.apple.lockscreen.shared");
        if (v16 && (uint64_t v17 = v16, v18 = [v16 BOOLValue], v17, (v18 & 1) != 0))
        {
          id v7 = +[AssistantController bundle];
          id v8 = v7;
          v9 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_WITHSHOW_NONOTIFICATIONS";
        }
        else
        {
          id v7 = +[AssistantController bundle];
          id v8 = v7;
          v9 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_WITHSHOW_WITHNOTIFICATIONS";
        }
      }
    }
    else if (v15)
    {
      id v7 = +[AssistantController bundle];
      id v8 = v7;
      v9 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_NOSHOW_VISION";
    }
    else
    {
      char v19 = (void *)CFPreferencesCopyAppValue(@"LockScreenSuggestionsDisabled", @"com.apple.lockscreen.shared");
      if (v19 && (id v20 = v19, v21 = [v19 BOOLValue], v20, (v21 & 1) != 0))
      {
        id v7 = +[AssistantController bundle];
        id v8 = v7;
        v9 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_NOSHOW_WITHNOTIFICATIONS";
      }
      else
      {
        id v7 = +[AssistantController bundle];
        id v8 = v7;
        v9 = @"SIRIANDSEARCH_PERAPP_SUGGESTIONS_FOOTER_NOSHOW_NONOTIFICATIONS";
      }
    }
  }
  v22 = [v7 localizedStringForKey:v9 value:&stru_26D2AB140 table:@"AssistantSettings"];

  return v22;
}

- (id)suggestionsShowInAppEnabled:(id)a3
{
  int v3 = NSNumber;
  id v4 = [(AssistantDetailController *)self _bundleId];
  char v5 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  uint64_t v6 = [v5 containsObject:v4] ^ 1;

  id v7 = [v3 numberWithBool:v6];

  return v7;
}

- (void)setSuggestionsShowInAppEnabled:(id)a3 specifier:(id)a4
{
  id v18 = a3;
  char v5 = [(AssistantDetailController *)self _bundleId];
  uint64_t v6 = [(AssistantDetailController *)self _watchBundleToMirrorWithBundleId:v5];

  if (v6) {
    -[AssistantDetailController setNanoInAppShowSiriSuggestionsEnabled:bundleId:](self, "setNanoInAppShowSiriSuggestionsEnabled:bundleId:", [v18 BOOLValue], v6);
  }
  id v7 = [(AssistantDetailController *)self _bundleId];
  int v8 = [v18 BOOLValue];
  id v9 = v7;
  id v10 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  id v11 = v10;
  if (v10) {
    char v12 = (void *)[v10 mutableCopy];
  }
  else {
    char v12 = objc_opt_new();
  }
  id v13 = v12;
  if (v8)
  {
    [v12 removeObject:v9];
  }
  else if (([v12 containsObject:v9] & 1) == 0)
  {
    [v13 addObject:v9];
  }
  CFPreferencesSetAppValue(@"AppCanShowSiriSuggestionsBlacklist", v13, @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);

  BOOL v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"NanoAppCanShowSiriSuggestionsBlacklist", @"AppCanShowSiriSuggestionsBlacklist", 0);
  id v16 = objc_opt_new();
  [v16 synchronizeUserDefaultsDomain:@"com.apple.suggestions" keys:v15];

  uint64_t v17 = [(AssistantDetailController *)self _bundleId];
  +[AssistantMetrics didDetailToggle:bundleId:on:](AssistantMetrics, "didDetailToggle:bundleId:on:", @"inAppShow", v17, [v18 BOOLValue]);
}

- (id)suggestionsShowOnHomeScreenEnabled:(id)a3
{
  int v3 = NSNumber;
  suggestionsController = self->_suggestionsController;
  char v5 = [(AssistantDetailController *)self _bundleId];
  uint64_t v6 = objc_msgSend(v3, "numberWithBool:", -[ASFSuggestionsController suggestionsShowOnHomeScreenEnabledForBundleId:](suggestionsController, "suggestionsShowOnHomeScreenEnabledForBundleId:", v5));

  return v6;
}

- (void)setSuggestionsShowOnHomeScreenEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__AssistantDetailController_setSuggestionsShowOnHomeScreenEnabled_specifier___block_invoke;
  aBlock[3] = &unk_26457D530;
  objc_copyWeak(&v21, &location);
  id v8 = v6;
  id v20 = v8;
  id v9 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__AssistantDetailController_setSuggestionsShowOnHomeScreenEnabled_specifier___block_invoke_2;
  v17[3] = &unk_26457CF60;
  objc_copyWeak(&v18, &location);
  id v10 = _Block_copy(v17);
  id v11 = [(AssistantDetailController *)self _bundleId];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__AssistantDetailController_setSuggestionsShowOnHomeScreenEnabled_specifier___block_invoke_3;
  v14[3] = &unk_26457D948;
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [(AssistantDetailController *)self _authenticateForBundleIdentifier:v11 completion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __77__AssistantDetailController_setSuggestionsShowOnHomeScreenEnabled_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  int v3 = [WeakRetained _bundleId];
  [WeakRetained[173] setSuggestionsShowOnHomeScreenEnabled:v2 bundleId:v3];
}

void __77__AssistantDetailController_setSuggestionsShowOnHomeScreenEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void __77__AssistantDetailController_setSuggestionsShowOnHomeScreenEnabled_specifier___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2 = 40;
  if (a2) {
    uint64_t v2 = 32;
  }
  dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + v2));
}

- (id)suggestionsSuggestAppEnabled:(id)a3
{
  int v3 = NSNumber;
  suggestionsController = self->_suggestionsController;
  char v5 = [(AssistantDetailController *)self _bundleId];
  id v6 = objc_msgSend(v3, "numberWithBool:", -[ASFSuggestionsController suggestionsSuggestAppEnabledForBundleId:](suggestionsController, "suggestionsSuggestAppEnabledForBundleId:", v5));

  return v6;
}

- (void)setSuggestionsSuggestAppEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [(AssistantDetailController *)self _bundleId];
  [(ASFSuggestionsController *)self->_suggestionsController setSuggestionsSuggestAppEnabled:v5 bundleId:v6];
}

- (id)suggestionsSuggestionNotificationEnabled:(id)a3
{
  int v3 = NSNumber;
  suggestionsController = self->_suggestionsController;
  uint64_t v5 = [(AssistantDetailController *)self _bundleId];
  id v6 = objc_msgSend(v3, "numberWithBool:", -[ASFSuggestionsController suggestionsNotificationEnabledForBundleId:](suggestionsController, "suggestionsNotificationEnabledForBundleId:", v5));

  return v6;
}

- (void)setSuggestionsSuggestionNotificationsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [(AssistantDetailController *)self specifier];
  id v7 = [v6 propertyForKey:@"BUNDLE_ID"];

  [(ASFSuggestionsController *)self->_suggestionsController setSuggestionsNotificationsEnabled:v5 bundleId:v7];
}

- (void)_asyncAddAskSiriSettingsIfNecessary
{
  if (+[AssistantUtilities assistantEnabled])
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __64__AssistantDetailController__asyncAddAskSiriSettingsIfNecessary__block_invoke;
    v3[3] = &unk_26457D970;
    objc_copyWeak(&v4, &location);
    [(AssistantDetailController *)self _fetchIntentsSpecifiersWithCompletion:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __64__AssistantDetailController__asyncAddAskSiriSettingsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __64__AssistantDetailController__asyncAddAskSiriSettingsIfNecessary__block_invoke_2;
    v4[3] = &unk_26457D530;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    id v5 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v6);
  }
}

void __64__AssistantDetailController__asyncAddAskSiriSettingsIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained insertContiguousSpecifiers:*(void *)(a1 + 32) afterSpecifier:0 animated:0];
    id WeakRetained = v3;
  }
}

- (void)_fetchIntentsSpecifiersWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__AssistantDetailController__fetchIntentsSpecifiersWithCompletion___block_invoke;
  v6[3] = &unk_26457D028;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[IntentsUtilities intentsAppsWithCompletion:v6];
}

void __67__AssistantDetailController__fetchIntentsSpecifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v16 = v3;
      uint64_t v7 = *(void *)v18;
      id v8 = (void *)MEMORY[0x263EFFA68];
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v11 = [v10 appID];
          id v12 = [*(id *)(a1 + 32) _bundleId];
          int v13 = [v11 isEqualToString:v12];

          if (v13)
          {
            int v14 = *(void **)(a1 + 32);
            id v15 = [v10 appID];
            id v8 = objc_msgSend(v14, "_enableSiriAppSpecifiersWithAppId:accessGranted:", v15, objc_msgSend(v10, "accessGranted"));

            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
LABEL_12:
      id v3 = v16;
    }
    else
    {
      id v8 = (void *)MEMORY[0x263EFFA68];
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_enableSiriAppSpecifiersWithAppId:(id)a3 accessGranted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x263EFF980];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SIRI_KIT"];
  id v10 = +[AssistantController bundle];
  id v11 = [v10 localizedStringForKey:@"SIRI_PERAPP_SIRIREQUESTS_FOOTER" value:&stru_26D2AB140 table:@"AssistantSettings"];
  [v9 setProperty:v11 forKey:*MEMORY[0x263F600F8]];

  if (self->_isApplicationHidden) {
    [v9 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  [v8 addObject:v9];
  id v12 = (void *)MEMORY[0x263F5FC40];
  int v13 = +[AssistantController bundle];
  int v14 = [v13 localizedStringForKey:@"SIRI_PERAPP_SIRIREQUESTS_USEWITHSIRI_TOGGLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
  id v15 = [v12 preferenceSpecifierNamed:v14 target:self set:sel_setAskSiriUseWithAskSiriEnabled_specifier_ get:sel_askSiriUseWithAskSiriEnabled_ detail:0 cell:6 edit:0];

  [v15 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  id v16 = [NSNumber numberWithBool:v4];
  [v15 setProperty:v16 forKey:*MEMORY[0x263F60308]];

  [v15 setProperty:v7 forKey:@"intentsAppID"];
  if (self->_isApplicationHidden) {
    [v15 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  [v8 addObject:v15];

  return v8;
}

- (id)askSiriUseWithAskSiriEnabled:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x263F60308]];
}

- (void)setAskSiriUseWithAskSiriEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F60308];
  id v9 = [v7 propertyForKey:*MEMORY[0x263F60308]];
  char v10 = [v6 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    id v11 = [v7 propertyForKey:@"intentsAppID"];
    id v12 = objc_alloc_init(MEMORY[0x263F2BCC0]);
    int v13 = [v12 sectionInfoForSectionID:v11];
    if ([v13 spokenNotificationSetting] == 2 && (objc_msgSend(v6, "BOOLValue") & 1) == 0)
    {
      int v14 = (void *)MEMORY[0x263F82400];
      id v15 = +[AssistantController bundle];
      id v16 = [v15 localizedStringForKey:@"ASSISTANT_USE_WITH_SIRI_DISABLE_OK" value:&stru_26D2AB140 table:@"AssistantSettings"];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __71__AssistantDetailController_setAskSiriUseWithAskSiriEnabled_specifier___block_invoke;
      v33[3] = &unk_26457D998;
      id v34 = v6;
      id v35 = v11;
      id v30 = v12;
      id v17 = v7;
      id v36 = v17;
      id v37 = v13;
      v29 = [v14 actionWithTitle:v16 style:0 handler:v33];

      long long v18 = (void *)MEMORY[0x263F82400];
      long long v19 = +[AssistantController bundle];
      long long v20 = [v19 localizedStringForKey:@"ASSISTANT_USE_WITH_SIRI_DISABLE_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __71__AssistantDetailController_setAskSiriUseWithAskSiriEnabled_specifier___block_invoke_2;
      v31[3] = &unk_26457D1D8;
      id v32 = v17;
      v28 = [v18 actionWithTitle:v20 style:1 handler:v31];

      v27 = (void *)MEMORY[0x263F82418];
      id v21 = +[AssistantController bundle];
      uint64_t v22 = [v21 localizedStringForKey:@"ASSISTANT_USE_WITH_SIRI_DISABLE_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
      uint64_t v23 = +[AssistantController bundle];
      v24 = [v23 localizedStringForKey:@"ASSISTANT_USE_WITH_SIRI_DISABLE_MESSAGE" value:&stru_26D2AB140 table:@"AssistantSettings"];
      v25 = [v27 alertControllerWithTitle:v22 message:v24 preferredStyle:0];

      [v25 addAction:v29];
      [v25 addAction:v28];
      [(AssistantDetailController *)self presentViewController:v25 animated:1 completion:0];

      id v12 = v30;
    }
    else
    {
      +[IntentsUtilities setAccess:appID:](IntentsUtilities, "setAccess:appID:", [v6 BOOLValue], v11);
      [v7 setProperty:v6 forKey:v8];
      PSResetCachedSiriKitTCCEnabledAppIds();
    }
  }
  v26 = [(AssistantDetailController *)self _bundleId];
  +[AssistantMetrics didDetailToggle:bundleId:on:](AssistantMetrics, "didDetailToggle:bundleId:on:", @"sirikit", v26, [v6 BOOLValue]);
}

uint64_t __71__AssistantDetailController_setAskSiriUseWithAskSiriEnabled_specifier___block_invoke(uint64_t a1)
{
  +[IntentsUtilities setAccess:appID:](IntentsUtilities, "setAccess:appID:", [*(id *)(a1 + 32) BOOLValue], *(void *)(a1 + 40));
  [*(id *)(a1 + 48) setProperty:*(void *)(a1 + 32) forKey:*MEMORY[0x263F60308]];
  PSResetCachedSiriKitTCCEnabledAppIds();
  uint64_t v2 = *(void **)(a1 + 56);

  return [v2 setSpokenNotificationSetting:1];
}

void __71__AssistantDetailController_setAskSiriUseWithAskSiriEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) propertyForKey:*MEMORY[0x263F60028]];
  [v1 setOn:1 animated:1];
}

- (id)_siriSuggestionsClients
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"com.apple.store.Jolly", @"com.apple.mobilecal", @"com.apple.MobileAddressBook", @"com.apple.Home", @"com.apple.mobilemail", @"com.apple.Maps", @"com.apple.MobileSMS", @"com.apple.news", @"com.apple.mobilephone", @"com.apple.podcasts", @"com.apple.reminders", @"com.apple.mobilesafari", @"com.apple.tips", @"com.apple.iBooks", 0);

  return v2;
}

- (id)_watchBundleToMirrorWithBundleId:(id)a3
{
  id v3 = [&unk_26D2B3AB0 objectForKeyedSubscript:a3];
  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"AppHasCustomBridgeSettings", @"com.apple.suggestions");
  char v5 = [v4 containsObject:v3];

  if (v5) {
    id v6 = 0;
  }
  else {
    id v6 = v3;
  }

  return v6;
}

- (id)_bundleId
{
  uint64_t v2 = [(AssistantDetailController *)self specifier];
  id v3 = [v2 propertyForKey:@"BUNDLE_ID"];

  return v3;
}

- (id)_appName
{
  uint64_t v2 = [(AssistantDetailController *)self specifier];
  id v3 = [v2 propertyForKey:@"APP_NAME"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whileSearchingShowContentSpecifier, 0);
  objc_storeStrong((id *)&self->_whileSearchingShowAppSpecifier, 0);
  objc_storeStrong((id *)&self->_whileSearchingGroup, 0);

  objc_storeStrong((id *)&self->_suggestionsController, 0);
}

@end