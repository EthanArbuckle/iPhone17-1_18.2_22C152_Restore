@interface HMDCameraSupportedConfigurationCache
- (BOOL)isValid;
- (HMDSupportedAudioStreamConfiguration)supportedAudioStreamConfiguration;
- (HMDSupportedRTPConfiguration)supportedRTPConfiguration;
- (HMDSupportedVideoStreamConfiguration)supportedVideoStreamConfiguration;
- (void)setSupportedAudioStreamConfiguration:(id)a3;
- (void)setSupportedRTPConfiguration:(id)a3;
- (void)setSupportedVideoStreamConfiguration:(id)a3;
@end

@implementation HMDCameraSupportedConfigurationCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedRTPConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedAudioStreamConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedVideoStreamConfiguration, 0);
}

- (void)setSupportedRTPConfiguration:(id)a3
{
}

- (HMDSupportedRTPConfiguration)supportedRTPConfiguration
{
  return (HMDSupportedRTPConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSupportedAudioStreamConfiguration:(id)a3
{
}

- (HMDSupportedAudioStreamConfiguration)supportedAudioStreamConfiguration
{
  return (HMDSupportedAudioStreamConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSupportedVideoStreamConfiguration:(id)a3
{
}

- (HMDSupportedVideoStreamConfiguration)supportedVideoStreamConfiguration
{
  return (HMDSupportedVideoStreamConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isValid
{
  v3 = [(HMDCameraSupportedConfigurationCache *)self supportedVideoStreamConfiguration];
  if (v3)
  {
    v4 = [(HMDCameraSupportedConfigurationCache *)self supportedAudioStreamConfiguration];
    if (v4)
    {
      v5 = [(HMDCameraSupportedConfigurationCache *)self supportedRTPConfiguration];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end