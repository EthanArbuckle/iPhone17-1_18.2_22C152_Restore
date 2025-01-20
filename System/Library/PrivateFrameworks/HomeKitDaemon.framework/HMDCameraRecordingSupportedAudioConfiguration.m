@interface HMDCameraRecordingSupportedAudioConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingSupportedAudioConfiguration)initWithCodecConfigurations:(id)a3;
- (HMDCameraRecordingSupportedAudioConfiguration)initWithCoder:(id)a3;
- (NSArray)codecConfigurations;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingSupportedAudioConfiguration

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
  id v5 = [(HMDCameraRecordingSupportedAudioConfiguration *)self codecConfigurations];
  [v4 encodeObject:v5 forKey:@"kSupportedAudioConfigurationCodecConfigurations"];
}

- (HMDCameraRecordingSupportedAudioConfiguration)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingSupportedAudioConfiguration;
  id v5 = [(HMDCameraRecordingSupportedAudioConfiguration *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSupportedAudioConfigurationCodecConfigurations"];
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

  id v10 = [(HMDCameraRecordingSupportedAudioConfiguration *)self codecConfigurations];
  uint64_t v9 = HAPTLVCreateParseArrayToString();
  [v7 appendFormat:@"\n%@codecConfigurations = %@ ", v6, v9];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = [(HMDCameraRecordingSupportedAudioConfiguration *)self codecConfigurations];
  id v5 = [v4 firstObject];
  id v6 = [v5 tlvData];

  [v3 addTLV:1 data:v6];
  id v7 = [v3 serialize];

  return (NSData *)v7;
}

- (BOOL)_parseFromTLVData
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F358B8] wrappertlv:1 name:@"kSupportedAudioConfigurationCodecConfigurations" objectCreator:&__block_literal_global_209];
  v9[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  BOOL v5 = [(HAPTLVBase *)self _parse:v4];
  if (v5)
  {
    id v6 = [v3 field];
    codecConfigurations = self->_codecConfigurations;
    self->_codecConfigurations = v6;
  }
  return v5;
}

HMDCameraRecordingAudioCodecConfiguration *__66__HMDCameraRecordingSupportedAudioConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(HAPTLVBase *)[HMDCameraRecordingAudioCodecConfiguration alloc] initWithTLVData:v2];

  return v3;
}

- (HMDCameraRecordingSupportedAudioConfiguration)initWithCodecConfigurations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingSupportedAudioConfiguration;
  id v6 = [(HMDCameraRecordingSupportedAudioConfiguration *)&v9 init];
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