@interface FamilyHotspotSettingsController
- (BOOL)_shouldShareHotspotWithFamily;
- (BOOL)shouldShareWithFamily;
- (FamilyHotspotSettingsController)init;
- (NSArray)familyMembers;
- (PSSpecifier)switchSpecifier;
- (__WiFiManagerClient)wifiClient;
- (id)_generateFamilyPreferencesArray;
- (id)_generatePrefDictionaryForMember:(id)a3;
- (id)_getFamilyMembers;
- (id)_getFamilyShare;
- (id)_joinOption:(id)a3;
- (id)_specifierForFamilyMember:(id)a3;
- (id)_switchSpecifier;
- (id)specifiers;
- (void)_resetFamilyPreferences;
- (void)_setFamilyPreferences;
- (void)_setFamilyShare:(id)a3;
- (void)_setJoinOption:(id)a3 specifier:(id)a4;
- (void)_updateMemberWithMember:(id)a3;
- (void)dealloc;
- (void)setFamilyMembers:(id)a3;
- (void)setShouldShareWithFamily:(BOOL)a3;
- (void)setSwitchSpecifier:(id)a3;
- (void)setWifiClient:(__WiFiManagerClient *)a3;
- (void)viewDidLoad;
@end

@implementation FamilyHotspotSettingsController

- (FamilyHotspotSettingsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)FamilyHotspotSettingsController;
  v2 = [(FamilyHotspotSettingsController *)&v5 init];
  if (v2)
  {
    [(FamilyHotspotSettingsController *)v2 setWifiClient:WiFiManagerClientCreate()];
    v3 = [(FamilyHotspotSettingsController *)v2 _getFamilyMembers];
    [(FamilyHotspotSettingsController *)v2 setFamilyMembers:v3];

    [(FamilyHotspotSettingsController *)v2 setShouldShareWithFamily:[(FamilyHotspotSettingsController *)v2 _shouldShareHotspotWithFamily]];
  }
  return v2;
}

- (void)dealloc
{
  wifiClient = self->_wifiClient;
  if (wifiClient) {
    CFRelease(wifiClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)FamilyHotspotSettingsController;
  [(FamilyHotspotSettingsController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)FamilyHotspotSettingsController;
  [(FamilyHotspotSettingsController *)&v3 viewDidLoad];
  v2 = WMSUIEventDictionary(@"view-ph-password", 0);
  WMSubmitUIEventMetric(v2);
}

- (id)specifiers
{
  v20[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    switchSpecifier = self->_switchSpecifier;
    if (!switchSpecifier)
    {
      v8 = [(FamilyHotspotSettingsController *)self _switchSpecifier];
      v9 = self->_switchSpecifier;
      self->_switchSpecifier = v8;

      switchSpecifier = self->_switchSpecifier;
    }
    v10 = switchSpecifier;
    v20[0] = v6;
    v20[1] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    [v5 addObjectsFromArray:v11];

    if (self->_shouldShareWithFamily && [(NSArray *)self->_familyMembers count])
    {
      v12 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v5 addObject:v12];
      familyMembers = self->_familyMembers;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __45__FamilyHotspotSettingsController_specifiers__block_invoke;
      v17[3] = &unk_26506AA58;
      id v18 = v5;
      v19 = self;
      [(NSArray *)familyMembers enumerateObjectsUsingBlock:v17];
    }
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;
    id v15 = v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

void __45__FamilyHotspotSettingsController_specifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _specifierForFamilyMember:a2];
  [v2 addObject:v3];
}

- (id)_specifierForFamilyMember:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  objc_super v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"FAMILY_HOTSPOT_ASK" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  v17[0] = v8;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"FAMILY_HOTSPOT_AUTOMATIC" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  v17[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v12 = (void *)[v6 initWithArray:v11];

  v13 = (void *)MEMORY[0x263F5FC40];
  v14 = [v5 displayName];
  id v15 = objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel__setJoinOption_specifier_, sel__joinOption_, objc_opt_class(), 2, 0, v17[0]);

  [v15 setValues:&unk_26F312E18 titles:v12];
  [v15 setProperty:v5 forKey:@"FamilyMemberDetailKey"];

  return v15;
}

- (id)_joinOption:(id)a3
{
  id v3 = [a3 propertyForKey:@"FamilyMemberDetailKey"];
  objc_super v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "shareOption"));

  return v4;
}

- (void)_setJoinOption:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v6 propertyForKey:@"FamilyMemberDetailKey"];
  uint64_t v8 = [v7 intValue];

  [v9 setShareOption:v8];
  [v6 setProperty:v9 forKey:@"FamilyMemberDetailKey"];

  [(FamilyHotspotSettingsController *)self _updateMemberWithMember:v9];
  [(FamilyHotspotSettingsController *)self _setFamilyPreferences];
}

- (id)_switchSpecifier
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"SHARING" value:&stru_26F3105F0 table:@"WirelessModemSettings"];
  id v6 = [v3 preferenceSpecifierNamed:v5 target:self set:sel__setFamilyShare_ get:sel__getFamilyShare detail:0 cell:6 edit:0];

  return v6;
}

- (void)_setFamilyShare:(id)a3
{
  int v4 = [a3 BOOLValue];
  self->_shouldShareWithFamily = v4;
  id v5 = [(FamilyHotspotSettingsController *)self familyMembers];
  id v6 = v5;
  if (v4) {
    id v7 = &__block_literal_global_76;
  }
  else {
    id v7 = &__block_literal_global_1;
  }
  [v5 enumerateObjectsUsingBlock:v7];

  [(FamilyHotspotSettingsController *)self _setFamilyPreferences];
  [(FamilyHotspotSettingsController *)self reloadSpecifiers];
  if (self->_shouldShareWithFamily) {
    uint64_t v8 = @"true";
  }
  else {
    uint64_t v8 = @"false";
  }
  WMSUIEventDictionary(@"toggle-ph-family", v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  WMSubmitUIEventMetric(v9);
}

uint64_t __51__FamilyHotspotSettingsController__setFamilyShare___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShareOption:0];
}

void __51__FamilyHotspotSettingsController__setFamilyShare___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 shareOption]) {
    [v2 setShareOption:1];
  }
}

- (id)_getFamilyShare
{
  return (id)[NSNumber numberWithBool:self->_shouldShareWithFamily];
}

- (BOOL)_shouldShareHotspotWithFamily
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = [(FamilyHotspotSettingsController *)self familyMembers];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__FamilyHotspotSettingsController__shouldShareHotspotWithFamily__block_invoke;
  v4[3] = &unk_26506AAA0;
  v4[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __64__FamilyHotspotSettingsController__shouldShareHotspotWithFamily__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 shareOption];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)_updateMemberWithMember:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FamilyHotspotSettingsController *)self familyMembers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__FamilyHotspotSettingsController__updateMemberWithMember___block_invoke;
  v7[3] = &unk_26506AAC8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __59__FamilyHotspotSettingsController__updateMemberWithMember___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 altDSID];
  id v4 = [*(id *)(a1 + 32) altDSID];

  if (v3 == v4) {
    objc_msgSend(v5, "setShareOption:", objc_msgSend(*(id *)(a1 + 32), "shareOption"));
  }
}

- (id)_getFamilyMembers
{
  id v2 = (void *)WiFiManagerClientCopyFamilyHotspotPreferences();
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__FamilyHotspotSettingsController__getFamilyMembers__block_invoke;
  v6[3] = &unk_26506AAF0;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

void __52__FamilyHotspotSettingsController__getFamilyMembers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 objectForKeyedSubscript:@"FamilyHotspotIdentifier"];
  id v4 = [v3 objectForKeyedSubscript:@"FamilyHotspotDisplayName"];
  id v5 = [v3 objectForKeyedSubscript:@"FamilyHotspotSharingMode"];

  id v6 = -[HotspotFamilyMember initWithAltDSID:displayName:shareOption:]([HotspotFamilyMember alloc], "initWithAltDSID:displayName:shareOption:", v7, v4, [v5 intValue]);
  [*(id *)(a1 + 32) addObject:v6];
}

- (void)_setFamilyPreferences
{
  id v2 = [(FamilyHotspotSettingsController *)self _generateFamilyPreferencesArray];
  WiFiManagerClientSetFamilyHotspotPreferences();
}

- (void)_resetFamilyPreferences
{
}

- (id)_generateFamilyPreferencesArray
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(FamilyHotspotSettingsController *)self familyMembers];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__FamilyHotspotSettingsController__generateFamilyPreferencesArray__block_invoke;
  v8[3] = &unk_26506AA58;
  id v5 = v3;
  id v9 = v5;
  v10 = self;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = v5;
  return v6;
}

void __66__FamilyHotspotSettingsController__generateFamilyPreferencesArray__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _generatePrefDictionaryForMember:a2];
  [v2 addObject:v3];
}

- (id)_generatePrefDictionaryForMember:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 altDSID];
  id v7 = [v4 displayName];
  id v8 = NSNumber;
  uint64_t v9 = [v4 shareOption];

  v10 = [v8 numberWithUnsignedInt:v9];
  [v5 setValue:v6 forKey:@"FamilyHotspotIdentifier"];
  [v5 setValue:v7 forKey:@"FamilyHotspotDisplayName"];
  [v5 setValue:v10 forKey:@"FamilyHotspotSharingMode"];

  return v5;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
}

- (BOOL)shouldShareWithFamily
{
  return self->_shouldShareWithFamily;
}

- (void)setShouldShareWithFamily:(BOOL)a3
{
  self->_shouldShareWithFamily = a3;
}

- (PSSpecifier)switchSpecifier
{
  return self->_switchSpecifier;
}

- (void)setSwitchSpecifier:(id)a3
{
}

- (__WiFiManagerClient)wifiClient
{
  return self->_wifiClient;
}

- (void)setWifiClient:(__WiFiManagerClient *)a3
{
  self->_wifiClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchSpecifier, 0);

  objc_storeStrong((id *)&self->_familyMembers, 0);
}

@end