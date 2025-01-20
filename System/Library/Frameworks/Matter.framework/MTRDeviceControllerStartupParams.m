@interface MTRDeviceControllerStartupParams
- (MTRCertificateDERBytes)intermediateCertificate;
- (MTRCertificateDERBytes)operationalCertificate;
- (MTRCertificateDERBytes)rootCertificate;
- (MTRDeviceControllerStartupParams)initWithIPK:(NSData *)ipk fabricID:(NSNumber *)fabricID nocSigner:(id)nocSigner;
- (MTRDeviceControllerStartupParams)initWithIPK:(NSData *)ipk operationalKeypair:(id)operationalKeypair operationalCertificate:(MTRCertificateDERBytes)operationalCertificate intermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate rootCertificate:(MTRCertificateDERBytes)rootCertificate;
- (MTRDeviceControllerStartupParams)initWithOperationalKeypair:(id)operationalKeypair operationalCertificate:(MTRCertificateDERBytes)operationalCertificate intermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate rootCertificate:(MTRCertificateDERBytes)rootCertificate ipk:(NSData *)ipk;
- (MTRDeviceControllerStartupParams)initWithParameters:(id)a3 error:(ChipError *)a4;
- (MTRDeviceControllerStartupParams)initWithParams:(id)a3;
- (MTRDeviceControllerStartupParams)initWithSigningKeypair:(id)nocSigner fabricId:(uint64_t)fabricId ipk:(NSData *)ipk;
- (NSData)ipk;
- (NSNumber)fabricID;
- (NSNumber)nodeID;
- (NSNumber)vendorID;
- (NSSet)caseAuthenticatedTags;
- (NSUUID)uniqueIdentifier;
- (dispatch_queue_t)operationalCertificateIssuerQueue;
- (id)nocSigner;
- (id)operationalCertificateIssuer;
- (id)operationalKeypair;
- (uint64_t)fabricId;
- (void)setCaseAuthenticatedTags:(NSSet *)caseAuthenticatedTags;
- (void)setIntermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate;
- (void)setNodeID:(NSNumber *)nodeID;
- (void)setOperationalCertificate:(id)a3;
- (void)setOperationalCertificateIssuer:(id)operationalCertificateIssuer;
- (void)setOperationalCertificateIssuerQueue:(dispatch_queue_t)operationalCertificateIssuerQueue;
- (void)setOperationalKeypair:(id)operationalKeypair;
- (void)setRootCertificate:(MTRCertificateDERBytes)rootCertificate;
- (void)setVendorID:(NSNumber *)vendorID;
@end

@implementation MTRDeviceControllerStartupParams

- (MTRDeviceControllerStartupParams)initWithIPK:(NSData *)ipk fabricID:(NSNumber *)fabricID nocSigner:(id)nocSigner
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v8 = ipk;
  v9 = fabricID;
  id v10 = nocSigner;
  v34.receiver = self;
  v34.super_class = (Class)MTRDeviceControllerStartupParams;
  v13 = [(MTRDeviceControllerStartupParams *)&v34 init];
  if (!v13)
  {
LABEL_8:
    v26 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend_unsignedLongLongValue(v9, v11, v12))
  {
    v27 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = objc_msgSend_unsignedLongLongValue(v9, v28, v29);
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = v30;
      _os_log_impl(&dword_2446BD000, v27, OS_LOG_TYPE_ERROR, "%llu is not a valid fabric id to initialize a device controller with", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      objc_msgSend_unsignedLongLongValue(v9, v31, v32);
      sub_244CC4DE0(0, 1);
    }
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v13->_nocSigner, nocSigner);
  uint64_t v16 = objc_msgSend_copy(v9, v14, v15);
  v17 = v13->_fabricID;
  v13->_fabricID = (NSNumber *)v16;

  uint64_t v20 = objc_msgSend_copy(v8, v18, v19);
  v21 = v13->_ipk;
  v13->_ipk = (NSData *)v20;

  uint64_t v24 = objc_msgSend_UUID(MEMORY[0x263F08C38], v22, v23);
  uniqueIdentifier = v13->_uniqueIdentifier;
  v13->_uniqueIdentifier = (NSUUID *)v24;

  v26 = v13;
LABEL_9:

  return v26;
}

- (MTRDeviceControllerStartupParams)initWithIPK:(NSData *)ipk operationalKeypair:(id)operationalKeypair operationalCertificate:(MTRCertificateDERBytes)operationalCertificate intermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate rootCertificate:(MTRCertificateDERBytes)rootCertificate
{
  uint64_t v12 = ipk;
  id v13 = operationalKeypair;
  v14 = operationalCertificate;
  uint64_t v15 = intermediateCertificate;
  uint64_t v16 = rootCertificate;
  v44.receiver = self;
  v44.super_class = (Class)MTRDeviceControllerStartupParams;
  v17 = [(MTRDeviceControllerStartupParams *)&v44 init];
  if (v17)
  {
    memset(v43, 0, sizeof(v43));
    id v42 = 0;
    uint64_t v45 = 0;
    sub_244B2B594((uint64_t)v14, (char *)&v45, &v42, (uint64_t)v43);
    v18 = (NSNumber *)v42;
    if (!LODWORD(v43[0]))
    {
      fabricID = v17->_fabricID;
      v17->_fabricID = v18;

      objc_storeStrong((id *)&v17->_operationalKeypair, operationalKeypair);
      uint64_t v23 = objc_msgSend_copy(v14, v21, v22);
      uint64_t v24 = v17->_operationalCertificate;
      v17->_operationalCertificate = (NSData *)v23;

      uint64_t v27 = objc_msgSend_copy(v15, v25, v26);
      v28 = v17->_intermediateCertificate;
      v17->_intermediateCertificate = (NSData *)v27;

      uint64_t v31 = objc_msgSend_copy(v16, v29, v30);
      uint64_t v32 = v17->_rootCertificate;
      v17->_rootCertificate = (NSData *)v31;

      uint64_t v35 = objc_msgSend_copy(v12, v33, v34);
      uint64_t v36 = v17->_ipk;
      v17->_ipk = (NSData *)v35;

      uint64_t v39 = objc_msgSend_UUID(MEMORY[0x263F08C38], v37, v38);
      uniqueIdentifier = v17->_uniqueIdentifier;
      v17->_uniqueIdentifier = (NSUUID *)v39;

      uint64_t v19 = v17;
      goto LABEL_6;
    }
  }
  uint64_t v19 = 0;
LABEL_6:

  return v19;
}

- (MTRDeviceControllerStartupParams)initWithParams:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)MTRDeviceControllerStartupParams;
  v7 = [(MTRDeviceControllerStartupParams *)&v60 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_nocSigner(v4, v5, v6);
    nocSigner = v7->_nocSigner;
    v7->_nocSigner = (MTRKeypair *)v8;

    uint64_t v12 = objc_msgSend_fabricID(v4, v10, v11);
    fabricID = v7->_fabricID;
    v7->_fabricID = (NSNumber *)v12;

    uint64_t v16 = objc_msgSend_ipk(v4, v14, v15);
    ipk = v7->_ipk;
    v7->_ipk = (NSData *)v16;

    uint64_t v20 = objc_msgSend_vendorID(v4, v18, v19);
    vendorID = v7->_vendorID;
    v7->_vendorID = (NSNumber *)v20;

    uint64_t v24 = objc_msgSend_nodeID(v4, v22, v23);
    nodeID = v7->_nodeID;
    v7->_nodeID = (NSNumber *)v24;

    uint64_t v28 = objc_msgSend_caseAuthenticatedTags(v4, v26, v27);
    caseAuthenticatedTags = v7->_caseAuthenticatedTags;
    v7->_caseAuthenticatedTags = (NSSet *)v28;

    uint64_t v32 = objc_msgSend_rootCertificate(v4, v30, v31);
    rootCertificate = v7->_rootCertificate;
    v7->_rootCertificate = (NSData *)v32;

    uint64_t v36 = objc_msgSend_intermediateCertificate(v4, v34, v35);
    intermediateCertificate = v7->_intermediateCertificate;
    v7->_intermediateCertificate = (NSData *)v36;

    uint64_t v40 = objc_msgSend_operationalCertificate(v4, v38, v39);
    operationalCertificate = v7->_operationalCertificate;
    v7->_operationalCertificate = (NSData *)v40;

    uint64_t v44 = objc_msgSend_operationalKeypair(v4, v42, v43);
    operationalKeypair = v7->_operationalKeypair;
    v7->_operationalKeypair = (MTRKeypair *)v44;

    uint64_t v48 = objc_msgSend_operationalCertificateIssuer(v4, v46, v47);
    operationalCertificateIssuer = v7->_operationalCertificateIssuer;
    v7->_operationalCertificateIssuer = (MTROperationalCertificateIssuer *)v48;

    uint64_t v52 = objc_msgSend_operationalCertificateIssuerQueue(v4, v50, v51);
    operationalCertificateIssuerQueue = v7->_operationalCertificateIssuerQueue;
    v7->_operationalCertificateIssuerQueue = (OS_dispatch_queue *)v52;

    uint64_t v56 = objc_msgSend_uniqueIdentifier(v4, v54, v55);
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSUUID *)v56;

    v58 = v7;
  }

  return v7;
}

- (MTRDeviceControllerStartupParams)initWithParameters:(id)a3 error:(ChipError *)a4
{
  id v6 = a3;
  v59.receiver = self;
  v59.super_class = (Class)MTRDeviceControllerStartupParams;
  v7 = [(MTRDeviceControllerStartupParams *)&v59 init];
  uint64_t v8 = v7;
  if (!v7)
  {
    a4->mError = 3;
    a4->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceC"
                "ontrollerStartupParams.mm";
    unsigned int v15 = 146;
LABEL_11:
    a4->mLine = v15;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_ERROR, "Unexpected subclass of MTRDeviceControllerParameters", buf, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    v7 = 0;
    a4->mError = 47;
    a4->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDeviceC"
                "ontrollerStartupParams.mm";
    unsigned int v15 = 152;
    goto LABEL_11;
  }
  nocSigner = v7->_nocSigner;
  v7->_nocSigner = 0;

  uint64_t v12 = objc_msgSend_operationalCertificate(v6, v10, v11);
  id v56 = 0;
  uint64_t v60 = 0;
  sub_244B2B594((uint64_t)v12, (char *)&v60, &v56, (uint64_t)buf);
  id v13 = v56;
  id v14 = v56;
  *(_OWORD *)&a4->mError = *(_OWORD *)buf;
  *(void *)&a4->mLine = v58;

  if (a4->mError)
  {
    v7 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v7->_fabricID, v13);
    uint64_t v19 = objc_msgSend_ipk(v6, v17, v18);
    ipk = v7->_ipk;
    v7->_ipk = (NSData *)v19;

    uint64_t v23 = objc_msgSend_vendorID(v6, v21, v22);
    vendorID = v7->_vendorID;
    v7->_vendorID = (NSNumber *)v23;

    nodeID = v7->_nodeID;
    v7->_nodeID = 0;

    caseAuthenticatedTags = v7->_caseAuthenticatedTags;
    v7->_caseAuthenticatedTags = 0;

    uint64_t v29 = objc_msgSend_rootCertificate(v6, v27, v28);
    rootCertificate = v7->_rootCertificate;
    v7->_rootCertificate = (NSData *)v29;

    uint64_t v33 = objc_msgSend_intermediateCertificate(v6, v31, v32);
    intermediateCertificate = v7->_intermediateCertificate;
    v7->_intermediateCertificate = (NSData *)v33;

    uint64_t v37 = objc_msgSend_operationalCertificate(v6, v35, v36);
    operationalCertificate = v7->_operationalCertificate;
    v7->_operationalCertificate = (NSData *)v37;

    uint64_t v41 = objc_msgSend_operationalKeypair(v6, v39, v40);
    operationalKeypair = v7->_operationalKeypair;
    v7->_operationalKeypair = (MTRKeypair *)v41;

    uint64_t v45 = objc_msgSend_operationalCertificateIssuer(v6, v43, v44);
    operationalCertificateIssuer = v7->_operationalCertificateIssuer;
    v7->_operationalCertificateIssuer = (MTROperationalCertificateIssuer *)v45;

    uint64_t v49 = objc_msgSend_operationalCertificateIssuerQueue(v6, v47, v48);
    operationalCertificateIssuerQueue = v7->_operationalCertificateIssuerQueue;
    v7->_operationalCertificateIssuerQueue = (OS_dispatch_queue *)v49;

    uint64_t v53 = objc_msgSend_uniqueIdentifier(v6, v51, v52);
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSUUID *)v53;

    v7 = v7;
  }

LABEL_14:
  return v7;
}

- (id)nocSigner
{
  return self->_nocSigner;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (NSData)ipk
{
  return self->_ipk;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(NSNumber *)vendorID
{
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(NSNumber *)nodeID
{
}

- (NSSet)caseAuthenticatedTags
{
  return self->_caseAuthenticatedTags;
}

- (void)setCaseAuthenticatedTags:(NSSet *)caseAuthenticatedTags
{
}

- (MTRCertificateDERBytes)rootCertificate
{
  return self->_rootCertificate;
}

- (void)setRootCertificate:(MTRCertificateDERBytes)rootCertificate
{
}

- (MTRCertificateDERBytes)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (void)setIntermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate
{
}

- (MTRCertificateDERBytes)operationalCertificate
{
  return self->_operationalCertificate;
}

- (void)setOperationalCertificate:(id)a3
{
}

- (id)operationalKeypair
{
  return self->_operationalKeypair;
}

- (void)setOperationalKeypair:(id)operationalKeypair
{
}

- (id)operationalCertificateIssuer
{
  return self->_operationalCertificateIssuer;
}

- (void)setOperationalCertificateIssuer:(id)operationalCertificateIssuer
{
}

- (dispatch_queue_t)operationalCertificateIssuerQueue
{
  return (dispatch_queue_t)self->_operationalCertificateIssuerQueue;
}

- (void)setOperationalCertificateIssuerQueue:(dispatch_queue_t)operationalCertificateIssuerQueue
{
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuerQueue, 0);
  objc_storeStrong((id *)&self->_operationalCertificateIssuer, 0);
  objc_storeStrong((id *)&self->_operationalKeypair, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_caseAuthenticatedTags, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);

  objc_storeStrong((id *)&self->_nocSigner, 0);
}

- (uint64_t)fabricId
{
  v3 = objc_msgSend_fabricID(self, a2, v2);
  uint64_t v6 = objc_msgSend_unsignedLongLongValue(v3, v4, v5);

  return v6;
}

- (MTRDeviceControllerStartupParams)initWithSigningKeypair:(id)nocSigner fabricId:(uint64_t)fabricId ipk:(NSData *)ipk
{
  id v8 = nocSigner;
  v9 = ipk;
  uint64_t v11 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v10, fabricId);
  id v13 = (MTRDeviceControllerStartupParams *)objc_msgSend_initWithIPK_fabricID_nocSigner_(self, v12, (uint64_t)v9, v11, v8);

  return v13;
}

- (MTRDeviceControllerStartupParams)initWithOperationalKeypair:(id)operationalKeypair operationalCertificate:(MTRCertificateDERBytes)operationalCertificate intermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate rootCertificate:(MTRCertificateDERBytes)rootCertificate ipk:(NSData *)ipk
{
  return (MTRDeviceControllerStartupParams *)MEMORY[0x270F9A6D0](self, sel_initWithIPK_operationalKeypair_operationalCertificate_intermediateCertificate_rootCertificate_, ipk);
}

@end