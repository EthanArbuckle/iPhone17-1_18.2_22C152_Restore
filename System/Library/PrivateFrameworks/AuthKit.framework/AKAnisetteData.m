@interface AKAnisetteData
+ (BOOL)supportsSecureCoding;
- (AKAnisetteData)initWithCoder:(id)a3;
- (NSString)machineID;
- (NSString)oneTimePassword;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)routingInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setMachineID:(id)a3;
- (void)setOneTimePassword:(id)a3;
- (void)setRoutingInfo:(unint64_t)a3;
@end

@implementation AKAnisetteData

- (void)setRoutingInfo:(unint64_t)a3
{
  self->_routingInfo = a3;
}

- (void)setOneTimePassword:(id)a3
{
}

- (void)setMachineID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneTimePassword, 0);

  objc_storeStrong((id *)&self->_machineID, 0);
}

- (NSString)machineID
{
  return self->_machineID;
}

- (unint64_t)routingInfo
{
  return self->_routingInfo;
}

- (NSString)oneTimePassword
{
  return self->_oneTimePassword;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAnisetteData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKAnisetteData;
  v5 = [(AKAnisetteData *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_machineID"];
    machineID = v5->_machineID;
    v5->_machineID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_oneTimePassword"];
    oneTimePassword = v5->_oneTimePassword;
    v5->_oneTimePassword = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routingInfo"];
    v5->_routingInfo = [v10 unsignedLongLongValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  machineID = self->_machineID;
  id v5 = a3;
  [v5 encodeObject:machineID forKey:@"_machineID"];
  [v5 encodeObject:self->_oneTimePassword forKey:@"_oneTimePassword"];
  id v6 = [NSNumber numberWithUnsignedLongLong:self->_routingInfo];
  [v5 encodeObject:v6 forKey:@"_routingInfo"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_machineID copy];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_oneTimePassword copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  v4[3] = self->_routingInfo;
  return v4;
}

- (id)description
{
  v3 = NSString;
  machineID = self->_machineID;
  oneTimePassword = self->_oneTimePassword;
  id v6 = [NSNumber numberWithUnsignedLongLong:self->_routingInfo];
  uint64_t v7 = [v3 stringWithFormat:@"AKAnisetteData <%p>: {MID: %@ - OTP: %@ - RD: %@}", self, machineID, oneTimePassword, v6];

  return v7;
}

@end