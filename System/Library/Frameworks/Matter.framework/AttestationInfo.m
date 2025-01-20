@interface AttestationInfo
- (AttestationInfo)initWithChallenge:(NSData *)challenge nonce:(NSData *)nonce elements:(NSData *)elements elementsSignature:(NSData *)elementsSignature dac:(NSData *)dac pai:(NSData *)pai certificationDeclaration:(NSData *)certificationDeclaration firmwareInfo:(NSData *)firmwareInfo;
- (NSData)certificationDeclaration;
- (NSData)challenge;
- (NSData)dac;
- (NSData)elements;
- (NSData)elementsSignature;
- (NSData)firmwareInfo;
- (NSData)nonce;
- (NSData)pai;
- (void)setCertificationDeclaration:(NSData *)certificationDeclaration;
- (void)setChallenge:(NSData *)challenge;
- (void)setDac:(NSData *)dac;
- (void)setElements:(NSData *)elements;
- (void)setElementsSignature:(NSData *)elementsSignature;
- (void)setFirmwareInfo:(NSData *)firmwareInfo;
- (void)setNonce:(NSData *)nonce;
- (void)setPai:(NSData *)pai;
@end

@implementation AttestationInfo

- (AttestationInfo)initWithChallenge:(NSData *)challenge nonce:(NSData *)nonce elements:(NSData *)elements elementsSignature:(NSData *)elementsSignature dac:(NSData *)dac pai:(NSData *)pai certificationDeclaration:(NSData *)certificationDeclaration firmwareInfo:(NSData *)firmwareInfo
{
  v27 = challenge;
  v26 = nonce;
  v25 = elements;
  v24 = elementsSignature;
  v23 = dac;
  v22 = pai;
  v21 = certificationDeclaration;
  v17 = firmwareInfo;
  v28.receiver = self;
  v28.super_class = (Class)AttestationInfo;
  v18 = [(AttestationInfo *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_challenge, challenge);
    objc_storeStrong((id *)&v19->_nonce, nonce);
    objc_storeStrong((id *)&v19->_elements, elements);
    objc_storeStrong((id *)&v19->_elementsSignature, elementsSignature);
    objc_storeStrong((id *)&v19->_dac, dac);
    objc_storeStrong((id *)&v19->_pai, pai);
    objc_storeStrong((id *)&v19->_certificationDeclaration, certificationDeclaration);
    objc_storeStrong((id *)&v19->_firmwareInfo, firmwareInfo);
  }

  return v19;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(NSData *)challenge
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(NSData *)nonce
{
}

- (NSData)elements
{
  return self->_elements;
}

- (void)setElements:(NSData *)elements
{
}

- (NSData)elementsSignature
{
  return self->_elementsSignature;
}

- (void)setElementsSignature:(NSData *)elementsSignature
{
}

- (NSData)dac
{
  return self->_dac;
}

- (void)setDac:(NSData *)dac
{
}

- (NSData)pai
{
  return self->_pai;
}

- (void)setPai:(NSData *)pai
{
}

- (NSData)certificationDeclaration
{
  return self->_certificationDeclaration;
}

- (void)setCertificationDeclaration:(NSData *)certificationDeclaration
{
}

- (NSData)firmwareInfo
{
  return self->_firmwareInfo;
}

- (void)setFirmwareInfo:(NSData *)firmwareInfo
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareInfo, 0);
  objc_storeStrong((id *)&self->_certificationDeclaration, 0);
  objc_storeStrong((id *)&self->_pai, 0);
  objc_storeStrong((id *)&self->_dac, 0);
  objc_storeStrong((id *)&self->_elementsSignature, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_nonce, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

@end