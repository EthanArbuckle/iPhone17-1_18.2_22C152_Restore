@interface HMDCameraProfileSettingsDerivedPropertiesModel
+ (id)hmbProperties;
- (int64_t)currentAccessModeChangeReason;
- (unint64_t)currentAccessMode;
- (void)setCurrentAccessMode:(unint64_t)a3;
- (void)setCurrentAccessModeChangeReason:(int64_t)a3;
@end

@implementation HMDCameraProfileSettingsDerivedPropertiesModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_110 != -1) {
    dispatch_once(&hmbProperties_onceToken_110, &__block_literal_global_113_107278);
  }
  v2 = (void *)hmbProperties__properties_111;
  return v2;
}

void __63__HMDCameraProfileSettingsDerivedPropertiesModel_hmbProperties__block_invoke()
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"currentAccessModeField";
  v0 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"currentAccessModeChangeReasonField";
  v1 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"currentAccessModeChangeDate";
  v2 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)hmbProperties__properties_111;
  hmbProperties__properties_111 = v3;
}

- (int64_t)currentAccessModeChangeReason
{
  v2 = [(HMDCameraProfileSettingsDerivedPropertiesModel *)self currentAccessModeChangeReasonField];
  int64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setCurrentAccessModeChangeReason:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(HMDCameraProfileSettingsDerivedPropertiesModel *)self setCurrentAccessModeChangeReasonField:v4];
}

- (unint64_t)currentAccessMode
{
  v2 = [(HMDCameraProfileSettingsDerivedPropertiesModel *)self currentAccessModeField];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setCurrentAccessMode:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(HMDCameraProfileSettingsDerivedPropertiesModel *)self setCurrentAccessModeField:v4];

  id v5 = [MEMORY[0x263EFF910] date];
  [(HMDCameraProfileSettingsDerivedPropertiesModel *)self setCurrentAccessModeChangeDate:v5];
}

@end