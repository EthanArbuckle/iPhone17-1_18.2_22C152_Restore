@interface HMDReselectedVideoParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDReselectedRTPParameters)rtpParameters;
- (HMDReselectedVideoParameters)initWithAttribute:(id)a3 rtpParameter:(id)a4;
- (HMDReselectedVideoParameters)initWithCoder:(id)a3;
- (HMDVideoAttributes)videoAttributes;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDReselectedVideoParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpParameters, 0);
  objc_storeStrong((id *)&self->_videoAttributes, 0);
}

- (HMDReselectedRTPParameters)rtpParameters
{
  return self->_rtpParameters;
}

- (HMDVideoAttributes)videoAttributes
{
  return self->_videoAttributes;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDReselectedVideoParameters *)self videoAttributes];
  [v4 encodeObject:v5 forKey:@"kVideoParameters_Attributes"];

  id v6 = [(HMDReselectedVideoParameters *)self rtpParameters];
  [v4 encodeObject:v6 forKey:@"kVideoParameters_RTPParameter"];
}

- (HMDReselectedVideoParameters)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDReselectedVideoParameters;
  v5 = [(HMDReselectedVideoParameters *)&v17 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kVideoParameters_Attributes"];
    videoAttributes = v5->_videoAttributes;
    v5->_videoAttributes = (HMDVideoAttributes *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kVideoParameters_RTPParameter"];
    rtpParameters = v5->_rtpParameters;
    v5->_rtpParameters = (HMDReselectedRTPParameters *)v14;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDReselectedVideoParameters *)self videoAttributes];
  v10 = [v9 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ attributes = %@ ", v6, v10];

  id v12 = [(HMDReselectedVideoParameters *)self rtpParameters];
  v11 = [v12 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ rtpParameters = %@ ", v6, v11];
}

- (BOOL)_parseFromTLVData
{
  v23[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35990] wrappertlv:3 name:@"kVideoParameters_Attributes"];
  id v4 = [MEMORY[0x263F35990] wrappertlv:4 name:@"kVideoParameters_RTPParameter"];
  v23[0] = v3;
  v23[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  if ([(HAPTLVBase *)self _parse:v5])
  {
    id v6 = [HMDVideoAttributes alloc];
    id v7 = [v3 field];
    v8 = [(HAPTLVBase *)v6 initWithTLVData:v7];
    videoAttributes = self->_videoAttributes;
    self->_videoAttributes = v8;

    v10 = [HMDReselectedRTPParameters alloc];
    v11 = [v4 field];
    id v12 = [(HAPTLVBase *)v10 initWithTLVData:v11];
    rtpParameters = self->_rtpParameters;
    self->_rtpParameters = v12;

    BOOL v21 = checkForParseResult(2, v14, v15, v16, v17, v18, v19, v20, (uint64_t)self->_videoAttributes, (uint64_t)self->_rtpParameters);
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = [(HMDReselectedVideoParameters *)self videoAttributes];
  v5 = [v4 tlvData];

  [v3 addTLV:3 data:v5];
  id v6 = [(HMDReselectedVideoParameters *)self rtpParameters];
  id v7 = [v6 tlvData];

  [v3 addTLV:4 data:v7];
  v8 = [v3 serialize];

  return (NSData *)v8;
}

- (HMDReselectedVideoParameters)initWithAttribute:(id)a3 rtpParameter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDReselectedVideoParameters;
  uint64_t v9 = [(HMDReselectedVideoParameters *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoAttributes, a3);
    objc_storeStrong((id *)&v10->_rtpParameters, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end