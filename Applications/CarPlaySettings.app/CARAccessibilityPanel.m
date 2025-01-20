@interface CARAccessibilityPanel
- (BOOL)isBoldTextEnabled;
- (BOOL)systemVoiceControlEnabled;
- (CARAccessibilityPanel)initWithPanelController:(id)a3;
- (CARBoldTextSpecifier)boldTextSpecifier;
- (CARColorFiltersSpecifier)colorFiltersSpecifier;
- (CARSoundRecognitionSpecifier)soundRecognitionSpecifier;
- (CARVoiceControlSpecifier)voiceControlSpecifier;
- (id)cellSpecifier;
- (id)specifierSections;
- (void)_updateSpecifiers;
- (void)_vehicleDidChange:(id)a3;
- (void)boldTextChanged;
- (void)boldTextToggleChanged:(BOOL)a3;
- (void)setBoldTextSpecifier:(id)a3;
- (void)setColorFiltersSpecifier:(id)a3;
- (void)setSoundRecognitionSpecifier:(id)a3;
- (void)setVoiceControlSpecifier:(id)a3;
- (void)systemVoiceControlStatusChanged;
- (void)voiceControlToggleChanged:(BOOL)a3;
@end

@implementation CARAccessibilityPanel

- (CARAccessibilityPanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CARAccessibilityPanel;
  v5 = [(CARSettingsPanel *)&v31 initWithPanelController:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = objc_alloc_init(CARColorFiltersSpecifier);
    colorFiltersSpecifier = v5->_colorFiltersSpecifier;
    v5->_colorFiltersSpecifier = v6;

    v8 = objc_alloc_init(CARBoldTextSpecifier);
    boldTextSpecifier = v5->_boldTextSpecifier;
    v5->_boldTextSpecifier = v8;

    v10 = v5->_boldTextSpecifier;
    v11 = +[NSNumber numberWithBool:[(CARAccessibilityPanel *)v5 isBoldTextEnabled]];
    [(CARSettingsCellSpecifier *)v10 setCellValue:v11];

    v12 = objc_alloc_init(CARVoiceControlSpecifier);
    voiceControlSpecifier = v5->_voiceControlSpecifier;
    v5->_voiceControlSpecifier = v12;

    v14 = v5->_voiceControlSpecifier;
    v15 = +[NSNumber numberWithBool:[(CARAccessibilityPanel *)v5 systemVoiceControlEnabled]];
    [(CARSettingsCellSpecifier *)v14 setCellValue:v15];

    v16 = objc_alloc_init(CARSoundRecognitionSpecifier);
    soundRecognitionSpecifier = v5->_soundRecognitionSpecifier;
    v5->_soundRecognitionSpecifier = v16;

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10002371C;
    v28[3] = &unk_100092008;
    objc_copyWeak(&v29, &location);
    [(CARSettingsCellSpecifier *)v5->_colorFiltersSpecifier setActionBlock:v28];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000237B4;
    v26[3] = &unk_100092008;
    objc_copyWeak(&v27, &location);
    [(CARSettingsCellSpecifier *)v5->_boldTextSpecifier setActionBlock:v26];
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v5 selector:"boldTextChanged" name:kAXSCarPlayEnhanceTextLegibilityChangedNotification object:0];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100023820;
    v24[3] = &unk_100092008;
    objc_copyWeak(&v25, &location);
    [(CARSettingsCellSpecifier *)v5->_voiceControlSpecifier setActionBlock:v24];
    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v5 selector:"systemVoiceControlStatusChanged" name:kAXSCommandAndControlCarPlayEnabledNotification object:0];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002388C;
    v22[3] = &unk_100092008;
    objc_copyWeak(&v23, &location);
    [(CARSettingsCellSpecifier *)v5->_soundRecognitionSpecifier setActionBlock:v22];
    [(CARAccessibilityPanel *)v5 _updateSpecifiers];
    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v5 selector:"_vehicleDidChange:" name:@"CARSettingsPanelControllerVehicleDidChangeNotification" object:0];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    id v4 = [CARSettingsCellSpecifier alloc];
    v5 = sub_1000210C8(@"ACCESSIBILITY_TITLE");
    v6 = +[CARSettingsImageCache accessibilityIcon];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100023A78;
    v10[3] = &unk_100092008;
    objc_copyWeak(&v11, &location);
    v7 = [(CARSettingsCellSpecifier *)v4 initWithTitle:v5 image:v6 accessoryType:1 actionBlock:v10];
    v8 = self->_cellSpecifier;
    self->_cellSpecifier = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)specifierSections
{
  v3 = [CARSettingsCellSpecifierSection alloc];
  id v4 = sub_1000210C8(@"ACCESSIBILITY_HEADER_VISION");
  v5 = [(CARAccessibilityPanel *)self colorFiltersSpecifier];
  v24[0] = v5;
  v6 = [(CARAccessibilityPanel *)self boldTextSpecifier];
  v24[1] = v6;
  v7 = +[NSArray arrayWithObjects:v24 count:2];
  v8 = [(CARSettingsCellSpecifierSection *)v3 initWithTitle:v4 footer:0 specifiers:v7];

  v9 = [CARSettingsCellSpecifierSection alloc];
  v10 = sub_1000210C8(@"ACCESSIBILITY_HEADER_PHYSICAL_AND_MOTOR");
  id v11 = sub_1000210C8(@"ACCESSIBILITY_VOICE_CONTROL_FOOTER");
  v12 = [(CARAccessibilityPanel *)self voiceControlSpecifier];
  id v23 = v12;
  v13 = +[NSArray arrayWithObjects:&v23 count:1];
  v14 = [(CARSettingsCellSpecifierSection *)v9 initWithTitle:v10 footer:v11 specifiers:v13];

  v15 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v8, v14, 0);
  if (CPUIDeviceSupportsSoundRecognition())
  {
    v16 = [CARSettingsCellSpecifierSection alloc];
    v17 = sub_1000210C8(@"ACCESSIBILITY_HEADER_HEARING");
    v18 = [(CARAccessibilityPanel *)self soundRecognitionSpecifier];
    v22 = v18;
    v19 = +[NSArray arrayWithObjects:&v22 count:1];
    v20 = [(CARSettingsCellSpecifierSection *)v16 initWithTitle:v17 specifiers:v19];
    [v15 addObject:v20];
  }

  return v15;
}

- (BOOL)isBoldTextEnabled
{
  v2 = [(CARSettingsPanel *)self panelController];
  v3 = [v2 vehicle];
  BOOL v4 = [v3 boldTextPreference] == (id)1;

  return v4;
}

- (void)boldTextToggleChanged:(BOOL)a3
{
  int v3 = a3;
  v5 = [(CARSettingsPanel *)self panelController];
  id v11 = [v5 vehicle];

  if (v3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [v11 setBoldTextPreference:v6];
  v7 = [(CARSettingsPanel *)self panelController];
  [v7 saveVehicle:v11];

  if (_AXSCarPlayEnhanceTextLegibilityEnabled() != v3)
  {
    _AXSSetCarPlayEnhanceTextLegibilityEnabled();
    v8 = +[CARSettingsAnalytics sharedInstance];
    v9 = [(CARSettingsPanel *)self panelController];
    v10 = [v9 carSession];
    [v8 axBoldTextPrefChangedForVehicle:v11 session:v10];
  }
}

- (void)boldTextChanged
{
  int v3 = [(CARAccessibilityPanel *)self boldTextSpecifier];
  BOOL v4 = +[NSNumber numberWithBool:[(CARAccessibilityPanel *)self isBoldTextEnabled]];
  [v3 setCellValue:v4];

  [(CARSettingsTablePanel *)self reloadSpecifiers];
}

- (void)systemVoiceControlStatusChanged
{
  voiceControlSpecifier = self->_voiceControlSpecifier;
  BOOL v4 = +[NSNumber numberWithBool:[(CARAccessibilityPanel *)self systemVoiceControlEnabled]];
  [(CARSettingsCellSpecifier *)voiceControlSpecifier setCellValue:v4];

  [(CARSettingsTablePanel *)self reloadSpecifiers];
}

- (BOOL)systemVoiceControlEnabled
{
  return _AXSCommandAndControlCarPlayEnabled() != 0;
}

- (void)voiceControlToggleChanged:(BOOL)a3
{
  BOOL v3 = a3;
  _AXSCommandAndControlCarPlaySetEnabled();
  v5 = [(CARSettingsPanel *)self panelController];
  id v13 = [v5 vehicle];

  if (v3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [v13 setVoiceControlPreference:v6];
  v7 = [(CARSettingsPanel *)self panelController];
  [v7 saveVehicle:v13];

  v8 = +[CARSettingsAnalytics sharedInstance];
  v9 = [(CARSettingsPanel *)self panelController];
  v10 = [v9 vehicle];
  id v11 = [(CARSettingsPanel *)self panelController];
  v12 = [v11 carSession];
  [v8 axVoiceControlPrefChanged:v3 forVehicle:v10 session:v12];
}

- (void)_updateSpecifiers
{
  BOOL v3 = [(CARSettingsPanel *)self panelController];
  id v7 = [v3 vehicle];

  if ((uint64_t)[v7 colorFilterPreference] >= 2) {
    BOOL v4 = @"ACCESSIBILITY_SETTING_ON";
  }
  else {
    BOOL v4 = @"ACCESSIBILITY_SETTING_OFF";
  }
  v5 = sub_1000210C8(v4);
  uint64_t v6 = [(CARAccessibilityPanel *)self colorFiltersSpecifier];
  [v6 setDetail:v5];
}

- (void)_vehicleDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000241B0;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (CARColorFiltersSpecifier)colorFiltersSpecifier
{
  return self->_colorFiltersSpecifier;
}

- (void)setColorFiltersSpecifier:(id)a3
{
}

- (CARBoldTextSpecifier)boldTextSpecifier
{
  return self->_boldTextSpecifier;
}

- (void)setBoldTextSpecifier:(id)a3
{
}

- (CARVoiceControlSpecifier)voiceControlSpecifier
{
  return self->_voiceControlSpecifier;
}

- (void)setVoiceControlSpecifier:(id)a3
{
}

- (CARSoundRecognitionSpecifier)soundRecognitionSpecifier
{
  return self->_soundRecognitionSpecifier;
}

- (void)setSoundRecognitionSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundRecognitionSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceControlSpecifier, 0);
  objc_storeStrong((id *)&self->_boldTextSpecifier, 0);
  objc_storeStrong((id *)&self->_colorFiltersSpecifier, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end