@interface CARSoundRecognitionPanel
+ (id)sounds;
- (BOOL)getCarHornPreferenceIsOn;
- (BOOL)getSirenPreferenceIsOn;
- (BOOL)getSoundRecognitionPreferenceIsOn;
- (BOOL)isCarHornOrSirenDetectionOn;
- (BOOL)soundRecognitionSwitchIsOn;
- (CARHornSpecifier)carHornSpecifier;
- (CARSettingsSwitchCellSpecifier)soundRecognitionSwitchSpecifier;
- (CARSirenSpecifier)sirenSpecifier;
- (CARSoundRecognitionPanel)initWithPanelController:(id)a3;
- (NSArray)soundRecognition;
- (id)cellSpecifier;
- (id)specifierSections;
- (void)_updateSpecifiers;
- (void)setCarHornPreference:(BOOL)a3;
- (void)setCarHornSpecifier:(id)a3;
- (void)setSirenPreference:(BOOL)a3;
- (void)setSirenSpecifier:(id)a3;
- (void)setSoundRecognition:(id)a3;
- (void)setSoundRecognitionPreference:(BOOL)a3;
- (void)setSoundRecognitionSwitchSpecifier:(id)a3;
- (void)startSoundDetectionEngineIfNeeded;
- (void)stopSoundDetectionEngineIfNeeded;
@end

@implementation CARSoundRecognitionPanel

- (CARSoundRecognitionPanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CARSoundRecognitionPanel;
  v5 = [(CARSettingsPanel *)&v35 initWithPanelController:v4];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = [CARSettingsSwitchCellSpecifier alloc];
    v7 = sub_1000210C8(@"ACCESSIBILITY_SOUND_RECOGNITION");
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100017F20;
    v32[3] = &unk_100092030;
    objc_copyWeak(&v33, &location);
    v8 = [(CARSettingsSwitchCellSpecifier *)v6 initWithTitle:v7 image:0 actionBlock:v32];
    soundRecognitionSwitchSpecifier = v5->_soundRecognitionSwitchSpecifier;
    v5->_soundRecognitionSwitchSpecifier = v8;

    BOOL v10 = [(CARSoundRecognitionPanel *)v5 getSoundRecognitionPreferenceIsOn];
    v11 = v5->_soundRecognitionSwitchSpecifier;
    v12 = +[NSNumber numberWithBool:v10];
    [(CARSettingsCellSpecifier *)v11 setCellValue:v12];

    v13 = sub_100021030();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      BOOL v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Settings] Saved Sound Recognition preference is on: %{public}d", buf, 8u);
    }

    BOOL v14 = [(CARSoundRecognitionPanel *)v5 getCarHornPreferenceIsOn];
    v15 = objc_alloc_init(CARHornSpecifier);
    carHornSpecifier = v5->_carHornSpecifier;
    v5->_carHornSpecifier = v15;

    v17 = v5->_carHornSpecifier;
    v18 = +[NSNumber numberWithBool:v14];
    [(CARSettingsCellSpecifier *)v17 setCellValue:v18];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001800C;
    v30[3] = &unk_100092030;
    objc_copyWeak(&v31, &location);
    [(CARSettingsCellSpecifier *)v5->_carHornSpecifier setActionBlock:v30];
    BOOL v19 = [(CARSoundRecognitionPanel *)v5 getSirenPreferenceIsOn];
    v20 = objc_alloc_init(CARSirenSpecifier);
    sirenSpecifier = v5->_sirenSpecifier;
    v5->_sirenSpecifier = v20;

    v22 = v5->_sirenSpecifier;
    v23 = +[NSNumber numberWithBool:v19];
    [(CARSettingsCellSpecifier *)v22 setCellValue:v23];

    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_1000180F0;
    v28 = &unk_100092030;
    objc_copyWeak(&v29, &location);
    [(CARSettingsCellSpecifier *)v5->_sirenSpecifier setActionBlock:&v25];
    [(CARSoundRecognitionPanel *)v5 _updateSpecifiers];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
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
    v5 = sub_1000210C8(@"ACCESSIBILITY_SOUND_RECOGNITION");
    v6 = +[CARSettingsImageCache appearanceImage];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100018328;
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
  v3 = [(CARSoundRecognitionPanel *)self soundRecognitionSwitchSpecifier];
  v18 = v3;
  id v4 = +[NSArray arrayWithObjects:&v18 count:1];

  v5 = [CARSettingsCellSpecifierSection alloc];
  v6 = sub_1000210C8(@"ACCESSIBILITY_FOOTER_HEARING");
  v7 = [(CARSettingsCellSpecifierSection *)v5 initWithTitle:0 footer:v6 specifiers:v4];

  sirenSpecifier = self->_sirenSpecifier;
  v17[0] = self->_carHornSpecifier;
  v17[1] = sirenSpecifier;
  v9 = +[NSArray arrayWithObjects:v17 count:2];
  BOOL v10 = [[CARSettingsCellSpecifierSection alloc] initWithTitle:0 specifiers:v9];
  if ([(CARSoundRecognitionPanel *)self soundRecognitionSwitchIsOn])
  {
    v16[0] = v7;
    v16[1] = v10;
    id v11 = (CARSettingsCellSpecifierSection **)v16;
    uint64_t v12 = 2;
  }
  else
  {
    v15 = v7;
    id v11 = &v15;
    uint64_t v12 = 1;
  }
  v13 = +[NSArray arrayWithObjects:v11 count:v12];

  return v13;
}

- (BOOL)soundRecognitionSwitchIsOn
{
  v2 = [(CARSoundRecognitionPanel *)self soundRecognitionSwitchSpecifier];
  v3 = [v2 cellValue];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)getSoundRecognitionPreferenceIsOn
{
  v2 = [(CARSettingsPanel *)self panelController];
  v3 = [v2 vehicle];

  LOBYTE(v2) = [v3 soundRecognitionPreference] & 1;
  return (char)v2;
}

- (BOOL)getCarHornPreferenceIsOn
{
  v2 = [(CARSettingsPanel *)self panelController];
  v3 = [v2 vehicle];

  unint64_t v4 = ((unint64_t)[v3 soundRecognitionPreference] >> 1) & 1;
  return v4;
}

- (BOOL)getSirenPreferenceIsOn
{
  v2 = [(CARSettingsPanel *)self panelController];
  v3 = [v2 vehicle];

  unint64_t v4 = ((unint64_t)[v3 soundRecognitionPreference] >> 2) & 1;
  return v4;
}

- (void)setSoundRecognitionPreference:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CARSettingsPanel *)self panelController];
  id v14 = [v5 vehicle];

  unint64_t v6 = (unint64_t)[v14 soundRecognitionPreference];
  unint64_t v7 = v6;
  if (v3)
  {
    id v8 = (id)(v6 | 1);
    [(CARSoundRecognitionPanel *)self startSoundDetectionEngineIfNeeded];
  }
  else
  {
    v9 = +[AXSDSettings sharedInstance];
    [v9 setSoundDetectionState:0];

    id v8 = (id)(v7 & 0xFFFFFFFFFFFFFFFELL);
  }
  if ([v14 soundRecognitionPreference] != v8)
  {
    [v14 setSoundRecognitionPreference:v8];
    BOOL v10 = [(CARSettingsPanel *)self panelController];
    [v10 saveVehicle:v14];

    id v11 = +[CARSettingsAnalytics sharedInstance];
    uint64_t v12 = [(CARSettingsPanel *)self panelController];
    v13 = [v12 carSession];
    [v11 axSoundRecognitionChangedForVehicle:v14 session:v13];
  }
}

- (void)setCarHornPreference:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CARSettingsPanel *)self panelController];
  id v14 = [v5 vehicle];

  unint64_t v6 = (unint64_t)[v14 soundRecognitionPreference];
  unint64_t v7 = +[AXSDSettings sharedInstance];
  id v8 = v7;
  if (v3)
  {
    [v7 addSoundDetectionType:AXSDSoundDetectionTypeCarHorns];

    id v9 = (id)(v6 | 2);
    [(CARSoundRecognitionPanel *)self startSoundDetectionEngineIfNeeded];
  }
  else
  {
    [v7 removeSoundDetectionType:AXSDSoundDetectionTypeCarHorns];

    id v9 = (id)(v6 & 0xFFFFFFFFFFFFFFFDLL);
    [(CARSoundRecognitionPanel *)self stopSoundDetectionEngineIfNeeded];
  }
  if ([v14 soundRecognitionPreference] != v9)
  {
    [v14 setSoundRecognitionPreference:v9];
    BOOL v10 = [(CARSettingsPanel *)self panelController];
    [v10 saveVehicle:v14];

    id v11 = +[CARSettingsAnalytics sharedInstance];
    uint64_t v12 = [(CARSettingsPanel *)self panelController];
    v13 = [v12 carSession];
    [v11 axSoundRecognitionChangedForVehicle:v14 session:v13];
  }
}

- (void)setSirenPreference:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CARSettingsPanel *)self panelController];
  id v14 = [v5 vehicle];

  unint64_t v6 = (unint64_t)[v14 soundRecognitionPreference];
  unint64_t v7 = +[AXSDSettings sharedInstance];
  id v8 = v7;
  if (v3)
  {
    [v7 addSoundDetectionType:AXSDSoundDetectionTypeSirenAlarms];

    id v9 = (id)(v6 | 4);
    [(CARSoundRecognitionPanel *)self startSoundDetectionEngineIfNeeded];
  }
  else
  {
    [v7 removeSoundDetectionType:AXSDSoundDetectionTypeSirenAlarms];

    id v9 = (id)(v6 & 0xFFFFFFFFFFFFFFFBLL);
    [(CARSoundRecognitionPanel *)self stopSoundDetectionEngineIfNeeded];
  }
  if ([v14 soundRecognitionPreference] != v9)
  {
    [v14 setSoundRecognitionPreference:v9];
    BOOL v10 = [(CARSettingsPanel *)self panelController];
    [v10 saveVehicle:v14];

    id v11 = +[CARSettingsAnalytics sharedInstance];
    uint64_t v12 = [(CARSettingsPanel *)self panelController];
    v13 = [v12 carSession];
    [v11 axSoundRecognitionChangedForVehicle:v14 session:v13];
  }
}

- (void)startSoundDetectionEngineIfNeeded
{
  id v4 = +[AXSDSettings sharedInstance];
  if ([v4 soundDetectionState] != (id)2)
  {
    unsigned int v3 = [(CARSoundRecognitionPanel *)self isCarHornOrSirenDetectionOn];

    if (!v3) {
      return;
    }
    id v4 = +[AXSDSettings sharedInstance];
    [v4 setSoundDetectionState:2];
  }
}

- (void)stopSoundDetectionEngineIfNeeded
{
  id v4 = +[AXSDSettings sharedInstance];
  if ([v4 soundDetectionState])
  {
    unsigned __int8 v3 = [(CARSoundRecognitionPanel *)self isCarHornOrSirenDetectionOn];

    if (v3) {
      return;
    }
    id v4 = +[AXSDSettings sharedInstance];
    [v4 setSoundDetectionState:0];
  }
}

- (BOOL)isCarHornOrSirenDetectionOn
{
  v2 = [(CARSettingsPanel *)self panelController];
  unsigned __int8 v3 = [v2 vehicle];

  LOBYTE(v2) = ((unint64_t)[v3 soundRecognitionPreference] & 6) != 0;
  return (char)v2;
}

+ (id)sounds
{
  if (qword_1000B0860 != -1) {
    dispatch_once(&qword_1000B0860, &stru_100092458);
  }
  v2 = (void *)qword_1000B0868;

  return v2;
}

- (void)_updateSpecifiers
{
  unsigned __int8 v3 = +[NSNumber numberWithBool:[(CARSoundRecognitionPanel *)self getSoundRecognitionPreferenceIsOn]];
  id v4 = [(CARSoundRecognitionPanel *)self soundRecognitionSwitchSpecifier];
  [v4 setCellValue:v3];

  v5 = +[NSNumber numberWithBool:[(CARSoundRecognitionPanel *)self getCarHornPreferenceIsOn]];
  unint64_t v6 = [(CARSoundRecognitionPanel *)self carHornSpecifier];
  [v6 setCellValue:v5];

  unint64_t v7 = +[NSNumber numberWithBool:[(CARSoundRecognitionPanel *)self getSirenPreferenceIsOn]];
  id v8 = [(CARSoundRecognitionPanel *)self sirenSpecifier];
  [v8 setCellValue:v7];

  [(CARSettingsTablePanel *)self reloadSpecifiers];
}

- (CARSettingsSwitchCellSpecifier)soundRecognitionSwitchSpecifier
{
  return self->_soundRecognitionSwitchSpecifier;
}

- (void)setSoundRecognitionSwitchSpecifier:(id)a3
{
}

- (CARHornSpecifier)carHornSpecifier
{
  return self->_carHornSpecifier;
}

- (void)setCarHornSpecifier:(id)a3
{
}

- (CARSirenSpecifier)sirenSpecifier
{
  return self->_sirenSpecifier;
}

- (void)setSirenSpecifier:(id)a3
{
}

- (NSArray)soundRecognition
{
  return self->_soundRecognition;
}

- (void)setSoundRecognition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundRecognition, 0);
  objc_storeStrong((id *)&self->_sirenSpecifier, 0);
  objc_storeStrong((id *)&self->_carHornSpecifier, 0);
  objc_storeStrong((id *)&self->_soundRecognitionSwitchSpecifier, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end