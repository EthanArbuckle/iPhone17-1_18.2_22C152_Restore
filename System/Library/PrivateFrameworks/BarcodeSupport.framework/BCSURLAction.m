@interface BCSURLAction
- (BCSURLAction)initWithData:(id)a3 codePayload:(id)a4;
- (BOOL)_allowAppClipCodeUniversalLinkFallback;
- (BOOL)_hasCellularPlanAction;
- (BOOL)_isCodeFromQRScanner;
- (BOOL)_isVisualCode;
- (BOOL)_shouldBlockHandlingURL:(id)a3;
- (BOOL)_shouldOpenInAppForAppLink:(id)a3;
- (BOOL)_tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler:(id)a3;
- (BOOL)_willOpenInSafari;
- (BOOL)hasPreferredAppLink;
- (BOOL)hasSensitiveURL;
- (BOOL)isAMSAction;
- (BOOL)isAirplayPairingAction;
- (BOOL)isApplePayInitiateAction;
- (BOOL)isPasskeyAction;
- (BOOL)isPasskeyAssertionAction;
- (BOOL)isPasskeyRegistrationAction;
- (BOOL)mustOpenAppLinkInApp;
- (BOOL)shouldRequireUserToPickTargetApp;
- (LSApplicationRecord)targetApplication;
- (id)_actionDescriptionForAppClip;
- (id)_actionDescriptionForURL:(id)a3 application:(id)a4 shouldShowHostNameForSafariURL:(BOOL)a5;
- (id)_actionDescriptionWithoutTargetApplicationForURL:(id)a3;
- (id)_actionPickerItemsForAppClip;
- (id)_actionPickerItemsForLockScreenVisibleApps;
- (id)_actionPickerItemsForUnlockedAppLinks;
- (id)_additionalActionPickerItems;
- (id)_appclipLaunchReason;
- (id)_applePayActionDescription;
- (id)_commonActionPickerItemsForURL;
- (id)_menuElementForActionPicker:(id)a3;
- (id)_passkeyAssertionActionDescription;
- (id)_passkeyRegistrationActionDescription;
- (id)_requiresOpenInTargetApplication;
- (id)actionIconSystemImageName;
- (id)actionPickerItems;
- (id)appLinks;
- (id)contentPreviewString;
- (id)debugDescriptionExtraInfoDictionary;
- (id)defaultActionTargetApplicationBundleIdentifier;
- (id)localizedDefaultActionDescription;
- (id)localizedDefaultActionTitle;
- (id)menuElements;
- (id)preferredBundleID;
- (id)shortDescription;
- (id)url;
- (unint64_t)appLinkCount;
- (unint64_t)menuElementsCount;
- (void)_appclipLaunchReason;
- (void)_didActivateBarcodeWithURLPayload;
- (void)_openActionInTargetApplicationWithOptions:(id)a3;
- (void)_queryApplicationRecordForURL:(id)a3 completionHandler:(id)a4;
- (void)_resolveAppClipForURL:(id)a3 completion:(id)a4;
- (void)_resolveTargetApplicationForURL:(id)a3 completionHandler:(id)a4;
- (void)actionPickerItems;
- (void)determineActionabilityWithCompletionHandler:(id)a3;
- (void)performAction;
- (void)performActionWithOptions:(id)a3 completion:(id)a4;
- (void)performDefaultAction;
- (void)performDefaultActionWithFBOptions:(id)a3;
- (void)shortDescription;
@end

@implementation BCSURLAction

- (BCSURLAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v11.receiver = self;
  v11.super_class = (Class)BCSURLAction;
  v8 = [(BCSAction *)&v11 initWithData:v6 codePayload:v7];
  if (!v8)
  {
    self = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  self = v8;
  v9 = self;
LABEL_6:

  return v9;
}

- (id)url
{
  v2 = [(BCSAction *)self data];
  v3 = [v2 url];

  return v3;
}

- (BOOL)shouldRequireUserToPickTargetApp
{
  return [(NSArray *)self->_appLinks count] >= 2 && !self->_hasPreferredAppLink;
}

- (BOOL)_hasCellularPlanAction
{
  return self->_cellularPlanAction != 0;
}

- (BOOL)isAirplayPairingAction
{
  v2 = [(BCSURLAction *)self targetApplication];
  v3 = [v2 bundleIdentifier];
  if ([v3 isEqualToString:@"com.apple.APSUIApp"]) {
    BOOL v4 = _bcs_airplayInWifiEnabled();
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)localizedDefaultActionTitle
{
  if ([(BCSURLAction *)self _hasCellularPlanAction])
  {
    v3 = [(CTCellularPlanQRCodeAction *)self->_cellularPlanAction title];
  }
  else if ([(BCSURLAction *)self isAirplayPairingAction])
  {
    v3 = _BCSLocalizedString(@"Connect", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)BCSURLAction;
    v3 = [(BCSAction *)&v5 localizedDefaultActionTitle];
  }
  return v3;
}

- (id)localizedDefaultActionDescription
{
  if ([(BCSURLAction *)self _hasCellularPlanAction])
  {
    uint64_t v3 = [(CTCellularPlanQRCodeAction *)self->_cellularPlanAction message];
LABEL_11:
    BOOL v4 = (__CFString *)v3;
    goto LABEL_12;
  }
  if ([(BCSURLAction *)self isAMSAction])
  {
    uint64_t v3 = _BCSLocalizedString(@"Tap here to learn more", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    goto LABEL_11;
  }
  if ([(BCSURLAction *)self isPasskeyAssertionAction])
  {
    uint64_t v3 = [(BCSURLAction *)self _passkeyAssertionActionDescription];
    goto LABEL_11;
  }
  if ([(BCSURLAction *)self isPasskeyRegistrationAction])
  {
    uint64_t v3 = [(BCSURLAction *)self _passkeyRegistrationActionDescription];
    goto LABEL_11;
  }
  if ([(BCSURLAction *)self isApplePayInitiateAction])
  {
    uint64_t v3 = [(BCSURLAction *)self _applePayActionDescription];
    goto LABEL_11;
  }
  id v6 = [(BCSURLAction *)self targetApplication];
  if (v6)
  {
    id v7 = [(BCSURLAction *)self url];
    uint64_t v8 = [(BCSURLAction *)self _actionDescriptionForURL:v7 application:v6 shouldShowHostNameForSafariURL:1];
  }
  else
  {
    if (!self->_deviceDataIsUnavailable)
    {
      BOOL v4 = &stru_26D608FC8;
      goto LABEL_20;
    }
    id v7 = [(BCSURLAction *)self url];
    uint64_t v8 = [(BCSURLAction *)self _actionDescriptionWithoutTargetApplicationForURL:v7];
  }
  BOOL v4 = (__CFString *)v8;

LABEL_20:
LABEL_12:
  return v4;
}

- (id)defaultActionTargetApplicationBundleIdentifier
{
  if ([(BCSURLAction *)self _hasCellularPlanAction])
  {
    uint64_t v3 = @"com.apple.Preferences.cellularData";
  }
  else
  {
    BOOL v4 = [(BCSURLAction *)self targetApplication];
    uint64_t v3 = [v4 bundleIdentifier];
  }
  return v3;
}

- (id)debugDescriptionExtraInfoDictionary
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(BCSURLAction *)self targetApplication];
  BOOL v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 bundleIdentifier];
  }
  else
  {
    objc_super v5 = &stru_26D608FC8;
  }
  v10[0] = @"targetApplication";
  v10[1] = @"url";
  v11[0] = v5;
  id v6 = [(BCSURLAction *)self url];
  id v7 = [v6 absoluteString];
  v11[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (id)_commonActionPickerItemsForURL
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id SSReadingListClass = getSSReadingListClass();
  objc_super v5 = [(BCSURLAction *)self url];
  LODWORD(SSReadingListClass) = [SSReadingListClass supportsURL:v5];

  if (SSReadingListClass)
  {
    id v6 = [BCSActionPickerItem alloc];
    id v7 = _BCSLocalizedString(@"Add to Reading List", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__BCSURLAction__commonActionPickerItemsForURL__block_invoke;
    v15[3] = &unk_26468AE90;
    v15[4] = self;
    uint64_t v8 = [(BCSActionPickerItem *)v6 initWithLabel:v7 actionHandler:v15];

    v9 = [getUIImageClass() systemImageNamed:@"eyeglasses"];
    [(BCSActionPickerItem *)v8 setIcon:v9];

    [v3 addObject:v8];
  }
  v10 = [BCSCopyActionPickerItem alloc];
  objc_super v11 = [(BCSURLAction *)self url];
  v12 = [(BCSCopyActionPickerItem *)v10 initWithAction:self urlToCopy:v11];

  [v3 addObject:v12];
  v13 = [[BCSShareActionPickerItem alloc] initWithAction:self];
  [v3 addObject:v13];

  return v3;
}

void __46__BCSURLAction__commonActionPickerItemsForURL__block_invoke(uint64_t a1)
{
  id v3 = [getSSReadingListClass() defaultReadingList];
  v2 = [*(id *)(a1 + 32) url];
  [v3 addReadingListItemWithURL:v2 title:0 previewText:0 error:0];
}

- (id)_additionalActionPickerItems
{
  id v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [(BCSAction *)self detectedCode];

  if (!v4) {
    goto LABEL_4;
  }
  if ([(NSArray *)self->_appLinks count])
  {
    objc_super v5 = [(BCSURLAction *)self url];
    char v6 = objc_msgSend(v5, "_bcs_isRedirectedSHCURL");

    if (v6)
    {
LABEL_4:
      id v7 = 0;
      goto LABEL_10;
    }
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:@"com.apple.mobilesafari" allowPlaceholder:0 error:0];
    v9 = [BCSURLActionPickerItem alloc];
    v10 = _BCSLocalizedString(@"Open in Safari", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    objc_super v11 = [(BCSURLAction *)self url];
    v12 = [(BCSURLActionPickerItem *)v9 initWithLabel:v10 action:self url:v11 applicationRecord:v8];

    [v3 addObject:v12];
  }
  if ([(BCSURLAction *)self _willOpenInSafari] || [(NSArray *)self->_appLinks count])
  {
    v13 = [(BCSURLAction *)self _commonActionPickerItemsForURL];
    [v3 addObjectsFromArray:v13];
  }
  id v7 = v3;
LABEL_10:

  return v7;
}

- (id)_actionPickerItemsForAppClip
{
  id v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [(BCSActionPickerItem *)[BCSAppClipActionPickerItem alloc] initWithAction:self];
  [v3 addObject:v4];
  if ([(BCSAction *)self codeType] != 3)
  {
    objc_super v5 = [BCSCopyActionPickerItem alloc];
    char v6 = [(BCSURLAction *)self url];
    id v7 = [(BCSCopyActionPickerItem *)v5 initWithAction:self urlToCopy:v6];

    [v3 addObject:v7];
    uint64_t v8 = [[BCSShareActionPickerItem alloc] initWithAction:self];
    [v3 addObject:v8];
  }
  return v3;
}

- (BOOL)_willOpenInSafari
{
  id v3 = [(BCSURLAction *)self targetApplication];
  BOOL v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.mobilesafari"])
  {
    objc_super v5 = [(BCSAction *)self clipMetadataRequest];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)shortDescription
{
  if ([(BCSURLAction *)self _willOpenInSafari]) {
    goto LABEL_2;
  }
  if ([(BCSURLAction *)self isPasskeyAssertionAction])
  {
    uint64_t v6 = [(BCSURLAction *)self _passkeyAssertionActionDescription];
LABEL_13:
    objc_super v5 = (void *)v6;
    goto LABEL_14;
  }
  if ([(BCSURLAction *)self isPasskeyRegistrationAction])
  {
    uint64_t v6 = [(BCSURLAction *)self _passkeyRegistrationActionDescription];
    goto LABEL_13;
  }
  if ([(BCSURLAction *)self isAirplayPairingAction])
  {
    id v7 = @"Connect";
LABEL_10:
    uint64_t v6 = _BCSLocalizedString(v7, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    goto LABEL_13;
  }
  if ([(BCSURLAction *)self isApplePayInitiateAction])
  {
    uint64_t v6 = [(BCSURLAction *)self _applePayActionDescription];
    goto LABEL_13;
  }
  if (self->_deviceDataIsUnavailable)
  {
    uint64_t v9 = [(BCSURLAction *)self targetApplication];
    if (v9)
    {
      v10 = (void *)v9;
      BOOL v11 = [(BCSURLAction *)self isAMSAction];

      if (!v11)
      {
        v15 = [(BCSURLAction *)self targetApplication];
        int v16 = [v15 developerType];

        if (v16 != 1)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[BCSURLAction shortDescription](self);
          }
          goto LABEL_2;
        }
        goto LABEL_28;
      }
    }
    if ([(NSArray *)self->_appLinks count])
    {
LABEL_2:
      id v3 = [(BCSURLAction *)self url];
      uint64_t v4 = objc_msgSend(v3, "_bcs_displayString");
LABEL_3:
      objc_super v5 = (void *)v4;

      goto LABEL_14;
    }
  }
  if (![(NSArray *)self->_appLinks count])
  {
    if (![(BCSURLAction *)self _hasCellularPlanAction])
    {
      uint64_t v6 = [(BCSURLAction *)self localizedDefaultActionDescription];
      goto LABEL_13;
    }
    id v7 = @"Cellular Plan";
    goto LABEL_10;
  }
  v12 = [(BCSURLAction *)self url];
  int v13 = objc_msgSend(v12, "_bcs_isRedirectedSHCURL");

  if (!v13
    || ([(BCSURLAction *)self url],
        v14 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "_bcs_localizedDisplayNameForRedirectedSHCURL"),
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v5))
  {
LABEL_28:
    id v3 = [(BCSURLAction *)self targetApplication];
    uint64_t v4 = [v3 localizedName];
    goto LABEL_3;
  }
LABEL_14:
  return v5;
}

- (id)actionIconSystemImageName
{
  if ([(BCSURLAction *)self _willOpenInSafari]) {
    return @"safari.fill";
  }
  uint64_t v4 = [(LSApplicationRecord *)self->_userVisibleAppRecord bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.Home"];

  if (v5) {
    return @"homekit";
  }
  uint64_t v6 = [(BCSAction *)self clipMetadataRequest];

  if (v6) {
    return @"arrow.up.forward.appclip";
  }
  if ([(BCSURLAction *)self _hasCellularPlanAction]) {
    return @"antenna.radiowaves.left.and.right";
  }
  id v7 = [(BCSURLAction *)self url];
  char v8 = objc_msgSend(v7, "_bcs_isRedirectedSHCURL");

  if (v8) {
    return @"health.fill";
  }
  if ([(BCSURLAction *)self isPasskeyAction]) {
    return @"person.badge.key.fill";
  }
  if ([(BCSURLAction *)self isAirplayPairingAction]) {
    return @"tv";
  }
  if ([(BCSURLAction *)self isApplePayInitiateAction]) {
    return @"creditcard.fill";
  }
  return @"arrow.up.forward.app.fill";
}

- (id)_actionPickerItemsForLockScreenVisibleApps
{
  uint64_t v4 = [(NSArray *)self->_appLinks firstObject];
  userVisibleAppRecord = self->_userVisibleAppRecord;
  if (userVisibleAppRecord)
  {
    uint64_t v6 = userVisibleAppRecord;
  }
  else
  {
    uint64_t v6 = [(NSArray *)self->_upiApplicationRecords firstObject];
  }
  id v7 = v6;
  char v8 = self->_userVisibleAppRecord;
  if (!v8
    || ([(LSApplicationRecord *)self->_userVisibleAppRecord bundleIdentifier],
        v2 = objc_claimAutoreleasedReturnValue(),
        ([v2 isEqualToString:@"com.apple.mobilesafari"] & 1) != 0))
  {
    v10 = _BCSLocalizedString(@"Title for the menu to open an application or the browser when a QR code is deteced in lock screen", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    if (!v8) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v9 = [(BCSURLAction *)self url];
    v10 = [(BCSURLAction *)self _actionDescriptionForURL:v9 application:self->_userVisibleAppRecord shouldShowHostNameForSafariURL:0];
  }
LABEL_9:
  BOOL v11 = [BCSURLActionPickerItem alloc];
  if (v4)
  {
    v12 = [(BCSAction *)self codePayload];
    uint64_t v13 = [(BCSURLActionPickerItem *)v11 initWithLabel:v10 action:self appLink:v4 codePayload:v12];
  }
  else
  {
    v12 = [(BCSURLAction *)self url];
    uint64_t v13 = [(BCSURLActionPickerItem *)v11 initWithLabel:v10 action:self url:v12 applicationRecord:v7 preferApplicationIcon:self->_userVisibleAppRecord != 0];
  }
  v14 = (void *)v13;

  v15 = [MEMORY[0x263EFF980] array];
  [v15 addObject:v14];
  int v16 = [(BCSURLAction *)self _commonActionPickerItemsForURL];
  [v15 addObjectsFromArray:v16];

  return v15;
}

- (id)_actionPickerItemsForUnlockedAppLinks
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (![(NSArray *)self->_appLinks count])
  {
    id v19 = 0;
    goto LABEL_15;
  }
  id v19 = [MEMORY[0x263EFF980] array];
  id v3 = [(BCSURLAction *)self url];
  uint64_t v4 = [(BCSAction *)self detectedCode];
  if (v4)
  {

LABEL_6:
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obj = self->_appLinks;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v10 = [v9 targetApplicationRecord];
          BOOL v11 = [(BCSURLAction *)self _actionDescriptionForURL:v3 application:v10 shouldShowHostNameForSafariURL:0];

          v12 = [BCSURLActionPickerItem alloc];
          uint64_t v13 = [(BCSAction *)self codePayload];
          v14 = [(BCSAction *)self detectedCode];
          v15 = [(BCSURLActionPickerItem *)v12 initWithLabel:v11 action:self appLink:v9 codePayload:v13 preferApplicationIcon:v14 != 0];

          [v19 addObject:v15];
        }
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    int v16 = [(BCSURLAction *)self _additionalActionPickerItems];
    [v19 addObjectsFromArray:v16];

    goto LABEL_14;
  }
  if ([(NSArray *)self->_appLinks count] >= 2) {
    goto LABEL_6;
  }
LABEL_14:

LABEL_15:
  return v19;
}

- (id)actionPickerItems
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(BCSURLAction *)self url];
  BOOL v5 = [(BCSURLAction *)self _hasCellularPlanAction];
  BOOL v6 = [(BCSURLAction *)self isAMSAction];
  BOOL v7 = [(BCSURLAction *)self isPasskeyAction];
  if ([(BCSURLAction *)self isApplePayInitiateAction] || v7 || v6 || v5)
  {
    v12 = [[BCSActionPickerItem alloc] initWithAction:self];
    [v3 addObject:v12];
    id v13 = v3;

    goto LABEL_39;
  }
  uint64_t v8 = [(BCSAction *)self detectedCode];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [(BCSAction *)self clipMetadataRequest];

    if (v10)
    {
      uint64_t v11 = [(BCSURLAction *)self _actionPickerItemsForAppClip];
LABEL_12:
      id v13 = (id)v11;
      goto LABEL_39;
    }
  }
  v14 = [(BCSAction *)self detectedCode];
  if (v14)
  {
    BOOL deviceDataIsUnavailable = self->_deviceDataIsUnavailable;

    if (deviceDataIsUnavailable)
    {
      uint64_t v11 = [(BCSURLAction *)self _actionPickerItemsForLockScreenVisibleApps];
      goto LABEL_12;
    }
  }
  int v16 = [(BCSURLAction *)self _actionPickerItemsForUnlockedAppLinks];
  if (![v16 count])
  {
    if ([(NSArray *)self->_upiApplicationRecords count] >= 2)
    {
      v43 = v16;
      v44 = v4;
      appStoreSearchURLForUnsupportedScheme = self->_appStoreSearchURLForUnsupportedScheme;
      if (!appStoreSearchURLForUnsupportedScheme) {
        appStoreSearchURLForUnsupportedScheme = v4;
      }
      v18 = appStoreSearchURLForUnsupportedScheme;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v19 = self->_upiApplicationRecords;
      uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v46 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            uint64_t v25 = objc_msgSend(v24, "localizedName", v43, v44, (void)v45);
            v26 = [[BCSURLActionPickerItem alloc] initWithLabel:v25 action:self url:v18 applicationRecord:v24 preferApplicationIcon:1];
            [v3 addObject:v26];
          }
          uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v21);
      }

      id v13 = v3;
      int v16 = v43;
      uint64_t v4 = v44;
      goto LABEL_38;
    }
    if (v4)
    {
      userVisibleAppRecord = self->_userVisibleAppRecord;
      if (userVisibleAppRecord)
      {
LABEL_28:
        uint64_t v28 = [(BCSURLAction *)self _actionDescriptionForURL:v4 application:userVisibleAppRecord shouldShowHostNameForSafariURL:0];
LABEL_31:
        v29 = (void *)v28;
        v30 = self->_appStoreSearchURLForUnsupportedScheme;
        if (!v30) {
          v30 = v4;
        }
        v31 = v30;
        v32 = [[BCSURLActionPickerItem alloc] initWithLabel:v29 action:self url:v31 applicationRecord:self->_userVisibleAppRecord preferApplicationIcon:1];

        [v3 addObject:v32];
        v33 = [(BCSURLAction *)self _additionalActionPickerItems];
        [v3 addObjectsFromArray:v33];

        id v13 = v3;
        goto LABEL_38;
      }
      if (self->_deviceDataIsUnavailable)
      {
LABEL_30:
        uint64_t v28 = [(BCSURLAction *)self _actionDescriptionWithoutTargetApplicationForURL:v4];
        goto LABEL_31;
      }
      if ((_bcs_isHostAppEntitled() & 1) == 0)
      {
        userVisibleAppRecord = self->_userVisibleAppRecord;
        if (userVisibleAppRecord) {
          goto LABEL_28;
        }
        goto LABEL_30;
      }
    }
    BOOL v34 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v34) {
      [(BCSURLAction *)v34 actionPickerItems];
    }
    id v13 = 0;
    goto LABEL_38;
  }
  id v13 = v16;
LABEL_38:

LABEL_39:
  return v13;
}

- (id)_appclipLaunchReason
{
  int64_t v2 = [(BCSAction *)self codeType];
  if (v2 == 3)
  {
    id v3 = @"AppclipCode";
  }
  else if (v2 == 2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v4 = (id *)getCPSSessionLaunchReasonNFCSymbolLoc_ptr;
    uint64_t v10 = getCPSSessionLaunchReasonNFCSymbolLoc_ptr;
    if (!getCPSSessionLaunchReasonNFCSymbolLoc_ptr)
    {
      BOOL v5 = (void *)ClipServicesLibrary_0();
      v8[3] = (uint64_t)dlsym(v5, "CPSSessionLaunchReasonNFC");
      getCPSSessionLaunchReasonNFCSymbolLoc_ptr = v8[3];
      uint64_t v4 = (id *)v8[3];
    }
    _Block_object_dispose(&v7, 8);
    if (!v4) {
      -[BCSURLAction _appclipLaunchReason]();
    }
    id v3 = (__CFString *)*v4;
  }
  else
  {
    getCPSSessionLaunchReasonQR();
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)hasSensitiveURL
{
  if ([(BCSURLAction *)self isAirplayPairingAction])
  {
    id v3 = [(BCSURLAction *)self url];
    char v4 = objc_msgSend(v3, "_bcs_hasScheme:", @"airplay");

    if (v4) {
      return 1;
    }
  }
  BOOL v6 = [(LSApplicationRecord *)self->_userVisibleAppRecord bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.Home"];

  if (!v7) {
    return 0;
  }
  uint64_t v8 = [(BCSURLAction *)self url];
  if (objc_msgSend(v8, "_bcs_hasScheme:", @"X-HM"))
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v9 = [(BCSURLAction *)self url];
    char v5 = objc_msgSend(v9, "_bcs_hasScheme:", @"com.apple.Home-private");
  }
  return v5;
}

- (void)performActionWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, id))a4;
  if ([(BCSURLAction *)self hasSensitiveURL])
  {
    uint64_t v8 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v9 = [(BCSURLAction *)self url];
    id v12 = 0;
    char v10 = [v8 openSensitiveURL:v9 withOptions:v6 error:&v12];
    id v11 = v12;

    if ((v10 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BCSURLAction performActionWithOptions:completion:](self);
    }
    v7[2](v7, v11);
  }
  else
  {
    [(BCSURLAction *)self performDefaultActionWithFBOptions:v6];
    v7[2](v7, 0);
  }
}

- (void)_didActivateBarcodeWithURLPayload
{
}

- (void)performDefaultActionWithFBOptions:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(BCSURLAction *)self _hasCellularPlanAction])
  {
    [(CTCellularPlanQRCodeAction *)self->_cellularPlanAction performWithCompletionHandler:&__block_literal_global_10];
    goto LABEL_30;
  }
  if (!_bcs_isHostAppEntitled()) {
    goto LABEL_7;
  }
  char v5 = [(BCSURLAction *)self targetApplication];
  if (v5)
  {

    goto LABEL_7;
  }
  if (self->_deviceDataIsUnavailable)
  {
LABEL_7:
    id v6 = [(BCSURLAction *)self _requiresOpenInTargetApplication];

    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        int v7 = [(BCSURLAction *)self targetApplication];
        uint64_t v8 = [v7 bundleIdentifier];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSURLAction: Handling URL with LSApplicationWorkspace operation with target application: %@.", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v9 = +[BCSAWDLogger sharedLogger];
      [v9 logBarcodeActivatedEventForAction:self];

      [(BCSURLAction *)self _openActionInTargetApplicationWithOptions:v4];
      [(BCSURLAction *)self _didActivateBarcodeWithURLPayload];
    }
    else
    {
      char v10 = [(BCSAction *)self clipMetadataRequest];

      if (v10)
      {
        uint64_t v45 = 0;
        long long v46 = &v45;
        uint64_t v47 = 0x2050000000;
        id v11 = (void *)getCPSClipRequestClass_softClass_0;
        uint64_t v48 = getCPSClipRequestClass_softClass_0;
        if (!getCPSClipRequestClass_softClass_0)
        {
          *(void *)&long long buf = MEMORY[0x263EF8330];
          *((void *)&buf + 1) = 3221225472;
          uint64_t v50 = __getCPSClipRequestClass_block_invoke_0;
          v51 = &unk_26468ACC8;
          v52 = &v45;
          __getCPSClipRequestClass_block_invoke_0((uint64_t)&buf);
          id v11 = (void *)v46[3];
        }
        id v12 = v11;
        _Block_object_dispose(&v45, 8);
        id v13 = [v12 alloc];
        v14 = [(BCSURLAction *)self url];
        v15 = (void *)[v13 initWithURL:v14];

        int v16 = [(BCSURLAction *)self _appclipLaunchReason];
        v17 = [v15 sessionProxy];
        v18 = [v17 configuration];
        [v18 setLaunchReason:v16];

        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_102;
        v44[3] = &unk_26468BA10;
        v44[4] = self;
        [v15 requestClipWithCompletion:v44];
        [(BCSURLAction *)self _didActivateBarcodeWithURLPayload];
      }
      else if ([(NSArray *)self->_appLinks count])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSURLAction: perform action with default app link", (uint8_t *)&buf, 2u);
        }
        id v19 = [(NSArray *)self->_appLinks firstObject];
        uint64_t v20 = [(BCSAction *)self codePayload];
        _bcs_openAppLinkIgnoringOpenStrategy(v19, v4, v20);

        if ([(NSArray *)self->_appLinks count] >= 2)
        {
          uint64_t v21 = +[BCSQRCodeParser sharedParser];
          uint64_t v22 = [v19 targetApplicationProxy];
          long long v23 = [v22 bundleIdentifier];
          v24 = [v19 URL];
          [v21 setPreferredBundleIdentifier:v23 forURL:v24];
        }
        [(BCSURLAction *)self _didActivateBarcodeWithURLPayload];
      }
      else
      {
        v33 = [(BCSURLAction *)self url];
        int v34 = objc_msgSend(v33, "_bcs_isUPIURL");

        BOOL v35 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
        if (v34)
        {
          if (v35)
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSURLAction: Opening top ranked UPI handling app", (uint8_t *)&buf, 2u);
          }
          uint64_t v36 = +[BCSQRCodeParser sharedParser];
          uint64_t v37 = [(BCSURLAction *)self targetApplication];
          uint64_t v38 = [v37 bundleIdentifier];
          uint64_t v39 = [(BCSURLAction *)self url];
          [v36 setPreferredBundleIdentifier:v38 forURL:v39];

          [(BCSURLAction *)self _openActionInTargetApplicationWithOptions:0];
          [(BCSURLAction *)self _didActivateBarcodeWithURLPayload];
        }
        else
        {
          if (v35)
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSURLAction: perform default action by opening URL", (uint8_t *)&buf, 2u);
          }
          uint64_t v40 = [MEMORY[0x263F01880] defaultWorkspace];
          uint64_t v41 = [(BCSURLAction *)self url];
          id v43 = 0;
          [v40 openURL:v41 withOptions:v4 error:&v43];
          id v42 = v43;

          [(BCSURLAction *)self _didActivateBarcodeWithURLPayload];
        }
      }
    }
    goto LABEL_30;
  }
  BOOL v25 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v25) {
    -[BCSURLAction performDefaultActionWithFBOptions:](v25, v26, v27, v28, v29, v30, v31, v32);
  }
LABEL_30:
}

void __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSURLAction: CTCellularPlanManagerCameraScanAction performed successfully", v3, 2u);
  }
}

void __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_102(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    int v7 = [v5 domain];
    if ([v7 isEqualToString:*MEMORY[0x263F320C0]])
    {
      uint64_t v8 = [v6 code];

      if (v8 == 2)
      {
        BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v9) {
          __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_102_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
        }
        [*(id *)(a1 + 32) _openActionInTargetApplicationWithOptions:0];
        goto LABEL_11;
      }
    }
    else
    {
    }
    if (!v6) {
      goto LABEL_11;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_102_cold_2(v6);
  }
LABEL_11:
}

- (void)_openActionInTargetApplicationWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263F01880];
  id v5 = a3;
  id v6 = [v4 defaultWorkspace];
  int v7 = [(BCSURLAction *)self url];
  uint64_t v8 = [(BCSURLAction *)self targetApplication];
  BOOL v9 = [v8 bundleIdentifier];
  id v10 = [v6 operationToOpenResource:v7 usingApplication:v9 uniqueDocumentIdentifier:0 isContentManaged:0 sourceAuditToken:0 userInfo:0 options:v5 delegate:0];

  [v10 start];
}

- (void)performDefaultAction
{
}

- (void)performAction
{
  if ([(NSArray *)self->_appLinks count] > 1)
  {
    [(BCSAction *)self showActionPicker];
  }
  else
  {
    [(BCSAction *)self performActionWithCompletion:&__block_literal_global_106];
  }
}

void __29__BCSURLAction_performAction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __29__BCSURLAction_performAction__block_invoke_cold_1(v2);
  }
}

- (void)_resolveAppClipForURL:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(BCSURLAction *)self url];
  if (!objc_msgSend(v8, "_bcs_isHTTPFamilyURL"))
  {

    goto LABEL_11;
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  BOOL v9 = (uint64_t (*)(void))getCPSClipsFeatureEnabledSymbolLoc_ptr_0;
  v33 = getCPSClipsFeatureEnabledSymbolLoc_ptr_0;
  if (!getCPSClipsFeatureEnabledSymbolLoc_ptr_0)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    BOOL v35 = __getCPSClipsFeatureEnabledSymbolLoc_block_invoke_0;
    uint64_t v36 = &unk_26468ACC8;
    uint64_t v37 = &v30;
    id v10 = (void *)ClipServicesLibrary_0();
    uint64_t v11 = dlsym(v10, "CPSClipsFeatureEnabled");
    *(void *)(v37[1] + 24) = v11;
    getCPSClipsFeatureEnabledSymbolLoc_ptr_0 = *(_UNKNOWN **)(v37[1] + 24);
    BOOL v9 = (uint64_t (*)(void))v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v9) {
    -[BCSURLAction _resolveAppClipForURL:completion:]();
  }
  char v12 = v9();

  if ((v12 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v13 = [(BCSURLAction *)self url];
  uint64_t v14 = [v13 absoluteString];
  int v15 = [v14 hasPrefix:@"https://found.apple.com/airtag?"];

  if (v15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [(BCSURLAction *)self url];
      LODWORD(buf) = 138739971;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSURLAction: detected an Find My URL, skip app clips checking. %{sensitive}@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_11;
  }
  if ((_bcs_isHostAppEntitled() & 1) == 0)
  {
LABEL_11:
    v7[2](v7, 0);
    goto LABEL_12;
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2050000000;
  v17 = (void *)getCPSClipMetadataRequestClass_softClass_0;
  v33 = (void *)getCPSClipMetadataRequestClass_softClass_0;
  if (!getCPSClipMetadataRequestClass_softClass_0)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    BOOL v35 = __getCPSClipMetadataRequestClass_block_invoke_0;
    uint64_t v36 = &unk_26468ACC8;
    uint64_t v37 = &v30;
    __getCPSClipMetadataRequestClass_block_invoke_0((uint64_t)&buf);
    v17 = (void *)v31[3];
  }
  v18 = v17;
  _Block_object_dispose(&v30, 8);
  id v19 = [v18 alloc];
  uint64_t v20 = [(BCSURLAction *)self url];
  uint64_t v21 = (void *)[v19 initWithURL:v20];

  if ([v21 isLikelyAvailable])
  {
    uint64_t v22 = [(BCSURLAction *)self _appclipLaunchReason];
    long long v23 = [v21 sessionConfiguration];
    [v23 setLaunchReason:v22];

    if ([(BCSURLAction *)self _isVisualCode]
      && ([MEMORY[0x263F086E0] mainBundle],
          v24 = objc_claimAutoreleasedReturnValue(),
          [v24 bundleIdentifier],
          BOOL v25 = objc_claimAutoreleasedReturnValue(),
          char v26 = [v25 isEqualToString:@"com.apple.BarcodeScanner"],
          v25,
          v24,
          (v26 & 1) == 0))
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __49__BCSURLAction__resolveAppClipForURL_completion___block_invoke;
      v27[3] = &unk_26468BA38;
      v27[4] = self;
      id v28 = v21;
      uint64_t v29 = v7;
      [v28 requestMetadataWithCompletion:v27];
    }
    else
    {
      [(BCSAction *)self setClipMetadataRequest:v21];
      v7[2](v7, 1);
    }
  }
  else
  {
    v7[2](v7, 0);
  }

LABEL_12:
}

void __49__BCSURLAction__resolveAppClipForURL_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    [*(id *)(a1 + 32) setClipMetadataRequest:*(void *)(a1 + 40)];
  }
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) clipMetadataRequest];
  (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v5 != 0);
}

- (void)determineActionabilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (![(BCSURLAction *)self _tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler:v4])
  {
    id v5 = [(BCSURLAction *)self url];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__BCSURLAction_determineActionabilityWithCompletionHandler___block_invoke;
    v6[3] = &unk_26468BA88;
    v6[4] = self;
    id v7 = v4;
    [(BCSURLAction *)self _resolveAppClipForURL:v5 completion:v6];
  }
}

void __60__BCSURLAction_determineActionabilityWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v12 = 0;
    uint64_t v3 = [objc_alloc((Class)getLSApplicationRecordClass()) initWithBundleIdentifier:@"com.apple.mobilesafari" allowPlaceholder:0 error:&v12];
    id v4 = v12;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v3;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if ([*(id *)(a1 + 32) codeType] == 3 {
         && ([*(id *)(a1 + 32) _allowAppClipCodeUniversalLinkFallback] & 1) == 0)
  }
  {
    BOOL v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v9();
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v7 url];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __60__BCSURLAction_determineActionabilityWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_26468BA60;
    id v11 = *(id *)(a1 + 40);
    [v7 _resolveTargetApplicationForURL:v8 completionHandler:v10];
  }
}

uint64_t __60__BCSURLAction_determineActionabilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BCSURLAction *)self url];
  id v6 = [v5 absoluteString];

  id v7 = [v6 lowercaseString];
  if (([v7 hasPrefix:@"x-esim://"] & 1) != 0
    || [v7 hasPrefix:@"lpa:"])
  {
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v8) {
      -[BCSURLAction _tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2050000000;
    uint64_t v16 = (void *)getCoreTelephonyClientClass_softClass;
    uint64_t v29 = getCoreTelephonyClientClass_softClass;
    if (!getCoreTelephonyClientClass_softClass)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __getCoreTelephonyClientClass_block_invoke;
      v25[3] = &unk_26468ACC8;
      v25[4] = &v26;
      __getCoreTelephonyClientClass_block_invoke((uint64_t)v25);
      uint64_t v16 = (void *)v27[3];
    }
    v17 = v16;
    _Block_object_dispose(&v26, 8);
    v18 = (CoreTelephonyClient *)[[v17 alloc] initWithQueue:0];
    coreTelephonyClient = self->_coreTelephonyClient;
    self->_coreTelephonyClient = v18;

    uint64_t v20 = self->_coreTelephonyClient;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke;
    v23[3] = &unk_26468BAB0;
    v23[4] = self;
    id v24 = v4;
    [(CoreTelephonyClient *)v20 getActionForCardData:v6 completionHandler:v23];

    BOOL v21 = 1;
  }
  else
  {
    if ([(BCSURLAction *)self _isCodeFromQRScanner]) {
      _bcs_isHostAppEntitled();
    }
    BOOL v21 = 0;
  }

  return v21;
}

void __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v7) {
      goto LABEL_3;
    }
  }
  else if (v7)
  {
LABEL_3:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_2(v7);
    }
    uint64_t v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_11;
  }
  v17 = *(id **)(a1 + 32);
  if (!v6)
  {
    v18 = [*(id *)(a1 + 32) url];
    [v17 _resolveTargetApplicationForURL:v18 completionHandler:*(void *)(a1 + 40)];

    goto LABEL_12;
  }
  objc_storeStrong(v17 + 19, a2);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_1((void *)(a1 + 32), 152);
  }
  uint64_t v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_11:
  v16();
LABEL_12:
}

- (BOOL)mustOpenAppLinkInApp
{
  if ([(BCSURLAction *)self _hasCellularPlanAction]) {
    goto LABEL_5;
  }
  NSUInteger v3 = [(NSArray *)self->_appLinks count];
  if (v3)
  {
    if (v3 == 1)
    {
      id v4 = [(NSArray *)self->_appLinks firstObject];
      BOOL v5 = [(BCSURLAction *)self _shouldOpenInAppForAppLink:v4];

      LOBYTE(v3) = v5;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)appLinks
{
  return self->_appLinks;
}

- (unint64_t)appLinkCount
{
  return [(NSArray *)self->_appLinks count];
}

- (void)_resolveTargetApplicationForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v8) {
    -[BCSURLAction _resolveTargetApplicationForURL:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
  if (_bcs_isDeviceLocked()) {
    int v16 = _bcs_isCurrentProcessBarcodeScanner() ^ 1;
  }
  else {
    LOBYTE(v16) = 0;
  }
  self->_BOOL deviceDataIsUnavailable = v16;
  if ([(BCSURLAction *)self _shouldBlockHandlingURL:v6])
  {
    BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v17) {
      -[BCSURLAction _resolveTargetApplicationForURL:completionHandler:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    v7[2](v7, 0);
  }
  else if (_bcs_isHostAppEntitled())
  {
    BOOL v25 = [(BCSURLAction *)self _requiresOpenInTargetApplication];
    if (v25)
    {
      objc_storeStrong((id *)&self->_userVisibleAppRecord, v25);
      v7[2](v7, 1);
    }
    else
    {
      id LSAppLinkClass = getLSAppLinkClass();
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke;
      v27[3] = &unk_26468BAD8;
      v27[4] = self;
      uint64_t v29 = v7;
      id v28 = v6;
      [LSAppLinkClass getAppLinksWithURL:v28 completionHandler:v27];
    }
  }
  else
  {
    [(BCSURLAction *)self _queryApplicationRecordForURL:v6 completionHandler:v7];
  }
}

void __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (![v4 count]) {
    goto LABEL_13;
  }
  uint64_t v5 = [v4 copy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v5;

  BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v8) {
    __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  int v16 = [*(id *)(a1 + 32) preferredBundleID];
  *(unsigned char *)(*(void *)(a1 + 32) + 160) = v16 != 0;
  uint64_t v17 = +[BCSAppRanker orderAppLinks:*(void *)(*(void *)(a1 + 32) + 104) forLastUsedApp:v16];
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 104);
  *(void *)(v18 + 104) = v17;

  uint64_t v20 = *(unsigned __int8 **)(a1 + 32);
  int v21 = v20[128];
  if (!v20[128])
  {
    if ((unint64_t)[v4 count] > 1) {
      goto LABEL_20;
    }
    BOOL v25 = *(void **)(a1 + 32);
    id v2 = [v4 firstObject];
    if ([v25 _shouldOpenInAppForAppLink:v2])
    {

      goto LABEL_20;
    }
    uint64_t v20 = *(unsigned __int8 **)(a1 + 32);
    if (!v20[128]) {
      goto LABEL_11;
    }
  }
  if (![v20 _allowAppClipCodeUniversalLinkFallback] || objc_msgSend(v4, "count") != 1)
  {
    if (!v21) {
LABEL_11:
    }

LABEL_12:
LABEL_13:
    [*(id *)(a1 + 32) _queryApplicationRecordForURL:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    goto LABEL_23;
  }
  uint64_t v22 = *(void **)(a1 + 32);
  uint64_t v23 = [v4 firstObject];
  int v24 = [v22 _shouldOpenInAppForAppLink:v23];

  if (v21)
  {
    if (v24) {
      goto LABEL_20;
    }
    goto LABEL_12;
  }

  if ((v24 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_20:
  uint64_t v26 = [*(id *)(*(void *)(a1 + 32) + 104) firstObject];
  uint64_t v27 = [v26 targetApplicationRecord];
  uint64_t v28 = *(void *)(a1 + 32);
  uint64_t v29 = *(void **)(v28 + 112);
  *(void *)(v28 + 112) = v27;

  BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v30) {
    __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke_cold_1(v30, v31, v32, v33, v34, v35, v36, v37);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_23:
}

- (void)_queryApplicationRecordForURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  BOOL v8 = [getLSApplicationWorkspaceClass() defaultWorkspace];
  uint64_t v9 = [v8 URLOverrideForURL:v6];

  if (_bcs_isHostAppEntitled())
  {
    uint64_t v10 = [getLSApplicationWorkspaceClass() defaultWorkspace];
    uint64_t v11 = [v10 applicationsAvailableForOpeningURL:v9];
    v69 = self;
    if (objc_msgSend(v9, "_bcs_isUPIURL") && (unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      v67 = v9;
      v64 = v7;
      id v65 = v6;
      uint64_t v12 = [MEMORY[0x263EFF980] array];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      v63 = v11;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v73 objects:v79 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v74;
        uint64_t v17 = &_os_log_internal;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v74 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v19 = *(void **)(*((void *)&v73 + 1) + 8 * v18);
            id v20 = objc_alloc((Class)getLSApplicationRecordClass());
            int v21 = [v19 bundleIdentifier];
            id v72 = 0;
            uint64_t v22 = (void *)[v20 initWithBundleIdentifier:v21 allowPlaceholder:1 error:&v72];
            id v23 = v72;

            if (v23 || !v22)
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                -[BCSURLAction _queryApplicationRecordForURL:completionHandler:].cold.6(v77, v23, &v78);
              }
            }
            else
            {
              [v12 addObject:v22];
            }

            ++v18;
          }
          while (v15 != v18);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v73 objects:v79 count:16];
        }
        while (v15);
      }

      if ((unint64_t)[v12 count] < 2)
      {
        uint64_t v27 = 0;
        id v7 = v64;
        id v6 = v65;
        uint64_t v9 = v67;
        self = v69;
      }
      else
      {
        self = v69;
        int v24 = [(BCSURLAction *)v69 preferredBundleID];
        uint64_t v25 = +[BCSAppRanker orderApplicationRecords:v12 forPreferredBundleID:v24];
        upiApplicationRecords = v69->_upiApplicationRecords;
        v69->_upiApplicationRecords = (NSArray *)v25;

        uint64_t v27 = [(NSArray *)v69->_upiApplicationRecords firstObject];
        id v7 = v64;
        id v6 = v65;
        uint64_t v9 = v67;
      }

      uint64_t v11 = v63;
    }
    else
    {
      uint64_t v27 = 0;
    }
    uint64_t v28 = [v11 firstObject];
    uint64_t v29 = (void *)v28;
    if (v27 || !v28)
    {
LABEL_33:
      uint64_t v38 = [(BCSAction *)self data];
      uint64_t v39 = [v38 type];

      if (v39 == 12 || v39 == 9)
      {
        BOOL v40 = v27 != 0;
      }
      else
      {
        BOOL v40 = v27 != 0;
        if (!objc_msgSend(v6, "_bcs_hasScheme:", @"airplay") && v27)
        {
          if (([v10 isApplicationAvailableToOpenURL:v9 includePrivateURLSchemes:0 error:0] & 1) == 0)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
              -[BCSURLAction _queryApplicationRecordForURL:completionHandler:].cold.4(v9);
            }
            goto LABEL_63;
          }
          BOOL v40 = 1;
        }
      }
      if (v69->_deviceDataIsUnavailable)
      {
        if ([v27 developerType] == 1
          && ([v27 applicationState],
              uint64_t v41 = objc_claimAutoreleasedReturnValue(),
              char v42 = [v41 isRemovedSystemApp],
              v41,
              (v42 & 1) == 0))
        {
          v61 = v27;
          userVisibleAppRecord = v69->_userVisibleAppRecord;
          v69->_userVisibleAppRecord = v61;
          uint64_t v47 = (uint64_t)v69;
        }
        else
        {
          uint64_t v43 = [(NSArray *)v69->_appLinks count];
          if (v43) {
            BOOL v44 = 0;
          }
          else {
            BOOL v44 = v40;
          }
          if (v44)
          {
            uint64_t v45 = [v27 applicationState];
            char v46 = [v45 isInstalled];

            uint64_t v47 = (uint64_t)v69;
            if (v46)
            {
LABEL_56:
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
                -[BCSURLAction _queryApplicationRecordForURL:completionHandler:](v47, (uint64_t)v6);
              }
LABEL_58:
              uint64_t v62 = 1;
LABEL_64:
              v7[2](v7, v62);

              goto LABEL_65;
            }
          }
          else
          {
            uint64_t v47 = (uint64_t)v69;
            if (v43) {
              goto LABEL_56;
            }
          }
          v57 = NSURL;
          userVisibleAppRecord = [v9 scheme];
          uint64_t v59 = objc_msgSend(v57, "_bcs_appStoreSearchURLWithScheme:", userVisibleAppRecord);
          v60 = *(void **)(v47 + 136);
          *(void *)(v47 + 136) = v59;
        }
        goto LABEL_56;
      }
      objc_storeStrong((id *)&v69->_userVisibleAppRecord, v27);
      uint64_t v48 = v69->_userVisibleAppRecord;
      BOOL v49 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v48)
      {
        if (v49) {
          -[BCSURLAction _queryApplicationRecordForURL:completionHandler:](v49, v50, v51, v52, v53, v54, v55, v56);
        }
        goto LABEL_58;
      }
      if (v49) {
        -[BCSURLAction _queryApplicationRecordForURL:completionHandler:](v49, v50, v51, v52, v53, v54, v55, v56);
      }
LABEL_63:
      uint64_t v62 = 0;
      goto LABEL_64;
    }
    BOOL v30 = v11;
    id v31 = objc_alloc((Class)getLSApplicationRecordClass());
    uint64_t v32 = [v29 bundleIdentifier];
    id v71 = 0;
    uint64_t v33 = (void *)[v31 initWithBundleIdentifier:v32 allowPlaceholder:1 error:&v71];
    id v34 = v71;

    if (v34)
    {
      v66 = v10;
      v68 = v9;
      id v35 = objc_alloc((Class)getLSApplicationRecordClass());
      uint64_t v36 = [v29 bundleIdentifier];
      id v70 = v34;
      uint64_t v27 = (void *)[v35 initWithBundleIdentifierOfSystemPlaceholder:v36 error:&v70];
      id v37 = v70;

      if (v37)
      {
        uint64_t v10 = v66;
        uint64_t v11 = v30;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BCSURLAction _queryApplicationRecordForURL:completionHandler:].cold.5(v37);
        }

        uint64_t v9 = v68;
        goto LABEL_32;
      }
      uint64_t v10 = v66;
      uint64_t v9 = v68;
    }
    else
    {
      uint64_t v27 = v33;
    }
    uint64_t v11 = v30;
LABEL_32:
    self = v69;
    goto LABEL_33;
  }
  v7[2](v7, 1);
LABEL_65:
}

- (LSApplicationRecord)targetApplication
{
  return self->_userVisibleAppRecord;
}

- (id)preferredBundleID
{
  id v2 = [(BCSAction *)self data];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v3 = [v2 preferredBundleID];
  }
  else
  {
    NSUInteger v3 = 0;
  }

  return v3;
}

- (BOOL)_allowAppClipCodeUniversalLinkFallback
{
  if ([(BCSAction *)self codeType] != 3) {
    return 0;
  }
  return [(BCSURLAction *)self isApplePayInitiateAction];
}

- (id)_requiresOpenInTargetApplication
{
  if ([(BCSURLAction *)self isApplePayInitiateAction]
    && [(BCSAction *)self codeType] != 3)
  {
    NSUInteger v3 = (void *)[objc_alloc((Class)getLSApplicationRecordClass()) initWithBundleIdentifier:@"com.apple.mobilesafari" allowPlaceholder:0 error:0];
  }
  else
  {
    NSUInteger v3 = 0;
  }
  return v3;
}

- (id)_actionDescriptionForAppClip
{
  NSUInteger v3 = [(BCSAction *)self clipMetadataRequest];
  id v4 = [v3 getClipMetadataSynchronously];

  uint64_t v5 = [(BCSAction *)self detectedCode];

  if (v5)
  {
    uint64_t v6 = [v4 clipName];
  }
  else
  {
    if ([v4 isPoweredByThirdParty])
    {
      id v7 = NSString;
      BOOL v8 = _BCSLocalizedString(@"%@\nPowered by %@", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      uint64_t v9 = [v4 clipCaption];
      uint64_t v10 = [v4 fullAppName];
      uint64_t v11 = objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);

      goto LABEL_7;
    }
    uint64_t v6 = [v4 clipCaption];
  }
  uint64_t v11 = (void *)v6;
LABEL_7:

  return v11;
}

- (id)_actionDescriptionForURL:(id)a3 application:(id)a4 shouldShowHostNameForSafariURL:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 bundleIdentifier];
  uint64_t v11 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v12 = [v11 bundleIdentifier];

  int v13 = [v12 isEqualToString:v10];
  if (v5 && [v10 isEqualToString:@"com.apple.mobilesafari"])
  {
    uint64_t v14 = objc_msgSend(v8, "_bcs_displayString");
    if ([v14 length])
    {
      if (v13)
      {
        uint64_t v15 = NSString;
        uint64_t v16 = _BCSLocalizedString(@"Open “%@”", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
        objc_msgSend(v15, "stringWithFormat:", v16, v14);
        uint64_t v19 = LABEL_11:;
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      int v24 = [(BCSAction *)self clipMetadataRequest];

      if (!v24)
      {
        uint64_t v16 = [v9 localizedName];
        uint64_t v26 = NSString;
        uint64_t v27 = _BCSLocalizedString(@"Open “%@” in %@", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
        uint64_t v19 = objc_msgSend(v26, "stringWithFormat:", v27, v14, v16);

        goto LABEL_12;
      }
      uint64_t v22 = [(BCSURLAction *)self _actionDescriptionForAppClip];
LABEL_24:
      uint64_t v19 = (void *)v22;
      goto LABEL_13;
    }
  }
  if (([v10 isEqualToString:@"com.apple.AppStore"] & 1) != 0
    || [v10 isEqualToString:@"com.apple.MobileStore"])
  {
    uint64_t v17 = NSString;
    uint64_t v18 = @"View in %@";
LABEL_10:
    uint64_t v14 = _BCSLocalizedString(v18, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    uint64_t v16 = [v9 localizedName];
    objc_msgSend(v17, "stringWithFormat:", v14, v16);
    goto LABEL_11;
  }
  if (v13)
  {
    int v21 = NSString;
    uint64_t v14 = _BCSLocalizedString(@"Open", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    uint64_t v22 = [v21 stringWithFormat:v14];
    goto LABEL_24;
  }
  if (objc_msgSend(v8, "_bcs_isOtpauthURL"))
  {
    if (![v10 isEqualToString:@"com.apple.Preferences"])
    {
      uint64_t v17 = NSString;
      uint64_t v18 = @"Add Verification Code in “%@”";
      goto LABEL_10;
    }
    id v23 = @"Add Verification Code in Passwords";
    goto LABEL_28;
  }
  if (objc_msgSend(v8, "_bcs_isOtpauthMigrationURL"))
  {
    if (![v10 isEqualToString:@"com.apple.Preferences"])
    {
      uint64_t v17 = NSString;
      uint64_t v18 = @"Add Verification Codes in “%@”";
      goto LABEL_10;
    }
    id v23 = @"Add Verification Codes in Passwords";
LABEL_28:
    uint64_t v25 = _BCSLocalizedString(v23, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    goto LABEL_33;
  }
  uint64_t v28 = [(BCSURLAction *)self url];
  int v29 = objc_msgSend(v28, "_bcs_isUPIURL");

  if (!v29)
  {
    uint64_t v17 = NSString;
    uint64_t v18 = @"Open in %@";
    goto LABEL_10;
  }
  uint64_t v25 = [v9 localizedName];
LABEL_33:
  uint64_t v19 = (void *)v25;
LABEL_14:

  return v19;
}

- (id)_actionDescriptionWithoutTargetApplicationForURL:(id)a3
{
  NSUInteger v3 = objc_msgSend(a3, "_bcs_displayString");
  if ([v3 length])
  {
    id v4 = NSString;
    BOOL v5 = _BCSLocalizedString(@"Open “%@” link", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    uint64_t v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);
  }
  else
  {
    uint64_t v6 = _BCSLocalizedString(@"Open Link", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  }

  return v6;
}

- (BOOL)_shouldOpenInAppForAppLink:(id)a3
{
  uint64_t v3 = [a3 openStrategy];
  if (v3 == 2) {
    return 1;
  }
  if (v3 == 1) {
    return _bcs_isCurrentProcessSafari() ^ 1;
  }
  return 0;
}

- (BOOL)_shouldBlockHandlingURL:(id)a3
{
  uint64_t v3 = [a3 scheme];
  id v4 = [v3 lowercaseString];

  LOBYTE(v3) = [v4 isEqualToString:@"data"];
  return (char)v3;
}

- (BOOL)_isCodeFromQRScanner
{
  uint64_t v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 bundleIdentifier];

  BOOL v5 = ([v4 isEqualToString:@"com.apple.BarcodeScanner"] & 1) != 0
    || [(BCSURLAction *)self _isVisualCode];

  return v5;
}

- (BOOL)_isVisualCode
{
  id v2 = [(BCSAction *)self codePayload];
  uint64_t v3 = v2;
  if (v2) {
    BOOL v4 = [v2 codeType] == 1 || objc_msgSend(v3, "codeType") == 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isAMSAction
{
  id v2 = [(BCSURLAction *)self url];
  uint64_t v3 = [v2 host];
  BOOL v4 = [&unk_26D6118F8 objectForKeyedSubscript:v3];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)contentPreviewString
{
  if ([(BCSURLAction *)self _willOpenInSafari])
  {
    uint64_t v3 = [(BCSURLAction *)self url];
    BOOL v4 = [v3 absoluteString];
  }
  else
  {
    char v5 = [(BCSAction *)self clipMetadataRequest];

    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)BCSURLAction;
      BOOL v4 = [(BCSAction *)&v7 contentPreviewString];
    }
  }
  return v4;
}

- (id)_menuElementForActionPicker:(id)a3
{
  id v3 = a3;
  id UIActionClass = getUIActionClass();
  char v5 = [v3 label];
  uint64_t v6 = [v3 icon];
  objc_super v7 = [v3 label];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__BCSURLAction__menuElementForActionPicker___block_invoke;
  void v11[3] = &unk_26468AEB8;
  id v12 = v3;
  id v8 = v3;
  id v9 = [UIActionClass actionWithTitle:v5 image:v6 identifier:v7 handler:v11];

  return v9;
}

uint64_t __44__BCSURLAction__menuElementForActionPicker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction];
}

- (id)menuElements
{
  v20[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(BCSAction *)self detectedCode];
  if (v3
    && (BOOL v4 = (void *)v3,
        [(BCSURLAction *)self url],
        char v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = objc_msgSend(v5, "_bcs_isUPIURL"),
        v5,
        v4,
        v6))
  {
    objc_super v7 = [BCSCopyActionPickerItem alloc];
    id v8 = [(BCSURLAction *)self url];
    id v9 = [(BCSCopyActionPickerItem *)v7 initWithAction:self urlToCopy:v8];

    uint64_t v10 = [[BCSShareActionPickerItem alloc] initWithAction:self];
    uint64_t v11 = [(BCSURLAction *)self _menuElementForActionPicker:v9];
    v20[0] = v11;
    id v12 = [(BCSURLAction *)self _menuElementForActionPicker:v10];
    v20[1] = v12;
    int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];

    uint64_t v14 = [getUIMenuClass() menuWithTitle:&stru_26D608FC8 image:0 identifier:0 options:1 children:v13];
    v19.receiver = self;
    v19.super_class = (Class)BCSURLAction;
    uint64_t v15 = [(BCSAction *)&v19 menuElements];
    uint64_t v16 = [v15 arrayByAddingObject:v14];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)BCSURLAction;
    uint64_t v16 = [(BCSAction *)&v18 menuElements];
  }
  return v16;
}

- (unint64_t)menuElementsCount
{
  uint64_t v3 = [(BCSAction *)self detectedCode];
  if (v3
    && (BOOL v4 = (void *)v3,
        [(BCSURLAction *)self url],
        char v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = objc_msgSend(v5, "_bcs_isUPIURL"),
        v5,
        v4,
        v6))
  {
    objc_super v7 = [(BCSURLAction *)self menuElements];
    unint64_t v8 = [v7 count];

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BCSURLAction;
    return [(BCSAction *)&v10 menuElementsCount];
  }
}

- (BOOL)isPasskeyAction
{
  if ([(BCSURLAction *)self isPasskeyAssertionAction]) {
    return 1;
  }
  return [(BCSURLAction *)self isPasskeyRegistrationAction];
}

- (BOOL)isPasskeyAssertionAction
{
  return [(BCSAction *)self payloadDataType] == 13;
}

- (BOOL)isPasskeyRegistrationAction
{
  return [(BCSAction *)self payloadDataType] == 14;
}

- (BOOL)isApplePayInitiateAction
{
  return [(BCSAction *)self payloadDataType] == 16;
}

- (id)_passkeyAssertionActionDescription
{
  return _BCSLocalizedString(@"Sign in with a passkey", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
}

- (id)_passkeyRegistrationActionDescription
{
  return _BCSLocalizedString(@"Save a passkey", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
}

- (id)_applePayActionDescription
{
  return @"Apple Pay";
}

- (BOOL)hasPreferredAppLink
{
  return self->_hasPreferredAppLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularPlanAction, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_appStoreSearchURLForUnsupportedScheme, 0);
  objc_storeStrong((id *)&self->_upiApplicationRecords, 0);
  objc_storeStrong((id *)&self->_userVisibleAppRecord, 0);
  objc_storeStrong((id *)&self->_appLinks, 0);
}

- (void)shortDescription
{
  v1 = [a1 targetApplication];
  id v2 = [v1 bundleIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v3, "BCSURLAction: we shouldn't show the non system app name in lock screen for bundle ID: %{private}@", v4, v5, v6, v7, v8);
}

- (void)actionPickerItems
{
}

- (void)_appclipLaunchReason
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getCPSSessionLaunchReasonNFC(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSURLAction.m", 88, @"%s", dlerror());

  __break(1u);
}

- (void)performActionWithOptions:(void *)a1 completion:.cold.1(void *a1)
{
  v1 = [a1 targetApplication];
  id v2 = [v1 bundleIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v3, "BCSURLAction: cannot open app [%@] with sensitive URL.", v4, v5, v6, v7, v8);
}

- (void)performDefaultActionWithFBOptions:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v2, "BCSURLAction: Error performing CTCellularPlanManagerCameraScanAction: %{public}@", v3, v4, v5, v6, v7);
}

void __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_102_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_102_cold_2(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v2, "BCSURLAction: Error performing app clip open action: %{public}@", v3, v4, v5, v6, v7);
}

void __29__BCSURLAction_performAction__block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v2, "BSURLAction: performActionWithCompletion failed with error: %{public}@", v3, v4, v5, v6, v7);
}

- (void)_resolveAppClipForURL:completion:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"BOOL _CPSClipsFeatureEnabled(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSURLAction.m", 89, @"%s", dlerror());

  __break(1u);
}

- (void)_tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*a1 + a2);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BCSURLAction: got CTCellularPlanQRCodeAction %{private}@", (uint8_t *)&v3, 0xCu);
}

void __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_2(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v2, "BCSURLAction: error getting CTCellularPlanQRCodeAction: %{public}@", v3, v4, v5, v6, v7);
}

void __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_resolveTargetApplicationForURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_resolveTargetApplicationForURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queryApplicationRecordForURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queryApplicationRecordForURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queryApplicationRecordForURL:(uint64_t)a1 completionHandler:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 112) bundleIdentifier];
  OUTLINED_FUNCTION_1();
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BCSURLAction: Device is locked when resolving target application with bundleID %{private}@ for URL %{private}@", v4, 0x16u);
}

- (void)_queryApplicationRecordForURL:(void *)a1 completionHandler:.cold.4(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1 = [a1 scheme];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BCSURLAction: Ignoring resolved URL with private scheme '%{private}@'", v2, 0xCu);
}

- (void)_queryApplicationRecordForURL:(void *)a1 completionHandler:.cold.5(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v2, "BCSURLAction: Failed to get application record %{public}@", v3, v4, v5, v6, v7);
}

- (void)_queryApplicationRecordForURL:(void *)a3 completionHandler:.cold.6(uint8_t *a1, void *a2, void *a3)
{
  uint64_t v5 = objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  *(_DWORD *)a1 = 138543362;
  *a3 = v5;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSURLAction: Failed to get application record %{public}@", a1, 0xCu);
}

@end