@interface BCSAlertController
- (BCSAlertControllerDelegate)delegate;
- (id)_createHeaderViewControllerWithAction:(id)a3;
- (id)_createHeaderViewControllerWithAppIdentifier:(id)a3;
- (id)_createPreviewControllerForDataDetectionActionPickerItem:(id)a3;
- (id)_createPreviewControllerWithText:(id)a3;
- (id)_createSeparatorView;
- (void)_addActionForHandlingAlertDismissal:(id)a3;
- (void)_configurePopoverPresentationControllerForAlertController:(id)a3 fromViewController:(id)a4;
- (void)setDelegate:(id)a3;
- (void)showActionPickerViewForAction:(id)a3 fromViewController:(id)a4;
- (void)showErrorExplanationForAction:(id)a3 error:(id)a4 fromViewController:(id)a5;
- (void)showFirstTimePromptToOpenApp:(id)a3 fromViewController:(id)a4;
- (void)showICloudSignInPromptWithTitle:(id)a3 message:(id)a4 fromViewController:(id)a5;
- (void)showInvalidDataAlertForAction:(id)a3 fromViewController:(id)a4;
@end

@implementation BCSAlertController

- (id)_createHeaderViewControllerWithAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 defaultActionTargetApplicationBundleIdentifier];
  if ([(__CFString *)v5 isEqualToString:@"com.apple.mobilesafari"])
  {
    v6 = [v4 urlThatCanBeOpened];

    if (!v6)
    {

      v5 = @"com.apple.barcodescanner.text-only";
    }
  }
  v7 = [(BCSAlertController *)self _createHeaderViewControllerWithAppIdentifier:v5];

  return v7;
}

- (id)_createHeaderViewControllerWithAppIdentifier:(id)a3
{
  v71[12] = *MEMORY[0x263EF8340];
  id v61 = a3;
  id v58 = objc_alloc_init(MEMORY[0x263F82E10]);
  v65 = [v58 view];
  v60 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if ([v61 isEqualToString:@"com.apple.barcodescanner.icloud"])
  {
    id v4 = [MEMORY[0x263F827E8] imageNamed:@"iCloud" inBundle:v60];
    v63 = [v4 _applicationIconImageForFormat:0 precomposed:1];

    v62 = _BCSLocalizedString();
    goto LABEL_28;
  }
  if ([v61 isEqualToString:@"com.apple.barcodescanner.invalid-data.qr"]) {
    goto LABEL_4;
  }
  if ([v61 isEqualToString:@"com.apple.barcodescanner.invalid-data.appclip"])
  {
    v6 = [MEMORY[0x263F827E8] imageNamed:@"Viewfinder-20" inBundle:v60];
    v63 = [v6 _applicationIconImageForFormat:0 precomposed:1];

    v62 = _BCSLocalizedString();
  }
  else
  {
    if ([v61 isEqualToString:@"com.apple.barcodescanner.text-only"])
    {
LABEL_4:
      v5 = [MEMORY[0x263F827E8] imageNamed:@"QRCode-20" inBundle:v60];
      v63 = [v5 _applicationIconImageForFormat:0 precomposed:1];

      v62 = _BCSLocalizedString();
      goto LABEL_28;
    }
    if ([v61 isEqualToString:@"com.apple.barcodescanner.wifi"])
    {
      v7 = [MEMORY[0x263F827E8] imageNamed:@"Wi-Fi-20" inBundle:v60];
      v63 = [v7 _applicationIconImageForFormat:0 precomposed:1];

      MGGetBoolAnswer();
      v62 = _BCSLocalizedString();
    }
    else
    {
      id v8 = [getLSApplicationProxyClass() applicationProxyForIdentifier:v61];
      double v9 = *(double *)&screenScale_scale;
      if (*(double *)&screenScale_scale == 0.0)
      {
        v10 = [MEMORY[0x263F82B60] mainScreen];
        [v10 scale];
        screenScale_scale = v11;

        double v9 = *(double *)&screenScale_scale;
      }
      if (v9 == 2.0) {
        unsigned int v12 = 17;
      }
      else {
        unsigned int v12 = 4;
      }
      if (v9 == 3.0) {
        uint64_t v13 = 34;
      }
      else {
        uint64_t v13 = v12;
      }
      v14 = [v8 iconDataForVariant:v13];
      if (v14)
      {
        uint64_t v67 = 0;
        v68 = &v67;
        uint64_t v69 = 0x2020000000;
        v15 = (uint64_t (*)(void *))getLICreateIconFromCachedBitmapSymbolLoc_ptr;
        v70 = getLICreateIconFromCachedBitmapSymbolLoc_ptr;
        if (!getLICreateIconFromCachedBitmapSymbolLoc_ptr)
        {
          v66[0] = MEMORY[0x263EF8330];
          v66[1] = 3221225472;
          v66[2] = __getLICreateIconFromCachedBitmapSymbolLoc_block_invoke;
          v66[3] = &unk_26524C3F8;
          v66[4] = &v67;
          __getLICreateIconFromCachedBitmapSymbolLoc_block_invoke((uint64_t)v66);
          v15 = (uint64_t (*)(void *))v68[3];
        }
        _Block_object_dispose(&v67, 8);
        if (!v15) {
          -[BCSAlertController _createHeaderViewControllerWithAppIdentifier:]();
        }
        v16 = (CGImage *)v15(v14);
        if (v16)
        {
          v63 = [MEMORY[0x263F827E8] imageWithCGImage:v16 scale:0 orientation:v9];
        }
        else
        {
          v63 = 0;
        }
        CGImageRelease(v16);
      }
      else
      {
        v63 = 0;
      }

      v17 = [v8 localizedName];
      v62 = [v17 uppercaseString];
    }
  }
LABEL_28:
  if (v63)
  {
    v18 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v63];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v18 setAccessibilityIgnoresInvertColors:1];
    [v65 addSubview:v18];
    if ([v62 length])
    {
      id v64 = objc_alloc_init(MEMORY[0x263F828E0]);
      v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
      [v64 setFont:v19];

      [v64 setText:v62];
      v20 = [MEMORY[0x263F825C8] grayColor];
      [v64 setTextColor:v20];

      [v64 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v64 setAdjustsFontSizeToFitWidth:1];
      [v65 addSubview:v64];
      v59 = [(BCSAlertController *)self _createSeparatorView];
      [v65 addSubview:v59];
      v32 = (void *)MEMORY[0x263F08938];
      v57 = [v18 leadingAnchor];
      v56 = [v65 leadingAnchor];
      v55 = [v57 constraintEqualToAnchor:v56 constant:16.0];
      v71[0] = v55;
      v54 = [v18 centerYAnchor];
      v53 = [v65 centerYAnchor];
      v52 = [v54 constraintEqualToAnchor:v53];
      v71[1] = v52;
      v51 = [v18 heightAnchor];
      v50 = [v51 constraintEqualToConstant:20.0];
      v71[2] = v50;
      v49 = [v18 widthAnchor];
      v48 = [v18 heightAnchor];
      v47 = [v49 constraintEqualToAnchor:v48];
      v71[3] = v47;
      v46 = [v64 leadingAnchor];
      v45 = [v18 trailingAnchor];
      v44 = [v46 constraintEqualToAnchor:v45 constant:8.0];
      v71[4] = v44;
      v42 = [v64 trailingAnchor];
      v43 = [v65 trailingAnchor];
      v41 = [v42 constraintLessThanOrEqualToAnchor:v43];
      v71[5] = v41;
      v40 = [v64 centerYAnchor];
      v39 = [v65 centerYAnchor];
      v38 = [v40 constraintEqualToAnchor:v39];
      v71[6] = v38;
      v37 = [v65 heightAnchor];
      v36 = [v37 constraintEqualToConstant:52.0];
      v71[7] = v36;
      v35 = [v59 leadingAnchor];
      v34 = [v65 leadingAnchor];
      v33 = [v35 constraintEqualToAnchor:v34];
      v71[8] = v33;
      v21 = [v59 trailingAnchor];
      v22 = [v65 trailingAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      v71[9] = v23;
      v24 = [v59 bottomAnchor];
      v25 = [v65 bottomAnchor];
      v26 = [v24 constraintEqualToAnchor:v25];
      v71[10] = v26;
      v27 = [v59 heightAnchor];
      _bcs_pixelLength();
      v28 = objc_msgSend(v27, "constraintEqualToConstant:");
      v71[11] = v28;
      v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:12];
      [v32 activateConstraints:v29];

      id v30 = v58;
    }
    else
    {
      id v30 = 0;
    }
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (id)_createSeparatorView
{
  v2 = [MEMORY[0x263F824D8] effectWithStyle:1200];
  v3 = [MEMORY[0x263F82DF0] _effectForBlurEffect:v2 vibrancyStyle:120];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v3];
  v5 = [MEMORY[0x263F825C8] whiteColor];
  v6 = [v4 contentView];
  [v6 setBackgroundColor:v5];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v4;
}

- (id)_createPreviewControllerWithText:(id)a3
{
  v49[9] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F82E10];
  id v5 = a3;
  id v26 = objc_alloc_init(v4);
  v6 = [v26 view];
  v7 = [(BCSAlertController *)self _createSeparatorView];
  objc_msgSend(v6, "addSubview:");
  id v8 = objc_alloc_init(MEMORY[0x263F82D60]);
  [v8 setText:v5];

  double v9 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
  [v8 setFont:v9];

  [v8 setDataDetectorTypes:-1];
  [v8 setEditable:0];
  [v8 setScrollEnabled:0];
  v10 = [v8 textContainer];
  [v10 setLineBreakMode:4];

  uint64_t v11 = [MEMORY[0x263F825C8] clearColor];
  [v8 setBackgroundColor:v11];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  unsigned int v12 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v13 = [v8 linkTextAttributes];
  v14 = [v12 dictionaryWithDictionary:v13];

  v15 = [MEMORY[0x263F825C8] blueColor];
  v48 = v14;
  [v14 setValue:v15 forKey:*MEMORY[0x263F81500]];

  [v14 setValue:&unk_26FCC6510 forKey:*MEMORY[0x263F815F8]];
  v16 = [NSDictionary dictionaryWithDictionary:v14];
  [v8 setLinkTextAttributes:v16];

  [v6 addSubview:v8];
  v35 = (void *)MEMORY[0x263F08938];
  v47 = [v7 heightAnchor];
  _bcs_pixelLength();
  v46 = objc_msgSend(v47, "constraintEqualToConstant:");
  v49[0] = v46;
  v45 = [v7 leadingAnchor];
  v43 = [v6 leadingAnchor];
  v42 = [v45 constraintEqualToAnchor:v43];
  v49[1] = v42;
  v44 = v7;
  v41 = [v7 trailingAnchor];
  v40 = [v6 trailingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v49[2] = v39;
  v38 = [v7 topAnchor];
  v37 = [v6 topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v49[3] = v36;
  v34 = [v8 centerXAnchor];
  v33 = [v6 centerXAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v49[4] = v32;
  v31 = [v8 leadingAnchor];
  id v30 = [v6 leadingAnchor];
  v29 = [v31 constraintGreaterThanOrEqualToAnchor:v30 constant:20.0];
  v49[5] = v29;
  v28 = [v8 trailingAnchor];
  v27 = [v6 trailingAnchor];
  v17 = [v28 constraintLessThanOrEqualToAnchor:v27 constant:-20.0];
  v49[6] = v17;
  v18 = [v8 topAnchor];
  v19 = [v6 topAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:10.0];
  v49[7] = v20;
  v21 = [v8 bottomAnchor];
  v22 = [v6 bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:-10.0];
  v49[8] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:9];
  [v35 activateConstraints:v24];

  return v26;
}

- (id)_createPreviewControllerForDataDetectionActionPickerItem:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  v3 = [a3 icsString];
  if ([v3 length])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F04B98]);
    v15[0] = @"ICS";
    v15[1] = @"NotificationStyle";
    v16[0] = v3;
    v16[1] = MEMORY[0x263EFFA88];
    id v5 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    v6 = DDUIEventForResults();

    v7 = [v6 startDate];
    id v8 = objc_alloc(MEMORY[0x263F04C60]);
    double v9 = [v6 endDate];
    v10 = (void *)[v8 initWithDate:v7 event:v6 overriddenEventStartDate:v7 overriddenEventEndDate:v9];

    id v14 = 0;
    char v11 = [v4 removeEvent:v6 span:0 error:&v14];
    id v12 = v14;
    if ((v11 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BCSAlertController _createPreviewControllerForDataDetectionActionPickerItem:](v12);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_configurePopoverPresentationControllerForAlertController:(id)a3 fromViewController:(id)a4
{
  id v5 = a4;
  id v9 = [a3 popoverPresentationController];
  v6 = [v5 view];

  [v9 setSourceView:v6];
  [v6 center];
  double v8 = v7;
  [v6 size];
  [v9 setSourceRect:v8];
  [v9 setPermittedArrowDirections:0];
}

- (void)_addActionForHandlingAlertDismissal:(id)a3
{
  id v4 = a3;
  if (_bcs_deviceIsPad())
  {
    id v5 = (void *)MEMORY[0x263F82400];
    v6 = _BCSLocalizedString();
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__BCSAlertController__addActionForHandlingAlertDismissal___block_invoke;
    v8[3] = &unk_26524C380;
    v8[4] = self;
    double v7 = [v5 actionWithTitle:v6 style:1 handler:v8];
    [v4 addAction:v7];
  }
}

void __58__BCSAlertController__addActionForHandlingAlertDismissal___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained alertControllerDidCancel:*(void *)(a1 + 32)];
}

- (void)showActionPickerViewForAction:(id)a3 fromViewController:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  if (v6)
  {
    double v8 = [v6 presentedViewController];

    if (v8)
    {
      BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v9) {
        -[BCSAlertController showActionPickerViewForAction:fromViewController:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
      goto LABEL_29;
    }
    id v47 = objc_alloc_init(MEMORY[0x263F82418]);
    [v47 setPreferredStyle:0];
    v25 = [(BCSAlertController *)self _createHeaderViewControllerWithAction:v5];
    id v26 = [v5 actionPickerItems];
    uint64_t v27 = [v26 firstObject];
    objc_opt_class();
    v45 = (void *)v27;
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(BCSAlertController *)self _createPreviewControllerForDataDetectionActionPickerItem:v27], (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v29 = v28;
      id v30 = 0;
    }
    else
    {
      if ([v5 conformsToProtocol:&unk_26FCC81F0])
      {
        id v30 = [v5 extraPreviewText];
      }
      else
      {
        id v30 = 0;
      }
      if (![v30 length])
      {
        v43 = 0;
        v44 = v30;
        goto LABEL_19;
      }
      uint64_t v29 = [(BCSAlertController *)self _createPreviewControllerWithText:v30];
    }
    v43 = (void *)v29;
    v44 = v30;
    if (v29 && v25)
    {
      objc_msgSend(v47, "_setHeaderContentViewController:", v25, v29, v30, v27);
      [v47 setContentViewController:v29];
LABEL_21:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id obj = v26;
      uint64_t v33 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v60 != v35) {
              objc_enumerationMutation(obj);
            }
            v37 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            v38 = objc_msgSend(v37, "label", v43);
            v55[0] = MEMORY[0x263EF8330];
            v55[1] = 3221225472;
            v55[2] = __71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke;
            v55[3] = &unk_26524BF80;
            id v56 = WeakRetained;
            v57 = self;
            id v58 = v37;
            v52[0] = MEMORY[0x263EF8330];
            v52[1] = 3221225472;
            v52[2] = __71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke_2;
            v52[3] = &unk_26524C3A8;
            id v53 = v56;
            v54 = v37;
            [v47 _addActionWithTitle:v38 style:0 handler:v55 shouldDismissHandler:v52];
          }
          uint64_t v34 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
        }
        while (v34);
      }

      v39 = (void *)MEMORY[0x263F82400];
      v40 = _BCSLocalizedString();
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke_3;
      v49[3] = &unk_26524C3D0;
      id v50 = WeakRetained;
      v51 = self;
      id v41 = WeakRetained;
      v42 = [v39 actionWithTitle:v40 style:1 handler:v49];
      [v47 addAction:v42];

      [(BCSAlertController *)self _configurePopoverPresentationControllerForAlertController:v47 fromViewController:v7];
      [v7 presentViewController:v47 animated:1 completion:0];

      goto LABEL_29;
    }
LABEL_19:
    if (v25)
    {
      objc_msgSend(v47, "_setHeaderContentViewController:", v25, v43, v44, v27);
      v31 = [v5 localizedDefaultActionDescription];
      [v47 setMessage:v31];
    }
    goto LABEL_21;
  }
  BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v17) {
    -[BCSAlertController showActionPickerViewForAction:fromViewController:](v17, v18, v19, v20, v21, v22, v23, v24);
  }
LABEL_29:
}

uint64_t __71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return [*(id *)(a1 + 32) alertController:*(void *)(a1 + 40) didSelectActionItem:*(void *)(a1 + 48)];
  }
  else {
    return [*(id *)(a1 + 48) performAction];
  }
}

uint64_t __71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return 1;
  }
  else {
    return [*(id *)(a1 + 40) shouldDismissAlertWhenActionIsTaken];
  }
}

void *__71__BCSAlertController_showActionPickerViewForAction_fromViewController___block_invoke_3(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result alertControllerDidCancel:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)showFirstTimePromptToOpenApp:(id)a3 fromViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if (v7)
    {
      double v8 = [v7 presentedViewController];

      if (v8)
      {
        BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v9) {
          -[BCSAlertController showActionPickerViewForAction:fromViewController:](v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
      else
      {
        id v33 = objc_alloc_init(MEMORY[0x263F82418]);
        [v33 setPreferredStyle:0];
        v45 = [(BCSAlertController *)self _createHeaderViewControllerWithAppIdentifier:v6];
        [v33 _setHeaderContentViewController:v45];
        v44 = [getLSApplicationProxyClass() applicationProxyForIdentifier:v6];
        uint64_t v34 = NSString;
        uint64_t v35 = _BCSLocalizedString();
        v36 = [v44 localizedName];
        v37 = objc_msgSend(v34, "stringWithFormat:", v35, v36);
        [v33 setMessage:v37];

        v38 = (void *)MEMORY[0x263F82400];
        v39 = _BCSLocalizedString();
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __70__BCSAlertController_showFirstTimePromptToOpenApp_fromViewController___block_invoke;
        v47[3] = &unk_26524C380;
        v47[4] = self;
        v40 = [v38 actionWithTitle:v39 style:0 handler:v47];
        [v33 addAction:v40];

        id v41 = (void *)MEMORY[0x263F82400];
        v42 = _BCSLocalizedString();
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __70__BCSAlertController_showFirstTimePromptToOpenApp_fromViewController___block_invoke_2;
        v46[3] = &unk_26524C380;
        v46[4] = self;
        v43 = [v41 actionWithTitle:v42 style:0 handler:v46];
        [v33 addAction:v43];

        [(BCSAlertController *)self _addActionForHandlingAlertDismissal:v33];
        [(BCSAlertController *)self _configurePopoverPresentationControllerForAlertController:v33 fromViewController:v7];
        [v7 presentViewController:v33 animated:1 completion:0];
      }
    }
    else
    {
      BOOL v25 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v25) {
        -[BCSAlertController showActionPickerViewForAction:fromViewController:](v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v17) {
      -[BCSAlertController showFirstTimePromptToOpenApp:fromViewController:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
}

void __70__BCSAlertController_showFirstTimePromptToOpenApp_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained alertControllerDidAllow:*(void *)(a1 + 32)];
}

void __70__BCSAlertController_showFirstTimePromptToOpenApp_fromViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained alertControllerDidCancel:*(void *)(a1 + 32)];
}

- (void)showICloudSignInPromptWithTitle:(id)a3 message:(id)a4 fromViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 presentedViewController];

    if (v12)
    {
      BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v13) {
        -[BCSAlertController showActionPickerViewForAction:fromViewController:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    else
    {
      id v29 = objc_alloc_init(MEMORY[0x263F82418]);
      [v29 setPreferredStyle:0];
      uint64_t v30 = [(BCSAlertController *)self _createHeaderViewControllerWithAppIdentifier:@"com.apple.barcodescanner.icloud"];
      [v29 _setHeaderContentViewController:v30];

      [v29 setMessage:v9];
      uint64_t v31 = (void *)MEMORY[0x263F82400];
      uint64_t v32 = _BCSLocalizedString();
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __81__BCSAlertController_showICloudSignInPromptWithTitle_message_fromViewController___block_invoke;
      v38[3] = &unk_26524C380;
      v38[4] = self;
      id v33 = [v31 actionWithTitle:v32 style:0 handler:v38];
      [v29 addAction:v33];

      uint64_t v34 = (void *)MEMORY[0x263F82400];
      uint64_t v35 = _BCSLocalizedString();
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __81__BCSAlertController_showICloudSignInPromptWithTitle_message_fromViewController___block_invoke_2;
      v37[3] = &unk_26524C380;
      v37[4] = self;
      v36 = [v34 actionWithTitle:v35 style:0 handler:v37];
      [v29 addAction:v36];

      [(BCSAlertController *)self _addActionForHandlingAlertDismissal:v29];
      [(BCSAlertController *)self _configurePopoverPresentationControllerForAlertController:v29 fromViewController:v11];
      [v11 presentViewController:v29 animated:1 completion:0];
    }
  }
  else
  {
    BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v21) {
      -[BCSAlertController showActionPickerViewForAction:fromViewController:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
}

void __81__BCSAlertController_showICloudSignInPromptWithTitle_message_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained alertControllerDidAllow:*(void *)(a1 + 32)];
}

void __81__BCSAlertController_showICloudSignInPromptWithTitle_message_fromViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained alertControllerDidCancel:*(void *)(a1 + 32)];
}

- (void)showInvalidDataAlertForAction:(id)a3 fromViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 presentedViewController];

    if (v9)
    {
      BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v10) {
        -[BCSAlertController showActionPickerViewForAction:fromViewController:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    else
    {
      id v26 = objc_alloc_init(MEMORY[0x263F82418]);
      [v26 setPreferredStyle:0];
      if ([v6 codeType] == 3) {
        uint64_t v27 = @"com.apple.barcodescanner.invalid-data.appclip";
      }
      else {
        uint64_t v27 = @"com.apple.barcodescanner.invalid-data.qr";
      }
      uint64_t v28 = [(BCSAlertController *)self _createHeaderViewControllerWithAppIdentifier:v27];
      [v26 _setHeaderContentViewController:v28];

      id v29 = [v6 localizedDefaultActionDescription];
      [v26 setMessage:v29];

      uint64_t v30 = (void *)MEMORY[0x263F82400];
      uint64_t v31 = _BCSLocalizedString();
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __71__BCSAlertController_showInvalidDataAlertForAction_fromViewController___block_invoke;
      v33[3] = &unk_26524C380;
      v33[4] = self;
      uint64_t v32 = [v30 actionWithTitle:v31 style:1 handler:v33];
      [v26 addAction:v32];

      [(BCSAlertController *)self _configurePopoverPresentationControllerForAlertController:v26 fromViewController:v8];
      [v8 presentViewController:v26 animated:1 completion:0];
    }
  }
  else
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18) {
      -[BCSAlertController showActionPickerViewForAction:fromViewController:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

void __71__BCSAlertController_showInvalidDataAlertForAction_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained alertControllerDidCancel:*(void *)(a1 + 32)];
}

- (void)showErrorExplanationForAction:(id)a3 error:(id)a4 fromViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 presentedViewController];

    if (v12)
    {
      BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v13) {
        -[BCSAlertController showActionPickerViewForAction:fromViewController:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    else
    {
      id v29 = [v9 domain];
      char v30 = [v29 isEqualToString:*MEMORY[0x263F29B60]];

      if (v30)
      {
        id WeakRetained = objc_alloc_init(MEMORY[0x263F82418]);
        [WeakRetained setPreferredStyle:0];
        uint64_t v32 = [v9 localizedDescription];
        id v33 = [v8 defaultActionTargetApplicationBundleIdentifier];
        if (![(__CFString *)v33 length]
          && [v8 conformsToProtocol:&unk_26FCC81F0]
          && [v8 isWiFiAction])
        {

          id v33 = @"com.apple.barcodescanner.wifi";
        }
        uint64_t v34 = [(BCSAlertController *)self _createHeaderViewControllerWithAppIdentifier:v33];
        [WeakRetained _setHeaderContentViewController:v34];

        [WeakRetained setMessage:v32];
        uint64_t v35 = (void *)MEMORY[0x263F82400];
        v36 = _BCSLocalizedString();
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __77__BCSAlertController_showErrorExplanationForAction_error_fromViewController___block_invoke;
        v38[3] = &unk_26524C380;
        v38[4] = self;
        v37 = [v35 actionWithTitle:v36 style:1 handler:v38];
        [WeakRetained addAction:v37];

        [(BCSAlertController *)self _configurePopoverPresentationControllerForAlertController:WeakRetained fromViewController:v11];
        [v11 presentViewController:WeakRetained animated:1 completion:0];
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained alertControllerDidCancel:self];
      }
    }
  }
  else
  {
    BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v21) {
      -[BCSAlertController showActionPickerViewForAction:fromViewController:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
}

void __77__BCSAlertController_showErrorExplanationForAction_error_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained alertControllerDidCancel:*(void *)(a1 + 32)];
}

- (BCSAlertControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCSAlertControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_createHeaderViewControllerWithAppIdentifier:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"CGImageRef _LICreateIconFromCachedBitmap(CFDataRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSAlertController.m", 30, @"%s", dlerror());

  __break(1u);
}

- (void)_createPreviewControllerForDataDetectionActionPickerItem:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  int v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_248ACF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSAlertController: failed to remove event %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)showActionPickerViewForAction:(uint64_t)a3 fromViewController:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)showActionPickerViewForAction:(uint64_t)a3 fromViewController:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)showFirstTimePromptToOpenApp:(uint64_t)a3 fromViewController:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end