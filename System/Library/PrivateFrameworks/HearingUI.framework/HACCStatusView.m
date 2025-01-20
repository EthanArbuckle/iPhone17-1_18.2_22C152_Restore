@interface HACCStatusView
+ (id)_backgroundUpdateQueue;
- (BCBatteryDevice)batteryDevice;
- (BCBatteryDeviceController)batteryController;
- (BOOL)enabled;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldAddSeparatorForView:(id)a3;
- (BOOL)shouldAutoExpandForAvailableHAs;
- (BOOL)shouldAutoExpandForView:(id)a3;
- (CBDiscovery)bluetoothDiscovery;
- (CGSize)liveListenImageSize:(id)a3 forProductID:(id)a4;
- (HACCContentModuleDelegate)delegate;
- (HACCStatusView)initWithFrame:(CGRect)a3;
- (UIImageView)iconImageView;
- (id)_productIdentifierFromBluetoothRoute:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)contentValue;
- (id)liveListenImageNameFromBluetoothRoute:(id)a3;
- (unint64_t)module;
- (void)_updateBatterySubtitleLabelForDevice:(id)a3;
- (void)_updateBatterySubtitleLabelForLeft:(double)a3 right:(double)a4 andAvailableEars:(int)a5;
- (void)dealloc;
- (void)setBatteryController:(id)a3;
- (void)setBatteryDevice:(id)a3;
- (void)setBluetoothDiscovery:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setModule:(unint64_t)a3;
- (void)setShouldAutoExpandForAvailableHAs:(BOOL)a3;
- (void)updateConstraints;
- (void)updateValue;
@end

@implementation HACCStatusView

- (HACCStatusView)initWithFrame:(CGRect)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)HACCStatusView;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = (CBDiscovery *)objc_alloc_init(MEMORY[0x263EFEF30]);
    bluetoothDiscovery = v3->_bluetoothDiscovery;
    v3->_bluetoothDiscovery = v4;

    v6 = +[HACCStatusView _backgroundUpdateQueue];
    [(CBDiscovery *)v3->_bluetoothDiscovery setDispatchQueue:v6];

    [(CBDiscovery *)v3->_bluetoothDiscovery setDiscoveryFlags:10485760];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __32__HACCStatusView_initWithFrame___block_invoke;
    v32[3] = &unk_2647CD228;
    objc_copyWeak(&v33, &location);
    [(CBDiscovery *)v3->_bluetoothDiscovery setDeviceFoundHandler:v32];
    v7 = v3->_bluetoothDiscovery;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __32__HACCStatusView_initWithFrame___block_invoke_3;
    v30[3] = &unk_2647CD250;
    objc_copyWeak(&v31, &location);
    [(CBDiscovery *)v7 activateWithCompletion:v30];
    v3->_shouldAutoExpandForAvailableHAs = 0;
    v8 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    numberFormatter = v3->_numberFormatter;
    v3->_numberFormatter = v8;

    [(NSNumberFormatter *)v3->_numberFormatter setNumberStyle:3];
    [(NSNumberFormatter *)v3->_numberFormatter setMaximumFractionDigits:0];
    v10 = v3->_numberFormatter;
    v11 = [NSNumber numberWithInt:0];
    v12 = [(NSNumberFormatter *)v10 stringFromNumber:v11];
    [(NSNumberFormatter *)v10 setNotANumberSymbol:v12];

    v13 = (void *)MEMORY[0x263F827E8];
    v14 = [MEMORY[0x263F82818] configurationWithPointSize:4 weight:23.0];
    v15 = [v13 systemImageNamed:@"hearingdevice.ear" withConfiguration:v14];

    uint64_t v16 = HUICCImageViewWithImage(v15);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v16;

    [(HUICCCapsuleButton *)v3 setIconView:v3->_iconImageView];
    v18 = [MEMORY[0x263F544E0] sharedAVSystemController];
    v19 = (uint64_t *)MEMORY[0x263F543F0];
    v36[0] = *MEMORY[0x263F543F0];
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
    [v18 setAttribute:v20 forKey:*MEMORY[0x263F544A0] error:0];

    v21 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v22 = *v19;
    v23 = [MEMORY[0x263F544E0] sharedAVSystemController];
    [v21 addObserver:v3 selector:sel_updateValue name:v22 object:v23];

    v24 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x263F29D90]);
    batteryController = v3->_batteryController;
    v3->_batteryController = v24;

    v26 = v3->_batteryController;
    uint64_t v27 = MEMORY[0x263EF83A0];
    id v28 = MEMORY[0x263EF83A0];
    [(BCBatteryDeviceController *)v26 addBatteryDeviceObserver:v3 queue:v27];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __32__HACCStatusView_initWithFrame___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HACCStatusView_initWithFrame___block_invoke_2;
  block[3] = &unk_2647CD168;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __32__HACCStatusView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateValue];
}

void __32__HACCStatusView_initWithFrame___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    v5[3] = v2;
    v5[4] = v3;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__HACCStatusView_initWithFrame___block_invoke_4;
    block[3] = &unk_2647CD168;
    objc_copyWeak(v5, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(v5);
  }
}

void __32__HACCStatusView_initWithFrame___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateValue];
}

- (void)dealloc
{
  [(CBDiscovery *)self->_bluetoothDiscovery invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HACCStatusView;
  [(HACCStatusView *)&v3 dealloc];
}

- (void)updateConstraints
{
  v2.receiver = self;
  v2.super_class = (Class)HACCStatusView;
  [(HACCStatusView *)&v2 updateConstraints];
}

- (id)_productIdentifierFromBluetoothRoute:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"BTHeadphones" withString:&stru_26DAB2B88];
}

- (CGSize)liveListenImageSize:(id)a3 forProductID:(id)a4
{
  id v5 = a4;
  [a3 size];
  double v7 = v6;
  double v9 = v8;
  int v10 = [v5 isEqualToString:@"76,8202"];

  double v11 = 26.0;
  if (v10) {
    double v12 = 26.0;
  }
  else {
    double v12 = v9;
  }
  if (!v10) {
    double v11 = v7;
  }
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)liveListenImageNameFromBluetoothRoute:(id)a3
{
  objc_super v3 = [(HACCStatusView *)self _productIdentifierFromBluetoothRoute:a3];
  int v4 = [v3 isEqualToString:@"76,8203"];
  int v5 = [v3 isEqualToString:@"76,8204"];
  int v6 = [v3 isEqualToString:@"76,8206"];
  if ([v3 isEqualToString:@"76,8202"]) {
    goto LABEL_10;
  }
  double v7 = @"hearingDevicesIcon";
  if (v4) {
    double v7 = @"b444";
  }
  if (v5) {
    double v7 = @"b419";
  }
  double v8 = v6 ? @"b298" : v7;
  if ([v3 isEqualToString:*MEMORY[0x263F474F0]]) {
LABEL_10:
  }
    double v8 = @"b515";
  if ([v3 isEqualToString:@"76,8205"]) {
    double v8 = @"b364";
  }
  if ([v3 isEqualToString:@"76,8210"]) {
    double v8 = @"B494";
  }
  if ([v3 isEqualToString:@"76,8211"]) {
    double v9 = @"B688";
  }
  else {
    double v9 = v8;
  }
  int v10 = [v3 isEqualToString:@"76,8212"];
  if ([v3 isEqualToString:@"76,8228"] | v10) {
    double v11 = @"b298";
  }
  else {
    double v11 = v9;
  }
  if ([v3 isEqualToString:@"76,8215"]) {
    double v11 = @"beats.headphones";
  }
  if ([v3 isEqualToString:@"76,8230"]) {
    double v11 = @"beats.studiobuds";
  }
  if ([v3 isEqualToString:@"76,8229"]) {
    double v11 = @"beats.headphones";
  }
  if ([v3 isEqualToString:@"76,8214"]) {
    double v11 = @"beats.studiobuds";
  }
  if ([v3 isEqualToString:@"76,8221"]) {
    double v11 = @"b498";
  }

  return v11;
}

+ (id)_backgroundUpdateQueue
{
  if (_backgroundUpdateQueue_onceToken != -1) {
    dispatch_once(&_backgroundUpdateQueue_onceToken, &__block_literal_global_0);
  }
  objc_super v2 = (void *)_backgroundUpdateQueue__backgroundUpdateQueue;
  return v2;
}

void __40__HACCStatusView__backgroundUpdateQueue__block_invoke()
{
  objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("hacc.background.queue", v0);
  objc_super v2 = (void *)_backgroundUpdateQueue__backgroundUpdateQueue;
  _backgroundUpdateQueue__backgroundUpdateQueue = (uint64_t)v1;
}

- (void)updateValue
{
  v34.receiver = self;
  v34.super_class = (Class)HACCStatusView;
  [(HUICCCapsuleButton *)&v34 updateValue];
  objc_super v3 = [(HACCStatusView *)self delegate];
  int v4 = [v3 conformsToProtocol:&unk_26DACB190];

  if (v4)
  {
    int v5 = [(HACCStatusView *)self delegate];
    int v6 = [v5 currentHearingDevice];

    if (v6)
    {
      if (objc_msgSend(v6, "propertyIsAvailable:forEar:", 4, objc_msgSend(v6, "availableEars")))
      {
        [(HACCStatusView *)self _updateBatterySubtitleLabelForDevice:v6];
      }
      else
      {
        double v8 = [(HUICCCapsuleButton *)self subtitleLabel];
        [v8 setText:0];
      }
      char v7 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    int v6 = 0;
  }
  char v7 = 1;
LABEL_9:
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  accessibilityHearingAidImageNamed(@"hearingDevicesIcon");
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = (void *)v29[5];
  int v10 = [MEMORY[0x263F825C8] whiteColor];
  uint64_t v11 = [v9 _flatImageWithColor:v10];
  double v12 = (void *)v29[5];
  v29[5] = v11;

  if (v7) {
    goto LABEL_16;
  }
  v13 = [MEMORY[0x263F47528] sharedInstance];
  if (([v13 hearingAidReachable] & 1) == 0)
  {

    goto LABEL_16;
  }
  v14 = [(HACCStatusView *)self delegate];
  int v15 = [v14 shouldDisplayOtherDevice];

  if (v15)
  {
LABEL_16:
    uint64_t v22 = self->_bluetoothDiscovery;
    v23 = +[HACCStatusView _backgroundUpdateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__HACCStatusView_updateValue__block_invoke;
    block[3] = &unk_2647CD310;
    v26 = self;
    uint64_t v27 = &v28;
    v25 = v22;
    uint64_t v16 = v22;
    dispatch_async(v23, block);

    goto LABEL_17;
  }
  uint64_t v16 = [v6 name];
  if (v16)
  {
    v17 = [(HUICCCapsuleButton *)self titleLabel];
    [v17 setText:v16];
  }
  v18 = (void *)v29[5];
  v19 = [MEMORY[0x263F825C8] whiteColor];
  uint64_t v20 = [v18 _flatImageWithColor:v19];
  v21 = (void *)v29[5];
  v29[5] = v20;

  [(UIImageView *)self->_iconImageView setImage:v29[5]];
  [(HACCStatusView *)self setBatteryDevice:0];
  [(HACCStatusView *)self setShouldAutoExpandForAvailableHAs:1];
LABEL_17:

  _Block_object_dispose(&v28, 8);
}

void __29__HACCStatusView_updateValue__block_invoke(uint64_t a1)
{
  objc_super v2 = [MEMORY[0x263F47568] sharedUtilities];
  objc_super v3 = [v2 currentPickableAudioRoutes];
  int v4 = [v3 objectForKey:@"AXSHARoutePicked"];

  int v5 = [v4 objectForKey:*MEMORY[0x263F54460]];
  int v6 = [v4 valueForKey:*MEMORY[0x263F54428]];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  char v7 = [*(id *)(a1 + 32) discoveredDevices];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __29__HACCStatusView_updateValue__block_invoke_2;
  v25[3] = &unk_2647CD298;
  id v8 = v5;
  id v26 = v8;
  uint64_t v27 = &v28;
  [v7 enumerateObjectsUsingBlock:v25];

  id v9 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (*((unsigned char *)v29 + 24) && [v6 length])
  {
    int v10 = [*(id *)(a1 + 40) liveListenImageNameFromBluetoothRoute:v6];
    uint64_t v11 = accessibilityHearingAidImageNamed(v10);

    double v12 = [MEMORY[0x263F825C8] whiteColor];
    id v9 = [v11 _flatImageWithColor:v12];
  }
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  [*(id *)(a1 + 40) setBatteryDevice:0];
  v13 = [*(id *)(*(void *)(a1 + 40) + 632) connectedDevices];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __29__HACCStatusView_updateValue__block_invoke_3;
  v20[3] = &unk_2647CD2C0;
  id v14 = v8;
  uint64_t v15 = *(void *)(a1 + 40);
  id v21 = v14;
  uint64_t v22 = v15;
  v23 = v24;
  [v13 enumerateObjectsUsingBlock:v20];

  uint64_t v16 = [v4 objectForKey:*MEMORY[0x263F542F0]];
  id v17 = v9;
  id v18 = v6;
  id v19 = v16;
  AXPerformBlockOnMainThread();

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v28, 8);
}

void __29__HACCStatusView_updateValue__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a2;
  char v7 = [v6 btAddressData];
  id v8 = v7;
  if (v7)
  {
    [v7 bytes];
    HardwareAddressToCString();
    id v9 = *(void **)(a1 + 32);
    int v10 = [NSString stringWithUTF8String:v11];
    LODWORD(v9) = [v9 localizedCaseInsensitiveContainsString:v10];

    if (v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ([v6 gapaFlags] & 2) == 0;
      *a4 = 1;
    }
  }
}

void __29__HACCStatusView_updateValue__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v6 = [v7 accessoryIdentifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [*(id *)(a1 + 32) containsString:v6])
  {
    [*(id *)(a1 + 40) setBatteryDevice:v7];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (double)[v7 percentCharge] / 100.0;
    *a4 = 1;
  }
}

void __29__HACCStatusView_updateValue__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) liveListenImageSize:*(void *)(a1 + 40) forProductID:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 616) setImage:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 616) frame];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 616), "setFrame:");
  if (*(void *)(a1 + 56))
  {
    objc_super v2 = [*(id *)(a1 + 32) titleLabel];
    [v2 setText:*(void *)(a1 + 56)];
  }
  objc_super v3 = [*(id *)(a1 + 32) batteryDevice];

  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    double v5 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    [v4 _updateBatterySubtitleLabelForLeft:6 right:v5 andAvailableEars:v5];
  }
  else
  {
    id v6 = [v4 subtitleLabel];
    [v6 setText:0];
  }
}

- (id)contentValue
{
  return 0;
}

- (BOOL)enabled
{
  return 1;
}

- (void)_updateBatterySubtitleLabelForDevice:(id)a3
{
  id v4 = a3;
  [v4 leftBatteryLevel];
  double v6 = v5;
  [v4 rightBatteryLevel];
  double v8 = v7;
  uint64_t v9 = [v4 availableEars];

  [(HACCStatusView *)self _updateBatterySubtitleLabelForLeft:v9 right:v6 andAvailableEars:v8];
}

- (void)_updateBatterySubtitleLabelForLeft:(double)a3 right:(double)a4 andAvailableEars:(int)a5
{
  if (a5)
  {
    double v6 = a4;
    if (a5 == 6 && vabdd_f64(a3, a4) >= 0.05)
    {
      v13 = NSString;
      id v14 = hearingLocString();
      uint64_t v15 = hearingLocString();
      numberFormatter = self->_numberFormatter;
      id v17 = [NSNumber numberWithDouble:a3];
      id v18 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v17];
      uint64_t v9 = objc_msgSend(v13, "stringWithFormat:", v14, v15, v18);

      id v19 = NSString;
      uint64_t v20 = hearingLocString();
      id v21 = hearingLocString();
      uint64_t v22 = self->_numberFormatter;
      v23 = [NSNumber numberWithDouble:v6];
      v24 = [(NSNumberFormatter *)v22 stringFromNumber:v23];
      uint64_t v11 = objc_msgSend(v19, "stringWithFormat:", v20, v21, v24);

      v25 = NSString;
      uint64_t v12 = hearingLocString();
      objc_msgSend(v25, "stringWithFormat:", v12, v9, v11);
    }
    else
    {
      if (a5 == 2) {
        double v6 = a3;
      }
      double v8 = NSString;
      uint64_t v9 = hearingLocString();
      int v10 = self->_numberFormatter;
      uint64_t v11 = [NSNumber numberWithDouble:v6];
      uint64_t v12 = [(NSNumberFormatter *)v10 stringFromNumber:v11];
      objc_msgSend(v8, "stringWithFormat:", v9, v12, v28);
    }
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v29 = 0;
  }
  id v26 = [(HUICCCapsuleButton *)self subtitleLabel];
  [v26 setText:v29];

  uint64_t v27 = [(HACCStatusView *)self delegate];
  [v27 updateHeight];
}

- (BOOL)shouldAutoExpandForView:(id)a3
{
  return 0;
}

- (BOOL)shouldAddSeparatorForView:(id)a3
{
  id v4 = a3;
  double v5 = [v4 subviews];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    double v7 = [v4 subviews];
    double v8 = [v7 objectAtIndexedSubscript:0];

    if ([(HACCStatusView *)self module] || (objc_opt_respondsToSelector() & 1) == 0) {
      LOBYTE(v9) = 1;
    }
    else {
      int v9 = [v8 providesOwnSeparator] ^ 1;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_super v2 = [(HUICCCapsuleButton *)self titleLabel];
  objc_super v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  objc_super v3 = [(HACCStatusView *)self delegate];
  id v4 = [v3 currentHearingDevice];

  if ([v4 isConnected])
  {
    if ([v4 leftAvailable])
    {
      double v5 = NSString;
      uint64_t v6 = hearingLocString();
      numberFormatter = self->_numberFormatter;
      double v8 = NSNumber;
      [v4 leftBatteryLevel];
      int v9 = objc_msgSend(v8, "numberWithDouble:");
      int v10 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v9];
      uint64_t v11 = objc_msgSend(v5, "stringWithFormat:", v6, v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    if ([v4 rightAvailable])
    {
      uint64_t v20 = NSString;
      uint64_t v15 = hearingLocString();
      id v21 = self->_numberFormatter;
      uint64_t v22 = NSNumber;
      [v4 rightBatteryLevel];
      id v17 = objc_msgSend(v22, "numberWithDouble:");
      id v18 = [(NSNumberFormatter *)v21 stringFromNumber:v17];
      id v19 = objc_msgSend(v20, "stringWithFormat:", v15, v18);
      goto LABEL_9;
    }
LABEL_10:
    id v19 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = [(HACCStatusView *)self batteryDevice];

  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v12 = [(HACCStatusView *)self batteryDevice];
  double v13 = (double)[v12 percentCharge] / 100.0;

  id v14 = NSString;
  uint64_t v15 = hearingLocString();
  uint64_t v16 = self->_numberFormatter;
  id v17 = [NSNumber numberWithDouble:v13];
  id v18 = [(NSNumberFormatter *)v16 stringFromNumber:v17];
  uint64_t v11 = objc_msgSend(v14, "stringWithFormat:", v15, v18);
  id v19 = 0;
LABEL_9:

LABEL_11:
  if ([v11 length] || objc_msgSend(v19, "length"))
  {
    v27.receiver = self;
    v27.super_class = (Class)HACCStatusView;
    v23 = [(HUICCCapsuleButton *)&v27 accessibilityValue];
    id v26 = hearingLocString();
    v24 = __AXStringForVariables();
  }
  else
  {
    v24 = hearingLocString();
  }

  return v24;
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (HACCContentModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HACCContentModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (BCBatteryDevice)batteryDevice
{
  return (BCBatteryDevice *)objc_getProperty(self, a2, 624, 1);
}

- (void)setBatteryDevice:(id)a3
{
}

- (BCBatteryDeviceController)batteryController
{
  return self->_batteryController;
}

- (void)setBatteryController:(id)a3
{
}

- (CBDiscovery)bluetoothDiscovery
{
  return (CBDiscovery *)objc_getProperty(self, a2, 640, 1);
}

- (void)setBluetoothDiscovery:(id)a3
{
}

- (BOOL)shouldAutoExpandForAvailableHAs
{
  return self->_shouldAutoExpandForAvailableHAs;
}

- (void)setShouldAutoExpandForAvailableHAs:(BOOL)a3
{
  self->_shouldAutoExpandForAvailableHAs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDiscovery, 0);
  objc_storeStrong((id *)&self->_batteryController, 0);
  objc_storeStrong((id *)&self->_batteryDevice, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end