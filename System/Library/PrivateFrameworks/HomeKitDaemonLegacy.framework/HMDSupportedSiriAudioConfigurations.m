@interface HMDSupportedSiriAudioConfigurations
- (HAPAudioStreamCodecConfiguration)selectedConfiguration;
- (NSArray)supportedConfigurations;
- (int64_t)siriInputType;
- (void)setSelectedConfiguration:(id)a3;
- (void)setSiriInputType:(int64_t)a3;
- (void)setSupportedConfigurations:(id)a3;
@end

@implementation HMDSupportedSiriAudioConfigurations

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedConfigurations, 0);
}

- (void)setSelectedConfiguration:(id)a3
{
}

- (HAPAudioStreamCodecConfiguration)selectedConfiguration
{
  return self->_selectedConfiguration;
}

- (void)setSupportedConfigurations:(id)a3
{
}

- (NSArray)supportedConfigurations
{
  return self->_supportedConfigurations;
}

- (void)setSiriInputType:(int64_t)a3
{
  self->_siriInputType = a3;
}

- (int64_t)siriInputType
{
  return self->_siriInputType;
}

@end