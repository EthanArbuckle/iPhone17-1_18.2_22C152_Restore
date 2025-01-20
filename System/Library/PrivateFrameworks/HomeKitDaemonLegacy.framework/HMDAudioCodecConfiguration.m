@interface HMDAudioCodecConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDAudioCodecConfiguration)initWithAudioCodecGroup:(id)a3 codecParameter:(id)a4;
- (HMDAudioCodecConfiguration)initWithCoder:(id)a3;
- (HMDAudioCodecGroup)codecGroup;
- (HMDAudioCodecParameters)audioCodecParameters;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAudioCodecConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioCodecParameters, 0);
  objc_storeStrong((id *)&self->_codecGroup, 0);
}

- (HMDAudioCodecParameters)audioCodecParameters
{
  return self->_audioCodecParameters;
}

- (HMDAudioCodecGroup)codecGroup
{
  return self->_codecGroup;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAudioCodecConfiguration *)self codecGroup];
  [v4 encodeObject:v5 forKey:@"kAudioCodecConfiguration__CodecGroupType"];

  id v6 = [(HMDAudioCodecConfiguration *)self audioCodecParameters];
  [v4 encodeObject:v6 forKey:@"kAudioCodecConfiguration__CodecParameters"];
}

- (HMDAudioCodecConfiguration)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDAudioCodecConfiguration;
  v5 = [(HMDAudioCodecConfiguration *)&v17 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kAudioCodecConfiguration__CodecGroupType"];
    codecGroup = v5->_codecGroup;
    v5->_codecGroup = (HMDAudioCodecGroup *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kAudioCodecConfiguration__CodecParameters"];
    audioCodecParameters = v5->_audioCodecParameters;
    v5->_audioCodecParameters = (HMDAudioCodecParameters *)v14;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDAudioCodecConfiguration *)self codecGroup];
  v10 = [v9 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ audiocodec = %@ ", v6, v10];

  id v12 = [(HMDAudioCodecConfiguration *)self audioCodecParameters];
  v11 = [v12 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ codecParameters = %@ ", v6, v11];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = NSNumber;
  v5 = [(HMDAudioCodecConfiguration *)self codecGroup];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "codec"));
  [v3 addTLV:1 number:v6];

  id v7 = [(HMDAudioCodecConfiguration *)self audioCodecParameters];
  v8 = [v7 tlvData];

  [v3 addTLV:2 data:v8];
  uint64_t v9 = [v3 serialize];

  return (NSData *)v9;
}

- (BOOL)_parseFromTLVData
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"kAudioCodecConfiguration__CodecGroupType"];
  id v4 = [MEMORY[0x1E4F5BD28] wrappertlv:2 name:@"kAudioCodecConfiguration__CodecParameters"];
  v23[0] = (uint64_t)v3;
  v23[1] = (uint64_t)v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  if ([(HAPTLVBase *)self _parse:v5])
  {
    id v6 = [HMDAudioCodecGroup alloc];
    id v7 = [v3 field];
    v8 = -[HMDAudioCodecGroup initWithAudioCodecGroup:](v6, "initWithAudioCodecGroup:", [v7 unsignedIntegerValue]);
    codecGroup = self->_codecGroup;
    self->_codecGroup = v8;

    v10 = [HMDAudioCodecParameters alloc];
    v11 = [v4 field];
    id v12 = [(HAPTLVBase *)v10 initWithTLVData:v11];
    audioCodecParameters = self->_audioCodecParameters;
    self->_audioCodecParameters = v12;

    BOOL v21 = checkForParseResult(1, v14, v15, v16, v17, v18, v19, v20, (uint64_t)self->_audioCodecParameters, v23[0]);
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (HMDAudioCodecConfiguration)initWithAudioCodecGroup:(id)a3 codecParameter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAudioCodecConfiguration;
  uint64_t v9 = [(HMDAudioCodecConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_codecGroup, a3);
    objc_storeStrong((id *)&v10->_audioCodecParameters, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end