@interface MTRDeviceControllerFactoryParams
- (BOOL)hasStorage;
- (BOOL)shouldStartServer;
- (MTRDeviceControllerFactoryParams)initWithStorage:(id)storage;
- (NSArray)certificationDeclarationCertificates;
- (NSArray)productAttestationAuthorityCertificates;
- (NSNumber)port;
- (id)otaProviderDelegate;
- (id)storage;
- (void)setCertificationDeclarationCertificates:(NSArray *)certificationDeclarationCertificates;
- (void)setHasStorage:(BOOL)a3;
- (void)setOtaProviderDelegate:(id)otaProviderDelegate;
- (void)setPort:(NSNumber *)port;
- (void)setProductAttestationAuthorityCertificates:(NSArray *)productAttestationAuthorityCertificates;
- (void)setShouldStartServer:(BOOL)shouldStartServer;
@end

@implementation MTRDeviceControllerFactoryParams

- (MTRDeviceControllerFactoryParams)initWithStorage:(id)storage
{
  id v5 = storage;
  v14.receiver = self;
  v14.super_class = (Class)MTRDeviceControllerFactoryParams;
  v6 = [(MTRDeviceControllerFactoryParams *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, storage);
    v7->_hasStorage = 1;
    otaProviderDelegate = v7->_otaProviderDelegate;
    v7->_otaProviderDelegate = 0;

    productAttestationAuthorityCertificates = v7->_productAttestationAuthorityCertificates;
    v7->_productAttestationAuthorityCertificates = 0;

    certificationDeclarationCertificates = v7->_certificationDeclarationCertificates;
    v7->_certificationDeclarationCertificates = 0;

    port = v7->_port;
    v7->_port = 0;

    v7->_shouldStartServer = 0;
    v12 = v7;
  }

  return v7;
}

- (id)storage
{
  return self->_storage;
}

- (id)otaProviderDelegate
{
  return self->_otaProviderDelegate;
}

- (void)setOtaProviderDelegate:(id)otaProviderDelegate
{
}

- (NSArray)productAttestationAuthorityCertificates
{
  return self->_productAttestationAuthorityCertificates;
}

- (void)setProductAttestationAuthorityCertificates:(NSArray *)productAttestationAuthorityCertificates
{
}

- (NSArray)certificationDeclarationCertificates
{
  return self->_certificationDeclarationCertificates;
}

- (void)setCertificationDeclarationCertificates:(NSArray *)certificationDeclarationCertificates
{
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(NSNumber *)port
{
}

- (BOOL)shouldStartServer
{
  return self->_shouldStartServer;
}

- (void)setShouldStartServer:(BOOL)shouldStartServer
{
  self->_shouldStartServer = shouldStartServer;
}

- (BOOL)hasStorage
{
  return self->_hasStorage;
}

- (void)setHasStorage:(BOOL)a3
{
  self->_hasStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, 0);
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

@end