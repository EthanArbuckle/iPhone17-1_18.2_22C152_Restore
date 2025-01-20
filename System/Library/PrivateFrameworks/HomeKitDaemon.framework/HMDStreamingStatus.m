@interface HMDStreamingStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDStreamingStatus)initWithCoder:(id)a3;
- (NSData)tlvData;
- (unint64_t)streamingStatus;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDStreamingStatus

- (unint64_t)streamingStatus
{
  return self->_streamingStatus;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[HMDStreamingStatus streamingStatus](self, "streamingStatus"), @"kStreamingStatus_Status");
}

- (HMDStreamingStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDStreamingStatus;
  v5 = [(HMDStreamingStatus *)&v7 init];
  if (v5) {
    v5->_streamingStatus = (int)[v4 decodeInt32ForKey:@"kStreamingStatus_Status"];
  }

  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  HMDStreamingStatusTypeAsString([(HMDStreamingStatus *)self streamingStatus]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 appendFormat:@"\n %@ responseStatus = %@ ", v6, v8];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDStreamingStatus streamingStatus](self, "streamingStatus"));
  [v3 addTLV:1 number:v4];

  v5 = [v3 serialize];

  return (NSData *)v5;
}

- (BOOL)_parseFromTLVData
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35A58] wrappertlv:1 name:@"kStreamingStatus_Status"];
  v8[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  BOOL v5 = [(HAPTLVBase *)self _parse:v4];
  if (v5)
  {
    id v6 = [v3 field];
    self->_streamingStatus = [v6 unsignedIntegerValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end