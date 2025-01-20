@interface HMDVideoCodecConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDVideoCodec)videoCodec;
- (HMDVideoCodecConfiguration)initWithCodec:(id)a3 codecParameters:(id)a4 attributes:(id)a5;
- (HMDVideoCodecConfiguration)initWithCoder:(id)a3;
- (HMDVideoCodecParameters)codecParameters;
- (NSArray)videoAttributes;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDVideoCodecConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAttributes, 0);
  objc_storeStrong((id *)&self->_codecParameters, 0);
  objc_storeStrong((id *)&self->_videoCodec, 0);
}

- (NSArray)videoAttributes
{
  return self->_videoAttributes;
}

- (HMDVideoCodecParameters)codecParameters
{
  return self->_codecParameters;
}

- (HMDVideoCodec)videoCodec
{
  return self->_videoCodec;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDVideoCodecConfiguration *)self videoCodec];
  [v4 encodeObject:v5 forKey:@"kVideoCodecConfiguration__CodecType"];

  v6 = [(HMDVideoCodecConfiguration *)self codecParameters];
  [v4 encodeObject:v6 forKey:@"kVideoCodecConfiguration__CodecParameters"];

  id v7 = [(HMDVideoCodecConfiguration *)self videoAttributes];
  [v4 encodeObject:v7 forKey:@"kVideoCodecConfiguration__Attributes"];
}

- (HMDVideoCodecConfiguration)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDVideoCodecConfiguration;
  v5 = [(HMDVideoCodecConfiguration *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v25[0] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kVideoCodecConfiguration__CodecType"];
    videoCodec = v5->_videoCodec;
    v5->_videoCodec = (HMDVideoCodec *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kVideoCodecConfiguration__CodecParameters"];
    codecParameters = v5->_codecParameters;
    v5->_codecParameters = (HMDVideoCodecParameters *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kVideoCodecConfiguration__Attributes"];
    videoAttributes = v5->_videoAttributes;
    v5->_videoAttributes = (NSArray *)v19;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDVideoCodecConfiguration *)self videoCodec];
  v10 = [v9 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ videoCodec = %@ ", v6, v10];

  v11 = [(HMDVideoCodecConfiguration *)self codecParameters];
  v12 = [v11 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ codecParameters = %@ ", v6, v12];

  id v14 = [(HMDVideoCodecConfiguration *)self videoAttributes];
  v13 = arrayToString(v14, v6);
  [v7 appendFormat:@"\n %@ attributes = %@ ", v6, v13];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = NSNumber;
  v5 = [(HMDVideoCodecConfiguration *)self videoCodec];
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "codecType"));
  [v3 addTLV:1 number:v6];

  id v7 = [(HMDVideoCodecConfiguration *)self codecParameters];
  v8 = [v7 tlvData];

  [v3 addTLV:2 data:v8];
  uint64_t v9 = [(HMDVideoCodecConfiguration *)self videoAttributes];
  v10 = [v9 objectAtIndex:0];
  v11 = [v10 tlvData];

  [v3 addTLV:3 data:v11];
  v12 = [v3 serialize];

  return (NSData *)v12;
}

- (BOOL)_parseFromTLVData
{
  v27[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35A58] wrappertlv:1 name:@"kVideoCodecConfiguration__CodecType"];
  id v4 = [MEMORY[0x263F35990] wrappertlv:2 name:@"kVideoCodecConfiguration__CodecParameters"];
  v5 = [MEMORY[0x263F358B8] wrappertlv:3 name:@"kVideoCodecConfiguration__Attributes" objectCreator:&__block_literal_global_296];
  v27[0] = v3;
  v27[1] = v4;
  v27[2] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  if ([(HAPTLVBase *)self _parse:v6])
  {
    id v7 = [HMDVideoCodec alloc];
    v8 = [v3 field];
    uint64_t v9 = -[HMDVideoCodec initWithCodec:](v7, "initWithCodec:", [v8 unsignedIntegerValue]);
    videoCodec = self->_videoCodec;
    self->_videoCodec = v9;

    v11 = [HMDVideoCodecParameters alloc];
    v12 = [v4 field];
    v13 = [(HAPTLVBase *)v11 initWithTLVData:v12];
    codecParameters = self->_codecParameters;
    self->_codecParameters = v13;

    v15 = [v5 field];
    videoAttributes = self->_videoAttributes;
    self->_videoAttributes = v15;

    BOOL v24 = checkForParseResult(1, v17, v18, v19, v20, v21, v22, v23, (uint64_t)self->_codecParameters, v26);
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

HMDVideoAttributes *__47__HMDVideoCodecConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(HAPTLVBase *)[HMDVideoAttributes alloc] initWithTLVData:v2];

  return v3;
}

- (HMDVideoCodecConfiguration)initWithCodec:(id)a3 codecParameters:(id)a4 attributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDVideoCodecConfiguration;
  v12 = [(HMDVideoCodecConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_videoCodec, a3);
    objc_storeStrong((id *)&v13->_codecParameters, a4);
    objc_storeStrong((id *)&v13->_videoAttributes, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end