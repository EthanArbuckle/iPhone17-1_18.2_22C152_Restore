@interface MTROTASoftwareUpdateProviderClusterQueryImageParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTROTASoftwareUpdateProviderClusterQueryImageParams)init;
- (NSArray)protocolsSupported;
- (NSData)metadataForProvider;
- (NSNumber)hardwareVersion;
- (NSNumber)productID;
- (NSNumber)requestorCanConsent;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)softwareVersion;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)vendorID;
- (NSString)location;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHardwareVersion:(NSNumber *)hardwareVersion;
- (void)setLocation:(NSString *)location;
- (void)setMetadataForProvider:(NSData *)metadataForProvider;
- (void)setProductID:(NSNumber *)productID;
- (void)setProtocolsSupported:(NSArray *)protocolsSupported;
- (void)setRequestorCanConsent:(NSNumber *)requestorCanConsent;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setSoftwareVersion:(NSNumber *)softwareVersion;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setVendorID:(NSNumber *)vendorID;
@end

@implementation MTROTASoftwareUpdateProviderClusterQueryImageParams

- (MTROTASoftwareUpdateProviderClusterQueryImageParams)init
{
  v18.receiver = self;
  v18.super_class = (Class)MTROTASoftwareUpdateProviderClusterQueryImageParams;
  v2 = [(MTROTASoftwareUpdateProviderClusterQueryImageParams *)&v18 init];
  v3 = v2;
  if (v2)
  {
    vendorID = v2->_vendorID;
    v2->_vendorID = (NSNumber *)&unk_26F9C8548;

    productID = v3->_productID;
    v3->_productID = (NSNumber *)&unk_26F9C8548;

    softwareVersion = v3->_softwareVersion;
    v3->_softwareVersion = (NSNumber *)&unk_26F9C8548;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8);
    protocolsSupported = v3->_protocolsSupported;
    v3->_protocolsSupported = (NSArray *)v9;

    hardwareVersion = v3->_hardwareVersion;
    v3->_hardwareVersion = 0;

    location = v3->_location;
    v3->_location = 0;

    requestorCanConsent = v3->_requestorCanConsent;
    v3->_requestorCanConsent = 0;

    metadataForProvider = v3->_metadataForProvider;
    v3->_metadataForProvider = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROTASoftwareUpdateProviderClusterQueryImageParams);
  v7 = objc_msgSend_vendorID(self, v5, v6);
  objc_msgSend_setVendorID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_productID(self, v9, v10);
  objc_msgSend_setProductID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_softwareVersion(self, v13, v14);
  objc_msgSend_setSoftwareVersion_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_protocolsSupported(self, v17, v18);
  objc_msgSend_setProtocolsSupported_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_hardwareVersion(self, v21, v22);
  objc_msgSend_setHardwareVersion_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_location(self, v25, v26);
  objc_msgSend_setLocation_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_requestorCanConsent(self, v29, v30);
  objc_msgSend_setRequestorCanConsent_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_metadataForProvider(self, v33, v34);
  objc_msgSend_setMetadataForProvider_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_timedInvokeTimeoutMs(self, v37, v38);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_serverSideProcessingTimeout(self, v41, v42);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v44, (uint64_t)v43);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  vendorID = self->_vendorID;
  productID = self->_productID;
  softwareVersion = self->_softwareVersion;
  protocolsSupported = self->_protocolsSupported;
  hardwareVersion = self->_hardwareVersion;
  location = self->_location;
  requestorCanConsent = self->_requestorCanConsent;
  uint64_t v14 = objc_msgSend_base64EncodedStringWithOptions_(self->_metadataForProvider, v13, 0);
  objc_msgSend_stringWithFormat_(v3, v15, @"<%@: vendorID:%@; productID:%@; softwareVersion:%@; protocolsSupported:%@; hardwareVersion:%@; location:%@; requestorCanConsent:%@; metadataForProvider:%@; >",
    v5,
    vendorID,
    productID,
    softwareVersion,
    protocolsSupported,
    hardwareVersion,
    location,
    requestorCanConsent,
  v16 = v14);

  return v16;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(NSNumber *)vendorID
{
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(NSNumber *)productID
{
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
}

- (NSArray)protocolsSupported
{
  return self->_protocolsSupported;
}

- (void)setProtocolsSupported:(NSArray *)protocolsSupported
{
}

- (NSNumber)hardwareVersion
{
  return self->_hardwareVersion;
}

- (void)setHardwareVersion:(NSNumber *)hardwareVersion
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(NSString *)location
{
}

- (NSNumber)requestorCanConsent
{
  return self->_requestorCanConsent;
}

- (void)setRequestorCanConsent:(NSNumber *)requestorCanConsent
{
}

- (NSData)metadataForProvider
{
  return self->_metadataForProvider;
}

- (void)setMetadataForProvider:(NSData *)metadataForProvider
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_metadataForProvider, 0);
  objc_storeStrong((id *)&self->_requestorCanConsent, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_protocolsSupported, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_productID, 0);

  objc_storeStrong((id *)&self->_vendorID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v73 = 0;
  LOBYTE(v75) = 0;
  char v76 = 0;
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  v67[1] = 0;
  uint64_t v68 = 0;
  char v71 = 0;
  v66 = v67;
  v67[0] = 0;
  v7 = objc_msgSend_vendorID(self, a3, (uint64_t)a4);
  LOWORD(v68) = objc_msgSend_unsignedShortValue(v7, v8, v9);

  v12 = objc_msgSend_productID(self, v10, v11);
  WORD1(v68) = objc_msgSend_unsignedShortValue(v12, v13, v14);

  v17 = objc_msgSend_softwareVersion(self, v15, v16);
  HIDWORD(v68) = objc_msgSend_unsignedIntValue(v17, v18, v19);

  uint64_t v22 = objc_msgSend_protocolsSupported(self, v20, v21);
  uint64_t v25 = objc_msgSend_count(v22, v23, v24);

  if (v25) {
    operator new();
  }
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  v28 = objc_msgSend_hardwareVersion(self, v26, v27);

  if (v28)
  {
    char v71 = 1;
    __int16 v72 = 0;
    v31 = objc_msgSend_hardwareVersion(self, v29, v30);
    __int16 v72 = objc_msgSend_unsignedShortValue(v31, v32, v33);
  }
  uint64_t v34 = objc_msgSend_location(self, v29, v30);

  if (v34)
  {
    char v73 = 1;
    long long v74 = 0uLL;
    objc_msgSend_location(self, v35, v36);
    id v37 = objc_claimAutoreleasedReturnValue();
    uint64_t v40 = objc_msgSend_UTF8String(v37, v38, v39);
    uint64_t v42 = objc_msgSend_lengthOfBytesUsingEncoding_(v37, v41, 4);
    sub_24479476C(v60, v40, v42);

    long long v74 = *(_OWORD *)v60;
  }
  v43 = objc_msgSend_requestorCanConsent(self, v35, v36);

  if (v43)
  {
    __int16 v75 = 1;
    v46 = objc_msgSend_requestorCanConsent(self, v44, v45);
    HIBYTE(v75) = objc_msgSend_BOOLValue(v46, v47, v48);
  }
  v49 = objc_msgSend_metadataForProvider(self, v44, v45);

  if (v49)
  {
    char v76 = 1;
    long long v77 = 0uLL;
    objc_msgSend_metadataForProvider(self, v50, v51);
    id v52 = objc_claimAutoreleasedReturnValue();
    uint64_t v55 = objc_msgSend_bytes(v52, v53, v54);
    uint64_t v58 = objc_msgSend_length(v52, v56, v57);
    sub_2446C1098(v60, v55, v58);

    long long v77 = *(_OWORD *)v60;
  }
  sub_244CC8F5C(0x62FuLL, 0, &v65);
  if (v65)
  {
    sub_244CB62B8((uint64_t)v60);
    v62 = 0;
    v63 = 0;
    v61 = &unk_26F9536C8;
    char v64 = 0;
    sub_2447945A0((uint64_t)&v61, &v65, 0);
    sub_244CB6318((uint64_t)v60, (uint64_t)&v61, 0xFFFFFFFF, (uint64_t)v78);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2447F9250(&v68, v60, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v60, &v65, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v65);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v61 = &unk_26F9536C8;
    sub_244794634(&v63);
    sub_244794634(&v62);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 4389;
  }
  sub_244794634(&v65);
  return (ChipError *)sub_24479466C((uint64_t)&v66);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  uint64_t v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 4418;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end