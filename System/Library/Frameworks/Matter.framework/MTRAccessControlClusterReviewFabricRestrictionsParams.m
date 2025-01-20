@interface MTRAccessControlClusterReviewFabricRestrictionsParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRAccessControlClusterReviewFabricRestrictionsParams)init;
- (NSArray)arl;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArl:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRAccessControlClusterReviewFabricRestrictionsParams

- (MTRAccessControlClusterReviewFabricRestrictionsParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRAccessControlClusterReviewFabricRestrictionsParams;
  v4 = [(MTRAccessControlClusterReviewFabricRestrictionsParams *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    arl = v4->_arl;
    v4->_arl = (NSArray *)v5;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccessControlClusterReviewFabricRestrictionsParams);
  v7 = objc_msgSend_arl(self, v5, v6);
  objc_msgSend_setArl_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_serverSideProcessingTimeout(self, v13, v14);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: arl:%@ >", v5, self->_arl);;

  return v7;
}

- (NSArray)arl
{
  return self->_arl;
}

- (void)setArl:(id)a3
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

  objc_storeStrong((id *)&self->_arl, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  long long v19 = 0uLL;
  v18[0] = 0;
  v18[1] = 0;
  v17 = v18;
  v4 = objc_msgSend_arl(self, a3, (uint64_t)a4);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7) {
    operator new();
  }
  long long v19 = 0uLL;
  sub_244CC8F5C(0x62FuLL, 0, &v16);
  if (v16)
  {
    sub_244CB62B8((uint64_t)v11);
    v13 = 0;
    uint64_t v14 = 0;
    v12 = &unk_26F9536C8;
    char v15 = 0;
    sub_2447945A0((uint64_t)&v12, &v16, 0);
    sub_244CB6318((uint64_t)v11, (uint64_t)&v12, 0xFFFFFFFF, (uint64_t)v20);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2447F5508((uint64_t *)&v19, v11, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v11, &v16, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v16);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v12 = &unk_26F9536C8;
    sub_244794634(&v14);
    sub_244794634(&v13);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 3043;
  }
  sub_244794634(&v16);
  return (ChipError *)sub_24479466C((uint64_t)&v17);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  char v15 = 0;
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
    int v11 = 3072;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end