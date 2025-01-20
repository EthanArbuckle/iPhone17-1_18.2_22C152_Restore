@interface HMDCameraRecordingSelectedConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingAudioCodecConfiguration)audioConfiguration;
- (HMDCameraRecordingGeneralConfiguration)generalConfiguration;
- (HMDCameraRecordingSelectedConfiguration)initWithCoder:(id)a3;
- (HMDCameraRecordingSelectedConfiguration)initWithGeneralConfiguration:(id)a3 videoCodecConfiguration:(id)a4 audioCodecConfiguration:(id)a5;
- (HMDCameraRecordingVideoCodecConfiguration)videoConfiguration;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingSelectedConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioConfiguration, 0);
  objc_storeStrong((id *)&self->_videoConfiguration, 0);
  objc_storeStrong((id *)&self->_generalConfiguration, 0);
}

- (HMDCameraRecordingAudioCodecConfiguration)audioConfiguration
{
  return self->_audioConfiguration;
}

- (HMDCameraRecordingVideoCodecConfiguration)videoConfiguration
{
  return self->_videoConfiguration;
}

- (HMDCameraRecordingGeneralConfiguration)generalConfiguration
{
  return self->_generalConfiguration;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingSelectedConfiguration *)self generalConfiguration];
  [v4 encodeObject:v5 forKey:@"kSelectedConfigurationGeneral"];

  v6 = [(HMDCameraRecordingSelectedConfiguration *)self videoConfiguration];
  [v4 encodeObject:v6 forKey:@"kSelectedConfigurationVideo"];

  id v7 = [(HMDCameraRecordingSelectedConfiguration *)self audioConfiguration];
  [v4 encodeObject:v7 forKey:@"kSelectedConfigurationAudio"];
}

- (HMDCameraRecordingSelectedConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCameraRecordingSelectedConfiguration;
  v5 = [(HMDCameraRecordingSelectedConfiguration *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSelectedConfigurationGeneral"];
    generalConfiguration = v5->_generalConfiguration;
    v5->_generalConfiguration = (HMDCameraRecordingGeneralConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSelectedConfigurationVideo"];
    videoConfiguration = v5->_videoConfiguration;
    v5->_videoConfiguration = (HMDCameraRecordingVideoCodecConfiguration *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSelectedConfigurationAudio"];
    audioConfiguration = v5->_audioConfiguration;
    v5->_audioConfiguration = (HMDCameraRecordingAudioCodecConfiguration *)v10;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n%@tlvDatablob = %@ ", v6, v8];

  v9 = [(HMDCameraRecordingSelectedConfiguration *)self generalConfiguration];
  uint64_t v10 = [v9 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n%@generalConfiguration = %@ ", v6, v10];

  v11 = [(HMDCameraRecordingSelectedConfiguration *)self videoConfiguration];
  v12 = [v11 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n%@videoConfiguration = %@ ", v6, v12];

  id v14 = [(HMDCameraRecordingSelectedConfiguration *)self audioConfiguration];
  objc_super v13 = [v14 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n%@audioConfiguration = %@ ", v6, v13];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = [(HMDCameraRecordingSelectedConfiguration *)self generalConfiguration];
  v5 = [v4 tlvData];
  [v3 addTLV:1 data:v5];

  id v6 = [(HMDCameraRecordingSelectedConfiguration *)self videoConfiguration];
  id v7 = [v6 tlvData];
  [v3 addTLV:2 data:v7];

  uint64_t v8 = [(HMDCameraRecordingSelectedConfiguration *)self audioConfiguration];
  v9 = [v8 tlvData];
  [v3 addTLV:3 data:v9];

  uint64_t v10 = [v3 serialize];

  return (NSData *)v10;
}

- (BOOL)_parseFromTLVData
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BD28] wrappertlv:1 name:@"kSelectedConfigurationGeneral"];
  id v4 = [MEMORY[0x1E4F5BD28] wrappertlv:2 name:@"kSelectedConfigurationVideo"];
  v5 = [MEMORY[0x1E4F5BD28] wrappertlv:3 name:@"kSelectedConfigurationAudio"];
  v21[0] = v3;
  v21[1] = v4;
  v21[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  BOOL v7 = [(HAPTLVBase *)self _parse:v6];
  if (v7)
  {
    uint64_t v8 = [HMDCameraRecordingGeneralConfiguration alloc];
    v9 = [v3 field];
    uint64_t v10 = [(HAPTLVBase *)v8 initWithTLVData:v9];
    generalConfiguration = self->_generalConfiguration;
    self->_generalConfiguration = v10;

    v12 = [HMDCameraRecordingVideoCodecConfiguration alloc];
    objc_super v13 = [v4 field];
    id v14 = [(HAPTLVBase *)v12 initWithTLVData:v13];
    videoConfiguration = self->_videoConfiguration;
    self->_videoConfiguration = v14;

    v16 = [HMDCameraRecordingAudioCodecConfiguration alloc];
    v17 = [v5 field];
    v18 = [(HAPTLVBase *)v16 initWithTLVData:v17];
    audioConfiguration = self->_audioConfiguration;
    self->_audioConfiguration = v18;
  }
  return v7;
}

- (HMDCameraRecordingSelectedConfiguration)initWithGeneralConfiguration:(id)a3 videoCodecConfiguration:(id)a4 audioCodecConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraRecordingSelectedConfiguration;
  v12 = [(HMDCameraRecordingSelectedConfiguration *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_generalConfiguration, a3);
    objc_storeStrong((id *)&v13->_videoConfiguration, a4);
    objc_storeStrong((id *)&v13->_audioConfiguration, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end