@interface FMDPairingCheckCommandResponseInfo
+ (BOOL)supportsSecureCoding;
- (FMDPairingCheckCommandResponseInfo)initWithCoder:(id)a3;
- (NSString)lostModeInfo;
- (NSString)phoneNumber;
- (NSString)serverNonce;
- (NSString)signature;
- (NSString)statusCode;
- (NSString)useEraseKeyType;
- (void)encodeWithCoder:(id)a3;
- (void)setLostModeInfo:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setServerNonce:(id)a3;
- (void)setSignature:(id)a3;
- (void)setStatusCode:(id)a3;
- (void)setUseEraseKeyType:(id)a3;
@end

@implementation FMDPairingCheckCommandResponseInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDPairingCheckCommandResponseInfo *)self signature];
  [v4 encodeObject:v5 forKey:@"signature"];

  v6 = [(FMDPairingCheckCommandResponseInfo *)self serverNonce];
  [v4 encodeObject:v6 forKey:@"serverNonce"];

  v7 = [(FMDPairingCheckCommandResponseInfo *)self phoneNumber];
  [v4 encodeObject:v7 forKey:@"phoneNumber"];

  v8 = [(FMDPairingCheckCommandResponseInfo *)self statusCode];
  [v4 encodeObject:v8 forKey:@"statusCode"];

  v9 = [(FMDPairingCheckCommandResponseInfo *)self lostModeInfo];
  [v4 encodeObject:v9 forKey:@"lostModeInfo"];

  id v10 = [(FMDPairingCheckCommandResponseInfo *)self useEraseKeyType];
  [v4 encodeObject:v10 forKey:@"useEraseKeyType"];
}

- (FMDPairingCheckCommandResponseInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMDPairingCheckCommandResponseInfo;
  v5 = [(FMDPairingCheckCommandResponseInfo *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    [(FMDPairingCheckCommandResponseInfo *)v5 setSignature:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverNonce"];
    [(FMDPairingCheckCommandResponseInfo *)v5 setServerNonce:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    [(FMDPairingCheckCommandResponseInfo *)v5 setPhoneNumber:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusCode"];
    [(FMDPairingCheckCommandResponseInfo *)v5 setStatusCode:v9];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModeInfo"];
    [(FMDPairingCheckCommandResponseInfo *)v5 setLostModeInfo:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useEraseKeyType"];
    [(FMDPairingCheckCommandResponseInfo *)v5 setUseEraseKeyType:v11];
  }
  return v5;
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSString)serverNonce
{
  return self->_serverNonce;
}

- (void)setServerNonce:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
}

- (NSString)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void)setLostModeInfo:(id)a3
{
}

- (NSString)useEraseKeyType
{
  return self->_useEraseKeyType;
}

- (void)setUseEraseKeyType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useEraseKeyType, 0);
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_serverNonce, 0);

  objc_storeStrong((id *)&self->_signature, 0);
}

@end