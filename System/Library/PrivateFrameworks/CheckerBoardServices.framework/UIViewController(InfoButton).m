@interface UIViewController(InfoButton)
- (id)_deviceInformation;
- (id)_deviceInformationView;
- (id)generateBarcode:()InfoButton showAsQRCode:;
- (void)_layoutDeviceInformationView;
- (void)barcodeViewTapped:()InfoButton;
- (void)infoButtonTapped:()InfoButton;
- (void)setupInfoButton;
@end

@implementation UIViewController(InfoButton)

- (id)generateBarcode:()InfoButton showAsQRCode:
{
  if (a4) {
    double v5 = 3.5;
  }
  else {
    double v5 = 2.5;
  }
  v6 = @"CICode128BarcodeGenerator";
  if (a4) {
    v6 = @"CIQRCodeGenerator";
  }
  v7 = v6;
  v8 = [a3 dataUsingEncoding:1];
  v9 = [MEMORY[0x263F00640] filterWithName:v7];

  [v9 setValue:v8 forKey:@"inputMessage"];
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v5, v5);
  v10 = [v9 outputImage];
  CGAffineTransform v14 = v15;
  v11 = [v10 imageByApplyingTransform:&v14];

  v12 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCIImage:v11];
  return v12;
}

- (id)_deviceInformation
{
  v0 = [MEMORY[0x263EFF980] array];
  v1 = +[CBSGestaltEquipmentInfo CurrentEquipmentInfo];
  v2 = [v1 serialNumber];

  if (v2)
  {
    v3 = [v1 serialNumber];
    v4 = +[CBSDeviceInformationField fieldWithFormat:0 value:v3];
    [v0 addObject:v4];
  }
  double v5 = [v1 meid];

  if (v5)
  {
    v6 = [v1 meid];
    v7 = +[CBSDeviceInformationField fieldWithFormat:1 value:v6];
    [v0 addObject:v7];
  }
  uint64_t v8 = [v1 imeiArray];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [v1 imeiArray];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      v12 = [v1 imeiArray];
      v13 = [v12 componentsJoinedByString:@";"];

      CGAffineTransform v14 = +[CBSDeviceInformationField fieldWithFormat:2 value:v13];
      [v0 addObject:v14];
    }
  }
  CGAffineTransform v15 = (void *)[v0 copy];

  return v15;
}

- (id)_deviceInformationView
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  unint64_t v2 = 0x263F1C000uLL;
  id v3 = objc_alloc(MEMORY[0x263F1C9B8]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setAxis:1];
  [v4 setAlignment:3];
  [v4 setDistribution:3];
  [v4 setSpacing:20.0];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = [a1 _deviceInformation];
  uint64_t v38 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v44;
    v37 = v4;
    v31 = a1;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v7 = objc_alloc_init(*(Class *)(v2 + 2488));
        [v7 setAxis:1];
        [v7 setAlignment:3];
        [v7 setDistribution:3];
        id v8 = objc_alloc_init(MEMORY[0x263F1C768]);
        v9 = [MEMORY[0x263F81708] boldSystemFontOfSize:20.0];
        [v8 setFont:v9];

        v10 = [v6 formattedTitle];
        [v8 setText:v10];

        [v7 addArrangedSubview:v8];
        if ([v6 multiLineFormatted])
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v11 = [v6 formattedValuesArray];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            v33 = v6;
            id v34 = v8;
            uint64_t v35 = i;
            uint64_t v14 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v40 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v39 + 1) + 8 * j);
                id v17 = objc_alloc_init(MEMORY[0x263F1C768]);
                v18 = [MEMORY[0x263F81708] systemFontOfSize:20.0];
                [v17 setFont:v18];

                [v17 setText:v16];
                [v7 addArrangedSubview:v17];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v13);
            a1 = v31;
            unint64_t v2 = 0x263F1C000;
            v4 = v37;
            id v8 = v34;
            uint64_t i = v35;
            v6 = v33;
          }
          else
          {
            v4 = v37;
          }
        }
        else
        {
          id v11 = objc_alloc_init(MEMORY[0x263F1C768]);
          [MEMORY[0x263F81708] systemFontOfSize:20.0];
          unint64_t v19 = v2;
          v20 = a1;
          v22 = v21 = v6;
          [v11 setFont:v22];

          v23 = [v21 formattedValue];
          [v11 setText:v23];

          v6 = v21;
          a1 = v20;
          unint64_t v2 = v19;
          v4 = v37;
          [v7 addArrangedSubview:v11];
        }

        [v4 addArrangedSubview:v7];
        if (![v6 format])
        {
          id v24 = v8;
          v25 = [v6 formattedValue];
          v26 = [a1 generateBarcode:v25 showAsQRCode:1];

          if (v26)
          {
            v27 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v26];
            [v27 setTag:1];
            [v27 setUserInteractionEnabled:1];
            uint64_t v28 = i;
            v29 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:a1 action:sel_barcodeViewTapped_];
            [v29 setNumberOfTapsRequired:2];
            [v27 addGestureRecognizer:v29];
            [v4 addArrangedSubview:v27];

            uint64_t i = v28;
          }

          id v8 = v24;
          unint64_t v2 = 0x263F1C000;
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v38);
  }

  return v4;
}

- (void)setupInfoButton
{
  unint64_t v2 = [a1 _deviceInformationView];
  [a1 setDeviceInformationView:v2];

  id v3 = [MEMORY[0x263F1C490] plainButtonConfiguration];
  v4 = [MEMORY[0x263F1C6B0] systemImageNamed:@"info.circle"];
  [v3 setImage:v4];

  double v5 = [v3 background];
  [v5 setCornerRadius:0.0];

  objc_msgSend(v3, "setContentInsets:", 24.0, 24.0, 6.0, 6.0);
  objc_initWeak(&location, a1);
  v6 = (void *)MEMORY[0x263F1C488];
  id v7 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  CGAffineTransform v15 = __47__UIViewController_InfoButton__setupInfoButton__block_invoke;
  uint64_t v16 = &unk_265036F78;
  objc_copyWeak(&v17, &location);
  id v8 = [v7 actionWithHandler:&v13];
  v9 = objc_msgSend(v6, "buttonWithConfiguration:primaryAction:", v3, v8, v13, v14, v15, v16);
  [a1 setInfoButton:v9];

  v10 = [a1 infoButton];
  [v10 sizeToFit];

  id v11 = [a1 view];
  uint64_t v12 = [a1 infoButton];
  [v11 addSubview:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_layoutDeviceInformationView
{
  id v16 = [a1 substitutableView];
  [v16 frame];
  double v3 = v2;
  v4 = [a1 substitutableView];
  [v4 frame];
  double v6 = v5;
  id v7 = [a1 substitutableView];
  [v7 frame];
  double v9 = v8;
  v10 = [a1 deviceInformationView];
  id v11 = [a1 view];
  [v11 frame];
  objc_msgSend(v10, "systemLayoutSizeFittingSize:", v12, *(double *)(MEMORY[0x263F1D490] + 8));
  double v14 = v13;
  CGAffineTransform v15 = [a1 deviceInformationView];
  objc_msgSend(v15, "setFrame:", v3, v6, v9, v14);
}

- (void)infoButtonTapped:()InfoButton
{
  double v2 = CheckerBoardLogHandleForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23EA9B000, v2, OS_LOG_TYPE_DEFAULT, "[Info] button was tapped. Toggling device information…", v10, 2u);
  }

  objc_msgSend(a1, "setShowingDeviceInformation:", objc_msgSend(a1, "showingDeviceInformation") ^ 1);
  if ([a1 showingDeviceInformation])
  {
    [a1 _layoutDeviceInformationView];
    double v3 = [a1 substitutableView];
    v4 = [v3 superview];
    double v5 = [a1 deviceInformationView];
    [v4 addSubview:v5];

    double v6 = [a1 substitutableView];
    id v7 = v6;
    uint64_t v8 = 1;
  }
  else
  {
    double v9 = [a1 deviceInformationView];
    [v9 removeFromSuperview];

    double v6 = [a1 substitutableView];
    id v7 = v6;
    uint64_t v8 = 0;
  }
  [v6 setHidden:v8];
}

- (void)barcodeViewTapped:()InfoButton
{
  id v4 = a3;
  id v11 = +[CBSGestaltEquipmentInfo CurrentEquipmentInfo];
  double v5 = [v4 view];

  double v6 = [v11 serialNumber];

  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    objc_msgSend(v5, "setTag:", objc_msgSend(v5, "tag") == 0);
    uint64_t v8 = [v11 serialNumber];
    double v9 = objc_msgSend(a1, "generateBarcode:showAsQRCode:", v8, objc_msgSend(v5, "tag") == 1);
    [v5 setImage:v9];

    [a1 _layoutDeviceInformationView];
    v10 = [a1 view];
    [v10 setNeedsLayout];
  }
}

@end