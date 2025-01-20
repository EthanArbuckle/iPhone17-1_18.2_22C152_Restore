@interface MTRDeviceAttestationInfo
- (MTRCertificateDERBytes)deviceAttestationCertificate;
- (MTRCertificateDERBytes)productAttestationIntermediateCertificate;
- (MTRDeviceAttestationInfo)initWithDeviceAttestationChallenge:(NSData *)challenge nonce:(NSData *)nonce elementsTLV:(MTRTLVBytes)elementsTLV elementsSignature:(NSData *)elementsSignature deviceAttestationCertificate:(MTRCertificateDERBytes)deviceAttestationCertificate productAttestationIntermediateCertificate:(MTRCertificateDERBytes)processAttestationIntermediateCertificate certificationDeclaration:(NSData *)certificationDeclaration firmwareInfo:(NSData *)firmwareInfo;
- (MTRTLVBytes)elementsTLV;
- (NSData)certificationDeclaration;
- (NSData)challenge;
- (NSData)elementsSignature;
- (NSData)firmwareInfo;
- (NSData)nonce;
@end

@implementation MTRDeviceAttestationInfo

- (MTRDeviceAttestationInfo)initWithDeviceAttestationChallenge:(NSData *)challenge nonce:(NSData *)nonce elementsTLV:(MTRTLVBytes)elementsTLV elementsSignature:(NSData *)elementsSignature deviceAttestationCertificate:(MTRCertificateDERBytes)deviceAttestationCertificate productAttestationIntermediateCertificate:(MTRCertificateDERBytes)processAttestationIntermediateCertificate certificationDeclaration:(NSData *)certificationDeclaration firmwareInfo:(NSData *)firmwareInfo
{
  v27 = challenge;
  v26 = nonce;
  v25 = elementsTLV;
  v24 = elementsSignature;
  v23 = deviceAttestationCertificate;
  v22 = processAttestationIntermediateCertificate;
  v21 = certificationDeclaration;
  v17 = firmwareInfo;
  v28.receiver = self;
  v28.super_class = (Class)MTRDeviceAttestationInfo;
  v18 = [(MTRDeviceAttestationInfo *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_challenge, challenge);
    objc_storeStrong((id *)&v19->_nonce, nonce);
    objc_storeStrong((id *)&v19->_elementsTLV, elementsTLV);
    objc_storeStrong((id *)&v19->_elementsSignature, elementsSignature);
    objc_storeStrong((id *)&v19->_deviceAttestationCertificate, deviceAttestationCertificate);
    objc_storeStrong((id *)&v19->_productAttestationIntermediateCertificate, processAttestationIntermediateCertificate);
    objc_storeStrong((id *)&v19->_certificationDeclaration, certificationDeclaration);
    objc_storeStrong((id *)&v19->_firmwareInfo, firmwareInfo);
  }

  return v19;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (MTRTLVBytes)elementsTLV
{
  return self->_elementsTLV;
}

- (NSData)elementsSignature
{
  return self->_elementsSignature;
}

- (MTRCertificateDERBytes)deviceAttestationCertificate
{
  return self->_deviceAttestationCertificate;
}

- (MTRCertificateDERBytes)productAttestationIntermediateCertificate
{
  return self->_productAttestationIntermediateCertificate;
}

- (NSData)certificationDeclaration
{
  return self->_certificationDeclaration;
}

- (NSData)firmwareInfo
{
  return self->_firmwareInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareInfo, 0);
  objc_storeStrong((id *)&self->_certificationDeclaration, 0);
  objc_storeStrong((id *)&self->_productAttestationIntermediateCertificate, 0);
  objc_storeStrong((id *)&self->_deviceAttestationCertificate, 0);
  objc_storeStrong((id *)&self->_elementsSignature, 0);
  objc_storeStrong((id *)&self->_elementsTLV, 0);
  objc_storeStrong((id *)&self->_nonce, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

@end