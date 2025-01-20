@interface BCSNotification
+ (id)_tlAlertConfiguration;
+ (id)notificationForAction:(id)a3;
+ (id)tempVCardFileURL;
+ (void)tempVCardFileURL;
- (BOOL)_contentIsPreviewable;
- (BOOL)_shouldHandleActionPickerItemLocally:(id)a3;
- (BOOL)_shouldManuallyRequireAuthenticationForURL:(id)a3;
- (BOOL)_shouldRequireUserToPickTargetApp;
- (BOOL)_shouldScheduleBackgroundActionForLaunchBundleID:(id)a3;
- (BOOL)canHandleActionLocally;
- (BOOL)shouldHandleBulletinActionWithIdentifier:(id)a3;
- (BOOL)shouldSkipBanner;
- (NSString)identifier;
- (UNNotificationRequest)request;
- (id)_actionDescriptionString;
- (id)_actionTypeStringForNFC;
- (id)_actionTypeStringForQRCode;
- (id)_attachmentIconURL;
- (id)_content;
- (id)_contentExtensionData;
- (id)_defaultURL;
- (id)_fbOptionsHandlingUnlockIfNecessary;
- (id)_initWithAction:(id)a3;
- (id)_notificationActionFromActionPickerItem:(id)a3;
- (id)_orderAppLinkActionsByRecency:(id)a3;
- (id)_pickerLabelForURLActionPickerItem:(id)a3;
- (id)_supplementActions;
- (id)_title;
- (int)requestingProcessID;
- (int64_t)codeType;
- (void)_content;
- (void)_fbOptionsHandlingUnlockIfNecessary;
- (void)_handleCalendarEventWithICSString:(id)a3;
- (void)_handleContactInfo:(id)a3;
- (void)_performActionAfterUnlock:(id)a3;
- (void)_showAppPickerAlertWithFBOptions:(id)a3;
- (void)didHandleBulletinActionWithIdentifier:(id)a3;
- (void)handleActionWithIdentifier:(id)a3 notificationResponseOriginID:(id)a4;
- (void)setRequestingProcessID:(int)a3;
@end

@implementation BCSNotification

+ (id)notificationForAction:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithAction:v4];

  return v5;
}

- (id)_initWithAction:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSNotification;
  v6 = [(BCSNotification *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    localActions = v7->_localActions;
    v7->_localActions = (NSMutableDictionary *)v8;

    v10 = v7;
  }

  return v7;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    id v4 = [MEMORY[0x263F08C38] UUID];
    id v5 = [v4 UUIDString];
    v6 = self->_identifier;
    self->_identifier = v5;

    identifier = self->_identifier;
  }
  return identifier;
}

- (int64_t)codeType
{
  return [(BCSAction *)self->_action codeType];
}

- (id)_title
{
  v3 = [(BCSAction *)self->_action localizedDefaultActionTitle];
  uint64_t v4 = [v3 length];

  action = self->_action;
  if (v4)
  {
    v3 = [(BCSAction *)action localizedDefaultActionTitle];
    goto LABEL_15;
  }
  uint64_t v6 = [(BCSAction *)action codeType];
  switch(v6)
  {
    case 3:
      v7 = [(BCSNotification *)self _actionTypeStringForQRCode];
      if (![v7 length])
      {
        uint64_t v8 = @"App Clip Code Detected";
        goto LABEL_13;
      }
      break;
    case 2:
      v7 = [(BCSNotification *)self _actionTypeStringForNFC];
      if (![v7 length])
      {
        uint64_t v8 = @"NFC Tag Detected";
        goto LABEL_13;
      }
      break;
    case 1:
      v7 = [(BCSNotification *)self _actionTypeStringForQRCode];
      if (![v7 length])
      {
        uint64_t v8 = @"QR Code Detected";
LABEL_13:
        _BCSLocalizedString(v8, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      break;
    default:
      goto LABEL_15;
  }
  id v9 = v7;
LABEL_14:
  v3 = v9;

LABEL_15:
  return v3;
}

- (BOOL)shouldSkipBanner
{
  if ([(BCSAction *)self->_action codeType] != 2) {
    return 0;
  }
  v3 = [(BCSAction *)self->_action clipMetadataRequest];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_actionTypeStringForNFC
{
  v2 = [(BCSAction *)self->_action defaultActionTargetApplicationBundleIdentifier];
  v3 = v2;
  if (v2)
  {
    if ([v2 isEqualToString:@"com.apple.mobilesafari"])
    {
      BOOL v4 = _BCSLocalizedString(@"Website NFC Tag", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    }
    else
    {
      id v5 = [getLSApplicationProxyClass() applicationProxyForIdentifier:v3];
      uint64_t v6 = NSString;
      v7 = _BCSLocalizedString(@"%@ NFC Tag", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      uint64_t v8 = [v5 localizedName];
      BOOL v4 = objc_msgSend(v6, "stringWithFormat:", v7, v8);
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_actionTypeStringForQRCode
{
  v3 = [(BCSAction *)self->_action data];
  uint64_t v4 = [v3 type];

  if (v4 == 10)
  {
    id v5 = @"Text QR Code";
LABEL_16:
    uint64_t v8 = _BCSLocalizedString(v5, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    goto LABEL_17;
  }
  if (v4 == 8)
  {
    if (MGGetBoolAnswer()) {
      id v5 = @"WLAN QR Code";
    }
    else {
      id v5 = @"Wi-Fi QR Code";
    }
    goto LABEL_16;
  }
  if ((_bcs_isDeviceLocked() & 1) == 0
    && [(BCSNotification *)self _shouldRequireUserToPickTargetApp])
  {
    id v5 = @"App QR Code";
    goto LABEL_16;
  }
  uint64_t v6 = [(BCSAction *)self->_action clipMetadataRequest];

  action = self->_action;
  if (v6)
  {
    if ([(BCSAction *)action codeType] == 3) {
      id v5 = @"App Clip Code";
    }
    else {
      id v5 = @"App Clip QR Code";
    }
    goto LABEL_16;
  }
  if ([(BCSAction *)action isPasskeyAction])
  {
    id v5 = @"Passkey QR Code";
    goto LABEL_16;
  }
  v10 = [(BCSAction *)self->_action defaultActionTargetApplicationBundleIdentifier];
  if (v10)
  {
    if ([(BCSAction *)self->_action isAMSAction])
    {
      v11 = @"Apple QR Code";
    }
    else
    {
      if (![v10 isEqualToString:@"com.apple.mobilesafari"])
      {
        objc_super v12 = [getLSApplicationProxyClass() applicationProxyForIdentifier:v10];
        v13 = NSString;
        v14 = _BCSLocalizedString(@"%@ QR Code", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
        v15 = [v12 localizedName];
        uint64_t v8 = objc_msgSend(v13, "stringWithFormat:", v14, v15);

        goto LABEL_28;
      }
      v11 = @"Website QR Code";
    }
    uint64_t v8 = _BCSLocalizedString(v11, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_28:

LABEL_17:
  return v8;
}

- (id)_actionDescriptionString
{
  if ((_bcs_isDeviceLocked() & 1) != 0
    || ![(BCSNotification *)self _shouldRequireUserToPickTargetApp])
  {
    v7 = [(BCSAction *)self->_action localizedDefaultActionDescription];
  }
  else
  {
    v3 = NSString;
    uint64_t v4 = _BCSLocalizedString(@"Open “%@” in App", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    id v5 = [(BCSAction *)self->_action url];
    uint64_t v6 = objc_msgSend(v5, "_bcs_displayString");
    v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);
  }
  return v7;
}

- (id)_supplementActions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = self->_action;
    if ((unint64_t)[(BCSAction *)v3 appLinkCount] >= 2 && (_bcs_isDeviceLocked() & 1) != 0
      || ([(BCSAction *)self->_action clipMetadataRequest],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {

      id v5 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v6 = [(BCSAction *)self->_action actionPickerItems];
  id v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = -[BCSNotification _notificationActionFromActionPickerItem:](self, "_notificationActionFromActionPickerItem:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

LABEL_17:
  return v5;
}

- (BOOL)shouldHandleBulletinActionWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(BCSNotification *)self identifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 isEqualToString:v5],
        v5,
        (v6 & 1) == 0))
  {
    id v7 = [(NSMutableDictionary *)self->_localActions objectForKeyedSubscript:v4];
  }
  else
  {
    id v7 = 0;
  }
  BOOL v8 = [(BCSNotification *)self _shouldHandleActionPickerItemLocally:v7];

  return v8;
}

- (BOOL)_shouldHandleActionPickerItemLocally:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    char v6 = [v4 actionURL];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v7 = objc_msgSend(v6, "_bcs_isDataDetectorURL");
          goto LABEL_14;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v5;
          uint64_t v9 = [v8 appLink];
          if (v9)
          {
            char v7 = 1;
          }
          else
          {
            uint64_t v10 = [v8 actionURL];
            char v7 = objc_msgSend(v10, "_bcs_isUPIURL");
          }
          goto LABEL_14;
        }
      }
      char v7 = 0;
    }
    else
    {
      char v7 = 1;
    }
LABEL_14:

    goto LABEL_15;
  }
  char v7 = [(BCSNotification *)self canHandleActionLocally];
LABEL_15:

  return v7;
}

- (id)_notificationActionFromActionPickerItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 actionURL];
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  unsigned __int8 v7 = objc_opt_isKindOfClass();
  unsigned __int8 v8 = v7;
  if (!v5 && (isKindOfClass & 1) == 0 && (v7 & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v10 = [v4 label];
  v11 = [(BCSNotification *)self _actionDescriptionString];
  if ([v10 isEqualToString:v11])
  {
    BOOL v12 = [(BCSNotification *)self _contentIsPreviewable];

    if (!v12)
    {
LABEL_4:
      uint64_t v9 = 0;
      goto LABEL_21;
    }
  }
  else
  {
  }
  BOOL v13 = [(BCSNotification *)self _shouldHandleActionPickerItemLocally:v4];
  long long v14 = [MEMORY[0x263F08C38] UUID];
  long long v15 = [v14 UUIDString];

  if (v13)
  {
    if ((isKindOfClass | v8)) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = 4;
    }
    [(NSMutableDictionary *)self->_localActions setObject:v4 forKey:v15];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[BCSNotification _notificationActionFromActionPickerItem:]((uint64_t)v5, v4);
    }
    goto LABEL_19;
  }
  id v17 = v5;
  uint64_t v16 = [(BCSNotification *)self _shouldManuallyRequireAuthenticationForURL:v17];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    -[BCSNotification _notificationActionFromActionPickerItem:]();
    if (v17) {
      goto LABEL_17;
    }
LABEL_19:
    v20 = (void *)MEMORY[0x263F1DF10];
    id v17 = [v4 label];
    uint64_t v9 = [v20 actionWithIdentifier:v15 title:v17 options:v16];
    goto LABEL_20;
  }
  if (!v17) {
    goto LABEL_19;
  }
LABEL_17:
  v18 = (void *)MEMORY[0x263F1DF10];
  uint64_t v19 = [v4 label];
  uint64_t v9 = [v18 actionWithIdentifier:v15 title:v19 url:v17 options:v16];

LABEL_20:
LABEL_21:

  return v9;
}

- (BOOL)_contentIsPreviewable
{
  v3 = [(BCSAction *)self->_action extraPreviewText];
  uint64_t v4 = [v3 length];

  if (v4) {
    return 1;
  }
  if (_bcs_isDeviceLocked()) {
    return 0;
  }
  char v6 = [(BCSAction *)self->_action clipMetadataRequest];

  if (v6) {
    return 0;
  }
  unsigned __int8 v8 = [(BCSAction *)self->_action defaultActionTargetApplicationBundleIdentifier];
  if ([v8 isEqualToString:@"com.apple.mobilesafari"]) {
    char v5 = 1;
  }
  else {
    char v5 = [v8 isEqualToString:@"com.apple.Maps"];
  }

  return v5;
}

- (id)_contentExtensionData
{
  BOOL v3 = [(BCSNotification *)self _contentIsPreviewable];
  uint64_t v4 = [(BCSNotification *)self _supplementActions];
  if ([v4 count] || v3)
  {
    char v6 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    unsigned __int8 v7 = self->_action;
    unsigned __int8 v8 = [(BCSAction *)v7 url];
    if (v8) {
      [v6 encodeObject:v8 forKey:BCSBarcodeNotificationPayloadURLKey];
    }
    uint64_t v9 = [(BCSAction *)v7 extraPreviewText];

    if (v9)
    {
      uint64_t v10 = [(BCSAction *)v7 extraPreviewText];
      [v6 encodeObject:v10 forKey:BCSBarcodeNotificationPayloadExtraPreviewText];
    }
    v11 = [(BCSNotification *)self _actionDescriptionString];
    if ([v11 length])
    {
      [v6 encodeObject:v11 forKey:BCSBarcodeNotificationPayloadPreviewFooterTitleKey];
      if (objc_msgSend(v8, "_bcs_isHTTPFamilyURL"))
      {
        BOOL v12 = objc_msgSend(v8, "_bcs_fullURLDisplayString");
        [v6 encodeObject:v12 forKey:BCSBarcodeNotificationPayloadPreviewFooterSubtitleKey];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v13 = self->_action;
      long long v14 = [(BCSAction *)v13 contact];

      if (v14)
      {
        long long v15 = [(BCSAction *)v13 contact];
        [v6 encodeObject:v15 forKey:BCSBarcodeNotificationPayloadContactKey];
      }
      uint64_t v16 = [(BCSAction *)v13 icsString];

      if (v16)
      {
        id v17 = [(BCSAction *)v13 icsString];
        [v6 encodeObject:v17 forKey:BCSBarcodeNotificationPayloadICSStringKey];
      }
      v18 = [(BCSAction *)v13 scannerResult];

      if (v18)
      {
        uint64_t v19 = [(BCSAction *)v13 scannerResult];
        [v6 encodeObject:v19 forKey:BCSBarcodeNotificationPayloadScannerResultKey];
      }
    }
    if ([v4 count]) {
      [v6 encodeObject:v4 forKey:BCSBarcodeNotificationPayloadActionsKey];
    }
    v20 = [NSNumber numberWithBool:v3];
    [v6 encodeObject:v20 forKey:BCSBarcodeNotificationPayloadContentIsPreviewableKey];

    char v5 = [v6 encodedData];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_defaultURL
{
  BOOL v3 = [(BCSAction *)self->_action actionPickerItems];
  uint64_t v4 = [v3 firstObject];
  char v5 = [v4 actionURL];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [(BCSAction *)self->_action url];
  }
  unsigned __int8 v7 = v6;

  return v7;
}

- (BOOL)canHandleActionLocally
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v3 = [(BCSAction *)self->_action clipMetadataRequest];

    if (!v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = self->_action;
        if ([(BCSAction *)v6 mustOpenAppLinkInApp])
        {
          char v4 = 1;
LABEL_15:

          return v4;
        }
        unsigned __int8 v7 = [(BCSAction *)v6 url];
        char v4 = objc_msgSend(v7, "_bcs_isUPIURL");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
        id v6 = self->_action;
        unsigned __int8 v7 = [(BCSAction *)v6 icsString];
        if (v7)
        {
          char v4 = 1;
        }
        else
        {
          unsigned __int8 v8 = [(BCSAction *)v6 contact];
          char v4 = v8 != 0;
        }
      }

      goto LABEL_15;
    }
  }
  return 1;
}

- (void)_handleCalendarEventWithICSString:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSNotification: Handling event action", buf, 2u);
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  char v5 = (void *)getEKEventStoreClass_softClass;
  uint64_t v22 = getEKEventStoreClass_softClass;
  if (!getEKEventStoreClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __getEKEventStoreClass_block_invoke;
    id v17 = &unk_26468ACC8;
    v18 = &v19;
    __getEKEventStoreClass_block_invoke((uint64_t)buf);
    char v5 = (void *)v20[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v19, 8);
  id v7 = objc_alloc_init(v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__BCSNotification__handleCalendarEventWithICSString___block_invoke;
  v10[3] = &unk_26468B568;
  id v11 = v7;
  id v12 = v4;
  BOOL v13 = self;
  id v8 = v4;
  id v9 = v7;
  [v9 requestWriteOnlyAccessToEventsWithCompletion:v10];
}

void __53__BCSNotification__handleCalendarEventWithICSString___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v17 = @"ICS";
  v18[0] = v2;
  id v4 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  char v5 = _DDUIEventForResults(v3, 0, v4);

  id v6 = *(void **)(a1 + 32);
  id v16 = 0;
  char v7 = [v6 saveEvent:v5 span:0 error:&v16];
  id v8 = v16;
  id v9 = v8;
  if ((v7 & 1) != 0 || !v8)
  {
    [v5 reset];
    uint64_t v10 = [getLSApplicationWorkspaceClass() defaultWorkspace];
    id v11 = [v5 externalURL];
    id v12 = [*(id *)(a1 + 48) _fbOptionsHandlingUnlockIfNecessary];
    id v15 = 0;
    char v13 = [v10 openSensitiveURL:v11 withOptions:v12 error:&v15];
    id v14 = v15;

    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __53__BCSNotification__handleCalendarEventWithICSString___block_invoke_cold_1();
      }
      [*(id *)(a1 + 32) removeEvent:v5 span:0 error:0];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __53__BCSNotification__handleCalendarEventWithICSString___block_invoke_cold_2(v9);
  }
}

+ (id)tempVCardFileURL
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  id v10 = 0;
  BOOL v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v10];
  id v4 = v10;

  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BCSNotification tempVCardFileURL]();
    }
    char v5 = 0;
  }
  else
  {
    id v6 = [v3 URLByAppendingPathComponent:@"com.apple.BarcodeSupport.Notification" isDirectory:1];
    char v7 = [MEMORY[0x263F08850] defaultManager];
    id v9 = 0;
    [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v9];
    id v4 = v9;

    if (v4)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BCSNotification tempVCardFileURL]();
      }
      char v5 = 0;
    }
    else
    {
      char v5 = [v6 URLByAppendingPathComponent:@"Transfer.vcf" isDirectory:0];
    }
  }
  return v5;
}

- (void)_handleContactInfo:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSNotification: Handling contact action", buf, 2u);
  }
  id v5 = objc_alloc_init((Class)getCNContactStoreClass());
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__BCSNotification__handleContactInfo___block_invoke;
  v7[3] = &unk_26468B590;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 requestAccessForEntityType:0 completionHandler:v7];
}

void __38__BCSNotification__handleContactInfo___block_invoke(uint64_t a1, char a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id CNContactVCardSerializationClass = getCNContactVCardSerializationClass();
    v15[0] = *(void *)(a1 + 32);
    char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    id v8 = [CNContactVCardSerializationClass dataWithContacts:v7 error:0];

    id v9 = [(id)objc_opt_class() tempVCardFileURL];
    if (!v9)
    {
LABEL_12:

      goto LABEL_13;
    }
    [v8 writeToURL:v9 atomically:1];
    id v10 = [getLSApplicationProxyClass() applicationProxyForIdentifier:@"com.apple.MobileAddressBook"];
    if ([v10 isInstalled] && (objc_msgSend(v10, "isRestricted") & 1) == 0)
    {
      id v11 = [getLSApplicationWorkspaceClass() defaultWorkspace];
      id v14 = [*(id *)(a1 + 40) _fbOptionsHandlingUnlockIfNecessary];
      id v12 = [v11 operationToOpenResource:v9 usingApplication:@"com.apple.MobileAddressBook" uniqueDocumentIdentifier:0 sourceIsManaged:0 userInfo:0 options:v14 delegate:0];

      [v12 start];
    }
    else
    {
      id v11 = [getLSApplicationProxyClass() applicationProxyForSystemPlaceholder:@"com.apple.MobileAddressBook"];
      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      id v12 = [getLSApplicationWorkspaceClass() defaultWorkspace];
      char v13 = [v11 bundleIdentifier];
      [v12 _LSFailedToOpenURL:0 withBundle:v13];
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __38__BCSNotification__handleContactInfo___block_invoke_cold_1(v5);
  }
LABEL_13:
}

- (void)_performActionAfterUnlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  id v5 = (unsigned int (*)(void))getSBSGetScreenLockStatusSymbolLoc_ptr;
  uint64_t v21 = getSBSGetScreenLockStatusSymbolLoc_ptr;
  if (!getSBSGetScreenLockStatusSymbolLoc_ptr)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __getSBSGetScreenLockStatusSymbolLoc_block_invoke;
    id v16 = &unk_26468ACC8;
    id v17 = &v18;
    id v6 = (void *)SpringBoardServicesLibrary();
    v19[3] = (uint64_t)dlsym(v6, "SBSGetScreenLockStatus");
    getSBSGetScreenLockStatusSymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
    id v5 = (unsigned int (*)(void))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v5) {
    -[BCSNotification _performActionAfterUnlock:]();
  }
  if (v5(0) && ![(BCSNotification *)self shouldSkipBanner])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__BCSNotification__performActionAfterUnlock___block_invoke;
    v11[3] = &unk_26468B5B8;
    id v12 = v4;
    char v7 = v11;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    id v8 = (void (*)(void *))getSBSRequestPasscodeUnlockUISymbolLoc_ptr;
    uint64_t v21 = getSBSRequestPasscodeUnlockUISymbolLoc_ptr;
    if (!getSBSRequestPasscodeUnlockUISymbolLoc_ptr)
    {
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      id v15 = __getSBSRequestPasscodeUnlockUISymbolLoc_block_invoke;
      id v16 = &unk_26468ACC8;
      id v17 = &v18;
      id v9 = (void *)SpringBoardServicesLibrary();
      id v10 = dlsym(v9, "SBSRequestPasscodeUnlockUI");
      *(void *)(v17[1] + 24) = v10;
      getSBSRequestPasscodeUnlockUISymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
      id v8 = (void (*)(void *))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v8) {
      -[BCSNotification _performActionAfterUnlock:]();
    }
    v8(v7);
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __45__BCSNotification__performActionAfterUnlock___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)handleActionWithIdentifier:(id)a3 notificationResponseOriginID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BCSNotification *)self shouldHandleBulletinActionWithIdentifier:v6])
  {
    id v8 = [(BCSNotification *)self identifier];
    char v9 = [v6 isEqualToString:v8];

    uint64_t v10 = [(NSMutableDictionary *)self->_localActions objectForKey:v6];
    id v11 = (void *)v10;
    if ((v9 & 1) == 0 && !v10) {
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = self->_action;
      uint64_t v13 = [(BCSAction *)v12 icsString];

      if (v13)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke;
        v22[3] = &unk_26468B498;
        v22[4] = self;
        v23 = v12;
        id v12 = v12;
        [(BCSNotification *)self _performActionAfterUnlock:v22];

LABEL_13:
LABEL_14:

        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v11 contact], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0)
        || ([(BCSAction *)v12 contact], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_2;
        v20[3] = &unk_26468B498;
        v20[4] = self;
        id v21 = v14;
        id v15 = v14;
        [(BCSNotification *)self _performActionAfterUnlock:v20];

        goto LABEL_13;
      }
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_3;
    v16[3] = &unk_26468B5E0;
    id v17 = v11;
    uint64_t v18 = self;
    id v19 = v7;
    [(BCSNotification *)self _performActionAfterUnlock:v16];

    id v12 = v17;
    goto LABEL_13;
  }
LABEL_15:
}

void __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) icsString];
  [v2 _handleCalendarEventWithICSString:v3];

  id v4 = +[BCSAWDLogger sharedLogger];
  [v4 logBarcodeActivatedEventForAction:*(void *)(*(void *)(a1 + 32) + 8)];
}

void __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleContactInfo:*(void *)(a1 + 40)];
  id v2 = +[BCSAWDLogger sharedLogger];
  [v2 logBarcodeActivatedEventForAction:*(void *)(*(void *)(a1 + 32) + 8)];
}

void __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_3(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v2 = [*(id *)(a1 + 40) _fbOptionsHandlingUnlockIfNecessary];
    BOOL v3 = (void *)[v2 mutableCopy];

    if ([*(id *)(a1 + 48) length])
    {
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v15 = 0;
      id v16 = &v15;
      uint64_t v17 = 0x2020000000;
      id v5 = (void *)getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr;
      uint64_t v18 = getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr;
      if (!getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr)
      {
        uint64_t v10 = MEMORY[0x263EF8330];
        uint64_t v11 = 3221225472;
        id v12 = __getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_block_invoke;
        uint64_t v13 = &unk_26468ACC8;
        uint64_t v14 = &v15;
        id v6 = (void *)FrontBoardServicesLibrary();
        v16[3] = (uint64_t)dlsym(v6, "FBSOpenApplicationOptionKeyLaunchOrigin");
        getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr = *(void *)(v14[1] + 24);
        id v5 = (void *)v16[3];
      }
      _Block_object_dispose(&v15, 8);
      if (!v5) {
        __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_3_cold_1();
      }
      [v3 setObject:v4 forKeyedSubscript:*v5];
    }
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      [v7 performActionWithFBOptions:v3];
    }
    else if ([*(id *)(a1 + 40) _shouldRequireUserToPickTargetApp])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSNotification: put up an alert to allow the user to choose app", (uint8_t *)&v10, 2u);
      }
      objc_msgSend(*(id *)(a1 + 40), "_showAppPickerAlertWithFBOptions:", v3, v10, v11, v12, v13);
    }
    else
    {
      [*(id *)(*(void *)(a1 + 40) + 8) performDefaultActionWithFBOptions:v3];
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    if (v8)
    {
      [v8 performAction];
    }
    else
    {
      char v9 = *(void **)(*(void *)(a1 + 40) + 8);
      [v9 performDefaultAction];
    }
  }
}

+ (id)_tlAlertConfiguration
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v2 = (void *)getTLAlertConfigurationClass_softClass;
  uint64_t v13 = getTLAlertConfigurationClass_softClass;
  if (!getTLAlertConfigurationClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getTLAlertConfigurationClass_block_invoke;
    v9[3] = &unk_26468ACC8;
    v9[4] = &v10;
    __getTLAlertConfigurationClass_block_invoke((uint64_t)v9);
    id v2 = (void *)v11[3];
  }
  BOOL v3 = v2;
  _Block_object_dispose(&v10, 8);
  uint64_t v4 = [[v3 alloc] initWithType:20];
  id v5 = (void *)_tlAlertConfiguration_alertConfiguration;
  _tlAlertConfiguration_alertConfiguration = v4;

  id v6 = getTLAlertTopicPassbookNFCScanComplete();
  [(id)_tlAlertConfiguration_alertConfiguration setTopic:v6];

  id v7 = (void *)_tlAlertConfiguration_alertConfiguration;
  return v7;
}

- (id)_attachmentIconURL
{
  if ([(BCSNotification *)self _shouldRequireUserToPickTargetApp])
  {
    BOOL v3 = 0;
  }
  else
  {
    attachmentIcon = self->_attachmentIcon;
    if (!attachmentIcon)
    {
      id v5 = [[BCSNotificationIcon alloc] initWithAction:self->_action];
      id v6 = self->_attachmentIcon;
      self->_attachmentIcon = v5;

      attachmentIcon = self->_attachmentIcon;
    }
    BOOL v3 = [(BCSNotificationIcon *)attachmentIcon imageURL];
  }
  return v3;
}

- (id)_content
{
  v39[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  if ([(BCSNotification *)self _contentIsPreviewable]) {
    uint64_t v4 = @"barcodeNotificationCategory";
  }
  else {
    uint64_t v4 = @"barcodeNotificationDefaultViewCategory";
  }
  [v3 setCategoryIdentifier:v4];
  id v5 = [(BCSNotification *)self _contentExtensionData];
  if ([v5 length])
  {
    uint64_t v38 = BCSBarcodeNotificationPayloadKey;
    v39[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    [v3 setUserInfo:v6];
  }
  id v7 = [(BCSNotification *)self _title];
  [v3 setTitle:v7];

  p_action = &self->_action;
  char v9 = [(BCSAction *)self->_action clipMetadataRequest];

  action = self->_action;
  if (v9)
  {
    uint64_t v11 = [(BCSAction *)action clipMetadataRequest];
    uint64_t v12 = [v11 getClipMetadataSynchronously];

    uint64_t v13 = [v12 clipName];
    [v3 setSubtitle:v13];

    uint64_t v14 = [(BCSNotification *)self _actionDescriptionString];
    [v3 setBody:v14];
  }
  else
  {
    uint64_t v15 = [(BCSAction *)action extraPreviewText];

    uint64_t v12 = [(BCSNotification *)self _actionDescriptionString];
    if (v15)
    {
      [v3 setSubtitle:v12];

      id v16 = NSString;
      uint64_t v12 = _BCSLocalizedString(@"Contents: “%@”", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      uint64_t v17 = [(BCSAction *)*p_action extraPreviewText];
      uint64_t v18 = objc_msgSend(v16, "stringWithFormat:", v12, v17);
      [v3 setBody:v18];
    }
    else
    {
      [v3 setBody:v12];
    }
  }

  if ([(BCSAction *)*p_action codeType] != 2)
  {
    if ([(BCSAction *)*p_action codeType] == 3)
    {
      uint64_t v20 = +[BCSNotificationIcon viewfinderIcon];
    }
    else
    {
      if ([(BCSAction *)*p_action codeType] != 1)
      {
LABEL_18:
        [v3 setThreadIdentifier:BCSBarcodeQRCodeNotificationSectionID];
        [v3 setShouldHideDate:1];
        goto LABEL_19;
      }
      uint64_t v20 = +[BCSNotificationIcon qrCodeIcon];
    }
    id v21 = (void *)v20;
    [v3 setIcon:v20];

    goto LABEL_18;
  }
  id v19 = +[BCSNotificationIcon nfcIcon];
  [v3 setIcon:v19];

  [v3 setThreadIdentifier:BCSBarcodeNFCNotificationSectionID];
LABEL_19:
  [v3 setShouldIgnoreDoNotDisturb:1];
  if ([(BCSAction *)*p_action codeType] == 2)
  {
    uint64_t v22 = [MEMORY[0x263F1DF00] soundWithAlertType:20];
    v23 = getTLAlertTopicPassbookNFCScanComplete();
    [v22 setAlertTopic:v23];

    [v3 setSound:v22];
  }
  v24 = [(BCSNotification *)self _attachmentIconURL];
  if (v24)
  {
    v25 = (void *)MEMORY[0x263F1DF20];
    v26 = [MEMORY[0x263F08C38] UUID];
    v27 = [v26 UUIDString];
    id v36 = 0;
    v28 = [v25 attachmentWithIdentifier:v27 URL:v24 options:0 error:&v36];
    id v29 = v36;

    if (v29)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        [(BCSNotification *)(uint64_t)v24 _content];
      }
    }
    else if (v28)
    {
      v37 = v28;
      v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
      [v3 setAttachments:v30];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = v3;
    goto LABEL_39;
  }
  v32 = [(BCSNotification *)self _defaultURL];
  if ([(BCSNotification *)self canHandleActionLocally]) {
    goto LABEL_31;
  }
  if (!v32 || (objc_msgSend(v32, "_bcs_isDataDetectorURL") & 1) != 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BCSNotification _content]((id *)&self->_action);
    }
    id v31 = 0;
    goto LABEL_38;
  }
  [v3 setDefaultActionURL:v32];
  if ([(BCSNotification *)self _shouldManuallyRequireAuthenticationForURL:v32])
  {
    [v3 setShouldAuthenticateDefaultAction:1];
  }
  v34 = [(BCSAction *)self->_action defaultActionTargetApplicationBundleIdentifier];
  BOOL v35 = [(BCSNotification *)self _shouldScheduleBackgroundActionForLaunchBundleID:v34];

  if (v35) {
LABEL_31:
  }
    [v3 setShouldBackgroundDefaultAction:1];
  id v31 = v3;
LABEL_38:

LABEL_39:
  return v31;
}

- (UNNotificationRequest)request
{
  id v3 = (void *)MEMORY[0x263F1DF48];
  uint64_t v4 = [(BCSNotification *)self identifier];
  id v5 = [(BCSNotification *)self _content];
  id v6 = [v3 requestWithIdentifier:v4 content:v5 trigger:0];

  return (UNNotificationRequest *)v6;
}

- (void)didHandleBulletinActionWithIdentifier:(id)a3
{
  if (![(BCSNotification *)self shouldHandleBulletinActionWithIdentifier:a3])
  {
    id v4 = +[BCSAWDLogger sharedLogger];
    [v4 logBarcodeActivatedEventForAction:self->_action];
  }
}

- (BOOL)_shouldScheduleBackgroundActionForLaunchBundleID:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.mobilephone"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.InCallService"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"com.apple.facetime"];
  }

  return v4;
}

- (id)_fbOptionsHandlingUnlockIfNecessary
{
  void v18[2] = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  id v2 = (id *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  uint64_t v15 = getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
  {
    id v3 = (void *)FrontBoardServicesLibrary();
    v13[3] = (uint64_t)dlsym(v3, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = v13[3];
    id v2 = (id *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v2) {
    -[BCSNotification _fbOptionsHandlingUnlockIfNecessary]();
  }
  id v4 = *v2;
  id v16 = v4;
  uint64_t v5 = MEMORY[0x263EFFA88];
  v18[0] = MEMORY[0x263EFFA88];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  id v6 = (id *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  uint64_t v15 = getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr)
  {
    id v7 = (void *)FrontBoardServicesLibrary();
    v13[3] = (uint64_t)dlsym(v7, "FBSOpenApplicationOptionKeyUnlockDevice");
    getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = v13[3];
    id v6 = (id *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v6) {
    -[BCSNotification _fbOptionsHandlingUnlockIfNecessary]();
  }
  id v17 = *v6;
  v18[1] = v5;
  id v8 = NSDictionary;
  id v9 = v17;
  uint64_t v10 = [v8 dictionaryWithObjects:v18 forKeys:&v16 count:2];

  return v10;
}

- (BOOL)_shouldManuallyRequireAuthenticationForURL:(id)a3
{
  id v4 = a3;
  if ([(BCSAction *)self->_action isAMSAction])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v4 scheme];
    id v7 = [v6 lowercaseString];

    if (([v7 isEqualToString:@"tel"] & 1) != 0
      || ([v7 isEqualToString:@"facetime"] & 1) != 0
      || ([v7 isEqualToString:@"facetime-audio"] & 1) != 0)
    {
      char v5 = 1;
    }
    else
    {
      char v5 = [v7 isEqualToString:@"telemergencycall"];
    }
  }
  return v5;
}

- (BOOL)_shouldRequireUserToPickTargetApp
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = self->_action;
    if ((unint64_t)[(BCSAction *)v3 appLinkCount] < 2) {
      LOBYTE(v4) = 0;
    }
    else {
      int v4 = [(BCSAction *)v3 hasPreferredAppLink] ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)_pickerLabelForURLActionPickerItem:(id)a3
{
  id v3 = [a3 appLink];
  int v4 = [v3 targetApplicationProxy];
  char v5 = [v4 localizedName];

  return v5;
}

- (void)_showAppPickerAlertWithFBOptions:(id)a3
{
  v27[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(BCSAction *)self->_action actionPickerItems];
  if ((unint64_t)[v5 count] >= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24[0]) = 0;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSNotification: User has more than 2 apps to choose from.", (uint8_t *)v24, 2u);
    }
    uint64_t v6 = [(BCSNotification *)self _orderAppLinkActionsByRecency:v5];

    char v5 = (void *)v6;
  }
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [(BCSNotification *)self _pickerLabelForURLActionPickerItem:v7];

  id v9 = [v5 objectAtIndexedSubscript:1];
  uint64_t v10 = [(BCSNotification *)self _pickerLabelForURLActionPickerItem:v9];

  v26[0] = *MEMORY[0x263EFFFC8];
  uint64_t v11 = _BCSLocalizedString(@"Choose App to Open URL", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v27[0] = v11;
  v26[1] = *MEMORY[0x263F00000];
  uint64_t v12 = _BCSLocalizedString(@"Cancel", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  uint64_t v13 = (void *)v12;
  uint64_t v14 = *MEMORY[0x263EFFFE8];
  if (v8) {
    uint64_t v15 = v8;
  }
  else {
    uint64_t v15 = &stru_26D608FC8;
  }
  v27[1] = v12;
  v27[2] = v15;
  uint64_t v16 = *MEMORY[0x263F00020];
  v26[2] = v14;
  v26[3] = v16;
  if (v10) {
    id v17 = v10;
  }
  else {
    id v17 = &stru_26D608FC8;
  }
  v26[4] = *MEMORY[0x263EFFFE0];
  v26[5] = @"SBUserNotificationForcesModalAlertAppearance";
  v27[3] = v17;
  v27[4] = MEMORY[0x263EFFA88];
  v26[6] = @"SBUserNotificationDisplayActionButtonOnLockScreen";
  v27[5] = MEMORY[0x263EFFA88];
  v27[6] = MEMORY[0x263EFFA88];
  CFDictionaryRef v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:7];

  SInt32 error = 0;
  id v19 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0x20uLL, &error, v18);
  if (v19)
  {
    uint64_t v20 = v19;
    v24[0] = 0;
    CFUserNotificationReceiveResponse(v19, 0.0, v24);
    CFRelease(v20);
    if (v24[0] == 1)
    {
      uint64_t v21 = 0;
    }
    else
    {
      if (v24[0] != 2) {
        goto LABEL_20;
      }
      uint64_t v21 = 1;
    }
    uint64_t v22 = [v5 objectAtIndexedSubscript:v21];
    if (v22)
    {
      v23 = v22;
      [v22 performActionWithFBOptions:v4];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[BCSNotification _showAppPickerAlertWithFBOptions:](&error);
  }
LABEL_20:
}

- (id)_orderAppLinkActionsByRecency:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = [v10 appLink];
        uint64_t v12 = [v11 targetApplicationProxy];
        uint64_t v13 = [v12 bundleIdentifier];

        uint64_t v14 = _bcs_lastTimeAppWasUsed(v13);
        [v4 setObject:v14 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v15 = (void *)[v5 mutableCopy];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __49__BCSNotification__orderAppLinkActionsByRecency___block_invoke;
  void v18[3] = &unk_26468B608;
  id v19 = v4;
  id v16 = v4;
  [v15 sortUsingComparator:v18];

  return v15;
}

uint64_t __49__BCSNotification__orderAppLinkActionsByRecency___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v7) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = v8 != 0;
    }
  }
  else
  {
    uint64_t v10 = [v8 compare:v7];
  }

  return v10;
}

- (int)requestingProcessID
{
  return self->_requestingProcessID;
}

- (void)setRequestingProcessID:(int)a3
{
  self->_requestingProcessID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localActions, 0);
  objc_storeStrong((id *)&self->_attachmentIcon, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)_notificationActionFromActionPickerItem:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [a2 targetApplicationBundleIdentifier];
  int v4 = 138478083;
  uint64_t v5 = a1;
  __int16 v6 = 2113;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BCSNotification: Setting up UNNotificationAction that will be handled locally with URL %{private}@ and target application %{private}@", (uint8_t *)&v4, 0x16u);
}

- (void)_notificationActionFromActionPickerItem:.cold.2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BCSNotification: Setting up UNNotificationAction with URL %{private}@", v0, 0xCu);
}

void __53__BCSNotification__handleCalendarEventWithICSString___block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSNotification: cannot open Calendar app with the event's externalURL", v0, 2u);
}

void __53__BCSNotification__handleCalendarEventWithICSString___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v2, "BCSNotification: error saving EKEvent: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)tempVCardFileURL
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v0, "BCSNotification: cannot create folder at URL: %@", v1, v2, v3, v4, v5);
}

void __38__BCSNotification__handleContactInfo___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v2, "BCSNotification: error accessing Contacts store: %{public}@", v3, v4, v5, v6, v7);
}

- (void)_performActionAfterUnlock:.cold.1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL _SBSGetScreenLockStatus(Boolean *)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSNotification.m", 59, @"%s", dlerror());

  __break(1u);
}

- (void)_performActionAfterUnlock:.cold.2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"void _SBSRequestPasscodeUnlockUI(void (^__strong)(Boolean))"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSNotification.m", 60, @"%s", dlerror());

  __break(1u);
}

void __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_3_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getFBSOpenApplicationOptionKeyLaunchOrigin(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSNotification.m", 65, @"%s", dlerror());

  __break(1u);
}

- (void)_content
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  int v4 = 138478083;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint8_t v7 = v3;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create an attachment with url %{private}@ and error %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_fbOptionsHandlingUnlockIfNecessary
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getFBSOpenApplicationOptionKeyUnlockDevice(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSNotification.m", 63, @"%s", dlerror());

  __break(1u);
}

- (void)_showAppPickerAlertWithFBOptions:(int *)a1 .cold.1(int *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = *a1;
  v2[0] = 67240192;
  v2[1] = v1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot create CFUserNotification with error code: %{public}d", (uint8_t *)v2, 8u);
}

@end