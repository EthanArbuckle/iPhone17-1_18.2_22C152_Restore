@interface AMSBiometricsSignatureResult
+ (BOOL)supportsSecureCoding;
- (AMSBiometricsSignatureRequest)originalRequest;
- (AMSBiometricsSignatureResult)initWithCoder:(id)a3;
- (NSData)publicKey;
- (NSString)signature;
- (void)encodeWithCoder:(id)a3;
- (void)setOriginalRequest:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation AMSBiometricsSignatureResult

- (AMSBiometricsSignatureResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSBiometricsSignatureResult;
  v5 = [(AMSBiometricsSignatureResult *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPublicKeyKey"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSignatureKey"];
    signature = v5->_signature;
    v5->_signature = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kOriginalRequestKey"];
    originalRequest = v5->_originalRequest;
    v5->_originalRequest = (AMSBiometricsSignatureRequest *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSBiometricsSignatureResult *)self publicKey];
  [v4 encodeObject:v5 forKey:@"kPublicKeyKey"];

  uint64_t v6 = [(AMSBiometricsSignatureResult *)self signature];
  [v4 encodeObject:v6 forKey:@"kSignatureKey"];

  id v7 = [(AMSBiometricsSignatureResult *)self originalRequest];
  [v4 encodeObject:v7 forKey:@"kOriginalRequestKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSBiometricsSignatureRequest)originalRequest
{
  return self->_originalRequest;
}

- (void)setOriginalRequest:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
}

@end