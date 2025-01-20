@interface MTRColorControlClusterMoveColorParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRColorControlClusterMoveColorParams)init;
- (NSNumber)optionsMask;
- (NSNumber)optionsOverride;
- (NSNumber)rateX;
- (NSNumber)rateY;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setOptionsMask:(NSNumber *)optionsMask;
- (void)setOptionsOverride:(NSNumber *)optionsOverride;
- (void)setRateX:(NSNumber *)rateX;
- (void)setRateY:(NSNumber *)rateY;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRColorControlClusterMoveColorParams

- (MTRColorControlClusterMoveColorParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRColorControlClusterMoveColorParams;
  v2 = [(MTRColorControlClusterMoveColorParams *)&v11 init];
  v3 = v2;
  if (v2)
  {
    rateX = v2->_rateX;
    v2->_rateX = (NSNumber *)&unk_26F9C8548;

    rateY = v3->_rateY;
    v3->_rateY = (NSNumber *)&unk_26F9C8548;

    optionsMask = v3->_optionsMask;
    v3->_optionsMask = (NSNumber *)&unk_26F9C8548;

    optionsOverride = v3->_optionsOverride;
    v3->_optionsOverride = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRColorControlClusterMoveColorParams);
  v7 = objc_msgSend_rateX(self, v5, v6);
  objc_msgSend_setRateX_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_rateY(self, v9, v10);
  objc_msgSend_setRateY_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_optionsMask(self, v13, v14);
  objc_msgSend_setOptionsMask_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_optionsOverride(self, v17, v18);
  objc_msgSend_setOptionsOverride_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_serverSideProcessingTimeout(self, v25, v26);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: rateX:%@; rateY:%@; optionsMask:%@; optionsOverride:%@; >",
    v5,
    self->_rateX,
    self->_rateY,
    self->_optionsMask,
  v7 = self->_optionsOverride);

  return v7;
}

- (NSNumber)rateX
{
  return self->_rateX;
}

- (void)setRateX:(NSNumber *)rateX
{
}

- (NSNumber)rateY
{
  return self->_rateY;
}

- (void)setRateY:(NSNumber *)rateY
{
}

- (NSNumber)optionsMask
{
  return self->_optionsMask;
}

- (void)setOptionsMask:(NSNumber *)optionsMask
{
}

- (NSNumber)optionsOverride
{
  return self->_optionsOverride;
}

- (void)setOptionsOverride:(NSNumber *)optionsOverride
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
  objc_storeStrong((id *)&self->_optionsOverride, 0);
  objc_storeStrong((id *)&self->_optionsMask, 0);
  objc_storeStrong((id *)&self->_rateY, 0);

  objc_storeStrong((id *)&self->_rateX, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v35 = 0;
  int v34 = 0;
  v33[0] = 0;
  v33[1] = 0;
  v32 = v33;
  v7 = objc_msgSend_rateX(self, a3, (uint64_t)a4);
  LOWORD(v34) = objc_msgSend_shortValue(v7, v8, v9);

  v12 = objc_msgSend_rateY(self, v10, v11);
  HIWORD(v34) = objc_msgSend_shortValue(v12, v13, v14);

  v17 = objc_msgSend_optionsMask(self, v15, v16);
  LOBYTE(v35) = objc_msgSend_unsignedCharValue(v17, v18, v19);

  uint64_t v22 = objc_msgSend_optionsOverride(self, v20, v21);
  HIBYTE(v35) = objc_msgSend_unsignedCharValue(v22, v23, v24);

  sub_244CC8F5C(0x62FuLL, 0, &v31);
  if (v31)
  {
    sub_244CB62B8((uint64_t)v26);
    v28 = 0;
    v29 = 0;
    v27 = &unk_26F9536C8;
    char v30 = 0;
    sub_2447945A0((uint64_t)&v27, &v31, 0);
    sub_244CB6318((uint64_t)v26, (uint64_t)&v27, 0xFFFFFFFF, (uint64_t)v36);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24482B224(v26, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v26, &v31, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v31);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v27 = &unk_26F9536C8;
    sub_244794634(&v29);
    sub_244794634(&v28);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 24273;
  }
  sub_244794634(&v31);
  return (ChipError *)sub_24479466C((uint64_t)&v32);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
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
    int v11 = 24302;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end