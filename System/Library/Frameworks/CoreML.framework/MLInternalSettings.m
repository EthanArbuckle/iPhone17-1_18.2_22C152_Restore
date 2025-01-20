@interface MLInternalSettings
+ (BOOL)deviceHasANE;
+ (BOOL)supportsSecureCoding;
+ (id)globalSettings;
+ (id)globalSettingsFromSettings:(id)a3;
- (BOOL)isNeuralNetworkGPUPathForbidden;
- (BOOL)restrictNeuralNetworksFromUsingANE;
- (BOOL)restrictNeuralNetworksToUseCPUOnly;
- (MLInternalSettings)init;
- (MLInternalSettings)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRestrictNeuralNetworksFromUsingANE:(BOOL)a3;
- (void)setRestrictNeuralNetworksToUseCPUOnly:(BOOL)a3;
@end

@implementation MLInternalSettings

- (BOOL)restrictNeuralNetworksFromUsingANE
{
  return self->_restrictNeuralNetworksFromUsingANE;
}

+ (id)globalSettings
{
  if (globalSettings_onceToken != -1) {
    dispatch_once(&globalSettings_onceToken, &__block_literal_global_27805);
  }
  v2 = (void *)globalSettings_globalSettings;

  return v2;
}

- (BOOL)restrictNeuralNetworksToUseCPUOnly
{
  return self->_restrictNeuralNetworksToUseCPUOnly;
}

void __36__MLInternalSettings_globalSettings__block_invoke()
{
  v0 = objc_alloc_init(MLInternalSettings);
  v1 = (void *)globalSettings_globalSettings;
  globalSettings_globalSettings = (uint64_t)v0;
}

- (MLInternalSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)MLInternalSettings;
  result = [(MLInternalSettings *)&v3 init];
  if (result) {
    *(_WORD *)&result->_restrictNeuralNetworksToUseCPUOnly = 0;
  }
  return result;
}

- (BOOL)isNeuralNetworkGPUPathForbidden
{
  return self->_isNeuralNetworkGPUPathForbidden;
}

- (void)setRestrictNeuralNetworksFromUsingANE:(BOOL)a3
{
  self->_restrictNeuralNetworksFromUsingANE = a3;
}

- (void)setRestrictNeuralNetworksToUseCPUOnly:(BOOL)a3
{
  self->_restrictNeuralNetworksToUseCPUOnly = a3;
}

- (MLInternalSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLInternalSettings;
  v5 = [(MLInternalSettings *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeBoolForKey:@"restrictNeuralNetworksToUseCPUOnly"];
    uint64_t v7 = [v4 decodeBoolForKey:@"restrictNeuralNetworksFromUsingANE"];
    [(MLInternalSettings *)v5 setRestrictNeuralNetworksToUseCPUOnly:v6];
    [(MLInternalSettings *)v5 setRestrictNeuralNetworksFromUsingANE:v7];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MLInternalSettings restrictNeuralNetworksToUseCPUOnly](self, "restrictNeuralNetworksToUseCPUOnly"), @"restrictNeuralNetworksToUseCPUOnly");
  objc_msgSend(v4, "encodeBool:forKey:", -[MLInternalSettings restrictNeuralNetworksFromUsingANE](self, "restrictNeuralNetworksFromUsingANE"), @"restrictNeuralNetworksFromUsingANE");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)deviceHasANE
{
  if (deviceHasANE_onceToken[0] != -1) {
    dispatch_once(deviceHasANE_onceToken, &__block_literal_global_2);
  }
  return deviceHasANE_deviceHasANE;
}

uint64_t __34__MLInternalSettings_deviceHasANE__block_invoke()
{
  uint64_t result = MGIsQuestionValid();
  if (result)
  {
    uint64_t result = MGGetBoolAnswer();
    deviceHasANE_deviceHasANE = result;
  }
  return result;
}

+ (id)globalSettingsFromSettings:(id)a3
{
  id v3 = a3;
  id v4 = +[MLInternalSettings globalSettings];
  objc_msgSend(v4, "setRestrictNeuralNetworksFromUsingANE:", objc_msgSend(v3, "restrictNeuralNetworksFromUsingANE"));
  uint64_t v5 = [v3 restrictNeuralNetworksToUseCPUOnly];

  [v4 setRestrictNeuralNetworksToUseCPUOnly:v5];

  return v4;
}

@end