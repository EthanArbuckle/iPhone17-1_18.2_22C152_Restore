@interface APSSignDataWithIdentityResponse
+ (BOOL)supportsSecureCoding;
- (APSSignDataWithIdentityResponse)initWithCoder:(id)a3;
- (NSArray)certificates;
- (NSData)nonce;
- (NSData)signature;
- (void)encodeWithCoder:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setNonce:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation APSSignDataWithIdentityResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  signature = self->_signature;
  id v5 = a3;
  [v5 encodeObject:signature forKey:@"signatureKey"];
  [v5 encodeObject:self->_certificates forKey:@"certificatesKey"];
  [v5 encodeObject:self->_nonce forKey:@"nonceKey"];
}

- (APSSignDataWithIdentityResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APSSignDataWithIdentityResponse;
  id v5 = [(APSSignDataWithIdentityResponse *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signatureKey"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"certificatesKey"];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonceKey"];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v10;
  }
  return v5;
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end