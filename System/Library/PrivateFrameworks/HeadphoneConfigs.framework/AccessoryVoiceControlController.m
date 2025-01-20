@interface AccessoryVoiceControlController
- (AccessoryVoiceControlController)init;
- (BOOL)isVolumeControlEnabled;
- (id)clickHoldModeLeft;
- (id)clickHoldModeRight;
- (id)getVolumeControlEnabled:(id)a3;
- (id)specifiers;
- (void)dealloc;
- (void)deviceDisconnectedHandler:(id)a3;
- (void)deviceRemoved:(id)a3;
- (void)dismissPressAndHold;
- (void)powerChangedHandler:(id)a3;
- (void)setGestureMode:(id)a3 specifier:(id)a4;
- (void)setVolumeControlEnabled:(id)a3 specifier:(id)a4;
@end

@implementation AccessoryVoiceControlController

- (AccessoryVoiceControlController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AccessoryVoiceControlController;
  v2 = [(AccessoryVoiceControlController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *((unsigned char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F00]) = 0;
    v2->_dismissed = 0;
    v2->_volumeControlEnabled = 0;
    v2->_setEnableVolumeControlAtStart = 0;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_deviceRemoved_ name:*MEMORY[0x1E4F50B38] object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel_deviceDisconnectedHandler_ name:*MEMORY[0x1E4F50B10] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel_deviceDisconnectedHandler_ name:*MEMORY[0x1E4F50B18] object:0];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v3 selector:sel_powerChangedHandler_ name:*MEMORY[0x1E4F50AE8] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  currentDevice = self->_currentDevice;
  self->_currentDevice = 0;

  v5.receiver = self;
  v5.super_class = (Class)AccessoryVoiceControlController;
  [(AccessoryVoiceControlController *)&v5 dealloc];
}

- (id)specifiers
{
  v122[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v116.receiver = self;
  v116.super_class = (Class)AccessoryVoiceControlController;
  v4 = [(AccessoryVoiceControlController *)&v116 specifiers];
  objc_super v5 = [v3 arrayWithArray:v4];
  volumeControlSpecifiers = self->_volumeControlSpecifiers;
  self->_volumeControlSpecifiers = v5;

  v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) userInfo];
  v8 = +[HPSDevice deviceKey];
  objc_super v9 = [v7 objectForKeyedSubscript:v8];
  currentDevice = self->_currentDevice;
  self->_currentDevice = v9;

  v11 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  unsigned int v107 = [v11 productId];

  uint64_t v115 = 0;
  v12 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  [v12 clickHoldMode:(char *)&v115 + 4 rightAction:&v115];

  id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v14 = [NSNumber numberWithInteger:HIDWORD(v115)];
  v15 = [NSNumber numberWithInteger:v115];
  uint64_t v16 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, @"pressHoldLeftBudValue", v15, @"pressHoldRightBudValue", 0);

  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v113 = (void *)v16;
  [v17 postNotificationName:@"BTAccessoryPressAndHoldModeSelected" object:0 userInfo:v16];

  int v18 = HIDWORD(v115);
  if (!HIDWORD(v115) || (int v19 = v115) == 0)
  {
    v20 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
    [v20 setClickHoldMode:5 rightMode:5];

    v21 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
    [v21 clickHoldMode:(char *)&v115 + 4 rightAction:&v115];

    int v19 = v115;
    int v18 = HIDWORD(v115);
  }
  BOOL v22 = 1;
  if ((v18 & 0xFFFFFFFE) == 6 || v19 == 6 || v19 == 7 || (BOOL v22 = 0, (v18 & 0xFFFFFFFB) == 1) || v19 == 5 || v19 == 1) {
    self->_setEnableVolumeControlAtStart = v22;
  }
  v23 = (void *)MEMORY[0x1E4F92E70];
  v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:&stru_1F4097960 value:&stru_1F4097960 table:@"DeviceConfig"];
  v26 = [v23 preferenceSpecifierNamed:v25 target:self set:0 get:0 detail:0 cell:0 edit:0];

  v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"VOLUME_CONTROL_FOOTER" value:&stru_1F4097960 table:@"DeviceConfig-B494"];

  v29 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  LODWORD(v24) = [v29 productId];

  if (v24 == 8209)
  {
    v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v31 = [v30 localizedStringForKey:@"VOLUME_CONTROL_FOOTER" value:&stru_1F4097960 table:@"DeviceConfig-B507"];

    v28 = (void *)v31;
  }
  v32 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  int v33 = [v32 productId];

  if (v33 == 8214)
  {
    v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v35 = [v34 localizedStringForKey:@"VOLUME_CONTROL_FOOTER" value:&stru_1F4097960 table:@"DeviceConfig-B607"];

    v28 = (void *)v35;
  }
  v36 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  int v37 = [v36 productId];

  if (v37 == 8218)
  {
    v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v39 = [v38 localizedStringForKey:@"VOLUME_CONTROL_FOOTER" value:&stru_1F4097960 table:@"DeviceConfig-B487"];

    v28 = (void *)v39;
  }
  v40 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  int v41 = [v40 productId];

  if (v41 == 8230)
  {
    v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v43 = [v42 localizedStringForKey:@"VOLUME_CONTROL_FOOTER" value:&stru_1F4097960 table:@"DeviceConfig-B463"];

    v28 = (void *)v43;
  }
  [v26 setProperty:v28 forKey:*MEMORY[0x1E4F93170]];
  v112 = v26;
  [(NSMutableArray *)self->_volumeControlSpecifiers addObject:v26];
  v44 = (void *)MEMORY[0x1E4F92E70];
  v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v46 = [v45 localizedStringForKey:@"VOLUME_CONTROL" value:&stru_1F4097960 table:@"DeviceConfig-B494"];
  v47 = [v44 preferenceSpecifierNamed:v46 target:self set:sel_setVolumeControlEnabled_specifier_ get:sel_getVolumeControlEnabled_ detail:0 cell:6 edit:0];

  [v47 setIdentifier:@"VOLUME_CONTROL_ID"];
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v49 = self->_currentDevice;
  v50 = +[HPSDevice deviceKey];
  [v48 setObject:v49 forKey:v50];

  v110 = v48;
  [v47 setUserInfo:v48];
  [(AccessoryVoiceControlController *)self reloadSpecifier:v47];
  [(NSMutableArray *)self->_volumeControlSpecifiers addObject:v47];
  v51 = (void *)MEMORY[0x1E4F92E70];
  v52 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v53 = [v52 localizedStringForKey:&stru_1F4097960 value:&stru_1F4097960 table:@"DeviceConfig"];
  uint64_t v54 = [v51 preferenceSpecifierNamed:v53 target:self set:0 get:0 detail:0 cell:0 edit:0];

  v109 = (void *)v54;
  [(NSMutableArray *)self->_volumeControlSpecifiers addObject:v54];
  uint64_t v55 = +[HPSProductUtils getProductSpecificString:v107 descriptionKey:@"LEFT_BUD"];
  +[HPSProductUtils getProductSpecificString:v107 descriptionKey:@"RIGHT_BUD"];
  v114 = (void *)v55;
  uint64_t v108 = v111 = v28;
  if ([(AccessoryVoiceControlController *)self isVolumeControlEnabled])
  {
    id v56 = objc_alloc(MEMORY[0x1E4F1C978]);
    v57 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v58 = [v57 localizedStringForKey:@"VOLUME_UP" value:&stru_1F4097960 table:@"DeviceConfig-B494"];
    v59 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v60 = [v59 localizedStringForKey:@"VOLUME_DOWN" value:&stru_1F4097960 table:@"DeviceConfig-B494"];
    uint64_t v105 = objc_msgSend(v56, "initWithObjects:", v58, v60, 0);

    id v61 = objc_alloc(MEMORY[0x1E4F1C978]);
    v62 = [NSNumber numberWithInt:6];
    v63 = [NSNumber numberWithInt:7];
    v64 = objc_msgSend(v61, "initWithObjects:", v62, v63, 0);

    id v65 = objc_alloc(MEMORY[0x1E4F1C978]);
    v66 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v67 = [v66 localizedStringForKey:@"VOLUME_UP" value:&stru_1F4097960 table:@"DeviceConfig-B494"];
    v68 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v69 = [v68 localizedStringForKey:@"VOLUME_DOWN" value:&stru_1F4097960 table:@"DeviceConfig-B494"];
    v70 = objc_msgSend(v65, "initWithObjects:", v67, v69, 0);

    id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v71 setObject:self->_currentDevice forKey:@"bt-device"];
    v72 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v114 target:self set:sel_setGestureMode_specifier_ get:sel_clickHoldModeLeft detail:objc_opt_class() cell:2 edit:0];
    [v72 setIdentifier:@"LEFT_ID"];
    v73 = (void *)v105;
    [v72 setValues:v64 titles:v105 shortTitles:v70];
    [v72 setUserInfo:v71];
    [(NSMutableArray *)self->_volumeControlSpecifiers addObject:v72];
    v74 = (void *)MEMORY[0x1E4F92E70];
    unint64_t v75 = 0x1E4F1C000;
    uint64_t v76 = objc_opt_class();
    v77 = v74;
    v78 = (void *)v108;
    v79 = [v77 preferenceSpecifierNamed:v108 target:self set:sel_setGestureMode_specifier_ get:sel_clickHoldModeRight detail:v76 cell:2 edit:0];
    [v79 setIdentifier:@"RIGHT_ID"];
    [v79 setValues:v64 titles:v105 shortTitles:v70];
    [v79 setUserInfo:v71];
  }
  else
  {
    v80 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
    int v81 = [v80 productId];

    v82 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v83 = v82;
    if (v81 == 8230)
    {
      v84 = [v82 localizedStringForKey:@"SIRI" value:&stru_1F4097960 table:@"DeviceConfig"];
      v122[0] = v84;
      uint64_t v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:1];

      v85 = [NSNumber numberWithInt:1];
      v121 = v85;
      v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];

      v86 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v87 = [v86 localizedStringForKey:@"SIRI" value:&stru_1F4097960 table:@"DeviceConfig"];
      v120 = v87;
      v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
    }
    else
    {
      v88 = [v82 localizedStringForKey:@"NOISE_CONTROL" value:&stru_1F4097960 table:@"DeviceConfig"];
      v119[0] = v88;
      v89 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v90 = [v89 localizedStringForKey:@"SIRI" value:&stru_1F4097960 table:@"DeviceConfig"];
      v119[1] = v90;
      uint64_t v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];

      v91 = [NSNumber numberWithInt:5];
      v118[0] = v91;
      v92 = [NSNumber numberWithInt:1];
      v118[1] = v92;
      v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];

      v86 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v87 = [v86 localizedStringForKey:@"NOISE_CONTROL" value:&stru_1F4097960 table:@"DeviceConfig"];
      v117[0] = v87;
      v93 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v94 = [v93 localizedStringForKey:@"SIRI" value:&stru_1F4097960 table:@"DeviceConfig"];
      v117[1] = v94;
      v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
    }
    id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v95 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
    v96 = +[HPSDevice deviceKey];
    [v71 setObject:v95 forKey:v96];

    v72 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v114 target:self set:sel_setGestureMode_specifier_ get:sel_clickHoldModeLeft detail:objc_opt_class() cell:2 edit:0];
    [v72 setIdentifier:@"LEFT_ID"];
    v73 = (void *)v106;
    [v72 setValues:v64 titles:v106 shortTitles:v70];
    [v72 setUserInfo:v71];
    [(NSMutableArray *)self->_volumeControlSpecifiers addObject:v72];
    v97 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v98 = objc_opt_class();
    v99 = v97;
    v78 = (void *)v108;
    v79 = [v99 preferenceSpecifierNamed:v108 target:self set:sel_setGestureMode_specifier_ get:sel_clickHoldModeRight detail:v98 cell:2 edit:0];
    [v79 setIdentifier:@"RIGHT_ID"];
    [v79 setValues:v64 titles:v106 shortTitles:v70];
    [v79 setUserInfo:v71];
    unint64_t v75 = 0x1E4F1C000uLL;
  }
  [(NSMutableArray *)self->_volumeControlSpecifiers addObject:v79];

  v100 = [*(id *)(v75 + 2424) arrayWithArray:self->_volumeControlSpecifiers];
  uint64_t v101 = (int)*MEMORY[0x1E4F92F08];
  v102 = *(Class *)((char *)&self->super.super.super.super.super.isa + v101);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v101) = v100;

  id v103 = *(id *)((char *)&self->super.super.super.super.super.isa + v101);

  return v103;
}

- (BOOL)isVolumeControlEnabled
{
  return self->_volumeControlEnabled || self->_setEnableVolumeControlAtStart;
}

- (id)getVolumeControlEnabled:(id)a3
{
  v3 = NSNumber;
  BOOL v4 = [(AccessoryVoiceControlController *)self isVolumeControlEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (void)setVolumeControlEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  self->_BOOL volumeControlEnabled = [a3 BOOLValue];
  unint64_t v23 = 0;
  unint64_t v24 = 0;
  objc_super v5 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  [v5 clickHoldModes:&v23];

  unsigned int v6 = v23;
  unsigned int v7 = HIDWORD(v23);
  int v8 = v24;
  int v9 = HIDWORD(v24);
  v10 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL volumeControlEnabled = self->_volumeControlEnabled;
    *(_DWORD *)buf = 67110144;
    BOOL v26 = volumeControlEnabled;
    __int16 v27 = 1024;
    unsigned int v28 = v7;
    __int16 v29 = 1024;
    int v30 = v6;
    __int16 v31 = 1024;
    int v32 = v9;
    __int16 v33 = 1024;
    int v34 = v8;
    _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "Volume Control: gestures before setting : _volumeControlEnabled %d left %d, right %d prevLeft %d, prevRight %d", buf, 0x20u);
  }

  if (self->_volumeControlEnabled)
  {
    int v13 = v24;
    int v12 = HIDWORD(v24);
    if (HIDWORD(v24)) {
      BOOL v14 = v24 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      int v12 = 7;
      int v13 = 6;
    }
    unint64_t v23 = __PAIR64__(v12, v13);
    v15 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = self->_volumeControlEnabled;
      *(_DWORD *)buf = 67110144;
      BOOL v26 = v16;
      __int16 v27 = 1024;
      unsigned int v28 = HIDWORD(v23);
      __int16 v29 = 1024;
      int v30 = v23;
      __int16 v31 = 1024;
      int v32 = HIDWORD(v24);
      __int16 v33 = 1024;
      int v34 = v24;
      _os_log_impl(&dword_1E4BFE000, v15, OS_LOG_TYPE_DEFAULT, "Volume Control: gestures after setting : _volumeControlEnabled %d left %d, right %d prevLeft %d, prevRight %d", buf, 0x20u);
    }

    unint64_t v24 = __PAIR64__(v7, v6);
  }
  else
  {
    v17 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
    int v18 = [v17 productId];

    if (v18 == 8230) {
      int v19 = 1;
    }
    else {
      int v19 = 5;
    }
    LODWORD(v23) = v19;
    HIDWORD(v23) = v19;
    unint64_t v24 = __PAIR64__(v7, v6);
    v20 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v21 = self->_volumeControlEnabled;
      *(_DWORD *)buf = 67110144;
      BOOL v26 = v21;
      __int16 v27 = 1024;
      unsigned int v28 = HIDWORD(v23);
      __int16 v29 = 1024;
      int v30 = v23;
      __int16 v31 = 1024;
      int v32 = HIDWORD(v24);
      __int16 v33 = 1024;
      int v34 = v24;
      _os_log_impl(&dword_1E4BFE000, v20, OS_LOG_TYPE_DEFAULT, "Volume Control: gestures after setting : _volumeControlEnabled %d left %d, right %d prevLeft %d, prevRight %d", buf, 0x20u);
    }
  }
  BOOL v22 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  objc_msgSend(v22, "setClickHoldModes:", v23, v24);

  [(AccessoryVoiceControlController *)self performSelector:sel_reloadSpecifiers withObject:0 afterDelay:0.5];
}

- (id)clickHoldModeLeft
{
  uint64_t v5 = 0;
  v2 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  [v2 clickHoldMode:(char *)&v5 + 4 rightAction:&v5];

  v3 = [NSNumber numberWithInt:HIDWORD(v5)];

  return v3;
}

- (id)clickHoldModeRight
{
  uint64_t v5 = 0;
  v2 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  [v2 clickHoldMode:(char *)&v5 + 4 rightAction:&v5];

  v3 = [NSNumber numberWithInt:v5];

  return v3;
}

- (void)setGestureMode:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  int v8 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
  [v8 clickHoldMode:(char *)&v18 + 4 rightAction:&v18];

  int v9 = [v7 identifier];
  int v10 = [v9 isEqualToString:@"LEFT_ID"];

  if (v10)
  {
    v11 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
    uint64_t v12 = [v6 intValue];
    uint64_t v13 = v18;
    BOOL v14 = v11;
LABEL_5:
    [v14 setClickHoldMode:v12 rightMode:v13];

    goto LABEL_6;
  }
  v15 = [v7 identifier];
  int v16 = [v15 isEqualToString:@"RIGHT_ID"];

  if (v16)
  {
    v11 = [(BluetoothDeviceProtocol *)self->_currentDevice classicDevice];
    uint64_t v17 = HIDWORD(v18);
    uint64_t v13 = [v6 intValue];
    BOOL v14 = v11;
    uint64_t v12 = v17;
    goto LABEL_5;
  }
LABEL_6:
  [(AccessoryVoiceControlController *)self performSelector:sel_reloadSpecifiers withObject:0 afterDelay:0.5];
}

- (void)deviceDisconnectedHandler:(id)a3
{
  id v7 = [a3 object];
  BOOL v4 = [v7 address];
  uint64_t v5 = [(BluetoothDeviceProtocol *)self->_currentDevice identifier];
  if (v4 == v5)
  {
    BOOL dismissed = self->_dismissed;

    if (!dismissed) {
      [(AccessoryVoiceControlController *)self dismissPressAndHold];
    }
  }
  else
  {
  }
}

- (void)powerChangedHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F50B70] sharedInstance];
  int v6 = [v5 enabled];

  id v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 name];
    int v9 = (void *)v8;
    int v10 = "off";
    if (v6) {
      int v10 = "on";
    }
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2080;
    BOOL v14 = v10;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ with power state %s", (uint8_t *)&v11, 0x16u);
  }
  [(AccessoryVoiceControlController *)self dismissPressAndHold];
}

- (void)deviceRemoved:(id)a3
{
  id v7 = [a3 object];
  id v4 = [v7 address];
  uint64_t v5 = [(BluetoothDeviceProtocol *)self->_currentDevice identifier];
  if (v4 == v5)
  {
    BOOL dismissed = self->_dismissed;

    if (!dismissed) {
      [(AccessoryVoiceControlController *)self dismissPressAndHold];
    }
  }
  else
  {
  }
}

- (void)dismissPressAndHold
{
  self->_BOOL dismissed = 1;
  id v3 = [(AccessoryVoiceControlController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);

  objc_storeStrong((id *)&self->_volumeControlSpecifiers, 0);
}

@end