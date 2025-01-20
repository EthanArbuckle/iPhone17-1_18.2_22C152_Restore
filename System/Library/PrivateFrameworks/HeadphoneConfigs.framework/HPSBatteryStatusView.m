@interface HPSBatteryStatusView
- ($FFD8FFF7A5D2C2666551BEB14716E99F)status;
- (BOOL)isProductOfDifferentColors;
- (BOOL)untethered;
- (HPSBatteryStatusView)initWithFrame:(CGRect)a3 device:(id)a4 darkMode:(BOOL)a5;
- (id)getAssetsDictionary:(unsigned int)a3;
- (id)getDeviceCaseIcon:(unsigned int)a3;
- (id)getProductIDString;
- (unsigned)bestDeviceColor:(unsigned int)a3 productID:(unsigned int)a4;
- (unsigned)defaultFiltersID;
- (void)applyFilters:(id)a3 imageView:(id)a4;
- (void)applyFiltersForMode:(BOOL)a3;
- (void)getBatteryStatus;
- (void)setStatus:(id *)a3;
- (void)setupViews;
@end

@implementation HPSBatteryStatusView

- ($FFD8FFF7A5D2C2666551BEB14716E99F)status
{
  long long v3 = *(_OWORD *)&self[10].var8;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[10].var4;
  *(_OWORD *)&retstr->var4 = v3;
  *(void *)&retstr->var8 = *(void *)&self[11].var2;
  return self;
}

- (void)setStatus:(id *)a3
{
  p_status = &self->status;
  uint64_t v5 = *(void *)&a3->var8;
  long long v6 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->status.uint64_t battLevelSingle = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->status.battLevelLeft = v6;
  *(void *)&self->status.battLevelCombined = v5;
  if (self->untethered) {
    uint64_t battLevelSingle = (self->status.battLevelRight + self->status.battLevelLeft) >> 1;
  }
  else {
    uint64_t battLevelSingle = p_status->battLevelSingle;
  }
  [(HPSBatteryGroupView *)self->deviceBatteryLevelSingleView setChargePercent:battLevelSingle];
  BOOL untethered = self->untethered;
  v9 = [(HPSBatteryGroupView *)self->deviceBatteryLevelSingleView batteryIconView];
  v10 = v9;
  if (untethered)
  {
    if (p_status->battIsChargingLeft)
    {
      BOOL v11 = 1;
      goto LABEL_10;
    }
    p_battIsChargingRight = &p_status->battIsChargingRight;
  }
  else
  {
    p_battIsChargingRight = &p_status->battIsChargingSingle;
  }
  BOOL v11 = *p_battIsChargingRight != 0;
LABEL_10:
  [v9 setIsCharging:v11];

  [(HPSBatteryGroupView *)self->deviceBatteryLevelLeftView setChargePercent:p_status->battLevelLeft];
  v13 = [(HPSBatteryGroupView *)self->deviceBatteryLevelLeftView batteryIconView];
  [v13 setIsCharging:p_status->battIsChargingLeft != 0];

  [(HPSBatteryGroupView *)self->deviceBatteryLevelRightView setChargePercent:p_status->battLevelRight];
  v14 = [(HPSBatteryGroupView *)self->deviceBatteryLevelRightView batteryIconView];
  [v14 setIsCharging:p_status->battIsChargingRight != 0];

  [(HPSBatteryGroupView *)self->deviceBatteryLevelCaseView setChargePercent:p_status->battLevelCase];
  id v15 = [(HPSBatteryGroupView *)self->deviceBatteryLevelCaseView batteryIconView];
  [v15 setIsCharging:p_status->battIsChargingCase != 0];
}

- (BOOL)untethered
{
  return self->untethered;
}

- (HPSBatteryStatusView)initWithFrame:(CGRect)a3 device:(id)a4 darkMode:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HPSBatteryStatusView;
  v13 = -[HPSBatteryStatusView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    p_currentDevice = (id *)&v13->currentDevice;
    objc_storeStrong((id *)&v13->currentDevice, a4);
    v16 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [*p_currentDevice classicDevice];
      v18 = [v17 address];
      *(_DWORD *)buf = 138412290;
      v31 = v18;
      _os_log_impl(&dword_1E4BFE000, v16, OS_LOG_TYPE_DEFAULT, "Battery Status: Classic device address %@", buf, 0xCu);
    }
    v19 = [[HPSEngravingService alloc] initWithDevice:*p_currentDevice];
    engravingService = v14->engravingService;
    v14->engravingService = v19;

    if ([(HPSEngravingService *)v14->engravingService isEngravingSupported])
    {
      v21 = v14->engravingService;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __54__HPSBatteryStatusView_initWithFrame_device_darkMode___block_invoke;
      v27[3] = &unk_1E6EA9038;
      v28 = v14;
      [(HPSEngravingService *)v21 getEngravedCaseView:v27];
    }
    v14->darkMode = a5;
    deviceImageView = v14->deviceImageView;
    v14->deviceImageView = 0;

    caseImageView = v14->caseImageView;
    v14->caseImageView = 0;

    leftImageView = v14->leftImageView;
    v14->leftImageView = 0;

    rightImageView = v14->rightImageView;
    v14->rightImageView = 0;

    [(HPSBatteryStatusView *)v14 getBatteryStatus];
    [(HPSBatteryStatusView *)v14 setupViews];
    v14->deviceColor = 0;
  }

  return v14;
}

void __54__HPSBatteryStatusView_initWithFrame_device_darkMode___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 512), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) setupViews];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)getBatteryStatus
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v3 = [(BluetoothDeviceProtocol *)self->currentDevice classicDevice];
  [v3 batteryStatus:&self->status];

  id v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int battLevelSingle = self->status.battLevelSingle;
    int battLevelRight = self->status.battLevelRight;
    int battLevelLeft = self->status.battLevelLeft;
    int battLevelCase = self->status.battLevelCase;
    int battLevelCombined = self->status.battLevelCombined;
    v15[0] = 67110144;
    v15[1] = battLevelSingle;
    __int16 v16 = 1024;
    int v17 = battLevelRight;
    __int16 v18 = 1024;
    int v19 = battLevelLeft;
    __int16 v20 = 1024;
    int v21 = battLevelCase;
    __int16 v22 = 1024;
    int v23 = battLevelCombined;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Battery Status: battLevelSingle %d, battLevelRight %d, battLevelLeft %d, battLevelCase %d, battLevelCombined %d", (uint8_t *)v15, 0x20u);
  }

  v10 = [(HPSBatteryStatusView *)self getProductIDString];
  productIdString = self->productIdString;
  self->productIdString = v10;

  id v12 = [(BluetoothDeviceProtocol *)self->currentDevice classicDevice];
  __int16 v13 = [v12 accessorySettingFeatureBitMask];

  self->BOOL untethered = (v13 & 0x400) != 0;
  v14 = [(BluetoothDeviceProtocol *)self->currentDevice classicDevice];
  LODWORD(v12) = +[HPSProductUtils isBeatsNonWx:v14];

  if (v12) {
    self->BOOL untethered = 1;
  }
}

- (void)applyFiltersForMode:(BOOL)a3
{
  self->darkMode = a3;
  id v4 = [(BluetoothDeviceProtocol *)self->currentDevice classicDevice];
  uint64_t v5 = [v4 productId];

  uint64_t v6 = [(HPSBatteryStatusView *)self getAssetsDictionary:v5];
  uint64_t v7 = v6;
  if (!self->untethered)
  {
    deviceImageView = self->deviceImageView;
    if (!deviceImageView) {
      goto LABEL_10;
    }
    v9 = self;
    uint64_t v10 = v7;
    goto LABEL_9;
  }
  if (self->caseImageView)
  {
    if (self->leftImageView)
    {
      if (self->rightImageView)
      {
        uint64_t v10 = v6;
        -[HPSBatteryStatusView applyFilters:imageView:](self, "applyFilters:imageView:", v6);
        uint64_t v6 = [(HPSBatteryStatusView *)self applyFilters:v10 imageView:self->rightImageView];
        uint64_t v7 = v10;
        if (!self->caseEngravingView)
        {
          deviceImageView = self->caseImageView;
          v9 = self;
LABEL_9:
          uint64_t v6 = [(HPSBatteryStatusView *)v9 applyFilters:v10 imageView:deviceImageView];
          uint64_t v7 = v10;
        }
      }
    }
  }
LABEL_10:

  MEMORY[0x1F41817F8](v6, v7);
}

- (void)applyFilters:(id)a3 imageView:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F39BC0];
  id v8 = a4;
  id v9 = [v7 alloc];
  uint64_t v10 = (void *)[v9 initWithType:*MEMORY[0x1E4F3A038]];
  id v11 = objc_alloc(MEMORY[0x1E4F39BC0]);
  id v12 = (void *)[v11 initWithType:*MEMORY[0x1E4F39FD8]];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v52 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 4);
  int v53 = *(_DWORD *)(MEMORY[0x1E4F39AD8] + 20);
  long long v50 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 28);
  int v51 = *(_DWORD *)(MEMORY[0x1E4F39AD8] + 44);
  v49[0] = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 52);
  *(_OWORD *)((char *)v49 + 12) = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  BOOL darkMode = self->darkMode;
  BOOL v15 = [(HPSBatteryStatusView *)self isProductOfDifferentColors];
  if (darkMode)
  {
    if (v15)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"DarkMatrixValue-%d", self->deviceColor);
      __int16 v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v16 = @"DarkMatrixValue";
    }
    if ([(HPSBatteryStatusView *)self isProductOfDifferentColors])
    {
      objc_msgSend(NSString, "stringWithFormat:", @"DarkBiasValue-%d", self->deviceColor);
      int v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v17 = @"DarkBiasValue";
    }
    __int16 v18 = [v6 objectForKey:v16];
    [v18 floatValue];
    float v20 = v19;

    int v21 = [v6 objectForKey:v17];
    [v21 floatValue];
    float v23 = v22;

    if ((v23 == 0.0 || v20 == 0.0)
      && [(HPSBatteryStatusView *)self isProductOfDifferentColors])
    {
      v39 = @"DarkBiasValue-%d";
      id v40 = v8;
      uint64_t v24 = @"DarkMatrixValue-%d";
LABEL_22:
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", v24, -[HPSBatteryStatusView defaultFiltersID](self, "defaultFiltersID"));

      uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", v39, -[HPSBatteryStatusView defaultFiltersID](self, "defaultFiltersID"));

      v31 = [v6 objectForKey:v29];
      [v31 floatValue];
      float v20 = v32;

      v33 = [v6 objectForKey:v30];
      [v33 floatValue];
      float v23 = v34;

      __int16 v16 = (__CFString *)v29;
      int v17 = (__CFString *)v30;
      id v8 = v40;
    }
  }
  else
  {
    if (v15)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"LightMatrixValue-%d", self->deviceColor);
      __int16 v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v16 = @"LightMatrixValue";
    }
    if ([(HPSBatteryStatusView *)self isProductOfDifferentColors])
    {
      objc_msgSend(NSString, "stringWithFormat:", @"LightBiasValue-%d", self->deviceColor);
      int v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v17 = @"LightBiasValue";
    }
    v25 = [v6 objectForKey:v16];
    [v25 floatValue];
    float v20 = v26;

    v27 = [v6 objectForKey:v17];
    [v27 floatValue];
    float v23 = v28;

    if ((v23 == 0.0 || v20 == 0.0)
      && [(HPSBatteryStatusView *)self isProductOfDifferentColors])
    {
      v39 = @"LightBiasValue-%d";
      id v40 = v8;
      uint64_t v24 = @"LightMatrixValue-%d";
      goto LABEL_22;
    }
  }
  float v41 = v20;
  long long v42 = v52;
  int v43 = v53;
  float v44 = v20;
  long long v45 = v50;
  int v46 = v51;
  float v47 = v20;
  *(_OWORD *)v48 = v49[0];
  *(_OWORD *)&v48[12] = *(_OWORD *)((char *)v49 + 12);
  v35 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v41];
  [v10 setValue:v35 forKey:@"inputColorMatrix"];

  *(float *)&double v36 = v23;
  v37 = [NSNumber numberWithFloat:v36];
  [v12 setValue:v37 forKey:@"inputAmount"];

  [v13 addObject:v10];
  [v13 addObject:v12];
  v38 = [v8 layer];

  [v38 setFilters:v13];
}

- (id)getDeviceCaseIcon:(unsigned int)a3
{
  id v4 = 0;
  v29[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0x200Bu:
    case 0x201Du:
      uint64_t v5 = @"beats.powerbeatspro.chargingcase.fill";
      goto LABEL_11;
    case 0x200Cu:
    case 0x200Du:
    case 0x2010u:
    case 0x2015u:
    case 0x2017u:
    case 0x2018u:
    case 0x2019u:
    case 0x201Au:
    case 0x201Bu:
    case 0x201Cu:
      goto LABEL_15;
    case 0x200Eu:
    case 0x2014u:
      goto LABEL_5;
    case 0x200Fu:
      uint64_t v5 = @"airpods.chargingcase.wireless.fill";
      goto LABEL_11;
    case 0x2011u:
    case 0x2016u:
      uint64_t v5 = @"beats.studiobuds.chargingcase.fill";
      goto LABEL_11;
    case 0x2012u:
      uint64_t v5 = @"beats.fit.pro.chargingcase.fill";
      goto LABEL_11;
    case 0x2013u:
      uint64_t v5 = @"airpods.gen3.chargingcase.wireless.fill";
      goto LABEL_11;
    default:
      if (a3 == 8194)
      {
        uint64_t v5 = @"airpods.chargingcase.fill";
      }
      else
      {
        if (a3 != 8228) {
          goto LABEL_15;
        }
LABEL_5:
        uint64_t v5 = @"airpodspro.chargingcase.wireless.fill";
      }
LABEL_11:
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F6F210]) initWithSymbolName:v5 bundleURL:0];
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithSystemColor:12];
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithSystemColor:11];
      id v9 = objc_alloc(MEMORY[0x1E4F6F1C8]);
      id v10 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
      id v11 = objc_msgSend(v9, "initWithCGColor:", objc_msgSend(v10, "CGColor"));

      id v12 = objc_alloc_init(MEMORY[0x1E4F6F1D0]);
      if (self->darkMode)
      {
        v29[0] = v8;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
        [v12 setSymbolColors:v13];

        float v28 = v7;
        v14 = &v28;
      }
      else
      {
        v27 = v7;
        BOOL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
        [v12 setSymbolColors:v15];

        float v26 = v11;
        v14 = &v26;
      }
      __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [v12 setEnclosureColors:v16];

      [v12 setRenderingMode:3];
      int v17 = [v6 imageForGraphicSymbolDescriptor:v12];
      uint64_t v18 = [v17 CGImage];
      float v19 = PSBlankIconImage();
      [v19 size];
      double v21 = v20;
      double v23 = v22;

      uint64_t v24 = [MEMORY[0x1E4FB1818] imageWithCGImage:v18];
      v31.double width = v21;
      v31.double height = v23;
      UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
      objc_msgSend(v24, "drawInRect:", 0.0, 0.0, v21, v23);
      id v4 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();

LABEL_15:
      return v4;
  }
}

- (id)getAssetsDictionary:(unsigned int)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  switch(a3)
  {
    case 0x2002u:
    case 0x200Fu:
      BOOL v15 = [NSNumber numberWithInt:85];
      [v4 setObject:v15 forKeyedSubscript:@"BudHeight"];

      __int16 v16 = [NSNumber numberWithInt:3];
      [v4 setObject:v16 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      int v17 = [NSNumber numberWithInt:30];
      [v4 setObject:v17 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      uint64_t v18 = [NSNumber numberWithInt:108];
      [v4 setObject:v18 forKeyedSubscript:@"CaseHeight"];

      float v19 = [NSNumber numberWithInt:62];
      [v4 setObject:v19 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      double v20 = [NSNumber numberWithInt:35];
      [v4 setObject:v20 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v21) = 1053609165;
      double v22 = [NSNumber numberWithFloat:v21];
      [v4 setObject:v22 forKeyedSubscript:@"DarkBiasValue"];

      id v13 = NSNumber;
      LODWORD(v14) = 1065772646;
      goto LABEL_4;
    case 0x2003u:
      double v36 = [NSNumber numberWithInt:108];
      [v4 setObject:v36 forKeyedSubscript:@"BudHeight"];

      LODWORD(v37) = 1051931443;
      v38 = [NSNumber numberWithFloat:v37];
      [v4 setObject:v38 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v39) = 1065772646;
      id v40 = [NSNumber numberWithFloat:v39];
      [v4 setObject:v40 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v41) = 0.5;
      long long v42 = [NSNumber numberWithFloat:v41];
      [v4 setObject:v42 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v43) = 1066359849;
      float v44 = [NSNumber numberWithFloat:v43];
      [v4 setObject:v44 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v45) = 1044549468;
      int v46 = [NSNumber numberWithFloat:v45];
      [v4 setObject:v46 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v47) = 1065017672;
      v48 = [NSNumber numberWithFloat:v47];
      [v4 setObject:v48 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v49) = 0.5;
      long long v50 = [NSNumber numberWithFloat:v49];
      [v4 setObject:v50 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v51) = 1066695393;
      long long v52 = [NSNumber numberWithFloat:v51];
      [v4 setObject:v52 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v53) = 1055286886;
      v54 = [NSNumber numberWithFloat:v53];
      [v4 setObject:v54 forKeyedSubscript:@"DarkBiasValue-11"];

      LODWORD(v55) = 1057300152;
      v56 = [NSNumber numberWithFloat:v55];
      [v4 setObject:v56 forKeyedSubscript:@"DarkMatrixValue-11"];

      LODWORD(v57) = 0.5;
      v58 = [NSNumber numberWithFloat:v57];
      [v4 setObject:v58 forKeyedSubscript:@"LightBiasValue-11"];

      LODWORD(v59) = 1066695393;
      v60 = [NSNumber numberWithFloat:v59];
      [v4 setObject:v60 forKeyedSubscript:@"LightMatrixValue-11"];

      LODWORD(v61) = 1047233823;
      v62 = [NSNumber numberWithFloat:v61];
      [v4 setObject:v62 forKeyedSubscript:@"DarkBiasValue-12"];

      LODWORD(v63) = 1061662228;
      v64 = [NSNumber numberWithFloat:v63];
      [v4 setObject:v64 forKeyedSubscript:@"DarkMatrixValue-12"];

      LODWORD(v65) = 0.5;
      v66 = [NSNumber numberWithFloat:v65];
      [v4 setObject:v66 forKeyedSubscript:@"LightBiasValue-12"];

      LODWORD(v67) = 1066695393;
      v68 = [NSNumber numberWithFloat:v67];
      [v4 setObject:v68 forKeyedSubscript:@"LightMatrixValue-12"];

      LODWORD(v69) = 1047233823;
      v70 = [NSNumber numberWithFloat:v69];
      [v4 setObject:v70 forKeyedSubscript:@"DarkBiasValue-13"];

      LODWORD(v71) = 1061662228;
      v72 = [NSNumber numberWithFloat:v71];
      [v4 setObject:v72 forKeyedSubscript:@"DarkMatrixValue-13"];

      LODWORD(v73) = 0.5;
      v74 = [NSNumber numberWithFloat:v73];
      [v4 setObject:v74 forKeyedSubscript:@"LightBiasValue-13"];

      LODWORD(v75) = 1066695393;
      v76 = [NSNumber numberWithFloat:v75];
      [v4 setObject:v76 forKeyedSubscript:@"LightMatrixValue-13"];

      LODWORD(v77) = 1055286886;
      v78 = [NSNumber numberWithFloat:v77];
      [v4 setObject:v78 forKeyedSubscript:@"DarkBiasValue-18"];

      LODWORD(v79) = 1059816735;
      v80 = [NSNumber numberWithFloat:v79];
      [v4 setObject:v80 forKeyedSubscript:@"DarkMatrixValue-18"];

      LODWORD(v81) = 0.5;
      v82 = [NSNumber numberWithFloat:v81];
      [v4 setObject:v82 forKeyedSubscript:@"LightBiasValue-18"];

      LODWORD(v83) = 1066695393;
      v84 = [NSNumber numberWithFloat:v83];
      [v4 setObject:v84 forKeyedSubscript:@"LightMatrixValue-18"];

      LODWORD(v85) = 1056629064;
      v86 = [NSNumber numberWithFloat:v85];
      [v4 setObject:v86 forKeyedSubscript:@"DarkBiasValue-19"];

      LODWORD(v87) = 1058306785;
      v88 = [NSNumber numberWithFloat:v87];
      [v4 setObject:v88 forKeyedSubscript:@"DarkMatrixValue-19"];

      LODWORD(v89) = 0.5;
      v90 = [NSNumber numberWithFloat:v89];
      [v4 setObject:v90 forKeyedSubscript:@"LightBiasValue-19"];

      LODWORD(v91) = 1066695393;
      v92 = [NSNumber numberWithFloat:v91];
      [v4 setObject:v92 forKeyedSubscript:@"LightMatrixValue-19"];

      LODWORD(v93) = 1056293519;
      v94 = [NSNumber numberWithFloat:v93];
      [v4 setObject:v94 forKeyedSubscript:@"DarkBiasValue-20"];

      LODWORD(v95) = 1060320051;
      v96 = [NSNumber numberWithFloat:v95];
      [v4 setObject:v96 forKeyedSubscript:@"DarkMatrixValue-20"];

      LODWORD(v97) = 0.5;
      v98 = [NSNumber numberWithFloat:v97];
      [v4 setObject:v98 forKeyedSubscript:@"LightBiasValue-20"];

      LODWORD(v99) = 1066695393;
      v100 = [NSNumber numberWithFloat:v99];
      [v4 setObject:v100 forKeyedSubscript:@"LightMatrixValue-20"];

      LODWORD(v101) = 1056125747;
      v102 = [NSNumber numberWithFloat:v101];
      [v4 setObject:v102 forKeyedSubscript:@"DarkBiasValue-21"];

      LODWORD(v103) = 1058977874;
      v104 = [NSNumber numberWithFloat:v103];
      [v4 setObject:v104 forKeyedSubscript:@"DarkMatrixValue-21"];

      LODWORD(v105) = 0.5;
      v106 = [NSNumber numberWithFloat:v105];
      [v4 setObject:v106 forKeyedSubscript:@"LightBiasValue-21"];

      LODWORD(v107) = 1066695393;
      v108 = [NSNumber numberWithFloat:v107];
      [v4 setObject:v108 forKeyedSubscript:@"LightMatrixValue-21"];

      LODWORD(v109) = 1055957975;
      v110 = [NSNumber numberWithFloat:v109];
      [v4 setObject:v110 forKeyedSubscript:@"DarkBiasValue-23"];

      LODWORD(v111) = 1052266988;
      v112 = [NSNumber numberWithFloat:v111];
      [v4 setObject:v112 forKeyedSubscript:@"DarkMatrixValue-23"];

      LODWORD(v113) = 0.5;
      v114 = [NSNumber numberWithFloat:v113];
      [v4 setObject:v114 forKeyedSubscript:@"LightBiasValue-23"];

      LODWORD(v115) = 1066695393;
      v116 = [NSNumber numberWithFloat:v115];
      [v4 setObject:v116 forKeyedSubscript:@"LightMatrixValue-23"];

      LODWORD(v117) = 1058642330;
      v118 = [NSNumber numberWithFloat:v117];
      [v4 setObject:v118 forKeyedSubscript:@"DarkBiasValue-32"];

      LODWORD(v119) = 1049582633;
      v120 = [NSNumber numberWithFloat:v119];
      [v4 setObject:v120 forKeyedSubscript:@"DarkMatrixValue-32"];

      LODWORD(v121) = 0.5;
      v122 = [NSNumber numberWithFloat:v121];
      [v4 setObject:v122 forKeyedSubscript:@"LightBiasValue-32"];

      LODWORD(v123) = 1066695393;
      v124 = [NSNumber numberWithFloat:v123];
      [v4 setObject:v124 forKeyedSubscript:@"LightMatrixValue-32"];

      LODWORD(v125) = 1052266988;
      v126 = [NSNumber numberWithFloat:v125];
      [v4 setObject:v126 forKeyedSubscript:@"DarkBiasValue-33"];

      LODWORD(v127) = 1059313418;
      v128 = [NSNumber numberWithFloat:v127];
      [v4 setObject:v128 forKeyedSubscript:@"DarkMatrixValue-33"];

      LODWORD(v129) = 0.5;
      v130 = [NSNumber numberWithFloat:v129];
      [v4 setObject:v130 forKeyedSubscript:@"LightBiasValue-33"];

      LODWORD(v131) = 1066695393;
      v132 = [NSNumber numberWithFloat:v131];
      [v4 setObject:v132 forKeyedSubscript:@"LightMatrixValue-33"];

      LODWORD(v133) = 1056293519;
      v134 = [NSNumber numberWithFloat:v133];
      [v4 setObject:v134 forKeyedSubscript:@"DarkBiasValue-34"];

      LODWORD(v135) = 0.5;
      v136 = [NSNumber numberWithFloat:v135];
      [v4 setObject:v136 forKeyedSubscript:@"DarkMatrixValue-34"];

      LODWORD(v137) = 0.5;
      v138 = [NSNumber numberWithFloat:v137];
      [v4 setObject:v138 forKeyedSubscript:@"LightBiasValue-34"];

      LODWORD(v139) = 1066695393;
      v140 = [NSNumber numberWithFloat:v139];
      [v4 setObject:v140 forKeyedSubscript:@"LightMatrixValue-34"];

      LODWORD(v141) = 1053609165;
      v142 = [NSNumber numberWithFloat:v141];
      [v4 setObject:v142 forKeyedSubscript:@"DarkBiasValue-35"];

      LODWORD(v143) = 1058139013;
      v144 = [NSNumber numberWithFloat:v143];
      [v4 setObject:v144 forKeyedSubscript:@"DarkMatrixValue-35"];

      LODWORD(v145) = 0.5;
      v146 = [NSNumber numberWithFloat:v145];
      [v4 setObject:v146 forKeyedSubscript:@"LightBiasValue-35"];

      LODWORD(v147) = 1066695393;
      v148 = [NSNumber numberWithFloat:v147];
      [v4 setObject:v148 forKeyedSubscript:@"LightMatrixValue-35"];

      LODWORD(v149) = 1056293519;
      v150 = [NSNumber numberWithFloat:v149];
      [v4 setObject:v150 forKeyedSubscript:@"DarkBiasValue-37"];

      LODWORD(v151) = 1054280253;
      v152 = [NSNumber numberWithFloat:v151];
      [v4 setObject:v152 forKeyedSubscript:@"DarkMatrixValue-37"];

      LODWORD(v153) = 0.5;
      v154 = [NSNumber numberWithFloat:v153];
      [v4 setObject:v154 forKeyedSubscript:@"LightBiasValue-37"];

      LODWORD(v155) = 1066695393;
      v156 = [NSNumber numberWithFloat:v155];
      v157 = @"LightMatrixValue-37";
      break;
    case 0x2005u:
      v158 = [NSNumber numberWithInt:108];
      [v4 setObject:v158 forKeyedSubscript:@"BudHeight"];

      LODWORD(v159) = 1049414861;
      v160 = [NSNumber numberWithFloat:v159];
      [v4 setObject:v160 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v161) = 1066192077;
      v162 = [NSNumber numberWithFloat:v161];
      [v4 setObject:v162 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v163) = 0.5;
      v164 = [NSNumber numberWithFloat:v163];
      [v4 setObject:v164 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v165) = 1066359849;
      v166 = [NSNumber numberWithFloat:v165];
      [v4 setObject:v166 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v167) = 1056125747;
      v168 = [NSNumber numberWithFloat:v167];
      [v4 setObject:v168 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v169) = 1053944709;
      v170 = [NSNumber numberWithFloat:v169];
      [v4 setObject:v170 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v171) = 0.5;
      v172 = [NSNumber numberWithFloat:v171];
      [v4 setObject:v172 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v173) = 1066695393;
      v174 = [NSNumber numberWithFloat:v173];
      [v4 setObject:v174 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v175) = 1059481190;
      v176 = [NSNumber numberWithFloat:v175];
      [v4 setObject:v176 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v177) = 1049582633;
      v178 = [NSNumber numberWithFloat:v177];
      [v4 setObject:v178 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v179) = 0.5;
      v180 = [NSNumber numberWithFloat:v179];
      [v4 setObject:v180 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v181) = 1066695393;
      v182 = [NSNumber numberWithFloat:v181];
      [v4 setObject:v182 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v183) = 1059984507;
      v184 = [NSNumber numberWithFloat:v183];
      [v4 setObject:v184 forKeyedSubscript:@"DarkBiasValue-5"];

      LODWORD(v185) = 1051931443;
      v186 = [NSNumber numberWithFloat:v185];
      [v4 setObject:v186 forKeyedSubscript:@"DarkMatrixValue-5"];

      LODWORD(v187) = 0.5;
      v188 = [NSNumber numberWithFloat:v187];
      [v4 setObject:v188 forKeyedSubscript:@"LightBiasValue-5"];

      LODWORD(v189) = 1066695393;
      v190 = [NSNumber numberWithFloat:v189];
      [v4 setObject:v190 forKeyedSubscript:@"LightMatrixValue-5"];

      LODWORD(v191) = 1050253722;
      v192 = [NSNumber numberWithFloat:v191];
      [v4 setObject:v192 forKeyedSubscript:@"DarkBiasValue-27"];

      LODWORD(v193) = 1065520988;
      v194 = [NSNumber numberWithFloat:v193];
      [v4 setObject:v194 forKeyedSubscript:@"DarkMatrixValue-27"];

      LODWORD(v195) = 0.5;
      v196 = [NSNumber numberWithFloat:v195];
      [v4 setObject:v196 forKeyedSubscript:@"LightBiasValue-27"];

      LODWORD(v197) = 1066695393;
      v198 = [NSNumber numberWithFloat:v197];
      [v4 setObject:v198 forKeyedSubscript:@"LightMatrixValue-27"];

      LODWORD(v199) = 1056293519;
      v200 = [NSNumber numberWithFloat:v199];
      [v4 setObject:v200 forKeyedSubscript:@"DarkBiasValue-29"];

      LODWORD(v201) = 1035489772;
      v202 = [NSNumber numberWithFloat:v201];
      [v4 setObject:v202 forKeyedSubscript:@"DarkMatrixValue-29"];

      LODWORD(v203) = 0.5;
      v204 = [NSNumber numberWithFloat:v203];
      [v4 setObject:v204 forKeyedSubscript:@"LightBiasValue-29"];

      LODWORD(v205) = 1066695393;
      v206 = [NSNumber numberWithFloat:v205];
      [v4 setObject:v206 forKeyedSubscript:@"LightMatrixValue-29"];

      LODWORD(v207) = 1055286886;
      v208 = [NSNumber numberWithFloat:v207];
      [v4 setObject:v208 forKeyedSubscript:@"DarkBiasValue-37"];

      LODWORD(v209) = 1057132380;
      v210 = [NSNumber numberWithFloat:v209];
      [v4 setObject:v210 forKeyedSubscript:@"DarkMatrixValue-37"];

      LODWORD(v211) = 0.5;
      v212 = [NSNumber numberWithFloat:v211];
      [v4 setObject:v212 forKeyedSubscript:@"LightBiasValue-37"];

      LODWORD(v213) = 1066695393;
      v214 = [NSNumber numberWithFloat:v213];
      [v4 setObject:v214 forKeyedSubscript:@"LightMatrixValue-37"];

      LODWORD(v215) = 1056293519;
      v216 = [NSNumber numberWithFloat:v215];
      [v4 setObject:v216 forKeyedSubscript:@"DarkBiasValue-65"];

      LODWORD(v217) = 1062836634;
      v218 = [NSNumber numberWithFloat:v217];
      [v4 setObject:v218 forKeyedSubscript:@"DarkMatrixValue-65"];

      LODWORD(v219) = 0.5;
      v220 = [NSNumber numberWithFloat:v219];
      [v4 setObject:v220 forKeyedSubscript:@"LightBiasValue-65"];

      LODWORD(v221) = 1066695393;
      v222 = [NSNumber numberWithFloat:v221];
      [v4 setObject:v222 forKeyedSubscript:@"LightMatrixValue-65"];

      LODWORD(v223) = 1055286886;
      v224 = [NSNumber numberWithFloat:v223];
      [v4 setObject:v224 forKeyedSubscript:@"DarkBiasValue-73"];

      LODWORD(v225) = 1059816735;
      v226 = [NSNumber numberWithFloat:v225];
      [v4 setObject:v226 forKeyedSubscript:@"DarkMatrixValue-73"];

      LODWORD(v227) = 0.5;
      v228 = [NSNumber numberWithFloat:v227];
      [v4 setObject:v228 forKeyedSubscript:@"LightBiasValue-73"];

      LODWORD(v229) = 1066695393;
      v156 = [NSNumber numberWithFloat:v229];
      v157 = @"LightMatrixValue-73";
      break;
    case 0x2006u:
      v230 = [NSNumber numberWithInt:108];
      [v4 setObject:v230 forKeyedSubscript:@"BudHeight"];

      LODWORD(v231) = 1051931443;
      v232 = [NSNumber numberWithFloat:v231];
      [v4 setObject:v232 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v233) = 1065772646;
      v234 = [NSNumber numberWithFloat:v233];
      [v4 setObject:v234 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v235) = 0.5;
      v236 = [NSNumber numberWithFloat:v235];
      [v4 setObject:v236 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v237) = 1066695393;
      v238 = [NSNumber numberWithFloat:v237];
      [v4 setObject:v238 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v239) = 1058726216;
      v240 = [NSNumber numberWithFloat:v239];
      [v4 setObject:v240 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v241) = 1046562734;
      v242 = [NSNumber numberWithFloat:v241];
      [v4 setObject:v242 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v243) = 0.5;
      v244 = [NSNumber numberWithFloat:v243];
      [v4 setObject:v244 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v245) = 1066695393;
      v246 = [NSNumber numberWithFloat:v245];
      [v4 setObject:v246 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v247) = 1056293519;
      v248 = [NSNumber numberWithFloat:v247];
      [v4 setObject:v248 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v249) = 1064514355;
      v250 = [NSNumber numberWithFloat:v249];
      [v4 setObject:v250 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v251) = 0.5;
      v252 = [NSNumber numberWithFloat:v251];
      [v4 setObject:v252 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v253) = 1066695393;
      v254 = [NSNumber numberWithFloat:v253];
      [v4 setObject:v254 forKeyedSubscript:@"LightMatrixValue-6"];

      LODWORD(v255) = 1054951342;
      v256 = [NSNumber numberWithFloat:v255];
      [v4 setObject:v256 forKeyedSubscript:@"DarkBiasValue-7"];

      LODWORD(v257) = 1062836634;
      v258 = [NSNumber numberWithFloat:v257];
      [v4 setObject:v258 forKeyedSubscript:@"DarkMatrixValue-7"];

      LODWORD(v259) = 0.5;
      v260 = [NSNumber numberWithFloat:v259];
      [v4 setObject:v260 forKeyedSubscript:@"LightBiasValue-7"];

      LODWORD(v261) = 1066695393;
      v262 = [NSNumber numberWithFloat:v261];
      [v4 setObject:v262 forKeyedSubscript:@"LightMatrixValue-7"];

      LODWORD(v263) = 1055286886;
      v264 = [NSNumber numberWithFloat:v263];
      [v4 setObject:v264 forKeyedSubscript:@"DarkBiasValue-8"];

      LODWORD(v265) = 1062836634;
      v266 = [NSNumber numberWithFloat:v265];
      [v4 setObject:v266 forKeyedSubscript:@"DarkMatrixValue-8"];

      LODWORD(v267) = 0.5;
      v268 = [NSNumber numberWithFloat:v267];
      [v4 setObject:v268 forKeyedSubscript:@"LightBiasValue-8"];

      LODWORD(v269) = 1066695393;
      v270 = [NSNumber numberWithFloat:v269];
      [v4 setObject:v270 forKeyedSubscript:@"LightMatrixValue-8"];

      LODWORD(v271) = 1059481190;
      v272 = [NSNumber numberWithFloat:v271];
      [v4 setObject:v272 forKeyedSubscript:@"DarkBiasValue-9"];

      LODWORD(v273) = 1045220557;
      v274 = [NSNumber numberWithFloat:v273];
      [v4 setObject:v274 forKeyedSubscript:@"DarkMatrixValue-9"];

      LODWORD(v275) = 0.5;
      v276 = [NSNumber numberWithFloat:v275];
      [v4 setObject:v276 forKeyedSubscript:@"LightBiasValue-9"];

      LODWORD(v277) = 1066695393;
      v278 = [NSNumber numberWithFloat:v277];
      [v4 setObject:v278 forKeyedSubscript:@"LightMatrixValue-9"];

      LODWORD(v279) = 1055622431;
      v280 = [NSNumber numberWithFloat:v279];
      [v4 setObject:v280 forKeyedSubscript:@"DarkBiasValue-14"];

      LODWORD(v281) = 0.75;
      v282 = [NSNumber numberWithFloat:v281];
      [v4 setObject:v282 forKeyedSubscript:@"DarkMatrixValue-14"];

      LODWORD(v283) = 0.5;
      v284 = [NSNumber numberWithFloat:v283];
      [v4 setObject:v284 forKeyedSubscript:@"LightBiasValue-14"];

      LODWORD(v285) = 1066695393;
      v286 = [NSNumber numberWithFloat:v285];
      [v4 setObject:v286 forKeyedSubscript:@"LightMatrixValue-14"];

      LODWORD(v287) = 1056293519;
      v288 = [NSNumber numberWithFloat:v287];
      [v4 setObject:v288 forKeyedSubscript:@"DarkBiasValue-15"];

      LODWORD(v289) = 1061494456;
      v290 = [NSNumber numberWithFloat:v289];
      [v4 setObject:v290 forKeyedSubscript:@"DarkMatrixValue-15"];

      LODWORD(v291) = 0.5;
      v292 = [NSNumber numberWithFloat:v291];
      [v4 setObject:v292 forKeyedSubscript:@"LightBiasValue-15"];

      LODWORD(v293) = 1066695393;
      v294 = [NSNumber numberWithFloat:v293];
      [v4 setObject:v294 forKeyedSubscript:@"LightMatrixValue-15"];

      LODWORD(v295) = 1059145646;
      v296 = [NSNumber numberWithFloat:v295];
      [v4 setObject:v296 forKeyedSubscript:@"DarkBiasValue-18"];

      LODWORD(v297) = 1052938076;
      v298 = [NSNumber numberWithFloat:v297];
      [v4 setObject:v298 forKeyedSubscript:@"DarkMatrixValue-18"];

      LODWORD(v299) = 0.5;
      v300 = [NSNumber numberWithFloat:v299];
      [v4 setObject:v300 forKeyedSubscript:@"LightBiasValue-18"];

      LODWORD(v301) = 1066695393;
      v302 = [NSNumber numberWithFloat:v301];
      [v4 setObject:v302 forKeyedSubscript:@"LightMatrixValue-18"];

      LODWORD(v303) = 1057132380;
      v304 = [NSNumber numberWithFloat:v303];
      [v4 setObject:v304 forKeyedSubscript:@"DarkBiasValue-19"];

      LODWORD(v305) = 1059481190;
      v306 = [NSNumber numberWithFloat:v305];
      [v4 setObject:v306 forKeyedSubscript:@"DarkMatrixValue-19"];

      LODWORD(v307) = 0.5;
      v308 = [NSNumber numberWithFloat:v307];
      [v4 setObject:v308 forKeyedSubscript:@"LightBiasValue-19"];

      LODWORD(v309) = 1066695393;
      v310 = [NSNumber numberWithFloat:v309];
      [v4 setObject:v310 forKeyedSubscript:@"LightMatrixValue-19"];

      LODWORD(v311) = 1058810102;
      v312 = [NSNumber numberWithFloat:v311];
      [v4 setObject:v312 forKeyedSubscript:@"DarkBiasValue-20"];

      LODWORD(v313) = 1051260355;
      v314 = [NSNumber numberWithFloat:v313];
      [v4 setObject:v314 forKeyedSubscript:@"DarkMatrixValue-20"];

      LODWORD(v315) = 0.5;
      v316 = [NSNumber numberWithFloat:v315];
      [v4 setObject:v316 forKeyedSubscript:@"LightBiasValue-20"];

      LODWORD(v317) = 1066695393;
      v318 = [NSNumber numberWithFloat:v317];
      [v4 setObject:v318 forKeyedSubscript:@"LightMatrixValue-20"];

      LODWORD(v319) = 1058977874;
      v320 = [NSNumber numberWithFloat:v319];
      [v4 setObject:v320 forKeyedSubscript:@"DarkBiasValue-21"];

      LODWORD(v321) = 1050924810;
      v322 = [NSNumber numberWithFloat:v321];
      [v4 setObject:v322 forKeyedSubscript:@"DarkMatrixValue-21"];

      LODWORD(v323) = 0.5;
      v324 = [NSNumber numberWithFloat:v323];
      [v4 setObject:v324 forKeyedSubscript:@"LightBiasValue-21"];

      LODWORD(v325) = 1066695393;
      v326 = [NSNumber numberWithFloat:v325];
      [v4 setObject:v326 forKeyedSubscript:@"LightMatrixValue-21"];

      LODWORD(v327) = 1051931443;
      v328 = [NSNumber numberWithFloat:v327];
      [v4 setObject:v328 forKeyedSubscript:@"DarkBiasValue-27"];

      LODWORD(v329) = 1065772646;
      v330 = [NSNumber numberWithFloat:v329];
      [v4 setObject:v330 forKeyedSubscript:@"DarkMatrixValue-27"];

      LODWORD(v331) = 0.5;
      v332 = [NSNumber numberWithFloat:v331];
      [v4 setObject:v332 forKeyedSubscript:@"LightBiasValue-27"];

      LODWORD(v333) = 1066695393;
      v334 = [NSNumber numberWithFloat:v333];
      [v4 setObject:v334 forKeyedSubscript:@"LightMatrixValue-27"];

      LODWORD(v335) = 1056293519;
      v336 = [NSNumber numberWithFloat:v335];
      [v4 setObject:v336 forKeyedSubscript:@"DarkBiasValue-29"];

      LODWORD(v337) = 1062668861;
      v338 = [NSNumber numberWithFloat:v337];
      [v4 setObject:v338 forKeyedSubscript:@"DarkMatrixValue-29"];

      LODWORD(v339) = 0.5;
      v340 = [NSNumber numberWithFloat:v339];
      [v4 setObject:v340 forKeyedSubscript:@"LightBiasValue-29"];

      LODWORD(v341) = 1066695393;
      v342 = [NSNumber numberWithFloat:v341];
      [v4 setObject:v342 forKeyedSubscript:@"LightMatrixValue-29"];

      LODWORD(v343) = 1055957975;
      v344 = [NSNumber numberWithFloat:v343];
      [v4 setObject:v344 forKeyedSubscript:@"DarkBiasValue-32"];

      LODWORD(v345) = 1059984507;
      v346 = [NSNumber numberWithFloat:v345];
      [v4 setObject:v346 forKeyedSubscript:@"DarkMatrixValue-32"];

      LODWORD(v347) = 0.5;
      v348 = [NSNumber numberWithFloat:v347];
      [v4 setObject:v348 forKeyedSubscript:@"LightBiasValue-32"];

      LODWORD(v349) = 1066695393;
      v350 = [NSNumber numberWithFloat:v349];
      [v4 setObject:v350 forKeyedSubscript:@"LightMatrixValue-32"];

      LODWORD(v351) = 1056461292;
      v352 = [NSNumber numberWithFloat:v351];
      [v4 setObject:v352 forKeyedSubscript:@"DarkBiasValue-33"];

      LODWORD(v353) = 1059648963;
      v354 = [NSNumber numberWithFloat:v353];
      [v4 setObject:v354 forKeyedSubscript:@"DarkMatrixValue-33"];

      LODWORD(v355) = 0.5;
      v356 = [NSNumber numberWithFloat:v355];
      [v4 setObject:v356 forKeyedSubscript:@"LightBiasValue-33"];

      LODWORD(v357) = 1066695393;
      v358 = [NSNumber numberWithFloat:v357];
      [v4 setObject:v358 forKeyedSubscript:@"LightMatrixValue-33"];

      LODWORD(v359) = 1056293519;
      v360 = [NSNumber numberWithFloat:v359];
      [v4 setObject:v360 forKeyedSubscript:@"DarkBiasValue-34"];

      LODWORD(v361) = 1061326684;
      v362 = [NSNumber numberWithFloat:v361];
      [v4 setObject:v362 forKeyedSubscript:@"DarkMatrixValue-34"];

      LODWORD(v363) = 0.5;
      v364 = [NSNumber numberWithFloat:v363];
      [v4 setObject:v364 forKeyedSubscript:@"LightBiasValue-34"];

      LODWORD(v365) = 1066695393;
      v366 = [NSNumber numberWithFloat:v365];
      [v4 setObject:v366 forKeyedSubscript:@"LightMatrixValue-34"];

      LODWORD(v367) = 1055622431;
      v368 = [NSNumber numberWithFloat:v367];
      [v4 setObject:v368 forKeyedSubscript:@"DarkBiasValue-35"];

      LODWORD(v369) = 1059648963;
      v370 = [NSNumber numberWithFloat:v369];
      [v4 setObject:v370 forKeyedSubscript:@"DarkMatrixValue-35"];

      LODWORD(v371) = 0.5;
      v372 = [NSNumber numberWithFloat:v371];
      [v4 setObject:v372 forKeyedSubscript:@"LightBiasValue-35"];

      LODWORD(v373) = 1066695393;
      v374 = [NSNumber numberWithFloat:v373];
      [v4 setObject:v374 forKeyedSubscript:@"LightMatrixValue-35"];

      LODWORD(v375) = 1058306785;
      v376 = [NSNumber numberWithFloat:v375];
      [v4 setObject:v376 forKeyedSubscript:@"DarkBiasValue-37"];

      LODWORD(v377) = 1051092582;
      v378 = [NSNumber numberWithFloat:v377];
      [v4 setObject:v378 forKeyedSubscript:@"DarkMatrixValue-37"];

      LODWORD(v379) = 0.5;
      v380 = [NSNumber numberWithFloat:v379];
      [v4 setObject:v380 forKeyedSubscript:@"LightBiasValue-37"];

      LODWORD(v381) = 1066695393;
      v382 = [NSNumber numberWithFloat:v381];
      [v4 setObject:v382 forKeyedSubscript:@"LightMatrixValue-37"];

      LODWORD(v383) = 1054951342;
      v384 = [NSNumber numberWithFloat:v383];
      [v4 setObject:v384 forKeyedSubscript:@"DarkBiasValue-42"];

      LODWORD(v385) = 1062501089;
      v386 = [NSNumber numberWithFloat:v385];
      [v4 setObject:v386 forKeyedSubscript:@"DarkMatrixValue-42"];

      LODWORD(v387) = 0.5;
      v388 = [NSNumber numberWithFloat:v387];
      [v4 setObject:v388 forKeyedSubscript:@"LightBiasValue-42"];

      LODWORD(v389) = 1066695393;
      v390 = [NSNumber numberWithFloat:v389];
      [v4 setObject:v390 forKeyedSubscript:@"LightMatrixValue-42"];

      LODWORD(v391) = 1054280253;
      v392 = [NSNumber numberWithFloat:v391];
      [v4 setObject:v392 forKeyedSubscript:@"DarkBiasValue-46"];

      LODWORD(v393) = 1063843267;
      v394 = [NSNumber numberWithFloat:v393];
      [v4 setObject:v394 forKeyedSubscript:@"DarkMatrixValue-46"];

      LODWORD(v395) = 0.5;
      v396 = [NSNumber numberWithFloat:v395];
      [v4 setObject:v396 forKeyedSubscript:@"LightBiasValue-46"];

      LODWORD(v397) = 1066695393;
      v398 = [NSNumber numberWithFloat:v397];
      [v4 setObject:v398 forKeyedSubscript:@"LightMatrixValue-46"];

      LODWORD(v399) = 1051931443;
      v400 = [NSNumber numberWithFloat:v399];
      [v4 setObject:v400 forKeyedSubscript:@"DarkBiasValue-47"];

      LODWORD(v401) = 1065772646;
      v402 = [NSNumber numberWithFloat:v401];
      [v4 setObject:v402 forKeyedSubscript:@"DarkMatrixValue-47"];

      LODWORD(v403) = 0.5;
      v404 = [NSNumber numberWithFloat:v403];
      [v4 setObject:v404 forKeyedSubscript:@"LightBiasValue-47"];

      LODWORD(v405) = 1066695393;
      v406 = [NSNumber numberWithFloat:v405];
      [v4 setObject:v406 forKeyedSubscript:@"LightMatrixValue-47"];

      LODWORD(v407) = 1054615798;
      v408 = [NSNumber numberWithFloat:v407];
      [v4 setObject:v408 forKeyedSubscript:@"DarkBiasValue-61"];

      LODWORD(v409) = 1063507722;
      v410 = [NSNumber numberWithFloat:v409];
      [v4 setObject:v410 forKeyedSubscript:@"DarkMatrixValue-61"];

      LODWORD(v411) = 0.5;
      v412 = [NSNumber numberWithFloat:v411];
      [v4 setObject:v412 forKeyedSubscript:@"LightBiasValue-61"];

      LODWORD(v413) = 1066695393;
      v414 = [NSNumber numberWithFloat:v413];
      [v4 setObject:v414 forKeyedSubscript:@"LightMatrixValue-61"];

      LODWORD(v415) = 1053944709;
      v416 = [NSNumber numberWithFloat:v415];
      [v4 setObject:v416 forKeyedSubscript:@"DarkBiasValue-62"];

      LODWORD(v417) = 1064011039;
      v418 = [NSNumber numberWithFloat:v417];
      [v4 setObject:v418 forKeyedSubscript:@"DarkMatrixValue-62"];

      LODWORD(v419) = 0.5;
      v420 = [NSNumber numberWithFloat:v419];
      [v4 setObject:v420 forKeyedSubscript:@"LightBiasValue-62"];

      LODWORD(v421) = 1066695393;
      v422 = [NSNumber numberWithFloat:v421];
      [v4 setObject:v422 forKeyedSubscript:@"LightMatrixValue-62"];

      LODWORD(v423) = 1054951342;
      v424 = [NSNumber numberWithFloat:v423];
      [v4 setObject:v424 forKeyedSubscript:@"DarkBiasValue-63"];

      LODWORD(v425) = 1064011039;
      v426 = [NSNumber numberWithFloat:v425];
      [v4 setObject:v426 forKeyedSubscript:@"DarkMatrixValue-63"];

      LODWORD(v427) = 0.5;
      v428 = [NSNumber numberWithFloat:v427];
      [v4 setObject:v428 forKeyedSubscript:@"LightBiasValue-63"];

      LODWORD(v429) = 1066695393;
      v430 = [NSNumber numberWithFloat:v429];
      [v4 setObject:v430 forKeyedSubscript:@"LightMatrixValue-63"];

      LODWORD(v431) = 1054951342;
      v432 = [NSNumber numberWithFloat:v431];
      [v4 setObject:v432 forKeyedSubscript:@"DarkBiasValue-64"];

      LODWORD(v433) = 1060487823;
      v434 = [NSNumber numberWithFloat:v433];
      [v4 setObject:v434 forKeyedSubscript:@"DarkMatrixValue-64"];

      LODWORD(v435) = 0.5;
      v436 = [NSNumber numberWithFloat:v435];
      [v4 setObject:v436 forKeyedSubscript:@"LightBiasValue-64"];

      LODWORD(v437) = 1066695393;
      v438 = [NSNumber numberWithFloat:v437];
      [v4 setObject:v438 forKeyedSubscript:@"LightMatrixValue-64"];

      LODWORD(v439) = 1055957975;
      v440 = [NSNumber numberWithFloat:v439];
      [v4 setObject:v440 forKeyedSubscript:@"DarkBiasValue-91"];

      LODWORD(v441) = 1064011039;
      v442 = [NSNumber numberWithFloat:v441];
      [v4 setObject:v442 forKeyedSubscript:@"DarkMatrixValue-91"];

      LODWORD(v443) = 0.5;
      v444 = [NSNumber numberWithFloat:v443];
      [v4 setObject:v444 forKeyedSubscript:@"LightBiasValue-91"];

      LODWORD(v445) = 1065185444;
      v446 = [NSNumber numberWithFloat:v445];
      [v4 setObject:v446 forKeyedSubscript:@"LightMatrixValue-91"];

      LODWORD(v447) = 1055957975;
      v448 = [NSNumber numberWithFloat:v447];
      [v4 setObject:v448 forKeyedSubscript:@"DarkBiasValue-92"];

      LODWORD(v449) = 1063675494;
      v450 = [NSNumber numberWithFloat:v449];
      [v4 setObject:v450 forKeyedSubscript:@"DarkMatrixValue-92"];

      LODWORD(v451) = 0.5;
      v452 = [NSNumber numberWithFloat:v451];
      [v4 setObject:v452 forKeyedSubscript:@"LightBiasValue-92"];

      LODWORD(v453) = 1065185444;
      v156 = [NSNumber numberWithFloat:v453];
      v157 = @"LightMatrixValue-92";
      break;
    case 0x2009u:
      v454 = [NSNumber numberWithInt:108];
      [v4 setObject:v454 forKeyedSubscript:@"BudHeight"];

      LODWORD(v455) = 1051931443;
      v456 = [NSNumber numberWithFloat:v455];
      [v4 setObject:v456 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v457) = 1065772646;
      v458 = [NSNumber numberWithFloat:v457];
      [v4 setObject:v458 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v459) = 0.5;
      v460 = [NSNumber numberWithFloat:v459];
      [v4 setObject:v460 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v461) = 1066695393;
      v462 = [NSNumber numberWithFloat:v461];
      [v4 setObject:v462 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v463) = 1057384038;
      v464 = [NSNumber numberWithFloat:v463];
      [v4 setObject:v464 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v465) = 1058642330;
      v466 = [NSNumber numberWithFloat:v465];
      [v4 setObject:v466 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v467) = 0.5;
      v468 = [NSNumber numberWithFloat:v467];
      [v4 setObject:v468 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v469) = 1066695393;
      v470 = [NSNumber numberWithFloat:v469];
      [v4 setObject:v470 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v471) = 1058474557;
      v472 = [NSNumber numberWithFloat:v471];
      [v4 setObject:v472 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v473) = 1053944709;
      v474 = [NSNumber numberWithFloat:v473];
      [v4 setObject:v474 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v475) = 0.5;
      v476 = [NSNumber numberWithFloat:v475];
      [v4 setObject:v476 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v477) = 1066695393;
      v478 = [NSNumber numberWithFloat:v477];
      [v4 setObject:v478 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v479) = 1057467924;
      v480 = [NSNumber numberWithFloat:v479];
      [v4 setObject:v480 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v481) = 1057132380;
      v482 = [NSNumber numberWithFloat:v481];
      [v4 setObject:v482 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v483) = 0.5;
      v484 = [NSNumber numberWithFloat:v483];
      [v4 setObject:v484 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v485) = 1066695393;
      v486 = [NSNumber numberWithFloat:v485];
      [v4 setObject:v486 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v487) = 1057467924;
      v488 = [NSNumber numberWithFloat:v487];
      [v4 setObject:v488 forKeyedSubscript:@"DarkBiasValue-24"];

      LODWORD(v489) = 0.5;
      v490 = [NSNumber numberWithFloat:v489];
      [v4 setObject:v490 forKeyedSubscript:@"DarkMatrixValue-24"];

      LODWORD(v491) = 0.5;
      v492 = [NSNumber numberWithFloat:v491];
      [v4 setObject:v492 forKeyedSubscript:@"LightBiasValue-24"];

      LODWORD(v493) = 1066695393;
      v494 = [NSNumber numberWithFloat:v493];
      [v4 setObject:v494 forKeyedSubscript:@"LightMatrixValue-24"];

      LODWORD(v495) = 1051931443;
      v496 = [NSNumber numberWithFloat:v495];
      [v4 setObject:v496 forKeyedSubscript:@"DarkBiasValue-25"];

      LODWORD(v497) = 1066024305;
      v498 = [NSNumber numberWithFloat:v497];
      [v4 setObject:v498 forKeyedSubscript:@"DarkMatrixValue-25"];

      LODWORD(v499) = 0.5;
      v500 = [NSNumber numberWithFloat:v499];
      [v4 setObject:v500 forKeyedSubscript:@"LightBiasValue-25"];

      LODWORD(v501) = 1066695393;
      v502 = [NSNumber numberWithFloat:v501];
      [v4 setObject:v502 forKeyedSubscript:@"LightMatrixValue-25"];

      LODWORD(v503) = 1058642330;
      v504 = [NSNumber numberWithFloat:v503];
      [v4 setObject:v504 forKeyedSubscript:@"DarkBiasValue-37"];

      LODWORD(v505) = 1050589266;
      v506 = [NSNumber numberWithFloat:v505];
      [v4 setObject:v506 forKeyedSubscript:@"DarkMatrixValue-37"];

      LODWORD(v507) = 0.5;
      v508 = [NSNumber numberWithFloat:v507];
      [v4 setObject:v508 forKeyedSubscript:@"LightBiasValue-37"];

      LODWORD(v509) = 1066695393;
      v510 = [NSNumber numberWithFloat:v509];
      [v4 setObject:v510 forKeyedSubscript:@"LightMatrixValue-37"];

      LODWORD(v511) = 1057803469;
      v512 = [NSNumber numberWithFloat:v511];
      [v4 setObject:v512 forKeyedSubscript:@"DarkBiasValue-38"];

      LODWORD(v513) = 1060320051;
      v514 = [NSNumber numberWithFloat:v513];
      [v4 setObject:v514 forKeyedSubscript:@"DarkMatrixValue-38"];

      LODWORD(v515) = 0.5;
      v516 = [NSNumber numberWithFloat:v515];
      [v4 setObject:v516 forKeyedSubscript:@"LightBiasValue-38"];

      LODWORD(v517) = 1066695393;
      v518 = [NSNumber numberWithFloat:v517];
      [v4 setObject:v518 forKeyedSubscript:@"LightMatrixValue-38"];

      LODWORD(v519) = 1051931443;
      v520 = [NSNumber numberWithFloat:v519];
      [v4 setObject:v520 forKeyedSubscript:@"DarkBiasValue-39"];

      LODWORD(v521) = 1065772646;
      v522 = [NSNumber numberWithFloat:v521];
      [v4 setObject:v522 forKeyedSubscript:@"DarkMatrixValue-39"];

      LODWORD(v523) = 0.5;
      v524 = [NSNumber numberWithFloat:v523];
      [v4 setObject:v524 forKeyedSubscript:@"LightBiasValue-39"];

      LODWORD(v525) = 1066695393;
      v526 = [NSNumber numberWithFloat:v525];
      [v4 setObject:v526 forKeyedSubscript:@"LightMatrixValue-39"];

      LODWORD(v527) = 1057635697;
      v528 = [NSNumber numberWithFloat:v527];
      [v4 setObject:v528 forKeyedSubscript:@"DarkBiasValue-40"];

      LODWORD(v529) = 1058474557;
      v530 = [NSNumber numberWithFloat:v529];
      [v4 setObject:v530 forKeyedSubscript:@"DarkMatrixValue-40"];

      LODWORD(v531) = 0.5;
      v532 = [NSNumber numberWithFloat:v531];
      [v4 setObject:v532 forKeyedSubscript:@"LightBiasValue-40"];

      LODWORD(v533) = 1066695393;
      v534 = [NSNumber numberWithFloat:v533];
      [v4 setObject:v534 forKeyedSubscript:@"LightMatrixValue-40"];

      LODWORD(v535) = 1053944709;
      v536 = [NSNumber numberWithFloat:v535];
      [v4 setObject:v536 forKeyedSubscript:@"DarkBiasValue-41"];

      LODWORD(v537) = 1062836634;
      v538 = [NSNumber numberWithFloat:v537];
      [v4 setObject:v538 forKeyedSubscript:@"DarkMatrixValue-41"];

      LODWORD(v539) = 0.5;
      v540 = [NSNumber numberWithFloat:v539];
      [v4 setObject:v540 forKeyedSubscript:@"LightBiasValue-41"];

      LODWORD(v541) = 1066695393;
      v542 = [NSNumber numberWithFloat:v541];
      [v4 setObject:v542 forKeyedSubscript:@"LightMatrixValue-41"];

      LODWORD(v543) = 1052938076;
      v544 = [NSNumber numberWithFloat:v543];
      [v4 setObject:v544 forKeyedSubscript:@"DarkBiasValue-66"];

      LODWORD(v545) = 1059145646;
      v546 = [NSNumber numberWithFloat:v545];
      [v4 setObject:v546 forKeyedSubscript:@"DarkMatrixValue-66"];

      LODWORD(v547) = 0.5;
      v548 = [NSNumber numberWithFloat:v547];
      [v4 setObject:v548 forKeyedSubscript:@"LightBiasValue-66"];

      LODWORD(v549) = 1066695393;
      v550 = [NSNumber numberWithFloat:v549];
      [v4 setObject:v550 forKeyedSubscript:@"LightMatrixValue-66"];

      LODWORD(v551) = 1051595899;
      v552 = [NSNumber numberWithFloat:v551];
      [v4 setObject:v552 forKeyedSubscript:@"DarkBiasValue-67"];

      LODWORD(v553) = 1065520988;
      v554 = [NSNumber numberWithFloat:v553];
      [v4 setObject:v554 forKeyedSubscript:@"DarkMatrixValue-67"];

      LODWORD(v555) = 0.5;
      v556 = [NSNumber numberWithFloat:v555];
      [v4 setObject:v556 forKeyedSubscript:@"LightBiasValue-67"];

      LODWORD(v557) = 1066695393;
      v156 = [NSNumber numberWithFloat:v557];
      v157 = @"LightMatrixValue-67";
      break;
    case 0x200Au:
      goto LABEL_31;
    case 0x200Bu:
      v558 = [NSNumber numberWithInt:86];
      [v4 setObject:v558 forKeyedSubscript:@"BudHeight"];

      v559 = [NSNumber numberWithInt:6];
      [v4 setObject:v559 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v560 = [NSNumber numberWithInt:17];
      [v4 setObject:v560 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v561 = [NSNumber numberWithInt:70];
      [v4 setObject:v561 forKeyedSubscript:@"CaseHeight"];

      v562 = [NSNumber numberWithInt:33];
      [v4 setObject:v562 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v563 = [NSNumber numberWithInt:22];
      [v4 setObject:v563 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v564) = 0.5;
      v565 = [NSNumber numberWithFloat:v564];
      [v4 setObject:v565 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v566) = 1063675494;
      v567 = [NSNumber numberWithFloat:v566];
      [v4 setObject:v567 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v568) = 1057300152;
      v569 = [NSNumber numberWithFloat:v568];
      [v4 setObject:v569 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v570) = 1066695393;
      v571 = [NSNumber numberWithFloat:v570];
      [v4 setObject:v571 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v572) = 0.5;
      v573 = [NSNumber numberWithFloat:v572];
      [v4 setObject:v573 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v574) = 1061997773;
      v575 = [NSNumber numberWithFloat:v574];
      [v4 setObject:v575 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v576) = 1057803469;
      v577 = [NSNumber numberWithFloat:v576];
      [v4 setObject:v577 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v578) = 1066695393;
      v579 = [NSNumber numberWithFloat:v578];
      [v4 setObject:v579 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v580) = 0.5;
      v581 = [NSNumber numberWithFloat:v580];
      [v4 setObject:v581 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v582) = 1064514355;
      v583 = [NSNumber numberWithFloat:v582];
      [v4 setObject:v583 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v584) = 0.5;
      v585 = [NSNumber numberWithFloat:v584];
      [v4 setObject:v585 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v586) = 1066695393;
      v587 = [NSNumber numberWithFloat:v586];
      [v4 setObject:v587 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v588) = 0.5;
      v589 = [NSNumber numberWithFloat:v588];
      [v4 setObject:v589 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v590) = 1063675494;
      v591 = [NSNumber numberWithFloat:v590];
      [v4 setObject:v591 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v592) = 1058642330;
      v593 = [NSNumber numberWithFloat:v592];
      [v4 setObject:v593 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v594) = 1066695393;
      v595 = [NSNumber numberWithFloat:v594];
      [v4 setObject:v595 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v596) = 0.5;
      v597 = [NSNumber numberWithFloat:v596];
      [v4 setObject:v597 forKeyedSubscript:@"DarkBiasValue-5"];

      LODWORD(v598) = 1064514355;
      v599 = [NSNumber numberWithFloat:v598];
      [v4 setObject:v599 forKeyedSubscript:@"DarkMatrixValue-5"];

      LODWORD(v600) = 1058306785;
      v601 = [NSNumber numberWithFloat:v600];
      [v4 setObject:v601 forKeyedSubscript:@"LightBiasValue-5"];

      LODWORD(v602) = 1066695393;
      v603 = [NSNumber numberWithFloat:v602];
      [v4 setObject:v603 forKeyedSubscript:@"LightMatrixValue-5"];

      LODWORD(v604) = 0.5;
      v605 = [NSNumber numberWithFloat:v604];
      [v4 setObject:v605 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v606) = 1064514355;
      v607 = [NSNumber numberWithFloat:v606];
      [v4 setObject:v607 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v608) = 1057803469;
      v609 = [NSNumber numberWithFloat:v608];
      [v4 setObject:v609 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v610) = 1066695393;
      v611 = [NSNumber numberWithFloat:v610];
      [v4 setObject:v611 forKeyedSubscript:@"LightMatrixValue-6"];

      LODWORD(v612) = 0.5;
      v613 = [NSNumber numberWithFloat:v612];
      [v4 setObject:v613 forKeyedSubscript:@"DarkBiasValue-11"];

      LODWORD(v614) = 1063675494;
      v615 = [NSNumber numberWithFloat:v614];
      [v4 setObject:v615 forKeyedSubscript:@"DarkMatrixValue-11"];

      LODWORD(v616) = 1058642330;
      v617 = [NSNumber numberWithFloat:v616];
      [v4 setObject:v617 forKeyedSubscript:@"LightBiasValue-11"];

      LODWORD(v618) = 1066695393;
      v619 = [NSNumber numberWithFloat:v618];
      [v4 setObject:v619 forKeyedSubscript:@"LightMatrixValue-11"];

      LODWORD(v620) = 0.5;
      v621 = [NSNumber numberWithFloat:v620];
      [v4 setObject:v621 forKeyedSubscript:@"DarkBiasValue-13"];

      LODWORD(v622) = 1064514355;
      v623 = [NSNumber numberWithFloat:v622];
      [v4 setObject:v623 forKeyedSubscript:@"DarkMatrixValue-13"];

      LODWORD(v624) = 0.5;
      v625 = [NSNumber numberWithFloat:v624];
      [v4 setObject:v625 forKeyedSubscript:@"LightBiasValue-13"];

      LODWORD(v626) = 1066695393;
      v156 = [NSNumber numberWithFloat:v626];
      v157 = @"LightMatrixValue-13";
      break;
    case 0x200Cu:
      v627 = [NSNumber numberWithInt:108];
      [v4 setObject:v627 forKeyedSubscript:@"BudHeight"];

      LODWORD(v628) = 1058810102;
      v629 = [NSNumber numberWithFloat:v628];
      [v4 setObject:v629 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v630) = 1053273620;
      v631 = [NSNumber numberWithFloat:v630];
      [v4 setObject:v631 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v632) = 0.5;
      v633 = [NSNumber numberWithFloat:v632];
      [v4 setObject:v633 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v634) = 1066695393;
      v635 = [NSNumber numberWithFloat:v634];
      [v4 setObject:v635 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v636) = 1056293519;
      v637 = [NSNumber numberWithFloat:v636];
      [v4 setObject:v637 forKeyedSubscript:@"DarkBiasValue-60"];

      LODWORD(v638) = 1063172178;
      v639 = [NSNumber numberWithFloat:v638];
      [v4 setObject:v639 forKeyedSubscript:@"DarkMatrixValue-60"];

      LODWORD(v640) = 0.5;
      v641 = [NSNumber numberWithFloat:v640];
      [v4 setObject:v641 forKeyedSubscript:@"LightBiasValue-60"];

      LODWORD(v642) = 1066695393;
      v643 = [NSNumber numberWithFloat:v642];
      [v4 setObject:v643 forKeyedSubscript:@"LightMatrixValue-60"];

      LODWORD(v644) = 1053609165;
      v645 = [NSNumber numberWithFloat:v644];
      [v4 setObject:v645 forKeyedSubscript:@"DarkBiasValue-69"];

      LODWORD(v646) = 1063507722;
      v647 = [NSNumber numberWithFloat:v646];
      [v4 setObject:v647 forKeyedSubscript:@"DarkMatrixValue-69"];

      LODWORD(v648) = 0.5;
      v649 = [NSNumber numberWithFloat:v648];
      [v4 setObject:v649 forKeyedSubscript:@"LightBiasValue-69"];

      LODWORD(v650) = 1066695393;
      v651 = [NSNumber numberWithFloat:v650];
      [v4 setObject:v651 forKeyedSubscript:@"LightMatrixValue-69"];

      LODWORD(v652) = 1053609165;
      v653 = [NSNumber numberWithFloat:v652];
      [v4 setObject:v653 forKeyedSubscript:@"DarkBiasValue-70"];

      LODWORD(v654) = 1063172178;
      v655 = [NSNumber numberWithFloat:v654];
      [v4 setObject:v655 forKeyedSubscript:@"DarkMatrixValue-70"];

      LODWORD(v656) = 0.5;
      v657 = [NSNumber numberWithFloat:v656];
      [v4 setObject:v657 forKeyedSubscript:@"LightBiasValue-70"];

      LODWORD(v658) = 1066695393;
      v659 = [NSNumber numberWithFloat:v658];
      [v4 setObject:v659 forKeyedSubscript:@"LightMatrixValue-70"];

      LODWORD(v660) = 1058139013;
      v661 = [NSNumber numberWithFloat:v660];
      [v4 setObject:v661 forKeyedSubscript:@"DarkBiasValue-71"];

      LODWORD(v662) = 1056125747;
      v663 = [NSNumber numberWithFloat:v662];
      [v4 setObject:v663 forKeyedSubscript:@"DarkMatrixValue-71"];

      LODWORD(v664) = 0.5;
      v665 = [NSNumber numberWithFloat:v664];
      [v4 setObject:v665 forKeyedSubscript:@"LightBiasValue-71"];

      LODWORD(v666) = 1066695393;
      v667 = [NSNumber numberWithFloat:v666];
      [v4 setObject:v667 forKeyedSubscript:@"LightMatrixValue-71"];

      LODWORD(v668) = 1054615798;
      v669 = [NSNumber numberWithFloat:v668];
      [v4 setObject:v669 forKeyedSubscript:@"DarkBiasValue-72"];

      LODWORD(v670) = 1061830001;
      v671 = [NSNumber numberWithFloat:v670];
      [v4 setObject:v671 forKeyedSubscript:@"DarkMatrixValue-72"];

      LODWORD(v672) = 0.5;
      v673 = [NSNumber numberWithFloat:v672];
      [v4 setObject:v673 forKeyedSubscript:@"LightBiasValue-72"];

      LODWORD(v674) = 1066695393;
      v156 = [NSNumber numberWithFloat:v674];
      v157 = @"LightMatrixValue-72";
      break;
    case 0x200Du:
      v675 = [NSNumber numberWithInt:108];
      [v4 setObject:v675 forKeyedSubscript:@"BudHeight"];

      LODWORD(v676) = 1050421494;
      v677 = [NSNumber numberWithFloat:v676];
      [v4 setObject:v677 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v678) = 1066192077;
      v679 = [NSNumber numberWithFloat:v678];
      [v4 setObject:v679 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v680) = 0.5;
      v681 = [NSNumber numberWithFloat:v680];
      [v4 setObject:v681 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v682) = 1066695393;
      v683 = [NSNumber numberWithFloat:v682];
      [v4 setObject:v683 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v684) = 0.375;
      v685 = [NSNumber numberWithFloat:v684];
      [v4 setObject:v685 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v686) = 1058810102;
      v687 = [NSNumber numberWithFloat:v686];
      [v4 setObject:v687 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v688) = 0.5;
      v689 = [NSNumber numberWithFloat:v688];
      [v4 setObject:v689 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v690) = 1066695393;
      v691 = [NSNumber numberWithFloat:v690];
      [v4 setObject:v691 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v692) = 1055286886;
      v693 = [NSNumber numberWithFloat:v692];
      [v4 setObject:v693 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v694) = 1060320051;
      v695 = [NSNumber numberWithFloat:v694];
      [v4 setObject:v695 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v696) = 0.5;
      v697 = [NSNumber numberWithFloat:v696];
      [v4 setObject:v697 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v698) = 1066695393;
      v156 = [NSNumber numberWithFloat:v698];
      v157 = @"LightMatrixValue-2";
      break;
    case 0x200Eu:
      v699 = [NSNumber numberWithInt:64];
      [v4 setObject:v699 forKeyedSubscript:@"BudHeight"];

      v700 = [NSNumber numberWithInt:6];
      [v4 setObject:v700 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v701 = [NSNumber numberWithInt:27];
      [v4 setObject:v701 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v702 = [NSNumber numberWithInt:92];
      [v4 setObject:v702 forKeyedSubscript:@"CaseHeight"];

      v703 = [NSNumber numberWithInt:59];
      [v4 setObject:v703 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v704 = [NSNumber numberWithInt:38];
      [v4 setObject:v704 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v705) = 1053609165;
      v706 = [NSNumber numberWithFloat:v705];
      [v4 setObject:v706 forKeyedSubscript:@"DarkBiasValue"];

      float v34 = NSNumber;
      LODWORD(v35) = 1065772646;
      goto LABEL_15;
    case 0x2010u:
      v708 = [NSNumber numberWithInt:108];
      [v4 setObject:v708 forKeyedSubscript:@"BudHeight"];

      LODWORD(v709) = 0.5;
      v710 = [NSNumber numberWithFloat:v709];
      [v4 setObject:v710 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v711) = 1063675494;
      v712 = [NSNumber numberWithFloat:v711];
      [v4 setObject:v712 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v713) = 1057803469;
      v714 = [NSNumber numberWithFloat:v713];
      [v4 setObject:v714 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v715) = 1068792545;
      v716 = [NSNumber numberWithFloat:v715];
      [v4 setObject:v716 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v717) = 1055622431;
      v718 = [NSNumber numberWithFloat:v717];
      [v4 setObject:v718 forKeyedSubscript:@"DarkBiasValue-77"];

      LODWORD(v719) = 1064849900;
      v720 = [NSNumber numberWithFloat:v719];
      [v4 setObject:v720 forKeyedSubscript:@"DarkMatrixValue-77"];

      LODWORD(v721) = 0.5;
      v722 = [NSNumber numberWithFloat:v721];
      [v4 setObject:v722 forKeyedSubscript:@"LightBiasValue-77"];

      LODWORD(v723) = 1.0;
      v724 = [NSNumber numberWithFloat:v723];
      [v4 setObject:v724 forKeyedSubscript:@"LightMatrixValue-77"];

      LODWORD(v725) = 1054280253;
      v726 = [NSNumber numberWithFloat:v725];
      [v4 setObject:v726 forKeyedSubscript:@"DarkBiasValue-78"];

      LODWORD(v727) = 1064849900;
      v728 = [NSNumber numberWithFloat:v727];
      [v4 setObject:v728 forKeyedSubscript:@"DarkMatrixValue-78"];

      LODWORD(v729) = 0.5;
      v730 = [NSNumber numberWithFloat:v729];
      [v4 setObject:v730 forKeyedSubscript:@"LightBiasValue-78"];

      LODWORD(v731) = 1.0;
      v732 = [NSNumber numberWithFloat:v731];
      [v4 setObject:v732 forKeyedSubscript:@"LightMatrixValue-78"];

      LODWORD(v733) = 1053609165;
      v734 = [NSNumber numberWithFloat:v733];
      [v4 setObject:v734 forKeyedSubscript:@"DarkBiasValue-79"];

      LODWORD(v735) = 1065017672;
      v736 = [NSNumber numberWithFloat:v735];
      [v4 setObject:v736 forKeyedSubscript:@"DarkMatrixValue-79"];

      LODWORD(v737) = 0.5;
      v738 = [NSNumber numberWithFloat:v737];
      [v4 setObject:v738 forKeyedSubscript:@"LightBiasValue-79"];

      LODWORD(v739) = 1.0;
      v156 = [NSNumber numberWithFloat:v739];
      v157 = @"LightMatrixValue-79";
      break;
    case 0x2011u:
      v740 = [NSNumber numberWithInt:31];
      [v4 setObject:v740 forKeyedSubscript:@"BudHeight"];

      v741 = [NSNumber numberWithInt:6];
      [v4 setObject:v741 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v742 = [NSNumber numberWithInt:25];
      [v4 setObject:v742 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v743 = [NSNumber numberWithInt:100];
      [v4 setObject:v743 forKeyedSubscript:@"CaseHeight"];

      v744 = [NSNumber numberWithInt:49];
      [v4 setObject:v744 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v745 = [NSNumber numberWithInt:30];
      [v4 setObject:v745 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v746) = 1052938076;
      v747 = [NSNumber numberWithFloat:v746];
      [v4 setObject:v747 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v748) = 1065017672;
      v749 = [NSNumber numberWithFloat:v748];
      [v4 setObject:v749 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v750) = 0.5;
      v751 = [NSNumber numberWithFloat:v750];
      [v4 setObject:v751 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v752) = 1.0;
      v753 = [NSNumber numberWithFloat:v752];
      [v4 setObject:v753 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v754) = 1056293519;
      v755 = [NSNumber numberWithFloat:v754];
      [v4 setObject:v755 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v756) = 1064849900;
      v757 = [NSNumber numberWithFloat:v756];
      [v4 setObject:v757 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v758) = 1057300152;
      v759 = [NSNumber numberWithFloat:v758];
      [v4 setObject:v759 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v760) = 1066527621;
      v761 = [NSNumber numberWithFloat:v760];
      [v4 setObject:v761 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v762) = 1055622431;
      v763 = [NSNumber numberWithFloat:v762];
      [v4 setObject:v763 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v764) = 1064682127;
      v765 = [NSNumber numberWithFloat:v764];
      [v4 setObject:v765 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v766) = 0.5;
      v767 = [NSNumber numberWithFloat:v766];
      [v4 setObject:v767 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v768) = 1.0;
      v769 = [NSNumber numberWithFloat:v768];
      [v4 setObject:v769 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v770) = 1055622431;
      v771 = [NSNumber numberWithFloat:v770];
      [v4 setObject:v771 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v772) = 1064514355;
      v773 = [NSNumber numberWithFloat:v772];
      [v4 setObject:v773 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v774) = 0.5;
      v775 = [NSNumber numberWithFloat:v774];
      [v4 setObject:v775 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v776) = 1.0;
      v777 = [NSNumber numberWithFloat:v776];
      [v4 setObject:v777 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v778) = 1055957975;
      v779 = [NSNumber numberWithFloat:v778];
      [v4 setObject:v779 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v780) = 1065017672;
      v781 = [NSNumber numberWithFloat:v780];
      [v4 setObject:v781 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v782) = 0.5;
      v783 = [NSNumber numberWithFloat:v782];
      [v4 setObject:v783 forKeyedSubscript:@"LightBiasValue-4"];

      LODWORD(v784) = 1.0;
      v785 = [NSNumber numberWithFloat:v784];
      [v4 setObject:v785 forKeyedSubscript:@"LightMatrixValue-4"];

      LODWORD(v786) = 1055622431;
      v787 = [NSNumber numberWithFloat:v786];
      [v4 setObject:v787 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v788) = 1064346583;
      v789 = [NSNumber numberWithFloat:v788];
      [v4 setObject:v789 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v790) = 0.5;
      v791 = [NSNumber numberWithFloat:v790];
      [v4 setObject:v791 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v792) = 1.0;
      v156 = [NSNumber numberWithFloat:v792];
      v157 = @"LightMatrixValue-6";
      break;
    case 0x2012u:
      v793 = [NSNumber numberWithInt:51];
      [v4 setObject:v793 forKeyedSubscript:@"BudHeight"];

      v794 = [NSNumber numberWithInt:6];
      [v4 setObject:v794 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v795 = [NSNumber numberWithInt:28];
      [v4 setObject:v795 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v796 = [NSNumber numberWithInt:52];
      [v4 setObject:v796 forKeyedSubscript:@"CaseHeight"];

      v797 = [NSNumber numberWithInt:50];
      [v4 setObject:v797 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v798 = [NSNumber numberWithInt:28];
      [v4 setObject:v798 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v799) = 1056293519;
      v800 = [NSNumber numberWithFloat:v799];
      [v4 setObject:v800 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v801) = 1064514355;
      v802 = [NSNumber numberWithFloat:v801];
      [v4 setObject:v802 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v803) = 0.5;
      v804 = [NSNumber numberWithFloat:v803];
      [v4 setObject:v804 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v805) = 1065604874;
      v806 = [NSNumber numberWithFloat:v805];
      [v4 setObject:v806 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v807) = 0.5;
      v808 = [NSNumber numberWithFloat:v807];
      [v4 setObject:v808 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v809) = 0.75;
      v810 = [NSNumber numberWithFloat:v809];
      [v4 setObject:v810 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v811) = 0.5;
      v812 = [NSNumber numberWithFloat:v811];
      [v4 setObject:v812 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v813) = 1.0;
      v814 = [NSNumber numberWithFloat:v813];
      [v4 setObject:v814 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v815) = 1056293519;
      v816 = [NSNumber numberWithFloat:v815];
      [v4 setObject:v816 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v817) = 1064178811;
      v818 = [NSNumber numberWithFloat:v817];
      [v4 setObject:v818 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v819) = 0.5;
      v820 = [NSNumber numberWithFloat:v819];
      [v4 setObject:v820 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v821) = 1.0;
      v822 = [NSNumber numberWithFloat:v821];
      [v4 setObject:v822 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v823) = 1056293519;
      v824 = [NSNumber numberWithFloat:v823];
      [v4 setObject:v824 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v825) = 1063507722;
      v826 = [NSNumber numberWithFloat:v825];
      [v4 setObject:v826 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v827) = 0.5;
      v828 = [NSNumber numberWithFloat:v827];
      [v4 setObject:v828 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v829) = 1.0;
      v830 = [NSNumber numberWithFloat:v829];
      [v4 setObject:v830 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v831) = 1056293519;
      v832 = [NSNumber numberWithFloat:v831];
      [v4 setObject:v832 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v833) = 1064178811;
      v834 = [NSNumber numberWithFloat:v833];
      [v4 setObject:v834 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v835) = 0.5;
      v836 = [NSNumber numberWithFloat:v835];
      [v4 setObject:v836 forKeyedSubscript:@"LightBiasValue-4"];

      LODWORD(v837) = 1.0;
      v838 = [NSNumber numberWithFloat:v837];
      [v4 setObject:v838 forKeyedSubscript:@"LightMatrixValue-4"];

      LODWORD(v839) = 1056629064;
      v840 = [NSNumber numberWithFloat:v839];
      [v4 setObject:v840 forKeyedSubscript:@"DarkBiasValue-5"];

      LODWORD(v841) = 1064514355;
      v842 = [NSNumber numberWithFloat:v841];
      [v4 setObject:v842 forKeyedSubscript:@"DarkMatrixValue-5"];

      LODWORD(v843) = 0.5;
      v844 = [NSNumber numberWithFloat:v843];
      [v4 setObject:v844 forKeyedSubscript:@"LightBiasValue-5"];

      LODWORD(v845) = 1.0;
      v846 = [NSNumber numberWithFloat:v845];
      [v4 setObject:v846 forKeyedSubscript:@"LightMatrixValue-5"];

      LODWORD(v847) = 1055286886;
      v848 = [NSNumber numberWithFloat:v847];
      [v4 setObject:v848 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v849) = 1063507722;
      v850 = [NSNumber numberWithFloat:v849];
      [v4 setObject:v850 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v851) = 0.5;
      v852 = [NSNumber numberWithFloat:v851];
      [v4 setObject:v852 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v853) = 1.0;
      v854 = [NSNumber numberWithFloat:v853];
      [v4 setObject:v854 forKeyedSubscript:@"LightMatrixValue-6"];

      LODWORD(v855) = 1054951342;
      v856 = [NSNumber numberWithFloat:v855];
      [v4 setObject:v856 forKeyedSubscript:@"DarkBiasValue-7"];

      LODWORD(v857) = 1062501089;
      v858 = [NSNumber numberWithFloat:v857];
      [v4 setObject:v858 forKeyedSubscript:@"DarkMatrixValue-7"];

      LODWORD(v859) = 0.5;
      v860 = [NSNumber numberWithFloat:v859];
      [v4 setObject:v860 forKeyedSubscript:@"LightBiasValue-7"];

      LODWORD(v861) = 1.0;
      v862 = [NSNumber numberWithFloat:v861];
      [v4 setObject:v862 forKeyedSubscript:@"LightMatrixValue-7"];

      LODWORD(v863) = 1056293519;
      v864 = [NSNumber numberWithFloat:v863];
      [v4 setObject:v864 forKeyedSubscript:@"DarkBiasValue-8"];

      LODWORD(v865) = 1063507722;
      v866 = [NSNumber numberWithFloat:v865];
      [v4 setObject:v866 forKeyedSubscript:@"DarkMatrixValue-8"];

      LODWORD(v867) = 0.5;
      v868 = [NSNumber numberWithFloat:v867];
      [v4 setObject:v868 forKeyedSubscript:@"LightBiasValue-8"];

      LODWORD(v869) = 1.0;
      v870 = [NSNumber numberWithFloat:v869];
      [v4 setObject:v870 forKeyedSubscript:@"LightMatrixValue-8"];

      LODWORD(v871) = 1055286886;
      v872 = [NSNumber numberWithFloat:v871];
      [v4 setObject:v872 forKeyedSubscript:@"DarkBiasValue-9"];

      LODWORD(v873) = 1060655596;
      v874 = [NSNumber numberWithFloat:v873];
      [v4 setObject:v874 forKeyedSubscript:@"DarkMatrixValue-9"];

      LODWORD(v875) = 0.5;
      v876 = [NSNumber numberWithFloat:v875];
      [v4 setObject:v876 forKeyedSubscript:@"LightBiasValue-9"];

      v877 = NSNumber;
      LODWORD(v878) = 1.0;
      goto LABEL_26;
    case 0x2013u:
      v879 = [NSNumber numberWithInt:62];
      [v4 setObject:v879 forKeyedSubscript:@"BudHeight"];

      v880 = [NSNumber numberWithInt:6];
      [v4 setObject:v880 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v881 = [NSNumber numberWithInt:34];
      [v4 setObject:v881 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v882 = [NSNumber numberWithInt:94];
      [v4 setObject:v882 forKeyedSubscript:@"CaseHeight"];

      v883 = [NSNumber numberWithInt:74];
      [v4 setObject:v883 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v884 = [NSNumber numberWithInt:46];
      [v4 setObject:v884 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v885) = 1053776937;
      v886 = [NSNumber numberWithFloat:v885];
      [v4 setObject:v886 forKeyedSubscript:@"DarkBiasValue"];

      LODWORD(v887) = 1066359849;
      v888 = [NSNumber numberWithFloat:v887];
      [v4 setObject:v888 forKeyedSubscript:@"DarkMatrixValue"];

      uint64_t v24 = NSNumber;
      LODWORD(v25) = 1058139013;
      goto LABEL_20;
    case 0x2014u:
    case 0x2024u:
      float v26 = [NSNumber numberWithInt:64];
      [v4 setObject:v26 forKeyedSubscript:@"BudHeight"];

      v27 = [NSNumber numberWithInt:6];
      [v4 setObject:v27 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      float v28 = [NSNumber numberWithInt:27];
      [v4 setObject:v28 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      uint64_t v29 = [NSNumber numberWithInt:102];
      [v4 setObject:v29 forKeyedSubscript:@"CaseHeight"];

      uint64_t v30 = [NSNumber numberWithInt:59];
      [v4 setObject:v30 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      CGSize v31 = [NSNumber numberWithInt:38];
      [v4 setObject:v31 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v32) = 1053273620;
      v33 = [NSNumber numberWithFloat:v32];
      [v4 setObject:v33 forKeyedSubscript:@"DarkBiasValue"];

      float v34 = NSNumber;
      LODWORD(v35) = 1066443735;
LABEL_15:
      v707 = [v34 numberWithFloat:v35];
      [v4 setObject:v707 forKeyedSubscript:@"DarkMatrixValue"];

      uint64_t v24 = NSNumber;
      LODWORD(v25) = 1057803469;
      goto LABEL_20;
    case 0x2016u:
      v892 = [NSNumber numberWithInt:31];
      [v4 setObject:v892 forKeyedSubscript:@"BudHeight"];

      v893 = [NSNumber numberWithInt:6];
      [v4 setObject:v893 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v894 = [NSNumber numberWithInt:25];
      [v4 setObject:v894 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v895 = [NSNumber numberWithInt:100];
      [v4 setObject:v895 forKeyedSubscript:@"CaseHeight"];

      v896 = [NSNumber numberWithInt:49];
      [v4 setObject:v896 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v897 = [NSNumber numberWithInt:30];
      [v4 setObject:v897 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v898) = 1056293519;
      v899 = [NSNumber numberWithFloat:v898];
      [v4 setObject:v899 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v900) = 1064849900;
      v901 = [NSNumber numberWithFloat:v900];
      [v4 setObject:v901 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v902) = 1057300152;
      v903 = [NSNumber numberWithFloat:v902];
      [v4 setObject:v903 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v904) = 1066527621;
      v905 = [NSNumber numberWithFloat:v904];
      [v4 setObject:v905 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v906) = 1054615798;
      v907 = [NSNumber numberWithFloat:v906];
      [v4 setObject:v907 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v908) = 1064849900;
      v909 = [NSNumber numberWithFloat:v908];
      [v4 setObject:v909 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v910) = 0.5;
      v911 = [NSNumber numberWithFloat:v910];
      [v4 setObject:v911 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v912) = 1.0;
      v913 = [NSNumber numberWithFloat:v912];
      [v4 setObject:v913 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v914) = 1055957975;
      v915 = [NSNumber numberWithFloat:v914];
      [v4 setObject:v915 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v916) = 1063843267;
      v917 = [NSNumber numberWithFloat:v916];
      [v4 setObject:v917 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v918) = 1056360628;
      v919 = [NSNumber numberWithFloat:v918];
      [v4 setObject:v919 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v920) = 1064766013;
      v921 = [NSNumber numberWithFloat:v920];
      [v4 setObject:v921 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v922) = 1053609165;
      v923 = [NSNumber numberWithFloat:v922];
      [v4 setObject:v923 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v924) = 1064346583;
      v925 = [NSNumber numberWithFloat:v924];
      [v4 setObject:v925 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v926) = 0.5;
      v927 = [NSNumber numberWithFloat:v926];
      [v4 setObject:v927 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v928) = 1.0;
      v929 = [NSNumber numberWithFloat:v928];
      [v4 setObject:v929 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v930) = 1054615798;
      v931 = [NSNumber numberWithFloat:v930];
      [v4 setObject:v931 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v932) = 1064514355;
      v933 = [NSNumber numberWithFloat:v932];
      [v4 setObject:v933 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v934) = 0.5;
      v935 = [NSNumber numberWithFloat:v934];
      [v4 setObject:v935 forKeyedSubscript:@"LightBiasValue-4"];

      v936 = NSNumber;
      LODWORD(v937) = 1.0;
      goto LABEL_29;
    case 0x2017u:
      v938 = [NSNumber numberWithInt:108];
      [v4 setObject:v938 forKeyedSubscript:@"BudHeight"];

      LODWORD(v939) = 1056159302;
      v940 = [NSNumber numberWithFloat:v939];
      [v4 setObject:v940 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v941) = 1065269330;
      v942 = [NSNumber numberWithFloat:v941];
      [v4 setObject:v942 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v943) = 0.5;
      v944 = [NSNumber numberWithFloat:v943];
      [v4 setObject:v944 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v945) = 1.0;
      v946 = [NSNumber numberWithFloat:v945];
      [v4 setObject:v946 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v947) = 1056226410;
      v948 = [NSNumber numberWithFloat:v947];
      [v4 setObject:v948 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v949) = 1064262697;
      v950 = [NSNumber numberWithFloat:v949];
      [v4 setObject:v950 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v951) = 0.5;
      v952 = [NSNumber numberWithFloat:v951];
      [v4 setObject:v952 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v953) = 1.0;
      v954 = [NSNumber numberWithFloat:v953];
      [v4 setObject:v954 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v955) = 1056629064;
      v956 = [NSNumber numberWithFloat:v955];
      [v4 setObject:v956 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v957) = 1065017672;
      v958 = [NSNumber numberWithFloat:v957];
      [v4 setObject:v958 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v959) = 0.5;
      v960 = [NSNumber numberWithFloat:v959];
      [v4 setObject:v960 forKeyedSubscript:@"LightBiasValue-4"];

      LODWORD(v961) = 1065604874;
      v962 = [NSNumber numberWithFloat:v961];
      [v4 setObject:v962 forKeyedSubscript:@"LightMatrixValue-4"];

      LODWORD(v963) = 1057300152;
      v964 = [NSNumber numberWithFloat:v963];
      [v4 setObject:v964 forKeyedSubscript:@"DarkBiasValue-5"];

      LODWORD(v965) = 1063675494;
      v966 = [NSNumber numberWithFloat:v965];
      [v4 setObject:v966 forKeyedSubscript:@"DarkMatrixValue-5"];

      LODWORD(v967) = 1057803469;
      v968 = [NSNumber numberWithFloat:v967];
      [v4 setObject:v968 forKeyedSubscript:@"LightBiasValue-5"];

      LODWORD(v969) = 1065017672;
      v970 = [NSNumber numberWithFloat:v969];
      [v4 setObject:v970 forKeyedSubscript:@"LightMatrixValue-5"];

      LODWORD(v971) = 0.5;
      v972 = [NSNumber numberWithFloat:v971];
      [v4 setObject:v972 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v973) = 1.0;
      v974 = [NSNumber numberWithFloat:v973];
      [v4 setObject:v974 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v975) = 1057132380;
      v976 = [NSNumber numberWithFloat:v975];
      [v4 setObject:v976 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v977) = 1065772646;
      v978 = [NSNumber numberWithFloat:v977];
      [v4 setObject:v978 forKeyedSubscript:@"LightMatrixValue-6"];

      LODWORD(v979) = 1056360628;
      v980 = [NSNumber numberWithFloat:v979];
      [v4 setObject:v980 forKeyedSubscript:@"DarkBiasValue-7"];

      LODWORD(v981) = 1065772646;
      v982 = [NSNumber numberWithFloat:v981];
      [v4 setObject:v982 forKeyedSubscript:@"DarkMatrixValue-7"];

      LODWORD(v983) = 0.5;
      v984 = [NSNumber numberWithFloat:v983];
      [v4 setObject:v984 forKeyedSubscript:@"LightBiasValue-7"];

      LODWORD(v985) = 1.0;
      v986 = [NSNumber numberWithFloat:v985];
      [v4 setObject:v986 forKeyedSubscript:@"LightMatrixValue-7"];

      LODWORD(v987) = 1056427737;
      v988 = [NSNumber numberWithFloat:v987];
      [v4 setObject:v988 forKeyedSubscript:@"DarkBiasValue-9"];

      LODWORD(v989) = 1064849900;
      v990 = [NSNumber numberWithFloat:v989];
      [v4 setObject:v990 forKeyedSubscript:@"DarkMatrixValue-9"];

      LODWORD(v991) = 1057434370;
      v992 = [NSNumber numberWithFloat:v991];
      [v4 setObject:v992 forKeyedSubscript:@"LightBiasValue-9"];

      v877 = NSNumber;
      LODWORD(v878) = 1066317906;
LABEL_26:
      v156 = [v877 numberWithFloat:v878];
      v157 = @"LightMatrixValue-9";
      break;
    case 0x2019u:
    case 0x201Bu:
    case 0x201Eu:
    case 0x2020u:
      uint64_t v5 = [NSNumber numberWithInt:62];
      [v4 setObject:v5 forKeyedSubscript:@"BudHeight"];

      id v6 = [NSNumber numberWithInt:6];
      [v4 setObject:v6 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      uint64_t v7 = [NSNumber numberWithInt:34];
      [v4 setObject:v7 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      id v8 = [NSNumber numberWithInt:94];
      [v4 setObject:v8 forKeyedSubscript:@"CaseHeight"];

      id v9 = [NSNumber numberWithInt:74];
      [v4 setObject:v9 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      id v10 = [NSNumber numberWithInt:46];
      [v4 setObject:v10 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v11) = 1053609165;
      id v12 = [NSNumber numberWithFloat:v11];
      [v4 setObject:v12 forKeyedSubscript:@"DarkBiasValue"];

      id v13 = NSNumber;
      LODWORD(v14) = 1065940419;
LABEL_4:
      double v23 = [v13 numberWithFloat:v14];
      [v4 setObject:v23 forKeyedSubscript:@"DarkMatrixValue"];

      uint64_t v24 = NSNumber;
      LODWORD(v25) = 0.5;
LABEL_20:
      v889 = [v24 numberWithFloat:v25];
      [v4 setObject:v889 forKeyedSubscript:@"LightBiasValue"];

      LODWORD(v890) = 1066695393;
      v156 = [NSNumber numberWithFloat:v890];
      v157 = @"LightMatrixValue";
      break;
    case 0x201Au:
      v993 = [NSNumber numberWithInt:108];
      [v4 setObject:v993 forKeyedSubscript:@"BudHeight"];

      LODWORD(v994) = 0.5;
      v995 = [NSNumber numberWithFloat:v994];
      [v4 setObject:v995 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v996) = 1.0;
      v997 = [NSNumber numberWithFloat:v996];
      [v4 setObject:v997 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v998) = 1055957975;
      v999 = [NSNumber numberWithFloat:v998];
      [v4 setObject:v999 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v1000) = 1061997773;
      v1001 = [NSNumber numberWithFloat:v1000];
      [v4 setObject:v1001 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v1002) = 0.5;
      v1003 = [NSNumber numberWithFloat:v1002];
      [v4 setObject:v1003 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v1004) = 1.0;
      v1005 = [NSNumber numberWithFloat:v1004];
      [v4 setObject:v1005 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v1006) = 1055957975;
      v1007 = [NSNumber numberWithFloat:v1006];
      [v4 setObject:v1007 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v1008) = 1061997773;
      v1009 = [NSNumber numberWithFloat:v1008];
      [v4 setObject:v1009 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v1010) = 0.5;
      v1011 = [NSNumber numberWithFloat:v1010];
      [v4 setObject:v1011 forKeyedSubscript:@"LightBiasValue-4"];

      LODWORD(v1012) = 1.0;
      v1013 = [NSNumber numberWithFloat:v1012];
      [v4 setObject:v1013 forKeyedSubscript:@"LightMatrixValue-4"];

      LODWORD(v1014) = 1055957975;
      v1015 = [NSNumber numberWithFloat:v1014];
      [v4 setObject:v1015 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v1016) = 1062836634;
      v1017 = [NSNumber numberWithFloat:v1016];
      [v4 setObject:v1017 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v1018) = 0.5;
      v1019 = [NSNumber numberWithFloat:v1018];
      [v4 setObject:v1019 forKeyedSubscript:@"LightBiasValue-6"];

      LODWORD(v1020) = 1.0;
      v1021 = [NSNumber numberWithFloat:v1020];
      [v4 setObject:v1021 forKeyedSubscript:@"LightMatrixValue-6"];

      LODWORD(v1022) = 1055957975;
      v1023 = [NSNumber numberWithFloat:v1022];
      [v4 setObject:v1023 forKeyedSubscript:@"DarkBiasValue-6"];

      LODWORD(v1024) = 1062836634;
      v1025 = [NSNumber numberWithFloat:v1024];
      [v4 setObject:v1025 forKeyedSubscript:@"DarkMatrixValue-6"];

      LODWORD(v1026) = 0.5;
      v1027 = [NSNumber numberWithFloat:v1026];
      [v4 setObject:v1027 forKeyedSubscript:@"LightBiasValue-7"];

      LODWORD(v1028) = 1.0;
      v1029 = [NSNumber numberWithFloat:v1028];
      [v4 setObject:v1029 forKeyedSubscript:@"LightMatrixValue-7"];

      LODWORD(v1030) = 1055957975;
      v1031 = [NSNumber numberWithFloat:v1030];
      [v4 setObject:v1031 forKeyedSubscript:@"DarkBiasValue-7"];

      LODWORD(v1032) = 1061997773;
      v156 = [NSNumber numberWithFloat:v1032];
      v157 = @"DarkMatrixValue-7";
      break;
    case 0x201Du:
      v1033 = [NSNumber numberWithInt:74];
      [v4 setObject:v1033 forKeyedSubscript:@"BudHeight"];

      v1034 = [NSNumber numberWithInt:6];
      [v4 setObject:v1034 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v1035 = [NSNumber numberWithInt:17];
      [v4 setObject:v1035 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v1036 = [NSNumber numberWithInt:57];
      [v4 setObject:v1036 forKeyedSubscript:@"CaseHeight"];

      v1037 = [NSNumber numberWithInt:33];
      [v4 setObject:v1037 forKeyedSubscript:@"UnifiedSpacingBudsCase"];

      v1038 = [NSNumber numberWithInt:22];
      [v4 setObject:v1038 forKeyedSubscript:@"SeparateSpacingBudsCase"];

      LODWORD(v1039) = 1056293519;
      v1040 = [NSNumber numberWithFloat:v1039];
      [v4 setObject:v1040 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v1041) = 1064178811;
      v1042 = [NSNumber numberWithFloat:v1041];
      [v4 setObject:v1042 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v1043) = 0.5;
      v1044 = [NSNumber numberWithFloat:v1043];
      [v4 setObject:v1044 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v1045) = 1065185444;
      v1046 = [NSNumber numberWithFloat:v1045];
      [v4 setObject:v1046 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v1047) = 1055957975;
      v1048 = [NSNumber numberWithFloat:v1047];
      [v4 setObject:v1048 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v1049) = 1064514355;
      v1050 = [NSNumber numberWithFloat:v1049];
      [v4 setObject:v1050 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v1051) = 0.5;
      v1052 = [NSNumber numberWithFloat:v1051];
      [v4 setObject:v1052 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v1053) = 1065185444;
      v1054 = [NSNumber numberWithFloat:v1053];
      [v4 setObject:v1054 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v1055) = 1056629064;
      v1056 = [NSNumber numberWithFloat:v1055];
      [v4 setObject:v1056 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v1057) = 1064849900;
      v1058 = [NSNumber numberWithFloat:v1057];
      [v4 setObject:v1058 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v1059) = 0.5;
      v1060 = [NSNumber numberWithFloat:v1059];
      [v4 setObject:v1060 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v1061) = 1065185444;
      v1062 = [NSNumber numberWithFloat:v1061];
      [v4 setObject:v1062 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v1063) = 1056293519;
      v1064 = [NSNumber numberWithFloat:v1063];
      [v4 setObject:v1064 forKeyedSubscript:@"DarkBiasValue-4"];

      LODWORD(v1065) = 1064849900;
      v1066 = [NSNumber numberWithFloat:v1065];
      [v4 setObject:v1066 forKeyedSubscript:@"DarkMatrixValue-4"];

      LODWORD(v1067) = 0.5;
      v1068 = [NSNumber numberWithFloat:v1067];
      [v4 setObject:v1068 forKeyedSubscript:@"LightBiasValue-4"];

      v936 = NSNumber;
      LODWORD(v937) = 1065185444;
LABEL_29:
      v156 = [v936 numberWithFloat:v937];
      v157 = @"LightMatrixValue-4";
      break;
    case 0x201Fu:
      v1069 = [NSNumber numberWithInt:108];
      [v4 setObject:v1069 forKeyedSubscript:@"BudHeight"];

      LODWORD(v1070) = 0.5;
      v1071 = [NSNumber numberWithFloat:v1070];
      [v4 setObject:v1071 forKeyedSubscript:@"DarkBiasValue-21"];

      LODWORD(v1072) = 1064682127;
      v1073 = [NSNumber numberWithFloat:v1072];
      [v4 setObject:v1073 forKeyedSubscript:@"DarkMatrixValue-21"];

      LODWORD(v1074) = 0.5;
      v1075 = [NSNumber numberWithFloat:v1074];
      [v4 setObject:v1075 forKeyedSubscript:@"LightBiasValue-21"];

      LODWORD(v1076) = 1064849900;
      v1077 = [NSNumber numberWithFloat:v1076];
      [v4 setObject:v1077 forKeyedSubscript:@"LightMatrixValue-21"];

      LODWORD(v1078) = 0.5;
      v1079 = [NSNumber numberWithFloat:v1078];
      [v4 setObject:v1079 forKeyedSubscript:@"DarkBiasValue-22"];

      LODWORD(v1080) = 1063675494;
      v1081 = [NSNumber numberWithFloat:v1080];
      [v4 setObject:v1081 forKeyedSubscript:@"DarkMatrixValue-22"];

      LODWORD(v1082) = 0.5;
      v1083 = [NSNumber numberWithFloat:v1082];
      [v4 setObject:v1083 forKeyedSubscript:@"LightBiasValue-22"];

      LODWORD(v1084) = 1064849900;
      v1085 = [NSNumber numberWithFloat:v1084];
      [v4 setObject:v1085 forKeyedSubscript:@"LightMatrixValue-22"];

      LODWORD(v1086) = 0.5;
      v1087 = [NSNumber numberWithFloat:v1086];
      [v4 setObject:v1087 forKeyedSubscript:@"DarkBiasValue-20"];

      LODWORD(v1088) = 1063675494;
      v1089 = [NSNumber numberWithFloat:v1088];
      [v4 setObject:v1089 forKeyedSubscript:@"DarkMatrixValue-20"];

      LODWORD(v1090) = 0.5;
      v1091 = [NSNumber numberWithFloat:v1090];
      [v4 setObject:v1091 forKeyedSubscript:@"LightBiasValue-20"];

      LODWORD(v1092) = 1064849900;
      v1093 = [NSNumber numberWithFloat:v1092];
      [v4 setObject:v1093 forKeyedSubscript:@"LightMatrixValue-20"];

      LODWORD(v1094) = 1055286886;
      v1095 = [NSNumber numberWithFloat:v1094];
      [v4 setObject:v1095 forKeyedSubscript:@"DarkBiasValue-19"];

      LODWORD(v1096) = 1.0;
      v1097 = [NSNumber numberWithFloat:v1096];
      [v4 setObject:v1097 forKeyedSubscript:@"DarkMatrixValue-19"];

      LODWORD(v1098) = 0.5;
      v1099 = [NSNumber numberWithFloat:v1098];
      [v4 setObject:v1099 forKeyedSubscript:@"LightBiasValue-19"];

      LODWORD(v1100) = 1.0;
      v1101 = [NSNumber numberWithFloat:v1100];
      [v4 setObject:v1101 forKeyedSubscript:@"LightMatrixValue-19"];

      LODWORD(v1102) = 0.5;
      v1103 = [NSNumber numberWithFloat:v1102];
      [v4 setObject:v1103 forKeyedSubscript:@"DarkBiasValue-18"];

      LODWORD(v1104) = 1063675494;
      v1105 = [NSNumber numberWithFloat:v1104];
      [v4 setObject:v1105 forKeyedSubscript:@"DarkMatrixValue-18"];

      LODWORD(v1106) = 0.5;
      v1107 = [NSNumber numberWithFloat:v1106];
      [v4 setObject:v1107 forKeyedSubscript:@"LightBiasValue-18"];

      LODWORD(v1108) = 1.0;
      v1109 = [NSNumber numberWithFloat:v1108];
      [v4 setObject:v1109 forKeyedSubscript:@"LightMatrixValue-18"];

LABEL_31:
      v1110 = [NSNumber numberWithInt:108];
      [v4 setObject:v1110 forKeyedSubscript:@"BudHeight"];

      LODWORD(v1111) = 0.5;
      v1112 = [NSNumber numberWithFloat:v1111];
      [v4 setObject:v1112 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v1113) = 1063675494;
      v1114 = [NSNumber numberWithFloat:v1113];
      [v4 setObject:v1114 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v1115) = 0.5;
      v1116 = [NSNumber numberWithFloat:v1115];
      [v4 setObject:v1116 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v1117) = 1.0;
      v1118 = [NSNumber numberWithFloat:v1117];
      [v4 setObject:v1118 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v1119) = 0.5;
      v1120 = [NSNumber numberWithFloat:v1119];
      [v4 setObject:v1120 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v1121) = 1064682127;
      v1122 = [NSNumber numberWithFloat:v1121];
      [v4 setObject:v1122 forKeyedSubscript:@"DarkMatrixValue-2"];

      LODWORD(v1123) = 0.5;
      v1124 = [NSNumber numberWithFloat:v1123];
      [v4 setObject:v1124 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v1125) = 1064849900;
      v1126 = [NSNumber numberWithFloat:v1125];
      [v4 setObject:v1126 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v1127) = 0.5;
      v1128 = [NSNumber numberWithFloat:v1127];
      [v4 setObject:v1128 forKeyedSubscript:@"DarkBiasValue-3"];

      LODWORD(v1129) = 1063675494;
      v1130 = [NSNumber numberWithFloat:v1129];
      [v4 setObject:v1130 forKeyedSubscript:@"DarkMatrixValue-3"];

      LODWORD(v1131) = 0.5;
      v1132 = [NSNumber numberWithFloat:v1131];
      [v4 setObject:v1132 forKeyedSubscript:@"LightBiasValue-3"];

      LODWORD(v1133) = 1064849900;
      v1134 = [NSNumber numberWithFloat:v1133];
      [v4 setObject:v1134 forKeyedSubscript:@"LightMatrixValue-3"];

      LODWORD(v1135) = 0.5;
      v1136 = [NSNumber numberWithFloat:v1135];
      [v4 setObject:v1136 forKeyedSubscript:@"DarkBiasValue-15"];

      LODWORD(v1137) = 1063675494;
      v1138 = [NSNumber numberWithFloat:v1137];
      [v4 setObject:v1138 forKeyedSubscript:@"DarkMatrixValue-15"];

      LODWORD(v1139) = 0.5;
      v1140 = [NSNumber numberWithFloat:v1139];
      [v4 setObject:v1140 forKeyedSubscript:@"LightBiasValue-15"];

      LODWORD(v1141) = 1.0;
      v1142 = [NSNumber numberWithFloat:v1141];
      [v4 setObject:v1142 forKeyedSubscript:@"LightMatrixValue-15"];

      LODWORD(v1143) = 1055286886;
      v1144 = [NSNumber numberWithFloat:v1143];
      [v4 setObject:v1144 forKeyedSubscript:@"DarkBiasValue-16"];

      LODWORD(v1145) = 1.0;
      v1146 = [NSNumber numberWithFloat:v1145];
      [v4 setObject:v1146 forKeyedSubscript:@"DarkMatrixValue-16"];

      LODWORD(v1147) = 0.5;
      v1148 = [NSNumber numberWithFloat:v1147];
      [v4 setObject:v1148 forKeyedSubscript:@"LightBiasValue-16"];

      LODWORD(v1149) = 1.0;
      v1150 = [NSNumber numberWithFloat:v1149];
      [v4 setObject:v1150 forKeyedSubscript:@"LightMatrixValue-16"];

      LODWORD(v1151) = 0.5;
      v1152 = [NSNumber numberWithFloat:v1151];
      [v4 setObject:v1152 forKeyedSubscript:@"DarkBiasValue-17"];

      LODWORD(v1153) = 1064514355;
      v1154 = [NSNumber numberWithFloat:v1153];
      [v4 setObject:v1154 forKeyedSubscript:@"DarkMatrixValue-17"];

      LODWORD(v1155) = 0.5;
      v1156 = [NSNumber numberWithFloat:v1155];
      [v4 setObject:v1156 forKeyedSubscript:@"LightBiasValue-17"];

      LODWORD(v1157) = 1064682127;
      v156 = [NSNumber numberWithFloat:v1157];
      v157 = @"LightMatrixValue-17";
      break;
    case 0x2025u:
      v1158 = [NSNumber numberWithInt:108];
      v1159 = @"BudHeight";
      goto LABEL_34;
    case 0x2026u:
      v1160 = [NSNumber numberWithInt:48];
      [v4 setObject:v1160 forKeyedSubscript:@"BudHeight"];

      v1161 = [NSNumber numberWithInt:25];
      [v4 setObject:v1161 forKeyedSubscript:@"SeparateSpacingBetweenBuds"];

      v1162 = [NSNumber numberWithInt:6];
      [v4 setObject:v1162 forKeyedSubscript:@"UnifiedSpacingBetweenBuds"];

      v1158 = [NSNumber numberWithInt:0];
      v1159 = @"UnifiedSpacingBudsCase";
LABEL_34:
      [v4 setObject:v1158 forKeyedSubscript:v1159];

      LODWORD(v1163) = 1057803469;
      v1164 = [NSNumber numberWithFloat:v1163];
      [v4 setObject:v1164 forKeyedSubscript:@"LightBiasValue-0"];

      LODWORD(v1165) = 1.0;
      v1166 = [NSNumber numberWithFloat:v1165];
      [v4 setObject:v1166 forKeyedSubscript:@"LightMatrixValue-0"];

      LODWORD(v1167) = 1057635697;
      v1168 = [NSNumber numberWithFloat:v1167];
      [v4 setObject:v1168 forKeyedSubscript:@"DarkBiasValue-0"];

      LODWORD(v1169) = 1064514355;
      v1170 = [NSNumber numberWithFloat:v1169];
      [v4 setObject:v1170 forKeyedSubscript:@"DarkMatrixValue-0"];

      LODWORD(v1171) = 0.5;
      v1172 = [NSNumber numberWithFloat:v1171];
      [v4 setObject:v1172 forKeyedSubscript:@"LightBiasValue-1"];

      LODWORD(v1173) = 1.0;
      v1174 = [NSNumber numberWithFloat:v1173];
      [v4 setObject:v1174 forKeyedSubscript:@"LightMatrixValue-1"];

      LODWORD(v1175) = 1055957975;
      v1176 = [NSNumber numberWithFloat:v1175];
      [v4 setObject:v1176 forKeyedSubscript:@"DarkBiasValue-1"];

      LODWORD(v1177) = 1064514355;
      v1178 = [NSNumber numberWithFloat:v1177];
      [v4 setObject:v1178 forKeyedSubscript:@"DarkMatrixValue-1"];

      LODWORD(v1179) = 0.5;
      v1180 = [NSNumber numberWithFloat:v1179];
      [v4 setObject:v1180 forKeyedSubscript:@"LightBiasValue-2"];

      LODWORD(v1181) = 1.0;
      v1182 = [NSNumber numberWithFloat:v1181];
      [v4 setObject:v1182 forKeyedSubscript:@"LightMatrixValue-2"];

      LODWORD(v1183) = 1055957975;
      v1184 = [NSNumber numberWithFloat:v1183];
      [v4 setObject:v1184 forKeyedSubscript:@"DarkBiasValue-2"];

      LODWORD(v1185) = 1064514355;
      v156 = [NSNumber numberWithFloat:v1185];
      v157 = @"DarkMatrixValue-2";
      break;
    default:
      v156 = [NSNumber numberWithInt:108];
      v157 = @"BudHeight";
      break;
  }
  [v4 setObject:v156 forKeyedSubscript:v157];

  return v4;
}

- (void)setupViews
{
  uint64_t v263 = *MEMORY[0x1E4F143B8];
  long long v3 = [(HPSBatteryStatusView *)self subviews];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_12];

  id v4 = [(BluetoothDeviceProtocol *)self->currentDevice classicDevice];
  uint64_t v5 = [v4 productId];

  double v257 = [(HPSBatteryStatusView *)self getAssetsDictionary:v5];
  if (!v257)
  {
    id v6 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4BFE000, v6, OS_LOG_TYPE_DEFAULT, "Battery Status: setupViews returning because assetsDict is NULL", buf, 2u);
    }
    goto LABEL_111;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [(HPSBatteryStatusView *)self heightAnchor];
  id v8 = [v7 constraintEqualToConstant:214.0];
  [v6 addObject:v8];

  unsigned int v258 = 0;
  id v9 = [(BluetoothDeviceProtocol *)self->currentDevice classicDevice];
  [v9 getDeviceColor:&v258];

  self->int deviceColor = [(HPSBatteryStatusView *)self bestDeviceColor:v258 productID:v5];
  id v10 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int deviceColor = self->deviceColor;
    BOOL untethered = self->untethered;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v260 = deviceColor;
    *(_WORD *)&v260[4] = 1024;
    *(_DWORD *)&v260[6] = untethered;
    __int16 v261 = 1024;
    int v262 = v5;
    _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "Battery Status: device color: %u untethered: %d pid: %d", buf, 0x14u);
  }

  BOOL v13 = self->untethered;
  BOOL v14 = [(HPSBatteryStatusView *)self isProductOfDifferentColors];
  if (!v13)
  {
    if (v14)
    {
      BOOL v15 = [NSString stringWithFormat:@"%@-%d", self->productIdString, self->deviceColor];
    }
    else
    {
      BOOL v15 = (void *)[[NSString alloc] initWithString:self->productIdString];
    }
    v27 = (void *)MEMORY[0x1E4FB1818];
    float v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v29 = [v27 imageNamed:v15 inBundle:v28 compatibleWithTraitCollection:0];

    if (!v29)
    {
      uint64_t v30 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v260 = v15;
        _os_log_impl(&dword_1E4BFE000, v30, OS_LOG_TYPE_DEFAULT, "Battery Status: deviceImageFileName not found %@", buf, 0xCu);
      }

      if ([(HPSBatteryStatusView *)self isProductOfDifferentColors])
      {
        uint64_t v31 = [NSString stringWithFormat:@"%@-%@", self->productIdString, @"Default"];
      }
      else
      {
        uint64_t v31 = [[NSString alloc] initWithString:self->productIdString];
      }
      v218 = (void *)v31;

      double v219 = (void *)MEMORY[0x1E4FB1818];
      v220 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v29 = [v219 imageNamed:v218 inBundle:v220 compatibleWithTraitCollection:0];

      if (!v29)
      {
        v242 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v260 = v218;
          _os_log_impl(&dword_1E4BFE000, v242, OS_LOG_TYPE_DEFAULT, "Battery Status: default deviceImageFileName not found %@ returning", buf, 0xCu);
        }

        goto LABEL_111;
      }
      BOOL v15 = v218;
    }
    double v221 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v29];
    deviceImageView = self->deviceImageView;
    self->deviceImageView = v221;

    [(HPSBatteryStatusView *)self applyFilters:v257 imageView:self->deviceImageView];
    [(UIImageView *)self->deviceImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v223 = [(UIImageView *)self->deviceImageView heightAnchor];
    v224 = [v223 constraintEqualToConstant:108.0];
    [v6 addObject:v224];

    [(UIImageView *)self->deviceImageView setContentMode:1];
    [(HPSBatteryStatusView *)self addSubview:self->deviceImageView];
    if (self->untethered) {
      uint64_t battLevelSingle = (self->status.battLevelRight + self->status.battLevelLeft) >> 1;
    }
    else {
      uint64_t battLevelSingle = self->status.battLevelSingle;
    }
    v226 = [HPSBatteryGroupView alloc];
    [(HPSBatteryStatusView *)self size];
    v228 = -[HPSBatteryGroupView initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:](v226, "initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:", battLevelSingle, self->status.battIsChargingSingle != 0, 0, 0, 0.0, 0.0, v227, 30.0);
    deviceBatteryLevelSingleView = self->deviceBatteryLevelSingleView;
    self->deviceBatteryLevelSingleView = v228;

    [(HPSBatteryGroupView *)self->deviceBatteryLevelSingleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HPSBatteryGroupView *)self->deviceBatteryLevelSingleView setSemanticContentAttribute:3];
    [(HPSBatteryStatusView *)self addSubview:self->deviceBatteryLevelSingleView];
    v230 = [(UIImageView *)self->deviceImageView centerYAnchor];
    double v231 = [(HPSBatteryStatusView *)self bottomAnchor];
    v232 = [v230 constraintEqualToAnchor:v231 constant:-136.0];
    [v6 addObject:v232];

    double v233 = [(UIImageView *)self->deviceImageView centerXAnchor];
    v234 = [(HPSBatteryStatusView *)self centerXAnchor];
    double v235 = [v233 constraintEqualToAnchor:v234];
    [v6 addObject:v235];

    v236 = [(HPSBatteryGroupView *)self->deviceBatteryLevelSingleView centerXAnchor];
    double v237 = [(UIImageView *)self->deviceImageView centerXAnchor];
    v238 = [v236 constraintEqualToAnchor:v237];
    [v6 addObject:v238];

    double v239 = [(HPSBatteryGroupView *)self->deviceBatteryLevelSingleView bottomAnchor];
    v240 = [(HPSBatteryStatusView *)self bottomAnchor];
    double v241 = [v239 constraintEqualToAnchor:v240 constant:-24.0];
    [v6 addObject:v241];

    goto LABEL_110;
  }
  if (v14) {
    [NSString stringWithFormat:@"%@-%@-%d", self->productIdString, @"Left", self->deviceColor];
  }
  else {
  __int16 v16 = [NSString stringWithFormat:@"%@-%@", self->productIdString, @"Left", v243];
  }
  unsigned int v252 = v5;
  BOOL v17 = [(HPSBatteryStatusView *)self isProductOfDifferentColors];
  productIdString = self->productIdString;
  if (v17) {
    [NSString stringWithFormat:@"%@-%@-%d", productIdString, @"Right", self->deviceColor];
  }
  else {
  float v19 = [NSString stringWithFormat:@"%@-%@", productIdString, @"Right", v244];
  }
  double v20 = (void *)MEMORY[0x1E4FB1818];
  double v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v22 = [v20 imageNamed:v16 inBundle:v21 compatibleWithTraitCollection:0];

  double v23 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v25 = [v23 imageNamed:v19 inBundle:v24 compatibleWithTraitCollection:0];

  v254 = (void *)v22;
  if (v22) {
    goto LABEL_28;
  }
  float v26 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v260 = v16;
    _os_log_impl(&dword_1E4BFE000, v26, OS_LOG_TYPE_DEFAULT, "Battery Status: leftBudImageFileName not found %@", buf, 0xCu);
  }

  if ([(HPSBatteryStatusView *)self isProductOfDifferentColors]) {
    [NSString stringWithFormat:@"%@-%@-%@", self->productIdString, @"Left", @"Default"];
  }
  else {
  uint64_t v32 = [NSString stringWithFormat:@"%@-%@", self->productIdString, @"Left", v245];
  }

  v33 = (void *)MEMORY[0x1E4FB1818];
  float v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v35 = [v33 imageNamed:v32 inBundle:v34 compatibleWithTraitCollection:0];

  __int16 v16 = (void *)v32;
  v254 = (void *)v35;
  if (v35)
  {
LABEL_28:
    double v251 = v16;
    if (v25)
    {
      double v253 = v19;
LABEL_37:
      id v40 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v254];
      leftImageView = self->leftImageView;
      self->leftImageView = v40;

      v250 = v25;
      long long v42 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v25];
      rightImageView = self->rightImageView;
      self->rightImageView = v42;

      [(UIImageView *)self->leftImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIImageView *)self->rightImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(HPSBatteryStatusView *)self applyFilters:v257 imageView:self->leftImageView];
      [(HPSBatteryStatusView *)self applyFilters:v257 imageView:self->rightImageView];
      float v44 = [v257 objectForKey:@"BudHeight"];
      [v44 floatValue];
      float v46 = v45;

      [v254 size];
      float v48 = v47;
      double v49 = (float)(v46 / v48);
      [v254 size];
      float v51 = v50 * v49;
      float v52 = (float)(v51 * 2.0) + 0.0;
      id v53 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      [v53 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v53 setSemanticContentAttribute:3];
      v256 = v53;
      if (!self->untethered) {
        goto LABEL_49;
      }
      int v54 = self->status.battLevelLeft - self->status.battLevelRight;
      if (v54 < 0) {
        int v54 = self->status.battLevelRight - self->status.battLevelLeft;
      }
      if (v54 >= 0xB)
      {
        double v55 = [v257 objectForKey:@"SeparateSpacingBetweenBuds"];
        [v55 floatValue];
        float v57 = v56;

        v58 = [v257 objectForKey:@"SeparateSpacingBudsCase"];
        [v58 floatValue];
        float v60 = v59;

        double v61 = [v53 heightAnchor];
        v62 = [v61 constraintEqualToConstant:v46];
        [v6 addObject:v62];

        double v63 = [v53 widthAnchor];
        v64 = [v257 objectForKey:@"SeparateSpacingBetweenBuds"];
        [v64 floatValue];
        v66 = [v63 constraintEqualToConstant:(float)(v65 + (float)(v51 * 2.0))];
        [v6 addObject:v66];

        [(UIImageView *)self->leftImageView setContentMode:1];
        double v67 = [(UIImageView *)self->leftImageView heightAnchor];
        v68 = [v67 constraintEqualToConstant:v46];
        [v6 addObject:v68];

        [(UIImageView *)self->rightImageView setContentMode:1];
        double v69 = [(UIImageView *)self->rightImageView heightAnchor];
        v70 = [v69 constraintEqualToConstant:v46];
        [v6 addObject:v70];

        [v53 addSubview:self->leftImageView];
        [v53 addSubview:self->rightImageView];
        uint64_t battLevelLeft = self->status.battLevelLeft;
        int v247 = self->status.battLevelLeft;
        unsigned int battLevelRight = self->status.battLevelRight;
        v72 = [HPSBatteryGroupView alloc];
        [(HPSBatteryStatusView *)self size];
        double v74 = v73;
        BOOL v75 = self->status.battIsChargingLeft != 0;
        v76 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        double v77 = [v76 localizedStringForKey:@"ACCESSORY_ABOUT_SERIAL_NUMBER_LEFT" value:&stru_1F4097960 table:@"DeviceConfig"];
        v78 = -[HPSBatteryGroupView initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:](v72, "initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:", battLevelLeft, v75, 0, v77, 0.0, 0.0, v74, 30.0);
        deviceBatteryLevelLeftView = self->deviceBatteryLevelLeftView;
        self->deviceBatteryLevelLeftView = v78;

        [(HPSBatteryGroupView *)self->deviceBatteryLevelLeftView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(HPSBatteryGroupView *)self->deviceBatteryLevelLeftView setSemanticContentAttribute:3];
        v80 = [HPSBatteryGroupView alloc];
        [(HPSBatteryStatusView *)self size];
        double v82 = v81;
        BOOL v83 = self->status.battIsChargingRight != 0;
        v84 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        double v85 = [v84 localizedStringForKey:@"ACCESSORY_ABOUT_SERIAL_NUMBER_RIGHT" value:&stru_1F4097960 table:@"DeviceConfig"];
        v86 = -[HPSBatteryGroupView initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:](v80, "initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:", battLevelRight, v83, 0, v85, 0.0, 0.0, v82, 30.0);
        uint64_t v87 = 528;
        deviceBatteryLevelRightView = self->deviceBatteryLevelRightView;
        self->deviceBatteryLevelRightView = v86;

        [(HPSBatteryGroupView *)self->deviceBatteryLevelRightView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(HPSBatteryGroupView *)self->deviceBatteryLevelRightView setSemanticContentAttribute:3];
        if (v247) {
          [v256 addSubview:self->deviceBatteryLevelLeftView];
        }
        if (battLevelRight) {
          [v256 addSubview:self->deviceBatteryLevelRightView];
        }
        float v89 = v52 + v57;
        v90 = [(UIImageView *)self->leftImageView leadingAnchor];
        double v91 = [v256 leadingAnchor];
        v92 = [v90 constraintEqualToAnchor:v91];
        [v6 addObject:v92];

        double v93 = [(UIImageView *)self->rightImageView centerXAnchor];
        v94 = [(UIImageView *)self->leftImageView centerXAnchor];
        double v95 = [v257 objectForKey:@"SeparateSpacingBetweenBuds"];
        [v95 floatValue];
        double v97 = [v93 constraintEqualToAnchor:v94 constant:(float)(v96 + v51)];
        [v6 addObject:v97];

        if (v247)
        {
          v98 = [(HPSBatteryGroupView *)self->deviceBatteryLevelLeftView centerXAnchor];
          double v99 = [(UIImageView *)self->leftImageView centerXAnchor];
          v100 = [v98 constraintEqualToAnchor:v99];
          [v6 addObject:v100];

          double v101 = [(HPSBatteryGroupView *)self->deviceBatteryLevelLeftView bottomAnchor];
          v102 = [(HPSBatteryStatusView *)self bottomAnchor];
          double v103 = [v101 constraintEqualToAnchor:v102 constant:-24.0];
          [v6 addObject:v103];
        }
        float v104 = v89 + v60;
        if (battLevelRight)
        {
          double v105 = [(HPSBatteryGroupView *)self->deviceBatteryLevelRightView centerXAnchor];
          v106 = [(UIImageView *)self->rightImageView centerXAnchor];
          double v107 = [v105 constraintEqualToAnchor:v106];
          [v6 addObject:v107];
LABEL_59:

          double v141 = [*(id *)((char *)&self->super.super.super.isa + v87) bottomAnchor];
          v142 = [(HPSBatteryStatusView *)self bottomAnchor];
          double v143 = [v141 constraintEqualToAnchor:v142 constant:-24.0];
          float v19 = v253;
          v144 = v256;
          unint64_t v145 = 0x1E4F28000;
          [v6 addObject:v143];

          goto LABEL_61;
        }
      }
      else
      {
LABEL_49:
        v108 = [v257 objectForKey:@"UnifiedSpacingBetweenBuds"];
        [v108 floatValue];
        float v110 = v109;

        double v111 = [v257 objectForKey:@"UnifiedSpacingBudsCase"];
        [v111 floatValue];
        float v113 = v112;

        v114 = [v53 heightAnchor];
        double v115 = [v114 constraintEqualToConstant:v46];
        [v6 addObject:v115];

        v116 = [v53 widthAnchor];
        double v117 = [v257 objectForKey:@"UnifiedSpacingBetweenBuds"];
        [v117 floatValue];
        double v119 = [v116 constraintEqualToConstant:(float)(v118 + (float)(v51 * 2.0))];
        [v6 addObject:v119];

        [(UIImageView *)self->leftImageView setContentMode:1];
        v120 = [(UIImageView *)self->leftImageView heightAnchor];
        double v121 = [v120 constraintEqualToConstant:v46];
        [v6 addObject:v121];

        [(UIImageView *)self->rightImageView setContentMode:1];
        v122 = [(UIImageView *)self->rightImageView heightAnchor];
        double v123 = [v122 constraintEqualToConstant:v46];
        [v6 addObject:v123];

        [v53 addSubview:self->leftImageView];
        [v53 addSubview:self->rightImageView];
        if (self->untethered) {
          uint64_t v124 = (self->status.battLevelRight + self->status.battLevelLeft) >> 1;
        }
        else {
          uint64_t v124 = self->status.battLevelSingle;
        }
        double v125 = [HPSBatteryGroupView alloc];
        [(HPSBatteryStatusView *)self size];
        if (self->status.battIsChargingLeft) {
          BOOL v127 = 1;
        }
        else {
          BOOL v127 = self->status.battIsChargingRight != 0;
        }
        float v128 = v52 + v110;
        double v129 = -[HPSBatteryGroupView initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:](v125, "initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:", v124, v127, 0, 0, 0.0, 0.0, v126, 30.0);
        uint64_t v87 = 536;
        v130 = self->deviceBatteryLevelSingleView;
        self->deviceBatteryLevelSingleView = v129;

        [(HPSBatteryGroupView *)self->deviceBatteryLevelSingleView setSemanticContentAttribute:3];
        if (v124)
        {
          [(HPSBatteryGroupView *)self->deviceBatteryLevelSingleView setTranslatesAutoresizingMaskIntoConstraints:0];
          [(HPSBatteryStatusView *)self addSubview:self->deviceBatteryLevelSingleView];
        }
        float v104 = v128 + v113;
        double v131 = [(UIImageView *)self->leftImageView leadingAnchor];
        v132 = [v53 leadingAnchor];
        double v133 = [v131 constraintEqualToAnchor:v132];
        [v6 addObject:v133];

        v134 = [(UIImageView *)self->rightImageView centerXAnchor];
        double v135 = [(UIImageView *)self->leftImageView centerXAnchor];
        v136 = [v257 objectForKey:@"UnifiedSpacingBetweenBuds"];
        [v136 floatValue];
        v138 = [v134 constraintEqualToAnchor:v135 constant:(float)(v137 + v51)];
        [v6 addObject:v138];

        if (v124)
        {
          double v105 = [(HPSBatteryGroupView *)self->deviceBatteryLevelSingleView centerXAnchor];
          v106 = [(UIImageView *)self->leftImageView centerXAnchor];
          double v107 = [v257 objectForKey:@"UnifiedSpacingBetweenBuds"];
          [v107 floatValue];
          v140 = [v105 constraintEqualToAnchor:v106 constant:(float)((float)(v139 + v51) * 0.5)];
          [v6 addObject:v140];

          goto LABEL_59;
        }
      }
      float v19 = v253;
      v144 = v256;
      unint64_t v145 = 0x1E4F28000uLL;
LABEL_61:
      if ([(HPSBatteryStatusView *)self isProductOfDifferentColors]) {
        [NSString stringWithFormat:@"%@_%@-%d", self->productIdString, @"Case", self->deviceColor];
      }
      else {
      v146 = [NSString stringWithFormat:@"%@_%@", self->productIdString, @"Case", v245];
      }
      double v147 = (void *)MEMORY[0x1E4FB1818];
      v148 = [*(id *)(v145 + 2896) bundleForClass:objc_opt_class()];
      double v149 = [v147 imageNamed:v146 inBundle:v148 compatibleWithTraitCollection:0];

      if (v149)
      {
        v150 = v146;
      }
      else
      {
        double v155 = sharedBluetoothSettingsLogComponent();
        if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v260 = v146;
          _os_log_impl(&dword_1E4BFE000, v155, OS_LOG_TYPE_DEFAULT, "Battery Status: caseImageFileName not found %@", buf, 0xCu);
        }

        if ([(HPSBatteryStatusView *)self isProductOfDifferentColors]) {
          [NSString stringWithFormat:@"%@_%@-%@", self->productIdString, @"Case", @"Default"];
        }
        else {
        v150 = [NSString stringWithFormat:@"%@_%@", self->productIdString, @"Case", v246];
        }

        v216 = (void *)MEMORY[0x1E4FB1818];
        double v217 = [*(id *)(v145 + 2896) bundleForClass:objc_opt_class()];
        double v149 = [v216 imageNamed:v150 inBundle:v217 compatibleWithTraitCollection:0];

        if (!v149 && v252 != 8230)
        {
          v186 = sharedBluetoothSettingsLogComponent();
          if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v260 = v150;
            _os_log_impl(&dword_1E4BFE000, v186, OS_LOG_TYPE_DEFAULT, "Battery Status: Default caseImageFileName not found %@ returning", buf, 0xCu);
          }
          int v214 = 1;
          __int16 v16 = v251;
          goto LABEL_88;
        }
      }
      double v151 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v149];
      p_caseImageView = &self->caseImageView;
      caseImageView = self->caseImageView;
      self->caseImageView = v151;

      caseEngravingView = self->caseEngravingView;
      if (caseEngravingView) {
        objc_storeStrong((id *)&self->caseImageView, caseEngravingView);
      }
      else {
        [(HPSBatteryStatusView *)self applyFilters:v257 imageView:*p_caseImageView];
      }
      [(UIImageView *)*p_caseImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      v156 = [v257 objectForKey:@"CaseHeight"];
      [v156 floatValue];
      float v158 = v157;

      [v149 size];
      double v160 = v159;
      double v249 = v149;
      [v149 size];
      double v162 = v161;
      [(UIImageView *)*p_caseImageView setContentMode:1];
      double v163 = [(UIImageView *)*p_caseImageView heightAnchor];
      v164 = [v163 constraintEqualToConstant:v158];
      [v6 addObject:v164];

      double v255 = v150;
      if (self->untethered)
      {
        int v165 = self->status.battLevelLeft - self->status.battLevelRight;
        if (v165 < 0) {
          int v165 = self->status.battLevelRight - self->status.battLevelLeft;
        }
        unint64_t v166 = 0x1E4FB1000;
        if (v165 >= 0xB
          && ([(HPSBatteryStatusView *)self getDeviceCaseIcon:v252],
              double v167 = objc_claimAutoreleasedReturnValue(),
              v167,
              v167))
        {
          id v168 = objc_alloc(MEMORY[0x1E4FB1838]);
          double v169 = [(HPSBatteryStatusView *)self getDeviceCaseIcon:v252];
          v170 = (void *)[v168 initWithImage:v169];
        }
        else
        {
          v170 = 0;
        }
      }
      else
      {
        v170 = 0;
        unint64_t v166 = 0x1E4FB1000uLL;
      }
      double v171 = [HPSBatteryGroupView alloc];
      [(HPSBatteryStatusView *)self size];
      double v173 = -[HPSBatteryGroupView initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:](v171, "initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:", self->status.battLevelCase, self->status.battIsChargingCase != 0, v170, 0, 0.0, 0.0, v172, 30.0);
      deviceBatteryLevelCaseView = self->deviceBatteryLevelCaseView;
      self->deviceBatteryLevelCaseView = v173;

      [(HPSBatteryGroupView *)self->deviceBatteryLevelCaseView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(HPSBatteryGroupView *)self->deviceBatteryLevelCaseView setSemanticContentAttribute:3];
      id v175 = objc_alloc_init(*(Class *)(v166 + 3760));
      [v175 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v175 setSemanticContentAttribute:3];
      v176 = [v175 heightAnchor];
      double v177 = v176;
      if (v158 <= v46) {
        float v178 = v46;
      }
      else {
        float v178 = v158;
      }
      double v179 = [v176 constraintEqualToConstant:v178];
      [v6 addObject:v179];

      if (v252 == 8230)
      {
        v180 = [v175 centerXAnchor];
        double v181 = v256;
        v182 = [v256 centerXAnchor];
        double v183 = [v180 constraintEqualToAnchor:v182];
        [v6 addObject:v183];
      }
      else
      {
        float v184 = v160;
        float v185 = v104 + (float)(v158 / v184) * v162;
        v180 = [v175 widthAnchor];
        v182 = [v180 constraintEqualToConstant:v185];
        [v6 addObject:v182];
        double v181 = v256;
      }
      v186 = v249;

      [v175 addSubview:v181];
      [v175 addSubview:*p_caseImageView];
      [(HPSBatteryStatusView *)self addSubview:v175];
      [(HPSBatteryStatusView *)self addSubview:self->deviceBatteryLevelCaseView];
      double v187 = [v175 centerYAnchor];
      v188 = [(HPSBatteryStatusView *)self bottomAnchor];
      double v189 = [v187 constraintEqualToAnchor:v188 constant:-136.0];
      [v6 addObject:v189];

      v190 = [v256 leadingAnchor];
      double v191 = [v175 leadingAnchor];
      v192 = [v190 constraintEqualToAnchor:v191];
      [v6 addObject:v192];

      double v193 = [v256 centerXAnchor];
      v194 = [v175 centerXAnchor];
      double v195 = [v193 constraintEqualToAnchor:v194];
      [v6 addObject:v195];

      v196 = [v256 centerYAnchor];
      double v197 = [v175 centerYAnchor];
      v198 = [v196 constraintEqualToAnchor:v197];
      [v6 addObject:v198];

      double v199 = [v175 centerXAnchor];
      v200 = [(HPSBatteryStatusView *)self centerXAnchor];
      double v201 = [v199 constraintEqualToAnchor:v200];
      [v6 addObject:v201];

      v202 = [v175 centerYAnchor];
      double v203 = [(HPSBatteryStatusView *)self centerYAnchor];
      v204 = [v202 constraintEqualToAnchor:v203];
      [v6 addObject:v204];

      double v205 = [(UIImageView *)*p_caseImageView trailingAnchor];
      v206 = [v175 trailingAnchor];
      double v207 = [v205 constraintEqualToAnchor:v206];
      [v6 addObject:v207];

      v208 = [(HPSBatteryGroupView *)self->deviceBatteryLevelCaseView centerXAnchor];
      double v209 = [(UIImageView *)*p_caseImageView centerXAnchor];
      v210 = [v208 constraintEqualToAnchor:v209];
      [v6 addObject:v210];

      v144 = v256;
      double v211 = [(HPSBatteryGroupView *)self->deviceBatteryLevelCaseView bottomAnchor];
      v212 = [(HPSBatteryStatusView *)self bottomAnchor];
      double v213 = [v211 constraintEqualToAnchor:v212 constant:-24.0];
      [v6 addObject:v213];

      int v214 = 0;
      float v19 = v253;
      __int16 v16 = v251;
      v150 = v255;
LABEL_88:

      double v215 = v250;
      goto LABEL_89;
    }
    double v36 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v260 = v19;
      _os_log_impl(&dword_1E4BFE000, v36, OS_LOG_TYPE_DEFAULT, "Battery Status: rightBudImageFileName not found %@", buf, 0xCu);
    }

    if ([(HPSBatteryStatusView *)self isProductOfDifferentColors]) {
      [NSString stringWithFormat:@"%@-%@-%@", self->productIdString, @"Right", @"Default"];
    }
    else {
    uint64_t v37 = [NSString stringWithFormat:@"%@-%@", self->productIdString, @"Right", v245];
    }

    v38 = (void *)MEMORY[0x1E4FB1818];
    double v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v25 = [v38 imageNamed:v37 inBundle:v39 compatibleWithTraitCollection:0];

    if (v25)
    {
      double v253 = (void *)v37;
      goto LABEL_37;
    }
    double v215 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v260 = v37;
      _os_log_impl(&dword_1E4BFE000, v215, OS_LOG_TYPE_DEFAULT, "Battery Status: Default rightBudImageFileName not found %@ returning", buf, 0xCu);
    }
    int v214 = 1;
    float v19 = (void *)v37;
    __int16 v16 = v251;
  }
  else
  {
    double v215 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v260 = v32;
      _os_log_impl(&dword_1E4BFE000, v215, OS_LOG_TYPE_DEFAULT, "Battery Status: Default leftBudImageFileName not found %@ returning", buf, 0xCu);
    }
    int v214 = 1;
    v254 = (void *)v25;
  }
LABEL_89:

  if (!v214) {
LABEL_110:
  }
    [MEMORY[0x1E4F28DC8] activateConstraints:v6];
LABEL_111:
}

uint64_t __34__HPSBatteryStatusView_setupViews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (BOOL)isProductOfDifferentColors
{
  v2 = [(BluetoothDeviceProtocol *)self->currentDevice classicDevice];
  int v3 = [v2 productId];

  return ((v3 - 8195) < 0x24) & (0xC1498E7CDuLL >> (v3 - 3));
}

- (unsigned)defaultFiltersID
{
  v2 = [(BluetoothDeviceProtocol *)self->currentDevice classicDevice];
  int v3 = [v2 productId];

  return ((v3 - 8204) & 0xFFFFFFFB) == 0;
}

- (id)getProductIDString
{
  v2 = [(BluetoothDeviceProtocol *)self->currentDevice classicDevice];
  int v3 = [v2 productId];

  if ((v3 - 8194) > 0x24) {
    return @"UNKNOWN";
  }
  else {
    return off_1E6EA9078[v3 - 8194];
  }
}

- (unsigned)bestDeviceColor:(unsigned int)a3 productID:(unsigned int)a4
{
  if (a4 - 8202 <= 0x15)
  {
    int v4 = 1 << (a4 - 10);
    if ((v4 & 0x182) != 0)
    {
      char v5 = a3 & 0xF;
      if ((~a3 & 0xF) == 0) {
        char v5 = 0;
      }
      if (a3 >> 4 == 15) {
        LOBYTE(a3) = v5;
      }
      else {
        LOBYTE(a3) = a3 >> 4;
      }
    }
    else if ((v4 & 0x200001) != 0)
    {
      LOBYTE(a3) = a3 & 0x1F;
    }
  }
  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->deviceBatteryLevelCaseView, 0);
  objc_storeStrong((id *)&self->deviceBatteryLevelSingleView, 0);
  objc_storeStrong((id *)&self->deviceBatteryLevelRightView, 0);
  objc_storeStrong((id *)&self->deviceBatteryLevelLeftView, 0);
  objc_storeStrong((id *)&self->caseEngravingView, 0);
  objc_storeStrong((id *)&self->engravingService, 0);
  objc_storeStrong((id *)&self->rightImageView, 0);
  objc_storeStrong((id *)&self->leftImageView, 0);
  objc_storeStrong((id *)&self->caseImageView, 0);
  objc_storeStrong((id *)&self->deviceImageView, 0);
  objc_storeStrong((id *)&self->productIdString, 0);

  objc_storeStrong((id *)&self->currentDevice, 0);
}

@end