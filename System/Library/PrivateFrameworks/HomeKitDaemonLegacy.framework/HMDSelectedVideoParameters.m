@interface HMDSelectedVideoParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDSelectedRTPParameters)rtpParameters;
- (HMDSelectedVideoParameters)initWithCodec:(id)a3 codecParameter:(id)a4 attribute:(id)a5 rtpParameter:(id)a6;
- (HMDSelectedVideoParameters)initWithCoder:(id)a3;
- (HMDVideoAttributes)videoAttributes;
- (HMDVideoCodec)codec;
- (HMDVideoCodecParameters)codecParameters;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSelectedVideoParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpParameters, 0);
  objc_storeStrong((id *)&self->_videoAttributes, 0);
  objc_storeStrong((id *)&self->_codecParameters, 0);
  objc_storeStrong((id *)&self->_codec, 0);
}

- (HMDSelectedRTPParameters)rtpParameters
{
  return self->_rtpParameters;
}

- (HMDVideoAttributes)videoAttributes
{
  return self->_videoAttributes;
}

- (HMDVideoCodecParameters)codecParameters
{
  return self->_codecParameters;
}

- (HMDVideoCodec)codec
{
  return self->_codec;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSelectedVideoParameters *)self codec];
  [v4 encodeObject:v5 forKey:@"kVideoParameters_Codec"];

  v6 = [(HMDSelectedVideoParameters *)self codecParameters];
  [v4 encodeObject:v6 forKey:@"kVideoParameters_CodecParameters"];

  v7 = [(HMDSelectedVideoParameters *)self videoAttributes];
  [v4 encodeObject:v7 forKey:@"kVideoParameters_Attributes"];

  id v8 = [(HMDSelectedVideoParameters *)self rtpParameters];
  [v4 encodeObject:v8 forKey:@"kVideoParameters_RTPParameter"];
}

- (HMDSelectedVideoParameters)initWithCoder:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMDSelectedVideoParameters;
  v5 = [(HMDSelectedVideoParameters *)&v27 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v31[0] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kVideoParameters_Codec"];
    codec = v5->_codec;
    v5->_codec = (HMDVideoCodec *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kVideoParameters_CodecParameters"];
    codecParameters = v5->_codecParameters;
    v5->_codecParameters = (HMDVideoCodecParameters *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kVideoParameters_Attributes"];
    videoAttributes = v5->_videoAttributes;
    v5->_videoAttributes = (HMDVideoAttributes *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    v23 = [v21 setWithArray:v22];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"kVideoParameters_RTPParameter"];
    rtpParameters = v5->_rtpParameters;
    v5->_rtpParameters = (HMDSelectedRTPParameters *)v24;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDSelectedVideoParameters *)self codec];
  [v7 appendFormat:@"\n %@ videocodec = %@ ", v6, v9];

  v10 = [(HMDSelectedVideoParameters *)self codecParameters];
  v11 = [v10 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ codecParameters = %@ ", v6, v11];

  v12 = [(HMDSelectedVideoParameters *)self videoAttributes];
  v13 = [v12 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ attributes = %@ ", v6, v13];

  id v15 = [(HMDSelectedVideoParameters *)self rtpParameters];
  uint64_t v14 = [v15 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ rtpParameters = %@ ", v6, v14];
}

- (BOOL)_parseFromTLVData
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"kVideoParameters_Codec"];
  id v4 = [MEMORY[0x1E4F5BD28] wrappertlv:2 name:@"kVideoParameters_CodecParameters"];
  v5 = [MEMORY[0x1E4F5BD28] wrappertlv:3 name:@"kVideoParameters_Attributes"];
  id v6 = [MEMORY[0x1E4F5BD28] wrappertlv:4 name:@"kVideoParameters_RTPParameter"];
  v33[0] = v3;
  v33[1] = v4;
  v33[2] = v5;
  v33[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  if ([(HAPTLVBase *)self _parse:v7])
  {
    id v8 = [HMDVideoCodec alloc];
    uint64_t v9 = [v3 field];
    v10 = -[HMDVideoCodec initWithCodec:](v8, "initWithCodec:", [v9 unsignedIntegerValue]);
    codec = self->_codec;
    self->_codec = v10;

    v12 = [HMDVideoCodecParameters alloc];
    v13 = [v4 field];
    uint64_t v14 = [(HAPTLVBase *)v12 initWithTLVData:v13];
    codecParameters = self->_codecParameters;
    self->_codecParameters = v14;

    v16 = [HMDVideoAttributes alloc];
    v17 = [v5 field];
    v18 = [(HAPTLVBase *)v16 initWithTLVData:v17];
    videoAttributes = self->_videoAttributes;
    self->_videoAttributes = v18;

    v20 = [HMDSelectedRTPParameters alloc];
    v21 = [v6 field];
    v22 = [(HAPTLVBase *)v20 initWithTLVData:v21];
    rtpParameters = self->_rtpParameters;
    self->_rtpParameters = v22;

    BOOL v31 = checkForParseResult(3, v24, v25, v26, v27, v28, v29, v30, (uint64_t)self->_codecParameters, (uint64_t)self->_videoAttributes);
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = NSNumber;
  v5 = [(HMDSelectedVideoParameters *)self codec];
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "codecType"));
  [v3 addTLV:1 number:v6];

  id v7 = [(HMDSelectedVideoParameters *)self codecParameters];
  id v8 = [v7 tlvData];

  [v3 addTLV:2 data:v8];
  uint64_t v9 = [(HMDSelectedVideoParameters *)self videoAttributes];
  v10 = [v9 tlvData];

  [v3 addTLV:3 data:v10];
  v11 = [(HMDSelectedVideoParameters *)self rtpParameters];
  v12 = [v11 tlvData];

  [v3 addTLV:4 data:v12];
  v13 = [v3 serialize];

  return (NSData *)v13;
}

- (HMDSelectedVideoParameters)initWithCodec:(id)a3 codecParameter:(id)a4 attribute:(id)a5 rtpParameter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDSelectedVideoParameters;
  id v15 = [(HMDSelectedVideoParameters *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_codec, a3);
    objc_storeStrong((id *)&v16->_codecParameters, a4);
    objc_storeStrong((id *)&v16->_videoAttributes, a5);
    objc_storeStrong((id *)&v16->_rtpParameters, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end