@interface MTLumaDodgePillSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)disableLumaTracking;
- (MTLumaDodgePillStyleSettings)blackSettings;
- (MTLumaDodgePillStyleSettings)graySettings;
- (MTLumaDodgePillStyleSettings)noneSettings;
- (MTLumaDodgePillStyleSettings)thinSettings;
- (MTLumaDodgePillStyleSettings)whiteSettings;
- (double)brightLumaThreshold;
- (double)colorAddWhiteness;
- (double)cornerRadius;
- (double)darkLumaThreshold;
- (double)edgeSpacing;
- (double)height;
- (double)initialLumaThreshold;
- (double)maxWidth;
- (double)minWidth;
- (int64_t)cornerMask;
- (unint64_t)overrideDodgeMode;
- (void)setBlackSettings:(id)a3;
- (void)setBrightLumaThreshold:(double)a3;
- (void)setColorAddWhiteness:(double)a3;
- (void)setCornerMask:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDarkLumaThreshold:(double)a3;
- (void)setDefaultValues;
- (void)setDisableLumaTracking:(BOOL)a3;
- (void)setEdgeSpacing:(double)a3;
- (void)setGraySettings:(id)a3;
- (void)setHeight:(double)a3;
- (void)setInitialLumaThreshold:(double)a3;
- (void)setMaxWidth:(double)a3;
- (void)setMinWidth:(double)a3;
- (void)setNoneSettings:(id)a3;
- (void)setOverrideDodgeMode:(unint64_t)a3;
- (void)setThinSettings:(id)a3;
- (void)setWhiteSettings:(id)a3;
@end

@implementation MTLumaDodgePillSettings

+ (id)sharedInstance
{
  return +[MTLumaDodgePillDomain rootSettings];
}

- (double)edgeSpacing
{
  return self->_edgeSpacing;
}

- (double)minWidth
{
  return self->_minWidth;
}

- (double)height
{
  return self->_height;
}

- (double)colorAddWhiteness
{
  return self->_colorAddWhiteness;
}

- (double)brightLumaThreshold
{
  return self->_brightLumaThreshold;
}

- (unint64_t)overrideDodgeMode
{
  return self->_overrideDodgeMode;
}

- (MTLumaDodgePillStyleSettings)noneSettings
{
  return self->_noneSettings;
}

- (MTLumaDodgePillStyleSettings)graySettings
{
  return self->_graySettings;
}

- (BOOL)disableLumaTracking
{
  return self->_disableLumaTracking;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)cornerMask
{
  return self->_cornerMask;
}

- (double)darkLumaThreshold
{
  return self->_darkLumaThreshold;
}

- (MTLumaDodgePillStyleSettings)blackSettings
{
  return self->_blackSettings;
}

- (double)initialLumaThreshold
{
  return self->_initialLumaThreshold;
}

- (MTLumaDodgePillStyleSettings)whiteSettings
{
  return self->_whiteSettings;
}

- (void)setDefaultValues
{
  if (_RunningInSpringBoard___once != -1) {
    dispatch_once(&_RunningInSpringBoard___once, &__block_literal_global_305);
  }
  if (_RunningInSpringBoard___result)
  {
    _MainScreenReferenceBounds();
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 _referenceBounds];
    double v4 = v8;
    double v6 = v9;
  }
  [(MTLumaDodgePillSettings *)self setMinWidth:round(v4 * 0.3574)];
  [(MTLumaDodgePillSettings *)self setMaxWidth:round(v6 * 0.2571)];
  [(MTLumaDodgePillSettings *)self setHeight:5.0];
  [(MTLumaDodgePillSettings *)self setEdgeSpacing:8.0];
  v10 = [MEMORY[0x263F1C5C0] currentDevice];
  v11 = (void *)[v10 userInterfaceIdiom];

  if (v11 == (void *)1)
  {
    v12 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v12 userInterfaceIdiom] == 1)
    {
      if (_RunningInSpringBoard___once != -1) {
        dispatch_once(&_RunningInSpringBoard___once, &__block_literal_global_305);
      }
      int v13 = _RunningInSpringBoard___result;
      if (_RunningInSpringBoard___result)
      {
        double v14 = _MainScreenReferenceBounds();
      }
      else
      {
        v11 = [MEMORY[0x263F1C920] mainScreen];
        [v11 _referenceBounds];
      }
      double Height = CGRectGetHeight(*(CGRect *)&v14);
      if (!v13) {

      }
      if (Height > 1210.0)
      {
        [(MTLumaDodgePillSettings *)self setMinWidth:315.0];
        double v19 = 345.0;
        goto LABEL_29;
      }
    }
    else
    {
    }
    v20 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v20 userInterfaceIdiom] != 1)
    {

LABEL_30:
      [(MTLumaDodgePillSettings *)self setHeight:5.5];
      [(MTLumaDodgePillSettings *)self setEdgeSpacing:7.5];
      goto LABEL_31;
    }
    if (_RunningInSpringBoard___once != -1) {
      dispatch_once(&_RunningInSpringBoard___once, &__block_literal_global_305);
    }
    int v21 = _RunningInSpringBoard___result;
    if (_RunningInSpringBoard___result)
    {
      double v22 = _MainScreenReferenceBounds();
    }
    else
    {
      v11 = [MEMORY[0x263F1C920] mainScreen];
      [v11 _referenceBounds];
    }
    double v26 = CGRectGetHeight(*(CGRect *)&v22);
    if (!v21) {

    }
    if (v26 <= 1024.0) {
      goto LABEL_30;
    }
    [(MTLumaDodgePillSettings *)self setMinWidth:273.0];
    double v19 = 315.0;
LABEL_29:
    [(MTLumaDodgePillSettings *)self setMaxWidth:v19];
    goto LABEL_30;
  }
LABEL_31:
  [(MTLumaDodgePillSettings *)self setColorAddWhiteness:0.71];
  [(MTLumaDodgePillSettings *)self setBrightLumaThreshold:0.7];
  [(MTLumaDodgePillSettings *)self setDarkLumaThreshold:0.37];
  [(MTLumaDodgePillSettings *)self setInitialLumaThreshold:0.5];
  [(MTLumaDodgePillSettings *)self setCornerRadius:4.0];
  [(MTLumaDodgePillSettings *)self setCornerMask:0];
  v27 = [(PTSettings *)[MTLumaDodgePillStyleSettings alloc] initWithDefaultValues];
  [(MTLumaDodgePillSettings *)self setNoneSettings:v27];

  v31 = [(PTSettings *)[MTLumaDodgePillStyleSettings alloc] initWithDefaultValues];
  [(MTLumaDodgePillStyleSettings *)v31 setColorAddOpacity:0.525];
  [(MTLumaDodgePillStyleSettings *)v31 setLumaMapPlusColorOpacity:0.31];
  [(MTLumaDodgePillStyleSettings *)v31 setOverlayBlendOpacity:0.4];
  [(MTLumaDodgePillStyleSettings *)v31 setBlur:10.0];
  [(MTLumaDodgePillStyleSettings *)v31 setBrightness:0.06];
  [(MTLumaDodgePillStyleSettings *)v31 setSaturation:1.15];
  [(MTLumaDodgePillSettings *)self setThinSettings:v31];
  v28 = [(PTSettings *)[MTLumaDodgePillStyleSettings alloc] initWithDefaultValues];
  [(MTLumaDodgePillStyleSettings *)v28 setColorAddOpacity:0.5];
  [(MTLumaDodgePillStyleSettings *)v28 setLumaMapPlusColorOpacity:1.0];
  [(MTLumaDodgePillStyleSettings *)v28 setBlur:10.0];
  [(MTLumaDodgePillSettings *)self setGraySettings:v28];
  v29 = [(PTSettings *)[MTLumaDodgePillStyleSettings alloc] initWithDefaultValues];
  [(MTLumaDodgePillStyleSettings *)v29 setLumaMapPlusColorOpacity:1.0];
  [(MTLumaDodgePillStyleSettings *)v29 setBlur:10.0];
  [(MTLumaDodgePillSettings *)self setBlackSettings:v29];
  v30 = [(PTSettings *)[MTLumaDodgePillStyleSettings alloc] initWithDefaultValues];
  [(MTLumaDodgePillStyleSettings *)v30 setColorAddOpacity:1.0];
  [(MTLumaDodgePillStyleSettings *)v30 setLumaMapPlusColorOpacity:1.0];
  [(MTLumaDodgePillStyleSettings *)v30 setBlur:10.0];
  [(MTLumaDodgePillSettings *)self setWhiteSettings:v30];
  [(MTLumaDodgePillSettings *)self setDisableLumaTracking:0];
  [(MTLumaDodgePillSettings *)self setOverrideDodgeMode:0];
}

+ (id)settingsControllerModule
{
  v50[8] = *MEMORY[0x263EF8340];
  v45 = [MEMORY[0x263F622C0] rowWithTitle:@"Narrow Width" valueKeyPath:@"minWidth"];
  v43 = [v45 valueValidator:&__block_literal_global_0];
  v50[0] = v43;
  v41 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"minWidth"];
  v39 = [v41 minValue:1.0 maxValue:300.0];
  v37 = [v39 valueValidator:&__block_literal_global_0];
  v50[1] = v37;
  v34 = [MEMORY[0x263F622C0] rowWithTitle:@"Wide Width" valueKeyPath:@"maxWidth"];
  v32 = [v34 valueValidator:&__block_literal_global_81];
  v50[2] = v32;
  v2 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"maxWidth"];
  double v3 = [v2 minValue:1.0 maxValue:300.0];
  double v4 = [v3 valueValidator:&__block_literal_global_81];
  v50[3] = v4;
  double v5 = [MEMORY[0x263F622C0] rowWithTitle:@"Height" valueKeyPath:@"height"];
  v50[4] = v5;
  double v6 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"height"];
  v7 = [v6 minValue:1.0 maxValue:30.0];
  v50[5] = v7;
  double v8 = [MEMORY[0x263F622C0] rowWithTitle:@"Edge Spacing" valueKeyPath:@"edgeSpacing"];
  v50[6] = v8;
  double v9 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"edgeSpacing"];
  v10 = [v9 minValue:0.0 maxValue:30.0];
  v50[7] = v10;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:8];

  v46 = [MEMORY[0x263F622D8] sectionWithRows:v36 title:@"Geometry"];
  v44 = [MEMORY[0x263F622C0] rowWithTitle:@"+Color: Whiteness" valueKeyPath:@"colorAddWhiteness"];
  v49[0] = v44;
  v42 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"colorAddWhiteness"];
  v40 = [v42 minValue:0.0 maxValue:1.0];
  v49[1] = v40;
  v38 = [MEMORY[0x263F622C0] rowWithTitle:@"Luma Threshold: Bright" valueKeyPath:@"brightLumaThreshold"];
  v49[2] = v38;
  v35 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"brightLumaThreshold"];
  v33 = [v35 minValue:0.0 maxValue:1.0];
  v49[3] = v33;
  v31 = [MEMORY[0x263F622C0] rowWithTitle:@"Luma Threshold: Dark" valueKeyPath:@"darkLumaThreshold"];
  v49[4] = v31;
  v11 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"darkLumaThreshold"];
  v12 = [v11 minValue:0.0 maxValue:1.0];
  v49[5] = v12;
  int v13 = [MEMORY[0x263F622C0] rowWithTitle:@"Luma Threshold: Initial" valueKeyPath:@"initialLumaThreshold"];
  v49[6] = v13;
  double v14 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"initialLumaThreshold"];
  v15 = [v14 minValue:0.0 maxValue:1.0];
  v49[7] = v15;
  v16 = [MEMORY[0x263F622B8] rowWithTitle:@"Thin" childSettingsKeyPath:@"thinSettings"];
  v49[8] = v16;
  v17 = [MEMORY[0x263F622B8] rowWithTitle:@"Gray" childSettingsKeyPath:@"graySettings"];
  v49[9] = v17;
  v18 = [MEMORY[0x263F622B8] rowWithTitle:@"Black" childSettingsKeyPath:@"blackSettings"];
  v49[10] = v18;
  double v19 = [MEMORY[0x263F622B8] rowWithTitle:@"White" childSettingsKeyPath:@"whiteSettings"];
  v49[11] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:12];

  int v21 = [MEMORY[0x263F622D8] sectionWithRows:v20 title:@"Mode Parameters"];
  double v22 = [MEMORY[0x263F62328] rowWithTitle:@"Disable Luma Tracking" valueKeyPath:@"disableLumaTracking"];
  v48[0] = v22;
  v23 = [MEMORY[0x263F622A8] rowWithTitle:@"Override Dodge Mode" valueKeyPath:@"overrideDodgeMode"];
  v24 = [v23 possibleValues:&unk_26C647EB8 titles:&unk_26C647ED0];
  v48[1] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];

  double v26 = [MEMORY[0x263F622D8] sectionWithRows:v25 title:@"Power Analysis Tools"];
  v27 = (void *)MEMORY[0x263F622D8];
  v47[0] = v46;
  v47[1] = v21;
  v47[2] = v26;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:3];
  v29 = [v27 moduleWithTitle:0 contents:v28];

  return v29;
}

id __51__MTLumaDodgePillSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 maxWidth];
  double v6 = v5;
  [v4 doubleValue];
  if (v7 <= v6)
  {
    id v8 = v4;
  }
  else
  {
    id v8 = [NSNumber numberWithDouble:v6];
  }
  double v9 = v8;

  return v9;
}

id __51__MTLumaDodgePillSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 minWidth];
  double v6 = v5;
  [v4 doubleValue];
  if (v7 >= v6)
  {
    id v8 = v4;
  }
  else
  {
    id v8 = [NSNumber numberWithDouble:v6];
  }
  double v9 = v8;

  return v9;
}

- (void)setMinWidth:(double)a3
{
  self->_minWidth = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (void)setEdgeSpacing:(double)a3
{
  self->_edgeSpacing = a3;
}

- (void)setColorAddWhiteness:(double)a3
{
  self->_colorAddWhiteness = a3;
}

- (void)setBrightLumaThreshold:(double)a3
{
  self->_brightLumaThreshold = a3;
}

- (void)setDarkLumaThreshold:(double)a3
{
  self->_darkLumaThreshold = a3;
}

- (void)setInitialLumaThreshold:(double)a3
{
  self->_initialLumaThreshold = a3;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setCornerMask:(int64_t)a3
{
  self->_cornerMask = a3;
}

- (void)setNoneSettings:(id)a3
{
}

- (MTLumaDodgePillStyleSettings)thinSettings
{
  return self->_thinSettings;
}

- (void)setThinSettings:(id)a3
{
}

- (void)setGraySettings:(id)a3
{
}

- (void)setBlackSettings:(id)a3
{
}

- (void)setWhiteSettings:(id)a3
{
}

- (void)setDisableLumaTracking:(BOOL)a3
{
  self->_disableLumaTracking = a3;
}

- (void)setOverrideDodgeMode:(unint64_t)a3
{
  self->_overrideDodgeMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whiteSettings, 0);
  objc_storeStrong((id *)&self->_blackSettings, 0);
  objc_storeStrong((id *)&self->_graySettings, 0);
  objc_storeStrong((id *)&self->_thinSettings, 0);

  objc_storeStrong((id *)&self->_noneSettings, 0);
}

@end