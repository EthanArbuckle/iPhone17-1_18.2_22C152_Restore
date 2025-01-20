@interface MTRICDManagementClusterUnregisterClientParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRICDManagementClusterUnregisterClientParams)init;
- (NSData)verificationKey;
- (NSNumber)checkInNodeID;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCheckInNodeID:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setVerificationKey:(id)a3;
@end

@implementation MTRICDManagementClusterUnregisterClientParams

- (MTRICDManagementClusterUnregisterClientParams)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRICDManagementClusterUnregisterClientParams;
  v2 = [(MTRICDManagementClusterUnregisterClientParams *)&v9 init];
  v3 = v2;
  if (v2)
  {
    checkInNodeID = v2->_checkInNodeID;
    v2->_checkInNodeID = (NSNumber *)&unk_26F9C8548;

    verificationKey = v3->_verificationKey;
    v3->_verificationKey = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRICDManagementClusterUnregisterClientParams);
  v7 = objc_msgSend_checkInNodeID(self, v5, v6);
  objc_msgSend_setCheckInNodeID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_verificationKey(self, v9, v10);
  objc_msgSend_setVerificationKey_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_serverSideProcessingTimeout(self, v17, v18);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  checkInNodeID = self->_checkInNodeID;
  v8 = objc_msgSend_base64EncodedStringWithOptions_(self->_verificationKey, v7, 0);
  objc_msgSend_stringWithFormat_(v3, v9, @"<%@: checkInNodeID:%@; verificationKey:%@; >",
    v5,
    checkInNodeID,
  uint64_t v10 = v8);

  return v10;
}

- (NSNumber)checkInNodeID
{
  return self->_checkInNodeID;
}

- (void)setCheckInNodeID:(id)a3
{
}

- (NSData)verificationKey
{
  return self->_verificationKey;
}

- (void)setVerificationKey:(id)a3
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
  objc_storeStrong((id *)&self->_verificationKey, 0);

  objc_storeStrong((id *)&self->_checkInNodeID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  uint64_t v31 = 0;
  char v32 = 0;
  v30[0] = 0;
  v30[1] = 0;
  v29 = v30;
  v7 = objc_msgSend_checkInNodeID(self, a3, (uint64_t)a4);
  uint64_t v31 = objc_msgSend_unsignedLongLongValue(v7, v8, v9);

  v12 = objc_msgSend_verificationKey(self, v10, v11);

  if (v12)
  {
    char v32 = 1;
    long long v33 = 0uLL;
    objc_msgSend_verificationKey(self, v13, v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_bytes(v15, v16, v17);
    uint64_t v21 = objc_msgSend_length(v15, v19, v20);
    sub_2446C1098(v23, v18, v21);

    long long v33 = *(_OWORD *)v23;
  }
  sub_244CC8F5C(0x62FuLL, 0, &v28);
  if (v28)
  {
    sub_244CB62B8((uint64_t)v23);
    v25 = 0;
    v26 = 0;
    v24 = &unk_26F9536C8;
    char v27 = 0;
    sub_2447945A0((uint64_t)&v24, &v28, 0);
    sub_244CB6318((uint64_t)v23, (uint64_t)&v24, 0xFFFFFFFF, (uint64_t)v34);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24480B860((uint64_t)&v31, v23, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v23, &v28, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v28);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v24 = &unk_26F9536C8;
    sub_244794634(&v26);
    sub_244794634(&v25);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 10645;
  }
  sub_244794634(&v28);
  return (ChipError *)sub_24479466C((uint64_t)&v29);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  id v15 = 0;
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
    int v11 = 10674;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end