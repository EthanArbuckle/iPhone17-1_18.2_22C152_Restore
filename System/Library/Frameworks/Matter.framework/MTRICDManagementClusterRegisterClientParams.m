@interface MTRICDManagementClusterRegisterClientParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRICDManagementClusterRegisterClientParams)init;
- (NSData)key;
- (NSData)verificationKey;
- (NSNumber)checkInNodeID;
- (NSNumber)clientType;
- (NSNumber)monitoredSubject;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCheckInNodeID:(id)a3;
- (void)setClientType:(id)a3;
- (void)setKey:(id)a3;
- (void)setMonitoredSubject:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setVerificationKey:(id)a3;
@end

@implementation MTRICDManagementClusterRegisterClientParams

- (MTRICDManagementClusterRegisterClientParams)init
{
  v15.receiver = self;
  v15.super_class = (Class)MTRICDManagementClusterRegisterClientParams;
  v2 = [(MTRICDManagementClusterRegisterClientParams *)&v15 init];
  v3 = v2;
  if (v2)
  {
    checkInNodeID = v2->_checkInNodeID;
    v2->_checkInNodeID = (NSNumber *)&unk_26F9C8548;

    monitoredSubject = v3->_monitoredSubject;
    v3->_monitoredSubject = (NSNumber *)&unk_26F9C8548;

    uint64_t v8 = objc_msgSend_data(MEMORY[0x263EFF8F8], v6, v7);
    key = v3->_key;
    v3->_key = (NSData *)v8;

    verificationKey = v3->_verificationKey;
    v3->_verificationKey = 0;

    clientType = v3->_clientType;
    v3->_clientType = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRICDManagementClusterRegisterClientParams);
  uint64_t v7 = objc_msgSend_checkInNodeID(self, v5, v6);
  objc_msgSend_setCheckInNodeID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_monitoredSubject(self, v9, v10);
  objc_msgSend_setMonitoredSubject_(v4, v12, (uint64_t)v11);

  objc_super v15 = objc_msgSend_key(self, v13, v14);
  objc_msgSend_setKey_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_verificationKey(self, v17, v18);
  objc_msgSend_setVerificationKey_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_clientType(self, v21, v22);
  objc_msgSend_setClientType_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  checkInNodeID = self->_checkInNodeID;
  monitoredSubject = self->_monitoredSubject;
  v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_key, v8, 0);
  v11 = objc_msgSend_base64EncodedStringWithOptions_(self->_verificationKey, v10, 0);
  objc_msgSend_stringWithFormat_(v3, v12, @"<%@: checkInNodeID:%@; monitoredSubject:%@; key:%@; verificationKey:%@; clientType:%@; >",
    v5,
    checkInNodeID,
    monitoredSubject,
    v9,
    v11,
  v13 = self->_clientType);

  return v13;
}

- (NSNumber)checkInNodeID
{
  return self->_checkInNodeID;
}

- (void)setCheckInNodeID:(id)a3
{
}

- (NSNumber)monitoredSubject
{
  return self->_monitoredSubject;
}

- (void)setMonitoredSubject:(id)a3
{
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)verificationKey
{
  return self->_verificationKey;
}

- (void)setVerificationKey:(id)a3
{
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (void)setClientType:(id)a3
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
  objc_storeStrong((id *)&self->_verificationKey, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_monitoredSubject, 0);

  objc_storeStrong((id *)&self->_checkInNodeID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v52 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  char v50 = 0;
  v47[0] = 0;
  v47[1] = 0;
  v46 = v47;
  uint64_t v7 = objc_msgSend_checkInNodeID(self, a3, (uint64_t)a4);
  *(void *)&long long v48 = objc_msgSend_unsignedLongLongValue(v7, v8, v9);

  v12 = objc_msgSend_monitoredSubject(self, v10, v11);
  *((void *)&v48 + 1) = objc_msgSend_unsignedLongLongValue(v12, v13, v14);

  objc_msgSend_key(self, v15, v16);
  id v17 = objc_claimAutoreleasedReturnValue();
  uint64_t v20 = objc_msgSend_bytes(v17, v18, v19);
  uint64_t v23 = objc_msgSend_length(v17, v21, v22);
  sub_2446C1098(v40, v20, v23);

  long long v49 = *(_OWORD *)v40;
  uint64_t v26 = objc_msgSend_verificationKey(self, v24, v25);

  if (v26)
  {
    char v50 = 1;
    long long v51 = 0uLL;
    objc_msgSend_verificationKey(self, v27, v28);
    id v29 = objc_claimAutoreleasedReturnValue();
    uint64_t v32 = objc_msgSend_bytes(v29, v30, v31);
    uint64_t v35 = objc_msgSend_length(v29, v33, v34);
    sub_2446C1098(v40, v32, v35);

    long long v51 = *(_OWORD *)v40;
  }
  v36 = objc_msgSend_clientType(self, v27, v28);
  char v52 = objc_msgSend_unsignedCharValue(v36, v37, v38);

  sub_244CC8F5C(0x62FuLL, 0, &v45);
  if (v45)
  {
    sub_244CB62B8((uint64_t)v40);
    v42 = 0;
    v43 = 0;
    v41 = &unk_26F9536C8;
    char v44 = 0;
    sub_2447945A0((uint64_t)&v41, &v45, 0);
    sub_244CB6318((uint64_t)v40, (uint64_t)&v41, 0xFFFFFFFF, (uint64_t)v53);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24480B364((uint64_t)&v48, v40, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v40, &v45, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v45);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v41 = &unk_26F9536C8;
    sub_244794634(&v43);
    sub_244794634(&v42);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 10478;
  }
  sub_244794634(&v45);
  return (ChipError *)sub_24479466C((uint64_t)&v46);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  objc_super v15 = 0;
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
    int v11 = 10507;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end