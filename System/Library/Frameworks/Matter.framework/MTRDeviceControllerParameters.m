@interface MTRDeviceControllerParameters
+ (id)fabricIDFromNOC:(id)a3;
+ (id)nodeIDFromNOC:(id)a3;
+ (id)publicKeyFromCertificate:(id)a3;
- (BOOL)shouldAdvertiseOperational;
- (MTRDeviceControllerParameters)initWithStorageDelegate:(id)a3 storageDelegateQueue:(id)a4 uniqueIdentifier:(id)a5 ipk:(id)a6 vendorID:(id)a7 operationalKeypair:(id)a8 operationalCertificate:(id)a9 intermediateCertificate:(id)a10 rootCertificate:(id)a11;
- (MTRDeviceControllerStorageDelegate)storageDelegate;
- (MTRDeviceStorageBehaviorConfiguration)storageBehaviorConfiguration;
- (MTRKeypair)operationalKeypair;
- (MTROTAProviderDelegate)otaProviderDelegate;
- (MTROperationalCertificateIssuer)operationalCertificateIssuer;
- (NSArray)certificationDeclarationCertificates;
- (NSArray)productAttestationAuthorityCertificates;
- (NSData)intermediateCertificate;
- (NSData)ipk;
- (NSData)operationalCertificate;
- (NSData)rootCertificate;
- (NSNumber)vendorID;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)operationalCertificateIssuerQueue;
- (OS_dispatch_queue)otaProviderDelegateQueue;
- (OS_dispatch_queue)storageDelegateQueue;
- (unint64_t)concurrentSubscriptionEstablishmentsAllowedOnThread;
- (void)setCertificationDeclarationCertificates:(id)a3;
- (void)setConcurrentSubscriptionEstablishmentsAllowedOnThread:(unint64_t)a3;
- (void)setOTAProviderDelegate:(id)a3 queue:(id)a4;
- (void)setOperationalCertificateIssuer:(id)a3 queue:(id)a4;
- (void)setProductAttestationAuthorityCertificates:(id)a3;
- (void)setShouldAdvertiseOperational:(BOOL)a3;
- (void)setStorageBehaviorConfiguration:(id)a3;
@end

@implementation MTRDeviceControllerParameters

- (MTRDeviceControllerParameters)initWithStorageDelegate:(id)a3 storageDelegateQueue:(id)a4 uniqueIdentifier:(id)a5 ipk:(id)a6 vendorID:(id)a7 operationalKeypair:(id)a8 operationalCertificate:(id)a9 intermediateCertificate:(id)a10 rootCertificate:(id)a11
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v28 = a9;
  id v27 = a10;
  id v26 = a11;
  v35.receiver = self;
  v35.super_class = (Class)MTRDeviceControllerParameters;
  v18 = [(MTRDeviceControllerAbstractParameters *)&v35 _initInternal];
  v19 = v18;
  if (v18)
  {
    v20 = *(void **)&v18->_shouldAdvertiseOperational;
    *(void *)&v18->_shouldAdvertiseOperational = 0;

    productAttestationAuthorityCertificates = v19->_productAttestationAuthorityCertificates;
    v19->_productAttestationAuthorityCertificates = 0;

    *(&v19->super._startSuspended + 1) = 0;
    objc_storeStrong((id *)&v19->_storageBehaviorConfiguration, a6);
    objc_storeStrong((id *)&v19->_ipk, a7);
    objc_storeStrong((id *)&v19->_vendorID, a11);
    objc_storeStrong((id *)&v19->_rootCertificate, a10);
    objc_storeStrong((id *)&v19->_intermediateCertificate, a9);
    objc_storeStrong((id *)&v19->_operationalCertificate, a8);
    operationalKeypair = v19->_operationalKeypair;
    v19->_operationalKeypair = 0;

    operationalCertificateIssuer = v19->_operationalCertificateIssuer;
    v19->_operationalCertificateIssuer = 0;

    objc_storeStrong((id *)&v19->_operationalCertificateIssuerQueue, a3);
    objc_storeStrong((id *)&v19->_storageDelegate, a4);
    objc_storeStrong((id *)&v19->_storageDelegateQueue, a5);
    v19->_certificationDeclarationCertificates = (NSArray *)300;
    v24 = v19;
  }

  return v19;
}

- (void)setOperationalCertificateIssuer:(id)a3 queue:(id)a4
{
  v6 = (MTRKeypair *)a3;
  v7 = (MTROperationalCertificateIssuer *)a4;
  operationalKeypair = self->_operationalKeypair;
  self->_operationalKeypair = v6;
  v10 = v6;

  operationalCertificateIssuer = self->_operationalCertificateIssuer;
  self->_operationalCertificateIssuer = v7;
}

- (void)setOTAProviderDelegate:(id)a3 queue:(id)a4
{
  v6 = (NSUUID *)a3;
  v7 = (MTROTAProviderDelegate *)a4;
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v6;
  v10 = v6;

  otaProviderDelegate = self->_otaProviderDelegate;
  self->_otaProviderDelegate = v7;
}

+ (id)nodeIDFromNOC:(id)a3
{
  id v6 = 0;
  sub_244B2B594((uint64_t)a3, (char *)&v6, &v7, (uint64_t)v5);
  id v3 = v6;

  return v3;
}

+ (id)fabricIDFromNOC:(id)a3
{
  id v6 = 0;
  sub_244B2B594((uint64_t)a3, v7, &v6, (uint64_t)v5);
  id v3 = v6;

  return v3;
}

+ (id)publicKeyFromCertificate:(id)a3
{
  v17[9] = *MEMORY[0x263EF8340];
  v16 = &unk_26F954540;
  id v3 = a3;
  uint64_t v6 = objc_msgSend_bytes(v3, v4, v5);
  uint64_t v9 = objc_msgSend_length(v3, v7, v8);
  sub_2446C1098(&v15, v6, v9);

  *(_OWORD *)v13 = v15;
  sub_244CEF4D0(v13, (uint64_t)&v16, (uint64_t)v14);
  if (v14[0])
  {
    v11 = 0;
  }
  else
  {
    v11 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v10, (uint64_t)v17, 65);
  }

  return v11;
}

- (NSArray)productAttestationAuthorityCertificates
{
  return *(NSArray **)&self->_shouldAdvertiseOperational;
}

- (void)setProductAttestationAuthorityCertificates:(id)a3
{
}

- (NSArray)certificationDeclarationCertificates
{
  return self->_productAttestationAuthorityCertificates;
}

- (void)setCertificationDeclarationCertificates:(id)a3
{
}

- (BOOL)shouldAdvertiseOperational
{
  return *(&self->super._startSuspended + 1);
}

- (void)setShouldAdvertiseOperational:(BOOL)a3
{
  *(&self->super._startSuspended + 1) = a3;
}

- (unint64_t)concurrentSubscriptionEstablishmentsAllowedOnThread
{
  return (unint64_t)self->_certificationDeclarationCertificates;
}

- (void)setConcurrentSubscriptionEstablishmentsAllowedOnThread:(unint64_t)a3
{
  self->_certificationDeclarationCertificates = (NSArray *)a3;
}

- (MTRDeviceStorageBehaviorConfiguration)storageBehaviorConfiguration
{
  return (MTRDeviceStorageBehaviorConfiguration *)self->_concurrentSubscriptionEstablishmentsAllowedOnThread;
}

- (void)setStorageBehaviorConfiguration:(id)a3
{
}

- (NSData)ipk
{
  return (NSData *)self->_storageBehaviorConfiguration;
}

- (NSNumber)vendorID
{
  return (NSNumber *)self->_ipk;
}

- (NSData)rootCertificate
{
  return (NSData *)self->_vendorID;
}

- (NSData)intermediateCertificate
{
  return self->_rootCertificate;
}

- (NSData)operationalCertificate
{
  return self->_intermediateCertificate;
}

- (MTRKeypair)operationalKeypair
{
  return (MTRKeypair *)self->_operationalCertificate;
}

- (MTROperationalCertificateIssuer)operationalCertificateIssuer
{
  return self->_operationalKeypair;
}

- (OS_dispatch_queue)operationalCertificateIssuerQueue
{
  return self->_operationalCertificateIssuer;
}

- (MTRDeviceControllerStorageDelegate)storageDelegate
{
  return self->_operationalCertificateIssuerQueue;
}

- (OS_dispatch_queue)storageDelegateQueue
{
  return self->_storageDelegate;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)self->_storageDelegateQueue;
}

- (MTROTAProviderDelegate)otaProviderDelegate
{
  return (MTROTAProviderDelegate *)self->_uniqueIdentifier;
}

- (OS_dispatch_queue)otaProviderDelegateQueue
{
  return self->_otaProviderDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otaProviderDelegate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_storageDelegateQueue, 0);
  objc_storeStrong((id *)&self->_storageDelegate, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuerQueue, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuer, 0);
  objc_storeStrong((id *)&self->_operationalKeypair, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_storageBehaviorConfiguration, 0);
  objc_storeStrong((id *)&self->_concurrentSubscriptionEstablishmentsAllowedOnThread, 0);
  objc_storeStrong((id *)&self->_productAttestationAuthorityCertificates, 0);

  objc_storeStrong((id *)&self->_shouldAdvertiseOperational, 0);
}

@end