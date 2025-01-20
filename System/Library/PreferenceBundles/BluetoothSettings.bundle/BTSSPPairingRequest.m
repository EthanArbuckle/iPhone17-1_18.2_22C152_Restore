@interface BTSSPPairingRequest
- (BOOL)hasLimitedSupportForHID;
- (BTSSPPairingRequest)initWithDevice:(id)a3 andSpecifier:(id)a4;
- (id)sanitizeNameForAlert:(id)a3;
- (int)pairingStyle;
- (void)acceptSSP:(int64_t)a3;
- (void)dealloc;
- (void)dismiss;
- (void)hidPairingResult:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPairingStyle:(int)a3 andPasskey:(id)a4;
- (void)show;
@end

@implementation BTSSPPairingRequest

- (BTSSPPairingRequest)initWithDevice:(id)a3 andSpecifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BTSSPPairingRequest;
  v9 = [(BTSSPPairingRequest *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:1];
    alert = v9->_alert;
    v9->_alert = (UIAlertController *)v10;

    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v9->_specifier, a4);
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v9 selector:sel_hidPairingResult_ name:*MEMORY[0x263F2B960] object:0];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  id delegate = self->_delegate;
  self->_id delegate = 0;

  device = self->_device;
  self->_device = 0;

  specifier = self->_specifier;
  self->_specifier = 0;

  alert = self->_alert;
  self->_alert = 0;

  v8.receiver = self;
  v8.super_class = (Class)BTSSPPairingRequest;
  [(BTSSPPairingRequest *)&v8 dealloc];
}

- (void)setDelegate:(id)a3
{
}

- (id)sanitizeNameForAlert:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F08B08] scannerWithString:v3];
  v5 = [MEMORY[0x263F08708] illegalCharacterSet];
  [v4 setCharactersToBeSkipped:v5];

  v6 = [MEMORY[0x263F089D8] string];
  id v7 = [MEMORY[0x263F089D8] string];
  while (1)
  {
    objc_super v8 = v7;
    v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v16 = v7;
    int v10 = [v4 scanUpToCharactersFromSet:v9 intoString:&v16];
    id v7 = v16;

    if (!v10) {
      break;
    }
    [v6 appendString:v7];
    v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    int v12 = [v4 scanCharactersFromSet:v11 intoString:0];

    if (v12) {
      [v6 appendString:@" "];
    }
  }
  if ((unint64_t)[v6 length] < 0x33)
  {
    id v13 = v6;
  }
  else
  {
    id v13 = [v6 substringToIndex:50];
  }
  objc_super v14 = v13;

  return v14;
}

- (int)pairingStyle
{
  return self->_pairingStyle;
}

- (void)setPairingStyle:(int)a3 andPasskey:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v85 = [v7 localizedStringForKey:@"PAIRING_TITLE" value:&stru_26F24FEE8 table:@"SSPAlert"];

  objc_super v8 = [(BluetoothDevice *)self->_device name];
  v84 = [(BTSSPPairingRequest *)self sanitizeNameForAlert:v8];

  self->_pairingStyle = a3;
  location[0] = 0;
  objc_initWeak(location, self);
  int v9 = [(BluetoothDevice *)self->_device type];
  int v10 = [(BluetoothDevice *)self->_device productId];
  int v11 = [(BluetoothDevice *)self->_device vendorId];
  BOOL v13 = v10 == 613 || v10 == 617;
  unsigned int v14 = (0x39u >> (v10 - 9)) & 1;
  if ((v10 - 777) >= 6) {
    unsigned int v14 = 0;
  }
  if (v11 != 1452) {
    unsigned int v14 = 0;
  }
  if (v11 == 76) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = v14;
  }
  BOOL v16 = v11 == 76 && v13;
  switch(a3)
  {
    case 0:
      v17 = NSString;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"JUST_WORKS_MESSAGE" value:&stru_26F24FEE8 table:@"SSPAlert"];
      v86 = objc_msgSend(v17, "stringWithFormat:", v19, v84);

      if (v9 == 25) {
        int v20 = 1;
      }
      else {
        int v20 = v15;
      }
      if ((v20 | v16) == 1 && [(BTSSPPairingRequest *)self hasLimitedSupportForHID])
      {
        int v21 = MGGetBoolAnswer();
        v22 = @"WIFI";
        if (v21) {
          v22 = @"WLAN";
        }
        v23 = v22;
        v24 = [NSString stringWithFormat:@"%@_JUST_WORKS_MESSAGE_HID_OLD", v23];
        v25 = NSString;
        v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v27 = [v26 localizedStringForKey:v24 value:&stru_26F24FEE8 table:@"SSPAlert"];
        uint64_t v28 = objc_msgSend(v25, "stringWithFormat:", v27, v84);

        v86 = (void *)v28;
      }
      v29 = (void *)MEMORY[0x263F82400];
      v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"PAIR_BUTTON" value:&stru_26F24FEE8 table:@"SSPAlert"];
      v93[0] = MEMORY[0x263EF8330];
      v93[1] = 3221225472;
      v93[2] = __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke;
      v93[3] = &unk_26503DE10;
      v32 = &v94;
      objc_copyWeak(&v94, location);
      uint64_t v33 = [v29 actionWithTitle:v31 style:0 handler:v93];
      goto LABEL_36;
    case 1:
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"%06u", objc_msgSend(v6, "unsignedIntValue"));
      v35 = NSString;
      v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v37 = [v36 localizedStringForKey:@"NUMERIC_MESSAGE" value:&stru_26F24FEE8 table:@"SSPAlert"];
      v86 = objc_msgSend(v35, "stringWithFormat:", v37, v84, v84);

      v38 = (void *)MEMORY[0x263F82400];
      v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v40 = [v39 localizedStringForKey:@"PAIR_BUTTON" value:&stru_26F24FEE8 table:@"SSPAlert"];
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_2;
      v91[3] = &unk_26503DE10;
      objc_copyWeak(&v92, location);
      v41 = [v38 actionWithTitle:v40 style:0 handler:v91];

      objc_destroyWeak(&v92);
      break;
    case 2:
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"%06u", objc_msgSend(v6, "unsignedIntValue"));
      v42 = NSString;
      v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v44 = [v43 localizedStringForKey:@"PASSKEY_MESSAGE" value:&stru_26F24FEE8 table:@"SSPAlert"];
      v86 = objc_msgSend(v42, "stringWithFormat:", v44, v84, v84);
      goto LABEL_30;
    case 3:
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"%04u", objc_msgSend(v6, "unsignedIntValue"));
      v45 = NSString;
      v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v44 = [v43 localizedStringForKey:@"HID_MESSAGE" value:&stru_26F24FEE8 table:@"SSPAlert"];
      v86 = objc_msgSend(v45, "stringWithFormat:", v44, v84);
LABEL_30:

      v41 = 0;
      break;
    case 4:
      v46 = NSString;
      v47 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v48 = [v47 localizedStringForKey:@"JUST_WORKS_MESSAGE" value:&stru_26F24FEE8 table:@"SSPAlert"];
      v86 = objc_msgSend(v46, "stringWithFormat:", v48, v84);

      if ([(BTSSPPairingRequest *)self hasLimitedSupportForHID])
      {
        int v49 = MGGetBoolAnswer();
        v50 = @"WIFI_JUST_WORKS_MESSAGE_HID_OLD";
        if (v49) {
          v50 = @"WLAN_JUST_WORKS_MESSAGE_HID_OLD";
        }
        v51 = v50;
        v52 = NSString;
        v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v54 = [v53 localizedStringForKey:v51 value:&stru_26F24FEE8 table:@"SSPAlert"];
        uint64_t v55 = objc_msgSend(v52, "stringWithFormat:", v54, v84);

        v86 = (void *)v55;
      }
      v56 = (void *)MEMORY[0x263F82400];
      v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"PAIR_BUTTON" value:&stru_26F24FEE8 table:@"SSPAlert"];
      v89[0] = MEMORY[0x263EF8330];
      v89[1] = 3221225472;
      v89[2] = __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_3;
      v89[3] = &unk_26503DE10;
      v32 = &v90;
      objc_copyWeak(&v90, location);
      uint64_t v33 = [v56 actionWithTitle:v31 style:0 handler:v89];
LABEL_36:
      v41 = (void *)v33;

      objc_destroyWeak(v32);
      v34 = 0;
      break;
    default:
      v41 = 0;
      v34 = 0;
      v86 = 0;
      break;
  }
  [(UIAlertController *)self->_alert setTitle:v85];
  [(UIAlertController *)self->_alert setMessage:v86];
  if (v34)
  {
    id v57 = objc_alloc_init(MEMORY[0x263F828E0]);
    id v83 = v6;
    id v58 = objc_alloc(MEMORY[0x263F089B8]);
    v59 = [NSString stringWithFormat:@"%@\r\n", v34];
    v60 = (void *)[v58 initWithString:v59];

    v61 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83610]];
    uint64_t v62 = [v34 length];
    objc_msgSend(v60, "addAttribute:value:range:", *MEMORY[0x263F814F0], v61, 0, v62);

    [v57 setAttributedText:v60];
    [v57 setNumberOfLines:0];
    [v57 setTextAlignment:1];
    [v57 setBaselineAdjustment:1];
    [v57 setAdjustsFontSizeToFitWidth:1];
    [v57 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v63 = objc_alloc_init(MEMORY[0x263F82E10]);
    v64 = [v63 view];
    objc_msgSend(v64, "setFrame:", 0.0, 0.0, 50.0, 50.0);

    v65 = [v63 view];
    [v65 addSubview:v57];

    v66 = [v57 centerXAnchor];
    v67 = [v63 view];
    v68 = [v67 centerXAnchor];
    v69 = [v66 constraintEqualToAnchor:v68];
    [v69 setActive:1];

    v70 = [v57 topAnchor];
    v71 = [v63 view];
    v72 = [v71 topAnchor];
    v73 = [v70 constraintEqualToAnchor:v72 constant:20.0];
    [v73 setActive:1];

    v74 = [v57 bottomAnchor];
    v75 = [v63 view];
    v76 = [v75 bottomAnchor];
    v77 = [v74 constraintEqualToAnchor:v76 constant:-20.0];
    [v77 setActive:1];

    v78 = [v63 view];
    objc_msgSend(v78, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
    objc_msgSend(v63, "setPreferredContentSize:");

    [(UIAlertController *)self->_alert setContentViewController:v63];
    id v6 = v83;
  }
  v79 = (void *)MEMORY[0x263F82400];
  v80 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v81 = [v80 localizedStringForKey:@"CANCEL_BUTTON" value:&stru_26F24FEE8 table:@"SSPAlert"];
  v87[0] = MEMORY[0x263EF8330];
  v87[1] = 3221225472;
  v87[2] = __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_4;
  v87[3] = &unk_26503DE10;
  objc_copyWeak(&v88, location);
  v82 = [v79 actionWithTitle:v81 style:0 handler:v87];

  [(UIAlertController *)self->_alert addAction:v82];
  if (v41) {
    [(UIAlertController *)self->_alert addAction:v41];
  }
  objc_destroyWeak(&v88);
  objc_destroyWeak(location);
}

void __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained acceptSSP:0];
}

void __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained acceptSSP:0];
}

void __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained acceptSSP:0];
}

void __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained acceptSSP:1];
}

- (void)show
{
}

- (void)dismiss
{
}

- (void)hidPairingResult:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    id v7 = [(BluetoothDevice *)self->_device name];
    int v8 = 138412546;
    int v9 = v6;
    __int16 v10 = 2112;
    int v11 = v7;
    _os_log_impl(&dword_23EB2E000, v5, OS_LOG_TYPE_DEFAULT, "Received %@ for device %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)acceptSSP:(int64_t)a3
{
  int pairingStyle = self->_pairingStyle;
  if (a3 == 1)
  {
    if (pairingStyle == 4 || pairingStyle == 3)
    {
      device = self->_device;
      [(BluetoothDevice *)device setPIN:0];
      return;
    }
  }
  else if (pairingStyle == 4)
  {
    id v7 = [NSNumber numberWithInt:0];
    int v8 = self->_device;
    int v9 = objc_msgSend(NSString, "stringWithFormat:", @"%04u", objc_msgSend(v7, "unsignedIntValue"));
    [(BluetoothDevice *)v8 setPIN:v9];

    __int16 v10 = [(PSSpecifier *)self->_specifier userInfo];
    [v10 setObject:@"entered" forKey:@"PIN-ended"];
  }
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    uint64_t v12 = self->_device;
    [delegate setSSPConfirmation:a3 forDevice:v12];
  }
  else
  {
    BOOL v13 = [(PSSpecifier *)self->_specifier userInfo];
    unsigned int v14 = v13;
    if (a3) {
      unsigned int v15 = @"cancelled";
    }
    else {
      unsigned int v15 = @"accepted";
    }
    [v13 setObject:v15 forKey:@"PIN-ended"];

    id v16 = [MEMORY[0x263F2B998] sharedInstance];
    [v16 acceptSSP:a3 forDevice:self->_device];
  }
}

- (BOOL)hasLimitedSupportForHID
{
  return MGIsDeviceOneOfType();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_specifier, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end