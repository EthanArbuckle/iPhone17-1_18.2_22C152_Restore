@interface ATXModeAppConfigurationMetric
- (NSString)bundleId;
- (NSString)modeSemanticType;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)metricName;
- (void)setBundleId:(id)a3;
- (void)setModeSemanticType:(id)a3;
@end

@implementation ATXModeAppConfigurationMetric

- (id)metricName
{
  return @"com.apple.ModeConfiguration.AppConfigurations";
}

- (id)coreAnalyticsDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"bundleId";
  v3 = [(ATXModeAppConfigurationMetric *)self bundleId];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"semanticType";
  v10[0] = v4;
  v5 = [(ATXModeAppConfigurationMetric *)self modeSemanticType];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {
  return v7;
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(ATXModeAppConfigurationMetric *)self bundleId];
  v5 = [(ATXModeAppConfigurationMetric *)self modeSemanticType];
  v6 = [v3 stringWithFormat:@"ATXModeAppConfigurationMetric bundleId:%@\nmodeSemanticType:%@\n", v4, v5];

  return v6;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end