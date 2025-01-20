@interface FMDPairingLockRegisterRequestInfo
+ (BOOL)supportsSecureCoding;
- (FMDPairingLockRegisterRequestInfo)initWithCoder:(id)a3;
- (NSString)accessoryType;
- (NSString)lostModePublicKey;
- (NSString)serialNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryType:(id)a3;
- (void)setLostModePublicKey:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation FMDPairingLockRegisterRequestInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDPairingLockRegisterRequestInfo *)self accessoryType];
  [v4 encodeObject:v5 forKey:@"accessoryType"];

  v6 = [(FMDPairingLockRegisterRequestInfo *)self serialNumber];
  [v4 encodeObject:v6 forKey:@"serialNumber"];

  id v7 = [(FMDPairingLockRegisterRequestInfo *)self lostModePublicKey];
  [v4 encodeObject:v7 forKey:@"lostModePublicKey"];
}

- (FMDPairingLockRegisterRequestInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDPairingLockRegisterRequestInfo;
  v5 = [(FMDPairingLockRegisterRequestInfo *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryType"];
    [(FMDPairingLockRegisterRequestInfo *)v5 setAccessoryType:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    [(FMDPairingLockRegisterRequestInfo *)v5 setSerialNumber:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModePublicKey"];
    [(FMDPairingLockRegisterRequestInfo *)v5 setLostModePublicKey:v8];
  }
  return v5;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
}

- (NSString)lostModePublicKey
{
  return self->_lostModePublicKey;
}

- (void)setLostModePublicKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModePublicKey, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end