@interface BPSWatchSetupProxCardViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)pairing;
- (BPSWatchSetupProxCardViewController)initWithUserInfo:(id)a3 withDismissCompletionHandler:(id)a4;
- (PRXFlowDelegate)mainController;
- (id)dismissCompletionHandler;
- (void)_handleContinueButton;
- (void)_handleLearnMoreButton;
- (void)_handleUpdateNow;
- (void)_launchWatchAppForPairing;
- (void)_restoreWatchApp;
- (void)applicationsDidInstall:(id)a3;
- (void)handleDeviceSetupNotification:(id)a3;
- (void)installSettingsIcon;
- (void)setMainController:(id)a3;
- (void)setPairing:(BOOL)a3;
- (void)setupIncompatibleCard;
- (void)setupInstallOrLaunchCard;
- (void)setupUpdateCard;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BPSWatchSetupProxCardViewController

- (BPSWatchSetupProxCardViewController)initWithUserInfo:(id)a3 withDismissCompletionHandler:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)BPSWatchSetupProxCardViewController;
  v8 = [(BPSWatchSetupProxCardViewController *)&v46 initWithContentView:0];
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"wd"];
  advertisingPayloadOrIdentifier = v8->_advertisingPayloadOrIdentifier;
  v8->_advertisingPayloadOrIdentifier = (NSData *)v9;

  uint64_t v11 = [v6 objectForKeyedSubscript:@"di"];
  deviceUUID = v8->_deviceUUID;
  v8->_deviceUUID = (NSString *)v11;

  uint64_t v13 = MEMORY[0x21D4A9390](v7);
  id dismissCompletionHandler = v8->_dismissCompletionHandler;
  v8->_id dismissCompletionHandler = (id)v13;

  uint64_t v15 = [(NSData *)v8->_advertisingPayloadOrIdentifier length];
  if (v15 == *MEMORY[0x263F5B990])
  {
    v16 = pbb_proxcard_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C513000, v16, OS_LOG_TYPE_DEFAULT, "Legacy Data Found", buf, 2u);
    }

    v8->_pairingType = 0;
    v17 = [[NSString alloc] initWithData:v8->_advertisingPayloadOrIdentifier encoding:4];
    v18 = PBAdvertisingInfoFromPayload();
    v19 = [v18 objectForKey:*MEMORY[0x263F5B9A0]];
    uint64_t v20 = [v19 stringValue];
    int v21 = [(id)v20 longLongValue];

    v22 = [v18 objectForKey:*MEMORY[0x263F5B9B8]];
    LOBYTE(v20) = [v22 unsignedCharValue];

    v23 = [v18 objectForKey:*MEMORY[0x263F5B998]];
    char v24 = [v23 unsignedCharValue];

    v25 = [v18 objectForKey:*MEMORY[0x263F5B9B0]];
    char v26 = [v25 unsignedCharValue];

    uint64_t v27 = [objc_alloc(MEMORY[0x263F57758]) initWithAdvertisingIdentifier:v21 & 0x1FFFF pairingStrategy:v20 & 7 deviceSize:v26 & 0x3F enclosureMaterial:v24 & 0x3F];
    advertisementIdentifier = v8->_advertisementIdentifier;
    v8->_advertisementIdentifier = (WatchSetupAdvertisementIdentifier *)v27;

    extendedMetadata = v8->_extendedMetadata;
    v8->_extendedMetadata = 0;
  }
  else
  {
    unint64_t v30 = [(NSData *)v8->_advertisingPayloadOrIdentifier length];
    unint64_t v31 = *MEMORY[0x263F5B9A8];
    v32 = pbb_proxcard_log();
    v17 = v32;
    if (v30 < v31)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[BPSWatchSetupProxCardViewController initWithUserInfo:withDismissCompletionHandler:](v17, v33, v34, v35, v36, v37, v38, v39);
      }
      goto LABEL_13;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C513000, v17, OS_LOG_TYPE_DEFAULT, "Current Data Found", buf, 2u);
    }

    v8->_pairingType = 1;
    v17 = -[NSData subdataWithRange:](v8->_advertisingPayloadOrIdentifier, "subdataWithRange:", 2, 4);
    uint64_t v40 = [objc_alloc(MEMORY[0x263F57758]) initWithPackedIdentifierData:v17];
    v41 = v8->_advertisementIdentifier;
    v8->_advertisementIdentifier = (WatchSetupAdvertisementIdentifier *)v40;

    v18 = -[NSData subdataWithRange:](v8->_advertisingPayloadOrIdentifier, "subdataWithRange:", 6, 7);
    uint64_t v42 = [objc_alloc(MEMORY[0x263F57760]) initWithPackedExtendedMetadataData:v18];
    extendedMetadata = v8->_extendedMetadata;
    v8->_extendedMetadata = (WatchSetupExtendedMetadata *)v42;
  }

LABEL_13:
  v43 = pbb_proxcard_log();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = [(WatchSetupAdvertisementIdentifier *)v8->_advertisementIdentifier humanReadableName];
    *(_DWORD *)buf = 138412290;
    v48 = v44;
    _os_log_impl(&dword_21C513000, v43, OS_LOG_TYPE_DEFAULT, "Human readable name for pairing watch - %@", buf, 0xCu);
  }
LABEL_16:

  return v8;
}

- (void)setupIncompatibleCard
{
  v43[5] = *MEMORY[0x263EF8340];
  [(BPSWatchSetupProxCardViewController *)self setDismissalType:3];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PROX_CARD_IPHONE_INCOMPATIBLE_TITLE" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  [(BPSWatchSetupProxCardViewController *)self setTitle:v4];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"PROX_CARD_IPHONE_INCOMPATIBLE_SUBTITLE" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  [(BPSWatchSetupProxCardViewController *)self setSubtitle:v6];

  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x263F62360];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"LEARN_MORE" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __60__BPSWatchSetupProxCardViewController_setupIncompatibleCard__block_invoke;
  v40[3] = &unk_264408E90;
  objc_copyWeak(&v41, &location);
  uint64_t v39 = [v7 actionWithTitle:v9 style:0 handler:v40];

  id v10 = (id)[(BPSWatchSetupProxCardViewController *)self addAction:v39];
  uint64_t v38 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.applewatch"];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v38];
  [v11 setContentMode:1];
  v12 = [MEMORY[0x263F1C550] quaternarySystemFillColor];
  [v11 setTintColor:v12];

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v13 = [(BPSWatchSetupProxCardViewController *)self contentView];
  [v13 addSubview:v11];

  v23 = (void *)MEMORY[0x263F08938];
  uint64_t v35 = [v11 topAnchor];
  uint64_t v37 = [(BPSWatchSetupProxCardViewController *)self contentView];
  uint64_t v36 = [v37 mainContentGuide];
  uint64_t v34 = [v36 topAnchor];
  uint64_t v33 = [v35 constraintEqualToAnchor:v34];
  v43[0] = v33;
  unint64_t v30 = [v11 bottomAnchor];
  v32 = [(BPSWatchSetupProxCardViewController *)self contentView];
  unint64_t v31 = [v32 mainContentGuide];
  v29 = [v31 bottomAnchor];
  v28 = [v30 constraintLessThanOrEqualToAnchor:v29];
  v43[1] = v28;
  v25 = [v11 leadingAnchor];
  uint64_t v27 = [(BPSWatchSetupProxCardViewController *)self contentView];
  char v26 = [v27 mainContentGuide];
  char v24 = [v26 leadingAnchor];
  v14 = [v25 constraintEqualToAnchor:v24];
  v43[2] = v14;
  uint64_t v15 = [v11 trailingAnchor];
  v16 = [(BPSWatchSetupProxCardViewController *)self contentView];
  v17 = [v16 mainContentGuide];
  v18 = [v17 trailingAnchor];
  v19 = [v15 constraintEqualToAnchor:v18];
  v43[3] = v19;
  uint64_t v20 = [v11 heightAnchor];
  int v21 = [v20 constraintEqualToConstant:175.0];
  v43[4] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:5];
  [v23 activateConstraints:v22];

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

void __60__BPSWatchSetupProxCardViewController_setupIncompatibleCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLearnMoreButton];
}

- (void)setupInstallOrLaunchCard
{
}

void __63__BPSWatchSetupProxCardViewController_setupInstallOrLaunchCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleContinueButton];
}

- (void)setupUpdateCard
{
  [(BPSWatchSetupProxCardViewController *)self setDismissalType:3];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PROX_CARD_SOFTWARE_UPDATE_TITLE" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  [(BPSWatchSetupProxCardViewController *)self setTitle:v4];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"PROX_CARD_SOFTWARE_UPDATE_SUBTITLE" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  [(BPSWatchSetupProxCardViewController *)self setSubtitle:v6];

  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x263F62360];
  v8 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v9 = [v8 localizedStringForKey:@"CHECK_FOR_UPDATE" value:&stru_26CCB36C8 table:0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__BPSWatchSetupProxCardViewController_setupUpdateCard__block_invoke;
  v19[3] = &unk_264408E90;
  objc_copyWeak(&v20, &location);
  id v10 = [v7 actionWithTitle:v9 style:0 handler:v19];

  uint64_t v11 = (void *)MEMORY[0x263F62360];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"SET_UP_LATER" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__BPSWatchSetupProxCardViewController_setupUpdateCard__block_invoke_3;
  v17[3] = &unk_264408E90;
  objc_copyWeak(&v18, &location);
  v14 = [v11 actionWithTitle:v13 style:1 handler:v17];

  id v15 = (id)[(BPSWatchSetupProxCardViewController *)self addAction:v10];
  id v16 = (id)[(BPSWatchSetupProxCardViewController *)self addAction:v14];
  [(BPSWatchSetupProxCardViewController *)self installSettingsIcon];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __54__BPSWatchSetupProxCardViewController_setupUpdateCard__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__BPSWatchSetupProxCardViewController_setupUpdateCard__block_invoke_2;
  v6[3] = &unk_264408EB8;
  objc_copyWeak(&v7, v4);
  [WeakRetained dismissViewControllerAnimated:1 completion:v6];

  objc_destroyWeak(&v7);
}

void __54__BPSWatchSetupProxCardViewController_setupUpdateCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleUpdateNow];
}

void __54__BPSWatchSetupProxCardViewController_setupUpdateCard__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)installSettingsIcon
{
  v81[17] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1C778]);
  v4 = [(BPSWatchSetupProxCardViewController *)self contentView];
  [v4 addLayoutGuide:v3];

  v80 = [MEMORY[0x263F1C6B0] imageNamed:@"Settings"];
  v5 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v80];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [(BPSWatchSetupProxCardViewController *)self contentView];
  [v6 addSubview:v5];

  id v7 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [MEMORY[0x263F1C550] systemRedColor];
  [v7 setBackgroundColor:v8];

  uint64_t v9 = [v7 layer];
  [v9 setCornerRadius:19.0];

  id v10 = [(BPSWatchSetupProxCardViewController *)self contentView];
  [v10 addSubview:v7];

  id v11 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [MEMORY[0x263F08A30] localizedStringFromNumber:&unk_26CCBC498 numberStyle:0];
  [v11 setText:v12];

  uint64_t v13 = [MEMORY[0x263F1C550] whiteColor];
  [v11 setTextColor:v13];

  [v11 setTextAlignment:1];
  v14 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D270]];
  v79 = objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v14, "symbolicTraits") | 2);

  id v15 = [MEMORY[0x263F1C658] fontWithDescriptor:v79 size:25.0];
  [v11 setFont:v15];

  [v7 addSubview:v11];
  double v16 = 30.0 - *MEMORY[0x263F623B0];
  v17 = [(BPSWatchSetupProxCardViewController *)self contentView];
  id v18 = [v17 mainContentGuide];

  v54 = (void *)MEMORY[0x263F08938];
  v78 = [v3 centerXAnchor];
  v74 = v18;
  v77 = [v18 centerXAnchor];
  v76 = [v78 constraintEqualToAnchor:v77];
  v81[0] = v76;
  v73 = [v3 topAnchor];
  v75 = [(BPSWatchSetupProxCardViewController *)self contentView];
  v72 = [v75 subtitleLabel];
  v71 = [v72 bottomAnchor];
  v70 = [v73 constraintGreaterThanOrEqualToAnchor:v71 constant:v16];
  v81[1] = v70;
  v69 = [v3 bottomAnchor];
  v68 = [v18 bottomAnchor];
  v67 = [v69 constraintLessThanOrEqualToAnchor:v68];
  v81[2] = v67;
  v66 = [v5 leadingAnchor];
  v65 = [v3 leadingAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v81[3] = v64;
  v62 = [v5 trailingAnchor];
  v61 = [v3 trailingAnchor];
  v59 = [v62 constraintEqualToAnchor:v61 constant:-11.0];
  v81[4] = v59;
  v58 = [v5 topAnchor];
  v57 = [v3 topAnchor];
  v56 = [v58 constraintEqualToAnchor:v57 constant:11.0];
  v81[5] = v56;
  v63 = v5;
  v55 = [v5 bottomAnchor];
  v53 = [v3 bottomAnchor];
  v52 = [v55 constraintEqualToAnchor:v53];
  v81[6] = v52;
  v51 = [v5 widthAnchor];
  v50 = [v51 constraintEqualToConstant:104.0];
  v81[7] = v50;
  uint64_t v49 = [v5 heightAnchor];
  v48 = [v5 widthAnchor];
  objc_super v46 = [v49 constraintEqualToAnchor:v48];
  v81[8] = v46;
  v45 = [v7 topAnchor];
  v60 = v3;
  v44 = [v3 topAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v81[9] = v43;
  v19 = v7;
  uint64_t v42 = [v7 trailingAnchor];
  id v41 = [v3 trailingAnchor];
  uint64_t v40 = [v42 constraintEqualToAnchor:v41];
  v81[10] = v40;
  uint64_t v39 = [v7 widthAnchor];
  uint64_t v38 = [v39 constraintEqualToConstant:38.0];
  v81[11] = v38;
  uint64_t v37 = [v7 heightAnchor];
  uint64_t v36 = [v7 widthAnchor];
  uint64_t v35 = [v37 constraintEqualToAnchor:v36];
  v81[12] = v35;
  uint64_t v34 = [v11 leadingAnchor];
  uint64_t v33 = [v7 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v81[13] = v32;
  id v20 = v11;
  unint64_t v31 = [v11 topAnchor];
  int v21 = [v7 topAnchor];
  v22 = [v31 constraintEqualToAnchor:v21];
  v81[14] = v22;
  v23 = v20;
  v47 = v20;
  char v24 = [v20 bottomAnchor];
  v25 = [v7 bottomAnchor];
  char v26 = [v24 constraintEqualToAnchor:v25];
  v81[15] = v26;
  uint64_t v27 = [v23 trailingAnchor];
  v28 = [v19 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v81[16] = v29;
  unint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:17];
  [v54 activateConstraints:v30];
}

- (void)viewDidLoad
{
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)BPSWatchSetupProxCardViewController;
  [(BPSWatchSetupProxCardViewController *)&v6 viewWillAppear:a3];
  v4 = pbb_proxcard_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[BPSWatchSetupProxCardViewController viewWillAppear:]";
    _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = [MEMORY[0x263F087C8] defaultCenter];
  [v5 addObserver:self selector:sel_handleDeviceSetupNotification_ name:@"com.apple.sharing.DeviceSetup" object:0 suspensionBehavior:4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)BPSWatchSetupProxCardViewController;
  [(BPSWatchSetupProxCardViewController *)&v6 viewDidDisappear:a3];
  v4 = pbb_proxcard_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[BPSWatchSetupProxCardViewController viewDidDisappear:]";
    _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = [MEMORY[0x263F087C8] defaultCenter];
  [v5 removeObserver:self name:@"com.apple.sharing.DeviceSetup" object:0];
}

- (void)handleDeviceSetupNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(BPSWatchSetupProxCardViewController *)self pairing])
  {
    v5 = [v4 name];
    objc_super v6 = [v4 userInfo];
    id v7 = pbb_proxcard_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      v17 = v5;
      __int16 v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "DeviceSetup notification '%@', %@", (uint8_t *)&v16, 0x16u);
    }

    v8 = [v4 name];
    int v9 = [v8 isEqual:@"com.apple.sharing.DeviceSetup"];

    if (v9)
    {
      id v10 = [v6 objectForKeyedSubscript:@"needsSetup"];
      char v11 = [v10 BOOLValue];

      if ((v11 & 1) == 0)
      {
        v12 = [v6 objectForKeyedSubscript:@"needsSetup"];
        uint64_t v13 = [v12 stringValue];

        if ([v13 isEqual:self->_deviceUUID])
        {
          v14 = pbb_proxcard_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v16) = 0;
            _os_log_impl(&dword_21C513000, v14, OS_LOG_TYPE_DEFAULT, "Auto-dismissing on setup started", (uint8_t *)&v16, 2u);
          }

          id dismissCompletionHandler = (void (**)(id, uint64_t, void))self->_dismissCompletionHandler;
          if (dismissCompletionHandler) {
            dismissCompletionHandler[2](dismissCompletionHandler, 1, 0);
          }
        }
      }
    }
  }
}

- (void)_handleLearnMoreButton
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C513000, v0, v1, "Failed to open support article: %@\n", v2, v3, v4, v5, v6);
}

- (void)_handleContinueButton
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.Bridge";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21C513000, a2, OS_LOG_TYPE_ERROR, "error while retrieving application record %@ with error %@", (uint8_t *)&v2, 0x16u);
}

- (void)_handleUpdateNow
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C513000, v0, v1, "Failed to open settings: %@\n", v2, v3, v4, v5, v6);
}

- (void)_launchWatchAppForPairing
{
  id dismissCompletionHandler = (void (**)(id, uint64_t, void *))self->_dismissCompletionHandler;
  if (dismissCompletionHandler) {
    dismissCompletionHandler[2](dismissCompletionHandler, 1, &__block_literal_global_4);
  }
}

void __64__BPSWatchSetupProxCardViewController__launchWatchAppForPairing__block_invoke()
{
  v0 = pbb_proxcard_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C513000, v0, OS_LOG_TYPE_DEFAULT, "Launching Watch app", buf, 2u);
  }

  id v1 = objc_alloc_init(MEMORY[0x263F6C1F0]);
  uint64_t v2 = [NSURL URLWithString:@"bridge://?action=StartPairing"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__BPSWatchSetupProxCardViewController__launchWatchAppForPairing__block_invoke_127;
  v4[3] = &unk_264408EE0;
  id v5 = v1;
  id v3 = v1;
  [v3 openSetupURL:v2 completion:v4];
}

void __64__BPSWatchSetupProxCardViewController__launchWatchAppForPairing__block_invoke_127(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = pbb_proxcard_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__BPSWatchSetupProxCardViewController__launchWatchAppForPairing__block_invoke_127_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "Launched Watch app", v6, 2u);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (void)_restoreWatchApp
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"RESTORING" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  [(BPSWatchSetupProxCardViewController *)self showActivityIndicatorWithStatus:v4];

  id v5 = [MEMORY[0x263F01880] defaultWorkspace];
  [v5 addObserver:self];

  uint8_t v6 = (void *)[objc_alloc(MEMORY[0x263F25520]) initWithBundleID:@"com.apple.Bridge"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__BPSWatchSetupProxCardViewController__restoreWatchApp__block_invoke;
  v7[3] = &unk_264408EE0;
  v7[4] = self;
  [v6 startWithErrorHandler:v7];
}

void __55__BPSWatchSetupProxCardViewController__restoreWatchApp__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = pbb_proxcard_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__BPSWatchSetupProxCardViewController__restoreWatchApp__block_invoke_cold_1();
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__BPSWatchSetupProxCardViewController__restoreWatchApp__block_invoke_133;
    block[3] = &unk_264408700;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t v6 = 0;
      _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "Restored Watch app", v6, 2u);
    }
  }
}

uint64_t __55__BPSWatchSetupProxCardViewController__restoreWatchApp__block_invoke_133(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"PAIR_FAILED" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  [*(id *)(a1 + 32) setSubtitle:v3];

  [*(id *)(a1 + 32) setPairing:0];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 hideActivityIndicator];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) bundleIdentifier];
        int v10 = [v9 isEqual:@"com.apple.Bridge"];

        if (v10)
        {
          char v11 = pbb_proxcard_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21C513000, v11, OS_LOG_TYPE_DEFAULT, "Watch app installed", buf, 2u);
          }

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __62__BPSWatchSetupProxCardViewController_applicationsDidInstall___block_invoke;
          block[3] = &unk_264408700;
          block[4] = self;
          dispatch_async(MEMORY[0x263EF83A0], block);
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

uint64_t __62__BPSWatchSetupProxCardViewController_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchWatchAppForPairing];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PRXFlowDelegate)mainController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  return (PRXFlowDelegate *)WeakRetained;
}

- (void)setMainController:(id)a3
{
}

- (BOOL)pairing
{
  return self->_pairing;
}

- (void)setPairing:(BOOL)a3
{
  self->_pairing = a3;
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_mainController);
  objc_storeStrong((id *)&self->_advertisingPayloadOrIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_extendedMetadata, 0);
  objc_storeStrong((id *)&self->_advertisementIdentifier, 0);
}

- (void)initWithUserInfo:(uint64_t)a3 withDismissCompletionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__BPSWatchSetupProxCardViewController__launchWatchAppForPairing__block_invoke_127_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C513000, v0, v1, "Open setup URL failed: %@", v2, v3, v4, v5, v6);
}

void __55__BPSWatchSetupProxCardViewController__restoreWatchApp__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C513000, v0, v1, "Restore Watch app failed: %@", v2, v3, v4, v5, v6);
}

@end