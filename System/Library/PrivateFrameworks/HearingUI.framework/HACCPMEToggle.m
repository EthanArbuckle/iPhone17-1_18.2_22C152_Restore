@interface HACCPMEToggle
- (BOOL)enabled;
- (HACCPMEToggle)initWithFrame:(CGRect)a3;
- (id)contentValue;
- (void)updateValue;
@end

@implementation HACCPMEToggle

- (HACCPMEToggle)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HACCPMEToggle;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = paLocString();
    [(HUICCCapsuleButton *)v3 setTitleText:v4];

    v5 = [MEMORY[0x263F82818] configurationWithPointSize:3 weight:23.0];
    v6 = [MEMORY[0x263F827E8] _systemImageNamed:@"headphones" withConfiguration:v5];
    v7 = HUICCImageViewWithImage(v6);
    [(HUICCCapsuleButton *)v3 setIconView:v7];

    objc_initWeak(&location, v3);
    v8 = [MEMORY[0x263F5D458] sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __31__HACCPMEToggle_initWithFrame___block_invoke;
    v10[3] = &unk_2647CD168;
    objc_copyWeak(&v11, &location);
    [v8 registerUpdateBlock:v10 forRetrieveSelector:sel_personalMediaEnabled withListener:v3];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __31__HACCPMEToggle_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateValue];
}

- (void)updateValue
{
  v6.receiver = self;
  v6.super_class = (Class)HACCPMEToggle;
  [(HUICCCapsuleButton *)&v6 updateValue];
  v3 = [(HUICCCapsuleButton *)self delegate];
  v4 = [v3 backgroundUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__HACCPMEToggle_updateValue__block_invoke;
  block[3] = &unk_2647CD1B8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __28__HACCPMEToggle_updateValue__block_invoke(uint64_t a1)
{
  v2 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v3 = [v2 address];

  v4 = [MEMORY[0x263F5D458] sharedInstance];
  [v4 accommodationTypesForRouteUID:v3];

  v5 = [MEMORY[0x263F5D458] sharedInstance];
  int v6 = [v5 transparencyCustomizedForAddress:v3];

  v7 = paLocString();
  v8 = [MEMORY[0x263F5D450] sharedInstance];
  int v9 = [v8 yodelEnabledForAddress:v3];

  if (v9)
  {
    v10 = accessibilityHearingAidSupportBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"YodelFeatureName" value:@"YodelFeatureName" table:@"HearingProtection-Yodel"];

    v7 = (void *)v11;
    goto LABEL_4;
  }
  v12 = [MEMORY[0x263F5D458] sharedInstance];
  int v13 = [v12 personalMediaEnabled];

  if (v13)
  {
LABEL_4:
    int v14 = compoundAttributeContainsAttribute();
    if (v6)
    {
      if (v14) {
        goto LABEL_9;
      }
      if ((compoundAttributeContainsAttribute() & 1) != 0
        || compoundAttributeContainsAttribute()
        || compoundAttributeContainsAttribute())
      {
LABEL_11:
        v16 = NSString;
        v17 = paLocString();
        v18 = paLocString();
        v19 = paLocString();
        uint64_t v15 = objc_msgSend(v16, "stringWithFormat:", v17, v18, v19);

        goto LABEL_12;
      }
    }
    else if (v14)
    {
      goto LABEL_11;
    }
    if (!compoundAttributeContainsAttribute()
      && !compoundAttributeContainsAttribute()
      && !v6)
    {
      uint64_t v15 = 0;
      goto LABEL_12;
    }
  }
LABEL_9:
  uint64_t v15 = paLocString();
LABEL_12:
  v20 = [*(id *)(a1 + 32) subtitleLabel];
  uint64_t v21 = [v20 text];
  uint64_t v22 = v21 | v15;

  v23 = [*(id *)(a1 + 32) subtitleLabel];
  v24 = [v23 text];
  char v25 = [v24 isEqualToString:v15];

  id v26 = v7;
  id v27 = (id)v15;
  AXPerformBlockOnMainThread();
  if (v22 && (v25 & 1) == 0) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __28__HACCPMEToggle_updateValue__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitleText:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 setSubtitleText:v3];
}

void __28__HACCPMEToggle_updateValue__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 updateHeight];
}

- (BOOL)enabled
{
  return 1;
}

- (id)contentValue
{
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x263F5D458] sharedInstance];
  v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "personalMediaEnabled"));

  return v4;
}

@end