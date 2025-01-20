@interface MTROperationalCertificateChain
- (MTRCertificateDERBytes)intermediateCertificate;
- (MTRCertificateDERBytes)operationalCertificate;
- (MTRCertificateDERBytes)rootCertificate;
- (MTROperationalCertificateChain)initWithOperationalCertificate:(MTRCertificateDERBytes)operationalCertificate intermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate rootCertificate:(MTRCertificateDERBytes)rootCertificate adminSubject:(NSNumber *)adminSubject;
- (NSNumber)adminSubject;
- (void)setAdminSubject:(NSNumber *)adminSubject;
- (void)setIntermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate;
- (void)setOperationalCertificate:(MTRCertificateDERBytes)operationalCertificate;
- (void)setRootCertificate:(MTRCertificateDERBytes)rootCertificate;
@end

@implementation MTROperationalCertificateChain

- (MTROperationalCertificateChain)initWithOperationalCertificate:(MTRCertificateDERBytes)operationalCertificate intermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate rootCertificate:(MTRCertificateDERBytes)rootCertificate adminSubject:(NSNumber *)adminSubject
{
  v11 = operationalCertificate;
  v12 = intermediateCertificate;
  v13 = rootCertificate;
  v14 = adminSubject;
  v18.receiver = self;
  v18.super_class = (Class)MTROperationalCertificateChain;
  v15 = [(MTROperationalCertificateChain *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_operationalCertificate, operationalCertificate);
    objc_storeStrong((id *)&v16->_intermediateCertificate, intermediateCertificate);
    objc_storeStrong((id *)&v16->_rootCertificate, rootCertificate);
    objc_storeStrong((id *)&v16->_adminSubject, adminSubject);
  }

  return v16;
}

- (MTRCertificateDERBytes)operationalCertificate
{
  return self->_operationalCertificate;
}

- (void)setOperationalCertificate:(MTRCertificateDERBytes)operationalCertificate
{
}

- (MTRCertificateDERBytes)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (void)setIntermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate
{
}

- (MTRCertificateDERBytes)rootCertificate
{
  return self->_rootCertificate;
}

- (void)setRootCertificate:(MTRCertificateDERBytes)rootCertificate
{
}

- (NSNumber)adminSubject
{
  return self->_adminSubject;
}

- (void)setAdminSubject:(NSNumber *)adminSubject
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adminSubject, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);

  objc_storeStrong((id *)&self->_operationalCertificate, 0);
}

@end