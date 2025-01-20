@interface MTROperationalCredentialsClusterAddNOCParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTROperationalCredentialsClusterAddNOCParams)init;
- (NSData)icacValue;
- (NSData)ipkValue;
- (NSData)nocValue;
- (NSNumber)adminVendorId;
- (NSNumber)caseAdminSubject;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAdminVendorId:(NSNumber *)adminVendorId;
- (void)setCaseAdminSubject:(NSNumber *)caseAdminSubject;
- (void)setIcacValue:(NSData *)icacValue;
- (void)setIpkValue:(NSData *)ipkValue;
- (void)setNocValue:(NSData *)nocValue;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTROperationalCredentialsClusterAddNOCParams

- (MTROperationalCredentialsClusterAddNOCParams)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTROperationalCredentialsClusterAddNOCParams;
  v4 = [(MTROperationalCredentialsClusterAddNOCParams *)&v17 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    nocValue = v4->_nocValue;
    v4->_nocValue = (NSData *)v5;

    icacValue = v4->_icacValue;
    v4->_icacValue = 0;

    uint64_t v10 = objc_msgSend_data(MEMORY[0x263EFF8F8], v8, v9);
    ipkValue = v4->_ipkValue;
    v4->_ipkValue = (NSData *)v10;

    caseAdminSubject = v4->_caseAdminSubject;
    v4->_caseAdminSubject = (NSNumber *)&unk_26F9C8548;

    adminVendorId = v4->_adminVendorId;
    v4->_adminVendorId = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROperationalCredentialsClusterAddNOCParams);
  v7 = objc_msgSend_nocValue(self, v5, v6);
  objc_msgSend_setNocValue_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_icacValue(self, v9, v10);
  objc_msgSend_setIcacValue_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_ipkValue(self, v13, v14);
  objc_msgSend_setIpkValue_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_caseAdminSubject(self, v17, v18);
  objc_msgSend_setCaseAdminSubject_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_adminVendorId(self, v21, v22);
  objc_msgSend_setAdminVendorId_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_nocValue, v6, 0);
  uint64_t v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_icacValue, v8, 0);
  v11 = objc_msgSend_base64EncodedStringWithOptions_(self->_ipkValue, v10, 0);
  objc_msgSend_stringWithFormat_(v3, v12, @"<%@: nocValue:%@; icacValue:%@; ipkValue:%@; caseAdminSubject:%@; adminVendorId:%@; >",
    v5,
    v7,
    v9,
    v11,
    self->_caseAdminSubject,
  v13 = self->_adminVendorId);

  return v13;
}

- (NSData)nocValue
{
  return self->_nocValue;
}

- (void)setNocValue:(NSData *)nocValue
{
}

- (NSData)icacValue
{
  return self->_icacValue;
}

- (void)setIcacValue:(NSData *)icacValue
{
}

- (NSData)ipkValue
{
  return self->_ipkValue;
}

- (void)setIpkValue:(NSData *)ipkValue
{
}

- (NSNumber)caseAdminSubject
{
  return self->_caseAdminSubject;
}

- (void)setCaseAdminSubject:(NSNumber *)caseAdminSubject
{
}

- (NSNumber)adminVendorId
{
  return self->_adminVendorId;
}

- (void)setAdminVendorId:(NSNumber *)adminVendorId
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
  objc_storeStrong((id *)&self->_adminVendorId, 0);
  objc_storeStrong((id *)&self->_caseAdminSubject, 0);
  objc_storeStrong((id *)&self->_ipkValue, 0);
  objc_storeStrong((id *)&self->_icacValue, 0);

  objc_storeStrong((id *)&self->_nocValue, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  long long v52 = 0uLL;
  char v53 = 0;
  uint64_t v56 = 0;
  long long v55 = 0uLL;
  __int16 v57 = 0;
  v51[0] = 0;
  v51[1] = 0;
  v50 = v51;
  objc_msgSend_nocValue(self, a3, (uint64_t)a4);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_bytes(v7, v8, v9);
  uint64_t v13 = objc_msgSend_length(v7, v11, v12);
  sub_2446C1098(v44, v10, v13);

  long long v52 = *(_OWORD *)v44;
  v16 = objc_msgSend_icacValue(self, v14, v15);

  if (v16)
  {
    char v53 = 1;
    long long v54 = 0uLL;
    objc_msgSend_icacValue(self, v17, v18);
    id v19 = objc_claimAutoreleasedReturnValue();
    uint64_t v22 = objc_msgSend_bytes(v19, v20, v21);
    uint64_t v25 = objc_msgSend_length(v19, v23, v24);
    sub_2446C1098(v44, v22, v25);

    long long v54 = *(_OWORD *)v44;
  }
  objc_msgSend_ipkValue(self, v17, v18);
  id v26 = objc_claimAutoreleasedReturnValue();
  uint64_t v29 = objc_msgSend_bytes(v26, v27, v28);
  uint64_t v32 = objc_msgSend_length(v26, v30, v31);
  sub_2446C1098(v44, v29, v32);

  long long v55 = *(_OWORD *)v44;
  v35 = objc_msgSend_caseAdminSubject(self, v33, v34);
  uint64_t v56 = objc_msgSend_unsignedLongLongValue(v35, v36, v37);

  v40 = objc_msgSend_adminVendorId(self, v38, v39);
  __int16 v57 = objc_msgSend_unsignedShortValue(v40, v41, v42);

  sub_244CC8F5C(0x62FuLL, 0, &v49);
  if (v49)
  {
    sub_244CB62B8((uint64_t)v44);
    v46 = 0;
    v47 = 0;
    v45 = &unk_26F9536C8;
    char v48 = 0;
    sub_2447945A0((uint64_t)&v45, &v49, 0);
    sub_244CB6318((uint64_t)v44, (uint64_t)&v45, 0xFFFFFFFF, (uint64_t)v58);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244808D84((uint64_t)&v52, v44, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v44, &v49, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v49);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v45 = &unk_26F9536C8;
    sub_244794634(&v47);
    sub_244794634(&v46);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 9375;
  }
  sub_244794634(&v49);
  return (ChipError *)sub_24479466C((uint64_t)&v50);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  uint64_t v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 9404;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end