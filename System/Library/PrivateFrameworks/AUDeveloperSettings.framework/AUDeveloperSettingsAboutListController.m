@interface AUDeveloperSettingsAboutListController
- (BOOL)currentSpecifierMatchesAccessoryID:(id)a3;
- (BOOL)shouldDisplayAuthListingOption;
- (id)getActiveVersion:(id)a3;
- (id)getAssetLocationForSupplementalAsset:(BOOL)a3;
- (id)getAssetURLOverride:(id)a3;
- (id)getDownloadedVersion:(id)a3;
- (id)getDropboxVersion:(id)a3;
- (id)getFirmwareAssetLocation:(id)a3;
- (id)getFusing:(id)a3;
- (id)getHWRevision:(id)a3;
- (id)getModelNumber:(id)a3;
- (id)getSerialNumber:(id)a3;
- (id)getSupplementalAssetLocation:(id)a3;
- (id)isAuthListingEnabled;
- (id)isOTADisabled:(id)a3;
- (id)specifiers;
- (void)addAccessoryID:(id)a3 assetID:(id)a4;
- (void)backgroundSetupUI;
- (void)backgroundUpdateProgress;
- (void)cleanupProgress;
- (void)confirmUpdateNow;
- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)removeAccessoryID:(id)a3;
- (void)removedSpecifier:(id)a3;
- (void)setAuthListingStatus:(id)a3;
- (void)setOTADisableStatus:(id)a3 specifier:(id)a4;
- (void)settingsChangedForSerialNumber:(id)a3;
- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)updateNow;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AUDeveloperSettingsAboutListController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)AUDeveloperSettingsAboutListController;
  [(AUDeveloperSettingsAboutListController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AUDeveloperSettingsAboutListController;
  [(AUDeveloperSettingsAboutListController *)&v6 viewWillAppear:a3];
  [(AUDeveloperSettingsAboutListController *)self reloadSpecifier:self->_assetLocationSpecifier];
  [(AUDeveloperSettingsAboutListController *)self reloadSpecifier:self->_supplementalAssetLocationSpecifier];
  if (!self->_observer)
  {
    v4 = objc_alloc_init(AUObserverXPC);
    observer = self->_observer;
    self->_observer = v4;

    [(AUObserverXPC *)self->_observer registerClient:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AUDeveloperSettingsAboutListController;
  [(AUDeveloperSettingsAboutListController *)&v3 viewWillDisappear:a3];
}

- (id)specifiers
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"About" target:v2 set:0 get:0 detail:0 cell:0 edit:0];
  accessoryInfoGroupSpecifier = v2->_accessoryInfoGroupSpecifier;
  v2->_accessoryInfoGroupSpecifier = (PSSpecifier *)v4;

  [v3 addObject:v2->_accessoryInfoGroupSpecifier];
  objc_super v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Serial Number" target:v2 set:0 get:sel_getSerialNumber_ detail:0 cell:4 edit:0];
  uint64_t v7 = *MEMORY[0x263F60050];
  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60050]];
  [v3 addObject:v6];
  v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Disable OTA Updates" target:v2 set:sel_setOTADisableStatus_specifier_ get:sel_isOTADisabled_ detail:0 cell:6 edit:0];
  [v3 addObject:v8];
  v9 = [(AUDeveloperSettingsAboutListController *)v2 getModelNumber:0];

  if (v9)
  {
    v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Model Number" target:v2 set:0 get:sel_getModelNumber_ detail:0 cell:4 edit:0];
    [v10 setProperty:MEMORY[0x263EFFA88] forKey:v7];
    [v3 addObject:v10];
  }
  v60 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Fusing" target:v2 set:0 get:sel_getFusing_ detail:0 cell:4 edit:0];
  [v60 setProperty:MEMORY[0x263EFFA88] forKey:v7];
  [v3 addObject:v60];
  v11 = [(AUDeveloperSettingsAboutListController *)v2 getHWRevision:0];

  if (v11)
  {
    v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Hardware Revision" target:v2 set:0 get:sel_getHWRevision_ detail:0 cell:4 edit:0];
    [v12 setProperty:MEMORY[0x263EFFA88] forKey:v7];
    [v3 addObject:v12];
  }
  v13 = [(AUDeveloperSettingsAboutListController *)v2 getActiveVersion:0];

  if (v13)
  {
    v14 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Active Version" target:v2 set:0 get:sel_getActiveVersion_ detail:0 cell:4 edit:0];
    [v14 setProperty:MEMORY[0x263EFFA88] forKey:v7];
    [v3 addObject:v14];
  }
  v15 = [(AUDeveloperSettingsAboutListController *)v2 getDropboxVersion:0];

  if (v15)
  {
    v16 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Dropbox Version" target:v2 set:0 get:sel_getDropboxVersion_ detail:0 cell:4 edit:0];
    v17 = NSStringFromSelector(sel_removedSpecifier_);
    [v16 setProperty:v17 forKey:*MEMORY[0x263F60078]];

    [v16 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v3 addObject:v16];
  }
  else
  {
    v18 = [(AUDeveloperSettingsAboutListController *)v2 getAssetURLOverride:0];

    if (v18)
    {
      v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Asset URL Override" target:v2 set:0 get:sel_getAssetURLOverride_ detail:0 cell:4 edit:0];
      [v19 setProperty:MEMORY[0x263EFFA88] forKey:v7];
      [v3 addObject:v19];
    }
    v20 = (void *)MEMORY[0x263F5FC40];
    objc_opt_class();
    v16 = objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v21 = [(AUDeveloperSettingsAboutListController *)v2 specifier];
    v22 = [v21 properties];
    [v16 setProperties:v22];

    uint64_t v23 = objc_opt_class();
    uint64_t v56 = *MEMORY[0x263F5FFE0];
    objc_msgSend(v16, "setProperty:forKey:", v23);
    v24 = [(AUDeveloperSettingsAboutListController *)v2 specifier];
    v25 = [v24 identifier];
    objc_msgSend(v16, "setProperty:forKey:", v25);

    [v16 setProperty:@"assetLocation" forKey:@"assetLocation"];
    [v16 setProperty:@"basejumperTrain" forKey:@"basejumperTrain"];
    [v16 setProperty:@"basejumperBuild" forKey:@"basejumperBuild"];
    objc_storeStrong((id *)&v2->_assetLocationSpecifier, v16);
    [v3 addObject:v16];
    v26 = [(AUDeveloperSettingsAboutListController *)v2 specifier];
    uint64_t v27 = [(AUDeveloperSettingsAboutListController *)v2 getSupplementalAssetLocation:v26];

    v58 = (void *)v27;
    if (v27)
    {
      v28 = [(AUDeveloperSettingsAboutListController *)v2 specifier];
      uint64_t v29 = [(AUDeveloperSettingsAboutListController *)v2 getModelNumber:v28];

      v55 = (void *)v29;
      v30 = [MEMORY[0x263F38338] findByAppleModelNumber:v29];
      v59 = @"Supplemental Asset Location";
      v57 = v30;
      v31 = [v30 supplementalAssets];
      uint64_t v32 = [v31 count];

      if (v32)
      {
        v53 = v8;
        v54 = v6;
        v33 = [v57 supplementalAssets];
        v34 = [v33 allObjects];

        v35 = [v34 objectAtIndex:0];
        v36 = NSString;
        v37 = [v35 componentsSeparatedByString:@"-"];
        v38 = [v37 lastObject];
        uint64_t v39 = [v36 stringWithFormat:@"%@ %@", v38, @"Asset Location"];

        v59 = (__CFString *)v39;
        v8 = v53;
        objc_super v6 = v54;
      }
      v40 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v59 target:v2 set:0 get:sel_getSupplementalAssetLocation_ detail:objc_opt_class() cell:2 edit:0];
      v41 = [(AUDeveloperSettingsAboutListController *)v2 specifier];
      v42 = [v41 properties];
      [v40 setProperties:v42];

      [v40 setProperty:objc_opt_class() forKey:v56];
      v43 = [(AUDeveloperSettingsAboutListController *)v2 specifier];
      v44 = [v43 identifier];
      [v40 setProperty:v44 forKey:@"serialNumber"];

      [v40 setProperty:@"supplementalAssetLocation" forKey:@"assetLocation"];
      [v40 setProperty:@"supplementalBasejumperTrain" forKey:@"basejumperTrain"];
      [v40 setProperty:@"supplementalBasejumperBuild" forKey:@"basejumperBuild"];
      objc_storeStrong((id *)&v2->_supplementalAssetLocationSpecifier, v40);
      [v3 addObject:v40];
    }
  }

  if ([(AUDeveloperSettingsAboutListController *)v2 shouldDisplayAuthListingOption])
  {
    v45 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Downloaded Version" target:v2 set:0 get:sel_getDownloadedVersion_ detail:0 cell:4 edit:0];
    [v45 setProperty:MEMORY[0x263EFFA88] forKey:v7];
    [v3 addObject:v45];
    uint64_t v46 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Enable Auth Listing" target:v2 set:sel_setAuthListingStatus_ get:sel_isAuthListingEnabled detail:0 cell:6 edit:0];
    authListingEnabledSwitchSpecifier = v2->_authListingEnabledSwitchSpecifier;
    v2->_authListingEnabledSwitchSpecifier = (PSSpecifier *)v46;

    [v3 addObject:v2->_authListingEnabledSwitchSpecifier];
    uint64_t v48 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Update Now" target:v2 set:0 get:0 detail:0 cell:13 edit:0];
    updateNowButtonSpecifier = v2->_updateNowButtonSpecifier;
    v2->_updateNowButtonSpecifier = (PSSpecifier *)v48;

    [(PSSpecifier *)v2->_updateNowButtonSpecifier setProperty:@"Update Now" forKey:*MEMORY[0x263F602D0]];
    [(PSSpecifier *)v2->_updateNowButtonSpecifier setButtonAction:sel_updateNow];
    [v3 addObject:v2->_updateNowButtonSpecifier];
  }
  v50 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];
  [(AUDeveloperSettingsAboutListController *)v2 setSpecifiers:v50];

  id v51 = *(id *)((char *)&v2->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  objc_sync_exit(v2);

  return v51;
}

- (void)setOTADisableStatus:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  objc_super v6 = [(AUDeveloperSettingsAboutListController *)self specifier];
  uint64_t v7 = [v6 identifier];
  v8 = getInfoForAccessory(v7);
  id v14 = (id)[v8 mutableCopy];

  [v14 setObject:v5 forKeyedSubscript:@"isOTADisabled"];
  v9 = +[AUDeveloperSettingsDatabase sharedDatabase];
  v10 = [(AUDeveloperSettingsAboutListController *)self specifier];
  v11 = [v10 identifier];
  [v9 addAccessoryWithSerialNumber:v11 info:v14];

  v12 = [(AUDeveloperSettingsAboutListController *)self specifier];
  v13 = [v12 identifier];
  [(AUDeveloperSettingsAboutListController *)self settingsChangedForSerialNumber:v13];
}

- (id)isOTADisabled:(id)a3
{
  id v3 = [(AUDeveloperSettingsAboutListController *)self specifier];
  uint64_t v4 = [v3 identifier];
  id v5 = getInfoForAccessory(v4);

  objc_super v6 = [v5 objectForKeyedSubscript:@"isOTADisabled"];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)MEMORY[0x263EFFA80];
  }

  return v8;
}

- (BOOL)shouldDisplayAuthListingOption
{
  objc_super v2 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v3 = [v2 identifier];
  uint64_t v4 = getInfoForAccessory(v3);

  id v5 = [v4 objectForKeyedSubscript:@"personalizationRequired"];
  objc_super v6 = [v4 objectForKeyedSubscript:@"authListingEnabled"];
  if ([v5 BOOLValue]) {
    char v7 = 1;
  }
  else {
    char v7 = [v6 BOOLValue];
  }

  return v7;
}

- (void)setAuthListingStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(AUDeveloperSettingsAboutListController *)self specifier];
  objc_super v6 = [v5 identifier];
  char v7 = getInfoForAccessory(v6);
  id v11 = (id)[v7 mutableCopy];

  [v11 setObject:v4 forKeyedSubscript:@"authListingEnabled"];
  id v8 = +[AUDeveloperSettingsDatabase sharedDatabase];
  v9 = [(AUDeveloperSettingsAboutListController *)self specifier];
  v10 = [v9 identifier];
  [v8 addAccessoryWithSerialNumber:v10 info:v11];
}

- (id)isAuthListingEnabled
{
  objc_super v2 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v3 = [v2 identifier];
  id v4 = getInfoForAccessory(v3);

  id v5 = [v4 objectForKeyedSubscript:@"authListingEnabled"];
  objc_super v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)MEMORY[0x263EFFA80];
  }

  return v7;
}

- (void)updateNow
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__AUDeveloperSettingsAboutListController_updateNow__block_invoke;
  block[3] = &unk_264838EC0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__AUDeveloperSettingsAboutListController_updateNow__block_invoke(uint64_t a1)
{
  v7[4] = *MEMORY[0x263EF8340];
  objc_super v2 = objc_opt_new();
  uint64_t v3 = *MEMORY[0x263F60010];
  v6[0] = *MEMORY[0x263F60018];
  v6[1] = v3;
  v7[0] = @"Update Now";
  v7[1] = @"If this accessory is not auth listed, select 'Update Now' to personalize FW via AppleConnect (prompt should show in the next couple seconds). Otherwise, enable auth listing and the updates will run automatically.";
  uint64_t v4 = *MEMORY[0x263F5FFF8];
  v6[2] = *MEMORY[0x263F60008];
  v6[3] = v4;
  v7[2] = @"Ok";
  v7[3] = @"Cancel";
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  [v2 setupWithDictionary:v5];

  [v2 setTarget:*(void *)(a1 + 32)];
  [v2 setConfirmationAction:sel_confirmUpdateNow];
  [*(id *)(a1 + 32) showConfirmationViewForSpecifier:v2];
}

- (void)confirmUpdateNow
{
  uint64_t v3 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v5 = [(AUDeveloperSettingsAboutListController *)self getModelNumber:v3];

  id v4 = [NSString stringWithFormat:@"%s%@", "com.apple.accessoryUpdater.uarp.fwUpdateNow.", v5];
  notify_post((const char *)[v4 UTF8String]);
}

- (id)getDownloadedVersion:(id)a3
{
  uint64_t v3 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v4 = [v3 identifier];
  id v5 = getInfoForAccessory(v4);

  objc_super v6 = [v5 objectForKeyedSubscript:@"downloadedVersion"];
  id v7 = v6;
  if (!v6) {
    objc_super v6 = @"-";
  }
  id v8 = v6;

  return v8;
}

- (id)getSerialNumber:(id)a3
{
  uint64_t v3 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v4 = [v3 identifier];

  return v4;
}

- (id)getModelNumber:(id)a3
{
  uint64_t v3 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v4 = [v3 identifier];
  id v5 = getInfoForAccessory(v4);

  objc_super v6 = [v5 objectForKeyedSubscript:@"modelNumber"];

  return v6;
}

- (id)getFusing:(id)a3
{
  uint64_t v3 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v4 = [v3 identifier];
  id v5 = getInfoForAccessory(v4);

  objc_super v6 = [v5 objectForKeyedSubscript:@"fusing"];

  return v6;
}

- (id)getActiveVersion:(id)a3
{
  uint64_t v3 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v4 = [v3 identifier];
  id v5 = getInfoForAccessory(v4);

  objc_super v6 = [v5 objectForKeyedSubscript:@"activeVersion"];

  return v6;
}

- (id)getDropboxVersion:(id)a3
{
  uint64_t v3 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v4 = [v3 identifier];
  id v5 = getInfoForAccessory(v4);

  objc_super v6 = [v5 objectForKeyedSubscript:@"dropboxVersion"];

  return v6;
}

- (id)getHWRevision:(id)a3
{
  uint64_t v3 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v4 = [v3 identifier];
  id v5 = getInfoForAccessory(v4);

  objc_super v6 = [v5 objectForKeyedSubscript:@"hwRevision"];

  return v6;
}

- (id)getAssetURLOverride:(id)a3
{
  uint64_t v3 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v4 = [v3 identifier];
  id v5 = getInfoForAccessory(v4);

  objc_super v6 = [v5 objectForKeyedSubscript:@"assetURLOverride"];

  return v6;
}

- (id)getFirmwareAssetLocation:(id)a3
{
  return [(AUDeveloperSettingsAboutListController *)self getAssetLocationForSupplementalAsset:0];
}

- (id)getSupplementalAssetLocation:(id)a3
{
  return [(AUDeveloperSettingsAboutListController *)self getAssetLocationForSupplementalAsset:1];
}

- (id)getAssetLocationForSupplementalAsset:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = kSupplementalAssetLocationKey;
  if (!a3) {
    id v5 = kAssetLocationKey;
  }
  objc_super v6 = *v5;
  id v7 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v8 = [v7 identifier];
  v9 = getInfoForAccessory(v8);

  v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    if (AUDeveloperSettingsURLStringToType(v10) == 5)
    {
      id v11 = kSupplementalBasejumperTrainKey;
      BOOL v12 = !v3;
      if (!v3) {
        id v11 = kBasejumperTrainKey;
      }
      v13 = *v11;
      id v14 = kSupplementalBasejumperBuildKey;
      if (v12) {
        id v14 = kBasejumperBuildKey;
      }
      v15 = *v14;
      v16 = [v9 objectForKeyedSubscript:v13];
      v17 = [v9 objectForKeyedSubscript:v15];

      if (v16) {
        BOOL v18 = v17 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (v18)
      {
        v19 = &stru_26DCD2B00;
      }
      else
      {
        v19 = [NSString stringWithFormat:@"%@%@", v16, v17];
      }
    }
    else
    {
      if (AUDeveloperSettingsURLStringToType(v10) != 6) {
        goto LABEL_20;
      }
      v19 = @"Customer Staging";
    }

    v10 = v19;
  }
LABEL_20:

  return v10;
}

- (BOOL)currentSpecifierMatchesAccessoryID:(id)a3
{
  id v4 = a3;
  id v5 = [(AUDeveloperSettingsAboutListController *)self specifier];
  objc_super v6 = [(AUDeveloperSettingsAboutListController *)self getSerialNumber:v5];

  id v7 = [v4 serialNumber];
  int v8 = [v7 isEqualToString:v6];

  if (v8)
  {
    activePartnerSerialNumber = self->_activePartnerSerialNumber;
    self->_activePartnerSerialNumber = 0;
    LOBYTE(v10) = 1;
LABEL_8:

    goto LABEL_9;
  }
  id v11 = [v4 serialNumber];
  int v12 = [v11 isEqualToString:self->_activePartnerSerialNumber];

  if ((v12 & 1) == 0)
  {
    activePartnerSerialNumber = getInfoForAccessory(v6);
    v13 = [activePartnerSerialNumber objectForKeyedSubscript:@"partnerSerialNumbers"];
    id v14 = [v4 serialNumber];
    int v10 = [v13 containsObject:v14];

    if (v10)
    {
      v15 = [v4 serialNumber];
      v16 = self->_activePartnerSerialNumber;
      self->_activePartnerSerialNumber = v15;
    }
    goto LABEL_8;
  }
  LOBYTE(v10) = 1;
LABEL_9:

  return v10;
}

- (void)removedSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v10 = [(AUDeveloperSettingsAboutListController *)self getModelNumber:v5];

  objc_super v6 = [(AUDeveloperSettingsAboutListController *)self specifier];
  id v7 = [(AUDeveloperSettingsAboutListController *)self getFusing:v6];

  [(AUObserverXPC *)self->_observer clearDropboxForModelNumber:v10 withFusing:v7];
  [(AUDeveloperSettingsAboutListController *)self removeSpecifier:v4];

  int v8 = [(AUDeveloperSettingsAboutListController *)self specifier];
  v9 = [v8 identifier];
  [(AUDeveloperSettingsAboutListController *)self settingsChangedForSerialNumber:v9];

  [(AUDeveloperSettingsAboutListController *)self reloadSpecifiers];
}

- (void)settingsChangedForSerialNumber:(id)a3
{
}

- (void)addAccessoryID:(id)a3 assetID:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(AUDeveloperSettingsAboutListController *)self currentSpecifierMatchesAccessoryID:v6])
  {
    [(AUDeveloperSettingsAboutListController *)self cleanupProgress];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "Accessory connected: %@ with asset: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)cleanupProgress
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__AUDeveloperSettingsAboutListController_cleanupProgress__block_invoke;
  block[3] = &unk_264838EC0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__AUDeveloperSettingsAboutListController_cleanupProgress__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1424) clearProgress];
  [*(id *)(*(void *)(a1 + 32) + 1424) refreshContentsWithSpecifier:*(void *)(*(void *)(a1 + 32) + 1416)];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 1424);
  *(void *)(v2 + 1424) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 1456);
  *(void *)(v4 + 1456) = 0;

  id v6 = *(void **)(a1 + 32);
  return [v6 reloadSpecifiers];
}

- (void)removeAccessoryID:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(AUDeveloperSettingsAboutListController *)self currentSpecifierMatchesAccessoryID:v4])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "Accessory disconnected: %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__AUDeveloperSettingsAboutListController_removeAccessoryID___block_invoke;
    block[3] = &unk_264838EC0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __60__AUDeveloperSettingsAboutListController_removeAccessoryID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1416) objectForKeyedSubscript:@"AUSettingsProgressComplete"];
  if (([v5 BOOLValue] & 1) == 0)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 1424) progressIsComplete]) {
      uint64_t v2 = (__CFString *)*(id *)(*(void *)(a1 + 32) + 1448);
    }
    else {
      uint64_t v2 = @"stopped due to disconnect";
    }
    [*(id *)(*(void *)(a1 + 32) + 1416) setProperty:@"YES" forKey:@"AUSettingsProgressComplete"];
    [*(id *)(*(void *)(a1 + 32) + 1416) setProperty:v2 forKey:@"AUSettingsProgressKeyBuild"];
    [*(id *)(*(void *)(a1 + 32) + 1416) setProperty:0 forKey:@"AUSettingsProgressKeyBytesSent"];
    [*(id *)(*(void *)(a1 + 32) + 1416) setProperty:0 forKey:@"AUSettingsProgressKeyBytesTotal"];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 1456);
    *(void *)(v3 + 1456) = 0;

    [*(id *)(*(void *)(a1 + 32) + 1424) refreshContentsWithSpecifier:*(void *)(*(void *)(a1 + 32) + 1416)];
    [*(id *)(a1 + 32) reloadSpecifier:*(void *)(*(void *)(a1 + 32) + 1416)];
  }
}

- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self->_activePartnerSerialNumber;
  if ([(AUDeveloperSettingsAboutListController *)self currentSpecifierMatchesAccessoryID:v10])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[AUDeveloperSettingsAboutListController firmwareUpdateProgressForAccessoryID:assetID:bytesSent:bytesTotal:]((uint64_t)v10, a5, a6);
    }
    if (!self->_progressView)
    {
      v13 = [v11 assetVersion];
      assetVersion = self->_assetVersion;
      self->_assetVersion = v13;

      [(AUDeveloperSettingsAboutListController *)self performSelectorInBackground:sel_backgroundSetupUI withObject:0];
    }
    if ([(NSString *)self->_assetVersion length]) {
      v15 = self->_assetVersion;
    }
    else {
      v15 = @"Unknown";
    }
    v26 = v15;
    [(PSSpecifier *)self->_accessoryInfoGroupSpecifier setProperty:v15 forKey:@"AUSettingsProgressKeyBuild"];
    v16 = [(PSSpecifier *)self->_accessoryInfoGroupSpecifier objectForKeyedSubscript:@"AUSettingsProgressKeyBytesSent"];
    v17 = [NSNumber numberWithUnsignedLong:a5];
    uint64_t v27 = [(PSSpecifier *)self->_accessoryInfoGroupSpecifier objectForKeyedSubscript:@"AUSettingsProgressComplete"];
    if (!v16
      || [v17 compare:v16] == 1
      || ![(NSString *)v12 isEqualToString:self->_activePartnerSerialNumber]
      || [v27 BOOLValue])
    {
      v24 = v12;
      id v18 = v11;
      accessoryInfoGroupSpecifier = self->_accessoryInfoGroupSpecifier;
      activePartnerSerialNumber = self->_activePartnerSerialNumber;
      if (activePartnerSerialNumber)
      {
        [(PSSpecifier *)self->_accessoryInfoGroupSpecifier setProperty:activePartnerSerialNumber forKey:@"kAUSettingsProgressActiveSerialNumber"];
      }
      else
      {
        v21 = [v10 serialNumber];
        [(PSSpecifier *)accessoryInfoGroupSpecifier setProperty:v21 forKey:@"kAUSettingsProgressActiveSerialNumber"];
      }
      [(PSSpecifier *)self->_accessoryInfoGroupSpecifier setProperty:@"NO", @"AUSettingsProgressComplete", v24 forKey];
      [(PSSpecifier *)self->_accessoryInfoGroupSpecifier setProperty:v17 forKey:@"AUSettingsProgressKeyBytesSent"];
      v22 = self->_accessoryInfoGroupSpecifier;
      uint64_t v23 = [NSNumber numberWithUnsignedLong:a6];
      [(PSSpecifier *)v22 setProperty:v23 forKey:@"AUSettingsProgressKeyBytesTotal"];

      id v11 = v18;
      uint64_t v12 = v25;
    }
    [(AUDeveloperSettingsAboutListController *)self performSelectorInBackground:sel_backgroundUpdateProgress withObject:0];
  }
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v16 = a4;
  if ([(AUDeveloperSettingsAboutListController *)self currentSpecifierMatchesAccessoryID:a3])
  {
    uint64_t v8 = [v16 remoteURL];
    id v9 = [(__CFString *)v8 path];
    if (([v9 containsString:@"supplementalassets"] & 1) == 0)
    {
      id v10 = [v16 remoteURL];
      id v11 = [v10 path];
      char v12 = [v11 containsString:@"dynamicassets"];

      if (v12) {
        goto LABEL_13;
      }
      if (!self->_progressView)
      {
        v13 = [v16 assetVersion];
        assetVersion = self->_assetVersion;
        self->_assetVersion = v13;

        [(AUDeveloperSettingsAboutListController *)self performSelectorInBackground:sel_backgroundSetupUI withObject:0];
      }
      if ([(NSString *)self->_assetVersion length]) {
        uint64_t v8 = self->_assetVersion;
      }
      else {
        uint64_t v8 = @"Unknown";
      }
      id v9 = [NSString stringWithFormat:@"%@ %s", v8, UARPFirmwareStagingCompletionStatusToString()];
      if (!a5)
      {
        v15 = [(PSSpecifier *)self->_accessoryInfoGroupSpecifier objectForKeyedSubscript:@"AUSettingsProgressKeyBytesTotal"];
        [(PSSpecifier *)self->_accessoryInfoGroupSpecifier setProperty:v15 forKey:@"AUSettingsProgressKeyBytesSent"];
      }
      [(PSSpecifier *)self->_accessoryInfoGroupSpecifier setProperty:v9 forKey:@"AUSettingsProgressKeyBuild"];
      [(PSSpecifier *)self->_accessoryInfoGroupSpecifier setProperty:@"YES" forKey:@"AUSettingsProgressComplete"];
      [(AUDeveloperSettingsAboutListController *)self performSelectorInBackground:sel_backgroundUpdateProgress withObject:0];
    }
  }
LABEL_13:
  MEMORY[0x270F9A758]();
}

- (void)backgroundSetupUI
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__AUDeveloperSettingsAboutListController_backgroundSetupUI__block_invoke;
  block[3] = &unk_264838EC0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__AUDeveloperSettingsAboutListController_backgroundSetupUI__block_invoke(uint64_t a1)
{
  uint64_t v2 = [[UIProgressFooterView alloc] initWithSpecifier:*(void *)(*(void *)(a1 + 32) + 1416)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1424);
  *(void *)(v3 + 1424) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 1416);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 setProperty:v7 forKey:*MEMORY[0x263F600C0]];

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 1416);
  uint64_t v10 = *(void *)(v8 + 1424);
  uint64_t v11 = *MEMORY[0x263F60108];
  return [v9 setProperty:v10 forKey:v11];
}

- (void)backgroundUpdateProgress
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__AUDeveloperSettingsAboutListController_backgroundUpdateProgress__block_invoke;
  block[3] = &unk_264838EC0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__AUDeveloperSettingsAboutListController_backgroundUpdateProgress__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1424) refreshContentsWithSpecifier:*(void *)(*(void *)(a1 + 32) + 1416)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[177];
  return [v2 reloadSpecifier:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalAssetLocationSpecifier, 0);
  objc_storeStrong((id *)&self->_assetLocationSpecifier, 0);
  objc_storeStrong((id *)&self->_updateNowButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_authListingEnabledSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_activePartnerSerialNumber, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_accessoryInfoGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

- (void)firmwareUpdateProgressForAccessoryID:(uint64_t)a3 assetID:bytesSent:bytesTotal:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  __int16 v7 = 2048;
  uint64_t v8 = a3;
  _os_log_debug_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "FW update progress: %@ bytes/total: %lu/%lu", (uint8_t *)&v3, 0x20u);
}

@end