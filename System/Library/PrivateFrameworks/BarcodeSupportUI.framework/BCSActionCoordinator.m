@interface BCSActionCoordinator
- (BCSActionCoordinator)init;
- (BCSActionCoordinatorDelegate)delegate;
- (BOOL)_handleActionPickerItemIfCalendarAction:(id)a3;
- (BOOL)_handleActionPickerItemIfContactsAction:(id)a3;
- (BOOL)_handleActionPickerItemIfHomeAction:(id)a3;
- (BOOL)_handleActionPickerItemIfSpecialHandlingRequired:(id)a3;
- (BOOL)_handleSpecialCodesForAction:(id)a3 presentingViewController:(id)a4;
- (BOOL)_performActionAndReturnIfLogged:(id)a3;
- (BOOL)deviceIsBeingUnlocked;
- (id)_calendarAppIcon;
- (id)_tempVCardFileURL;
- (id)actionForVisualCode:(id)a3;
- (id)centerGlyphImageForAction:(id)a3;
- (id)homeScreenAppIconForAction:(id)a3;
- (id)homeScreenAppIconWithIdentifier:(id)a3;
- (void)_calendarAppIcon;
- (void)_handleCalendarICSString:(id)a3;
- (void)_handleContactInfo:(id)a3;
- (void)_launchBarcodeScannerAppFromLockscreenWithQueryOptions:(id)a3 completionBlock:(id)a4;
- (void)_parseVisualCode:(id)a3;
- (void)_resolveRedirectionForURL:(id)a3;
- (void)_tempVCardFileURL;
- (void)_updateParsedActionWithURL:(id)a3 appLink:(id)a4;
- (void)alertController:(id)a3 didSelectActionItem:(id)a4;
- (void)alertControllerDidAllow:(id)a3;
- (void)alertControllerDidCancel:(id)a3;
- (void)logActivatedEventForAction:(id)a3;
- (void)performAction:(id)a3;
- (void)performActionPickerItem:(id)a3;
- (void)requestDeviceUnlockIfNeededWithCompletion:(id)a3;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showFirstTimePromptIfNecessary:(id)a3 completion:(id)a4;
- (void)showItemsWithAction:(id)a3 completion:(id)a4;
- (void)startParsingVisualCode:(id)a3;
@end

@implementation BCSActionCoordinator

- (BCSActionCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)BCSActionCoordinator;
  v2 = [(BCSActionCoordinator *)&v8 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.BarcodeScanner.parsingQueue", 0, v3);
    parsingQueue = v2->_parsingQueue;
    v2->_parsingQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)startParsingVisualCode:(id)a3
{
  id v4 = a3;
  parsingQueue = self->_parsingQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__BCSActionCoordinator_startParsingVisualCode___block_invoke;
  v7[3] = &unk_26524BEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(parsingQueue, v7);
}

uint64_t __47__BCSActionCoordinator_startParsingVisualCode___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _parseVisualCode:v3];
}

- (id)actionForVisualCode:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  parsingQueue = self->_parsingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__BCSActionCoordinator_actionForVisualCode___block_invoke;
  block[3] = &unk_26524C160;
  id v10 = v4;
  v11 = self;
  v12 = &v13;
  id v6 = v4;
  dispatch_sync(parsingQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __44__BCSActionCoordinator_actionForVisualCode___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  if (a1[4] == *(void *)(v1 + 8)) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(v1 + 24));
  }
}

- (void)_parseVisualCode:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_parsingQueue);
  if (!self->_qrCodeParser)
  {
    v5 = (BCSQRCodeParser *)objc_alloc_init(MEMORY[0x263F29B90]);
    qrCodeParser = self->_qrCodeParser;
    self->_qrCodeParser = v5;
  }
  id v7 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  id v8 = v7;
  if ((unint64_t)v4 + 1 >= 2 && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_248ACF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v4, "Parsing", "start parsing", buf, 2u);
  }

  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __41__BCSActionCoordinator__parseVisualCode___block_invoke;
  v27 = &unk_26524C458;
  id v9 = v4;
  id v28 = v9;
  v29 = self;
  id v10 = _Block_copy(&v24);
  if (objc_msgSend(v9, "codeType", v24, v25, v26, v27) == 1
    && ([v9 rawPayload], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    appClipCodeURLDecoder = self->_appClipCodeURLDecoder;
    if (!appClipCodeURLDecoder)
    {
      v14 = (BCSAppClipCodeURLDecoder *)objc_alloc_init(MEMORY[0x263F29B80]);
      uint64_t v15 = self->_appClipCodeURLDecoder;
      self->_appClipCodeURLDecoder = v14;

      appClipCodeURLDecoder = self->_appClipCodeURLDecoder;
    }
    -[BCSAppClipCodeURLDecoder parseEncodedURLData:version:completion:](appClipCodeURLDecoder, "parseEncodedURLData:version:completion:", v12, [v9 codeVersion], v10);
  }
  else
  {
    v12 = [v9 payloadString];
    if (v12)
    {
      [(BCSQRCodeParser *)self->_qrCodeParser parseCodeFromString:v12 completionHandler:v10];
    }
    else
    {
      BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v16) {
        -[BCSActionCoordinator _parseVisualCode:](v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
}

void __41__BCSActionCoordinator__parseVisualCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 32);
  if (v9 + 1 >= 2 && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_248ACF000, v8, OS_SIGNPOST_INTERVAL_END, v9, "Parsing", "end parsing", buf, 2u);
  }

  id v10 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_248ACF000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "parsedQRCode", "parsed visual code payload", buf, 2u);
  }
  if (!v6)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    v12 = *(NSObject **)(v11 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__BCSActionCoordinator__parseVisualCode___block_invoke_33;
    block[3] = &unk_26524BEB8;
    void block[4] = v11;
    id v13 = v5;
    id v21 = v13;
    dispatch_async(v12, block);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));
    [WeakRetained actionCoordinator:*(void *)(a1 + 40) didParseCode:*(void *)(a1 + 32) withAction:v13];

    id v15 = [v13 defaultActionTargetApplicationBundleIdentifier];
    if ([v15 isEqualToString:@"com.apple.mobilesafari"]
      && !SBSGetScreenLockStatus())
    {
      char v16 = [v13 isApplePayInitiateAction];

      if (v16) {
        goto LABEL_12;
      }
      id v15 = [v13 urlThatCanBeOpened];
      if (objc_msgSend(v15, "_bcs_isHTTPFamilyURL"))
      {
        uint64_t v17 = [v13 clipMetadataRequest];

        if (!v17)
        {
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __41__BCSActionCoordinator__parseVisualCode___block_invoke_2;
          v18[3] = &unk_26524BEB8;
          v18[4] = *(void *)(a1 + 40);
          id v15 = v15;
          id v19 = v15;
          dispatch_async(MEMORY[0x263EF83A0], v18);
        }
      }
    }

LABEL_12:
    goto LABEL_13;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __41__BCSActionCoordinator__parseVisualCode___block_invoke_cold_1(v6);
  }
LABEL_13:
}

void __41__BCSActionCoordinator__parseVisualCode___block_invoke_33(uint64_t a1)
{
}

uint64_t __41__BCSActionCoordinator__parseVisualCode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolveRedirectionForURL:*(void *)(a1 + 40)];
}

- (BOOL)_handleSpecialCodesForAction:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 isInvalidDataAction];
  if (v8)
  {
    os_signpost_id_t v9 = objc_alloc_init(BCSAlertController);
    [(BCSAlertController *)v9 setDelegate:self];
    [(BCSAlertController *)v9 showInvalidDataAlertForAction:v6 fromViewController:v7];
  }
  return v8;
}

- (void)_updateParsedActionWithURL:(id)a3 appLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  parsingQueue = self->_parsingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__BCSActionCoordinator__updateParsedActionWithURL_appLink___block_invoke;
  block[3] = &unk_26524BF80;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(parsingQueue, block);
}

uint64_t __59__BCSActionCoordinator__updateParsedActionWithURL_appLink___block_invoke(void *a1)
{
  *(void *)(a1[6] + 24) = [[BCSShadowAction alloc] initWithURL:a1[4] appLink:a1[5] originalAction:*(void *)(a1[6] + 24)];

  return MEMORY[0x270F9A758]();
}

- (void)showFirstTimePromptIfNecessary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 conformsToProtocol:&unk_26FCC81F0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [WeakRetained actionCoordinatorPresentingViewController:self];

    if ([(BCSActionCoordinator *)self _handleSpecialCodesForAction:v6 presentingViewController:v9])
    {
      v7[2](v7);
    }
    else
    {
      id v10 = [v6 appLinks];
      if ([v10 count])
      {
        uint64_t v11 = [v10 firstObject];
        id v12 = [v11 targetApplicationProxy];
        id v13 = [v12 applicationIdentifier];

        v14 = [v11 browserSettings];
        id v15 = [v14 objectForKeyedSubscript:@"com.apple.BarcodeScanner.UserExplicitlyAllowsOpeningLinkInApp"];
        if ([v15 BOOLValue])
        {
          v7[2](v7);
        }
        else
        {
          uint64_t v19 = MEMORY[0x263EF8330];
          uint64_t v20 = 3221225472;
          id v21 = __66__BCSActionCoordinator_showFirstTimePromptIfNecessary_completion___block_invoke;
          uint64_t v22 = &unk_26524C480;
          id v23 = v11;
          uint64_t v24 = v7;
          char v16 = _Block_copy(&v19);
          id firstTimePromptBlock = self->_firstTimePromptBlock;
          self->_id firstTimePromptBlock = v16;

          uint64_t v18 = objc_alloc_init(BCSAlertController);
          -[BCSAlertController setDelegate:](v18, "setDelegate:", self, v19, v20, v21, v22);
          [(BCSAlertController *)v18 showFirstTimePromptToOpenApp:v13 fromViewController:v9];
        }
      }
      else
      {
        v7[2](v7);
      }
    }
  }
  else
  {
    v7[2](v7);
  }
}

void __66__BCSActionCoordinator_showFirstTimePromptIfNecessary_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) browserSettings];
    id v4 = (void *)[v3 mutableCopy];
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = (id)[MEMORY[0x263EFFA78] mutableCopy];
    }
    id v7 = v6;

    int v8 = [NSNumber numberWithBool:1];
    [v7 setObject:v8 forKeyedSubscript:@"com.apple.BarcodeScanner.UserExplicitlyAllowsOpeningLinkInApp"];

    id v9 = *(void **)(a1 + 32);
    id v11 = 0;
    [v9 setBrowserSettings:v7 error:&v11];
    id v10 = v11;
    if (v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __66__BCSActionCoordinator_showFirstTimePromptIfNecessary_completion___block_invoke_cold_1(v10);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_resolveRedirectionForURL:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F169A0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__BCSActionCoordinator__resolveRedirectionForURL___block_invoke;
  v9[3] = &unk_26524C4A8;
  v9[4] = self;
  id v7 = (_SFLinkRedirectionResolver *)[v6 initWithURL:v5 completionHandler:v9];

  linkResolver = self->_linkResolver;
  self->_linkResolver = v7;
}

void __50__BCSActionCoordinator__resolveRedirectionForURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __50__BCSActionCoordinator__resolveRedirectionForURL___block_invoke_cold_1(v9);
    }
  }
  else
  {
    char v10 = objc_msgSend(v7, "_bcs_isHTTPFamilyURL");
    if (v8 || (v10 & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        int v13 = 138478083;
        id v14 = v7;
        __int16 v15 = 2113;
        id v16 = v8;
        _os_log_impl(&dword_248ACF000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSActionCoordinator: resolved redirection to %{private}@. apps: %{private}@", (uint8_t *)&v13, 0x16u);
      }
      [*(id *)(a1 + 32) _updateParsedActionWithURL:v7 appLink:v8];
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 56);
      *(void *)(v11 + 56) = 0;
    }
  }
}

- (void)showItemsWithAction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [v6 urlThatCanBeOpened];
  int v10 = objc_msgSend(v9, "_bcs_isUPIURL");

  if (v10)
  {
    uint64_t v11 = objc_alloc_init(BCSContextMenuController);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __55__BCSActionCoordinator_showItemsWithAction_completion___block_invoke;
    uint64_t v19 = &unk_26524C4D0;
    uint64_t v20 = self;
    id v21 = v7;
    [(BCSContextMenuController *)v11 setFinishAction:&v16];
    id v12 = objc_msgSend(WeakRetained, "actionCoordinatorViewForContextMenu:", self, v16, v17, v18, v19, v20);
    [(BCSContextMenuController *)v11 showMenuForAction:v6 fromView:v12];
  }
  else
  {
    uint64_t v11 = [WeakRetained actionCoordinatorPresentingViewController:self];
    int v13 = _Block_copy(v7);
    id actionPickerItemBlock = self->_actionPickerItemBlock;
    self->_id actionPickerItemBlock = v13;

    __int16 v15 = objc_alloc_init(BCSAlertController);
    [(BCSAlertController *)v15 setDelegate:self];
    [(BCSAlertController *)v15 showActionPickerViewForAction:v6 fromViewController:v11];
  }
}

uint64_t __55__BCSActionCoordinator_showItemsWithAction_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    [WeakRetained actionCoordinator:*(void *)(a1 + 32) willDismissViewController:0];
  }

  return MEMORY[0x270F9A758]();
}

- (id)homeScreenAppIconForAction:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v4 urlThatCanBeOpened];
  id v7 = [v6 absoluteString];

  id v8 = [v7 lowercaseString];
  if (([v8 hasPrefix:@"x-esim://"] & 1) != 0
    || [v8 hasPrefix:@"lpa:"])
  {
    id v9 = [MEMORY[0x263F827E8] imageNamed:@"CellularData" inBundle:v5];
    uint64_t v10 = [v9 _applicationIconImageForFormat:2 precomposed:1];
LABEL_4:
    uint64_t v11 = (void *)v10;
    goto LABEL_5;
  }
  if (![v4 conformsToProtocol:&unk_26FCC81F0]) {
    goto LABEL_17;
  }
  id v9 = v4;
  if (![v9 isWiFiAction])
  {
    uint64_t v16 = [v9 clipMetadataRequest];

    if (v16)
    {
      uint64_t v10 = [MEMORY[0x263F827E8] imageNamed:@"AppClips" inBundle:v5];
      goto LABEL_4;
    }
    if ([v9 isContinuityCameraAction])
    {
      int v13 = (void *)MEMORY[0x263F827E8];
      id v14 = @"AppleTV";
      goto LABEL_11;
    }

LABEL_17:
    id v9 = [v4 defaultActionTargetApplicationBundleIdentifier];
    uint64_t v10 = [(BCSActionCoordinator *)self homeScreenAppIconWithIdentifier:v9];
    goto LABEL_4;
  }
  int v13 = (void *)MEMORY[0x263F827E8];
  id v14 = @"Wi-Fi-HomeScreen";
LABEL_11:
  __int16 v15 = [v13 imageNamed:v14 inBundle:v5];
  uint64_t v11 = [v15 _applicationIconImageForFormat:2 precomposed:1];

LABEL_5:

  return v11;
}

- (id)_calendarAppIcon
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v2 = (void *)getISIconClass_softClass;
  uint64_t v27 = getISIconClass_softClass;
  if (!getISIconClass_softClass)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __getISIconClass_block_invoke;
    uint64_t v22 = &unk_26524C3F8;
    id v23 = &v24;
    __getISIconClass_block_invoke((uint64_t)&v19);
    v2 = (void *)v25[3];
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v24, 8);
  id v4 = [v3 alloc];
  id v5 = [MEMORY[0x263EFF910] date];
  id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v7 = (void *)[v4 initWithDate:v5 calendar:v6 format:0];

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v8 = (void *)getISImageDescriptorClass_softClass;
  uint64_t v27 = getISImageDescriptorClass_softClass;
  if (!getISImageDescriptorClass_softClass)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __getISImageDescriptorClass_block_invoke;
    uint64_t v22 = &unk_26524C3F8;
    id v23 = &v24;
    __getISImageDescriptorClass_block_invoke((uint64_t)&v19);
    id v8 = (void *)v25[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v24, 8);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v10 = (void *)getkISImageDescriptorHomeScreenSymbolLoc_ptr;
  uint64_t v27 = getkISImageDescriptorHomeScreenSymbolLoc_ptr;
  if (!getkISImageDescriptorHomeScreenSymbolLoc_ptr)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __getkISImageDescriptorHomeScreenSymbolLoc_block_invoke;
    uint64_t v22 = &unk_26524C3F8;
    id v23 = &v24;
    uint64_t v11 = (void *)IconServicesLibrary();
    id v12 = dlsym(v11, "kISImageDescriptorHomeScreen");
    *(void *)(v23[1] + 24) = v12;
    getkISImageDescriptorHomeScreenSymbolLoc_ptr = *(void *)(v23[1] + 24);
    uint64_t v10 = (void *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v10) {
    -[BCSActionCoordinator _calendarAppIcon]();
  }
  int v13 = [v9 imageDescriptorNamed:*v10];
  _bcs_mainScreenScale();
  objc_msgSend(v13, "setScale:");
  id v14 = [v7 imageForImageDescriptor:v13];
  __int16 v15 = (void *)MEMORY[0x263F827E8];
  uint64_t v16 = [v14 CGImage];
  [v14 scale];
  uint64_t v17 = objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v16, 0);

  return v17;
}

- (id)homeScreenAppIconWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (homeScreenAppIconWithIdentifier__iconCache)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    id v12 = (void *)homeScreenAppIconWithIdentifier__iconCache;
    homeScreenAppIconWithIdentifier__iconCache = (uint64_t)v11;

    [(id)homeScreenAppIconWithIdentifier__iconCache setCountLimit:8];
    if (v5)
    {
LABEL_3:
      id v6 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v5];
      id v7 = (void *)homeScreenAppIconWithIdentifier__iconCache;
      id v8 = [v6 bundleIdentifier];
      id v9 = [v7 objectForKey:v8];

      if (v9)
      {
        id v10 = v9;
        goto LABEL_25;
      }
      if ([v5 isEqualToString:@"com.apple.mobilecal"])
      {
        id v10 = [(BCSActionCoordinator *)self _calendarAppIcon];
        if (!v10) {
          goto LABEL_25;
        }
      }
      else
      {
        _bcs_mainScreenScale();
        double v22 = v21;
        int IsPad = _bcs_deviceIsPad();
        if (v22 == 2.0) {
          unsigned int v24 = 24;
        }
        else {
          unsigned int v24 = 1;
        }
        if (v22 == 2.0) {
          unsigned int v25 = 15;
        }
        else {
          unsigned int v25 = 32;
        }
        if (IsPad) {
          uint64_t v26 = v24;
        }
        else {
          uint64_t v26 = v25;
        }
        uint64_t v27 = [v6 iconDataForVariant:v26];
        if (!v27)
        {
          id v10 = 0;
          goto LABEL_25;
        }
        id v28 = (void *)v27;
        v29 = (CGImage *)LICreateIconFromCachedBitmap();
        id v10 = [MEMORY[0x263F827E8] imageWithCGImage:v29 scale:0 orientation:v22];
        CGImageRelease(v29);

        if (!v10)
        {
LABEL_25:

          goto LABEL_26;
        }
      }
      v30 = (void *)homeScreenAppIconWithIdentifier__iconCache;
      v31 = [v6 bundleIdentifier];
      [v30 setObject:v10 forKey:v31];

      goto LABEL_25;
    }
  }
  BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v13) {
    -[BCSActionCoordinator homeScreenAppIconWithIdentifier:](v13, v14, v15, v16, v17, v18, v19, v20);
  }
  id v10 = 0;
LABEL_26:

  return v10;
}

- (id)centerGlyphImageForAction:(id)a3
{
  if ([a3 isApplePayInitiateAction])
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [MEMORY[0x263F827E8] imageNamed:@"applePay-center-glyph" inBundle:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)logActivatedEventForAction:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  uint64_t v3 = v5;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v5 originalAction];
  }
  id v4 = [MEMORY[0x263F29B70] sharedLogger];
  [v4 logBarcodeActivatedEventForAction:v3];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  if (!-[BCSActionCoordinator _performActionAndReturnIfLogged:](self, "_performActionAndReturnIfLogged:")) {
    [(BCSActionCoordinator *)self logActivatedEventForAction:v4];
  }
}

- (BOOL)_performActionAndReturnIfLogged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 defaultActionTargetApplicationBundleIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.mobilesafari"];

  if (v6)
  {
    id v7 = [v4 clipMetadataRequest];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!v7)
    {
      id v9 = objc_alloc_init(MEMORY[0x263F16988]);
      [v9 setEntersReaderIfAvailable:0];
      [v9 _setEphemeral:1];
      linkResolver = self->_linkResolver;
      if (linkResolver)
      {
        id v11 = [(_SFLinkRedirectionResolver *)linkResolver safariViewController];
      }
      else
      {
        id v15 = objc_alloc(MEMORY[0x263F16980]);
        uint64_t v16 = [v4 urlThatCanBeOpened];
        id v11 = (void *)[v15 initWithURL:v16 configuration:v9];
      }
      [v11 setDelegate:self];
      [v11 setDismissButtonStyle:1];
      uint64_t v17 = [WeakRetained actionCoordinatorPresentingViewController:self];
      uint64_t v18 = [v17 presentedViewController];

      if (!v18)
      {
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __56__BCSActionCoordinator__performActionAndReturnIfLogged___block_invoke;
        v23[3] = &unk_26524BEB8;
        v23[4] = self;
        id v24 = v17;
        [v24 presentViewController:v11 animated:1 completion:v23];
      }
      goto LABEL_18;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  id v9 = [v4 actionPickerItems];
  id v11 = [v9 firstObject];
  if ([(BCSActionCoordinator *)self _handleActionPickerItemIfSpecialHandlingRequired:v11])
  {
LABEL_18:
    char v12 = 0;
    goto LABEL_19;
  }
  if (objc_opt_respondsToSelector())
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __56__BCSActionCoordinator__performActionAndReturnIfLogged___block_invoke_2;
    v20[3] = &unk_26524C4F8;
    v20[4] = self;
    id WeakRetained = WeakRetained;
    id v21 = WeakRetained;
    id v22 = v4;
    [v22 performDefaultActionWithCompletionHandler:v20];

    char v12 = 1;
  }
  else
  {
    id v13 = v4;
    if ([v13 isInvalidDataAction] && objc_msgSend(v13, "codeType") == 3)
    {
      uint64_t v14 = [WeakRetained actionCoordinatorPresentingViewController:self];
      [(BCSActionCoordinator *)self _handleSpecialCodesForAction:v13 presentingViewController:v14];
    }
    else
    {
      [v13 performAction];
    }
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass() ^ 1;
  }
LABEL_19:

  return v12 & 1;
}

uint64_t __56__BCSActionCoordinator__performActionAndReturnIfLogged___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  id v4 = *(void **)(a1 + 40);

  return [v4 setNeedsStatusBarAppearanceUpdate];
}

void __56__BCSActionCoordinator__performActionAndReturnIfLogged___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v3 = objc_alloc_init(BCSAlertController);
    [(BCSAlertController *)v3 setDelegate:*(void *)(a1 + 32)];
    id v4 = [*(id *)(a1 + 40) actionCoordinatorPresentingViewController:*(void *)(a1 + 32)];
    [(BCSAlertController *)v3 showErrorExplanationForAction:*(void *)(a1 + 48) error:v5 fromViewController:v4];
  }
  else
  {
    [*(id *)(a1 + 40) actionCoordinator:*(void *)(a1 + 32) didFinishPerformingAction:*(void *)(a1 + 48)];
  }
}

- (void)performActionPickerItem:(id)a3
{
  id v4 = a3;
  if (!-[BCSActionCoordinator _handleActionPickerItemIfSpecialHandlingRequired:](self, "_handleActionPickerItemIfSpecialHandlingRequired:"))[v4 performActionInExternalApp]; {
}
  }

- (BOOL)_handleActionPickerItemIfSpecialHandlingRequired:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BCSActionCoordinator *)self _handleActionPickerItemIfContactsAction:v4]|| [(BCSActionCoordinator *)self _handleActionPickerItemIfCalendarAction:v4]|| [(BCSActionCoordinator *)self _handleActionPickerItemIfHomeAction:v4];

  return v5;
}

- (void)requestDeviceUnlockIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  if (SBSGetScreenLockStatus())
  {
    self->_deviceIsBeingUnlocked = 1;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __66__BCSActionCoordinator_requestDeviceUnlockIfNeededWithCompletion___block_invoke;
    v5[3] = &unk_26524C548;
    v5[4] = self;
    id v6 = v4;
    [(BCSActionCoordinator *)self _launchBarcodeScannerAppFromLockscreenWithQueryOptions:0 completionBlock:v5];
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __66__BCSActionCoordinator_requestDeviceUnlockIfNeededWithCompletion___block_invoke(uint64_t a1, char a2)
{
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__BCSActionCoordinator_requestDeviceUnlockIfNeededWithCompletion___block_invoke_2;
  block[3] = &unk_26524C520;
  id v5 = *(id *)(a1 + 40);
  char v8 = a2;
  void block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __66__BCSActionCoordinator_requestDeviceUnlockIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  return result;
}

- (BOOL)_handleActionPickerItemIfContactsAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 contact], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    [(BCSActionCoordinator *)self _handleContactInfo:v5];

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_tempVCardFileURL
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  id v10 = 0;
  uint64_t v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v10];
  id v4 = v10;

  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BCSActionCoordinator _tempVCardFileURL]();
    }
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [v3 URLByAppendingPathComponent:@"com.apple.BarcodeSupport.Notification" isDirectory:1];
    BOOL v7 = [MEMORY[0x263F08850] defaultManager];
    id v9 = 0;
    [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v9];
    id v4 = v9;

    if (v4)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BCSActionCoordinator _tempVCardFileURL]();
      }
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [v6 URLByAppendingPathComponent:@"Transfer.vcf" isDirectory:0];
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
    _os_log_impl(&dword_248ACF000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSActionCoordinator: Handling contact action", buf, 2u);
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFEA58]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__BCSActionCoordinator__handleContactInfo___block_invoke;
  v7[3] = &unk_26524C570;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 requestAccessForEntityType:0 completionHandler:v7];
}

void __43__BCSActionCoordinator__handleContactInfo___block_invoke(uint64_t a1, char a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = (void *)MEMORY[0x263EFEA70];
    v14[0] = *(void *)(a1 + 32);
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    id v8 = [v6 dataWithContacts:v7 error:0];

    id v9 = [*(id *)(a1 + 40) _tempVCardFileURL];
    if (!v9)
    {
LABEL_12:

      goto LABEL_13;
    }
    [v8 writeToURL:v9 atomically:1];
    id v10 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.MobileAddressBook"];
    if ([v10 isInstalled] && (objc_msgSend(v10, "isRestricted") & 1) == 0)
    {
      id v11 = [MEMORY[0x263F01880] defaultWorkspace];
      char v12 = [v11 operationToOpenResource:v9 usingApplication:@"com.apple.MobileAddressBook" uniqueDocumentIdentifier:0 sourceIsManaged:0 userInfo:0 options:0 delegate:0];
      [v12 start];
    }
    else
    {
      id v11 = [MEMORY[0x263F01868] applicationProxyForSystemPlaceholder:@"com.apple.MobileAddressBook"];
      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      char v12 = [MEMORY[0x263F01880] defaultWorkspace];
      id v13 = [v11 bundleIdentifier];
      [v12 _LSFailedToOpenURL:0 withBundle:v13];
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __43__BCSActionCoordinator__handleContactInfo___block_invoke_cold_1(v5);
  }
LABEL_13:
}

- (BOOL)_handleActionPickerItemIfHomeAction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 targetApplicationBundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.Home"];

  if (v5)
  {
    id v6 = [v3 actionURL];
    if ((objc_msgSend(v6, "_bcs_hasScheme:", @"X-HM") & 1) != 0
      || objc_msgSend(v6, "_bcs_hasScheme:", @"com.apple.Home-private"))
    {
      BOOL v7 = [MEMORY[0x263F01880] defaultWorkspace];
      uint64_t v17 = 0;
      LOBYTE(v5) = [v7 openSensitiveURL:v6 withOptions:0 error:&v17];

      if ((v5 & 1) == 0)
      {
        BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v8) {
          -[BCSActionCoordinator _handleActionPickerItemIfHomeAction:](v8, v9, v10, v11, v12, v13, v14, v15);
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)_handleActionPickerItemIfCalendarAction:(id)a3
{
  id v4 = a3;
  int v5 = [v4 targetApplicationBundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.mobilecal"];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [v4 icsString];
    }
    else
    {
      BOOL v7 = 0;
    }
    uint64_t v8 = [v7 length];
    LOBYTE(v6) = v8 != 0;
    if (v8) {
      [(BCSActionCoordinator *)self _handleCalendarICSString:v7];
    }
  }
  return v6;
}

- (void)_handleCalendarICSString:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_248ACF000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSActionCoordinator: Handling event action", buf, 2u);
  }
  id v4 = objc_alloc_init(MEMORY[0x263F04B98]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__BCSActionCoordinator__handleCalendarICSString___block_invoke;
  v7[3] = &unk_26524C570;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  [v6 requestWriteOnlyAccessToEventsWithCompletion:v7];
}

void __49__BCSActionCoordinator__handleCalendarICSString___block_invoke(uint64_t a1)
{
  v24[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v23[0] = @"ICS";
  v23[1] = @"NotificationStyle";
  v24[0] = v2;
  v24[1] = MEMORY[0x263EFFA88];
  id v3 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  id v4 = DDUIEventForResults();

  id v5 = *(void **)(a1 + 32);
  id v22 = 0;
  char v6 = [v5 saveEvent:v4 span:0 error:&v22];
  id v7 = v22;
  id v8 = v7;
  if ((v6 & 1) != 0 || !v7)
  {
    [v4 reset];
    id v9 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v10 = [v4 externalURL];
    id v21 = 0;
    char v11 = [v9 openSensitiveURL:v10 withOptions:0 error:&v21];
    id v12 = v21;

    if ((v11 & 1) == 0)
    {
      BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v13) {
        __49__BCSActionCoordinator__handleCalendarICSString___block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
      }
      [*(id *)(a1 + 32) removeEvent:v4 span:0 error:0];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __49__BCSActionCoordinator__handleCalendarICSString___block_invoke_cold_2(v8);
  }
}

- (void)_launchBarcodeScannerAppFromLockscreenWithQueryOptions:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2050000000;
  id v7 = (void *)getFBSSystemServiceClass_softClass;
  uint64_t v30 = getFBSSystemServiceClass_softClass;
  if (!getFBSSystemServiceClass_softClass)
  {
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    id v24 = __getFBSSystemServiceClass_block_invoke;
    unsigned int v25 = &unk_26524C3F8;
    uint64_t v26 = &v27;
    __getFBSSystemServiceClass_block_invoke((uint64_t)&v22);
    id v7 = (void *)v28[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v27, 8);
  id v9 = objc_alloc_init(v8);
  uint64_t v10 = [MEMORY[0x263F086E0] mainBundle];
  char v11 = [v10 bundleIdentifier];

  id v12 = objc_opt_new();
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  BOOL v13 = (void *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  uint64_t v30 = getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr)
  {
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    id v24 = __getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_block_invoke;
    unsigned int v25 = &unk_26524C3F8;
    uint64_t v26 = &v27;
    uint64_t v14 = (void *)FrontBoardServicesLibrary();
    uint64_t v15 = dlsym(v14, "FBSOpenApplicationOptionKeyUnlockDevice");
    *(void *)(v26[1] + 24) = v15;
    getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = *(void *)(v26[1] + 24);
    BOOL v13 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v13) {
    -[BCSActionCoordinator _launchBarcodeScannerAppFromLockscreenWithQueryOptions:completionBlock:]();
  }
  [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*v13];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v16 = (void *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  uint64_t v30 = getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
  {
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    id v24 = __getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_block_invoke;
    unsigned int v25 = &unk_26524C3F8;
    uint64_t v26 = &v27;
    uint64_t v17 = (void *)FrontBoardServicesLibrary();
    uint64_t v18 = dlsym(v17, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    *(void *)(v26[1] + 24) = v18;
    getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = *(void *)(v26[1] + 24);
    uint64_t v16 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v16) {
    -[BCSActionCoordinator _launchBarcodeScannerAppFromLockscreenWithQueryOptions:completionBlock:]();
  }
  [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*v16];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke;
  v20[3] = &unk_26524C5C0;
  id v21 = v6;
  id v19 = v6;
  [v9 openApplication:v11 options:v12 withResult:v20];
}

void __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 code] == 7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke_cold_1(v4);
    }
    char v5 = 0;
  }
  else
  {
    char v5 = 1;
  }
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = MEMORY[0x263EF8330];
    id v8 = __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke_212;
    id v9 = &unk_26524C598;
    id v10 = v6;
    char v11 = v5;
    if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", v7, 3221225472)) {
      v8((uint64_t)&v7);
    }
    else {
      dispatch_sync(MEMORY[0x263EF83A0], &v7);
    }
  }
}

uint64_t __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke_212(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)alertController:(id)a3 didSelectActionItem:(id)a4
{
  id actionPickerItemBlock = (void (**)(id, id, id))self->_actionPickerItemBlock;
  if (actionPickerItemBlock)
  {
    actionPickerItemBlock[2](actionPickerItemBlock, a4, a3);
    id actionPickerItemBlock = (void (**)(id, id, id))self->_actionPickerItemBlock;
  }
  self->_id actionPickerItemBlock = 0;
}

- (void)alertControllerDidAllow:(id)a3
{
  id firstTimePromptBlock = (void (**)(id, uint64_t, id))self->_firstTimePromptBlock;
  if (firstTimePromptBlock)
  {
    firstTimePromptBlock[2](firstTimePromptBlock, 1, a3);
    id firstTimePromptBlock = (void (**)(id, uint64_t, id))self->_firstTimePromptBlock;
  }
  self->_id firstTimePromptBlock = 0;
}

- (void)alertControllerDidCancel:(id)a3
{
  id firstTimePromptBlock = self->_firstTimePromptBlock;
  self->_id firstTimePromptBlock = 0;

  id actionPickerItemBlock = self->_actionPickerItemBlock;
  self->_id actionPickerItemBlock = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained actionCoordinator:self willDismissViewController:0];
}

- (void)safariViewControllerDidFinish:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained actionCoordinator:self willDismissViewController:v5];
}

- (BCSActionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCSActionCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)deviceIsBeingUnlocked
{
  return self->_deviceIsBeingUnlocked;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appClipCodeURLDecoder, 0);
  objc_storeStrong((id *)&self->_linkResolver, 0);
  objc_storeStrong(&self->_firstTimePromptBlock, 0);
  objc_storeStrong(&self->_actionPickerItemBlock, 0);
  objc_storeStrong((id *)&self->_qrCodeParser, 0);
  objc_storeStrong((id *)&self->_parsedAction, 0);
  objc_storeStrong((id *)&self->_parsingQueue, 0);

  objc_storeStrong((id *)&self->_currentCode, 0);
}

- (void)_parseVisualCode:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__BCSActionCoordinator__parseVisualCode___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_248ACF000, &_os_log_internal, v2, "BCSActionCoordinator: cannot decode the payload. Error: %{public}@", v3, v4, v5, v6, v7);
}

void __66__BCSActionCoordinator_showFirstTimePromptIfNecessary_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_248ACF000, &_os_log_internal, v2, "BCSActionCoordinator: failed to set browser settings %{public}@", v3, v4, v5, v6, v7);
}

void __50__BCSActionCoordinator__resolveRedirectionForURL___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_248ACF000, &_os_log_internal, v2, "BCSActionCoordinator: cannot resolve redirection chain. Error: %{public}@", v3, v4, v5, v6, v7);
}

- (void)_calendarAppIcon
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getkISImageDescriptorHomeScreen(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSActionCoordinator.m", 52, @"%s", dlerror());

  __break(1u);
}

- (void)homeScreenAppIconWithIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_tempVCardFileURL
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_248ACF000, &_os_log_internal, v0, "BCSActionCoordinator: cannot create folder at URL: %@", v1, v2, v3, v4, v5);
}

void __43__BCSActionCoordinator__handleContactInfo___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_248ACF000, &_os_log_internal, v2, "BCSActionCoordinator: error accessing Contacts store: %{public}@", v3, v4, v5, v6, v7);
}

- (void)_handleActionPickerItemIfHomeAction:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__BCSActionCoordinator__handleCalendarICSString___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__BCSActionCoordinator__handleCalendarICSString___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_248ACF000, &_os_log_internal, v2, "BCSActionCoordinator: error saving EKEvent: %{public}@", v3, v4, v5, v6, v7);
}

- (void)_launchBarcodeScannerAppFromLockscreenWithQueryOptions:completionBlock:.cold.1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getFBSOpenApplicationOptionKeyUnlockDevice(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSActionCoordinator.m", 44, @"%s", dlerror());

  __break(1u);
}

- (void)_launchBarcodeScannerAppFromLockscreenWithQueryOptions:completionBlock:.cold.2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getFBSOpenApplicationOptionKeyPromptUnlockDevice(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSActionCoordinator.m", 45, @"%s", dlerror());

  __break(1u);
}

void __95__BCSActionCoordinator__launchBarcodeScannerAppFromLockscreenWithQueryOptions_completionBlock___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_248ACF000, &_os_log_internal, v2, "BCSActionCoordinator: could not open application because %{public}@", v3, v4, v5, v6, v7);
}

@end