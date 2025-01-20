@interface HMDCameraRecordingSupportedVideoConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingSupportedVideoConfiguration)initWithCodecConfigurations:(id)a3;
- (HMDCameraRecordingSupportedVideoConfiguration)initWithCoder:(id)a3;
- (NSArray)codecConfigurations;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingSupportedVideoConfiguration

- (void).cxx_destruct
{
}

- (NSArray)codecConfigurations
{
  return self->_codecConfigurations;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraRecordingSupportedVideoConfiguration *)self codecConfigurations];
  [v4 encodeObject:v5 forKey:@"kSupportedVideoConfigurationCodecConfigurations"];
}

- (HMDCameraRecordingSupportedVideoConfiguration)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingSupportedVideoConfiguration;
  id v5 = [(HMDCameraRecordingSupportedVideoConfiguration *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSupportedVideoConfigurationCodecConfigurations"];
    codecConfigurations = v5->_codecConfigurations;
    v5->_codecConfigurations = (NSArray *)v9;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n%@tlvDatablob = %@ ", v6, v8];

  id v10 = [(HMDCameraRecordingSupportedVideoConfiguration *)self codecConfigurations];
  uint64_t v9 = HAPTLVCreateParseArrayToString();
  [v7 appendFormat:@"\n%@codecConfigurations = %@ ", v6, v9];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = [(HMDCameraRecordingSupportedVideoConfiguration *)self codecConfigurations];
  id v5 = [v4 firstObject];
  id v6 = [v5 tlvData];

  [v3 addTLV:1 data:v6];
  id v7 = [v3 serialize];

  return (NSData *)v7;
}

- (BOOL)_parseFromTLVData
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BC58] wrappertlv:1 name:@"kSupportedVideoConfigurationCodecConfigurations" objectCreator:&__block_literal_global_333_135472];
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  BOOL v5 = [(HAPTLVBase *)self _parse:v4];
  if (v5)
  {
    id v6 = [v3 field];
    codecConfigurations = self->_codecConfigurations;
    self->_codecConfigurations = v6;
  }
  return v5;
}

HMDCameraRecordingVideoCodecConfiguration *__66__HMDCameraRecordingSupportedVideoConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(HAPTLVBase *)[HMDCameraRecordingVideoCodecConfiguration alloc] initWithTLVData:v2];

  return v3;
}

- (HMDCameraRecordingSupportedVideoConfiguration)initWithCodecConfigurations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingSupportedVideoConfiguration;
  id v6 = [(HMDCameraRecordingSupportedVideoConfiguration *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_codecConfigurations, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end