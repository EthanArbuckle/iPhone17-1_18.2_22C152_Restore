@interface HMMTRDeviceCredential
- (HMMTRDeviceCredential)initWithCertificationDeclaration:(id)a3 deviceAttestationCertificate:(id)a4 productAttestationIntermediateCertificate:(id)a5;
- (NSData)certificationDeclaration;
- (NSData)deviceAttestationCertificate;
- (NSData)productAttestationIntermediateCertificate;
@end

@implementation HMMTRDeviceCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productAttestationIntermediateCertificate, 0);
  objc_storeStrong((id *)&self->_deviceAttestationCertificate, 0);
  objc_storeStrong((id *)&self->_certificationDeclaration, 0);
}

- (NSData)productAttestationIntermediateCertificate
{
  return self->_productAttestationIntermediateCertificate;
}

- (NSData)deviceAttestationCertificate
{
  return self->_deviceAttestationCertificate;
}

- (NSData)certificationDeclaration
{
  return self->_certificationDeclaration;
}

- (HMMTRDeviceCredential)initWithCertificationDeclaration:(id)a3 deviceAttestationCertificate:(id)a4 productAttestationIntermediateCertificate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRDeviceCredential;
  v12 = [(HMMTRDeviceCredential *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_certificationDeclaration, a3);
    objc_storeStrong((id *)&v13->_deviceAttestationCertificate, a4);
    objc_storeStrong((id *)&v13->_productAttestationIntermediateCertificate, a5);
  }

  return v13;
}

@end