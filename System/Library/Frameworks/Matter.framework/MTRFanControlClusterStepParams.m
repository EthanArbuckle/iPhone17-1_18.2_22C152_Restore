@interface MTRFanControlClusterStepParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRFanControlClusterStepParams)init;
- (NSNumber)direction;
- (NSNumber)lowestOff;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)wrap;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDirection:(id)a3;
- (void)setLowestOff:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setWrap:(id)a3;
@end

@implementation MTRFanControlClusterStepParams

- (MTRFanControlClusterStepParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRFanControlClusterStepParams;
  v2 = [(MTRFanControlClusterStepParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    direction = v2->_direction;
    v2->_direction = (NSNumber *)&unk_26F9C8548;

    wrap = v3->_wrap;
    v3->_wrap = 0;

    lowestOff = v3->_lowestOff;
    v3->_lowestOff = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRFanControlClusterStepParams);
  v7 = objc_msgSend_direction(self, v5, v6);
  objc_msgSend_setDirection_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_wrap(self, v9, v10);
  objc_msgSend_setWrap_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_lowestOff(self, v13, v14);
  objc_msgSend_setLowestOff_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: direction:%@; wrap:%@; lowestOff:%@; >",
    v5,
    self->_direction,
    self->_wrap,
  v7 = self->_lowestOff);

  return v7;
}

- (NSNumber)direction
{
  return self->_direction;
}

- (void)setDirection:(id)a3
{
}

- (NSNumber)wrap
{
  return self->_wrap;
}

- (void)setWrap:(id)a3
{
}

- (NSNumber)lowestOff
{
  return self->_lowestOff;
}

- (void)setLowestOff:(id)a3
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
  objc_storeStrong((id *)&self->_lowestOff, 0);
  objc_storeStrong((id *)&self->_wrap, 0);

  objc_storeStrong((id *)&self->_direction, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  *(_WORD *)v33 = 0;
  LOBYTE(v34) = 0;
  v32[0] = 0;
  v32[1] = 0;
  v31 = v32;
  v7 = objc_msgSend_direction(self, a3, (uint64_t)a4);
  v33[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_wrap(self, v10, v11);

  if (v12)
  {
    *(_WORD *)&v33[1] = 1;
    v15 = objc_msgSend_wrap(self, v13, v14);
    v33[2] = objc_msgSend_BOOLValue(v15, v16, v17);
  }
  uint64_t v18 = objc_msgSend_lowestOff(self, v13, v14);

  if (v18)
  {
    __int16 v34 = 1;
    v21 = objc_msgSend_lowestOff(self, v19, v20);
    HIBYTE(v34) = objc_msgSend_BOOLValue(v21, v22, v23);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v30);
  if (v30)
  {
    sub_244CB62B8((uint64_t)v25);
    v27 = 0;
    v28 = 0;
    v26 = &unk_26F9536C8;
    char v29 = 0;
    sub_2447945A0((uint64_t)&v26, &v30, 0);
    sub_244CB6318((uint64_t)v25, (uint64_t)&v26, 0xFFFFFFFF, (uint64_t)v35);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24482979C(v33, v25, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v25, &v30, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v30);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v26 = &unk_26F9536C8;
    sub_244794634(&v28);
    sub_244794634(&v27);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 23370;
  }
  sub_244794634(&v30);
  return (ChipError *)sub_24479466C((uint64_t)&v31);
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
    int v11 = 23399;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end