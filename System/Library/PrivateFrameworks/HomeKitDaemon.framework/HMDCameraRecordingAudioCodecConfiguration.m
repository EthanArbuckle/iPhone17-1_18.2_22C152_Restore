@interface HMDCameraRecordingAudioCodecConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingAudioCodec)codec;
- (HMDCameraRecordingAudioCodecConfiguration)initWithAudioCodec:(id)a3 codecParameters:(id)a4;
- (HMDCameraRecordingAudioCodecConfiguration)initWithCoder:(id)a3;
- (HMDCameraRecordingAudioCodecParameters)parameters;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingAudioCodecConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_codec, 0);
}

- (HMDCameraRecordingAudioCodecParameters)parameters
{
  return self->_parameters;
}

- (HMDCameraRecordingAudioCodec)codec
{
  return self->_codec;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingAudioCodecConfiguration *)self codec];
  [v4 encodeObject:v5 forKey:@"kAudioCodecConfigurationCodec"];

  id v6 = [(HMDCameraRecordingAudioCodecConfiguration *)self parameters];
  [v4 encodeObject:v6 forKey:@"kAudioCodecConfigurationCodecParameters"];
}

- (HMDCameraRecordingAudioCodecConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraRecordingAudioCodecConfiguration;
  v5 = [(HMDCameraRecordingAudioCodecConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAudioCodecConfigurationCodec"];
    codec = v5->_codec;
    v5->_codec = (HMDCameraRecordingAudioCodec *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAudioCodecConfigurationCodecParameters"];
    parameters = v5->_parameters;
    v5->_parameters = (HMDCameraRecordingAudioCodecParameters *)v8;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n%@tlvDatablob = %@ ", v6, v8];

  v9 = [(HMDCameraRecordingAudioCodecConfiguration *)self codec];
  v10 = [v9 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n%@codec = %@ ", v6, v10];

  id v12 = [(HMDCameraRecordingAudioCodecConfiguration *)self parameters];
  objc_super v11 = [v12 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n%@parameters = %@", v6, v11];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = NSNumber;
  v5 = [(HMDCameraRecordingAudioCodecConfiguration *)self codec];
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "type"));
  [v3 addTLV:1 length:1 number:v6];

  id v7 = [(HMDCameraRecordingAudioCodecConfiguration *)self parameters];
  uint64_t v8 = [v7 tlvData];

  [v3 addTLV:2 data:v8];
  v9 = [v3 serialize];

  return (NSData *)v9;
}

- (BOOL)_parseFromTLVData
{
  v16[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35A58] wrappertlv:1 name:@"kAudioCodecConfigurationCodec"];
  id v4 = [MEMORY[0x263F35990] wrappertlv:2 name:@"kAudioCodecConfigurationCodecParameters"];
  v16[0] = v3;
  v16[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  BOOL v6 = [(HAPTLVBase *)self _parse:v5];
  if (v6)
  {
    id v7 = [HMDCameraRecordingAudioCodec alloc];
    uint64_t v8 = [v3 field];
    v9 = -[HMDCameraRecordingAudioCodec initWithCodec:](v7, "initWithCodec:", [v8 integerValue]);
    codec = self->_codec;
    self->_codec = v9;

    objc_super v11 = [HMDCameraRecordingAudioCodecParameters alloc];
    id v12 = [v4 field];
    v13 = [(HAPTLVBase *)v11 initWithTLVData:v12];
    parameters = self->_parameters;
    self->_parameters = v13;
  }
  return v6;
}

- (HMDCameraRecordingAudioCodecConfiguration)initWithAudioCodec:(id)a3 codecParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingAudioCodecConfiguration;
  v9 = [(HMDCameraRecordingAudioCodecConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_codec, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end