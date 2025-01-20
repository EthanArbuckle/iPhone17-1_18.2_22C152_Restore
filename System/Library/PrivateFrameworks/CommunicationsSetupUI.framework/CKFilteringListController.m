@interface CKFilteringListController
- (BOOL)addCheckmark;
- (BOOL)deviceSupportsSMSFilteringExtensions;
- (BOOL)showingParentViewController;
- (BOOL)verifyCurrentExtensionIDValidity;
- (CKFilteringListController)init;
- (CKNSExtension)ckExtension;
- (NSArray)extensionIDArray;
- (NSDictionary)extensionNameMapping;
- (NSMutableArray)specifierListArray;
- (NSString)currentExtensionID;
- (PSSpecifier)selectedSpecifier;
- (id)_syncManager;
- (id)beginMappingID;
- (id)getDefaultExtension;
- (id)getExtensionNameAndWarning:(id)a3;
- (id)getSpamSpecifiers;
- (id)isConversationListFilteringEnabled:(id)a3;
- (id)isSpamFilteringEnabled:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)spamFilterState;
- (unsigned)enableSpamForExtensionID:(id)a3 withName:(id)a4;
- (void)_checkAndUpdateExtensionIDArray;
- (void)_updateSMSFilteringParams;
- (void)appendAboutWiFiCallingFooterToGroupSpecifier:(id)a3;
- (void)applicationDidResume;
- (void)applicationWillSuspend;
- (void)dealloc;
- (void)disableSpamFiltering;
- (void)enableSpamFiltering:(id)a3;
- (void)endMatchingExtensions;
- (void)findSpamExtensions;
- (void)grayOutSMSFilteringIfNecessary:(id)a3;
- (void)setAddCheckmark:(BOOL)a3;
- (void)setBeginMappingID:(id)a3;
- (void)setCkExtension:(id)a3;
- (void)setConversationListFilteringEnabled:(id)a3 specifier:(id)a4;
- (void)setCurrentExtensionID:(id)a3;
- (void)setExtensionIDArray:(id)a3;
- (void)setExtensionNameMapping:(id)a3;
- (void)setIsSpamFilteringDefaultEnabled;
- (void)setSelectedSpecifier:(id)a3;
- (void)setShowingParentViewController:(BOOL)a3;
- (void)setSpamFilterState:(int64_t)a3;
- (void)setSpecifierListArray:(id)a3;
- (void)shouldShowPrivacyAccessWarning:(id)a3;
- (void)showPrivacyLegalVC;
- (void)tappedNoFilterCell:(id)a3;
- (void)tappedSpamAppCell:(id)a3;
- (void)userChangedSpamFilteringSettings;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKFilteringListController

- (id)_syncManager
{
  v2 = (objc_class *)CUTWeakLinkClass();
  if (v2) {
    v2 = (objc_class *)objc_alloc_init(v2);
  }
  return v2;
}

- (CKFilteringListController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKFilteringListController;
  v2 = [(CKFilteringListController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_spamFilterState = -1;
    [(CKFilteringListController *)v2 setIsSpamFilteringDefaultEnabled];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v5 = v3;
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_handleSIMSubscriptionsUpdateNotification, (CFStringRef)*MEMORY[0x263F4AE08], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKFilteringListController;
  [(CKFilteringListController *)&v4 viewWillAppear:a3];
  [(CKFilteringListController *)self setIsSpamFilteringDefaultEnabled];
  [(CKFilteringListController *)self findSpamExtensions];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKFilteringListController;
  [(CKFilteringListController *)&v4 viewDidAppear:a3];
  [(CKFilteringListController *)self findSpamExtensions];
  self->_showingParentViewController = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKFilteringListController;
  [(CKFilteringListController *)&v4 viewDidDisappear:a3];
  [(CKFilteringListController *)self endMatchingExtensions];
}

- (void)dealloc
{
  [(CKFilteringListController *)self endMatchingExtensions];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F4AE08], 0);
  v4.receiver = self;
  v4.super_class = (Class)CKFilteringListController;
  [(CKFilteringListController *)&v4 dealloc];
}

- (void)applicationWillSuspend
{
  v3.receiver = self;
  v3.super_class = (Class)CKFilteringListController;
  [(CKFilteringListController *)&v3 applicationWillSuspend];
  [(CKFilteringListController *)self endMatchingExtensions];
}

- (void)applicationDidResume
{
  v3.receiver = self;
  v3.super_class = (Class)CKFilteringListController;
  [(CKFilteringListController *)&v3 applicationDidResume];
  if (!self->_showingParentViewController) {
    [(CKFilteringListController *)self findSpamExtensions];
  }
}

- (void)endMatchingExtensions
{
  if ([(CKFilteringListController *)self deviceSupportsSMSFilteringExtensions])
  {
    [(CKNSExtension *)self->_ckExtension endMatchingExtensions];
    ckExtension = self->_ckExtension;
    self->_ckExtension = 0;
  }
}

- (id)isConversationListFilteringEnabled:(id)a3
{
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IncomingMessageAlertFiltration", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = !v4;
  v6 = [NSNumber numberWithBool:v5];
  return v6;
}

- (void)setConversationListFilteringEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"IncomingMessageAlertFiltration", a3, @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"IncomingMessageAlertFiltrationForcedOn", (CFPropertyListRef)*MEMORY[0x263EFFB38], @"com.apple.MobileSMS");
  uint64_t v5 = (const void *)*MEMORY[0x263EFFB40];
  CFPreferencesSetAppValue(@"MessageFilteringSettingsConfirmed", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.MobileSMS");
  if (self->_spamFilterState == 1) {
    CFPreferencesSetAppValue(@"MessageSpamFilteringSettingsConfirmed", v5, @"com.apple.MobileSMS");
  }
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertFiltration.changed", 0, 0, 1u);
  objc_super v7 = (void (*)(void))CUTWeakLinkSymbol();
  if (v7) {
    v7();
  }
  [(CKFilteringListController *)self reloadSpecifiers];
  id v9 = [(CKFilteringListController *)self _syncManager];
  v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"IncomingMessageAlertFiltration", @"IncomingMessageAlertFiltrationForcedOn", @"MessageFilteringSettingsConfirmed", 0);
  [v9 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v8];
}

- (void)enableSpamFiltering:(id)a3
{
  id v4 = a3;
  CFPreferencesSetAppValue(@"IncomingMessageAlertSpamFiltration", v4, @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertSpamFiltration.changed", 0, 0, 1u);
  int64_t v6 = [v4 integerValue];

  self->_spamFilterState = v6;
}

- (void)shouldShowPrivacyAccessWarning:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 propertyForKey:*MEMORY[0x263F60138]];
  if ([v5 isEqualToString:@"com.apple.smsFilter.extension"])
  {
    self->_addCheckmark = 1;
    selectedSpecifier = self->_selectedSpecifier;
    self->_selectedSpecifier = (PSSpecifier *)v4;
    id v7 = v4;

    [(CKFilteringListController *)self userChangedSpamFilteringSettings];
    [(CKFilteringListController *)self reloadSpecifier:v7];
  }
  else
  {
    id v7 = [v4 propertyForKey:*MEMORY[0x263F60170]];
    v8 = NSString;
    id v9 = MessagesSettingsLocalizedString(@"PRIVACY_WARNING_APP_NAME_TITLE");
    v22 = objc_msgSend(v8, "stringWithFormat:", v9, v7);

    v10 = NSString;
    v11 = MessagesSettingsLocalizedString(@"PRIVACY_WARNING_TEXT");
    v12 = objc_msgSend(v10, "stringWithFormat:", v11, v7);

    v13 = MessagesSettingsLocalizedString(@"PRIVACY_WARNING_CANCEL");
    v14 = MessagesSettingsLocalizedString(@"PRIVACY_WARNING_ACTION");
    v15 = [MEMORY[0x263F82418] alertControllerWithTitle:v22 message:v12 preferredStyle:1];
    v16 = (void *)MEMORY[0x263F82400];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __60__CKFilteringListController_shouldShowPrivacyAccessWarning___block_invoke;
    v25[3] = &unk_2644F0A80;
    v25[4] = self;
    id v26 = v4;
    id v17 = v4;
    v18 = [v16 actionWithTitle:v14 style:0 handler:v25];
    v19 = (void *)MEMORY[0x263F82400];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __60__CKFilteringListController_shouldShowPrivacyAccessWarning___block_invoke_2;
    v23[3] = &unk_2644F0988;
    id v24 = v15;
    id v20 = v15;
    v21 = [v19 actionWithTitle:v13 style:1 handler:v23];
    [v20 addAction:v21];
    [v20 addAction:v18];
    [(CKFilteringListController *)self presentViewController:v20 animated:1 completion:0];
  }
}

uint64_t __60__CKFilteringListController_shouldShowPrivacyAccessWarning___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1385) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1440), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) userChangedSpamFilteringSettings];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 reloadSpecifier:v3];
}

uint64_t __60__CKFilteringListController_shouldShowPrivacyAccessWarning___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (unsigned)enableSpamForExtensionID:(id)a3 withName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && [v7 length])
  {
    id v9 = [(PSSpecifier *)self->_selectedSpecifier identifier];
    if (v9 == v7)
    {
      int64_t spamFilterState = self->_spamFilterState;

      if (spamFilterState == 1)
      {
LABEL_8:
        unsigned __int8 v10 = 1;
        goto LABEL_9;
      }
    }
    else
    {
    }
    CFPreferencesSetAppValue(@"spamFiltrationExtensionID", v7, @"com.apple.MobileSMS");
    CFPreferencesSetAppValue(@"spamFiltrationExtensionName", v8, @"com.apple.MobileSMS");
    CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    [(CKFilteringListController *)self enableSpamFiltering:&unk_26D075A70];
    objc_storeStrong((id *)&self->_currentExtensionID, a3);
    [(CKFilteringListController *)self _updateSMSFilteringParams];
    goto LABEL_8;
  }
  unsigned __int8 v10 = 0;
LABEL_9:

  return v10;
}

- (void)disableSpamFiltering
{
  selectedSpecifier = self->_selectedSpecifier;
  self->_selectedSpecifier = 0;

  CFPreferencesSetAppValue(@"spamFiltrationExtensionID", 0, @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"spamFiltrationExtensionName", 0, @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  self->_int64_t spamFilterState = 0;
  [(CKFilteringListController *)self enableSpamFiltering:&unk_26D075A88];
  id v4 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v5 = [v4 isSMSFilterSyncEnabled];

  if (v5)
  {
    [(CKFilteringListController *)self _updateSMSFilteringParams];
  }
}

- (id)getDefaultExtension
{
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"spamFiltrationExtensionID", @"com.apple.MobileSMS");
  objc_storeStrong((id *)&self->_currentExtensionID, v3);
  if (v3) {
    self->_int64_t spamFilterState = 1;
  }
  return v3;
}

- (void)setIsSpamFilteringDefaultEnabled
{
  if (self->_spamFilterState == -1)
  {
    CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IncomingMessageAlertSpamFiltration", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v4 = AppBooleanValue == 0;
    }
    else {
      BOOL v4 = 1;
    }
    int64_t v5 = !v4;
    self->_int64_t spamFilterState = v5;
  }
}

- (id)isSpamFilteringEnabled:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (self->_spamFilterState == 1)
  {
    int64_t v6 = [v4 propertyForKey:*MEMORY[0x263F60138]];
    if ([v6 isEqualToString:self->_currentExtensionID])
    {
      id v7 = (void *)MEMORY[0x263EFFA88];
    }
    else
    {
      [(CKFilteringListController *)self disableSpamFiltering];
      id v7 = (void *)MEMORY[0x263EFFA80];
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA80];
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)CKFilteringListController;
  int64_t v5 = [(CKFilteringListController *)&v33 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = v5;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int64_t v6 = self->_specifierListArray;
    uint64_t v28 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (!v28) {
      goto LABEL_30;
    }
    uint64_t v7 = *(void *)v30;
    uint64_t v8 = *MEMORY[0x263F60138];
    uint64_t v26 = *MEMORY[0x263F60138];
    uint64_t v27 = *MEMORY[0x263F602B0];
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v10 = *(PSSpecifier **)(*((void *)&v29 + 1) + 8 * v9);
        v11 = -[PSSpecifier propertyForKey:](v10, "propertyForKey:", v8, v25);
        v12 = [(PSSpecifier *)v10 propertyForKey:v27];
        p_selectedSpecifier = &self->_selectedSpecifier;
        selectedSpecifier = self->_selectedSpecifier;
        if (!selectedSpecifier)
        {
          if (self->_spamFilterState == 1)
          {
            if ([v11 isEqualToString:self->_currentExtensionID])
            {
              objc_storeStrong((id *)&self->_selectedSpecifier, v10);
              self->_addCheckmark = 1;
              goto LABEL_22;
            }
            selectedSpecifier = *p_selectedSpecifier;
          }
          else
          {
            selectedSpecifier = 0;
          }
        }
        if (selectedSpecifier == v10)
        {
          selectedSpecifier = v10;
          if (!self->_addCheckmark) {
            goto LABEL_19;
          }
          uint64_t v15 = v7;
          v16 = v6;
          id v17 = [(PSSpecifier *)v10 name];
          int v18 = [(CKFilteringListController *)self enableSpamForExtensionID:v11 withName:v17];

          if (v18)
          {
            [v12 setChecked:1];
            int64_t v6 = v16;
            uint64_t v7 = v15;
            uint64_t v8 = v26;
            goto LABEL_25;
          }
          selectedSpecifier = *p_selectedSpecifier;
          int64_t v6 = v16;
          uint64_t v7 = v15;
          uint64_t v8 = v26;
        }
        if (selectedSpecifier != v10) {
          goto LABEL_20;
        }
LABEL_19:
        if (self->_addCheckmark)
        {
LABEL_20:
          if (selectedSpecifier
            || ([(PSSpecifier *)v10 identifier],
                v19 = objc_claimAutoreleasedReturnValue(),
                int v20 = [v19 isEqualToString:@"noFilter"],
                v19,
                !v20))
          {
            v21 = v12;
            uint64_t v22 = 0;
          }
          else
          {
LABEL_22:
            v21 = v12;
            uint64_t v22 = 1;
          }
          [v21 setChecked:v22];
          goto LABEL_25;
        }
        [v12 setChecked:0];
        [(CKFilteringListController *)self disableSpamFiltering];
LABEL_25:

        ++v9;
      }
      while (v28 != v9);
      uint64_t v23 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      uint64_t v28 = v23;
      if (!v23)
      {
LABEL_30:

        int64_t v5 = v25;
        break;
      }
    }
  }
  return v5;
}

- (void)tappedSpamAppCell:(id)a3
{
  if (self->_selectedSpecifier != a3)
  {
    self->_int64_t spamFilterState = -1;
    -[CKFilteringListController shouldShowPrivacyAccessWarning:](self, "shouldShowPrivacyAccessWarning:");
    [(CKFilteringListController *)self _checkAndUpdateExtensionIDArray];
  }
}

- (void)tappedNoFilterCell:(id)a3
{
  id v5 = a3;
  if (self->_selectedSpecifier)
  {
    self->_addCheckmark = 1;
    objc_storeStrong((id *)&self->_selectedSpecifier, a3);
    [(CKFilteringListController *)self disableSpamFiltering];
    [(CKFilteringListController *)self reloadSpecifier:v5];
    [(CKFilteringListController *)self userChangedSpamFilteringSettings];
    [(CKFilteringListController *)self _checkAndUpdateExtensionIDArray];
  }
}

- (void)userChangedSpamFilteringSettings
{
  CFPreferencesSetAppValue(@"MessageSpamFilteringSettingsConfirmed", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.MobileSMS");
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSynchronize(@"com.apple.MobileSMS", v2, v3);
}

- (id)getExtensionNameAndWarning:(id)a3
{
  CFStringRef v3 = [a3 _plugIn];
  id v4 = [v3 localizedContainingName];

  id v5 = (objc_class *)MEMORY[0x263EFF9A0];
  id v6 = v4;
  id v7 = objc_alloc_init(v5);
  [v7 setObject:v6 forKeyedSubscript:@"displayName"];
  [v7 setObject:v6 forKeyedSubscript:@"warningName"];

  return v7;
}

- (void)findSpamExtensions
{
  if ([(CKFilteringListController *)self deviceSupportsSMSFilteringExtensions])
  {
    if (!self->_ckExtension)
    {
      CFStringRef v3 = objc_alloc_init(CKNSExtension);
      ckExtension = self->_ckExtension;
      self->_ckExtension = v3;

      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __47__CKFilteringListController_findSpamExtensions__block_invoke;
      v6[3] = &unk_2644F0D18;
      v6[4] = self;
      id v5 = (void *)MEMORY[0x223C3AA40](v6);
      [(CKNSExtension *)self->_ckExtension beginMatchingExtensions:v5];
    }
  }
}

void __47__CKFilteringListController_findSpamExtensions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v13 = +[CKSettingsMessagesController removeFirstPartyExtensionFromArrayIfNecessary:a2];
  id v6 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(*(void *)(a1 + 32) + 1392)];
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v13];
  int v8 = [v6 isEqualToSet:v7];
  if ((v8 & 1) == 0)
  {
    [*(id *)(a1 + 32) setExtensionIDArray:v13];
    [*(id *)(a1 + 32) setExtensionNameMapping:v5];
  }
  uint64_t v9 = [v13 count];
  unsigned __int8 v10 = *(void **)(a1 + 32);
  if (v9 || v10[176] != 1)
  {
    if (([v10 verifyCurrentExtensionIDValidity] | v8 ^ 1) != 1) {
      goto LABEL_8;
    }
  }
  else
  {
    [v10 disableSpamFiltering];
    [*(id *)(a1 + 32) verifyCurrentExtensionIDValidity];
  }
  [*(id *)(a1 + 32) reloadSpecifiers];
LABEL_8:
  uint64_t v11 = [v13 count];
  v12 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!v11) {
    v12 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"MessageSpamFilteringExtensionInstalled", *v12, @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
}

- (void)_checkAndUpdateExtensionIDArray
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CFStringRef v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Checking if we need to remove firstPartyExtension and reload specifiers.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  id v4 = (void *)[(NSArray *)self->_extensionIDArray copy];
  id v5 = +[CKSettingsMessagesController removeFirstPartyExtensionFromArrayIfNecessary:v4];
  id v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
  int v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "currentExtensionIDArray:%@, newExtensionIDArray:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    unsigned __int8 v10 = v4;
    uint64_t v11 = v5;
    IMLogString();
  }
  if ((objc_msgSend(v6, "isEqualToSet:", v7, v10, v11) & 1) == 0)
  {
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Extensions changed. Resetting extensionIDArray and reloading", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [(CKFilteringListController *)self setExtensionIDArray:v5];
    [(CKFilteringListController *)self reloadSpecifiers];
  }
}

- (BOOL)verifyCurrentExtensionIDValidity
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_spamFilterState != 1) {
    return 1;
  }
  id v3 = [(CKFilteringListController *)self getDefaultExtension];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_extensionIDArray;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "identifier", (void)v12);
        char v10 = [v9 isEqualToString:self->_currentExtensionID];

        if (v10)
        {

          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  [(CKFilteringListController *)self disableSpamFiltering];
  [(CKFilteringListController *)self reloadSpecifiers];
  return 0;
}

- (void)appendAboutWiFiCallingFooterToGroupSpecifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    MessagesSettingsLocalizedString(@"SPAM_EXTENSION_DESCRIPTION");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = (void *)MEMORY[0x263F5B8E8];
    uint64_t v6 = [MEMORY[0x263F5B8B0] bundleWithIdentifier:*MEMORY[0x263F5B938]];
    uint64_t v7 = [v5 flowWithBundle:v6];
    uint64_t v8 = [v7 localizedButtonTitle];

    uint64_t v9 = [NSString stringWithFormat:@"%@\n%@", v14, v8];
    char v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    [v4 setProperty:v11 forKey:*MEMORY[0x263F600C0]];

    [v4 setProperty:v9 forKey:*MEMORY[0x263F600E8]];
    v16.location = [v9 rangeOfString:v8];
    long long v12 = NSStringFromRange(v16);
    [v4 setProperty:v12 forKey:*MEMORY[0x263F600D0]];

    long long v13 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v4 setProperty:v13 forKey:*MEMORY[0x263F600E0]];

    [v4 setProperty:@"showPrivacyLegalVC" forKey:*MEMORY[0x263F600C8]];
  }
}

- (void)showPrivacyLegalVC
{
  id v3 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x263F5B938]];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (id)getSpamSpecifiers
{
  if ([(CKFilteringListController *)self deviceSupportsSMSFilteringExtensions])
  {
    id v3 = [(CKFilteringListController *)self getDefaultExtension];
    selectedSpecifier = self->_selectedSpecifier;
    self->_selectedSpecifier = 0;

    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = MessagesSettingsLocalizedString(@"SPAM_FILTERING_GROUP_LABEL");
    uint64_t v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SPAM_FILTERING_GROUP" name:v6];
    [(CKFilteringListController *)self appendAboutWiFiCallingFooterToGroupSpecifier:v7];
    [v5 addObject:v7];
    if (v7)
    {
      uint64_t v8 = [v5 indexOfObject:v7];
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v9 = v8;
        char v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        specifierListArray = self->_specifierListArray;
        self->_specifierListArray = v10;

        long long v12 = self->_extensionIDArray;
        if ([(NSArray *)v12 count])
        {
          uint64_t v38 = v9 + 1;
          v40[0] = MEMORY[0x263EF8330];
          v40[1] = 3221225472;
          v40[2] = __46__CKFilteringListController_getSpamSpecifiers__block_invoke;
          v40[3] = &unk_2644F0A10;
          v40[4] = self;
          id v5 = v5;
          id v41 = v5;
          uint64_t v42 = v9 + 1;
          [(NSArray *)v12 enumerateObjectsWithOptions:2 usingBlock:v40];
          long long v13 = (char *)objc_alloc_init(MEMORY[0x263F5FC40]);
          *(void *)&v13[*MEMORY[0x263F5FE10]] = 2;
          uint64_t v14 = objc_opt_class();
          objc_storeWeak((id *)&v13[*MEMORY[0x263F5FE40]], self);
          [v13 setProperty:@"noFilter" forKey:*MEMORY[0x263F602D0]];
          [v13 setProperty:@"noFilter" forKey:*MEMORY[0x263F60170]];
          long long v15 = MessagesSettingsLocalizedString(@"SPAM_EXTENSION_NO_FILTER");
          [v13 setName:v15];

          *(void *)&v13[*MEMORY[0x263F5FE28]] = 0;
          [v13 setButtonAction:sel_tappedNoFilterCell_];
          NSRange v16 = NSStringFromSelector(sel_tappedNoFilterCell_);
          [v13 setProperty:v16 forKey:*MEMORY[0x263F5FF70]];

          [v13 setProperty:v14 forKey:*MEMORY[0x263F5FFE0]];
          uint64_t v17 = [NSNumber numberWithBool:1];
          [v13 setProperty:v17 forKey:*MEMORY[0x263F600A8]];

          v39 = v12;
          int v18 = [(NSArray *)v12 firstObject];
          v19 = (void *)MEMORY[0x263F827E8];
          int v20 = (void *)MEMORY[0x263F018C0];
          v37 = v18;
          v21 = [v18 identifier];
          uint64_t v22 = [v20 pluginKitProxyForIdentifier:v21];
          uint64_t v23 = [v19 _iconForResourceProxy:v22 format:0];

          [v23 size];
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          [v23 scale];
          CGFloat v29 = v28;
          v44.width = v25;
          v44.height = v27;
          UIGraphicsBeginImageContextWithOptions(v44, 0, v29);
          long long v30 = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          [v13 setProperty:v30 forKey:*MEMORY[0x263F60140]];
          long long v31 = [v13 propertyForKey:*MEMORY[0x263F602B0]];
          [v31 setCellEnabled:1];
          [v31 setNeedsDisplay];
          [v5 insertObject:v13 atIndex:v38];
          [(CKFilteringListController *)self grayOutSMSFilteringIfNecessary:v13];
          [(NSMutableArray *)self->_specifierListArray addObject:v13];
          long long v32 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
          int v33 = [v32 isSMSFilterSyncEnabled];

          if (v33)
          {
            v34 = [(CKFilteringListController *)self isConversationListFilteringEnabled:0];
            int v35 = [v34 isEqual:MEMORY[0x263EFFA80]];

            if (v35) {
              [(CKFilteringListController *)self disableSpamFiltering];
            }
          }

          long long v12 = v39;
        }
        else
        {

          id v5 = 0;
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __46__CKFilteringListController_getSpamSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v18 = [v3 getExtensionNameAndWarning:v4];
  id v5 = [v18 objectForKeyedSubscript:@"displayName"];
  uint64_t v6 = [v18 objectForKeyedSubscript:@"warningName"];
  uint64_t v7 = (char *)objc_alloc_init(MEMORY[0x263F5FC40]);
  *(void *)&v7[*MEMORY[0x263F5FE10]] = 2;
  uint64_t v8 = objc_opt_class();
  *(void *)&v7[*MEMORY[0x263F5FE18]] = 0;
  [v7 setDetailControllerClass:0];
  objc_storeWeak((id *)&v7[*MEMORY[0x263F5FE40]], *(id *)(a1 + 32));
  [v7 setProperty:v5 forKey:*MEMORY[0x263F602D0]];
  [v7 setProperty:v6 forKey:*MEMORY[0x263F60170]];
  [v7 setName:v5];
  *(void *)&v7[*MEMORY[0x263F5FE28]] = 0;
  [v7 setButtonAction:sel_tappedSpamAppCell_];
  uint64_t v9 = NSStringFromSelector(sel_tappedSpamAppCell_);
  [v7 setProperty:v9 forKey:*MEMORY[0x263F5FF70]];

  char v10 = [v4 identifier];
  [v7 setProperty:v10 forKey:*MEMORY[0x263F60138]];
  [v7 setProperty:v8 forKey:*MEMORY[0x263F5FFE0]];
  uint64_t v11 = [NSNumber numberWithBool:1];
  [v7 setProperty:v11 forKey:*MEMORY[0x263F600A8]];
  long long v12 = (void *)MEMORY[0x263F827E8];
  long long v13 = (void *)MEMORY[0x263F018C0];
  uint64_t v14 = [v4 identifier];

  long long v15 = [v13 pluginKitProxyForIdentifier:v14];
  NSRange v16 = [v12 _iconForResourceProxy:v15 format:0];

  [v7 setProperty:v16 forKey:*MEMORY[0x263F60140]];
  uint64_t v17 = [v7 propertyForKey:*MEMORY[0x263F602B0]];
  [v17 setCellEnabled:1];
  [v17 setNeedsDisplay];
  [*(id *)(a1 + 40) insertObject:v7 atIndex:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) grayOutSMSFilteringIfNecessary:v7];
  [*(id *)(*(void *)(a1 + 32) + 1448) addObject:v7];
}

- (void)grayOutSMSFilteringIfNecessary:(id)a3
{
  id v9 = a3;
  id v4 = [(CKFilteringListController *)self isConversationListFilteringEnabled:0];
  int v5 = [v4 isEqual:MEMORY[0x263EFFA80]];

  uint64_t v6 = *MEMORY[0x263F600A8];
  if (v5)
  {
    [v9 setProperty:MEMORY[0x263EFFA80] forKey:v6];

    uint64_t v7 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
    char v8 = [v7 isSMSFilterSyncEnabled];

    if ((v8 & 1) == 0)
    {
      [(CKFilteringListController *)self disableSpamFiltering];
    }
  }
  else
  {
    [v9 setProperty:MEMORY[0x263EFFA88] forKey:v6];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = MessagesSettingsLocalizedString(@"MESSAGES_FILTERING_LABEL");
    uint64_t v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"IMESSAGE_FILTERING_GROUP" name:v6];
    char v8 = MessagesSettingsLocalizedString(@"MADRID_FILTER");
    [v7 setProperty:v8 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v7];
    id v9 = (void *)MEMORY[0x263F5FC40];
    char v10 = MessagesSettingsLocalizedString(@"MADRID_FILTER_LABEL");
    uint64_t v11 = [v9 preferenceSpecifierNamed:v10 target:self set:sel_setConversationListFilteringEnabled_specifier_ get:sel_isConversationListFilteringEnabled_ detail:0 cell:6 edit:0];

    [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    [v5 addObject:v11];
    long long v12 = [(CKFilteringListController *)self getSpamSpecifiers];
    if (v12) {
      [v5 addObjectsFromArray:v12];
    }
    long long v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)deviceSupportsSMSFilteringExtensions
{
  CFStringRef v2 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v3 = [v2 isSMSFilterSyncEnabled];

  if (!v3) {
    return 1;
  }
  id v4 = [MEMORY[0x263F82670] currentDevice];
  BOOL v5 = [v4 userInterfaceIdiom] == 0;

  return v5;
}

- (void)_updateSMSFilteringParams
{
  CFStringRef v2 = (void (*)(void))CUTWeakLinkSymbol();
  if (v2)
  {
    v2();
  }
}

- (NSArray)extensionIDArray
{
  return self->_extensionIDArray;
}

- (void)setExtensionIDArray:(id)a3
{
}

- (NSDictionary)extensionNameMapping
{
  return self->_extensionNameMapping;
}

- (void)setExtensionNameMapping:(id)a3
{
}

- (BOOL)showingParentViewController
{
  return self->_showingParentViewController;
}

- (void)setShowingParentViewController:(BOOL)a3
{
  self->_showingParentViewController = a3;
}

- (int64_t)spamFilterState
{
  return self->_spamFilterState;
}

- (void)setSpamFilterState:(int64_t)a3
{
  self->_int64_t spamFilterState = a3;
}

- (BOOL)addCheckmark
{
  return self->_addCheckmark;
}

- (void)setAddCheckmark:(BOOL)a3
{
  self->_addCheckmark = a3;
}

- (id)beginMappingID
{
  return self->_beginMappingID;
}

- (void)setBeginMappingID:(id)a3
{
}

- (CKNSExtension)ckExtension
{
  return self->_ckExtension;
}

- (void)setCkExtension:(id)a3
{
}

- (NSString)currentExtensionID
{
  return self->_currentExtensionID;
}

- (void)setCurrentExtensionID:(id)a3
{
}

- (PSSpecifier)selectedSpecifier
{
  return self->_selectedSpecifier;
}

- (void)setSelectedSpecifier:(id)a3
{
}

- (NSMutableArray)specifierListArray
{
  return self->_specifierListArray;
}

- (void)setSpecifierListArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierListArray, 0);
  objc_storeStrong((id *)&self->_selectedSpecifier, 0);
  objc_storeStrong((id *)&self->_currentExtensionID, 0);
  objc_storeStrong((id *)&self->_ckExtension, 0);
  objc_storeStrong(&self->_beginMappingID, 0);
  objc_storeStrong((id *)&self->_extensionNameMapping, 0);
  objc_storeStrong((id *)&self->_extensionIDArray, 0);
}

@end