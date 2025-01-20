@interface MTRAccountLoginClusterGetSetupPINParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRAccountLoginClusterGetSetupPINParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)tempAccountIdentifier;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTempAccountIdentifier:(NSString *)tempAccountIdentifier;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRAccountLoginClusterGetSetupPINParams

- (MTRAccountLoginClusterGetSetupPINParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRAccountLoginClusterGetSetupPINParams;
  v2 = [(MTRAccountLoginClusterGetSetupPINParams *)&v8 init];
  v3 = v2;
  if (v2)
  {
    tempAccountIdentifier = v2->_tempAccountIdentifier;
    v2->_tempAccountIdentifier = (NSString *)&stru_26F969DC8;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccountLoginClusterGetSetupPINParams);
  v7 = objc_msgSend_tempAccountIdentifier(self, v5, v6);
  objc_msgSend_setTempAccountIdentifier_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_serverSideProcessingTimeout(self, v13, v14);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: tempAccountIdentifier:%@; >",
    v5,
  v7 = self->_tempAccountIdentifier);

  return v7;
}

- (NSString)tempAccountIdentifier
{
  return self->_tempAccountIdentifier;
}

- (void)setTempAccountIdentifier:(NSString *)tempAccountIdentifier
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

  objc_storeStrong((id *)&self->_tempAccountIdentifier, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  long long v21 = 0uLL;
  v20[0] = 0;
  v20[1] = 0;
  v19 = v20;
  objc_msgSend_tempAccountIdentifier(self, a3, (uint64_t)a4);
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_UTF8String(v6, v7, v8);
  uint64_t v11 = objc_msgSend_lengthOfBytesUsingEncoding_(v6, v10, 4);
  sub_24479476C(v13, v9, v11);

  long long v21 = *(_OWORD *)v13;
  sub_244CC8F5C(0x62FuLL, 0, &v18);
  if (v18)
  {
    sub_244CB62B8((uint64_t)v13);
    v15 = 0;
    v16 = 0;
    uint64_t v14 = &unk_26F9536C8;
    char v17 = 0;
    sub_2447945A0((uint64_t)&v14, &v18, 0);
    sub_244CB6318((uint64_t)v13, (uint64_t)&v14, 0xFFFFFFFF, (uint64_t)v22);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244809530((uint64_t)&v21, v13, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v13, &v18, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v18);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    uint64_t v14 = &unk_26F9536C8;
    sub_244794634(&v16);
    sub_244794634(&v15);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 30420;
  }
  sub_244794634(&v18);
  return (ChipError *)sub_24479466C((uint64_t)&v19);
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
    int v11 = 30449;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end