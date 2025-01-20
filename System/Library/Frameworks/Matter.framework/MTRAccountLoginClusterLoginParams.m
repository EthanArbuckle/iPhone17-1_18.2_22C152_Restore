@interface MTRAccountLoginClusterLoginParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRAccountLoginClusterLoginParams)init;
- (NSNumber)node;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)setupPIN;
- (NSString)tempAccountIdentifier;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setNode:(id)a3;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setSetupPIN:(NSString *)setupPIN;
- (void)setTempAccountIdentifier:(NSString *)tempAccountIdentifier;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRAccountLoginClusterLoginParams

- (MTRAccountLoginClusterLoginParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRAccountLoginClusterLoginParams;
  v2 = [(MTRAccountLoginClusterLoginParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    tempAccountIdentifier = v2->_tempAccountIdentifier;
    v2->_tempAccountIdentifier = (NSString *)&stru_26F969DC8;

    setupPIN = v3->_setupPIN;
    v3->_setupPIN = (NSString *)&stru_26F969DC8;

    node = v3->_node;
    v3->_node = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccountLoginClusterLoginParams);
  v7 = objc_msgSend_tempAccountIdentifier(self, v5, v6);
  objc_msgSend_setTempAccountIdentifier_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_setupPIN(self, v9, v10);
  objc_msgSend_setSetupPIN_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_node(self, v13, v14);
  objc_msgSend_setNode_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_timedInvokeTimeoutMs(self, v17, v18);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_serverSideProcessingTimeout(self, v21, v22);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: tempAccountIdentifier:%@; setupPIN:%@; node:%@; >",
    v5,
    self->_tempAccountIdentifier,
    self->_setupPIN,
  v7 = self->_node);

  return v7;
}

- (NSString)tempAccountIdentifier
{
  return self->_tempAccountIdentifier;
}

- (void)setTempAccountIdentifier:(NSString *)tempAccountIdentifier
{
}

- (NSString)setupPIN
{
  return self->_setupPIN;
}

- (void)setSetupPIN:(NSString *)setupPIN
{
}

- (NSNumber)node
{
  return self->_node;
}

- (void)setNode:(id)a3
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
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_setupPIN, 0);

  objc_storeStrong((id *)&self->_tempAccountIdentifier, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  v37[0] = 0;
  v37[1] = 0;
  v36 = v37;
  objc_msgSend_tempAccountIdentifier(self, a3, (uint64_t)a4);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_UTF8String(v7, v8, v9);
  uint64_t v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v7, v11, 4);
  sub_24479476C(v30, v10, v12);

  long long v38 = *(_OWORD *)v30;
  objc_msgSend_setupPIN(self, v13, v14);
  id v15 = objc_claimAutoreleasedReturnValue();
  uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
  uint64_t v20 = objc_msgSend_lengthOfBytesUsingEncoding_(v15, v19, 4);
  sub_24479476C(v30, v18, v20);

  long long v39 = *(_OWORD *)v30;
  v23 = objc_msgSend_node(self, v21, v22);

  if (v23)
  {
    char v40 = 1;
    uint64_t v41 = 0;
    v26 = objc_msgSend_node(self, v24, v25);
    uint64_t v41 = objc_msgSend_unsignedLongLongValue(v26, v27, v28);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v35);
  if (v35)
  {
    sub_244CB62B8((uint64_t)v30);
    v32 = 0;
    v33 = 0;
    v31 = &unk_26F9536C8;
    char v34 = 0;
    sub_2447945A0((uint64_t)&v31, &v35, 0);
    sub_244CB6318((uint64_t)v30, (uint64_t)&v31, 0xFFFFFFFF, (uint64_t)v42);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244838BE8((uint64_t)&v38, v30, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v30, &v35, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v35);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v31 = &unk_26F9536C8;
    sub_244794634(&v33);
    sub_244794634(&v32);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 30599;
  }
  sub_244794634(&v35);
  return (ChipError *)sub_24479466C((uint64_t)&v36);
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
    int v11 = 30628;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end