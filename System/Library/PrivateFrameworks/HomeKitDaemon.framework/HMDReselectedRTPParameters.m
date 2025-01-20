@interface HMDReselectedRTPParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDReselectedRTPParameters)initWithCoder:(id)a3;
- (HMDReselectedRTPParameters)initWithMaximumBitrate:(id)a3 minimumBitrate:(id)a4 rtcpInterval:(id)a5;
- (NSData)tlvData;
- (NSNumber)maximumBitrate;
- (NSNumber)minimumBitrate;
- (NSNumber)rtcpInterval;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDReselectedRTPParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtcpInterval, 0);
  objc_storeStrong((id *)&self->_minimumBitrate, 0);
  objc_storeStrong((id *)&self->_maximumBitrate, 0);
}

- (NSNumber)rtcpInterval
{
  return self->_rtcpInterval;
}

- (NSNumber)minimumBitrate
{
  return self->_minimumBitrate;
}

- (NSNumber)maximumBitrate
{
  return self->_maximumBitrate;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDReselectedRTPParameters *)self minimumBitrate];
  [v4 encodeObject:v5 forKey:@"kRTPParameters_MinimumVideoBandwidth"];

  v6 = [(HMDReselectedRTPParameters *)self maximumBitrate];
  [v4 encodeObject:v6 forKey:@"kRTPParameters_MaximumVideoBandwidth"];

  id v7 = [(HMDReselectedRTPParameters *)self rtcpInterval];
  [v4 encodeObject:v7 forKey:@"kRTPParameters_RTCPInterval"];
}

- (HMDReselectedRTPParameters)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDReselectedRTPParameters;
  v5 = [(HMDReselectedRTPParameters *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v25[0] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kRTPParameters_MinimumVideoBandwidth"];
    minimumBitrate = v5->_minimumBitrate;
    v5->_minimumBitrate = (NSNumber *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kRTPParameters_MaximumVideoBandwidth"];
    maximumBitrate = v5->_maximumBitrate;
    v5->_maximumBitrate = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kRTPParameters_RTCPInterval"];
    rtcpInterval = v5->_rtcpInterval;
    v5->_rtcpInterval = (NSNumber *)v19;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDReselectedRTPParameters *)self minimumBitrate];
  [v7 appendFormat:@"\n %@ minimumBitrate = %@ ", v6, v9];

  v10 = [(HMDReselectedRTPParameters *)self maximumBitrate];
  [v7 appendFormat:@"\n %@ maximumBitrate = %@ ", v6, v10];

  id v11 = [(HMDReselectedRTPParameters *)self rtcpInterval];
  [v7 appendFormat:@"\n %@ rtcpInterval = %@ ", v6, v11];
}

- (BOOL)_parseFromTLVData
{
  v14[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35A58] wrappertlv:3 name:@"kRTPParameters_MinimumVideoBandwidth"];
  id v4 = [MEMORY[0x263F35A58] wrappertlv:4 name:@"kRTPParameters_RTCPInterval"];
  v14[0] = v3;
  v14[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  BOOL v6 = [(HAPTLVBase *)self _parse:v5];
  if (v6)
  {
    id v7 = [v3 field];
    uint64_t v8 = [v7 unsignedIntegerValue];

    uint64_t v9 = [NSNumber numberWithUnsignedInteger:1000 * v8];
    minimumBitrate = self->_minimumBitrate;
    self->_minimumBitrate = v9;

    id v11 = [v4 field];
    rtcpInterval = self->_rtcpInterval;
    self->_rtcpInterval = v11;
  }
  return v6;
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = [(HMDReselectedRTPParameters *)self minimumBitrate];
  unint64_t v5 = [v4 unsignedIntegerValue] / 0x3E8uLL;

  BOOL v6 = [NSNumber numberWithUnsignedInteger:v5];
  [v3 addTLV:3 length:2 number:v6];

  id v7 = [(HMDReselectedRTPParameters *)self rtcpInterval];
  [v3 addTLV:4 length:4 number:v7];

  uint64_t v8 = [v3 serialize];

  return (NSData *)v8;
}

- (HMDReselectedRTPParameters)initWithMaximumBitrate:(id)a3 minimumBitrate:(id)a4 rtcpInterval:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDReselectedRTPParameters;
  v12 = [(HMDReselectedRTPParameters *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_maximumBitrate, a3);
    objc_storeStrong((id *)&v13->_minimumBitrate, a4);
    objc_storeStrong((id *)&v13->_rtcpInterval, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end