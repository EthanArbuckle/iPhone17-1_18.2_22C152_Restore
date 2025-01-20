@interface ITAttentionAwarenessSettings
+ (id)settingsControllerModule;
- (BOOL)nonSampledAttentionLostTimeoutEnable;
- (double)nonSampledAttentionLostTimeout;
- (void)setDefaultValues;
- (void)setNonSampledAttentionLostTimeout:(double)a3;
- (void)setNonSampledAttentionLostTimeoutEnable:(BOOL)a3;
@end

@implementation ITAttentionAwarenessSettings

- (void)setDefaultValues
{
  [(ITAttentionAwarenessSettings *)self setNonSampledAttentionLostTimeout:3600.0];

  [(ITAttentionAwarenessSettings *)self setNonSampledAttentionLostTimeoutEnable:1];
}

+ (id)settingsControllerModule
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F622D8];
  v3 = [MEMORY[0x263F622C0] rowWithTitle:@"nonSampled attention lost timeout" valueKeyPath:@"nonSampledAttentionLostTimeout"];
  v12[0] = v3;
  v4 = [MEMORY[0x263F62328] rowWithTitle:@"nonSampled attention lost timeout enabled" valueKeyPath:@"nonSampledAttentionLostTimeoutEnable"];
  v12[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v6 = [v2 sectionWithRows:v5 title:@"nonSampled Attention Lost Timeout"];

  v7 = (void *)MEMORY[0x263F622D8];
  v11 = v6;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  v9 = [v7 moduleWithTitle:0 contents:v8];

  return v9;
}

- (double)nonSampledAttentionLostTimeout
{
  return self->_nonSampledAttentionLostTimeout;
}

- (void)setNonSampledAttentionLostTimeout:(double)a3
{
  self->_nonSampledAttentionLostTimeout = a3;
}

- (BOOL)nonSampledAttentionLostTimeoutEnable
{
  return self->_nonSampledAttentionLostTimeoutEnable;
}

- (void)setNonSampledAttentionLostTimeoutEnable:(BOOL)a3
{
  self->_nonSampledAttentionLostTimeoutEnable = a3;
}

@end