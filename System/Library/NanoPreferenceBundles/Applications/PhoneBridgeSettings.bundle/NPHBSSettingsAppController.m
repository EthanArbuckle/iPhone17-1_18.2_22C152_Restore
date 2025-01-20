@interface NPHBSSettingsAppController
+ (BOOL)_activeWatchHasTelephony;
- (BOOL)suppressAllMirrorSpecifiers;
- (id)_activeWatchIsProvisioned;
- (id)_carrierDirectCallingAllowed:(id)a3;
- (id)_incomingCallSoundEnabled:(id)a3;
- (id)_incomingCallVibrationEnabled:(id)a3;
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)localizedMirroringDetailFooter;
- (id)localizedPaneTitle;
- (int64_t)alertType;
- (void)_cellularPlanInfoDidChange:(id)a3;
- (void)_removeThumperItems;
- (void)_setCarrierDirectCallingAllowed:(id)a3 specifier:(id)a4;
- (void)_setIncomingCallSoundEnabled:(id)a3 specifier:(id)a4;
- (void)_setIncomingCallVibrationEnabled:(id)a3 specifier:(id)a4;
- (void)_updateWiFiCallingFooter:(id)a3 accountsSupported:(BOOL)a4 wifiString:(id)a5;
- (void)openFaceTimeSettings;
- (void)openPhoneWiFiCallingSettings;
- (void)prepareSpecifiersMetadata;
@end

@implementation NPHBSSettingsAppController

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"BRIDGE_APP_TITLE" value:&stru_8A20 table:0];

  return v3;
}

- (int64_t)alertType
{
  return 4;
}

- (id)localizedMirroringDetailFooter
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"MIRROR_DETAIL_FORMAT" value:&stru_8A20 table:0];

  LODWORD(v3) = [(NPHBSSettingsAppController *)self showAlerts];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v3) {
    CFStringRef v7 = @"SHOW_ALERTS";
  }
  else {
    CFStringRef v7 = @"DONT_SHOW_ALERTS";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_8A20 table:0];

  v9 = +[NSString stringWithValidatedFormat:v4, @"%@", 0, v8 validFormatSpecifiers error];

  return v9;
}

- (BOOL)suppressAllMirrorSpecifiers
{
  v2 = [(NPHBSSettingsAppController *)self bbSectionInfo];
  char v3 = [v2 allowsNotifications] ^ 1;

  return v3;
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.mobilephone";
}

- (void)prepareSpecifiersMetadata
{
  if (!self->_requestedRequiredInfo)
  {
    self->_requestedRequiredInfo = 1;
    char v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = NPHCellularPlanInfoDidChangeNotification;
    v5 = +[NPHCellularBridgeUIManager sharedInstance];
    [v3 addObserver:self selector:"_cellularPlanInfoDidChange:" name:v4 object:v5];

    id v6 = +[NPHCellularBridgeUIManager sharedInstance];
    [v6 updateCellularPlansWithFetch:1];
  }
}

- (id)applicationGroupSpecifiers
{
  char v3 = NPHBSFrameworkBundle();
  uint64_t v4 = [(NPHBSSettingsAppController *)self loadSpecifiersFromPlistName:@"PhoneBridgeSettings" target:self bundle:v3];
  appGroupSpecifiers = self->_appGroupSpecifiers;
  self->_appGroupSpecifiers = v4;

  int v6 = MGGetBoolAnswer();
  CFStringRef v7 = @"WIFI";
  if (v6) {
    CFStringRef v7 = @"WLAN";
  }
  v8 = v7;
  id v9 = +[TUCallCapabilities accountsMatchForSecondaryCalling];
  v10 = [(NSArray *)self->_appGroupSpecifiers specifierForID:@"carrier_direct_calling_details_id"];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = +[NSString stringWithFormat:@"THUMPER_CALLING_ALLOWED_%@", v8];
  v13 = [v11 localizedStringForKey:v12 value:&stru_8A20 table:0];
  [v10 setName:v13];

  v14 = +[NSNumber numberWithBool:v9];
  [v10 setObject:v14 forKeyedSubscript:PSEnabledKey];

  if ((v9 & 1) == 0 && v10)
  {
    *(void *)&v10[OBJC_IVAR___PSSpecifier_getter] = 0;
    *(void *)&v10[OBJC_IVAR___PSSpecifier_setter] = 0;
  }
  v15 = [(NSArray *)self->_appGroupSpecifiers specifierForID:@"carrier_direct_calling_group_id"];
  [(NPHBSSettingsAppController *)self _updateWiFiCallingFooter:v15 accountsSupported:v9 wifiString:v8];
  if (+[TUCallCapabilities isThumperCallingEnabled])
  {
    if ([(id)objc_opt_class() _activeWatchHasTelephony])
    {
      v16 = [(NPHBSSettingsAppController *)self _activeWatchIsProvisioned];
      v17 = v16;
      if (v16)
      {
        if ([v16 BOOLValue]) {
          [(NPHBSSettingsAppController *)self _removeThumperItems];
        }
      }
      else
      {
        [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:PSControlIsLoadingKey];
      }
    }
  }
  else
  {
    [(NPHBSSettingsAppController *)self _removeThumperItems];
  }
  if ([(NPHBSSettingsAppController *)self settingsMode]) {
    v18 = 0;
  }
  else {
    v18 = self->_appGroupSpecifiers;
  }

  return v18;
}

- (void)_removeThumperItems
{
  id v3 = [(NSArray *)self->_appGroupSpecifiers indexOfSpecifierWithID:@"carrier_direct_calling_group_id"];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [(NSArray *)self->_appGroupSpecifiers removeObjectAtIndex:v3];
  }
  id v4 = [(NSArray *)self->_appGroupSpecifiers indexOfSpecifierWithID:@"carrier_direct_calling_details_id"];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    appGroupSpecifiers = self->_appGroupSpecifiers;
    [(NSArray *)appGroupSpecifiers removeObjectAtIndex:v5];
  }
}

- (void)_cellularPlanInfoDidChange:(id)a3
{
  id v4 = a3;
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[NPHBSSettingsAppController _cellularPlanInfoDidChange:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s - notification: %@", buf, 0x16u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_54F8;
  v6[3] = &unk_8500;
  v6[4] = self;
  nph_ensure_on_main_queue(v6);
}

- (id)_activeWatchIsProvisioned
{
  v2 = +[NPHCellularBridgeUIManager sharedInstance];
  id v3 = [v2 cellularPlans];
  if (v3)
  {
    id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 cellularPlanIsSetUp]);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updateWiFiCallingFooter:(id)a3 accountsSupported:(BOOL)a4 wifiString:(id)a5
{
  BOOL v6 = a4;
  id v25 = a3;
  id v8 = a5;
  __int16 v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  [v25 setObject:v10 forKeyedSubscript:PSFooterCellClassGroupKey];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = v11;
  if (v6)
  {
    v13 = [v11 localizedStringForKey:@"THUMPER_CALLING_EMERGENCY_ADDRESS_UPDATE" value:&stru_8A20 table:0];

    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = +[NSString stringWithFormat:@"THUMPER_CALLING_PHONE_SETTINGS_%@", v8];

    v16 = [v14 localizedStringForKey:v15 value:&stru_8A20 table:0];

    CFStringRef v17 = @"openPhoneWiFiCallingSettings";
  }
  else
  {
    v18 = +[NSString stringWithFormat:@"THUMPER_CALLING_NEED_ACCOUNTS_SUPPORT_%@", v8];

    v13 = [v12 localizedStringForKey:v18 value:&stru_8A20 table:0];

    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v14 localizedStringForKey:@"THUMPER_CALLING_FACETIME_SETTINGS" value:&stru_8A20 table:0];
    CFStringRef v17 = @"openFaceTimeSettings";
  }

  [v25 setObject:v17 forKeyedSubscript:PSFooterHyperlinkViewActionKey];
  v19 = +[NSString stringWithValidatedFormat:v13, @"%@", 0, v16 validFormatSpecifiers error];

  id v20 = [v19 rangeOfString:v16 options:4];
  NSUInteger v22 = v21;
  [v25 setObject:v19 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
  v27.location = (NSUInteger)v20;
  v27.length = v22;
  v23 = NSStringFromRange(v27);
  [v25 setObject:v23 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

  v24 = +[NSValue valueWithNonretainedObject:self];
  [v25 setObject:v24 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];
}

- (void)openFaceTimeSettings
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  v2 = +[PSFaceTimeSettingsDetail preferencesURL];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)openPhoneWiFiCallingSettings
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  v2 = +[NSURL URLWithString:@"prefs:root=Phone&path=com.apple.settings.WiFiCallingSettingsBundle"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

+ (BOOL)_activeWatchHasTelephony
{
  v2 = +[NRDevice activeDevice];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
  unsigned __int8 v4 = [v2 supportsCapability:v3];

  return v4;
}

- (void)_setIncomingCallSoundEnabled:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = +[TLToneManager sharedToneManager];
  [v5 _setCurrentToneWatchAlertPolicy:v4 forAlertType:1];
}

- (id)_incomingCallSoundEnabled:(id)a3
{
  id v3 = +[TLToneManager sharedToneManager];
  uint64_t v4 = (char *)[v3 _currentToneWatchAlertPolicyForAlertType:1];

  if (!v4)
  {
    id v5 = +[TLToneManager sharedToneManager];
    [v5 _setCurrentToneWatchAlertPolicy:3 forAlertType:1];

    BOOL v6 = +[TLToneManager sharedToneManager];
    uint64_t v4 = (char *)[v6 _currentToneWatchAlertPolicyForAlertType:1];
  }

  return +[NSNumber numberWithBool:v4 != (unsigned char *)&dword_0 + 2];
}

- (void)_setIncomingCallVibrationEnabled:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = +[TLVibrationManager sharedVibrationManager];
  [v5 _setCurrentVibrationWatchAlertPolicy:v4 forAlertType:1];
}

- (id)_incomingCallVibrationEnabled:(id)a3
{
  id v3 = +[TLVibrationManager sharedVibrationManager];
  uint64_t v4 = (char *)[v3 _currentVibrationWatchAlertPolicyForAlertType:1];

  if (!v4)
  {
    id v5 = +[TLVibrationManager sharedVibrationManager];
    [v5 _setCurrentVibrationWatchAlertPolicy:3 forAlertType:1];

    BOOL v6 = +[TLVibrationManager sharedVibrationManager];
    uint64_t v4 = (char *)[v6 _currentVibrationWatchAlertPolicyForAlertType:1];
  }

  return +[NSNumber numberWithBool:v4 != (unsigned char *)&dword_0 + 2];
}

- (void)_setCarrierDirectCallingAllowed:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  +[TUCallCapabilities setThumperCallingAllowedOnDefaultPairedSecondaryDevice:v4];
}

- (id)_carrierDirectCallingAllowed:(id)a3
{
  id v3 = +[TUCallCapabilities isThumperCallingAllowedOnDefaultPairedSecondaryDevice];

  return +[NSNumber numberWithBool:v3];
}

- (void).cxx_destruct
{
}

@end