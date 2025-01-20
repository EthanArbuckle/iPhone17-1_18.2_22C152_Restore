@interface CIDCBuilderSignatureDetails
- (CIDCBuilderSignatureDetails)initWithSigningAlgorithm:(int64_t)a3 issuerCertificate:(id)a4 issuerKey:(id)a5 signature:(id)a6;
- (CIDCBuilderSignatureDetails)initWithSigningAlgorithm:(int64_t)a3 issuerCertificate:(id)a4 signature:(id)a5;
- (CIDCBuilderSignatureDetails)initWithSigningAlgorithm:(int64_t)a3 issuerKey:(id)a4 signature:(id)a5;
- (NSArray)issuerCertificate;
- (NSData)issuerKey;
- (NSData)signature;
- (int64_t)signingAlgorithm;
- (void)setIssuerCertificate:(id)a3;
- (void)setIssuerKey:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSigningAlgorithm:(int64_t)a3;
@end

@implementation CIDCBuilderSignatureDetails

- (CIDCBuilderSignatureDetails)initWithSigningAlgorithm:(int64_t)a3 issuerCertificate:(id)a4 signature:(id)a5
{
  return [(CIDCBuilderSignatureDetails *)self initWithSigningAlgorithm:a3 issuerCertificate:a4 issuerKey:0 signature:a5];
}

- (CIDCBuilderSignatureDetails)initWithSigningAlgorithm:(int64_t)a3 issuerKey:(id)a4 signature:(id)a5
{
  return [(CIDCBuilderSignatureDetails *)self initWithSigningAlgorithm:a3 issuerCertificate:0 issuerKey:a4 signature:a5];
}

- (CIDCBuilderSignatureDetails)initWithSigningAlgorithm:(int64_t)a3 issuerCertificate:(id)a4 issuerKey:(id)a5 signature:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CIDCBuilderSignatureDetails;
  v13 = [(CIDCBuilderSignatureDetails *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(CIDCBuilderSignatureDetails *)v13 setSigningAlgorithm:a3];
    [(CIDCBuilderSignatureDetails *)v14 setIssuerCertificate:v10];
    [(CIDCBuilderSignatureDetails *)v14 setIssuerKey:v11];
    [(CIDCBuilderSignatureDetails *)v14 setSignature:v12];
  }

  return v14;
}

- (int64_t)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (void)setSigningAlgorithm:(int64_t)a3
{
  self->_signingAlgorithm = a3;
}

- (NSArray)issuerCertificate
{
  return self->_issuerCertificate;
}

- (void)setIssuerCertificate:(id)a3
{
}

- (NSData)issuerKey
{
  return self->_issuerKey;
}

- (void)setIssuerKey:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_issuerKey, 0);

  objc_storeStrong((id *)&self->_issuerCertificate, 0);
}

@end