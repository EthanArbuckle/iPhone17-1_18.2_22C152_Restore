@interface EdgeSettingsController
+ (id)makeUIApnBasedOn:(id)a3;
- (BOOL)_isAPNDictionaryBlank:(id)a3;
- (BOOL)_shouldShowUIForServiceType:(int)a3;
- (BOOL)isAttachAPNEditingAllowed;
- (BOOL)isTypeOfService:(id)a3 ofServiceType:(int)a4;
- (BOOL)shouldResetAttachAPN;
- (CTXPCServiceSubscriptionContext)context;
- (CoreTelephonyClient)coreTelephonyClient;
- (EdgeSettingsController)init;
- (NSArray)currectSet;
- (id)_APNDictionaryForServiceFromSC:(int)a3;
- (id)_blankAPNDictionaryWithTypeMask:(int)a3;
- (id)_getAPNDictinaryForService:(int)a3;
- (id)_getMMSObjectForKey:(id)a3;
- (id)attachAPNSettings;
- (id)edgeDNS:(id)a3;
- (id)getAPNDataForSpecifier:(id)a3;
- (id)getAttachAPNDataForSpecifier:(id)a3;
- (id)getDefaultSettings:(id)a3;
- (id)getMMSNumericValueForSpecifier:(id)a3;
- (id)getMMSValueForSpecifier:(id)a3;
- (id)specifiers;
- (unint64_t)getGSMASettingsUIControl;
- (void)_setMMSOverrideValue:(id)a3 forKey:(id)a4;
- (void)_updateKey:(id)a3 toValue:(id)a4 forServiceType:(int)a5;
- (void)applicationDidResume;
- (void)applicationWillSuspend;
- (void)attachAPNSettings;
- (void)commitAPNsSettings;
- (void)commitAttachAPNSettings;
- (void)dealloc;
- (void)didChangeDeviceManagementSettings:(id)a3;
- (void)getGSMASettingsUIControl;
- (void)initAPNCacheDictionaries;
- (void)initDictionaryForUIApn:(id *)a3 forServiceType:(int)a4;
- (void)loadCurrentAPNs;
- (void)resetAPNsDictionaries;
- (void)resetAllConfiguredSettings;
- (void)resetAttachAPNSettings;
- (void)resetCarrierSettings:(id)a3;
- (void)setAPNData:(id)a3 forSpecifier:(id)a4;
- (void)setAttachAPNData:(id)a3 forSpecifier:(id)a4;
- (void)setContext:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setCurrectSet:(id)a3;
- (void)setDefaultSettings:(id)a3 specifier:(id)a4;
- (void)setMMSNumericValue:(id)a3 forSpecifier:(id)a4;
- (void)setMMSValue:(id)a3 forSpecifier:(id)a4;
- (void)showCarrierSettingsEraseAlert:(BOOL)a3;
- (void)specifiers;
- (void)uploadSettingsOnCT:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation EdgeSettingsController

- (id)getAPNDataForSpecifier:(id)a3
{
  unsigned int v5 = objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", @"ServiceTypeUI"), "intValue") - 1;
  if (v5 > 4) {
    return &stru_26DD4D9A0;
  }
  uint64_t v6 = dword_228F6E0E0[v5];
  uint64_t v7 = [a3 propertyForKey:@"apnItemKey"];
  if (!v7) {
    return &stru_26DD4D9A0;
  }
  uint64_t v8 = v7;
  id v9 = [(EdgeSettingsController *)self _getAPNDictinaryForService:v6];

  return (id)[v9 objectForKey:v8];
}

- (void)setAPNData:(id)a3 forSpecifier:(id)a4
{
  unsigned int v7 = objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", @"ServiceTypeUI"), "intValue") - 1;
  if (v7 >= 5)
  {
    [a4 propertyForKey:@"apnItemKey"];
  }
  else
  {
    uint64_t v8 = dword_228F6E0E0[v7];
    uint64_t v9 = [a4 propertyForKey:@"apnItemKey"];
    if (v9)
    {
      [(EdgeSettingsController *)self _updateKey:v9 toValue:a3 forServiceType:v8];
    }
  }
}

- (void)resetAllConfiguredSettings
{
  v3 = [(EdgeSettingsController *)self coreTelephonyClient];
  v4 = [(EdgeSettingsController *)self context];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke;
  v5[3] = &unk_264857DF0;
  v5[4] = self;
  [(CoreTelephonyClient *)v3 resetUIConfiguredApns:v4 completion:v5];
}

void __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) resetAPNsDictionaries];
    [*(id *)(a1 + 32) loadCurrentAPNs];
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "context"), "slotID") == 1) {
      CFStringRef v3 = @"MMS";
    }
    else {
      CFStringRef v3 = @"MMS2";
    }
    v4 = (const void *)[NSDictionary dictionary];
    CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE70];
    CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE50];
    CFPreferencesSetValue(v3, v4, @"com.apple.mms_override", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    CFPreferencesSynchronize(@"com.apple.mms_override", v5, v6);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.MMSEnabled.changed", 0, 0, 0);
    int v8 = [*(id *)(a1 + 32) shouldResetAttachAPN];
    uint64_t v9 = *(void **)(a1 + 32);
    if (v8)
    {
      v10 = (void *)[v9 coreTelephonyClient];
      uint64_t v11 = [*(id *)(a1 + 32) context];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_43;
      v12[3] = &unk_264857DF0;
      v12[4] = *(void *)(a1 + 32);
      [v10 context:v11 modifyAttachApnSettings:0 completion:v12];
    }
    else
    {
      [v9 reloadSpecifiers];
    }
  }
}

uint64_t __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_43(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_43_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) resetAttachAPNSettings];
  }
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)resetCarrierSettings:(id)a3
{
  if ([(CoreTelephonyClient *)[(EdgeSettingsController *)self coreTelephonyClient] loadGSMASettings:[(EdgeSettingsController *)self context] state:0]&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[EdgeSettingsController resetCarrierSettings:]();
  }
  [(EdgeSettingsController *)self resetAllConfiguredSettings];
}

- (id)_getMMSObjectForKey:(id)a3
{
  if ([(CTXPCServiceSubscriptionContext *)[(EdgeSettingsController *)self context] slotID] == 1) {
    CFStringRef v5 = @"MMS";
  }
  else {
    CFStringRef v5 = @"MMS2";
  }
  CFStringRef v6 = (id)CFPreferencesCopyValue(v5, @"com.apple.mms_override", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  if (!v6 || (id result = (id)[v6 objectForKey:a3]) == 0)
  {
    id result = (id)[(CoreTelephonyClient *)[(EdgeSettingsController *)self coreTelephonyClient] context:[(EdgeSettingsController *)self context] getCarrierBundleValue:&unk_26DD4EB78 error:0];
    if (result)
    {
      return (id)[result objectForKey:a3];
    }
  }
  return result;
}

- (void)_setMMSOverrideValue:(id)a3 forKey:(id)a4
{
  if (!a3 || (id v6 = a3, [a3 isEqual:&stru_26DD4D9A0])) {
    id v6 = 0;
  }
  unsigned int v7 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(CTXPCServiceSubscriptionContext *)[(EdgeSettingsController *)self context] slotID] == 1) {
    CFStringRef v8 = @"MMS";
  }
  else {
    CFStringRef v8 = @"MMS2";
  }
  CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v10 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPropertyListRef v11 = (id)CFPreferencesCopyValue(v8, @"com.apple.mms_override", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  if (v11) {
    [v7 addEntriesFromDictionary:v11];
  }
  if (v6) {
    [v7 setObject:v6 forKey:a4];
  }
  else {
    [v7 removeObjectForKey:a4];
  }
  if ([(CTXPCServiceSubscriptionContext *)[(EdgeSettingsController *)self context] slotID] == 1) {
    CFStringRef v12 = @"MMS";
  }
  else {
    CFStringRef v12 = @"MMS2";
  }
  CFPreferencesSetValue(v12, v7, @"com.apple.mms_override", v9, v10);
  CFPreferencesSynchronize(@"com.apple.mms_override", v9, v10);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.MMSEnabled.changed", 0, 0, 0);
}

- (id)getMMSValueForSpecifier:(id)a3
{
  id result = (id)[a3 propertyForKey:@"key"];
  if (result)
  {
    return [(EdgeSettingsController *)self _getMMSObjectForKey:result];
  }
  return result;
}

- (void)setMMSValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v7 = [a4 propertyForKey:@"key"];
  if (v7)
  {
    [(EdgeSettingsController *)self _setMMSOverrideValue:a3 forKey:v7];
    if (!a3 || ![a3 length])
    {
      [(EdgeSettingsController *)self reloadSpecifier:a4];
    }
  }
}

- (id)getMMSNumericValueForSpecifier:(id)a3
{
  uint64_t v4 = [a3 propertyForKey:@"key"];
  if (!v4) {
    return 0;
  }
  id v5 = [(EdgeSettingsController *)self _getMMSObjectForKey:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return v5;
  }

  return (id)[v5 stringValue];
}

- (void)setMMSNumericValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v7 = [a4 propertyForKey:@"key"];
  if (!v7) {
    return;
  }
  uint64_t v8 = v7;
  if (!a3)
  {
    [(EdgeSettingsController *)self _setMMSOverrideValue:0 forKey:v7];
LABEL_9:
    [(EdgeSettingsController *)self reloadSpecifier:a4];
    return;
  }
  if ([a3 length]) {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "intValue"));
  }
  else {
    uint64_t v9 = 0;
  }
  [(EdgeSettingsController *)self _setMMSOverrideValue:v9 forKey:v8];
  if (![a3 length]) {
    goto LABEL_9;
  }
}

- (id)edgeDNS:(id)a3
{
  uint64_t v4 = [(PSSystemConfiguration *)self->_systemConfig dataServiceID];
  id v5 = (void *)[(PSSystemConfiguration *)self->_systemConfig protocolConfigurationValueForKey:*MEMORY[0x263F1BCF0] protocolType:*MEMORY[0x263F1BCB0] serviceID:v4];
  uint64_t v6 = [v5 count];
  if (!v6) {
    return &stru_26DD4D9A0;
  }
  if (v6 == 1)
  {
    return (id)[v5 objectAtIndex:0];
  }
  else
  {
    return (id)[v5 componentsJoinedByString:@", "];
  }
}

- (id)getAttachAPNDataForSpecifier:(id)a3
{
  uint64_t v4 = [a3 propertyForKey:@"apnItemKey"];
  id v5 = &stru_26DD4D9A0;
  if (v4)
  {
    uint64_t v6 = (void *)[(NSMutableDictionary *)self->_newAttachAPNDict objectForKey:v4];
    if (v6) {
      return v6;
    }
  }
  return v5;
}

- (void)setAttachAPNData:(id)a3 forSpecifier:(id)a4
{
  uint64_t v7 = [a4 propertyForKey:@"apnItemKey"];
  if (a3)
  {
    uint64_t v8 = v7;
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (![a3 isEqualToString:&stru_26DD4D9A0]
         || [(NSMutableDictionary *)self->_newAttachAPNDict objectForKey:v8]))
      {
        [(NSMutableDictionary *)self->_newAttachAPNDict setObject:a3 forKey:v8];
      }
    }
  }

  [(EdgeSettingsController *)self reloadSpecifier:a4];
}

- (BOOL)_shouldShowUIForServiceType:(int)a3
{
  id v5 = (void *)[(CoreTelephonyClient *)[(EdgeSettingsController *)self coreTelephonyClient] context:[(EdgeSettingsController *)self context] getCarrierBundleValue:&unk_26DD4EB90 error:0];
  if (v5
    || (id v5 = (void *)[(CoreTelephonyClient *)[(EdgeSettingsController *)self coreTelephonyClient] context:[(EdgeSettingsController *)self context] getCarrierBundleValue:&unk_26DD4EBA8 error:0]) != 0)
  {
    uint64_t v6 = [v5 intValue];
  }
  else
  {
    LODWORD(v6) = 5;
  }
  if (a3 == 1 && (v6 & 1) != 0) {
    goto LABEL_6;
  }
  if (a3 == 2 && (v6 & 2) != 0)
  {
    int v7 = MGGetBoolAnswer();
    if (v7) {
      LOBYTE(v7) = [(EdgeSettingsController *)self _APNDictionaryForServiceFromSC:2] != 0;
    }
  }
  else if (a3 == 4 && (v6 & 4) != 0)
  {
    LOBYTE(v7) = MGGetBoolAnswer();
  }
  else
  {
    if (a3 == 0x20000 && (v6 & 0x20000) != 0)
    {
LABEL_6:
      LOBYTE(v7) = 1;
      return v7;
    }
    if (a3 == 48)
    {
      uint64_t v9 = 0;
      LOBYTE(v7) = [(CoreTelephonyClient *)[(EdgeSettingsController *)self coreTelephonyClient] isTetheringEditingSupported:[(EdgeSettingsController *)self context] error:&v9];
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (id)specifiers
{
  if (!self->_group1Specifiers)
  {
    CFStringRef v3 = (void *)[(EdgeSettingsController *)self specifier];
    -[EdgeSettingsController setContext:](self, "setContext:", [v3 propertyForKey:*MEMORY[0x263F60290]]);
    uint64_t v4 = (void *)[(EdgeSettingsController *)self specifier];
    -[EdgeSettingsController setCoreTelephonyClient:](self, "setCoreTelephonyClient:", [v4 propertyForKey:kEdgeSettingsClientConnection]);
    [(CoreTelephonyClient *)self->_coreTelephonyClient setDelegate:self];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[EdgeSettingsController specifiers](self);
    }
    [(EdgeSettingsController *)self resetAttachAPNSettings];
    [(EdgeSettingsController *)self loadCurrentAPNs];
    id v5 = (void *)[(EdgeSettingsController *)self loadSpecifiersFromPlistName:@"EDGE Settings" target:self];
    if (MGGetBoolAnswer()) {
      -[EdgeSettingsController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"APN_SETTINGS", &stru_26DD4D9A0, @"Edge"));
    }
    uint64_t v6 = [v5 count];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *MEMORY[0x263F602A0];
      CFStringRef v10 = (int *)MEMORY[0x263F5FE10];
      do
      {
        CFPropertyListRef v11 = (char *)[v5 objectAtIndex:v8];
        uint64_t v12 = *v10;
        if (*(void *)&v11[v12] == 4)
        {
          *(void *)&v11[v12] = 8;
          [v11 setProperty:@"PSEditTextCell" forKey:v9];
        }
        ++v8;
      }
      while (v7 != v8);
    }
    self->_group1Specifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"group_1_header"), objc_msgSend(v5, "specifierForID:", @"group_1_edgeproxytype"), 0);
    self->_pacSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"pac_header"), objc_msgSend(v5, "specifierForID:", @"pac_file"), 0);
    self->_manualSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"pac_header"), objc_msgSend(v5, "specifierForID:", @"pac_proxyserver"), objc_msgSend(v5, "specifierForID:", @"pac_port"), objc_msgSend(v5, "specifierForID:", @"pac_authentication"), 0);
    self->_proxyAuthSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"pac_username"), objc_msgSend(v5, "specifierForID:", @"pac_password"), 0);
    self->_InternetContextSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"internet_header"), objc_msgSend(v5, "specifierForID:", @"internet_apn"), objc_msgSend(v5, "specifierForID:", @"internet_username"), objc_msgSend(v5, "specifierForID:", @"internet_password"), 0);
    self->_VVMContextSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"vvm_header"), objc_msgSend(v5, "specifierForID:", @"vvm_apn"), objc_msgSend(v5, "specifierForID:", @"vvm_username"), objc_msgSend(v5, "specifierForID:", @"vvm_password"), 0);
    if (MGGetBoolAnswer()) {
      self->_MMSContextSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"mms_header"), objc_msgSend(v5, "specifierForID:", @"mms_apn"), objc_msgSend(v5, "specifierForID:", @"mms_username"), objc_msgSend(v5, "specifierForID:", @"mms_password"), objc_msgSend(v5, "specifierForID:", @"mms_mmsc"), objc_msgSend(v5, "specifierForID:", @"mms_proxy"), objc_msgSend(v5, "specifierForID:", @"mms_maxmessagesize"), objc_msgSend(v5, "specifierForID:", @"mms_uaprofurl"), 0);
    }
    self->_tetheringContextSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"tethering_header"), objc_msgSend(v5, "specifierForID:", @"tethering_apn"), objc_msgSend(v5, "specifierForID:", @"tethering_username"), objc_msgSend(v5, "specifierForID:", @"tethering_password"), 0);
    self->_lteAttachAPNSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"lte_attach_apn_header"), objc_msgSend(v5, "specifierForID:", @"lte_attach_apn"), objc_msgSend(v5, "specifierForID:", @"lte_attach_username"), objc_msgSend(v5, "specifierForID:", @"lte_attach_password"), 0);
    self->_IMSContextSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"ims_header"), objc_msgSend(v5, "specifierForID:", @"ims_apn"), objc_msgSend(v5, "specifierForID:", @"ims_username"), objc_msgSend(v5, "specifierForID:", @"ims_password"), 0);
    self->_resetSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", @"reset_settings_header"), objc_msgSend(v5, "specifierForID:", @"reset_settings"), 0);
  }
  uint64_t v13 = (int)*MEMORY[0x263F5FDB8];

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v15 = [(EdgeSettingsController *)self getGSMASettingsUIControl];
  if (v15) {
    [v14 addObjectsFromArray:AutoGsmaSettingsSpecifiers((uint64_t)self)];
  }
  BOOL v16 = [(EdgeSettingsController *)self _shouldShowUIForServiceType:1];
  if (v16) {
    [v14 addObjectsFromArray:self->_InternetContextSpecifiers];
  }
  if ([(EdgeSettingsController *)self isAttachAPNEditingAllowed]) {
    [v14 addObjectsFromArray:self->_lteAttachAPNSpecifiers];
  }
  if ([(EdgeSettingsController *)self _shouldShowUIForServiceType:2])
  {
    [v14 addObjectsFromArray:self->_VVMContextSpecifiers];
    BOOL v16 = 1;
  }
  if ([(EdgeSettingsController *)self _shouldShowUIForServiceType:4])
  {
    [v14 addObjectsFromArray:self->_MMSContextSpecifiers];
    BOOL v16 = 1;
  }
  if ([(EdgeSettingsController *)self _shouldShowUIForServiceType:0x20000])
  {
    [v14 addObjectsFromArray:self->_IMSContextSpecifiers];
    BOOL v16 = 1;
  }
  if ([(EdgeSettingsController *)self _shouldShowUIForServiceType:48])
  {
    [v14 addObjectsFromArray:self->_tetheringContextSpecifiers];
    BOOL v16 = 1;
  }
  if (v15 != 1 && v16) {
    [v14 addObjectsFromArray:self->_resetSpecifiers];
  }
  [(EdgeSettingsController *)self loadCurrentAPNs];
  *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = (Class)v14;
  return v14;
}

- (EdgeSettingsController)init
{
  v4.receiver = self;
  v4.super_class = (Class)EdgeSettingsController;
  v2 = [(EdgeSettingsController *)&v4 init];
  if (v2)
  {
    v2->_systemConfig = (PSSystemConfiguration *)(id)[MEMORY[0x263F5FC80] sharedInstance];
    v2->_cacheInitialized = 0;
    v2->_internetSettingsDictionary = 0;
    v2->_vvmSettingsDictionary = 0;
    v2->_mmsSettingsDictionary = 0;
    v2->_imsSettingsDictionary = 0;
    v2->_tetheringSettingsDictionary = 0;
  }
  return v2;
}

- (unint64_t)getGSMASettingsUIControl
{
  uint64_t v4 = 0;
  unint64_t v2 = [(CoreTelephonyClient *)[(EdgeSettingsController *)self coreTelephonyClient] getGSMAUIControlSetting:[(EdgeSettingsController *)self context] error:&v4];
  if (v2 >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[EdgeSettingsController getGSMASettingsUIControl]();
  }
  return v2;
}

- (BOOL)isTypeOfService:(id)a3 ofServiceType:(int)a4
{
  CFNumberRef v5 = (const __CFNumber *)[a3 valueForKey:@"type-mask"];
  BOOL result = 0;
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
      if ((valuePtr & a4) != 0) {
        return 1;
      }
    }
  }
  return result;
}

- (void)initAPNCacheDictionaries
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_228F68000, &_os_log_internal, v0, "getUIConfiguredApns failed: %@", v1, v2, v3, v4, v5);
}

+ (id)makeUIApnBasedOn:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (a3)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", @"apn"), @"apn");
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", @"username"), @"username");
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", @"password"), @"password");
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", @"type-mask"), @"type-mask");
  }
  return v4;
}

- (void)initDictionaryForUIApn:(id *)a3 forServiceType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  CFTypeID v7 = objc_msgSend((id)objc_opt_class(), "makeUIApnBasedOn:", -[EdgeSettingsController _APNDictionaryForServiceFromSC:](self, "_APNDictionaryForServiceFromSC:", *(void *)&a4));
  *a3 = v7;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [NSNumber numberWithInt:v4];
    [v8 setObject:v9 forKey:@"type-mask"];
  }
  else
  {
    *a3 = [(EdgeSettingsController *)self _blankAPNDictionaryWithTypeMask:v4];
  }
}

- (void)_updateKey:(id)a3 toValue:(id)a4 forServiceType:(int)a5
{
  if (!self->_cacheInitialized) {
    [(EdgeSettingsController *)self initAPNCacheDictionaries];
  }
  if (a5 <= 3)
  {
    if (a5 == 1)
    {
      p_internetSettingsDictionary = &self->_internetSettingsDictionary;
      internetSettingsDictionary = self->_internetSettingsDictionary;
      if (!internetSettingsDictionary)
      {
        CFPropertyListRef v11 = self;
        p_vvmSettingsDictionary = &self->_internetSettingsDictionary;
        uint64_t v13 = 1;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (a5 != 2) {
      return;
    }
    p_internetSettingsDictionary = &self->_vvmSettingsDictionary;
    internetSettingsDictionary = self->_vvmSettingsDictionary;
    if (internetSettingsDictionary) {
      goto LABEL_20;
    }
    CFPropertyListRef v11 = self;
    p_vvmSettingsDictionary = &self->_vvmSettingsDictionary;
    uint64_t v13 = 2;
LABEL_19:
    [(EdgeSettingsController *)v11 initDictionaryForUIApn:p_vvmSettingsDictionary forServiceType:v13];
    internetSettingsDictionary = *p_internetSettingsDictionary;
    goto LABEL_20;
  }
  if (a5 == 4)
  {
    p_internetSettingsDictionary = &self->_mmsSettingsDictionary;
    internetSettingsDictionary = self->_mmsSettingsDictionary;
    if (internetSettingsDictionary) {
      goto LABEL_20;
    }
    CFPropertyListRef v11 = self;
    p_vvmSettingsDictionary = &self->_mmsSettingsDictionary;
    uint64_t v13 = 4;
    goto LABEL_19;
  }
  if (a5 != 48)
  {
    if (a5 != 0x20000) {
      return;
    }
    p_internetSettingsDictionary = &self->_imsSettingsDictionary;
    internetSettingsDictionary = self->_imsSettingsDictionary;
    if (internetSettingsDictionary) {
      goto LABEL_20;
    }
    CFPropertyListRef v11 = self;
    p_vvmSettingsDictionary = &self->_imsSettingsDictionary;
    uint64_t v13 = 0x20000;
    goto LABEL_19;
  }
  p_internetSettingsDictionary = &self->_tetheringSettingsDictionary;
  internetSettingsDictionary = self->_tetheringSettingsDictionary;
  if (!internetSettingsDictionary)
  {
    CFPropertyListRef v11 = self;
    p_vvmSettingsDictionary = &self->_tetheringSettingsDictionary;
    uint64_t v13 = 48;
    goto LABEL_19;
  }
LABEL_20:

  [(NSMutableDictionary *)internetSettingsDictionary setObject:a4 forKey:a3];
}

- (id)_getAPNDictinaryForService:(int)a3
{
  if (a3 <= 3)
  {
    if (a3 == 1)
    {
      uint64_t v3 = &OBJC_IVAR___EdgeSettingsController__internetSettingsDictionary;
    }
    else
    {
      if (a3 != 2) {
        return -[EdgeSettingsController _APNDictionaryForServiceFromSC:](self, "_APNDictionaryForServiceFromSC:");
      }
      uint64_t v3 = &OBJC_IVAR___EdgeSettingsController__vvmSettingsDictionary;
    }
  }
  else
  {
    switch(a3)
    {
      case 4:
        uint64_t v3 = &OBJC_IVAR___EdgeSettingsController__mmsSettingsDictionary;
        break;
      case 0x30:
        uint64_t v3 = &OBJC_IVAR___EdgeSettingsController__tetheringSettingsDictionary;
        break;
      case 0x20000:
        uint64_t v3 = &OBJC_IVAR___EdgeSettingsController__imsSettingsDictionary;
        break;
      default:
        return -[EdgeSettingsController _APNDictionaryForServiceFromSC:](self, "_APNDictionaryForServiceFromSC:");
    }
  }
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + *v3);
  if (v4) {
    return v4;
  }
  return -[EdgeSettingsController _APNDictionaryForServiceFromSC:](self, "_APNDictionaryForServiceFromSC:");
}

- (id)_APNDictionaryForServiceFromSC:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint8_t v5 = [(EdgeSettingsController *)self currectSet];
  id result = (id)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if ([(EdgeSettingsController *)self isTypeOfService:v10 ofServiceType:v3]) {
          return v10;
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id result = (id)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v7 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (BOOL)_isAPNDictionaryBlank:(id)a3
{
  if ((![a3 objectForKey:@"apn"]
     || (int v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"apn"), "isEqual:", &stru_26DD4D9A0)) != 0)
    && (![a3 objectForKey:@"username"]
     || (int v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"username"), "isEqual:", &stru_26DD4D9A0)) != 0))
  {
    if ([a3 objectForKey:@"password"]) {
      LOBYTE(v4) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"password"), "isEqual:", &stru_26DD4D9A0);
    }
    else {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (void)uploadSettingsOnCT:(id)a3
{
  uint8_t v5 = [(EdgeSettingsController *)self coreTelephonyClient];
  CFNumberRef v6 = [(EdgeSettingsController *)self context];

  [(CoreTelephonyClient *)v5 setUIConfiguredApns:v6 apns:a3 completion:&__block_literal_global];
}

void __45__EdgeSettingsController_uploadSettingsOnCT___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __45__EdgeSettingsController_uploadSettingsOnCT___block_invoke_cold_1();
    }
  }
}

- (id)_blankAPNDictionaryWithTypeMask:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v4 setObject:&stru_26DD4D9A0 forKey:@"apn"];
  [v4 setObject:&stru_26DD4D9A0 forKey:@"username"];
  [v4 setObject:&stru_26DD4D9A0 forKey:@"password"];
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v3), @"type-mask");

  return v4;
}

- (void)commitAPNsSettings
{
  if (self->_cacheInitialized)
  {
    if ([(EdgeSettingsController *)self _isAPNDictionaryBlank:self->_internetSettingsDictionary])
    {
      -[NSMutableDictionary setObject:forKey:](self->_internetSettingsDictionary, "setObject:forKey:", [NSNumber numberWithInt:0], @"type-mask");
    }
    if ([(EdgeSettingsController *)self _isAPNDictionaryBlank:self->_vvmSettingsDictionary]) {
      -[NSMutableDictionary setObject:forKey:](self->_vvmSettingsDictionary, "setObject:forKey:", [NSNumber numberWithInt:0], @"type-mask");
    }
    if ([(EdgeSettingsController *)self _isAPNDictionaryBlank:self->_mmsSettingsDictionary]) {
      -[NSMutableDictionary setObject:forKey:](self->_mmsSettingsDictionary, "setObject:forKey:", [NSNumber numberWithInt:0], @"type-mask");
    }
    if ([(EdgeSettingsController *)self _isAPNDictionaryBlank:self->_imsSettingsDictionary]) {
      -[NSMutableDictionary setObject:forKey:](self->_imsSettingsDictionary, "setObject:forKey:", [NSNumber numberWithInt:0], @"type-mask");
    }
    if ([(EdgeSettingsController *)self _isAPNDictionaryBlank:self->_tetheringSettingsDictionary])
    {
      -[NSMutableDictionary setObject:forKey:](self->_tetheringSettingsDictionary, "setObject:forKey:", [NSNumber numberWithInt:0], @"type-mask");
    }
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v4 = v3;
    if (self->_internetSettingsDictionary) {
      objc_msgSend(v3, "addObject:");
    }
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      if (self->_vvmSettingsDictionary) {
        objc_msgSend(v4, "addObject:");
      }
      if (self->_mmsSettingsDictionary) {
        objc_msgSend(v4, "addObject:");
      }
    }
    if (self->_tetheringSettingsDictionary) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_imsSettingsDictionary) {
      objc_msgSend(v4, "addObject:");
    }
    uint8_t v5 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"usersettings", @"source", v4, @"apns", 0);
    [(EdgeSettingsController *)self uploadSettingsOnCT:v5];

    [(EdgeSettingsController *)self resetAPNsDictionaries];
    [(EdgeSettingsController *)self loadCurrentAPNs];
  }
}

- (void)resetAPNsDictionaries
{
  internetSettingsDictionary = self->_internetSettingsDictionary;
  if (internetSettingsDictionary)
  {

    self->_internetSettingsDictionary = 0;
  }
  vvmSettingsDictionary = self->_vvmSettingsDictionary;
  if (vvmSettingsDictionary)
  {

    self->_vvmSettingsDictionary = 0;
  }
  mmsSettingsDictionary = self->_mmsSettingsDictionary;
  if (mmsSettingsDictionary)
  {

    self->_mmsSettingsDictionary = 0;
  }
  imsSettingsDictionary = self->_imsSettingsDictionary;
  if (imsSettingsDictionary)
  {

    self->_imsSettingsDictionary = 0;
  }
  tetheringSettingsDictionary = self->_tetheringSettingsDictionary;
  if (tetheringSettingsDictionary)
  {

    self->_tetheringSettingsDictionary = 0;
  }
  self->_cacheInitialized = 0;
}

- (void)loadCurrentAPNs
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_228F68000, &_os_log_internal, v0, "getConfiguredApns failed: %@", v1, v2, v3, v4, v5);
}

- (void)resetAttachAPNSettings
{
  lastAttachAPNDict = self->_lastAttachAPNDict;
  if (lastAttachAPNDict) {

  }
  newAttachAPNDict = self->_newAttachAPNDict;
  if (newAttachAPNDict) {

  }
  id v5 = [(EdgeSettingsController *)self attachAPNSettings];
  if (v5)
  {
    CFNumberRef v6 = v5;
    self->_lastAttachAPNDict = (NSMutableDictionary *)[v5 mutableCopy];
    id v7 = (NSMutableDictionary *)[v6 mutableCopy];
  }
  else
  {
    self->_lastAttachAPNDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  self->_newAttachAPNDict = v7;
}

- (id)attachAPNSettings
{
  uint64_t v4 = 0;
  uint64_t v2 = (void *)[(CoreTelephonyClient *)[(EdgeSettingsController *)self coreTelephonyClient] context:[(EdgeSettingsController *)self context] getAttachApnSettings:&v4];
  if (v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[EdgeSettingsController attachAPNSettings]();
  }
  return v2;
}

- (void)commitAttachAPNSettings
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_228F68000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Committing Attach APN settings", v0, 2u);
}

- (BOOL)isAttachAPNEditingAllowed
{
  uint64_t v3 = 0;
  return [(CoreTelephonyClient *)[(EdgeSettingsController *)self coreTelephonyClient] isAttachApnSettingAllowed:[(EdgeSettingsController *)self context] error:&v3];
}

- (BOOL)shouldResetAttachAPN
{
  if ([(EdgeSettingsController *)self isAttachAPNEditingAllowed]) {
    [(NSMutableDictionary *)self->_lastAttachAPNDict objectForKey:@"apn"];
  }
  return 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(EdgeSettingsController *)self commitAttachAPNSettings];
  [(EdgeSettingsController *)self commitAPNsSettings];
  v5.receiver = self;
  v5.super_class = (Class)EdgeSettingsController;
  [(EdgeSettingsController *)&v5 viewDidDisappear:v3];
}

- (void)applicationWillSuspend
{
  [(EdgeSettingsController *)self commitAttachAPNSettings];
  [(EdgeSettingsController *)self commitAPNsSettings];
  v3.receiver = self;
  v3.super_class = (Class)EdgeSettingsController;
  [(EdgeSettingsController *)&v3 applicationWillSuspend];
}

- (void)applicationDidResume
{
  [(EdgeSettingsController *)self resetAttachAPNSettings];
  v3.receiver = self;
  v3.super_class = (Class)EdgeSettingsController;
  [(EdgeSettingsController *)&v3 applicationDidResume];
}

- (void)showCarrierSettingsEraseAlert:(BOOL)a3
{
  objc_super v5 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ERASE_CARRIER_SETTINGS_TITLE", &stru_26DD4D9A0, @"EDGE Settings");
  id v7 = objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ERASE_CARRIER_SETTINGS_CONFIRM_STRING", &stru_26DD4D9A0, @"EDGE Settings"), 1);
  uint64_t v8 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ERASE_CARRIER_SETTINGS", &stru_26DD4D9A0, @"EDGE Settings");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__EdgeSettingsController_showCarrierSettingsEraseAlert___block_invoke;
  v13[3] = &unk_264857E38;
  v13[4] = self;
  BOOL v14 = a3;
  objc_msgSend(v7, "addAction:", objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v13));
  CFStringRef v10 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"CANCEL", &stru_26DD4D9A0, @"EDGE Settings");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__EdgeSettingsController_showCarrierSettingsEraseAlert___block_invoke_248;
  v12[3] = &unk_264857E60;
  v12[4] = self;
  objc_msgSend(v7, "addAction:", objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v12));
  [(EdgeSettingsController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __56__EdgeSettingsController_showCarrierSettingsEraseAlert___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "coreTelephonyClient"), "loadGSMASettings:state:", objc_msgSend(*(id *)(a1 + 32), "context"), *(unsigned __int8 *)(a1 + 40));
  if (result)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[EdgeSettingsController resetCarrierSettings:]();
    }
    return [*(id *)(a1 + 32) reloadSpecifiers];
  }
  return result;
}

uint64_t __56__EdgeSettingsController_showCarrierSettingsEraseAlert___block_invoke_248(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)getDefaultSettings:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v4 = [(EdgeSettingsController *)self getGSMASettingsUIControl];
  unint64_t v5 = v4;
  if (v4 == 1)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      uint64_t v17 = *MEMORY[0x263F600A8];
      uint64_t v18 = MEMORY[0x263EFFA88];
      uint64_t v19 = MEMORY[0x263EFFA80];
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ((__CFString *)[v21 identifier] == @"GSMA_SETTING")
          {
            uint64_t v22 = v18;
          }
          else if ([v21 cellType] == 13)
          {
            uint64_t v22 = v18;
          }
          else
          {
            uint64_t v22 = v19;
          }
          [v21 setProperty:v22 forKey:v17];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v15);
    }
  }
  else if (v4 == 2)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      uint64_t v10 = *MEMORY[0x263F600A8];
      uint64_t v11 = MEMORY[0x263EFFA88];
      do
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * j) setProperty:v11 forKey:v10];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v8);
    }
  }
  return (id)[NSNumber numberWithBool:v5 == 1];
}

- (void)setDefaultSettings:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue])
  {
    [(EdgeSettingsController *)self resetAllConfiguredSettings];
    if ([(CoreTelephonyClient *)[(EdgeSettingsController *)self coreTelephonyClient] loadGSMASettings:[(EdgeSettingsController *)self context] state:1])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[EdgeSettingsController resetCarrierSettings:]();
      }
    }
  }
  else
  {
    [(EdgeSettingsController *)self showCarrierSettingsEraseAlert:0];
  }
}

- (void)didChangeDeviceManagementSettings:(id)a3
{
  uint64_t v4 = [a3 slotID];
  if (v4 == [(CTXPCServiceSubscriptionContext *)[(EdgeSettingsController *)self context] slotID])
  {
    [(EdgeSettingsController *)self reloadSpecifiers];
  }
}

- (void)dealloc
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_228F68000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[EdgeSettingsController dealloc]", v0, 2u);
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (NSArray)currectSet
{
  return self->_currectSet;
}

- (void)setCurrectSet:(id)a3
{
}

void __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_228F68000, &_os_log_internal, v0, "resetAllUIConfiguredApns failed: %@", v1, v2, v3, v4, v5);
}

void __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_43_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_228F68000, &_os_log_internal, v0, "modifyAttachApnSettings failed: %@", v1, v2, v3, v4, v5);
}

- (void)resetCarrierSettings:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_228F68000, &_os_log_internal, v0, "loadGSMASettings failed: %@", v1, v2, v3, v4, v5);
}

- (void)specifiers
{
  [a1 context];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_228F68000, &_os_log_internal, v1, "EdgeSettingsController context: %@", v2, v3, v4, v5, v6);
}

- (void)getGSMASettingsUIControl
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_228F68000, &_os_log_internal, v0, "Unexpected value retrieved via getGSMAUIControlSetting: %ld", v1, v2, v3, v4, v5);
}

void __45__EdgeSettingsController_uploadSettingsOnCT___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_228F68000, &_os_log_internal, v0, "setUIConfiguredApns failed: %@", v1, v2, v3, v4, v5);
}

- (void)attachAPNSettings
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_228F68000, &_os_log_internal, v0, "getAttachApnSettings failed: %@", v1, v2, v3, v4, v5);
}

@end