@interface FMFNoNetworkAlert
+ (BOOL)isAirplaneModeEnabled;
+ (BOOL)isGlobalCellularEnabled;
+ (id)alertInfoForInternetUnavailableReason:(unint64_t)a3;
+ (id)newAlertController;
+ (unint64_t)reasonForNoInternet;
- (BOOL)isGlobalCellularEnabled;
- (void)setGlobalCellularEnabled:(BOOL)a3;
@end

@implementation FMFNoNetworkAlert

+ (id)newAlertController
{
  uint64_t v2 = [(id)objc_opt_class() reasonForNoInternet];
  v3 = [(id)objc_opt_class() alertInfoForInternetUnavailableReason:v2];
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x263F1C3F8];
    v6 = [v3 title];
    v7 = [v4 message];
    v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    v9 = [v4 actionURL];

    if (v9)
    {
      v10 = (void *)MEMORY[0x263F1C3F0];
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"ALERT_NO_NETWORK_ACTION_BUTTON_SETTINGS" value:&stru_26CA0AD00 table:@"LocalizableUI"];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __39__FMFNoNetworkAlert_newAlertController__block_invoke;
      v19[3] = &unk_2643438A0;
      id v20 = v4;
      v13 = [v10 actionWithTitle:v12 style:0 handler:v19];

      [v8 addAction:v13];
    }
    v14 = (void *)MEMORY[0x263F1C3F0];
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"OK_BUTTON" value:&stru_26CA0AD00 table:@"LocalizableUI"];
    v17 = [v14 actionWithTitle:v16 style:0 handler:&__block_literal_global];

    [v8 addAction:v17];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __39__FMFNoNetworkAlert_newAlertController__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v2 = [*(id *)(a1 + 32) actionURL];
  [v3 openSensitiveURL:v2 withOptions:0];
}

+ (unint64_t)reasonForNoInternet
{
  if ([a1 isAirplaneModeEnabled]) {
    return 1;
  }
  if (([a1 isGlobalCellularEnabled] & 1) != 0
    || ([MEMORY[0x263F5FB28] deviceSupportsCellularData] & 1) == 0)
  {
    return 3;
  }
  return 2;
}

+ (id)alertInfoForInternetUnavailableReason:(unint64_t)a3
{
  v4 = objc_opt_new();
  switch(a3)
  {
    case 0uLL:
      v5 = LogCategory_Daemon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[FMFNoNetworkAlert alertInfoForInternetUnavailableReason:](v5);
      }

      id v6 = 0;
      goto LABEL_11;
    case 1uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = [v7 localizedStringForKey:@"ALERT_NO_NETWORK_TITLE_AIRPLANE_MODE" value:&stru_26CA0AD00 table:@"LocalizableUI"];
      v9 = objc_msgSend(v8, "fm_wifiToWLAN");
      [v4 setTitle:v9];

      v10 = NSURL;
      v11 = @"prefs:root=ROOT#AIRPLANE_MODE";
      goto LABEL_7;
    case 2uLL:
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"ALERT_NO_NETWORK_TITLE_CELLULAR_DISABLED" value:&stru_26CA0AD00 table:@"LocalizableUI"];
      v14 = objc_msgSend(v13, "fm_wifiToWLAN");
      [v4 setTitle:v14];

      v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"ALERT_NO_NETWORK_MESSAGE_CELLULAR_DISABLED" value:&stru_26CA0AD00 table:@"LocalizableUI"];
      v17 = objc_msgSend(v16, "fm_wifiToWLAN");
      [v4 setMessage:v17];

      v10 = NSURL;
      v11 = @"prefs:root=MOBILE_DATA_SETTINGS_ID";
LABEL_7:
      v18 = [v10 URLWithString:v11];
      [v4 setActionURL:v18];
      goto LABEL_9;
    case 3uLL:
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"ALERT_NO_NETWORK_TITLE_NO_INTERNET" value:&stru_26CA0AD00 table:@"LocalizableUI"];
      id v20 = objc_msgSend(v19, "fm_wifiToWLAN");
      [v4 setTitle:v20];

LABEL_9:
      break;
    default:
      break;
  }
  id v6 = v4;
LABEL_11:

  return v6;
}

+ (BOOL)isGlobalCellularEnabled
{
  uint64_t v2 = _CTServerConnectionCreateOnTargetQueue();
  if (v2)
  {
    _CTServerConnectionCopyCellularUsagePolicy();
    CFRelease((CFTypeRef)v2);
    LOBYTE(v2) = 0;
  }
  int v3 = [MEMORY[0x263F5FB28] isEnabled];
  if (v3) {
    LOBYTE(v3) = [MEMORY[0x263F5FB28] deviceSupportsCellularData];
  }
  return v2 & v3;
}

+ (BOOL)isAirplaneModeEnabled
{
  id v2 = objc_alloc_init(MEMORY[0x263F255D8]);
  [v2 refresh];
  char v3 = [v2 airplaneMode];

  return v3;
}

- (BOOL)isGlobalCellularEnabled
{
  return self->_globalCellularEnabled;
}

- (void)setGlobalCellularEnabled:(BOOL)a3
{
  self->_globalCellularEnabled = a3;
}

+ (void)alertInfoForInternetUnavailableReason:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2188D1000, log, OS_LOG_TYPE_ERROR, "No reason to show internet unavailable alert.", v1, 2u);
}

@end