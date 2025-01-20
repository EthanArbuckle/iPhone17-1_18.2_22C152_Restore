@interface BCSAction
+ (void)getActionWithData:(id)a3 codePayload:(id)a4 completionHandler:(id)a5;
- (BCSAction)initWithData:(id)a3 codePayload:(id)a4;
- (BCSActionDelegate)delegate;
- (BCSCodePayload)codePayload;
- (BCSDetectedCode)detectedCode;
- (BCSParsedDataPrivate)data;
- (BOOL)hasSensitiveURL;
- (BOOL)isAMSAction;
- (BOOL)isAirplayPairingAction;
- (BOOL)isApplePayInitiateAction;
- (BOOL)isContinuityCameraAction;
- (BOOL)isInvalidDataAction;
- (BOOL)isLiveCameraOnlyAction;
- (BOOL)isPasskeyAction;
- (BOOL)isPasskeyAssertionAction;
- (BOOL)isPasskeyRegistrationAction;
- (BOOL)isWiFiAction;
- (BOOL)preferItemsInSubmenu;
- (BOOL)shouldRequireUserToPickTargetApp;
- (CPSClipMetadataRequest)clipMetadataRequest;
- (NSArray)actionPickerItems;
- (NSArray)appLinks;
- (NSArray)menuElements;
- (NSDictionary)debugDescriptionDictionary;
- (NSString)actionIconSystemImageName;
- (NSString)contentPreviewString;
- (NSString)dataTypeDisplayString;
- (NSString)defaultActionTargetApplicationBundleIdentifier;
- (NSString)extraPreviewText;
- (NSString)localizedDefaultActionDescription;
- (NSString)localizedDefaultActionTitle;
- (NSURL)url;
- (NSURL)urlThatCanBeOpened;
- (UIImage)actionIcon;
- (id)_fallbackDataTypeDisplayString;
- (id)debugDescriptionExtraInfoDictionary;
- (id)menuProvider;
- (id)subMenuWithMenuItems:(id)a3;
- (int64_t)codeType;
- (int64_t)payloadDataType;
- (int64_t)type;
- (unint64_t)menuElementsCount;
- (void)determineActionabilityWithCompletionHandler:(id)a3;
- (void)performActionWithCompletion:(id)a3;
- (void)performActionWithOptions:(id)a3 completion:(id)a4;
- (void)performDefaultAction;
- (void)setClipMetadataRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetectedCode:(id)a3;
- (void)showActionPicker;
@end

@implementation BCSAction

+ (void)getActionWithData:(id)a3 codePayload:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = off_26468A990;
  switch([v7 type])
  {
    case 0:
      v10 = off_26468A9A0;
      goto LABEL_4;
    case 1:
    case 6:
    case 9:
    case 11:
    case 12:
    case 13:
    case 14:
    case 16:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        v10 = off_26468A9D0;
      }
      goto LABEL_4;
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
      goto LABEL_4;
    case 8:
      v10 = &off_26468A9D8;
      goto LABEL_4;
    case 10:
      v10 = off_26468A9C8;
      goto LABEL_4;
    case 15:
      v10 = off_26468A980;
LABEL_4:
      uint64_t v11 = [objc_alloc(*v10) initWithData:v7 codePayload:v8];
      if (!v11) {
        goto LABEL_6;
      }
      v12 = (void *)v11;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __61__BCSAction_getActionWithData_codePayload_completionHandler___block_invoke;
      v14[3] = &unk_26468AE40;
      id v18 = v9;
      id v15 = v12;
      id v16 = v7;
      id v17 = v8;
      id v13 = v12;
      [v13 determineActionabilityWithCompletionHandler:v14];

      break;
    default:
LABEL_6:
      (*((void (**)(id, void))v9 + 2))(v9, 0);
      break;
  }
}

void __61__BCSAction_getActionWithData_codePayload_completionHandler___block_invoke(void *a1, int a2)
{
  uint64_t v2 = a1[7];
  if (a2)
  {
    uint64_t v3 = a1[4];
    v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
    uint64_t v5 = a1[7];
    v4(v5, v3);
  }
  else
  {
    v6 = [[BCSInvalidDataAction alloc] initWithData:a1[5] codePayload:a1[6]];
    (*(void (**)(uint64_t, BCSInvalidDataAction *))(v2 + 16))(v2, v6);
  }
}

- (BCSAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCSAction;
  id v9 = [(BCSAction *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_codePayload, a4);
    uint64_t v11 = v10;
  }

  return v10;
}

- (int64_t)type
{
  return [(BCSParsedDataPrivate *)self->_data type];
}

- (void)showActionPicker
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_223007000, &_os_log_internal, v1, "%@: -[BCSAction presentingViewControllerForAction:] must be implemented to perform action.", v2, v3, v4, v5, 2u);
}

- (NSString)localizedDefaultActionTitle
{
  return (NSString *)&stru_26D608FC8;
}

- (void)performDefaultAction
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BCSAction.m" lineNumber:223 description:@"Subclasses must implement this"];
}

- (NSString)localizedDefaultActionDescription
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BCSAction.m" lineNumber:228 description:@"Subclasses must implement this"];

  return (NSString *)_BCSLocalizedString(@"Open", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
}

- (NSString)defaultActionTargetApplicationBundleIdentifier
{
  return 0;
}

- (NSArray)actionPickerItems
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [[BCSActionPickerItem alloc] initWithAction:self];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (NSDictionary)debugDescriptionDictionary
{
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"actionClass";
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v12[0] = v4;
  v11[1] = @"actionDescription";
  uint64_t v5 = [(BCSAction *)self localizedActionDescription];
  v12[1] = v5;
  v11[2] = @"defaultActionDescription";
  v6 = [(BCSAction *)self localizedDefaultActionDescription];
  v12[2] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v8 = [(BCSAction *)self debugDescriptionExtraInfoDictionary];
  if (v8)
  {
    id v9 = (id)[v7 mutableCopy];
    [v9 setObject:v8 forKeyedSubscript:@"actionInfo"];
  }
  else
  {
    id v9 = v7;
  }

  return (NSDictionary *)v9;
}

- (id)debugDescriptionExtraInfoDictionary
{
  return 0;
}

- (void)determineActionabilityWithCompletionHandler:(id)a3
{
  id v7 = (void (**)(id, uint64_t))a3;
  id v4 = [(BCSAction *)self data];
  uint64_t v5 = [v4 type];

  if (v5 == 8) {
    uint64_t isHostAppEntitled = _bcs_isHostAppEntitled();
  }
  else {
    uint64_t isHostAppEntitled = 1;
  }
  v7[2](v7, isHostAppEntitled);
}

- (NSString)extraPreviewText
{
  return (NSString *)[(BCSParsedDataPrivate *)self->_data extraPreviewText];
}

- (int64_t)codeType
{
  codePayload = self->_codePayload;
  if (codePayload) {
    return [(BCSCodePayload *)codePayload codeType];
  }
  else {
    return 1;
  }
}

- (void)performActionWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__BCSAction_performActionWithCompletion___block_invoke;
  v6[3] = &unk_26468AE68;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _bcs_performActionAfterUnlock(v6);
}

void __41__BCSAction_performActionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  _bcs_frontBoardUnlockOptions();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 performActionWithOptions:v3 completion:*(void *)(a1 + 40)];
}

- (void)performActionWithOptions:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  [(BCSAction *)self performDefaultAction];
  v5[2](v5, 0);
}

- (BOOL)preferItemsInSubmenu
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(BCSAction *)self detectedCode];

  if (v3)
  {
    if (_bcs_isCurrentProcessSafari())
    {
      [(BCSAction *)self actionPickerItems];
      long long v8 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      id v3 = (void *)[v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3)
      {
        uint64_t v5 = *(void *)v9;
        while (2)
        {
          for (i = 0; i != v3; i = (char *)i + 1)
          {
            if (*(void *)v9 != v5) {
              objc_enumerationMutation(v4);
            }
            if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "canGroupInSubmenu", (void)v8))
            {
              LOBYTE(v3) = 1;
              goto LABEL_14;
            }
          }
          id v3 = (void *)[v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
          if (v3) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)subMenuWithMenuItems:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BCSAction *)self codeType];
  id UIMenuClass = getUIMenuClass();
  if (v5 == 3)
  {
    id v7 = _BCSLocalizedString(@"App Clip Code MenuItem", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    id UIImageClass = getUIImageClass();
    long long v9 = @"appclip";
  }
  else
  {
    id v7 = _BCSLocalizedString(@"QR Code", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    id UIImageClass = getUIImageClass();
    long long v9 = @"qrcode.viewfinder";
  }
  long long v10 = [UIImageClass systemImageNamed:v9];
  long long v11 = [UIMenuClass menuWithTitle:v7 image:v10 identifier:0 options:32 children:v4];

  return v11;
}

- (NSArray)menuElements
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(BCSAction *)self actionPickerItems];
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v2;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        long long v8 = v4;
        long long v9 = v3;
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id UIActionClass = getUIActionClass();
        v12 = [v10 label];
        uint64_t v13 = [v10 icon];
        v14 = [v10 label];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __25__BCSAction_menuElements__block_invoke;
        v25[3] = &unk_26468AEB8;
        v25[4] = v10;
        id v15 = [UIActionClass actionWithTitle:v12 image:v13 identifier:v14 handler:v25];

        id v3 = v9;
        id v4 = v8;
        if ([v10 useInlineMenu]) {
          id v16 = v3;
        }
        else {
          id v16 = v8;
        }
        [v16 addObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    id v17 = [getUIMenuClass() menuWithTitle:&stru_26D608FC8 image:0 identifier:0 options:1 children:v3];
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObject:v17];
    if ([v4 count] && -[BCSAction preferItemsInSubmenu](self, "preferItemsInSubmenu"))
    {
      v19 = [(BCSAction *)self subMenuWithMenuItems:v4];
      id v20 = [v18 arrayByAddingObject:v19];
    }
    else
    {
      id v20 = [v18 arrayByAddingObjectsFromArray:v4];
    }

    goto LABEL_19;
  }
  if ([(BCSAction *)self preferItemsInSubmenu])
  {
    id v17 = [(BCSAction *)self subMenuWithMenuItems:v4];
    v30 = v17;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
LABEL_19:

    goto LABEL_20;
  }
  id v20 = v4;
LABEL_20:

  return (NSArray *)v20;
}

void __25__BCSAction_menuElements__block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 3221225472;
  v1[2] = __25__BCSAction_menuElements__block_invoke_2;
  v1[3] = &unk_26468AE90;
  v1[4] = *(void *)(a1 + 32);
  _bcs_performActionAfterUnlock(v1);
}

void __25__BCSAction_menuElements__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  _bcs_frontBoardUnlockOptions();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 performActionWithFBOptions:v2];
}

- (id)menuProvider
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__BCSAction_menuProvider__block_invoke;
  v4[3] = &unk_26468AEE0;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223CAD0D0](v4, a2);
  return v2;
}

id __25__BCSAction_menuProvider__block_invoke(uint64_t a1)
{
  id UIMenuClass = getUIMenuClass();
  id v3 = [*(id *)(a1 + 32) contentPreviewString];
  id v4 = [*(id *)(a1 + 32) menuElements];
  uint64_t v5 = [UIMenuClass menuWithTitle:v3 image:0 identifier:0 options:0 children:v4];

  return v5;
}

- (unint64_t)menuElementsCount
{
  id v2 = [(BCSAction *)self actionPickerItems];
  unint64_t v3 = [v2 count];

  return v3;
}

- (UIImage)actionIcon
{
  id UIImageClass = getUIImageClass();
  id v4 = [(BCSAction *)self actionIconSystemImageName];
  uint64_t v5 = [UIImageClass _systemImageNamed:v4];

  return (UIImage *)v5;
}

- (NSString)actionIconSystemImageName
{
  return (NSString *)@"qrcode";
}

- (id)_fallbackDataTypeDisplayString
{
  int64_t v2 = [(BCSAction *)self codeType];
  switch(v2)
  {
    case 3:
      id v4 = @"APP CLIP CODE DETECTED";
      break;
    case 2:
      id v4 = @"NFC TAG DETECTED";
      break;
    case 1:
      id v4 = @"QR CODE DETECTED";
      break;
    default:
      goto LABEL_8;
  }
  unint64_t v3 = _BCSLocalizedString(v4, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
LABEL_8:
  return v3;
}

- (NSString)dataTypeDisplayString
{
  unint64_t v3 = [(BCSAction *)self localizedDefaultActionTitle];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(BCSAction *)self localizedDefaultActionTitle];
LABEL_20:
    uint64_t v13 = (void *)v5;
    goto LABEL_21;
  }
  uint64_t v6 = [(BCSAction *)self data];
  uint64_t v7 = [v6 type];

  if (v7 == 10)
  {
    long long v8 = @"TEXT QR CODE";
LABEL_19:
    uint64_t v5 = _BCSLocalizedString(v8, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    goto LABEL_20;
  }
  if (v7 == 8)
  {
    if (MGGetBoolAnswer()) {
      long long v8 = @"WLAN QR CODE";
    }
    else {
      long long v8 = @"WI-FI QR CODE";
    }
    goto LABEL_19;
  }
  if ((_bcs_isDeviceLocked() & 1) == 0
    && [(BCSAction *)self shouldRequireUserToPickTargetApp])
  {
    long long v8 = @"APP QR CODE";
    goto LABEL_19;
  }
  long long v9 = [(BCSAction *)self clipMetadataRequest];

  if (v9)
  {
    if ([(BCSAction *)self codeType] == 3) {
      long long v8 = @"APP CLIP CODE";
    }
    else {
      long long v8 = @"APP CLIP QR CODE";
    }
    goto LABEL_19;
  }
  long long v10 = [(BCSAction *)self defaultActionTargetApplicationBundleIdentifier];
  long long v11 = v10;
  if (v10)
  {
    if (![v10 isEqualToString:@"com.apple.mobilesafari"])
    {
      id v15 = [getLSApplicationProxyClass() applicationProxyForIdentifier:v11];
      id v16 = NSString;
      id v17 = _BCSLocalizedString(@"%@ QR CODE", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      id v18 = [v15 localizedName];
      uint64_t v13 = objc_msgSend(v16, "stringWithFormat:", v17, v18);

      goto LABEL_27;
    }
    uint64_t v12 = _BCSLocalizedString(@"WEBSITE QR CODE", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  }
  else
  {
    uint64_t v12 = [(BCSAction *)self _fallbackDataTypeDisplayString];
  }
  uint64_t v13 = (void *)v12;
LABEL_27:

LABEL_21:
  return (NSString *)v13;
}

- (int64_t)payloadDataType
{
  int64_t v2 = [(BCSAction *)self data];
  int64_t v3 = [v2 type];

  return v3;
}

- (BOOL)isLiveCameraOnlyAction
{
  if ([(BCSAction *)self isPasskeyAction]) {
    return 1;
  }
  return [(BCSAction *)self isApplePayInitiateAction];
}

- (BCSActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (BCSActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)urlThatCanBeOpened
{
  return self->urlThatCanBeOpened;
}

- (NSArray)appLinks
{
  return self->appLinks;
}

- (BOOL)isInvalidDataAction
{
  return self->isInvalidDataAction;
}

- (BOOL)isWiFiAction
{
  return self->isWiFiAction;
}

- (CPSClipMetadataRequest)clipMetadataRequest
{
  return self->clipMetadataRequest;
}

- (void)setClipMetadataRequest:(id)a3
{
}

- (BOOL)shouldRequireUserToPickTargetApp
{
  return self->shouldRequireUserToPickTargetApp;
}

- (BOOL)hasSensitiveURL
{
  return self->hasSensitiveURL;
}

- (BOOL)isAMSAction
{
  return self->isAMSAction;
}

- (BOOL)isPasskeyAction
{
  return self->isPasskeyAction;
}

- (BOOL)isPasskeyAssertionAction
{
  return self->isPasskeyAssertionAction;
}

- (BOOL)isPasskeyRegistrationAction
{
  return self->isPasskeyRegistrationAction;
}

- (BOOL)isAirplayPairingAction
{
  return self->isAirplayPairingAction;
}

- (BOOL)isContinuityCameraAction
{
  return self->isContinuityCameraAction;
}

- (BOOL)isApplePayInitiateAction
{
  return self->isApplePayInitiateAction;
}

- (BCSDetectedCode)detectedCode
{
  return self->_detectedCode;
}

- (void)setDetectedCode:(id)a3
{
}

- (NSString)contentPreviewString
{
  return self->_contentPreviewString;
}

- (BCSParsedDataPrivate)data
{
  return self->_data;
}

- (NSURL)url
{
  return self->_url;
}

- (BCSCodePayload)codePayload
{
  return self->_codePayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codePayload, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_contentPreviewString, 0);
  objc_storeStrong((id *)&self->_detectedCode, 0);
  objc_storeStrong((id *)&self->clipMetadataRequest, 0);
  objc_storeStrong((id *)&self->appLinks, 0);
  objc_storeStrong((id *)&self->urlThatCanBeOpened, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_actionPickerViewAssistant, 0);
}

@end