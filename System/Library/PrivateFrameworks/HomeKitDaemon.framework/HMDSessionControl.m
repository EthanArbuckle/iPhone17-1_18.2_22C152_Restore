@interface HMDSessionControl
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDSessionControl)initWithCoder:(id)a3;
- (HMDSessionControl)initWithCommand:(unint64_t)a3 sessionIdentifier:(id)a4;
- (NSData)tlvData;
- (NSUUID)sessionID;
- (unint64_t)controlCommand;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSessionControl

- (void).cxx_destruct
{
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (unint64_t)controlCommand
{
  return self->_controlCommand;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[HMDSessionControl controlCommand](self, "controlCommand"), @"kSessionControl__Command");
  id v5 = [(HMDSessionControl *)self sessionID];
  [v4 encodeObject:v5 forKey:@"kSessionControl__SessionIdentifier"];
}

- (HMDSessionControl)initWithCoder:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDSessionControl;
  id v5 = [(HMDSessionControl *)&v12 init];
  if (v5)
  {
    v5->_controlCommand = (int)[v4 decodeInt32ForKey:@"kSessionControl__Command"];
    v6 = (void *)MEMORY[0x263EFFA08];
    v13[0] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSessionControl__SessionIdentifier"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSUUID *)v9;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  unint64_t v9 = [(HMDSessionControl *)self controlCommand];
  if (v9 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDSessionControlCommand %tu", v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_264A21A90[v9];
  }
  [v7 appendFormat:@"\n %@ controlCommand = %@ ", v6, v10];

  id v12 = [(HMDSessionControl *)self sessionID];
  v11 = [v12 UUIDString];
  [v7 appendFormat:@"\n %@ sessionID = %@ ", v6, v11];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSessionControl controlCommand](self, "controlCommand"));
  [v3 addTLV:2 number:v4];

  id v5 = [(HMDSessionControl *)self sessionID];
  [v3 addTLV:1 uuid:v5];

  id v6 = [v3 serialize];

  return (NSData *)v6;
}

- (BOOL)_parseFromTLVData
{
  v11[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35A58] wrappertlv:2 name:@"kSessionControl__Command"];
  id v4 = [MEMORY[0x263F35B00] wrappertlv:1 name:@"kSessionControl__SessionIdentifier"];
  v11[0] = v3;
  v11[1] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  BOOL v6 = [(HAPTLVBase *)self _parse:v5];
  if (v6)
  {
    id v7 = [v3 field];
    self->_controlCommand = [v7 unsignedIntegerValue];

    v8 = [v4 field];
    sessionID = self->_sessionID;
    self->_sessionID = v8;
  }
  return v6;
}

- (HMDSessionControl)initWithCommand:(unint64_t)a3 sessionIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDSessionControl;
  v8 = [(HMDSessionControl *)&v11 init];
  unint64_t v9 = v8;
  if (v8)
  {
    v8->_controlCommand = a3;
    objc_storeStrong((id *)&v8->_sessionID, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end