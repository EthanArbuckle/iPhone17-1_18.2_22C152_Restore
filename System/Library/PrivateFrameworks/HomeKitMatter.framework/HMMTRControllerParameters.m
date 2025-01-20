@interface HMMTRControllerParameters
- (BOOL)shouldAdvertiseOperational;
- (BOOL)startSuspended;
- (BOOL)usesCommonStorageDelegate;
- (HMMTRControllerParameters)initWithIPK:(id)a3 operationalKeypair:(id)a4 operationalCertificate:(id)a5 intermediateCertificate:(id)a6 rootCertificate:(id)a7;
- (HMMTRControllerParameters)initWithStorageDelegate:(id)a3 storageDelegateQueue:(id)a4 uniqueIdentifier:(id)a5 ipk:(id)a6 vendorID:(id)a7 operationalKeypair:(id)a8 operationalCertificate:(id)a9 intermediateCertificate:(id)a10 rootCertificate:(id)a11;
- (MTRDeviceControllerStorageDelegate)storageDelegate;
- (MTRKeypair)operationalKeypair;
- (MTROTAProviderDelegate)otaProviderDelegate;
- (MTROperationalCertificateIssuer)operationalCertificateIssuer;
- (NSArray)certificationDeclarationCertificates;
- (NSArray)productAttestationAuthorityCertificates;
- (NSData)intermediateCertificate;
- (NSData)ipk;
- (NSData)operationalCertificate;
- (NSData)rootCertificate;
- (NSNumber)fabricID;
- (NSNumber)vendorID;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)operationalCertificateIssuerQueue;
- (OS_dispatch_queue)otaProviderDelegateQueue;
- (OS_dispatch_queue)storageDelegateQueue;
- (id)controllerParams;
- (id)controllerParams2;
- (void)setCertificationDeclarationCertificates:(id)a3;
- (void)setFabricID:(id)a3;
- (void)setIntermediateCertificate:(id)a3;
- (void)setIpk:(id)a3;
- (void)setOperationalCertificate:(id)a3;
- (void)setOperationalCertificateIssuer:(id)a3;
- (void)setOperationalCertificateIssuerQueue:(id)a3;
- (void)setOperationalKeypair:(id)a3;
- (void)setOtaProviderDelegate:(id)a3;
- (void)setOtaProviderDelegateQueue:(id)a3;
- (void)setProductAttestationAuthorityCertificates:(id)a3;
- (void)setRootCertificate:(id)a3;
- (void)setShouldAdvertiseOperational:(BOOL)a3;
- (void)setStartSuspended:(BOOL)a3;
- (void)setStorageDelegate:(id)a3;
- (void)setStorageDelegateQueue:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setVendorID:(id)a3;
@end

@implementation HMMTRControllerParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificationDeclarationCertificates, 0);
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegateQueue, 0);
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuerQueue, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuer, 0);
  objc_storeStrong((id *)&self->_storageDelegateQueue, 0);
  objc_storeStrong((id *)&self->_storageDelegate, 0);
  objc_storeStrong((id *)&self->_operationalKeypair, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setStartSuspended:(BOOL)a3
{
  self->_startSuspended = a3;
}

- (BOOL)startSuspended
{
  return self->_startSuspended;
}

- (void)setShouldAdvertiseOperational:(BOOL)a3
{
  self->_shouldAdvertiseOperational = a3;
}

- (BOOL)shouldAdvertiseOperational
{
  return self->_shouldAdvertiseOperational;
}

- (void)setCertificationDeclarationCertificates:(id)a3
{
}

- (NSArray)certificationDeclarationCertificates
{
  return self->_certificationDeclarationCertificates;
}

- (void)setProductAttestationAuthorityCertificates:(id)a3
{
}

- (NSArray)productAttestationAuthorityCertificates
{
  return self->_productAttestationAuthorityCertificates;
}

- (void)setOtaProviderDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)otaProviderDelegateQueue
{
  return self->_otaProviderDelegateQueue;
}

- (void)setOtaProviderDelegate:(id)a3
{
}

- (MTROTAProviderDelegate)otaProviderDelegate
{
  return self->_otaProviderDelegate;
}

- (void)setOperationalCertificateIssuerQueue:(id)a3
{
}

- (OS_dispatch_queue)operationalCertificateIssuerQueue
{
  return self->_operationalCertificateIssuerQueue;
}

- (void)setOperationalCertificateIssuer:(id)a3
{
}

- (MTROperationalCertificateIssuer)operationalCertificateIssuer
{
  return self->_operationalCertificateIssuer;
}

- (void)setStorageDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)storageDelegateQueue
{
  return self->_storageDelegateQueue;
}

- (void)setStorageDelegate:(id)a3
{
}

- (MTRDeviceControllerStorageDelegate)storageDelegate
{
  return self->_storageDelegate;
}

- (void)setOperationalKeypair:(id)a3
{
}

- (MTRKeypair)operationalKeypair
{
  return self->_operationalKeypair;
}

- (void)setOperationalCertificate:(id)a3
{
}

- (NSData)operationalCertificate
{
  return self->_operationalCertificate;
}

- (void)setIntermediateCertificate:(id)a3
{
}

- (NSData)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (void)setRootCertificate:(id)a3
{
}

- (NSData)rootCertificate
{
  return self->_rootCertificate;
}

- (void)setIpk:(id)a3
{
}

- (NSData)ipk
{
  return self->_ipk;
}

- (void)setFabricID:(id)a3
{
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (void)setVendorID:(id)a3
{
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (id)controllerParams2
{
  if ([(HMMTRControllerParameters *)self usesCommonStorageDelegate])
  {
    v3 = 0;
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x263F10DB8]);
    v19 = [(HMMTRControllerParameters *)self storageDelegate];
    v4 = [(HMMTRControllerParameters *)self storageDelegateQueue];
    v5 = [(HMMTRControllerParameters *)self uniqueIdentifier];
    v6 = [(HMMTRControllerParameters *)self ipk];
    v7 = [(HMMTRControllerParameters *)self vendorID];
    v8 = [(HMMTRControllerParameters *)self operationalKeypair];
    v9 = [(HMMTRControllerParameters *)self operationalCertificate];
    v10 = [(HMMTRControllerParameters *)self intermediateCertificate];
    v11 = [(HMMTRControllerParameters *)self rootCertificate];
    v3 = (void *)[v20 initWithStorageDelegate:v19 storageDelegateQueue:v4 uniqueIdentifier:v5 ipk:v6 vendorID:v7 operationalKeypair:v8 operationalCertificate:v9 intermediateCertificate:v10 rootCertificate:v11];

    v12 = [(HMMTRControllerParameters *)self otaProviderDelegate];
    v13 = [(HMMTRControllerParameters *)self otaProviderDelegateQueue];
    [v3 setOTAProviderDelegate:v12 queue:v13];

    v14 = [(HMMTRControllerParameters *)self operationalCertificateIssuer];
    v15 = [(HMMTRControllerParameters *)self operationalCertificateIssuerQueue];
    [v3 setOperationalCertificateIssuer:v14 queue:v15];

    v16 = [(HMMTRControllerParameters *)self productAttestationAuthorityCertificates];
    [v3 setProductAttestationAuthorityCertificates:v16];

    v17 = [(HMMTRControllerParameters *)self certificationDeclarationCertificates];
    [v3 setCertificationDeclarationCertificates:v17];

    objc_msgSend(v3, "setShouldAdvertiseOperational:", -[HMMTRControllerParameters shouldAdvertiseOperational](self, "shouldAdvertiseOperational"));
    if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED()) {
      objc_msgSend(v3, "setStartSuspended:", -[HMMTRControllerParameters startSuspended](self, "startSuspended"));
    }
  }
  return v3;
}

- (id)controllerParams
{
  if ([(HMMTRControllerParameters *)self usesCommonStorageDelegate])
  {
    id v3 = objc_alloc(MEMORY[0x263F10DD0]);
    v4 = [(HMMTRControllerParameters *)self ipk];
    v5 = [(HMMTRControllerParameters *)self operationalKeypair];
    v6 = [(HMMTRControllerParameters *)self operationalCertificate];
    v7 = [(HMMTRControllerParameters *)self intermediateCertificate];
    v8 = [(HMMTRControllerParameters *)self rootCertificate];
    v9 = (void *)[v3 initWithIPK:v4 operationalKeypair:v5 operationalCertificate:v6 intermediateCertificate:v7 rootCertificate:v8];

    v10 = [(HMMTRControllerParameters *)self vendorID];
    [v9 setVendorID:v10];

    v11 = [(HMMTRControllerParameters *)self operationalCertificateIssuer];
    [v9 setOperationalCertificateIssuer:v11];

    v12 = [(HMMTRControllerParameters *)self operationalCertificateIssuerQueue];
    [v9 setOperationalCertificateIssuerQueue:v12];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)usesCommonStorageDelegate
{
  v2 = [(HMMTRControllerParameters *)self storageDelegate];
  BOOL v3 = v2 == 0;

  return v3;
}

- (HMMTRControllerParameters)initWithStorageDelegate:(id)a3 storageDelegateQueue:(id)a4 uniqueIdentifier:(id)a5 ipk:(id)a6 vendorID:(id)a7 operationalKeypair:(id)a8 operationalCertificate:(id)a9 intermediateCertificate:(id)a10 rootCertificate:(id)a11
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v26 = a8;
  id v25 = a9;
  id v24 = a10;
  id v18 = a11;
  v32.receiver = self;
  v32.super_class = (Class)HMMTRControllerParameters;
  v19 = [(HMMTRControllerParameters *)&v32 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_storageDelegate, a3);
    objc_storeStrong((id *)&v20->_storageDelegateQueue, a4);
    objc_storeStrong((id *)&v20->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v20->_ipk, a6);
    objc_storeStrong((id *)&v20->_vendorID, a7);
    objc_storeStrong((id *)&v20->_operationalKeypair, a8);
    objc_storeStrong((id *)&v20->_operationalCertificate, a9);
    objc_storeStrong((id *)&v20->_intermediateCertificate, a10);
    objc_storeStrong((id *)&v20->_rootCertificate, a11);
    uint64_t v21 = [MEMORY[0x263F10CC0] fabricIDFromCertificate:v18];
    fabricID = v20->_fabricID;
    v20->_fabricID = (NSNumber *)v21;
  }
  return v20;
}

- (HMMTRControllerParameters)initWithIPK:(id)a3 operationalKeypair:(id)a4 operationalCertificate:(id)a5 intermediateCertificate:(id)a6 rootCertificate:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMMTRControllerParameters;
  v17 = [(HMMTRControllerParameters *)&v23 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_ipk, a3);
    objc_storeStrong((id *)&v18->_operationalKeypair, a4);
    objc_storeStrong((id *)&v18->_operationalCertificate, a5);
    objc_storeStrong((id *)&v18->_intermediateCertificate, a6);
    objc_storeStrong((id *)&v18->_rootCertificate, a7);
    uint64_t v19 = [MEMORY[0x263F10CC0] fabricIDFromCertificate:v16];
    fabricID = v18->_fabricID;
    v18->_fabricID = (NSNumber *)v19;
  }
  return v18;
}

@end