@interface EMMessageSigner
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSeparateSigningAndEncryptionCertificates;
- (EMCertificateTrustInformation)encryptionCertificateTrustInfo;
- (EMCertificateTrustInformation)signingCertificateTrustInfo;
- (EMMessageSigner)initWithCoder:(id)a3;
- (EMMessageSigner)initWithSigningTrust:(id)a3 encryptionTrust:(id)a4;
- (NSError)error;
- (void)encodeWithCoder:(id)a3;
- (void)evaluateTrustsWithOptions:(unint64_t)a3;
- (void)reevaluateTrustWithNetworkAccessAllowed;
- (void)setEncryptionCertificateTrustInfo:(id)a3;
- (void)setError:(id)a3;
- (void)setSigningCertificateTrustInfo:(id)a3;
@end

@implementation EMMessageSigner

- (EMMessageSigner)initWithSigningTrust:(id)a3 encryptionTrust:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMMessageSigner;
  v9 = [(EMMessageSigner *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signingCertificateTrustInfo, a3);
    objc_storeStrong((id *)&v10->_encryptionCertificateTrustInfo, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageSigner)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_signingCertificateTrustInfo"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_encryptionCertificateTrustInfo"];
  id v7 = [(EMMessageSigner *)self initWithSigningTrust:v5 encryptionTrust:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(EMMessageSigner *)self signingCertificateTrustInfo];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_signingCertificateTrustInfo"];

  v5 = [(EMMessageSigner *)self encryptionCertificateTrustInfo];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_encryptionCertificateTrustInfo"];
}

- (BOOL)hasSeparateSigningAndEncryptionCertificates
{
  signingCertificateTrustInfo = self->_signingCertificateTrustInfo;
  if (signingCertificateTrustInfo)
  {
    if (self->_encryptionCertificateTrustInfo) {
      LOBYTE(signingCertificateTrustInfo) = !-[EMCertificateTrustInformation isEqual:](signingCertificateTrustInfo, "isEqual:");
    }
    else {
      LOBYTE(signingCertificateTrustInfo) = 0;
    }
  }
  return (char)signingCertificateTrustInfo;
}

- (void)evaluateTrustsWithOptions:(unint64_t)a3
{
  id v5 = [(EMMessageSigner *)self signingCertificateTrustInfo];
  [v5 evaluateTrustWithOptions:a3];

  id v6 = [(EMMessageSigner *)self encryptionCertificateTrustInfo];
  [v6 evaluateTrustWithOptions:a3];
}

- (void)reevaluateTrustWithNetworkAccessAllowed
{
  id v3 = [(EMMessageSigner *)self signingCertificateTrustInfo];
  [v3 reevaluateTrustWithNetworkAccessAllowed];

  id v4 = [(EMMessageSigner *)self encryptionCertificateTrustInfo];
  [v4 reevaluateTrustWithNetworkAccessAllowed];
}

- (EMCertificateTrustInformation)signingCertificateTrustInfo
{
  return self->_signingCertificateTrustInfo;
}

- (void)setSigningCertificateTrustInfo:(id)a3
{
}

- (EMCertificateTrustInformation)encryptionCertificateTrustInfo
{
  return self->_encryptionCertificateTrustInfo;
}

- (void)setEncryptionCertificateTrustInfo:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_encryptionCertificateTrustInfo, 0);
  objc_storeStrong((id *)&self->_signingCertificateTrustInfo, 0);
}

@end