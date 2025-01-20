@interface HMDEndPointAddress
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (BOOL)isCompatibleWithRemoteEndPointAddress:(id)a3;
- (BOOL)isIPv6Address;
- (HMDEndPointAddress)initWithCoder:(id)a3;
- (HMDEndPointAddress)initWithIPAddress:(id)a3 isIPv6Address:(BOOL)a4 videoRTPPort:(id)a5 audioRTPPort:(id)a6;
- (NSData)tlvData;
- (NSNumber)audioRTPPort;
- (NSNumber)videoRTPPort;
- (NSString)ipAddress;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDEndPointAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRTPPort, 0);
  objc_storeStrong((id *)&self->_videoRTPPort, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
}

- (NSNumber)audioRTPPort
{
  return self->_audioRTPPort;
}

- (NSNumber)videoRTPPort
{
  return self->_videoRTPPort;
}

- (BOOL)isIPv6Address
{
  return self->_isIPv6Address;
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEndPointAddress *)self ipAddress];
  [v4 encodeObject:v5 forKey:@"kStreamManagementControlPoint__ControllerAddress__IPAddress"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HMDEndPointAddress isIPv6Address](self, "isIPv6Address"), @"kStreamManagementControlPoint__ControllerAddress__IPAddressVersion");
  v6 = [(HMDEndPointAddress *)self videoRTPPort];
  [v4 encodeObject:v6 forKey:@"kStreamManagementControlPoint__ControllerAddress__VideoRTPPort"];

  id v7 = [(HMDEndPointAddress *)self audioRTPPort];
  [v4 encodeObject:v7 forKey:@"kStreamManagementControlPoint__ControllerAddress__AudioRTPPort"];
}

- (HMDEndPointAddress)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDEndPointAddress;
  v5 = [(HMDEndPointAddress *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v25[0] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kStreamManagementControlPoint__ControllerAddress__IPAddress"];
    ipAddress = v5->_ipAddress;
    v5->_ipAddress = (NSString *)v9;

    v5->_isIPv6Address = [v4 decodeBoolForKey:@"kStreamManagementControlPoint__ControllerAddress__IPAddressVersion"];
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kStreamManagementControlPoint__ControllerAddress__VideoRTPPort"];
    videoRTPPort = v5->_videoRTPPort;
    v5->_videoRTPPort = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kStreamManagementControlPoint__ControllerAddress__AudioRTPPort"];
    audioRTPPort = v5->_audioRTPPort;
    v5->_audioRTPPort = (NSNumber *)v19;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDEndPointAddress *)self ipAddress];
  [v7 appendFormat:@"\n %@ ipAddress = %@ ", v6, v9];

  [(HMDEndPointAddress *)self isIPv6Address];
  v10 = HMFBooleanToString();
  [v7 appendFormat:@"\n %@ isIPv6Address = %@ ", v6, v10];

  v11 = [(HMDEndPointAddress *)self videoRTPPort];
  [v7 appendFormat:@"\n %@ videoRTPPort = %@ ", v6, v11];

  id v12 = [(HMDEndPointAddress *)self audioRTPPort];
  [v7 appendFormat:@"\n %@ audioRTPPort = %@ ", v6, v12];
}

- (BOOL)_parseFromTLVData
{
  v17[4] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35AA8] wrappertlv:2 name:@"kStreamManagementControlPoint__ControllerAddress__IPAddress"];
  id v4 = [MEMORY[0x263F35A58] wrappertlv:1 name:@"kStreamManagementControlPoint__ControllerAddress__IPAddressVersion"];
  v5 = [MEMORY[0x263F35A58] wrappertlv:3 name:@"kStreamManagementControlPoint__ControllerAddress__VideoRTPPort"];
  id v6 = [MEMORY[0x263F35A58] wrappertlv:4 name:@"kStreamManagementControlPoint__ControllerAddress__AudioRTPPort"];
  v17[0] = v3;
  v17[1] = v4;
  v17[2] = v5;
  v17[3] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  BOOL v8 = [(HAPTLVBase *)self _parse:v7];
  if (v8)
  {
    uint64_t v9 = [v3 field];
    ipAddress = self->_ipAddress;
    self->_ipAddress = v9;

    v11 = [v4 field];
    self->_isIPv6Address = [v11 BOOLValue];

    id v12 = [v5 field];
    videoRTPPort = self->_videoRTPPort;
    self->_videoRTPPort = v12;

    uint64_t v14 = [v6 field];
    audioRTPPort = self->_audioRTPPort;
    self->_audioRTPPort = v14;
  }
  return v8;
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEndPointAddress isIPv6Address](self, "isIPv6Address"));
  [v3 addTLV:1 number:v4];

  v5 = [(HMDEndPointAddress *)self ipAddress];
  [v3 addTLV:2 string:v5];

  id v6 = [(HMDEndPointAddress *)self videoRTPPort];
  [v3 addTLV:3 length:2 number:v6];

  id v7 = [(HMDEndPointAddress *)self audioRTPPort];
  [v3 addTLV:4 length:2 number:v7];

  BOOL v8 = [v3 serialize];

  return (NSData *)v8;
}

- (BOOL)isCompatibleWithRemoteEndPointAddress:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(HMDEndPointAddress *)self isIPv6Address];
  if (self == [v4 isIPv6Address]
    && ([v4 audioRTPPort],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 unsignedIntegerValue],
        v5,
        v6))
  {
    id v7 = [v4 videoRTPPort];
    BOOL v8 = [v7 unsignedIntegerValue] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (HMDEndPointAddress)initWithIPAddress:(id)a3 isIPv6Address:(BOOL)a4 videoRTPPort:(id)a5 audioRTPPort:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDEndPointAddress;
  uint64_t v14 = [(HMDEndPointAddress *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_ipAddress, a3);
    v15->_isIPv6Address = a4;
    objc_storeStrong((id *)&v15->_videoRTPPort, a5);
    objc_storeStrong((id *)&v15->_audioRTPPort, a6);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end