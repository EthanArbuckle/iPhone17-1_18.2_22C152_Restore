@interface FMDPairingCheckCommandRequestInfo
+ (BOOL)supportsSecureCoding;
- (FMDPairingCheckCommandRequestInfo)initWithCoder:(id)a3;
- (NSString)accessoryType;
- (NSString)authNonce;
- (NSString)eraseKeyType;
- (NSString)pairingCheckToken;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryType:(id)a3;
- (void)setAuthNonce:(id)a3;
- (void)setEraseKeyType:(id)a3;
- (void)setPairingCheckToken:(id)a3;
@end

@implementation FMDPairingCheckCommandRequestInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDPairingCheckCommandRequestInfo *)self pairingCheckToken];
  [v4 encodeObject:v5 forKey:@"pairingCheckToken"];

  v6 = [(FMDPairingCheckCommandRequestInfo *)self authNonce];
  [v4 encodeObject:v6 forKey:@"authNonce"];

  v7 = [(FMDPairingCheckCommandRequestInfo *)self accessoryType];
  [v4 encodeObject:v7 forKey:@"accessoryType"];

  id v8 = [(FMDPairingCheckCommandRequestInfo *)self eraseKeyType];
  [v4 encodeObject:v8 forKey:@"eraseKeyType"];
}

- (FMDPairingCheckCommandRequestInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDPairingCheckCommandRequestInfo;
  v5 = [(FMDPairingCheckCommandRequestInfo *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingCheckToken"];
    [(FMDPairingCheckCommandRequestInfo *)v5 setPairingCheckToken:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authNonce"];
    [(FMDPairingCheckCommandRequestInfo *)v5 setAuthNonce:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryType"];
    [(FMDPairingCheckCommandRequestInfo *)v5 setAccessoryType:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eraseKeyType"];
    [(FMDPairingCheckCommandRequestInfo *)v5 setEraseKeyType:v9];
  }
  return v5;
}

- (NSString)pairingCheckToken
{
  return self->_pairingCheckToken;
}

- (void)setPairingCheckToken:(id)a3
{
}

- (NSString)authNonce
{
  return self->_authNonce;
}

- (void)setAuthNonce:(id)a3
{
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
}

- (NSString)eraseKeyType
{
  return self->_eraseKeyType;
}

- (void)setEraseKeyType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eraseKeyType, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
  objc_storeStrong((id *)&self->_authNonce, 0);

  objc_storeStrong((id *)&self->_pairingCheckToken, 0);
}

@end