@interface AUSystemSettingsSpecifiersProvider
+ (BOOL)isServiceRestricted:(id)a3;
+ (OS_dispatch_queue)_bbObserverQueue;
- (AUSystemSettingsSpecifiersProvider)initWithApplicationBundleIdentifier:(id)a3;
- (AUSystemSettingsSpecifiersProviderDelegate)delegate;
- (BBObserver)_bbObserver;
- (BOOL)_accountModificationDisabledByRestrictions;
- (BOOL)_isAppClip;
- (BOOL)_isBackgroundAppRefreshAllowed;
- (BOOL)_isLocationServicesRestricted;
- (BOOL)_isWirelessDataRestricted;
- (BOOL)_supportsBackgroundAppRefresh;
- (BOOL)_supportsJournalingSuggestions;
- (BOOL)_supportsLiveActivities;
- (BOOL)_supportsLiveActivitiesFrequentUpdates;
- (BOOL)enServiceMatched;
- (BOOL)getMulticastAllowed:(BOOL *)a3;
- (BOOL)shouldShowPasteboardSpecifier;
- (DOCDownloadSettings)downloadSettings;
- (NSString)applicationBundleIdentifier;
- (NSString)defaultDownloadsFolderTitle;
- (NSString)matchingBundleIdentifier;
- (PSDriverPolicyForApp)driverPolicy;
- (SESNFCAppSettingsContext)nfcContext;
- (id)_accountsCount:(id)a3;
- (id)_downloadsFolderTitle;
- (id)_journalingSuggestionsSpecifiers;
- (id)accessoriesSpecifier;
- (id)accountsSpecifier;
- (id)assistantSpecifiers;
- (id)authLevelStringForStatus:(unint64_t)a3;
- (id)backgroundAppRefreshSpecifier;
- (id)calendarSpecifiers;
- (id)contactlessNFCSideButtonSpecifiers;
- (id)contactlessNFCSpecifiers;
- (id)contactsServicesSpecifier;
- (id)dataUsageWorkspaceInfo;
- (id)defaultAppCategoriesSpecifiers;
- (id)defaultAppSpecifierWithAppRecordsMatchingBlock:(id)a3 getter:(SEL)a4 setter:(SEL)a5 title:(id)a6;
- (id)defaultBrowser:(id)a3;
- (id)defaultBrowserSpecifier;
- (id)defaultMailApp:(id)a3;
- (id)defaultMailAppSpecifier;
- (id)documentSource:(id)a3;
- (id)documentsSpecifier;
- (id)downloadsSpecifiers;
- (id)driverKitSpecifiers;
- (id)exposureSpecifiersWithTCCServiceLookup:(id)a3;
- (id)familyControlsSpecifier;
- (id)getDoubleClickForNFC:(id)a3;
- (id)getNudityDetectionEnabledValue;
- (id)isBackgroundRefreshEnabled:(id)a3;
- (id)isFamilyControlsEnabled:(id)a3;
- (id)isLiveActivitiesEnabled:(id)a3;
- (id)isLocalNetworkEnabled:(id)a3;
- (id)isTapToPayAlwaysPlaySoundEnabled:(id)a3;
- (id)isTapToPayScreenLockEnabled:(id)a3;
- (id)liveActivitiesSpecifier;
- (id)locationServicesSpecifier;
- (id)locationStatus:(id)a3;
- (id)networkServicesSpecifier;
- (id)notificationSpecifier;
- (id)nudityDetectionSpeicier;
- (id)pasteboardAccessForSpecifier:(id)a3;
- (id)pasteboardSpecifier;
- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4;
- (id)photosServicesSpecifier;
- (id)preferredLanguage:(id)a3;
- (id)preferredLanguageSpecifier;
- (id)privacyAccessForSpecifier:(id)a3;
- (id)privacySpecifierForService:(__CFString *)a3 tccServiceLookup:(id)a4 tccServiceOverrides:(id)a5;
- (id)privacySpecifiersWithTCCServiceLookup:(id)a3 tccServiceOverrides:(id)a4;
- (id)searchSpecifiers;
- (id)specifiers;
- (id)specifiersForPolicyOptions:(unint64_t)a3 force:(BOOL)a4;
- (id)tapToPayAlwaysPlaySoundSpecifiers;
- (id)tapToPayScreenLockSpecifiers;
- (id)trackingSpecifiersWithTCCServiceLookup:(id)a3 tccServiceOverrides:(id)a4;
- (id)walletSpecifier;
- (id)wirelessDataSpecifierWithAppName:(id)a3;
- (int64_t)_getAuthorizationRecordsStatus;
- (void)_handleAddAccountButtonAction:(id)a3;
- (void)_updateDownloadsFolderTitle;
- (void)loadNetworkConfigurationsForceRefresh:(BOOL)a3;
- (void)monitoredStoreDidChange:(id)a3;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)reloadSpecifiers;
- (void)saveNetworkConfiguration;
- (void)setBackgroundRefreshEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setDefaultBrowser:(id)a3 specifier:(id)a4;
- (void)setDefaultDownloadsFolderTitle:(id)a3;
- (void)setDefaultMailApp:(id)a3 specifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDoubleClickForNFC:(id)a3 specifier:(id)a4;
- (void)setDownloadSettings:(id)a3;
- (void)setDriverPolicy:(id)a3;
- (void)setEnServiceMatched:(BOOL)a3;
- (void)setFamilyControlsEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setLiveActivitiesEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4;
- (void)setMatchingBundleIdentifier:(id)a3;
- (void)setNfcContext:(id)a3;
- (void)setPasteboardAccess:(id)a3 forSpecifier:(id)a4;
- (void)setPrivacyAccess:(id)a3 forSpecifier:(id)a4;
- (void)setTapToPayAlwaysPlaySoundEnabled:(id)a3 specifier:(id)a4;
- (void)setTapToPayScreenLockEnabled:(id)a3 specifier:(id)a4;
- (void)set_bbObserver:(id)a3;
- (void)setupNetworkConfiguration;
- (void)showController:(id)a3 animate:(BOOL)a4;
@end

@implementation AUSystemSettingsSpecifiersProvider

- (AUSystemSettingsSpecifiersProvider)initWithApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AUSystemSettingsSpecifiersProvider;
  v5 = [(AUSystemSettingsSpecifiersProvider *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v6;

    id v8 = objc_alloc(MEMORY[0x263F2BC90]);
    v9 = [(id)objc_opt_class() _bbObserverQueue];
    uint64_t v10 = [v8 initWithQueue:v9];
    bbObserver = v5->__bbObserver;
    v5->__bbObserver = (BBObserver *)v10;

    [(BBObserver *)v5->__bbObserver setObserverFeed:512];
    [(BBObserver *)v5->__bbObserver setDelegate:v5];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v13 = *MEMORY[0x263EFB0D8];
    v14 = [MEMORY[0x263F5FAC8] sharedEnumerator];
    v15 = [v14 monitoredAccountStore];
    [v12 addObserver:v5 selector:sel_monitoredStoreDidChange_ name:v13 object:v15];

    if (initWithApplicationBundleIdentifier__onceToken != -1) {
      dispatch_once(&initWithApplicationBundleIdentifier__onceToken, &__block_literal_global);
    }
  }

  return v5;
}

void __74__AUSystemSettingsSpecifiersProvider_initWithApplicationBundleIdentifier___block_invoke()
{
  v15[24] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F7C508];
  v14[0] = *MEMORY[0x263F7C4F8];
  v14[1] = v0;
  v15[0] = &unk_26FC1EA58;
  v15[1] = &unk_26FC1EA70;
  uint64_t v1 = *MEMORY[0x263F7C5B8];
  v14[2] = *MEMORY[0x263F7C5C8];
  v14[3] = v1;
  v15[2] = &unk_26FC1EA88;
  v15[3] = &unk_26FC1EAA0;
  uint64_t v2 = *MEMORY[0x263F7C598];
  v14[4] = *MEMORY[0x263F7C500];
  v14[5] = v2;
  v15[4] = &unk_26FC1EAB8;
  v15[5] = &unk_26FC1EAD0;
  uint64_t v3 = *MEMORY[0x263F7C510];
  v14[6] = *MEMORY[0x263F7C640];
  v14[7] = v3;
  v15[6] = &unk_26FC1EAE8;
  v15[7] = &unk_26FC1EB00;
  uint64_t v4 = *MEMORY[0x263F7C5A0];
  v14[8] = *MEMORY[0x263F7C548];
  v14[9] = v4;
  v15[8] = &unk_26FC1EB18;
  v15[9] = &unk_26FC1EB30;
  uint64_t v5 = *MEMORY[0x263F7C678];
  v14[10] = *MEMORY[0x263F7C688];
  v14[11] = v5;
  v15[10] = &unk_26FC1EB48;
  v15[11] = &unk_26FC1EB60;
  uint64_t v6 = *MEMORY[0x263F7C570];
  v14[12] = *MEMORY[0x263F7C560];
  v14[13] = v6;
  v15[12] = &unk_26FC1EB78;
  v15[13] = &unk_26FC1EB90;
  uint64_t v7 = *MEMORY[0x263F7C588];
  v14[14] = *MEMORY[0x263F7C590];
  v14[15] = v7;
  v15[14] = &unk_26FC1EBA8;
  v15[15] = &unk_26FC1EBC0;
  uint64_t v8 = *MEMORY[0x263F7C660];
  v14[16] = *MEMORY[0x263F7C680];
  v14[17] = v8;
  v15[16] = &unk_26FC1EBD8;
  v15[17] = &unk_26FC1EBF0;
  uint64_t v9 = *MEMORY[0x263F7C568];
  v14[18] = *MEMORY[0x263F7C5B0];
  v14[19] = v9;
  v15[18] = &unk_26FC1EC08;
  v15[19] = &unk_26FC1EC20;
  uint64_t v10 = *MEMORY[0x263F7C538];
  v14[20] = *MEMORY[0x263F7C5A8];
  v14[21] = v10;
  v15[20] = &unk_26FC1EC38;
  v15[21] = &unk_26FC1EC50;
  uint64_t v11 = *MEMORY[0x263F7C518];
  v14[22] = *MEMORY[0x263F7C5D0];
  v14[23] = v11;
  v15[22] = &unk_26FC1EC68;
  v15[23] = &unk_26FC1EC80;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:24];
  uint64_t v13 = (void *)_PSServicePolicyOptions;
  _PSServicePolicyOptions = v12;
}

+ (OS_dispatch_queue)_bbObserverQueue
{
  if (_bbObserverQueue_onceToken != -1) {
    dispatch_once(&_bbObserverQueue_onceToken, &__block_literal_global_88);
  }
  uint64_t v2 = (void *)_bbObserverQueue__bbObserverQueue;
  return (OS_dispatch_queue *)v2;
}

void __54__AUSystemSettingsSpecifiersProvider__bbObserverQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.preferencesframework.gateway", v2);
  uint64_t v1 = (void *)_bbObserverQueue__bbObserverQueue;
  _bbObserverQueue__bbObserverQueue = (uint64_t)v0;
}

- (id)specifiers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AULoggingFacility();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, "PSSystemPolicyForApp.specifiers");

  uint64_t v5 = _AULoggingFacility();
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v7 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[AUSystemSettingsSpecifiersProvider specifiers]";
    __int16 v14 = 2114;
    v15 = v7;
    _os_signpost_emit_with_name_impl(&dword_247E6E000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PSSystemPolicyForApp.specifiers", "%s: %{public}@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__AUSystemSettingsSpecifiersProvider_specifiers__block_invoke;
  v11[3] = &__block_descriptor_40_e5_v8__0l;
  v11[4] = v4;
  uint64_t v8 = (void (**)(void))MEMORY[0x24C56E5E0](v11);
  uint64_t v9 = [(AUSystemSettingsSpecifiersProvider *)self specifiersForPolicyOptions:-134348801 force:0];
  if (v8) {
    v8[2](v8);
  }

  return v9;
}

void __48__AUSystemSettingsSpecifiersProvider_specifiers__block_invoke(uint64_t a1)
{
  uint64_t v2 = _AULoggingFacility();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_247E6E000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PSSystemPolicyForApp.specifiers", (const char *)&unk_247E8599B, v5, 2u);
  }
}

- (id)specifiersForPolicyOptions:(unint64_t)a3 force:(BOOL)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  self->_policyOptions = a3;
  self->_forcePolicyOptions = a4;
  id v5 = objc_alloc(MEMORY[0x263F01878]);
  uint64_t v6 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  v74 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];

  uint64_t v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = v74;
  if ([v74 isWebAppPlaceholder])
  {
    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"Allow %@ to Access" value:&stru_26FC1C568 table:0];

    uint64_t v11 = (void *)MEMORY[0x263F5FC40];
    uint64_t v12 = NSString;
    uint64_t v13 = [v74 localizedName];
    __int16 v14 = objc_msgSend(v12, "stringWithFormat:", v10, v13);
    v15 = [v11 groupSpecifierWithName:v14];

    objc_msgSend(v7, "na_safeAddObject:", v15);
    uint64_t v16 = [(AUSystemSettingsSpecifiersProvider *)self notificationSpecifier];
    objc_msgSend(v7, "na_safeAddObject:", v16);

    objc_super v17 = v74;
  }
  else
  {
    if (v74)
    {
      CFURLRef v18 = [v74 URL];
      uint64_t v8 = CFBundleCreate(0, v18);

      if (v8)
      {
        v80[0] = MEMORY[0x263EF8330];
        v80[1] = 3221225472;
        v80[2] = __71__AUSystemSettingsSpecifiersProvider_specifiersForPolicyOptions_force___block_invoke;
        v80[3] = &__block_descriptor_40_e5_v8__0l;
        v80[4] = v8;
        id v72 = (id)MEMORY[0x24C56E5E0](v80);
        v19 = (void *)TCCAccessCopyInformationForBundle();
        uint64_t v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v76 objects:v81 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v77;
          v23 = (void *)MEMORY[0x263F7C4E8];
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v77 != v22) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              v26 = [v25 objectForKeyedSubscript:*v23];
              objc_msgSend(v8, "na_safeSetObject:forKey:", v25, v26);
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v76 objects:v81 count:16];
          }
          while (v21);
        }

        v27 = v72;
        if (v72)
        {
          (*((void (**)(void))v72 + 2))();
          v27 = v72;
        }
      }
    }
    MEMORY[0x24C56E230]();
    id v73 = (id)objc_claimAutoreleasedReturnValue();
    v28 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifiersWithTCCServiceLookup:v8 tccServiceOverrides:v73];
    [v7 addObjectsFromArray:v28];

    v29 = [(AUSystemSettingsSpecifiersProvider *)self calendarSpecifiers];
    objc_msgSend(v7, "na_safeAddObject:", v29);

    v30 = [(AUSystemSettingsSpecifiersProvider *)self assistantSpecifiers];
    objc_msgSend(v7, "na_safeAddObject:", v30);

    v31 = [(AUSystemSettingsSpecifiersProvider *)self searchSpecifiers];
    objc_msgSend(v7, "na_safeAddObject:", v31);

    v32 = [(AUSystemSettingsSpecifiersProvider *)self notificationSpecifier];
    objc_msgSend(v7, "na_safeAddObject:", v32);

    v33 = [(AUSystemSettingsSpecifiersProvider *)self nudityDetectionSpeicier];
    objc_msgSend(v7, "na_safeAddObject:", v33);

    v34 = [(AUSystemSettingsSpecifiersProvider *)self liveActivitiesSpecifier];
    objc_msgSend(v7, "na_safeAddObject:", v34);

    v35 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C570] tccServiceLookup:v8 tccServiceOverrides:v73];
    objc_msgSend(v7, "na_safeAddObject:", v35);

    v36 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C658] tccServiceLookup:v8 tccServiceOverrides:v73];
    objc_msgSend(v7, "na_safeAddObject:", v36);

    v71 = [(AUSystemSettingsSpecifiersProvider *)self backgroundAppRefreshSpecifier];
    objc_msgSend(v7, "na_safeAddObject:", v71);
    v37 = [v74 localizedName];
    if (v37)
    {
      v68 = v74;
    }
    else
    {
      id v38 = objc_alloc(MEMORY[0x263F01878]);
      v39 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
      v68 = (void *)[v38 initWithBundleIdentifierOfSystemPlaceholder:v39 error:0];

      v37 = [v68 localizedName];
    }
    v40 = [(AUSystemSettingsSpecifiersProvider *)self wirelessDataSpecifierWithAppName:v37];
    objc_msgSend(v7, "na_safeAddObject:", v40);

    v41 = [(AUSystemSettingsSpecifiersProvider *)self documentsSpecifier];
    objc_msgSend(v7, "na_safeAddObject:", v41);

    v42 = [(AUSystemSettingsSpecifiersProvider *)self exposureSpecifiersWithTCCServiceLookup:v8];
    [v7 addObjectsFromArray:v42];

    v75 = [(AUSystemSettingsSpecifiersProvider *)self familyControlsSpecifier];
    if (v75) {
      objc_msgSend(v7, "na_safeAddObject:", v75);
    }
    v43 = [(AUSystemSettingsSpecifiersProvider *)self _journalingSuggestionsSpecifiers];
    objc_msgSend(v7, "na_safeAddObjectsFromArray:", v43);

    v69 = [(AUSystemSettingsSpecifiersProvider *)self defaultAppCategoriesSpecifiers];
    objc_msgSend(v7, "na_safeAddObjectsFromArray:", v69);
    v70 = [(AUSystemSettingsSpecifiersProvider *)self downloadsSpecifiers];
    if ([v70 count])
    {
      objc_msgSend(v7, "na_safeAddObjectsFromArray:", v70);
      [(AUSystemSettingsSpecifiersProvider *)self _updateDownloadsFolderTitle];
    }
    v44 = [(AUSystemSettingsSpecifiersProvider *)self contactlessNFCSideButtonSpecifiers];
    objc_msgSend(v7, "na_safeAddObjectsFromArray:", v44);

    v45 = [(AUSystemSettingsSpecifiersProvider *)self trackingSpecifiersWithTCCServiceLookup:v8 tccServiceOverrides:v73];
    if ([v45 count]) {
      [v7 addObjectsFromArray:v45];
    }
    v46 = [(AUSystemSettingsSpecifiersProvider *)self pasteboardSpecifier];
    if (v46)
    {
      v47 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"PASTEBOARD_GROUP"];
      [v7 addObject:v47];

      [v7 addObject:v46];
    }
    if ([v7 count])
    {
      v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v49 = [v48 localizedStringForKey:@"Allow %@ to Access" value:&stru_26FC1C568 table:0];

      v50 = (void *)MEMORY[0x263F5FC40];
      v51 = objc_msgSend(NSString, "stringWithFormat:", v49, v37);
      v52 = [v50 groupSpecifierWithName:v51];

      [v7 insertObject:v52 atIndex:0];
      if (v71
        && ([MEMORY[0x263F08AB0] processInfo],
            v53 = objc_claimAutoreleasedReturnValue(),
            int v54 = [v53 isLowPowerModeEnabled],
            v53,
            v54))
      {
        v55 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v56 = [v55 localizedStringForKey:@"When in Low Power Mode, background app refresh is disabled.", &stru_26FC1C568, 0 value table];
      }
      else
      {
        v56 = 0;
      }
      if ([v56 length]) {
        [v52 setProperty:v56 forKey:*MEMORY[0x263F600F8]];
      }
      else {
        [v52 removePropertyForKey:*MEMORY[0x263F600F8]];
      }
    }
    v57 = (void *)MEMORY[0x263F5FC40];
    v58 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v59 = [v58 localizedStringForKey:@"Preferred Language" value:&stru_26FC1C568 table:0];
    v60 = [v57 groupSpecifierWithName:v59];

    v61 = [(AUSystemSettingsSpecifiersProvider *)self preferredLanguageSpecifier];
    if (v61)
    {
      [v7 addObject:v60];
      objc_msgSend(v7, "na_safeAddObject:", v61);
    }
    v62 = [(AUSystemSettingsSpecifiersProvider *)self accountsSpecifier];
    if (v62)
    {
      v63 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ACCOUNTS_GROUP" name:0];
      [v7 addObject:v63];

      [v7 addObject:v62];
    }
    v64 = [(AUSystemSettingsSpecifiersProvider *)self tapToPayScreenLockSpecifiers];
    [v7 addObjectsFromArray:v64];

    v65 = [(AUSystemSettingsSpecifiersProvider *)self tapToPayAlwaysPlaySoundSpecifiers];
    [v7 addObjectsFromArray:v65];

    v66 = [(AUSystemSettingsSpecifiersProvider *)self driverKitSpecifiers];
    [v7 addObjectsFromArray:v66];

    objc_super v17 = v68;
  }

  return v7;
}

void __71__AUSystemSettingsSpecifiersProvider_specifiersForPolicyOptions_force___block_invoke(uint64_t a1)
{
}

- (BOOL)_isAppClip
{
  id v3 = objc_alloc(MEMORY[0x263F01878]);
  os_signpost_id_t v4 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  uint64_t v8 = 0;
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v8];

  uint64_t v6 = [v5 appClipMetadata];
  LOBYTE(v4) = v6 != 0;

  return (char)v4;
}

- (id)notificationSpecifier
{
  if (self->_policyOptions)
  {
    os_signpost_id_t v4 = +[AUNotificationSettingsController sharedInstance];
    id v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    uint64_t v6 = [v4 sectionInfoForIdentifier:v5];

    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x263F086E0];
      uint64_t v8 = PSBundlePathForPreferenceBundle();
      uint64_t v9 = SFRuntimeAbsoluteFilePathForPath();
      uint64_t v10 = [v7 bundleWithPath:v9];

      [v10 classNamed:@"NotificationCell"];
      [v10 classNamed:@"BulletinBoardAppDetailController"];
      uint64_t v2 = PSApplicationSpecifierForBBSection();
      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v12 = [v11 localizedStringForKey:@"Notifications" value:&stru_26FC1C568 table:0];
      [v2 setName:v12];

      [v2 setIdentifier:@"NOTIFICATIONS"];
      [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
      [v2 setObject:@"com.apple.graphic-icon.notifications" forKeyedSubscript:*MEMORY[0x263F60158]];
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)nudityDetectionSpeicier
{
  if ((self->_policyOptions & 0x80000000000) == 0
    || ![MEMORY[0x263F33238] nudityDetectionFeatureEnabled])
  {
    goto LABEL_5;
  }
  id v3 = (void *)MEMORY[0x263F33238];
  os_signpost_id_t v4 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  if ([v3 nudityDetectionAvailableForBundleID:v4])
  {
    id v5 = [MEMORY[0x263F82670] currentDevice];
    char v6 = objc_msgSend(v5, "sf_inRetailKioskMode");

    if (v6)
    {
LABEL_5:
      uint64_t v7 = 0;
      goto LABEL_6;
    }
    uint64_t v9 = (void *)MEMORY[0x263F086E0];
    uint64_t v10 = PSBundlePathForPreferenceBundle();
    uint64_t v11 = SFRuntimeAbsoluteFilePathForPath();
    os_signpost_id_t v4 = [v9 bundleWithPath:v11];

    uint64_t v12 = (void *)MEMORY[0x263F5FC40];
    uint64_t v13 = [MEMORY[0x263F33238] nudityDetectionRowLabel];
    __int16 v14 = [MEMORY[0x263F33238] classForNudityAppDetectionSettings];
    uint64_t v7 = objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, sel_getNudityDetectionEnabledValue, objc_msgSend(v4, "classNamed:", v14), 2, 0);

    v15 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    [v7 setProperty:v15 forKey:@"BUNDLE_ID"];

    [v7 setIdentifier:@"NUDITY_DETECTION"];
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F33238], "nudityDetectionRowEnabled"));
    [v7 setObject:v16 forKeyedSubscript:*MEMORY[0x263F600A8]];

    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    objc_super v17 = [MEMORY[0x263F33238] nudityDetectionRowIconID];
    [v7 setObject:v17 forKeyedSubscript:*MEMORY[0x263F60158]];
  }
  else
  {
    uint64_t v7 = 0;
  }

LABEL_6:
  return v7;
}

- (id)getNudityDetectionEnabledValue
{
  uint64_t v2 = (void *)MEMORY[0x263F33238];
  id v3 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  os_signpost_id_t v4 = [v2 nudityDetectionOnOffLabelForBundleID:v3];

  return v4;
}

- (id)liveActivitiesSpecifier
{
  if ((self->_policyOptions & 0x10000000000) != 0
    && [(AUSystemSettingsSpecifiersProvider *)self _supportsLiveActivities])
  {
    BOOL v3 = [(AUSystemSettingsSpecifiersProvider *)self _supportsLiveActivitiesFrequentUpdates];
    os_signpost_id_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"Live Activities" value:&stru_26FC1C568 table:0];

    if (v3)
    {
      char v6 = (void *)MEMORY[0x263F086E0];
      uint64_t v7 = PSBundlePathForPreferenceBundle();
      uint64_t v8 = SFRuntimeAbsoluteFilePathForPath();
      uint64_t v9 = [v6 bundleWithPath:v8];

      uint64_t v10 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, 0, 0, 0, objc_msgSend(v9, "classNamed:", @"ActivitySettingsDetailController"), 1, 0);
      uint64_t v11 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
      [v10 setProperty:v11 forKey:@"BUNDLE_ID"];

      uint64_t v12 = [v9 classNamed:@"ActivitySettingsCell"];
      [v10 setProperty:v12 forKey:*MEMORY[0x263F5FFE0]];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:self set:sel_setLiveActivitiesEnabled_forSpecifier_ get:sel_isLiveActivitiesEnabled_ detail:0 cell:6 edit:0];
      [v10 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    }
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    [v10 setObject:@"com.apple.graphic-icon.live-activities" forKeyedSubscript:*MEMORY[0x263F60158]];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (BOOL)_supportsLiveActivities
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x263F01878]);
  os_signpost_id_t v4 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  id v6 = objc_alloc_init(MEMORY[0x263EFB5D0]);
  if ([v5 supportsLiveActivities]) {
    char v7 = [v6 areActivitiesEnabled];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_supportsLiveActivitiesFrequentUpdates
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F01878]);
    id v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    id v6 = (void *)[v4 initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];

    LOBYTE(v5) = [v6 supportsLiveActivitiesFrequentUpdates];
    LOBYTE(v3) = (_BYTE)v5;
  }
  return v3;
}

- (void)setLiveActivitiesEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263EFB5C8];
  id v6 = a3;
  id v9 = objc_alloc_init(v5);
  uint64_t v7 = [v6 BOOLValue];

  uint64_t v8 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  [v9 setActivitiesEnabled:v7 forBundleId:v8];
}

- (id)isLiveActivitiesEnabled:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFB5C8]);
  id v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  uint64_t v6 = [v4 areActivitiesEnabledForBundleId:v5];

  uint64_t v7 = [NSNumber numberWithBool:v6];

  return v7;
}

- (BOOL)_supportsJournalingSuggestions
{
  id v3 = objc_alloc(MEMORY[0x263F01878]);
  id v4 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  LOBYTE(v4) = objc_msgSend(v5, "au_supportsJournalingSuggestions");
  return (char)v4;
}

- (id)_journalingSuggestionsSpecifiers
{
  id v3 = [MEMORY[0x263EFF980] array];
  if ((self->_policyOptions & 0x100000000000) != 0
    && [(AUSystemSettingsSpecifiersProvider *)self _supportsJournalingSuggestions])
  {
    id v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"JOURNALING_SUGGESTIONS_GROUP"];
    [v3 addObject:v4];
    id v5 = (void *)MEMORY[0x263F5FC40];
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"Journaling Suggestions" value:&stru_26FC1C568 table:0];
    uint64_t v8 = [v5 preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:NSClassFromString(&cfstr_Mosuggestionsh.isa) cell:2 edit:0];

    uint64_t v9 = MEMORY[0x263EFFA88];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
    uint64_t v10 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F5FF00]];

    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F601A8]];
    [v8 setObject:@"com.apple.graphic-icon.journaling-suggestions" forKeyedSubscript:*MEMORY[0x263F60158]];
    [v3 addObject:v8];
  }
  return v3;
}

- (id)accessoriesSpecifier
{
  accessoriesPrivacyController = self->_accessoriesPrivacyController;
  if (!accessoriesPrivacyController)
  {
    id v4 = [AUAccessoriesPolicyController alloc];
    id v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    uint64_t v6 = [(AUAccessoriesPolicyController *)v4 initWithAppBundleID:v5];
    uint64_t v7 = self->_accessoriesPrivacyController;
    self->_accessoriesPrivacyController = v6;

    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__AUSystemSettingsSpecifiersProvider_accessoriesSpecifier__block_invoke;
    v13[3] = &unk_265230F88;
    objc_copyWeak(&v14, &location);
    [(AUAccessoriesPolicyController *)self->_accessoriesPrivacyController setAccessChangedHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    accessoriesPrivacyController = self->_accessoriesPrivacyController;
  }
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"Accessories" value:&stru_26FC1C568 table:0];
  uint64_t v10 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  uint64_t v11 = [(AUAccessoriesPolicyController *)accessoriesPrivacyController appSpecifierWithName:v9 bundleID:v10];

  if (v11) {
    [v11 setIdentifier:@"ACCESSORIES"];
  }
  return v11;
}

void __58__AUSystemSettingsSpecifiersProvider_accessoriesSpecifier__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 systemSettingsSpecifiersProviderDidReloadSpecifiers:v3];
}

- (id)accountsSpecifier
{
  if (_os_feature_enabled_impl() && (self->_policyOptions & 0x8000000) != 0)
  {
    id v4 = [MEMORY[0x263F5FAC8] sharedEnumerator];
    uint64_t v5 = [v4 visibleAccountCount];

    uint64_t v6 = (void *)MEMORY[0x263F5FC40];
    if (v5 < 1)
    {
      uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v10 localizedStringForKey:@"Add Account…" value:&stru_26FC1C568 table:0];
      id v3 = [v6 preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:objc_opt_class() cell:13 edit:0];

      [v3 setIdentifier:@"ADD_ACCOUNT"];
      [v3 setTarget:self];
      [v3 setButtonAction:sel__handleAddAccountButtonAction_];
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[AUSystemSettingsSpecifiersProvider _accountModificationDisabledByRestrictions](self, "_accountModificationDisabledByRestrictions") ^ 1);
      [v3 setProperty:v12 forKey:*MEMORY[0x263F600A8]];
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x263F5FC40]);
      uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v9 = [v8 localizedStringForKey:@"Accounts" value:&stru_26FC1C568 table:0];
      id v3 = (void *)[v7 initWithName:v9 target:self set:0 get:sel__accountsCount_ detail:objc_opt_class() cell:2 edit:0];

      [v3 setIdentifier:@"ACCOUNTS"];
    }
    uint64_t v13 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x263F5FF00]];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)_accountsCount:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08A30];
  id v4 = NSNumber;
  uint64_t v5 = objc_msgSend(MEMORY[0x263F5FAC8], "sharedEnumerator", a3);
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "visibleAccountCount"));
  id v7 = [v3 localizedStringFromNumber:v6 numberStyle:1];

  return v7;
}

- (void)_handleAddAccountButtonAction:(id)a3
{
  id v9 = a3;
  id v4 = [(AUSystemSettingsSpecifiersProvider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  uint64_t v6 = v9;
  if (v5)
  {
    id v7 = objc_alloc_init((Class)[v9 detailControllerClass]);
    if (v7)
    {
      uint64_t v8 = [(AUSystemSettingsSpecifiersProvider *)self delegate];
      [v8 systemSettingsSpecifiersProvider:self presentViewController:v7 animated:1];
    }
    uint64_t v6 = v9;
  }
}

- (BOOL)_accountModificationDisabledByRestrictions
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53710]] == 2;

  return v3;
}

- (void)monitoredStoreDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__AUSystemSettingsSpecifiersProvider_monitoredStoreDidChange___block_invoke;
  block[3] = &unk_265230FB0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__AUSystemSettingsSpecifiersProvider_monitoredStoreDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 systemSettingsSpecifiersProviderDidReloadSpecifiers:*(void *)(a1 + 32)];
}

- (id)calendarSpecifiers
{
  if ((self->_policyOptions & 8) != 0)
  {
    if (!self->_calendarPrivacyController)
    {
      id v4 = (AUCalendarPolicyController *)objc_opt_new();
      calendarPrivacyController = self->_calendarPrivacyController;
      self->_calendarPrivacyController = v4;
    }
    if (calendarSpecifiers_onceToken != -1) {
      dispatch_once(&calendarSpecifiers_onceToken, &__block_literal_global_219);
    }
    uint64_t v6 = self->_calendarPrivacyController;
    uint64_t v7 = calendarSpecifiers_specifierName;
    uint64_t v8 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    id v2 = [(AUCalendarPolicyController *)v6 appSpecifierWithName:v7 bundleID:v8];

    if (v2) {
      [v2 setIdentifier:@"CALENDAR"];
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

void __56__AUSystemSettingsSpecifiersProvider_calendarSpecifiers__block_invoke()
{
  id v2 = +[AUCalendarPolicyController loadPrivacySettingsBundle];
  uint64_t v0 = [v2 localizedStringForKey:@"CALENDARS" value:&stru_26FC1C568 table:@"Privacy"];
  uint64_t v1 = (void *)calendarSpecifiers_specifierName;
  calendarSpecifiers_specifierName = v0;
}

- (id)assistantSpecifiers
{
  if ((self->_policyOptions & 0x800000) != 0
    && ([MEMORY[0x263F01880] defaultWorkspace],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v3 applicationIsInstalled:v4],
        v4,
        v3,
        v5))
  {
    uint64_t v6 = (void *)MEMORY[0x263F01868];
    uint64_t v7 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    uint64_t v8 = [v6 applicationProxyForIdentifier:v7];
    id v9 = PSApplicationSpecifierForAssistantSection();

    [v9 setIdentifier:@"SIRI"];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)searchSpecifiers
{
  if ((self->_policyOptions & 0x800000) != 0)
  {
    if (searchSpecifiers_onceToken != -1) {
      dispatch_once(&searchSpecifiers_onceToken, &__block_literal_global_235);
    }
    id v4 = (void *)MEMORY[0x263F5FC40];
    int v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"Search" value:&stru_26FC1C568 table:0];
    id v2 = [v4 preferenceSpecifierNamed:v6 target:0 set:0 get:0 detail:searchSpecifiers_sDetailClass cell:1 edit:0];

    [v2 setIdentifier:@"SEARCH"];
    [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    [v2 setObject:@"com.apple.graphic-icon.search" forKeyedSubscript:*MEMORY[0x263F60158]];
    id v7 = objc_alloc(MEMORY[0x263F01878]);
    uint64_t v8 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    id v9 = (void *)[v7 initWithBundleIdentifier:v8 allowPlaceholder:1 error:0];

    uint64_t v10 = [v9 localizedName];
    if (![v10 length])
    {
      uint64_t v11 = [v9 localizedShortName];

      uint64_t v10 = (void *)v11;
    }
    [v2 setObject:v10 forKeyedSubscript:@"APP_NAME"];
    uint64_t v12 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    [v2 setObject:v12 forKeyedSubscript:@"BUNDLE_ID"];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

void __54__AUSystemSettingsSpecifiersProvider_searchSpecifiers__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = PSBundlePathForPreferenceBundle();
  id v2 = SFRuntimeAbsoluteFilePathForPath();
  id v3 = [v0 bundleWithPath:v2];

  [v3 load];
  searchSpecifiers_sDetailClass = (uint64_t)NSClassFromString(&cfstr_Spotlightdetai.isa);
}

- (id)dataUsageWorkspaceInfo
{
  uint64_t v12 = 0;
  uint64_t v8 = 0;
  long long v10 = 0u;
  uint64_t v11 = 0;
  id v9 = self;
  uint64_t v2 = _CTServerConnectionCreate();
  if (v2)
  {
    id v3 = (const void *)v2;
    _CTServerConnectionCopyCellularUsageWorkspaceInfo();
    CFRelease(v3);
  }
  id v4 = _AULoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_247E6E000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the data usage workspace information", v7, 2u);
  }

  int v5 = v12;
  return v5;
}

- (BOOL)_isWirelessDataRestricted
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53748]];

  id v4 = [MEMORY[0x263F82670] currentDevice];
  char v5 = objc_msgSend(v4, "sf_isChinaRegionCellularDevice");

  BOOL v6 = (v5 & 1) == 0 && CTCellularDataPlanGetIsEnabled() == 0;
  return v3 == 2 || v6;
}

- (id)wirelessDataSpecifierWithAppName:(id)a3
{
  id v4 = a3;
  if ((self->_policyOptions & 0x8000) == 0 || !MGGetBoolAnswer()) {
    goto LABEL_5;
  }
  BOOL v5 = [(AUSystemSettingsSpecifiersProvider *)self _isWirelessDataRestricted];
  uint64_t v6 = *MEMORY[0x263F600A8];
  [0 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
  if (v5)
  {
    [0 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v6];
LABEL_5:
    id v7 = 0;
    goto LABEL_6;
  }
  id v9 = (void *)MEMORY[0x263F67EB8];
  long long v10 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  uint64_t v11 = objc_opt_new();
  id v7 = objc_msgSend(v9, "systemPolicySpecifierForAppName:bundleID:icon:enabled:", v4, v10, v11, -[AUSystemSettingsSpecifiersProvider _isWirelessDataRestricted](self, "_isWirelessDataRestricted") ^ 1);

  uint64_t v12 = NSString;
  uint64_t v13 = [v7 identifier];
  id v14 = [v12 stringWithFormat:@"%@.wireless", v13];
  [v7 setIdentifier:v14];

  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
  [v7 setObject:@"com.apple.graphic-icon.cellular-settings" forKeyedSubscript:*MEMORY[0x263F60158]];
  id v15 = (id)[v7 performGetter];
  [v7 removePropertyForKey:*MEMORY[0x263F60140]];
LABEL_6:

  return v7;
}

- (id)familyControlsSpecifier
{
  if ((self->_policyOptions & 0x1000000000) != 0
    && [(AUSystemSettingsSpecifiersProvider *)self _getAuthorizationRecordsStatus] != 1)
  {
    id v4 = (void *)MEMORY[0x263F5FC40];
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"Screen Time Restrictions" value:&stru_26FC1C568 table:0];
    int v3 = [v4 preferenceSpecifierNamed:v6 target:self set:sel_setFamilyControlsEnabled_forSpecifier_ get:sel_isFamilyControlsEnabled_ detail:0 cell:6 edit:0];

    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    [v3 setObject:@"com.apple.graphic-icon.screen-time" forKeyedSubscript:*MEMORY[0x263F60158]];
  }
  else
  {
    int v3 = 0;
  }
  return v3;
}

- (int64_t)_getAuthorizationRecordsStatus
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v3 = objc_msgSend(MEMORY[0x263F3C070], "sharedCenter", 0);
  id v4 = [v3 authorizationRecords];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    int64_t v8 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 bundleIdentifier];
        uint64_t v12 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
        char v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          int64_t v8 = [v10 status];
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v8 = 1;
  }
LABEL_12:

  return v8;
}

- (void)setFamilyControlsEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v19 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  id v7 = v6;
  id v27 = v7;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int64_t v8 = [MEMORY[0x263F3C070] sharedCenter];
  id v9 = [v8 authorizationRecords];

  long long v10 = 0;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      id v14 = v10;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        long long v16 = [v15 bundleIdentifier];
        long long v17 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
        if ([v16 isEqualToString:v17])
        {
          long long v10 = [v15 recordIdentifier];
        }
        else
        {
          long long v10 = 0;
        }

        ++v13;
        id v14 = v10;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }

  if ([(AUSystemSettingsSpecifiersProvider *)self _getAuthorizationRecordsStatus] == 2)
  {
    long long v18 = [MEMORY[0x263F3C070] sharedCenter];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __76__AUSystemSettingsSpecifiersProvider_setFamilyControlsEnabled_forSpecifier___block_invoke;
    v21[3] = &unk_265230FD8;
    v21[4] = v26;
    [v18 resetAuthorizationForRecordIdentifier:v10 completionHandler:v21];
  }
  else
  {
    long long v18 = [MEMORY[0x263F3C070] sharedCenter];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __76__AUSystemSettingsSpecifiersProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_2;
    v20[3] = &unk_265230FD8;
    v20[4] = v26;
    [v18 requestAuthorizationForRecordIdentifier:v10 completionHandler:v20];
  }

  _Block_object_dispose(v26, 8);
}

void __76__AUSystemSettingsSpecifiersProvider_setFamilyControlsEnabled_forSpecifier___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = (void *)MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x263EFFA88];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v2);
}

void __76__AUSystemSettingsSpecifiersProvider_setFamilyControlsEnabled_forSpecifier___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = (void *)MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x263EFFA80];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v2);
}

- (id)isFamilyControlsEnabled:(id)a3
{
  if ([(AUSystemSettingsSpecifiersProvider *)self _getAuthorizationRecordsStatus] == 2) {
    int v3 = (void *)MEMORY[0x263EFFA88];
  }
  else {
    int v3 = (void *)MEMORY[0x263EFFA80];
  }
  return v3;
}

- (id)backgroundAppRefreshSpecifier
{
  if ((self->_policyOptions & 2) != 0
    && [(AUSystemSettingsSpecifiersProvider *)self _supportsBackgroundAppRefresh])
  {
    int v3 = (void *)MEMORY[0x263F5FC40];
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"Background App Refresh" value:&stru_26FC1C568 table:0];
    id v6 = [v3 preferenceSpecifierNamed:v5 target:self set:sel_setBackgroundRefreshEnabled_forSpecifier_ get:sel_isBackgroundRefreshEnabled_ detail:0 cell:6 edit:0];

    [v6 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    id v7 = objc_msgSend(NSNumber, "numberWithInt:", -[AUSystemSettingsSpecifiersProvider _isBackgroundAppRefreshAllowed](self, "_isBackgroundAppRefreshAllowed") ^ 1);
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600A8]];

    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    [v6 setObject:@"com.apple.graphic-icon.background-app-refresh" forKeyedSubscript:*MEMORY[0x263F60158]];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)_supportsBackgroundAppRefresh
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F01878]);
  id v4 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(v5, "UIBackgroundModes", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v11 isEqualToString:@"remote-notification"] & 1) != 0
          || ([v11 isEqualToString:@"newsstand-content"] & 1) != 0
          || ([v11 isEqualToString:@"fetch"] & 1) != 0
          || ([v11 isEqualToString:@"processing"] & 1) != 0)
        {
          BOOL v12 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_15:

  return v12;
}

- (BOOL)_isBackgroundAppRefreshAllowed
{
  uint64_t v2 = [MEMORY[0x263F08AB0] processInfo];
  char v3 = [v2 isLowPowerModeEnabled];

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F53C50] sharedConnection];
    int v6 = [v5 isAutomaticAppUpdatesAllowed];
    int v7 = [v5 isAutomaticAppUpdatesModificationAllowed];
    int v4 = v6 & v7 ^ 1 | [v5 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F537A0]];
  }
  return v4;
}

- (void)setBackgroundRefreshEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  int v6 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
  value = (void *)[v6 mutableCopy];

  if (!value) {
    value = objc_opt_new();
  }
  int v7 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  [value setObject:v5 forKey:v7];

  CFPreferencesSetAppValue(@"KeepAppsUpToDateAppList", value, @"com.apple.mt");
  CFPreferencesAppSynchronize(@"com.apple.mt");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kKeepAppsUpToDateEnabledChangedNotification", 0, 0, 1u);
}

- (id)isBackgroundRefreshEnabled:(id)a3
{
  int v4 = objc_msgSend(MEMORY[0x263F08AB0], "processInfo", a3);
  char v5 = [v4 isLowPowerModeEnabled];

  if (v5)
  {
    int v6 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    int v7 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
    uint64_t v8 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    uint64_t v9 = [v7 objectForKey:v8];

    if (v9) {
      int v6 = (void *)v9;
    }
    else {
      int v6 = (void *)MEMORY[0x263EFFA88];
    }
  }
  return v6;
}

- (id)photosServicesSpecifier
{
  if ((self->_policyOptions & 0x20) != 0)
  {
    photosPrivacyController = self->_photosPrivacyController;
    if (!photosPrivacyController)
    {
      char v5 = (PSPhotosPolicyController *)objc_opt_new();
      int v6 = self->_photosPrivacyController;
      self->_photosPrivacyController = v5;

      photosPrivacyController = self->_photosPrivacyController;
    }
    int v7 = +[AUHelperFunctions localizedDisplayNameForTCCService:*MEMORY[0x263F7C5B8]];
    uint64_t v8 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    uint64_t v2 = [(PSPhotosPolicyController *)photosPrivacyController appSpecifierWithName:v7 bundleID:v8];

    if (v2)
    {
      [v2 setIdentifier:@"PHOTOS"];
      [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
      [v2 setObject:@"com.apple.mobileslideshow" forKeyedSubscript:*MEMORY[0x263F60188]];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)walletSpecifier
{
  if ((self->_policyOptions & 0x800000000000) != 0)
  {
    int v4 = [AUWalletPolicyController alloc];
    char v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    int v6 = [(AUWalletPolicyController *)v4 initWithBundleIdentifier:v5];
    walletPrivacyController = self->_walletPrivacyController;
    self->_walletPrivacyController = v6;

    uint64_t v2 = [(AUWalletPolicyController *)self->_walletPrivacyController specifier];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)contactsServicesSpecifier
{
  if ((self->_policyOptions & 4) != 0)
  {
    contactsPrivacyController = self->_contactsPrivacyController;
    if (!contactsPrivacyController)
    {
      char v5 = (PSContactsPolicyController *)objc_opt_new();
      int v6 = self->_contactsPrivacyController;
      self->_contactsPrivacyController = v5;

      contactsPrivacyController = self->_contactsPrivacyController;
    }
    int v7 = +[AUHelperFunctions localizedDisplayNameForTCCService:*MEMORY[0x263F7C4F8]];
    uint64_t v8 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    uint64_t v2 = [(PSContactsPolicyController *)contactsPrivacyController appSpecifierWithName:v7 bundleID:v8];

    if (v2)
    {
      [v2 setIdentifier:@"CONTACTS"];
      [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
      [v2 setObject:@"com.apple.MobileAddressBook" forKeyedSubscript:*MEMORY[0x263F60188]];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (BOOL)getMulticastAllowed:(BOOL *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)[MEMORY[0x263F145F0] copyAggregatePathRules];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "matchSigningIdentifier", (void)v16);
        BOOL v12 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
        if ([v11 isEqualToString:v12])
        {
          int v13 = [v10 multicastPreferenceSet];

          if (v13)
          {
            if (a3) {
              *a3 = 1;
            }
            int v14 = [v10 denyMulticast] ^ 1;
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v14) = 0;
LABEL_16:

  return v14;
}

- (void)setupNetworkConfiguration
{
  char v9 = 0;
  [(AUSystemSettingsSpecifiersProvider *)self getMulticastAllowed:&v9];
  if (v9)
  {
    objc_initWeak(&location, self);
    char v3 = [MEMORY[0x263F145C0] sharedManagerForAllUsers];
    uint64_t v4 = MEMORY[0x263EF83A0];
    id v5 = MEMORY[0x263EF83A0];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__AUSystemSettingsSpecifiersProvider_setupNetworkConfiguration__block_invoke;
    v6[3] = &unk_265231000;
    objc_copyWeak(&v7, &location);
    [v3 setChangedQueue:v4 andHandler:v6];

    [(AUSystemSettingsSpecifiersProvider *)self loadNetworkConfigurationsForceRefresh:0];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __63__AUSystemSettingsSpecifiersProvider_setupNetworkConfiguration__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained loadNetworkConfigurationsForceRefresh:1];
}

- (void)loadNetworkConfigurationsForceRefresh:(BOOL)a3
{
  if (self->_pathControllerConfiguration) {
    BOOL v3 = !a3;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    id v5 = objc_msgSend(MEMORY[0x263F145C0], "sharedManagerForAllUsers", a3);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __76__AUSystemSettingsSpecifiersProvider_loadNetworkConfigurationsForceRefresh___block_invoke;
    v6[3] = &unk_265231028;
    void v6[4] = self;
    [v5 loadConfigurationsWithCompletionQueue:MEMORY[0x263EF83A0] handler:v6];
  }
}

void __76__AUSystemSettingsSpecifiersProvider_loadNetworkConfigurationsForceRefresh___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _AULoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__AUSystemSettingsSpecifiersProvider_loadNetworkConfigurationsForceRefresh___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v14 = objc_msgSend(v13, "name", (void)v18);
        if ([v14 isEqualToString:@"com.apple.preferences.networkprivacy"])
        {
          long long v15 = [v13 pathController];

          if (!v15) {
            continue;
          }
          uint64_t v16 = *(void *)(a1 + 32);
          id v17 = v13;
          int v14 = *(void **)(v16 + 64);
          *(void *)(v16 + 64) = v17;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)saveNetworkConfiguration
{
  uint64_t v2 = self->_pathControllerConfiguration;
  BOOL v3 = [MEMORY[0x263F145C0] sharedManagerForAllUsers];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__AUSystemSettingsSpecifiersProvider_saveNetworkConfiguration__block_invoke;
  v5[3] = &unk_265231050;
  id v6 = v2;
  uint64_t v4 = v2;
  [v3 saveConfiguration:v4 withCompletionQueue:MEMORY[0x263EF83A0] handler:v5];
}

void __62__AUSystemSettingsSpecifiersProvider_saveNetworkConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _AULoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__AUSystemSettingsSpecifiersProvider_saveNetworkConfiguration__block_invoke_cold_1((uint64_t)v3, a1, v4);
    }
  }
}

- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(NEConfiguration *)self->_pathControllerConfiguration pathController];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = objc_msgSend(v7, "pathRules", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v14 = [v13 matchSigningIdentifier];
        int v15 = [v14 isEqualToString:v6];

        if (v15)
        {
          id v16 = v13;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    id v16 = (id)[objc_alloc(MEMORY[0x263F145F8]) initWithSigningIdentifier:v6];
    id v17 = [v7 pathRules];

    if (v17)
    {
      id v8 = [v7 pathRules];
      long long v18 = [v8 arrayByAddingObject:v16];
      [v7 setPathRules:v18];
    }
    else
    {
      id v24 = v16;
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      [v7 setPathRules:v8];
    }
LABEL_13:
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  id v7 = [(AUSystemSettingsSpecifiersProvider *)self pathRuleForBundleID:v6 create:1];

  LODWORD(v6) = [v5 BOOLValue];
  [v7 setDenyMulticast:v6 ^ 1];
  [v7 setMulticastPreferenceSet:1];
  [(AUSystemSettingsSpecifiersProvider *)self saveNetworkConfiguration];
}

- (id)isLocalNetworkEnabled:(id)a3
{
  if (self->_pathControllerConfiguration)
  {
    BOOL v4 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    id v5 = [(AUSystemSettingsSpecifiersProvider *)self pathRuleForBundleID:v4 create:0];

    id v6 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v5, "denyMulticast") ^ 1);
  }
  else
  {
    id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[AUSystemSettingsSpecifiersProvider getMulticastAllowed:](self, "getMulticastAllowed:", 0));
  }
  return v6;
}

- (id)networkServicesSpecifier
{
  if ((self->_policyOptions & 0x4000000) != 0
    && _os_feature_enabled_impl()
    && (char v9 = 0, [(AUSystemSettingsSpecifiersProvider *)self getMulticastAllowed:&v9], v9))
  {
    [(AUSystemSettingsSpecifiersProvider *)self setupNetworkConfiguration];
    id v3 = (void *)MEMORY[0x263F5FC40];
    BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"Local Network" value:&stru_26FC1C568 table:0];
    id v6 = [v3 preferenceSpecifierNamed:v5 target:self set:sel_setLocalNetworkEnabled_specifier_ get:sel_isLocalNetworkEnabled_ detail:0 cell:6 edit:0];

    id v7 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    [v6 setProperty:v7 forKey:@"PUINetworkApplicationKey"];

    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    [v6 setObject:@"com.apple.graphic-icon.local-network" forKeyedSubscript:*MEMORY[0x263F60158]];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)locationServicesSpecifier
{
  if ((self->_policyOptions & 0x10000) != 0)
  {
    BOOL v4 = (void *)CLCopyAppsUsingLocation();
    id v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    id v6 = [v4 objectForKey:v5];

    if (v6 && [MEMORY[0x263F00A60] primaryEntityClassForLocationDictionary:v6] == 1)
    {
      id v7 = (void *)MEMORY[0x263F5FC40];
      id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v9 = [v8 localizedStringForKey:@"Location" value:&stru_26FC1C568 table:0];
      uint64_t v2 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:sel_locationStatus_ detail:NSClassFromString(&cfstr_Puilocationser.isa) cell:2 edit:0];

      uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", -[AUSystemSettingsSpecifiersProvider _isLocationServicesRestricted](self, "_isLocationServicesRestricted") ^ 1);
      [v2 setProperty:v10 forKey:*MEMORY[0x263F600A8]];

      uint64_t v11 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
      [v2 setProperty:v11 forKey:*MEMORY[0x263F60138]];

      [v2 setProperty:NSClassFromString(&cfstr_Psuilocationse.isa) forKey:*MEMORY[0x263F5FFE0]];
      [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
      [v2 setObject:@"com.apple.graphic-icon.location" forKeyedSubscript:*MEMORY[0x263F60158]];
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (BOOL)_isLocationServicesRestricted
{
  BOOL v2 = +[AUSystemSettingsSpecifiersProvider isServiceRestricted:@"location"];
  return [MEMORY[0x263F00A60] locationServicesEnabled] ^ 1 | v2;
}

- (id)locationStatus:(id)a3
{
  BOOL v4 = (void *)CLCopyAppsUsingLocation();
  id v5 = (void *)MEMORY[0x263F00A60];
  id v6 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  id v7 = [v4 objectForKey:v6];
  uint64_t v8 = [v5 entityAuthorizationForLocationDictionary:v7];

  char v9 = [(AUSystemSettingsSpecifiersProvider *)self authLevelStringForStatus:v8];

  return v9;
}

- (id)authLevelStringForStatus:(unint64_t)a3
{
  if (a3)
  {
    BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v4;
    id v6 = @"Never";
  }
  else if (a3)
  {
    if ((a3 & 4) != 0)
    {
      BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      id v6 = @"Always";
    }
    else
    {
      if ((a3 & 2) == 0)
      {
        id v3 = 0;
        goto LABEL_11;
      }
      BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      id v6 = @"While Using";
    }
  }
  else
  {
    BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v4;
    id v6 = @"When Shared";
  }
  id v3 = [v4 localizedStringForKey:v6 value:&stru_26FC1C568 table:0];

LABEL_11:
  return v3;
}

- (id)privacySpecifiersWithTCCServiceLookup:(id)a3 tccServiceOverrides:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  char v9 = [(AUSystemSettingsSpecifiersProvider *)self locationServicesSpecifier];
  objc_msgSend(v8, "na_safeAddObject:", v9);

  if (_os_feature_enabled_impl()) {
    [(AUSystemSettingsSpecifiersProvider *)self contactsServicesSpecifier];
  }
  else {
  uint64_t v10 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C4F8] tccServiceLookup:v6 tccServiceOverrides:v7];
  }
  objc_msgSend(v8, "na_safeAddObject:", v10);

  uint64_t v11 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C5C8] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v11);

  BOOL v12 = [(AUSystemSettingsSpecifiersProvider *)self photosServicesSpecifier];
  objc_msgSend(v8, "na_safeAddObject:", v12);

  int v13 = [(AUSystemSettingsSpecifiersProvider *)self accessoriesSpecifier];
  objc_msgSend(v8, "na_safeAddObject:", v13);

  int v14 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C500] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v14);

  int v15 = [(AUSystemSettingsSpecifiersProvider *)self networkServicesSpecifier];
  objc_msgSend(v8, "na_safeAddObject:", v15);

  id v16 = [MEMORY[0x263F5FB08] sharedManager];
  int v17 = [v16 capabilityBoolAnswer:@"9RryeqF6OCWlbaXP2Qsoag"];

  if (v17)
  {
    long long v18 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C5A8] tccServiceLookup:v6 tccServiceOverrides:v7];
    objc_msgSend(v8, "na_safeAddObject:", v18);
  }
  long long v19 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C598] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v19);

  long long v20 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C640] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v20);

  long long v21 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C5A0] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v21);

  long long v22 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C510] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v22);

  long long v23 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C548] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v23);

  id v24 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C518] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v24);

  long long v25 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C5D0] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v25);

  uint64_t v26 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C688] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v26);

  id v27 = [(AUSystemSettingsSpecifiersProvider *)self walletSpecifier];
  objc_msgSend(v8, "na_safeAddObject:", v27);

  v28 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C590] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v28);

  uint64_t v29 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C588] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v29);

  if (_os_feature_enabled_impl())
  {
    v30 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C568] tccServiceLookup:v6 tccServiceOverrides:v7];
    objc_msgSend(v8, "na_safeAddObject:", v30);
  }
  v31 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C678] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "na_safeAddObject:", v31);

  return v8;
}

- (id)privacySpecifierForService:(__CFString *)a3 tccServiceLookup:(id)a4 tccServiceOverrides:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t policyOptions = self->_policyOptions;
  uint64_t v11 = [(id)_PSServicePolicyOptions objectForKey:a3];
  uint64_t v12 = [v11 unsignedIntegerValue] & policyOptions;

  if (!v12)
  {
    long long v20 = 0;
    goto LABEL_42;
  }
  int v13 = [v9 containsObject:a3];
  objc_opt_class();
  int v14 = [v8 objectForKeyedSubscript:a3];
  if (objc_opt_isKindOfClass()) {
    int v15 = v14;
  }
  else {
    int v15 = 0;
  }
  id v16 = v15;

  objc_opt_class();
  int v17 = [v16 objectForKeyedSubscript:*MEMORY[0x263F7C4D8]];

  if (objc_opt_isKindOfClass()) {
    long long v18 = v17;
  }
  else {
    long long v18 = 0;
  }
  id v19 = v18;

  if (!v19)
  {
    if (!self->_forcePolicyOptions)
    {
      id v23 = 0;
      int v17 = 0;
LABEL_40:
      id v23 = v23;
      long long v20 = v23;
      goto LABEL_41;
    }
    goto LABEL_13;
  }
  if (v13)
  {
LABEL_13:

    int v17 = (void *)MEMORY[0x263EFFA80];
  }
  long long v21 = (void *)MEMORY[0x263F5FC40];
  long long v22 = +[AUHelperFunctions localizedDisplayNameForTCCService:a3];
  id v23 = [v21 preferenceSpecifierNamed:v22 target:self set:sel_setPrivacyAccess_forSpecifier_ get:sel_privacyAccessForSpecifier_ detail:0 cell:6 edit:0];

  if ((!CFEqual(a3, (CFTypeRef)*MEMORY[0x263F7C5D0])
     || objc_opt_class() && [MEMORY[0x263F66028] isSecureElementTCCServiceEligible])
    && (!CFEqual(a3, (CFTypeRef)*MEMORY[0x263F7C518])
     || objc_opt_class() && [MEMORY[0x263F66028] isContactlessTCCServiceEligible]))
  {
    [v23 setProperty:a3 forKey:@"service"];
    id v24 = [MEMORY[0x263F5FAB0] settingsIconCache];
    long long v25 = +[AUHelperFunctions classicIconCacheKeyForTCCService:a3];
    uint64_t v26 = [v24 imageForKey:v25];

    if (v26) {
      goto LABEL_22;
    }
    id v27 = (void *)MEMORY[0x263F827E8];
    v28 = +[AUHelperFunctions classicIconCacheKeyForTCCService:a3];
    uint64_t v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v26 = [v27 imageNamed:v28 inBundle:v29 compatibleWithTraitCollection:0];

    if (v26)
    {
LABEL_22:
      [v23 setProperty:v26 forKey:*MEMORY[0x263F60140]];

      int v30 = 0;
    }
    else
    {
      int v30 = 1;
    }
    uint64_t v31 = +[AUHelperFunctions associatedTypedIconIdentifierForTCCService:a3];
    v32 = (void *)v31;
    if (v30 && v31)
    {
      [v23 setObject:v31 forKeyedSubscript:*MEMORY[0x263F60158]];
      [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    }
    v33 = +[AUHelperFunctions associatedApplicationBundleIdentifierForTCCService:a3];
    if (v33) {
      int v34 = v30;
    }
    else {
      int v34 = 0;
    }
    if (v34 == 1)
    {
      [v23 setObject:v33 forKeyedSubscript:*MEMORY[0x263F60188]];
      [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    }
    BOOL v35 = +[AUSystemSettingsSpecifiersProvider isServiceRestricted:a3];
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x263F7C660]))
    {
      v36 = objc_opt_new();
      if (([v36 crossAppTrackingAllowedSwitchEnabled] & 1) == 0)
      {

        BOOL v35 = 1;
        int v17 = (void *)MEMORY[0x263EFFA80];
      }
    }
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x263F7C680]))
    {
      uint64_t v37 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "BOOLValue") ^ 1);

      int v17 = (void *)v37;
    }
    id v38 = [NSNumber numberWithBool:(v35 | v13) ^ 1u];
    [v23 setProperty:v38 forKey:*MEMORY[0x263F600A8]];
    v39 = [v23 propertyForKey:*MEMORY[0x263F602B0]];
    objc_msgSend(v39, "setCellEnabled:", objc_msgSend(v38, "BOOLValue"));

    [v23 setProperty:v17 forKey:*MEMORY[0x263F60308]];
    goto LABEL_40;
  }
  long long v20 = 0;
LABEL_41:

LABEL_42:
  return v20;
}

- (void)setPrivacyAccess:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(location, self);
  id v8 = objc_alloc(MEMORY[0x263F01878]);
  id v9 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  uint64_t v10 = (void *)[v8 initWithBundleIdentifier:v9 allowPlaceholder:1 error:0];

  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke;
  v71[3] = &unk_265231078;
  objc_copyWeak(&v74, location);
  id v11 = v10;
  id v72 = v11;
  id v12 = v6;
  id v73 = v12;
  int v13 = (void (**)(void, void, void, void))MEMORY[0x24C56E5E0](v71);
  int v14 = [v7 propertyForKey:*MEMORY[0x263F60308]];
  char v15 = [v12 isEqual:v14];

  if ((v15 & 1) == 0)
  {
    CFStringRef v16 = (const __CFString *)[v7 propertyForKey:@"service"];
    if (CFEqual(v16, (CFStringRef)*MEMORY[0x263F7C680]))
    {
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "BOOLValue") ^ 1);

      id v12 = (id)v17;
    }
    if ([v12 BOOLValue]
      && CFEqual(v16, (CFStringRef)*MEMORY[0x263F7C660]))
    {
      long long v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v57 = [v18 localizedStringForKey:@"Allow Tracking" value:&stru_26FC1C568 table:0];

      id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v20 = [v19 localizedStringForKey:@"Allow this app to track you across apps and websites owned by other companies." value:&stru_26FC1C568 table:0];

      v56 = (void *)v20;
      v58 = [MEMORY[0x263F82418] alertControllerWithTitle:v57 message:v20 preferredStyle:1];
      long long v21 = (void *)MEMORY[0x263F82400];
      long long v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v23 = [v22 localizedStringForKey:@"Allow" value:&stru_26FC1C568 table:0];
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_415;
      v67[3] = &unk_2652310A0;
      v70[0] = v13;
      id v68 = v12;
      v70[1] = v16;
      v69[0] = v7;
      v69[1] = self;
      uint64_t v24 = [v21 actionWithTitle:v23 style:0 handler:v67];

      [v58 addAction:v24];
      long long v25 = (void *)MEMORY[0x263F82400];
      uint64_t v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v27 = [v26 localizedStringForKey:@"Cancel" value:&stru_26FC1C568 table:0];
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_2_420;
      v66[3] = &unk_2652310C8;
      v66[4] = self;
      v28 = [v25 actionWithTitle:v27 style:0 handler:v66];

      [v58 addAction:v28];
      int v54 = (void *)v24;
      uint64_t v29 = (void *)MEMORY[0x263F82400];
      int v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v31 = [v30 localizedStringForKey:@"Learn more…" value:&stru_26FC1C568 table:0];
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_3;
      v65[3] = &unk_2652310C8;
      v65[4] = self;
      v32 = [v29 actionWithTitle:v31 style:0 handler:v65];

      [v58 addAction:v32];
      v33 = [(AUSystemSettingsSpecifiersProvider *)self delegate];
      [v33 systemSettingsSpecifiersProvider:self presentViewController:v58 animated:1];
      int v34 = (id *)v70;
      BOOL v35 = &v68;
      v36 = (id *)v69;
    }
    else
    {
      if (([v12 BOOLValue] & 1) != 0 || CFStringCompare(v16, (CFStringRef)*MEMORY[0x263F7C5D0], 0))
      {
        ((void (**)(void, id, const __CFString *, id))v13)[2](v13, v12, v16, v7);
        goto LABEL_12;
      }
      uint64_t v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v57 = [v37 localizedStringForKey:@"Turn Off Using The Secure Element With “%@”" value:&stru_26FC1C568 table:0];

      id v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v56 = [v38 localizedStringForKey:@"Any cards that require the Secure Element will be removed from “%@”." value:&stru_26FC1C568 table:0];

      v55 = (void *)MEMORY[0x263F82418];
      v39 = NSString;
      v59 = [v11 localizedName];
      v40 = objc_msgSend(v39, "stringWithFormat:", v57, v59);
      v41 = NSString;
      v42 = [v11 localizedName];
      v43 = objc_msgSend(v41, "stringWithFormat:", v56, v42);
      v44 = [v55 alertControllerWithTitle:v40 message:v43 preferredStyle:1];

      v45 = (void *)MEMORY[0x263F82400];
      v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v47 = [v46 localizedStringForKey:@"Turn Off" value:&stru_26FC1C568 table:0];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_4;
      v61[3] = &unk_2652310A0;
      v64[0] = v13;
      id v62 = v12;
      v64[1] = v16;
      v63[0] = v7;
      v63[1] = self;
      v48 = [v45 actionWithTitle:v47 style:2 handler:v61];
      [v44 addAction:v48];

      v49 = (void *)MEMORY[0x263F82400];
      v50 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v51 = [v50 localizedStringForKey:@"Cancel" value:&stru_26FC1C568 table:0];
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_5;
      v60[3] = &unk_2652310C8;
      v60[4] = self;
      v52 = [v49 actionWithTitle:v51 style:1 handler:v60];
      [v44 addAction:v52];

      v53 = [(AUSystemSettingsSpecifiersProvider *)self delegate];
      [v53 systemSettingsSpecifiersProvider:self presentViewController:v44 animated:1];
      v58 = v44;
      int v34 = (id *)v64;
      BOOL v35 = &v62;
      v36 = (id *)v63;
    }
  }
LABEL_12:

  objc_destroyWeak(&v74);
  objc_destroyWeak(location);
}

void __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke(uint64_t a1, void *a2, const __CFString *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v10 = *(void **)(a1 + 32);
  if (v10)
  {
    CFURLRef v11 = [v10 URL];
    CFBundleRef v12 = CFBundleCreate(0, v11);

    if (v12)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_2;
      v21[3] = &__block_descriptor_40_e5_v8__0l;
      v21[4] = v12;
      int v13 = (void (**)(void))MEMORY[0x24C56E5E0](v21);
      [v7 BOOLValue];
      if (TCCAccessSetForBundle())
      {
        if (CFEqual(a3, (CFStringRef)*MEMORY[0x263F7C680]))
        {
          uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "BOOLValue") ^ 1);

          id v7 = (id)v14;
        }
        [v8 setProperty:v7 forKey:*MEMORY[0x263F60308]];
      }
      if (v13) {
        v13[2](v13);
      }
    }
  }
  char v15 = (void *)TCCAccessCopyBundleIdentifiersForService();
  if (![v15 count])
  {
    CFStringRef v16 = _AULoggingFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[AUSystemSettingsSpecifiersProvider setPrivacyAccess:forSpecifier:]_block_invoke";
      _os_log_impl(&dword_247E6E000, v16, OS_LOG_TYPE_DEFAULT, "%s: all apps were disabled for kTCCServiceUserTracking. Resetting ad identifier.", buf, 0xCu);
    }

    uint64_t v17 = [MEMORY[0x263F01880] defaultWorkspace];
    [v17 clearAdvertisingIdentifier];
  }
  if ([*(id *)(a1 + 40) BOOLValue]) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 2;
  }
  [MEMORY[0x263F67F60] trackingStateOfRequestForSpecificApp:v18 view:@"AppSettings"];
  id v19 = _AULoggingFacility();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [WeakRetained applicationBundleIdentifier];
    *(_DWORD *)buf = 138412290;
    id v23 = v20;
    _os_log_impl(&dword_247E6E000, v19, OS_LOG_TYPE_DEFAULT, "########### Quitting application (%@) in response to privacy settings change.", buf, 0xCu);
  }
}

void __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_2(uint64_t a1)
{
}

void __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_415(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = [*(id *)(a1 + 48) delegate];
  [v2 systemSettingsSpecifiersProviderDidReloadSpecifiers:*(void *)(a1 + 48)];
}

void __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_2_420(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 systemSettingsSpecifiersProviderDidReloadSpecifiers:*(void *)(a1 + 32)];
}

void __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 systemSettingsSpecifiersProviderDidReloadSpecifiers:*(void *)(a1 + 32)];

  id v4 = (id)objc_opt_new();
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 systemSettingsSpecifiersProvider:*(void *)(a1 + 32) presentViewController:v4 animated:1];
}

void __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = [*(id *)(a1 + 48) delegate];
  [v2 systemSettingsSpecifiersProviderDidReloadSpecifiers:*(void *)(a1 + 48)];
}

void __68__AUSystemSettingsSpecifiersProvider_setPrivacyAccess_forSpecifier___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 systemSettingsSpecifiersProviderDidReloadSpecifiers:*(void *)(a1 + 32)];
}

- (id)privacyAccessForSpecifier:(id)a3
{
  id v3 = [a3 propertyForKey:*MEMORY[0x263F60308]];
  id v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x263EFFA80];
  }
  id v5 = v3;

  return v5;
}

- (id)pasteboardSpecifier
{
  v14[3] = *MEMORY[0x263EF8340];
  if ((self->_policyOptions & 0x20000000000) != 0
    && [(AUSystemSettingsSpecifiersProvider *)self shouldShowPasteboardSpecifier])
  {
    id v3 = (void *)MEMORY[0x263F5FC40];
    id v4 = +[AUHelperFunctions localizedDisplayNameForTCCService:*MEMORY[0x263F7C5B0]];
    id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:sel_setPasteboardAccess_forSpecifier_ get:sel_pasteboardAccessForSpecifier_ detail:objc_opt_class() cell:2 edit:0];

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"Ask" value:&stru_26FC1C568 table:0];
    v14[0] = v7;
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"Deny" value:&stru_26FC1C568 table:0];
    v14[1] = v9;
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    CFURLRef v11 = [v10 localizedStringForKey:@"Allow" value:&stru_26FC1C568 table:0];
    v14[2] = v11;
    CFBundleRef v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
    [v5 setValues:&unk_26FC1ED70 titles:v12];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)shouldShowPasteboardSpecifier
{
  uint64_t v3 = *MEMORY[0x263F7C5B0];
  id v13 = 0;
  id v14 = 0;
  id v12 = 0;
  AUGetAuthorizationStatesForService(v3, &v14, &v13, &v12);
  id v4 = v14;
  id v5 = v13;
  id v6 = v12;
  id v7 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  if ([v4 containsObject:v7])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    if ([v5 containsObject:v9])
    {
      char v8 = 1;
    }
    else
    {
      uint64_t v10 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
      char v8 = [v6 containsObject:v10];
    }
  }

  return v8;
}

- (id)pasteboardAccessForSpecifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F7C5B0];
  id v19 = 0;
  id v20 = 0;
  id v18 = 0;
  AUGetAuthorizationStatesForService(v4, &v20, &v19, &v18);
  id v5 = v20;
  id v6 = v19;
  id v7 = v18;
  char v8 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  char v9 = [v5 containsObject:v8];

  if (v9)
  {
    uint64_t v10 = &unk_26FC1ECC8;
  }
  else
  {
    CFURLRef v11 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    char v12 = [v6 containsObject:v11];

    if (v12)
    {
      uint64_t v10 = &unk_26FC1EC98;
    }
    else
    {
      id v13 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
      char v14 = [v7 containsObject:v13];

      if (v14)
      {
        uint64_t v10 = &unk_26FC1ECB0;
      }
      else
      {
        char v15 = _AULoggingFacility();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v16 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
          *(_DWORD *)buf = 136315394;
          long long v22 = "-[AUSystemSettingsSpecifiersProvider pasteboardAccessForSpecifier:]";
          __int16 v23 = 2112;
          uint64_t v24 = v16;
          _os_log_impl(&dword_247E6E000, v15, OS_LOG_TYPE_DEFAULT, "%s: couldn't find auth state for %@", buf, 0x16u);
        }
        uint64_t v10 = &unk_26FC1ECE0;
      }
    }
  }

  return v10;
}

- (void)setPasteboardAccess:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = *MEMORY[0x263F7C5B0];
  id v6 = a3;
  id v8 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  uint64_t v7 = [v6 integerValue];

  AUSetTCCLevelForService(v5, v8, v7);
}

+ (BOOL)isServiceRestricted:(id)a3
{
  id v3 = a3;
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  uint64_t v4 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  uint64_t v5 = v4;
  if (v4) {
    char v6 = [v4 containsObject:v3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)trackingSpecifiersWithTCCServiceLookup:(id)a3 tccServiceOverrides:(id)a4
{
  char v6 = (void *)MEMORY[0x263EFF980];
  id v7 = a4;
  id v8 = a3;
  char v9 = [v6 array];
  uint64_t v10 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C680] tccServiceLookup:v8 tccServiceOverrides:v7];
  objc_msgSend(v9, "na_safeAddObject:", v10);

  CFURLRef v11 = [(AUSystemSettingsSpecifiersProvider *)self privacySpecifierForService:*MEMORY[0x263F7C660] tccServiceLookup:v8 tccServiceOverrides:v7];

  objc_msgSend(v9, "na_safeAddObject:", v11);
  if ([v9 count])
  {
    char v12 = [MEMORY[0x263EFF980] array];
    id v13 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"TRACKING_GROUP"];
    [v12 addObject:v13];
    [v12 addObjectsFromArray:v9];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)documentsSpecifier
{
  if ((self->_policyOptions & 0x400000) != 0)
  {
    id v4 = objc_alloc(MEMORY[0x263F01878]);
    uint64_t v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    char v6 = (void *)[v4 initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];

    id v7 = [v6 URL];
    id v8 = v7;
    if (v7 && [v7 isFileURL])
    {
      char v9 = [MEMORY[0x263F086E0] bundleWithURL:v8];
      uint64_t v10 = [v9 infoDictionary];

      CFURLRef v11 = [v10 objectForKeyedSubscript:@"UISupportsDocumentBrowser"];
      int v12 = [v11 BOOLValue];

      if (v12)
      {
        id v13 = (void *)MEMORY[0x263F5FC40];
        char v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v15 = [v14 localizedStringForKey:@"Document Storage" value:&stru_26FC1C568 table:0];
        id v2 = [v13 preferenceSpecifierNamed:v15 target:self set:0 get:sel_documentSource_ detail:objc_opt_class() cell:2 edit:0];

        [v2 setIdentifier:@"DOCUMENT_STORAGE"];
        [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
        [v2 setObject:@"com.apple.DocumentsApp" forKeyedSubscript:*MEMORY[0x263F60188]];
        CFStringRef v16 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
        [v2 setProperty:v16 forKey:*MEMORY[0x263F60090]];
      }
      else
      {
        id v2 = 0;
      }
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)documentSource:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  char v6 = (void *)MEMORY[0x263F3AAC0];
  id v7 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__AUSystemSettingsSpecifiersProvider_documentSource___block_invoke;
  v11[3] = &unk_2652310F0;
  id v13 = &v14;
  id v8 = v5;
  int v12 = v8;
  [v6 defaultSourceForBundleIdentifier:v7 completionBlock:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

intptr_t __53__AUSystemSettingsSpecifiersProvider_documentSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 displayName];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  char v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

- (id)contactlessNFCSpecifiers
{
  v9[1] = *MEMORY[0x263EF8340];
  if ((self->_policyOptions & 0x8000000000000) != 0)
  {
    id v4 = objc_alloc(MEMORY[0x263F5FBF0]);
    dispatch_semaphore_t v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    char v6 = (void *)[v4 initWithBundleID:v5 delegate:self onChange:&__block_literal_global_478];

    id v7 = [v6 context];
    LODWORD(v5) = [v7 shouldShowDefaultNFCAppPicker];

    if (v5)
    {
      v9[0] = v6;
      id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    }
    else
    {
      id v2 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    id v2 = (void *)MEMORY[0x263EFFA68];
  }
  return v2;
}

- (id)contactlessNFCSideButtonSpecifiers
{
  v24[2] = *MEMORY[0x263EF8340];
  if ((self->_policyOptions & 0x10000000000000) == 0) {
    goto LABEL_5;
  }
  uint64_t v3 = [(AUSystemSettingsSpecifiersProvider *)self nfcContext];

  if (!v3)
  {
    id v4 = (void *)MEMORY[0x263F66010];
    dispatch_semaphore_t v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __72__AUSystemSettingsSpecifiersProvider_contactlessNFCSideButtonSpecifiers__block_invoke;
    v23[3] = &unk_265230FB0;
    v23[4] = self;
    char v6 = [v4 contextWithBundleId:v5 onChange:v23];
    [(AUSystemSettingsSpecifiersProvider *)self setNfcContext:v6];
  }
  id v7 = [(AUSystemSettingsSpecifiersProvider *)self nfcContext];
  uint64_t v8 = [v7 doubleClickToggleVisibilityType];

  if (v8 != 2)
  {
    int v10 = MGGetSInt32Answer();
    CFURLRef v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v12 = v11;
    if (v10 == 2)
    {
      id v13 = [v11 localizedStringForKey:@"Double-Click Side Button" value:&stru_26FC1C568 table:0];

      uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v15 = v14;
      uint64_t v16 = @"Get contactless cards ready at any time by double-clicking the side button.";
    }
    else
    {
      id v13 = [v11 localizedStringForKey:@"Double-Click Home Button" value:&stru_26FC1C568 table:0];

      uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v15 = v14;
      uint64_t v16 = @"Get contactless cards ready from the Lock Screen by double-clicking the Home button.";
    }
    uint64_t v17 = [v14 localizedStringForKey:v16 value:&stru_26FC1C568 table:0];

    id v18 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DOUBLE_CLICK_FOR_NFC_GROUP"];
    [v18 setObject:v17 forKeyedSubscript:*MEMORY[0x263F600F8]];
    id v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v13 target:self set:sel_setDoubleClickForNFC_specifier_ get:sel_getDoubleClickForNFC_ detail:0 cell:6 edit:0];
    [v19 setIdentifier:@"DOUBLE_CLICK_FOR_NFC"];
    id v20 = [(AUSystemSettingsSpecifiersProvider *)self nfcContext];
    uint64_t v21 = [v20 doubleClickToggleVisibilityType];

    if (v21 == 1) {
      [v19 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
    }
    v24[0] = v18;
    v24[1] = v19;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  }
  else
  {
LABEL_5:
    id v9 = 0;
  }
  return v9;
}

void __72__AUSystemSettingsSpecifiersProvider_contactlessNFCSideButtonSpecifiers__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 systemSettingsSpecifiersProviderDidReloadSpecifiers:*(void *)(a1 + 32)];
}

- (id)getDoubleClickForNFC:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = [(AUSystemSettingsSpecifiersProvider *)self nfcContext];
  dispatch_semaphore_t v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isDoubleClickEnabled"));

  return v5;
}

- (void)setDoubleClickForNFC:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = [(AUSystemSettingsSpecifiersProvider *)self nfcContext];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setDoubleClickEnabled:v6];
}

- (id)exposureSpecifiersWithTCCServiceLookup:(id)a3
{
  id v4 = a3;
  if ((self->_policyOptions & 0x100000000) == 0)
  {
    id v5 = 0;
    goto LABEL_14;
  }
  if (![(AUSystemSettingsSpecifiersProvider *)self enServiceMatched])
  {
    [(AUSystemSettingsSpecifiersProvider *)self setEnServiceMatched:1];
    uint64_t v6 = [(AUSystemSettingsSpecifiersProvider *)self matchingBundleIdentifier];
    if (v6)
    {
LABEL_7:

      goto LABEL_8;
    }
    id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7C538]];

    if (v7)
    {
      uint64_t v6 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
      [(AUSystemSettingsSpecifiersProvider *)self setMatchingBundleIdentifier:v6];
      goto LABEL_7;
    }
  }
LABEL_8:
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = [(AUSystemSettingsSpecifiersProvider *)self matchingBundleIdentifier];

  if (v9)
  {
    int v10 = PSBundlePathForPreferenceBundle();
    CFURLRef v11 = [MEMORY[0x263F086E0] bundleWithPath:v10];
    Class v12 = NSClassFromString(&cfstr_Enuiregiondeta.isa);
    if (v12 || ([v11 load], (Class v12 = NSClassFromString(&cfstr_Enuiregiondeta.isa)) != 0))
    {
      id v13 = (void *)MEMORY[0x263F5FC40];
      uint64_t v14 = +[AUHelperFunctions localizedDisplayNameForTCCService:*MEMORY[0x263F7C538]];
      char v15 = [v13 preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:v12 cell:1 edit:0];

      uint64_t v16 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
      [v15 setUserInfo:v16];

      [v15 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
      [v15 setObject:@"com.apple.graphic-icon.exposure-notifications" forKeyedSubscript:*MEMORY[0x263F60158]];
      [v8 addObject:v15];
    }
  }
  id v5 = (void *)[v8 copy];

LABEL_14:
  return v5;
}

- (id)preferredLanguageSpecifier
{
  if ((self->_policyOptions & 0x2000000) != 0)
  {
    id v4 = objc_alloc(MEMORY[0x263F01878]);
    id v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    uint64_t v6 = (void *)[v4 initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];

    id v7 = [v6 URL];
    id v8 = v7;
    if (v7 && [v7 isFileURL])
    {
      id v9 = [MEMORY[0x263F086E0] bundleWithURL:v8];
      int v10 = [v9 normalizedLocalizations];
      unint64_t v11 = [v10 count];
      Class v12 = [MEMORY[0x263EFF960] preferredLanguages];
      unint64_t v13 = [v12 count];

      uint64_t v14 = (void *)MEMORY[0x263F086E0];
      char v15 = [MEMORY[0x263EFF960] preferredLanguages];
      BOOL v35 = v10;
      uint64_t v16 = [v14 preferredLocalizationsFromArray:v10 forPreferences:v15];
      uint64_t v17 = [v16 firstObject];

      id v18 = (void *)MEMORY[0x263F50758];
      id v19 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
      id v20 = [v18 preferredLanguageForBundleID:v19];

      int v21 = [v20 isEqualToString:v17];
      if (v13 > 1)
      {
        int v24 = 0;
      }
      else
      {
        long long v22 = [v9 objectForInfoDictionaryKey:@"UIPrefersShowingLanguageSettings"];
        int v23 = [v22 BOOLValue];

        int v24 = v23 ^ 1;
      }
      if (v11 < 2) {
        int v24 = 1;
      }
      if (v21 & v24)
      {
        id v2 = 0;
      }
      else
      {
        uint64_t v25 = (void *)MEMORY[0x263F086E0];
        uint64_t v26 = PSBundlePathForPreferenceBundle();
        id v27 = SFRuntimeAbsoluteFilePathForPath();
        [v25 bundleWithPath:v27];
        v28 = int v34 = v17;

        uint64_t v29 = (void *)MEMORY[0x263F5FC40];
        int v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v31 = [v30 localizedStringForKey:@"Language" value:&stru_26FC1C568 table:0];
        id v2 = objc_msgSend(v29, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v31, self, 0, sel_preferredLanguage_, objc_msgSend(v28, "classNamed:", @"ISApplicationLanguageController"), 2, 0);

        [v2 setIdentifier:@"PREFERRED_LANGUAGE"];
        [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
        [v2 setObject:@"com.apple.graphic-icon.language" forKeyedSubscript:*MEMORY[0x263F60158]];
        v32 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
        [v2 setProperty:v32 forKey:@"bundleID"];

        uint64_t v17 = v34;
      }
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)preferredLanguage:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F50758];
  id v4 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  id v5 = [v3 preferredLanguageForBundleID:v4];

  uint64_t v6 = (void *)MEMORY[0x263EFF960];
  id v7 = [MEMORY[0x263EFF960] _deviceLanguage];
  id v8 = [v6 localeWithLocaleIdentifier:v7];
  id v9 = [v8 localizedStringForLanguage:v5 context:3];

  return v9;
}

- (id)defaultAppSpecifierWithAppRecordsMatchingBlock:(id)a3 getter:(SEL)a4 setter:(SEL)a5 title:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    uint64_t v37 = objc_opt_new();
    v36 = objc_opt_new();
    Class v12 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
    unint64_t v13 = (void *)MEMORY[0x263F08A98];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __105__AUSystemSettingsSpecifiersProvider_defaultAppSpecifierWithAppRecordsMatchingBlock_getter_setter_title___block_invoke;
    v42[3] = &unk_265231118;
    id v43 = v10;
    uint64_t v14 = [v13 predicateWithBlock:v42];
    [v12 setPredicate:v14];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v15 = v12;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      SEL v32 = a5;
      SEL v33 = a4;
      id v34 = v11;
      id v35 = v10;
      char v18 = 0;
      uint64_t v19 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v15);
          }
          int v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v22 = [v21 bundleIdentifier];
          int v23 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
          char v24 = [v22 isEqualToString:v23];

          v18 |= v24;
          uint64_t v25 = [v21 bundleIdentifier];
          [v36 addObject:v25];

          uint64_t v26 = [v21 localizedName];
          [v37 addObject:v26];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v17);

      if (v18)
      {
        id v27 = (void *)MEMORY[0x263F5FC40];
        uint64_t v28 = objc_opt_class();
        uint64_t v29 = v27;
        id v11 = v34;
        int v30 = [v29 preferenceSpecifierNamed:v34 target:self set:v32 get:v33 detail:v28 cell:2 edit:0];
        [v30 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601B8]];
        [v30 setValues:v36 titles:v37];
      }
      else
      {
        int v30 = 0;
        id v11 = v34;
      }
      id v10 = v35;
    }
    else
    {

      int v30 = 0;
    }
  }
  else
  {
    int v30 = 0;
  }

  return v30;
}

uint64_t __105__AUSystemSettingsSpecifiersProvider_defaultAppSpecifierWithAppRecordsMatchingBlock_getter_setter_title___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)defaultBrowserSpecifier
{
  if ((self->_policyOptions & 0x20000000) != 0)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"Default Browser App" value:&stru_26FC1C568 table:0];
    id v2 = [(AUSystemSettingsSpecifiersProvider *)self defaultAppSpecifierWithAppRecordsMatchingBlock:&__block_literal_global_540 getter:sel_defaultBrowser_ setter:sel_setDefaultBrowser_specifier_ title:v5];

    [v2 setIdentifier:@"DEFAULT_BROWSER_APP"];
    id v6 = objc_alloc(MEMORY[0x263F01878]);
    id v7 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    id v8 = (void *)[v6 initWithBundleIdentifier:v7 allowPlaceholder:1 error:0];

    id v9 = [v8 URL];
    id v10 = v9;
    if (v9 && [v9 isFileURL])
    {
      id v11 = [MEMORY[0x263F086E0] bundleWithURL:v10];
      Class v12 = [v11 infoDictionary];

      unint64_t v13 = [v12 objectForKeyedSubscript:@"UIUsesSystemDownloadLocation"];
      int v14 = [v13 BOOLValue];

      if (v14) {
        [v2 setDetailControllerClass:objc_opt_class()];
      }
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

uint64_t __61__AUSystemSettingsSpecifiersProvider_defaultBrowserSpecifier__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEligibleWebBrowser];
}

- (id)defaultBrowser:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F01898]);
  id v4 = (void *)[objc_alloc(NSURL) initWithString:@"https://"];
  id v13 = 0;
  id v5 = (void *)[v3 initWithURL:v4 error:&v13];
  id v6 = v13;

  id v7 = _AULoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 bundleRecord];
    id v9 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    id v15 = v9;
    _os_log_impl(&dword_247E6E000, v7, OS_LOG_TYPE_DEFAULT, "Default browser app is %{public}@", buf, 0xCu);
  }
  id v10 = [v5 bundleRecord];
  id v11 = [v10 bundleIdentifier];

  return v11;
}

- (void)setDefaultBrowser:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v16];
  id v9 = v16;
  objc_initWeak(&location, self);
  id v10 = [MEMORY[0x263F01880] defaultWorkspace];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__AUSystemSettingsSpecifiersProvider_setDefaultBrowser_specifier___block_invoke;
  v12[3] = &unk_265231160;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  [v10 setDefaultWebBrowserToApplicationRecord:v8 completionHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __66__AUSystemSettingsSpecifiersProvider_setDefaultBrowser_specifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = _AULoggingFacility();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v9;
      id v10 = "Set default browser app to %{public}@";
      id v11 = v7;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_247E6E000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v8)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138543618;
    uint64_t v15 = v13;
    __int16 v16 = 2114;
    id v17 = v5;
    id v10 = "Error setting default browser app to %{public}@: %{public}@";
    id v11 = v7;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (id)defaultMailAppSpecifier
{
  if ((self->_policyOptions & 0x40000000) != 0)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"Default Mail App" value:&stru_26FC1C568 table:0];
    id v2 = [(AUSystemSettingsSpecifiersProvider *)self defaultAppSpecifierWithAppRecordsMatchingBlock:&__block_literal_global_558 getter:sel_defaultMailApp_ setter:sel_setDefaultMailApp_specifier_ title:v5];

    [v2 setIdentifier:@"DEFAULT_MAIL_APP"];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

uint64_t __61__AUSystemSettingsSpecifiersProvider_defaultMailAppSpecifier__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEligibleMailClient];
}

- (id)defaultMailApp:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F01898]);
  id v4 = (void *)[objc_alloc(NSURL) initWithString:@"mailto://"];
  id v13 = 0;
  id v5 = (void *)[v3 initWithURL:v4 error:&v13];
  id v6 = v13;

  id v7 = _AULoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v5 bundleRecord];
    uint64_t v9 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v9;
    _os_log_impl(&dword_247E6E000, v7, OS_LOG_TYPE_DEFAULT, "Default mail app is %{public}@", buf, 0xCu);
  }
  id v10 = [v5 bundleRecord];
  id v11 = [v10 bundleIdentifier];

  return v11;
}

- (void)setDefaultMailApp:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v16];
  id v9 = v16;
  objc_initWeak(&location, self);
  id v10 = [MEMORY[0x263F01880] defaultWorkspace];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__AUSystemSettingsSpecifiersProvider_setDefaultMailApp_specifier___block_invoke;
  v12[3] = &unk_265231160;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  [v10 setDefaultMailClientToApplicationRecord:v8 completionHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __66__AUSystemSettingsSpecifiersProvider_setDefaultMailApp_specifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = _AULoggingFacility();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v9;
      id v10 = "Set default mail app to %{public}@";
      id v11 = v7;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_247E6E000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v8)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138543618;
    uint64_t v15 = v13;
    __int16 v16 = 2114;
    id v17 = v5;
    id v10 = "Error setting default mail app to %{public}@: %{public}@";
    id v11 = v7;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (id)downloadsSpecifiers
{
  v21[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F01878]);
  id v4 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  id v6 = [v5 URL];
  id v7 = v6;
  if (v6 && [v6 isFileURL])
  {
    BOOL v8 = [MEMORY[0x263F086E0] bundleWithURL:v7];
    uint64_t v9 = [v8 infoDictionary];

    id v10 = [v9 objectForKeyedSubscript:@"UIUsesSystemDownloadLocation"];
    int v11 = [v10 BOOLValue];

    if (v11)
    {
      uint32_t v12 = (void *)MEMORY[0x263F086E0];
      uint64_t v13 = PSBundlePathForPreferenceBundle();
      int v14 = [v12 bundleWithPath:v13];
      [v14 load];

      uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      __int16 v16 = [v15 localizedStringForKey:@"Downloads" value:&stru_26FC1C568 table:0];

      id v17 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v16 target:self set:0 get:sel__downloadsFolderTitle detail:NSClassFromString(&cfstr_Safaridownload.isa) cell:2 edit:0];
      [v17 setIdentifier:@"DOWNLOADS"];
      uint64_t v18 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DOWNLOADS_GROUP"];
      v21[0] = v18;
      v21[1] = v17;
      uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x263EFFA68];
  }

  return v19;
}

- (id)_downloadsFolderTitle
{
  id v2 = [(AUSystemSettingsSpecifiersProvider *)self defaultDownloadsFolderTitle];
  id v3 = v2;
  if (!v2) {
    id v2 = &stru_26FC1C568;
  }
  id v4 = v2;

  return v4;
}

- (void)_updateDownloadsFolderTitle
{
  downloadSettings = self->_downloadSettings;
  if (!downloadSettings)
  {
    id v4 = (DOCDownloadSettings *)objc_alloc_init(MEMORY[0x263F3AB88]);
    id v5 = self->_downloadSettings;
    self->_downloadSettings = v4;

    downloadSettings = self->_downloadSettings;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__AUSystemSettingsSpecifiersProvider__updateDownloadsFolderTitle__block_invoke;
  v6[3] = &unk_2652311B0;
  void v6[4] = self;
  [(DOCDownloadSettings *)downloadSettings fetchDefaultDownloadsLocationItem:v6];
}

void __65__AUSystemSettingsSpecifiersProvider__updateDownloadsFolderTitle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6
    || ([v5 providerDomainID], BOOL v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    id v7 = _AULoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__AUSystemSettingsSpecifiersProvider__updateDownloadsFolderTitle__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    id v15 = 0;
    id v7 = [MEMORY[0x263F054C8] providerDomainForItem:v5 error:&v15];
    id v6 = v15;
    if (v6)
    {
      uint64_t v9 = _AULoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __65__AUSystemSettingsSpecifiersProvider__updateDownloadsFolderTitle__block_invoke_cold_2((uint64_t)v6, v9);
      }
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__AUSystemSettingsSpecifiersProvider__updateDownloadsFolderTitle__block_invoke_591;
      block[3] = &unk_265231188;
      id v10 = v7;
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v13 = v10;
      uint64_t v14 = v11;
      dispatch_async(MEMORY[0x263EF83A0], block);
      uint64_t v9 = v13;
    }
  }
}

void __65__AUSystemSettingsSpecifiersProvider__updateDownloadsFolderTitle__block_invoke_591(uint64_t a1)
{
  DOCLocalizedDisplayName();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 40) defaultDownloadsFolderTitle];
  char v3 = [v2 isEqualToString:v4];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 40) setDefaultDownloadsFolderTitle:v4];
    [*(id *)(a1 + 40) reloadSpecifiers];
  }
}

- (id)tapToPayScreenLockSpecifiers
{
  v35[2] = *MEMORY[0x263EF8340];
  if ((self->_policyOptions & 0x8000000000) != 0
    && (char v3 = (void *)MEMORY[0x263F15710],
        [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v3) = [v3 isProximityReaderSupported:v4],
        v4,
        v3))
  {
    id v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"TAP_TO_PAY_SCREEN_LOCK_GROUP"];
    id v6 = (void *)MEMORY[0x263F5FC40];
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v8 = [v7 localizedStringForKey:@"Tap to Pay on iPhone" value:&stru_26FC1C568 table:0];
    uint64_t v9 = [v6 groupSpecifierWithName:v8];

    id v10 = (void *)MEMORY[0x263F15710];
    uint64_t v11 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    int v12 = [v10 shouldDisablePINPrivacyLockForBundleID:v11];

    if (v12)
    {
      uint64_t v13 = [MEMORY[0x263F53C50] sharedConnection];
      uint64_t v14 = [v13 managingOrganizationInformation];

      id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F53CE8]];
      if ([v15 length] && (objc_msgSend(v15, "isEqualToString:", @"unknown") & 1) == 0)
      {
        int v25 = PSIsPearlAvailable();
        uint64_t v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v27 = v26;
        if (v25) {
          uint64_t v28 = @"The option to use Face ID or passcode to secure Device during transactions that require customers to enter their PIN is managed by %@.";
        }
        else {
          uint64_t v28 = @"The option to use Touch ID or passcode to secure Device during transactions that require customers to enter their PIN is managed by %@.";
        }
        uint64_t v18 = [v26 localizedStringForKey:v28 value:&stru_26FC1C568 table:0];

        uint64_t v24 = objc_msgSend(NSString, "localizedStringWithFormat:", v18, v15);
      }
      else
      {
        int v16 = PSIsPearlAvailable();
        id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v18 = v17;
        if (v16) {
          uint64_t v19 = @"The option to use Face ID or passcode to secure Device during transactions that require customers to enter their PIN is controlled by a mobile device management profile installed on this device.";
        }
        else {
          uint64_t v19 = @"The option to use Touch ID or passcode to secure Device during transactions that require customers to enter their PIN is controlled by a mobile device management profile installed on this device.";
        }
        uint64_t v24 = [v17 localizedStringForKey:v19 value:&stru_26FC1C568 table:0];
      }
      uint64_t v29 = (void *)v24;
      [v9 setObject:v24 forKeyedSubscript:*MEMORY[0x263F600F8]];
    }
    else
    {
      int v21 = PSIsPearlAvailable();
      long long v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v14 = v22;
      if (v21) {
        int v23 = @"Use Face ID or passcode to secure Device during transactions that require customers to enter their PIN.";
      }
      else {
        int v23 = @"Use Touch ID or passcode to secure Device during transactions that require customers to enter their PIN.";
      }
      id v15 = [v22 localizedStringForKey:v23 value:&stru_26FC1C568 table:0];
      [v9 setObject:v15 forKeyedSubscript:*MEMORY[0x263F600F8]];
    }

    int v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v31 = [v30 localizedStringForKey:@"Tap to Pay on iPhone Screen Lock" value:&stru_26FC1C568 table:0];

    SEL v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v31 target:self set:sel_setTapToPayScreenLockEnabled_specifier_ get:sel_isTapToPayScreenLockEnabled_ detail:0 cell:6 edit:0];
    [v32 setIdentifier:@"TAP_TO_PAY_SCREEN_LOCK"];
    SEL v33 = [NSNumber numberWithInt:v12 ^ 1u];
    [v32 setObject:v33 forKeyedSubscript:*MEMORY[0x263F600A8]];

    v35[0] = v9;
    v35[1] = v32;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  }
  else
  {
    id v20 = (void *)MEMORY[0x263EFFA68];
  }
  return v20;
}

- (id)isTapToPayScreenLockEnabled:(id)a3
{
  char v3 = NSNumber;
  id v4 = (void *)MEMORY[0x263F15710];
  id v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  id v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "getPINPrivacyLockForBundleID:", v5));

  return v6;
}

- (void)setTapToPayScreenLockEnabled:(id)a3 specifier:(id)a4
{
  id v5 = (void *)MEMORY[0x263F15710];
  uint64_t v6 = [a3 BOOLValue];
  id v7 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  [v5 setPINPrivacyLock:v6 forBundleID:v7];
}

- (id)tapToPayAlwaysPlaySoundSpecifiers
{
  v13[2] = *MEMORY[0x263EF8340];
  if ((self->_policyOptions & 0x40000000000) != 0
    && (char v3 = (void *)MEMORY[0x263F15710],
        [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v3) = [v3 isProximityReaderSupported:v4],
        v4,
        v3))
  {
    id v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"TAP_TO_PAY_ALWAYS_PLAY_SOUND_GROUP"];
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"Play Tap to Pay on iPhone sounds regardless of your current Ring / Silent Mode switch setting." value:&stru_26FC1C568 table:0];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];

    BOOL v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"Always Play Sounds" value:&stru_26FC1C568 table:0];

    id v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v9 target:self set:sel_setTapToPayAlwaysPlaySoundEnabled_specifier_ get:sel_isTapToPayAlwaysPlaySoundEnabled_ detail:0 cell:6 edit:0];
    [v10 setIdentifier:@"TAP_TO_PAY_ALWAYS_PLAY_SOUND"];
    v13[0] = v5;
    v13[1] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
  }
  return v11;
}

- (id)isTapToPayAlwaysPlaySoundEnabled:(id)a3
{
  char v3 = NSNumber;
  id v4 = (void *)MEMORY[0x263F15710];
  id v5 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  uint64_t v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "getAlwaysPlaySoundForBundleID:", v5));

  return v6;
}

- (void)setTapToPayAlwaysPlaySoundEnabled:(id)a3 specifier:(id)a4
{
  id v5 = (void *)MEMORY[0x263F15710];
  uint64_t v6 = [a3 BOOLValue];
  id v7 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  [v5 setAlwaysPlaySound:v6 forBundleID:v7];
}

- (id)driverKitSpecifiers
{
  id v3 = objc_alloc(MEMORY[0x263F5FB78]);
  id v4 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
  id v5 = (PSDriverPolicyForApp *)[v3 initWithBundleIdentifier:v4];
  driverPolicy = self->_driverPolicy;
  self->_driverPolicy = v5;

  [(PSDriverPolicyForApp *)self->_driverPolicy setDelegate:self];
  id v7 = self->_driverPolicy;
  return (id)[(PSDriverPolicyForApp *)v7 specifiers];
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    BOOL v8 = [v7 sectionID];
    uint64_t v9 = [(AUSystemSettingsSpecifiersProvider *)self applicationBundleIdentifier];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      uint64_t v11 = [(AUSystemSettingsSpecifiersProvider *)self delegate];
      [v11 systemSettingsSpecifiersProviderDidReloadSpecifiers:self];
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__AUSystemSettingsSpecifiersProvider_observer_updateSectionInfo___block_invoke;
    block[3] = &unk_2652311D8;
    void block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __65__AUSystemSettingsSpecifiersProvider_observer_updateSectionInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) observer:*(void *)(a1 + 40) updateSectionInfo:*(void *)(a1 + 48)];
}

- (void)reloadSpecifiers
{
  id v3 = [(AUSystemSettingsSpecifiersProvider *)self delegate];
  [v3 systemSettingsSpecifiersProviderDidReloadSpecifiers:self];
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(AUSystemSettingsSpecifiersProvider *)self delegate];
  [v7 systemSettingsSpecifiersProvider:self presentViewController:v6 animated:v4];
}

- (AUSystemSettingsSpecifiersProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AUSystemSettingsSpecifiersProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (BBObserver)_bbObserver
{
  return self->__bbObserver;
}

- (void)set_bbObserver:(id)a3
{
}

- (BOOL)enServiceMatched
{
  return self->_enServiceMatched;
}

- (void)setEnServiceMatched:(BOOL)a3
{
  self->_enServiceMatched = a3;
}

- (NSString)matchingBundleIdentifier
{
  return self->_matchingBundleIdentifier;
}

- (void)setMatchingBundleIdentifier:(id)a3
{
}

- (PSDriverPolicyForApp)driverPolicy
{
  return self->_driverPolicy;
}

- (void)setDriverPolicy:(id)a3
{
}

- (SESNFCAppSettingsContext)nfcContext
{
  return self->_nfcContext;
}

- (void)setNfcContext:(id)a3
{
}

- (DOCDownloadSettings)downloadSettings
{
  return self->_downloadSettings;
}

- (void)setDownloadSettings:(id)a3
{
}

- (NSString)defaultDownloadsFolderTitle
{
  return self->_defaultDownloadsFolderTitle;
}

- (void)setDefaultDownloadsFolderTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDownloadsFolderTitle, 0);
  objc_storeStrong((id *)&self->_downloadSettings, 0);
  objc_storeStrong((id *)&self->_nfcContext, 0);
  objc_storeStrong((id *)&self->_driverPolicy, 0);
  objc_storeStrong((id *)&self->_matchingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->__bbObserver, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pathControllerConfiguration, 0);
  objc_storeStrong((id *)&self->_contactsPrivacyController, 0);
  objc_storeStrong((id *)&self->_walletPrivacyController, 0);
  objc_storeStrong((id *)&self->_photosPrivacyController, 0);
  objc_storeStrong((id *)&self->_calendarPrivacyController, 0);
  objc_storeStrong((id *)&self->_accessoriesPrivacyController, 0);
}

- (id)defaultAppCategoriesSpecifiers
{
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = self;
  sub_247E7D9E8();

  sub_247E7E134();
  BOOL v4 = (void *)sub_247E823A0();
  swift_release();
  swift_bridgeObjectRelease();
  return v4;
}

void __76__AUSystemSettingsSpecifiersProvider_loadNetworkConfigurationsForceRefresh___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  id v3 = "-[AUSystemSettingsSpecifiersProvider loadNetworkConfigurationsForceRefresh:]_block_invoke";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_247E6E000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to load with error %{public}@", (uint8_t *)&v2, 0x16u);
}

void __62__AUSystemSettingsSpecifiersProvider_saveNetworkConfiguration__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 136446722;
  uint64_t v5 = "-[AUSystemSettingsSpecifiersProvider saveNetworkConfiguration]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_247E6E000, log, OS_LOG_TYPE_ERROR, "%{public}s: Save error %{public}@ for %{public}@", (uint8_t *)&v4, 0x20u);
}

void __65__AUSystemSettingsSpecifiersProvider__updateDownloadsFolderTitle__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247E6E000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch default downloads location item: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __65__AUSystemSettingsSpecifiersProvider__updateDownloadsFolderTitle__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247E6E000, a2, OS_LOG_TYPE_ERROR, "Failed to determine provider domain for downloads folder: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end