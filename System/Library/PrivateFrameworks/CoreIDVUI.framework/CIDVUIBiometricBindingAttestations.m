@interface CIDVUIBiometricBindingAttestations
- (CIDVUIBiometricBindingAttestations)initWithProgenitorKeyAttestation:(id)a3;
- (NSData)progenitorKeyAttestation;
@end

@implementation CIDVUIBiometricBindingAttestations

- (CIDVUIBiometricBindingAttestations)initWithProgenitorKeyAttestation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CIDVUIBiometricBindingAttestations;
  v6 = [(CIDVUIBiometricBindingAttestations *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_progenitorKeyAttestation, a3);
  }

  return v7;
}

- (NSData)progenitorKeyAttestation
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end