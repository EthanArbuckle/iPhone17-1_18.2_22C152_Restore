@interface HMDCameraProtocolParameters
+ (BOOL)supportsSecureCoding;
- (HMDCameraProtocolParameters)initWithCoder:(id)a3;
- (HMDReselectedStreamConfigurationWrite)reselectedStreamConfigurationWrite;
- (HMDSelectedStreamConfigurationWrite)selectedStreamConfigurationWrite;
- (HMDSetupEndPointRead)setupEndPointRead;
- (HMDSetupEndPointWrite)setupEndPointWrite;
- (HMDSupportedAudioStreamConfiguration)supportedAudioStreamConfiguration;
- (HMDSupportedRTPConfiguration)supportedRTPConfiguration;
- (HMDSupportedVideoStreamConfiguration)supportedVideoStreamConfiguration;
- (void)encodeWithCoder:(id)a3;
- (void)setReselectedStreamConfigurationWrite:(id)a3;
- (void)setSelectedStreamConfigurationWrite:(id)a3;
- (void)setSetupEndPointRead:(id)a3;
- (void)setSetupEndPointWrite:(id)a3;
- (void)setSupportedAudioStreamConfiguration:(id)a3;
- (void)setSupportedRTPConfiguration:(id)a3;
- (void)setSupportedVideoStreamConfiguration:(id)a3;
@end

@implementation HMDCameraProtocolParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reselectedStreamConfigurationWrite, 0);
  objc_storeStrong((id *)&self->_selectedStreamConfigurationWrite, 0);
  objc_storeStrong((id *)&self->_setupEndPointWrite, 0);
  objc_storeStrong((id *)&self->_setupEndPointRead, 0);
  objc_storeStrong((id *)&self->_supportedRTPConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedAudioStreamConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedVideoStreamConfiguration, 0);
}

- (void)setReselectedStreamConfigurationWrite:(id)a3
{
}

- (HMDReselectedStreamConfigurationWrite)reselectedStreamConfigurationWrite
{
  return self->_reselectedStreamConfigurationWrite;
}

- (void)setSelectedStreamConfigurationWrite:(id)a3
{
}

- (HMDSelectedStreamConfigurationWrite)selectedStreamConfigurationWrite
{
  return self->_selectedStreamConfigurationWrite;
}

- (void)setSetupEndPointWrite:(id)a3
{
}

- (HMDSetupEndPointWrite)setupEndPointWrite
{
  return self->_setupEndPointWrite;
}

- (void)setSetupEndPointRead:(id)a3
{
}

- (HMDSetupEndPointRead)setupEndPointRead
{
  return self->_setupEndPointRead;
}

- (void)setSupportedRTPConfiguration:(id)a3
{
}

- (HMDSupportedRTPConfiguration)supportedRTPConfiguration
{
  return self->_supportedRTPConfiguration;
}

- (void)setSupportedAudioStreamConfiguration:(id)a3
{
}

- (HMDSupportedAudioStreamConfiguration)supportedAudioStreamConfiguration
{
  return self->_supportedAudioStreamConfiguration;
}

- (void)setSupportedVideoStreamConfiguration:(id)a3
{
}

- (HMDSupportedVideoStreamConfiguration)supportedVideoStreamConfiguration
{
  return self->_supportedVideoStreamConfiguration;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraProtocolParameters *)self setupEndPointRead];
  [v4 encodeObject:v5 forKey:@"kHMDSetupEndPointReadKey"];

  v6 = [(HMDCameraProtocolParameters *)self setupEndPointWrite];
  [v4 encodeObject:v6 forKey:@"kHMDSetupEndPointWriteKey"];

  v7 = [(HMDCameraProtocolParameters *)self selectedStreamConfigurationWrite];
  [v4 encodeObject:v7 forKey:@"kHMDSelectedStreamConfigurationWriteKey"];

  id v8 = [(HMDCameraProtocolParameters *)self reselectedStreamConfigurationWrite];
  [v4 encodeObject:v8 forKey:@"kHMDReselectedStreamConfigurationWriteKey"];
}

- (HMDCameraProtocolParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraProtocolParameters;
  v5 = [(HMDCameraProtocolParameters *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHMDSetupEndPointReadKey"];
    setupEndPointRead = v5->_setupEndPointRead;
    v5->_setupEndPointRead = (HMDSetupEndPointRead *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHMDSetupEndPointWriteKey"];
    setupEndPointWrite = v5->_setupEndPointWrite;
    v5->_setupEndPointWrite = (HMDSetupEndPointWrite *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHMDSelectedStreamConfigurationWriteKey"];
    selectedStreamConfigurationWrite = v5->_selectedStreamConfigurationWrite;
    v5->_selectedStreamConfigurationWrite = (HMDSelectedStreamConfigurationWrite *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHMDReselectedStreamConfigurationWriteKey"];
    reselectedStreamConfigurationWrite = v5->_reselectedStreamConfigurationWrite;
    v5->_reselectedStreamConfigurationWrite = (HMDReselectedStreamConfigurationWrite *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end