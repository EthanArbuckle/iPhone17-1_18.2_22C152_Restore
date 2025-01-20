@interface HMDCameraRecordingVideoCodecConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingVideoCodec)codec;
- (HMDCameraRecordingVideoCodecConfiguration)initWithCodec:(id)a3 codecParameters:(id)a4 videoAttributes:(id)a5;
- (HMDCameraRecordingVideoCodecConfiguration)initWithCoder:(id)a3;
- (HMDCameraRecordingVideoCodecParameters)parameters;
- (NSArray)videoAttributes;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingVideoCodecConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAttributes, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_codec, 0);
}

- (NSArray)videoAttributes
{
  return self->_videoAttributes;
}

- (HMDCameraRecordingVideoCodecParameters)parameters
{
  return self->_parameters;
}

- (HMDCameraRecordingVideoCodec)codec
{
  return self->_codec;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingVideoCodecConfiguration *)self codec];
  [v4 encodeObject:v5 forKey:@"VideoCodecConfigurationCodec"];

  v6 = [(HMDCameraRecordingVideoCodecConfiguration *)self parameters];
  [v4 encodeObject:v6 forKey:@"VideoCodecConfigurationCodecParameters"];

  id v7 = [(HMDCameraRecordingVideoCodecConfiguration *)self videoAttributes];
  [v4 encodeObject:v7 forKey:@"VideoCodecConfigurationAttributes"];
}

- (HMDCameraRecordingVideoCodecConfiguration)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraRecordingVideoCodecConfiguration;
  v5 = [(HMDCameraRecordingVideoCodecConfiguration *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VideoCodecConfigurationCodec"];
    codec = v5->_codec;
    v5->_codec = (HMDCameraRecordingVideoCodec *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VideoCodecConfigurationCodecParameters"];
    parameters = v5->_parameters;
    v5->_parameters = (HMDCameraRecordingVideoCodecParameters *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"VideoCodecConfigurationAttributes"];
    videoAttributes = v5->_videoAttributes;
    v5->_videoAttributes = (NSArray *)v13;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n%@tlvDatablob = %@ ", v6, v8];

  v9 = [(HMDCameraRecordingVideoCodecConfiguration *)self codec];
  v10 = [v9 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n%@codec = %@ ", v6, v10];

  v11 = [(HMDCameraRecordingVideoCodecConfiguration *)self parameters];
  v12 = [v11 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n%@parameters = %@ ", v6, v12];

  id v15 = [(HMDCameraRecordingVideoCodecConfiguration *)self videoAttributes];
  uint64_t v13 = [v6 indentationByLevels:1];
  v14 = HAPTLVCreateParseArrayToString();
  [v7 appendFormat:@"\n%@attributes = %@ ", v6, v14];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = NSNumber;
  v5 = [(HMDCameraRecordingVideoCodecConfiguration *)self codec];
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "type"));
  [v3 addTLV:1 length:1 number:v6];

  id v7 = [(HMDCameraRecordingVideoCodecConfiguration *)self parameters];
  uint64_t v8 = [v7 tlvData];

  [v3 addTLV:2 data:v8];
  v9 = [(HMDCameraRecordingVideoCodecConfiguration *)self videoAttributes];
  v10 = [v9 firstObject];
  v11 = [v10 tlvData];

  [v3 addTLV:3 data:v11];
  v12 = [v3 serialize];

  return (NSData *)v12;
}

- (BOOL)_parseFromTLVData
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"VideoCodecConfigurationCodec"];
  id v4 = [MEMORY[0x1E4F5BD28] wrappertlv:2 name:@"VideoCodecConfigurationCodecParameters"];
  v5 = [MEMORY[0x1E4F5BC58] wrappertlv:3 name:@"VideoCodecConfigurationAttributes" objectCreator:&__block_literal_global_295];
  v19[0] = v3;
  v19[1] = v4;
  v19[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  BOOL v7 = [(HAPTLVBase *)self _parse:v6];
  if (v7)
  {
    uint64_t v8 = [HMDCameraRecordingVideoCodec alloc];
    v9 = [v3 field];
    v10 = -[HMDCameraRecordingVideoCodec initWithCodec:](v8, "initWithCodec:", [v9 integerValue]);
    codec = self->_codec;
    self->_codec = v10;

    v12 = [HMDCameraRecordingVideoCodecParameters alloc];
    uint64_t v13 = [v4 field];
    v14 = [(HAPTLVBase *)v12 initWithTLVData:v13];
    parameters = self->_parameters;
    self->_parameters = v14;

    objc_super v16 = [v5 field];
    videoAttributes = self->_videoAttributes;
    self->_videoAttributes = v16;
  }
  return v7;
}

HMDCameraRecordingVideoAttributes *__62__HMDCameraRecordingVideoCodecConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(HAPTLVBase *)[HMDCameraRecordingVideoAttributes alloc] initWithTLVData:v2];

  return v3;
}

- (HMDCameraRecordingVideoCodecConfiguration)initWithCodec:(id)a3 codecParameters:(id)a4 videoAttributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraRecordingVideoCodecConfiguration;
  v12 = [(HMDCameraRecordingVideoCodecConfiguration *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_codec, a3);
    objc_storeStrong((id *)&v13->_parameters, a4);
    objc_storeStrong((id *)&v13->_videoAttributes, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end