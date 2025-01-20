@interface SWSignedPersonIdentityProof
- (NSData)signatureData;
- (SWSignedPersonIdentityProof)initWithPersonIdentityProof:(SWPersonIdentityProof *)personIdentityProof signatureData:(NSData *)data;
@end

@implementation SWSignedPersonIdentityProof

- (SWSignedPersonIdentityProof)initWithPersonIdentityProof:(SWPersonIdentityProof *)personIdentityProof signatureData:(NSData *)data
{
  v7 = data;
  v8 = personIdentityProof;
  v9 = [(SWPersonIdentityProof *)v8 inclusionHashes];
  v10 = [(SWPersonIdentityProof *)v8 publicKey];
  uint64_t v11 = [(SWPersonIdentityProof *)v8 publicKeyIndex];

  v12 = [(SWPersonIdentityProof *)self initWithInclusionHashes:v9 publicKey:v10 localKeyIndex:v11];
  if (v12) {
    objc_storeStrong((id *)&v12->_signatureData, data);
  }

  return v12;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void).cxx_destruct
{
}

@end