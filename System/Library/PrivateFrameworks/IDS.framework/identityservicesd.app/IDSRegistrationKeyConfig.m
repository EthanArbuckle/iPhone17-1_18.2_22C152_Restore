@interface IDSRegistrationKeyConfig
- (BOOL)isMigratedSignature;
- (IDSMPFullDeviceIdentityContainer)previousRegisteredIdentityContainer;
- (IDSMPFullDeviceIdentityContainer)registeredIdentityContainer;
- (IDSMPFullDeviceIdentityContainer)unregisteredIdentityContainer;
- (IDSMPFullLegacyIdentity)identityClassA;
- (IDSMPFullLegacyIdentity)identityClassC;
- (IDSMPFullLegacyIdentity)identityClassD;
- (IDSMPFullLegacyIdentity)unSavedidentityClassA;
- (IDSMPFullLegacyIdentity)unSavedidentityClassC;
- (IDSMPFullLegacyIdentity)unSavedidentityClassD;
- (IDSNGMKeyRollingTicket)unappliedRollingTicket;
- (NSString)buildOfIdentityGeneration;
- (NSString)buildOfUnregisteredIdentityGeneration;
- (NSString)signature;
- (__SecKey)privateKey;
- (__SecKey)publicKey;
- (void)dealloc;
- (void)setBuildOfIdentityGeneration:(id)a3;
- (void)setBuildOfUnregisteredIdentityGeneration:(id)a3;
- (void)setIdentityClassA:(id)a3;
- (void)setIdentityClassC:(id)a3;
- (void)setIdentityClassD:(id)a3;
- (void)setIsMigratedSignature:(BOOL)a3;
- (void)setPreviousRegisteredIdentityContainer:(id)a3;
- (void)setPrivateKey:(__SecKey *)a3;
- (void)setPublicKey:(__SecKey *)a3;
- (void)setRegisteredIdentityContainer:(id)a3;
- (void)setSignature:(id)a3;
- (void)setUnSavedidentityClassA:(id)a3;
- (void)setUnSavedidentityClassC:(id)a3;
- (void)setUnSavedidentityClassD:(id)a3;
- (void)setUnappliedRollingTicket:(id)a3;
- (void)setUnregisteredIdentityContainer:(id)a3;
@end

@implementation IDSRegistrationKeyConfig

- (void)dealloc
{
  privateKey = self->_privateKey;
  if (privateKey)
  {
    CFRelease(privateKey);
    self->_privateKey = 0;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    CFRelease(publicKey);
    self->_publicKey = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)IDSRegistrationKeyConfig;
  [(IDSRegistrationKeyConfig *)&v5 dealloc];
}

- (void)setPublicKey:(__SecKey *)a3
{
  publicKey = self->_publicKey;
  if (publicKey != a3)
  {
    if (publicKey)
    {
      CFRelease(publicKey);
      self->_publicKey = 0;
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_publicKey = a3;
  }
}

- (void)setPrivateKey:(__SecKey *)a3
{
  privateKey = self->_privateKey;
  if (privateKey != a3)
  {
    if (privateKey)
    {
      CFRelease(privateKey);
      self->_privateKey = 0;
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_privateKey = a3;
  }
}

- (IDSMPFullDeviceIdentityContainer)registeredIdentityContainer
{
  return self->_registeredIdentityContainer;
}

- (void)setRegisteredIdentityContainer:(id)a3
{
}

- (IDSMPFullDeviceIdentityContainer)previousRegisteredIdentityContainer
{
  return self->_previousRegisteredIdentityContainer;
}

- (void)setPreviousRegisteredIdentityContainer:(id)a3
{
}

- (IDSMPFullDeviceIdentityContainer)unregisteredIdentityContainer
{
  return self->_unregisteredIdentityContainer;
}

- (void)setUnregisteredIdentityContainer:(id)a3
{
}

- (IDSNGMKeyRollingTicket)unappliedRollingTicket
{
  return self->_unappliedRollingTicket;
}

- (void)setUnappliedRollingTicket:(id)a3
{
}

- (NSString)buildOfIdentityGeneration
{
  return self->_buildOfIdentityGeneration;
}

- (void)setBuildOfIdentityGeneration:(id)a3
{
}

- (NSString)buildOfUnregisteredIdentityGeneration
{
  return self->_buildOfUnregisteredIdentityGeneration;
}

- (void)setBuildOfUnregisteredIdentityGeneration:(id)a3
{
}

- (IDSMPFullLegacyIdentity)identityClassA
{
  return self->_identityClassA;
}

- (void)setIdentityClassA:(id)a3
{
}

- (IDSMPFullLegacyIdentity)unSavedidentityClassA
{
  return self->_unSavedidentityClassA;
}

- (void)setUnSavedidentityClassA:(id)a3
{
}

- (IDSMPFullLegacyIdentity)identityClassC
{
  return self->_identityClassC;
}

- (void)setIdentityClassC:(id)a3
{
}

- (IDSMPFullLegacyIdentity)unSavedidentityClassC
{
  return self->_unSavedidentityClassC;
}

- (void)setUnSavedidentityClassC:(id)a3
{
}

- (IDSMPFullLegacyIdentity)identityClassD
{
  return self->_identityClassD;
}

- (void)setIdentityClassD:(id)a3
{
}

- (IDSMPFullLegacyIdentity)unSavedidentityClassD
{
  return self->_unSavedidentityClassD;
}

- (void)setUnSavedidentityClassD:(id)a3
{
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (BOOL)isMigratedSignature
{
  return self->_isMigratedSignature;
}

- (void)setIsMigratedSignature:(BOOL)a3
{
  self->_isMigratedSignature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_unSavedidentityClassD, 0);
  objc_storeStrong((id *)&self->_identityClassD, 0);
  objc_storeStrong((id *)&self->_unSavedidentityClassC, 0);
  objc_storeStrong((id *)&self->_identityClassC, 0);
  objc_storeStrong((id *)&self->_unSavedidentityClassA, 0);
  objc_storeStrong((id *)&self->_identityClassA, 0);
  objc_storeStrong((id *)&self->_buildOfUnregisteredIdentityGeneration, 0);
  objc_storeStrong((id *)&self->_buildOfIdentityGeneration, 0);
  objc_storeStrong((id *)&self->_unappliedRollingTicket, 0);
  objc_storeStrong((id *)&self->_unregisteredIdentityContainer, 0);
  objc_storeStrong((id *)&self->_previousRegisteredIdentityContainer, 0);

  objc_storeStrong((id *)&self->_registeredIdentityContainer, 0);
}

@end