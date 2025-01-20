@interface CARColorFiltersPanel
+ (id)colorBlindnessTypes;
+ (id)colorFilters;
+ (id)intensities;
- (BOOL)colorFiltersSwitchIsOn;
- (BOOL)getColorFiltersPreferenceIsOn;
- (BOOL)isSupportedCarPlayFilterType:(unint64_t)a3;
- (CARColorFiltersPanel)initWithPanelController:(id)a3;
- (CARSettingsGroupCellSpecifier)colorFilterIntensityPickerGroupSpecifier;
- (CARSettingsGroupCellSpecifier)colorFilterPickerGroupSpecifier;
- (CARSettingsSwitchCellSpecifier)colorFilterSwitchSpecifier;
- (NSArray)colorFilters;
- (double)selectedFilterIntensity;
- (id)_getColorFilterTypePerVehiclePrefForIndex:(unint64_t)a3;
- (id)cellSpecifier;
- (id)getColorFiltersIntensityPerVehiclePreferenceDict;
- (id)specifierSections;
- (int64_t)_getColorFiltersIntensityPerVehiclePrefForIndex:(unint64_t)a3;
- (int64_t)getColorFiltersPerVehiclePreferenceType;
- (unint64_t)getColorFiltersIntensityPreferenceTypeForIndex:(unint64_t)a3;
- (unint64_t)getColorFiltersPreferenceType;
- (unint64_t)selectedFilterIndexForType:(unint64_t)a3;
- (void)_updateSpecifiers;
- (void)setColorFilterIntensityPickerGroupSpecifier:(id)a3;
- (void)setColorFilterPickerGroupSpecifier:(id)a3;
- (void)setColorFilterSwitchSpecifier:(id)a3;
- (void)setColorFilters:(id)a3;
- (void)setColorFiltersIntensityPreference;
- (void)setColorFiltersPreference;
- (void)setColorFiltersPreference:(BOOL)a3;
- (void)setDomainOverride;
- (void)setSelectedFilterForType:(unint64_t)a3;
@end

@implementation CARColorFiltersPanel

- (CARColorFiltersPanel)initWithPanelController:(id)a3
{
  v36.receiver = self;
  v36.super_class = (Class)CARColorFiltersPanel;
  id v28 = a3;
  v3 = -[CARSettingsPanel initWithPanelController:](&v36, "initWithPanelController:");
  if (v3)
  {
    objc_initWeak(&location, v3);
    [(CARColorFiltersPanel *)v3 setDomainOverride];
    v4 = [CARSettingsSwitchCellSpecifier alloc];
    v5 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS");
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100028C94;
    v33[3] = &unk_100092030;
    objc_copyWeak(&v34, &location);
    v6 = [(CARSettingsSwitchCellSpecifier *)v4 initWithTitle:v5 image:0 actionBlock:v33];
    colorFilterSwitchSpecifier = v3->_colorFilterSwitchSpecifier;
    v3->_colorFilterSwitchSpecifier = v6;

    BOOL v8 = [(CARColorFiltersPanel *)v3 getColorFiltersPreferenceIsOn];
    v9 = v3->_colorFilterSwitchSpecifier;
    v10 = +[NSNumber numberWithBool:v8];
    [(CARSettingsCellSpecifier *)v9 setCellValue:v10];

    v11 = sub_100021030();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v38) = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Settings] Saved color filter preference is on: %{public}d", buf, 8u);
    }

    v12 = [CARSettingsGroupCellSpecifier alloc];
    v13 = [(id)objc_opt_class() colorFilters];
    v14 = [v13 valueForKey:@"name"];
    v15 = [(id)objc_opt_class() colorBlindnessTypes];
    v16 = [v15 valueForKey:@"name"];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100028D80;
    v31[3] = &unk_1000921A0;
    objc_copyWeak(&v32, &location);
    v17 = [(CARSettingsGroupCellSpecifier *)v12 initWithTitles:v14 subtitles:v16 actionBlock:v31];
    colorFilterPickerGroupSpecifier = v3->_colorFilterPickerGroupSpecifier;
    v3->_colorFilterPickerGroupSpecifier = v17;

    v19 = [CARSettingsGroupCellSpecifier alloc];
    v20 = [(id)objc_opt_class() intensities];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100028E94;
    v29[3] = &unk_1000921A0;
    objc_copyWeak(&v30, &location);
    v21 = [(CARSettingsGroupCellSpecifier *)v19 initWithTitles:v20 actionBlock:v29];
    colorFilterIntensityPickerGroupSpecifier = v3->_colorFilterIntensityPickerGroupSpecifier;
    v3->_colorFilterIntensityPickerGroupSpecifier = v21;

    id v23 = [(CARColorFiltersPanel *)v3 getColorFiltersPreferenceType];
    [(CARSettingsGroupCellSpecifier *)v3->_colorFilterPickerGroupSpecifier setSelectedIndex:v23];
    v24 = sub_100021030();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      id v38 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Settings] Saved color filter selected index: %{public}lu", buf, 0xCu);
    }

    id v25 = [(CARColorFiltersPanel *)v3 getColorFiltersIntensityPreferenceTypeForIndex:[(CARSettingsGroupCellSpecifier *)v3->_colorFilterPickerGroupSpecifier selectedIndex]];
    [(CARSettingsGroupCellSpecifier *)v3->_colorFilterIntensityPickerGroupSpecifier setSelectedIndex:v25];
    v26 = sub_100021030();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      id v38 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[Settings] Saved color filter intensity selected index: %{public}lu", buf, 0xCu);
    }

    [(CARColorFiltersPanel *)v3 _updateSpecifiers];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [CARSettingsCellSpecifier alloc];
    v5 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS");
    v6 = +[CARSettingsImageCache appearanceImage];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000290FC;
    v10[3] = &unk_100092008;
    objc_copyWeak(&v11, &location);
    v7 = [(CARSettingsCellSpecifier *)v4 initWithTitle:v5 image:v6 accessoryType:1 actionBlock:v10];
    BOOL v8 = self->_cellSpecifier;
    self->_cellSpecifier = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)specifierSections
{
  v3 = [(CARColorFiltersPanel *)self colorFilterSwitchSpecifier];
  id v25 = v3;
  v4 = +[NSArray arrayWithObjects:&v25 count:1];

  v5 = [CARSettingsCellSpecifierSection alloc];
  v6 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_FOOTER");
  v7 = [(CARSettingsCellSpecifierSection *)v5 initWithTitle:0 footer:v6 specifiers:v4];

  BOOL v8 = [CARSettingsCellSpecifierSection alloc];
  v9 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
  v10 = [v9 groupSpecifiers];
  id v11 = [(CARSettingsCellSpecifierSection *)v8 initWithTitle:0 specifiers:v10];

  v12 = [CARSettingsCellSpecifierSection alloc];
  v13 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_INTENSITY");
  v14 = [(CARColorFiltersPanel *)self colorFilterIntensityPickerGroupSpecifier];
  v15 = [v14 groupSpecifiers];
  v16 = [(CARSettingsCellSpecifierSection *)v12 initWithTitle:v13 specifiers:v15];

  if ([(CARColorFiltersPanel *)self colorFiltersSwitchIsOn])
  {
    v22 = v7;
    id v23 = v11;
    v24 = v16;
    v17 = &v22;
    uint64_t v18 = 3;
  }
  else
  {
    v21 = v7;
    v17 = &v21;
    uint64_t v18 = 1;
  }
  v19 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, v18, v21, v22, v23, v24);

  return v19;
}

- (BOOL)colorFiltersSwitchIsOn
{
  v2 = [(CARColorFiltersPanel *)self colorFilterSwitchSpecifier];
  v3 = [v2 cellValue];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (double)selectedFilterIntensity
{
  v2 = [(CARColorFiltersPanel *)self colorFilterIntensityPickerGroupSpecifier];
  id v3 = [v2 selectedIndex];

  double result = 0.660000026;
  if (v3 != (id)1) {
    double result = 1.0;
  }
  if (!v3) {
    return 0.330000013;
  }
  return result;
}

- (void)setSelectedFilterForType:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      id v3 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
      id v5 = v3;
      uint64_t v4 = 1;
      break;
    case 4uLL:
      id v3 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
      id v5 = v3;
      uint64_t v4 = 2;
      break;
    case 8uLL:
      id v3 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
      id v5 = v3;
      uint64_t v4 = 3;
      break;
    default:
      id v3 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
      id v5 = v3;
      uint64_t v4 = 0;
      break;
  }
  [v3 setSelectedIndex:v4];
}

- (unint64_t)selectedFilterIndexForType:(unint64_t)a3
{
  if (a3 - 2 > 6) {
    return 0;
  }
  else {
    return qword_100071E30[a3 - 2];
  }
}

- (BOOL)isSupportedCarPlayFilterType:(unint64_t)a3
{
  return (a3 < 9) & (0x116u >> a3);
}

- (void)setDomainOverride
{
}

- (void)setColorFiltersPreference:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = 1;
  MADisplayFilterPrefSetCategoryEnabled();
  v6 = [(CARSettingsPanel *)self panelController];
  id v12 = [v6 vehicle];

  if (v3) {
    int64_t v5 = [(CARColorFiltersPanel *)self getColorFiltersPerVehiclePreferenceType];
  }
  [v12 setColorFilterPreference:v5];
  v7 = [(CARColorFiltersPanel *)self getColorFiltersIntensityPerVehiclePreferenceDict];
  [v12 setColorFilterIntensityPreference:v7];

  BOOL v8 = [(CARSettingsPanel *)self panelController];
  [v8 saveVehicle:v12];

  v9 = +[CARSettingsAnalytics sharedInstance];
  v10 = [(CARSettingsPanel *)self panelController];
  id v11 = [v10 carSession];
  [v9 axColorFiltersPrefChangedForVehicle:v12 session:v11];
}

- (void)setColorFiltersPreference
{
  BOOL v3 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
  [v3 selectedIndex];
  MADisplayFilterPrefSetType();

  uint64_t v4 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
  unint64_t v5 = -[CARColorFiltersPanel getColorFiltersIntensityPreferenceTypeForIndex:](self, "getColorFiltersIntensityPreferenceTypeForIndex:", [v4 selectedIndex]);

  v6 = [(CARColorFiltersPanel *)self colorFilterIntensityPickerGroupSpecifier];
  id v7 = [v6 selectedIndex];

  if (v7 != (id)v5)
  {
    BOOL v8 = [(CARColorFiltersPanel *)self colorFilterIntensityPickerGroupSpecifier];
    [v8 setSelectedIndex:v5];
  }
  v9 = [(CARSettingsPanel *)self panelController];
  id v15 = [v9 vehicle];

  id v10 = [(CARColorFiltersPanel *)self getColorFiltersPerVehiclePreferenceType];
  if ([v15 colorFilterPreference] != v10)
  {
    [v15 setColorFilterPreference:v10];
    id v11 = [(CARSettingsPanel *)self panelController];
    [v11 saveVehicle:v15];

    id v12 = +[CARSettingsAnalytics sharedInstance];
    v13 = [(CARSettingsPanel *)self panelController];
    v14 = [v13 carSession];
    [v12 axColorFiltersPrefChangedForVehicle:v15 session:v14];
  }
}

- (void)setColorFiltersIntensityPreference
{
  BOOL v3 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
  id v4 = [v3 selectedIndex];

  [(CARColorFiltersPanel *)self selectedFilterIntensity];
  switch((unint64_t)v4)
  {
    case 1uLL:
      MADisplayFilterPrefSetRedColorCorrectionIntensity();
      CFStringRef v5 = @"CARColorFilterIntensityRedGreenKey";
      break;
    case 2uLL:
      MADisplayFilterPrefSetGreenColorCorrectionIntensity();
      CFStringRef v5 = @"CARColorFilterIntensityGreenRedKey";
      break;
    case 3uLL:
      MADisplayFilterPrefSetBlueColorCorrectionIntensity();
      CFStringRef v5 = @"CARColorFilterIntensityBlueYellowKey";
      break;
    default:
      MADisplayFilterPrefSetGrayscaleCorrectionIntensity();
      CFStringRef v5 = @"CARColorFilterIntensityGrayscaleKey";
      break;
  }
  v6 = [(CARSettingsPanel *)self panelController];
  id v19 = [v6 vehicle];

  id v7 = [v19 colorFilterIntensityPreference];
  id v8 = [v7 mutableCopy];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[NSMutableDictionary dictionary];
  }
  id v11 = v10;

  id v12 = [v11 objectForKeyedSubscript:v5];
  v13 = +[NSNumber numberWithInteger:[(CARColorFiltersPanel *)self _getColorFiltersIntensityPerVehiclePrefForIndex:v4]];
  if (!v12 || ([v12 isEqualToNumber:v13] & 1) == 0)
  {
    [v11 setObject:v13 forKeyedSubscript:v5];
    id v14 = [v11 copy];
    [v19 setColorFilterIntensityPreference:v14];

    id v15 = [(CARSettingsPanel *)self panelController];
    [v15 saveVehicle:v19];

    v16 = +[CARSettingsAnalytics sharedInstance];
    v17 = [(CARSettingsPanel *)self panelController];
    uint64_t v18 = [v17 carSession];
    [v16 axColorFiltersPrefChangedForVehicle:v19 session:v18];
  }
}

- (BOOL)getColorFiltersPreferenceIsOn
{
  int CategoryEnabled = MADisplayFilterPrefGetCategoryEnabled();
  uint64_t Type = MADisplayFilterPrefGetType();
  return CategoryEnabled
      && [(CARColorFiltersPanel *)self isSupportedCarPlayFilterType:Type];
}

- (unint64_t)getColorFiltersPreferenceType
{
  uint64_t Type = MADisplayFilterPrefGetType();
  if (![(CARColorFiltersPanel *)self isSupportedCarPlayFilterType:Type]) {
    return 0;
  }

  return [(CARColorFiltersPanel *)self selectedFilterIndexForType:Type];
}

- (unint64_t)getColorFiltersIntensityPreferenceTypeForIndex:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      MADisplayFilterPrefGetRedColorCorrectionIntensity();
      break;
    case 2uLL:
      MADisplayFilterPrefGetGreenColorCorrectionIntensity();
      break;
    case 3uLL:
      MADisplayFilterPrefGetBlueColorCorrectionIntensity();
      break;
    default:
      MADisplayFilterPrefGetGrayscaleCorrectionIntensity();
      break;
  }
  unint64_t v4 = 2;
  if (v3 <= 0.660000026) {
    unint64_t v4 = 1;
  }
  if (v3 <= 0.330000013) {
    return 0;
  }
  else {
    return v4;
  }
}

+ (id)colorFilters
{
  if (qword_1000B08C0 != -1) {
    dispatch_once(&qword_1000B08C0, &stru_100092790);
  }
  v2 = (void *)qword_1000B08C8;

  return v2;
}

+ (id)colorBlindnessTypes
{
  if (qword_1000B08D0 != -1) {
    dispatch_once(&qword_1000B08D0, &stru_1000927B0);
  }
  v2 = (void *)qword_1000B08D8;

  return v2;
}

+ (id)intensities
{
  v2 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_INTENSITY_LOW");
  v7[0] = v2;
  double v3 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_INTENSITY_MEDIUM");
  v7[1] = v3;
  unint64_t v4 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_INTENSITY_HIGH");
  v7[2] = v4;
  CFStringRef v5 = +[NSArray arrayWithObjects:v7 count:3];

  return v5;
}

- (void)_updateSpecifiers
{
  [(CARColorFiltersPanel *)self setSelectedFilterForType:[(CARColorFiltersPanel *)self getColorFiltersPreferenceType]];
  double v3 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
  unint64_t v4 = [v3 selectedTitle];
  CFStringRef v5 = [(CARColorFiltersPanel *)self cellSpecifier];
  [v5 setDetail:v4];

  v6 = +[NSNumber numberWithBool:[(CARColorFiltersPanel *)self getColorFiltersPreferenceIsOn]];
  id v7 = [(CARColorFiltersPanel *)self colorFilterSwitchSpecifier];
  [v7 setCellValue:v6];

  unint64_t v8 = [(CARColorFiltersPanel *)self getColorFiltersPreferenceType];
  v9 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
  [v9 setSelectedIndex:v8];

  [(CARSettingsTablePanel *)self reloadSpecifiers];
}

- (int64_t)getColorFiltersPerVehiclePreferenceType
{
  unint64_t v2 = [(CARColorFiltersPanel *)self getColorFiltersPreferenceType];
  if (v2 >= 4) {
    return 0;
  }
  else {
    return v2 + 2;
  }
}

- (id)getColorFiltersIntensityPerVehiclePreferenceDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unint64_t v4 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
  CFStringRef v5 = [v4 groupSpecifiers];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = [(CARColorFiltersPanel *)self _getColorFilterTypePerVehiclePrefForIndex:v7];
      v9 = +[NSNumber numberWithInteger:[(CARColorFiltersPanel *)self _getColorFiltersIntensityPerVehiclePrefForIndex:v7]];
      [v3 setObject:v9 forKeyedSubscript:v8];

      ++v7;
      id v10 = [(CARColorFiltersPanel *)self colorFilterPickerGroupSpecifier];
      id v11 = [v10 groupSpecifiers];
      id v12 = [v11 count];
    }
    while (v7 < (unint64_t)v12);
  }
  id v13 = [v3 copy];

  return v13;
}

- (id)_getColorFilterTypePerVehiclePrefForIndex:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"CARColorFilterIntensityGrayscaleKey";
  }
  else {
    return (id)*((void *)&off_1000927D0 + a3 - 1);
  }
}

- (int64_t)_getColorFiltersIntensityPerVehiclePrefForIndex:(unint64_t)a3
{
  unint64_t v3 = [(CARColorFiltersPanel *)self getColorFiltersIntensityPreferenceTypeForIndex:a3];
  if (v3 < 3) {
    return v3 + 1;
  }
  else {
    return 3;
  }
}

- (CARSettingsSwitchCellSpecifier)colorFilterSwitchSpecifier
{
  return self->_colorFilterSwitchSpecifier;
}

- (void)setColorFilterSwitchSpecifier:(id)a3
{
}

- (CARSettingsGroupCellSpecifier)colorFilterPickerGroupSpecifier
{
  return self->_colorFilterPickerGroupSpecifier;
}

- (void)setColorFilterPickerGroupSpecifier:(id)a3
{
}

- (CARSettingsGroupCellSpecifier)colorFilterIntensityPickerGroupSpecifier
{
  return self->_colorFilterIntensityPickerGroupSpecifier;
}

- (void)setColorFilterIntensityPickerGroupSpecifier:(id)a3
{
}

- (NSArray)colorFilters
{
  return self->_colorFilters;
}

- (void)setColorFilters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorFilters, 0);
  objc_storeStrong((id *)&self->_colorFilterIntensityPickerGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_colorFilterPickerGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_colorFilterSwitchSpecifier, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end