@interface NTK_PUAdjustmentInfo
- (BOOL)enabled;
- (NSString)adjustmentKey;
- (NSString)attributeKey;
- (NSString)iconName;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)localizedSectionName;
- (NSString)settingKey;
- (NTK_PUAdjustmentCustomBehavior)customSettingDelegate;
- (UIImage)ntk_icon;
- (double)baseLevel;
- (double)currentLevel;
- (double)defaultLevel;
- (double)identityLevel;
- (double)lastAdjustedLevel;
- (double)maximumLevel;
- (double)minimumLevel;
- (double)normalizedCurrentLevel;
- (double)normalizedDefaultLevel;
- (id)copy;
- (id)description;
- (void)setAdjustmentKey:(id)a3;
- (void)setAttributeKey:(id)a3;
- (void)setBaseLevel:(double)a3;
- (void)setCurrentLevel:(double)a3;
- (void)setCustomSettingDelegate:(id)a3;
- (void)setDefaultLevel:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIconName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentityLevel:(double)a3;
- (void)setLastAdjustedLevel:(double)a3;
- (void)setLocalizedName:(id)a3;
- (void)setLocalizedSectionName:(id)a3;
- (void)setMaximumLevel:(double)a3;
- (void)setMinimumLevel:(double)a3;
- (void)setNtk_icon:(id)a3;
- (void)setSettingKey:(id)a3;
@end

@implementation NTK_PUAdjustmentInfo

- (id)copy
{
  id result = [(NTK_PUAdjustmentInfo *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (double)normalizedCurrentLevel
{
  [(NTK_PUAdjustmentInfo *)self maximumLevel];
  double v4 = v3;
  [(NTK_PUAdjustmentInfo *)self minimumLevel];
  if (v4 <= v5) {
    return 2.22507386e-308;
  }
  [(NTK_PUAdjustmentInfo *)self currentLevel];
  double v7 = v6;
  [(NTK_PUAdjustmentInfo *)self minimumLevel];
  double v9 = v7 - v8;
  [(NTK_PUAdjustmentInfo *)self maximumLevel];
  double v11 = v10;
  [(NTK_PUAdjustmentInfo *)self minimumLevel];
  return v9 / (v11 - v12);
}

- (double)normalizedDefaultLevel
{
  [(NTK_PUAdjustmentInfo *)self maximumLevel];
  double v4 = v3;
  [(NTK_PUAdjustmentInfo *)self minimumLevel];
  if (v4 <= v5) {
    return 2.22507386e-308;
  }
  [(NTK_PUAdjustmentInfo *)self defaultLevel];
  double v7 = v6;
  [(NTK_PUAdjustmentInfo *)self minimumLevel];
  double v9 = v7 - v8;
  [(NTK_PUAdjustmentInfo *)self maximumLevel];
  double v11 = v10;
  [(NTK_PUAdjustmentInfo *)self minimumLevel];
  return v9 / (v11 - v12);
}

- (void)setCurrentLevel:(double)a3
{
  if (self->_currentLevel != a3)
  {
    -[NTK_PUAdjustmentInfo setLastAdjustedLevel:](self, "setLastAdjustedLevel:");
    self->_currentLevel = a3;
  }
}

- (void)setLastAdjustedLevel:(double)a3
{
  if (self->_lastAdjustedLevel != a3) {
    self->_lastAdjustedLevel = a3;
  }
}

- (id)description
{
  double v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  double v5 = [(NTK_PUAdjustmentInfo *)self localizedName];
  unsigned int v6 = [(NTK_PUAdjustmentInfo *)self enabled];
  double v7 = [(NTK_PUAdjustmentInfo *)self localizedSectionName];
  double v8 = [(NTK_PUAdjustmentInfo *)self adjustmentKey];
  double v9 = [(NTK_PUAdjustmentInfo *)self settingKey];
  double v10 = [(NTK_PUAdjustmentInfo *)self attributeKey];
  [(NTK_PUAdjustmentInfo *)self minimumLevel];
  uint64_t v12 = v11;
  [(NTK_PUAdjustmentInfo *)self maximumLevel];
  uint64_t v14 = v13;
  [(NTK_PUAdjustmentInfo *)self defaultLevel];
  uint64_t v16 = v15;
  [(NTK_PUAdjustmentInfo *)self identityLevel];
  uint64_t v18 = v17;
  [(NTK_PUAdjustmentInfo *)self lastAdjustedLevel];
  uint64_t v20 = v19;
  [(NTK_PUAdjustmentInfo *)self currentLevel];
  v22 = +[NSString stringWithFormat:@"<%@: %p, name=%@, enabled:%d, sectionName:%@, adjustmentKey=%@, settingsKey:%@, attributeKey:%@, min=%f, max=%f, default=%f, identity=%f, lastAdjusted=%f, current=%f", v4, self, v5, v6, v7, v8, v9, v10, v12, v14, v16, v18, v20, v21];

  return v22;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedSectionName
{
  return self->_localizedSectionName;
}

- (void)setLocalizedSectionName:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (double)defaultLevel
{
  return self->_defaultLevel;
}

- (void)setDefaultLevel:(double)a3
{
  self->_defaultLevel = a3;
}

- (double)identityLevel
{
  return self->_identityLevel;
}

- (void)setIdentityLevel:(double)a3
{
  self->_identityLevel = a3;
}

- (double)minimumLevel
{
  return self->_minimumLevel;
}

- (void)setMinimumLevel:(double)a3
{
  self->_minimumLevel = a3;
}

- (double)maximumLevel
{
  return self->_maximumLevel;
}

- (void)setMaximumLevel:(double)a3
{
  self->_maximumLevel = a3;
}

- (double)baseLevel
{
  return self->_baseLevel;
}

- (void)setBaseLevel:(double)a3
{
  self->_baseLevel = a3;
}

- (double)currentLevel
{
  return self->_currentLevel;
}

- (double)lastAdjustedLevel
{
  return self->_lastAdjustedLevel;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)adjustmentKey
{
  return self->_adjustmentKey;
}

- (void)setAdjustmentKey:(id)a3
{
}

- (NSString)settingKey
{
  return self->_settingKey;
}

- (void)setSettingKey:(id)a3
{
}

- (NTK_PUAdjustmentCustomBehavior)customSettingDelegate
{
  return self->_customSettingDelegate;
}

- (void)setCustomSettingDelegate:(id)a3
{
}

- (UIImage)ntk_icon
{
  return self->_ntk_icon;
}

- (void)setNtk_icon:(id)a3
{
}

- (NSString)attributeKey
{
  return self->_attributeKey;
}

- (void)setAttributeKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeKey, 0);
  objc_storeStrong((id *)&self->_ntk_icon, 0);
  objc_storeStrong((id *)&self->_customSettingDelegate, 0);
  objc_storeStrong((id *)&self->_settingKey, 0);
  objc_storeStrong((id *)&self->_adjustmentKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_localizedSectionName, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end