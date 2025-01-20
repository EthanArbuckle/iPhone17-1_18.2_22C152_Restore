@interface BTAlert
- (BOOL)isiPhone;
- (BTAlert)initWithDevice:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)show;
- (void)showAlertWithResult:(id)a3;
- (void)userActionResponseWithUnpairStatus:(BOOL)a3;
@end

@implementation BTAlert

- (BTAlert)initWithDevice:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BTAlert;
  v6 = [(BTAlert *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:1];
    alert = v6->_alert;
    v6->_alert = (UIAlertController *)v7;

    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    alert = self->_alert;
    *(_DWORD *)buf = 138412290;
    objc_super v10 = alert;
    _os_log_impl(&dword_23EB2E000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc BTAlert : %@", buf, 0xCu);
  }

  delegate = self->_delegate;
  self->_delegate = 0;

  device = self->_device;
  self->_device = 0;

  uint64_t v7 = self->_alert;
  self->_alert = 0;

  [(BTAlert *)self dismiss];
  v8.receiver = self;
  v8.super_class = (Class)BTAlert;
  [(BTAlert *)&v8 dealloc];
}

- (void)showAlertWithResult:(id)a3
{
  id v4 = a3;
  location[0] = 0;
  objc_initWeak(location, self);
  int v5 = [v4 unsignedIntValue];
  if ((v5 - 151) <= 0x1E)
  {
    if (((1 << (v5 + 105)) & 0x40008081) != 0)
    {
      v6 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EB2E000, v6, OS_LOG_TYPE_DEFAULT, "Show alert for BT_ERROR_INVALID_LINK_KEY using UIAlertController", buf, 2u);
      }

      uint64_t v7 = NSString;
      objc_super v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v9 = [v8 localizedStringForKey:@"ERROR_MISSING_LINK_KEY" value:&stru_26F24FEE8 table:@"Devices"];
      objc_super v10 = [(BTSDevice *)self->_device name];
      uint64_t v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);

      v12 = (void *)MEMORY[0x263F82400];
      v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v14 = [v13 localizedStringForKey:@"FORGET_DEVICE" value:&stru_26F24FEE8 table:@"Devices"];
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __31__BTAlert_showAlertWithResult___block_invoke_26;
      v65[3] = &unk_26503DE10;
      v15 = &v66;
      objc_copyWeak(&v66, location);
      v16 = [v12 actionWithTitle:v14 style:0 handler:v65];

      [(UIAlertController *)self->_alert addAction:v16];
      goto LABEL_25;
    }
    if (v5 == 156)
    {
      v17 = NSString;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"ERROR_INCORRECT_PIN" value:&stru_26F24FEE8 table:@"Devices"];
      v20 = [(BTSDevice *)self->_device name];
      uint64_t v11 = objc_msgSend(v17, "stringWithFormat:", v19, v20);

      v21 = (void *)MEMORY[0x263F82400];
      v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v23 = [v22 localizedStringForKey:@"OK" value:&stru_26F24FEE8 table:@"Devices"];
      v68[0] = MEMORY[0x263EF8330];
      v68[1] = 3221225472;
      v68[2] = __31__BTAlert_showAlertWithResult___block_invoke_3;
      v68[3] = &unk_26503DE10;
      v15 = &v69;
      objc_copyWeak(&v69, location);
      v16 = [v21 actionWithTitle:v23 style:0 handler:v68];

      [(UIAlertController *)self->_alert addAction:v16];
LABEL_25:
      objc_destroyWeak(v15);
      goto LABEL_26;
    }
  }
  if (v5 == 1)
  {
    if (![(BTSDevice *)self->_device paired])
    {
      v46 = NSString;
      v47 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v48 = [v47 localizedStringForKey:@"ERROR_PAIRING_TIMEOUT" value:&stru_26F24FEE8 table:@"Devices"];
      v49 = NSString;
      v50 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v51 = [v50 localizedStringForKey:@"ERROR_GEN_PAIRING_FAILURE" value:&stru_26F24FEE8 table:@"Devices"];
      v52 = [(BTSDevice *)self->_device name];
      v53 = objc_msgSend(v49, "stringWithFormat:", v51, v52);
      uint64_t v11 = [v46 stringWithFormat:@"%@ %@", v48, v53];

      v54 = (void *)MEMORY[0x263F82400];
      v55 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v56 = [v55 localizedStringForKey:@"OK" value:&stru_26F24FEE8 table:@"Devices"];
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __31__BTAlert_showAlertWithResult___block_invoke_2_36;
      v63[3] = &unk_26503DE10;
      v15 = &v64;
      objc_copyWeak(&v64, location);
      v16 = [v54 actionWithTitle:v56 style:0 handler:v63];

      [(UIAlertController *)self->_alert addAction:v16];
      goto LABEL_25;
    }
  }
  else if (v5 == 109)
  {
    v24 = NSString;
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"ERROR_UNSUPPORTED_DEVICE" value:&stru_26F24FEE8 table:@"Devices"];
    v27 = [(BTSDevice *)self->_device name];
    uint64_t v11 = objc_msgSend(v24, "stringWithFormat:", v26, v27);

    BOOL v28 = [(BTSDevice *)self->_device paired];
    v29 = (void *)MEMORY[0x263F82400];
    if (v28)
    {
      v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"FORGET_DEVICE" value:&stru_26F24FEE8 table:@"Devices"];
      v72[0] = MEMORY[0x263EF8330];
      v72[1] = 3221225472;
      v72[2] = __31__BTAlert_showAlertWithResult___block_invoke;
      v72[3] = &unk_26503DE10;
      v32 = &v73;
      objc_copyWeak(&v73, location);
      uint64_t v33 = [v29 actionWithTitle:v31 style:2 handler:v72];
    }
    else
    {
      v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"OK" value:&stru_26F24FEE8 table:@"Devices"];
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __31__BTAlert_showAlertWithResult___block_invoke_2;
      v70[3] = &unk_26503DE10;
      v32 = &v71;
      objc_copyWeak(&v71, location);
      uint64_t v33 = [v29 actionWithTitle:v31 style:0 handler:v70];
    }
    v16 = (void *)v33;

    objc_destroyWeak(v32);
    [(UIAlertController *)self->_alert addAction:v16];
    goto LABEL_26;
  }
  if ([(BTSDevice *)self->_device paired])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(BTSDevice *)self->_device classicDevice],
          v34 = objc_claimAutoreleasedReturnValue(),
          int v35 = [v34 isProController],
          v34,
          v35))
    {
      v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v37 = [v36 localizedStringForKey:@"ERROR_PRO_CONTROLLER_CONNECTION_FAILURE" value:&stru_26F24FEE8 table:@"Devices"];
    }
    else
    {
      v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v37 = [v36 localizedStringForKey:@"ERROR_GEN_CONNECTION_FAILURE" value:&stru_26F24FEE8 table:@"Devices"];
    }
  }
  else
  {
    v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v37 = [v36 localizedStringForKey:@"ERROR_GEN_PAIRING_FAILURE" value:&stru_26F24FEE8 table:@"Devices"];
  }
  v38 = (void *)v37;

  v39 = NSString;
  id v62 = 0;
  v40 = [(BTSDevice *)self->_device name];
  uint64_t v11 = [v39 stringWithValidatedFormat:v38, @"%@", &v62, v40 validFormatSpecifiers error];
  id v41 = v62;

  if (v11)
  {
    v42 = (void *)MEMORY[0x263F82400];
    v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v44 = [v43 localizedStringForKey:@"OK" value:&stru_26F24FEE8 table:@"Devices"];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __31__BTAlert_showAlertWithResult___block_invoke_47;
    v60[3] = &unk_26503DE10;
    objc_copyWeak(&v61, location);
    v16 = [v42 actionWithTitle:v44 style:0 handler:v60];

    [(UIAlertController *)self->_alert addAction:v16];
    objc_destroyWeak(&v61);

LABEL_26:
    alert = self->_alert;
    if ([(BTSDevice *)self->_device paired])
    {
      v58 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v58 localizedStringForKey:@"CONNECTION_FAILED_TITLE" value:&stru_26F24FEE8 table:@"Devices"];
    }
    else
    {
      v58 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v58 localizedStringForKey:@"PAIRING_FAILED_TITLE" value:&stru_26F24FEE8 table:@"Devices"];
    v59 = };
    [(UIAlertController *)alert setTitle:v59];

    [(UIAlertController *)self->_alert setMessage:v11];
    [(BTAlertDelegate *)self->_delegate showAlert:self->_alert];
    goto LABEL_30;
  }
  v45 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
    -[BTAlert showAlertWithResult:]((uint64_t)v41, v45);
  }

  uint64_t v11 = 0;
  v16 = 0;
LABEL_30:
  objc_destroyWeak(location);
}

void __31__BTAlert_showAlertWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained userActionResponseWithUnpairStatus:1];
}

void __31__BTAlert_showAlertWithResult___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained userActionResponseWithUnpairStatus:0];
}

void __31__BTAlert_showAlertWithResult___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained userActionResponseWithUnpairStatus:0];
}

void __31__BTAlert_showAlertWithResult___block_invoke_26(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained userActionResponseWithUnpairStatus:1];
}

void __31__BTAlert_showAlertWithResult___block_invoke_2_36(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained userActionResponseWithUnpairStatus:0];
}

void __31__BTAlert_showAlertWithResult___block_invoke_47(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained userActionResponseWithUnpairStatus:0];
}

- (void)setDelegate:(id)a3
{
}

- (void)show
{
}

- (void)userActionResponseWithUnpairStatus:(BOOL)a3
{
  if (a3) {
    [(BTSDevice *)self->_device unpair];
  }
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    [(BTAlertDelegate *)delegate performSelector:sel_alertSheetDismissed_ withObject:self];
  }
}

- (BOOL)isiPhone
{
  v2 = MGGetStringAnswer();
  char v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_alert, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)showAlertWithResult:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_23EB2E000, a2, OS_LOG_TYPE_ERROR, "bad format string for alert (%@): %@", (uint8_t *)&v2, 0x16u);
}

@end