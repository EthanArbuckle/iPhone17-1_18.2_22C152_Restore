@interface FMDPairingLockRegisterResponseInfo
+ (BOOL)supportsSecureCoding;
- (FMDPairingLockRegisterResponseInfo)initWithCoder:(id)a3;
- (NSString)pairingToken;
- (NSString)serialNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setPairingToken:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation FMDPairingLockRegisterResponseInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDPairingLockRegisterResponseInfo *)self serialNumber];
  [v4 encodeObject:v5 forKey:@"serialNumber"];

  id v6 = [(FMDPairingLockRegisterResponseInfo *)self pairingToken];
  [v4 encodeObject:v6 forKey:@"pairingToken"];
}

- (FMDPairingLockRegisterResponseInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDPairingLockRegisterResponseInfo;
  v5 = [(FMDPairingLockRegisterResponseInfo *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    [(FMDPairingLockRegisterResponseInfo *)v5 setSerialNumber:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingToken"];
    [(FMDPairingLockRegisterResponseInfo *)v5 setPairingToken:v7];
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

- (NSString)pairingToken
{
  return self->_pairingToken;
}

- (void)setPairingToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingToken, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end