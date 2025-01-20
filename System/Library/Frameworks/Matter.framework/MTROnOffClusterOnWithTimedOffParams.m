@interface MTROnOffClusterOnWithTimedOffParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTROnOffClusterOnWithTimedOffParams)init;
- (NSNumber)offWaitTime;
- (NSNumber)onOffControl;
- (NSNumber)onTime;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setOffWaitTime:(NSNumber *)offWaitTime;
- (void)setOnOffControl:(NSNumber *)onOffControl;
- (void)setOnTime:(NSNumber *)onTime;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTROnOffClusterOnWithTimedOffParams

- (MTROnOffClusterOnWithTimedOffParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTROnOffClusterOnWithTimedOffParams;
  v2 = [(MTROnOffClusterOnWithTimedOffParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    onOffControl = v2->_onOffControl;
    v2->_onOffControl = (NSNumber *)&unk_26F9C8548;

    onTime = v3->_onTime;
    v3->_onTime = (NSNumber *)&unk_26F9C8548;

    offWaitTime = v3->_offWaitTime;
    v3->_offWaitTime = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROnOffClusterOnWithTimedOffParams);
  v7 = objc_msgSend_onOffControl(self, v5, v6);
  objc_msgSend_setOnOffControl_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_onTime(self, v9, v10);
  objc_msgSend_setOnTime_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_offWaitTime(self, v13, v14);
  objc_msgSend_setOffWaitTime_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: onOffControl:%@; onTime:%@; offWaitTime:%@; >",
    v5,
    self->_onOffControl,
    self->_onTime,
  v7 = self->_offWaitTime);

  return v7;
}

- (NSNumber)onOffControl
{
  return self->_onOffControl;
}

- (void)setOnOffControl:(NSNumber *)onOffControl
{
}

- (NSNumber)onTime
{
  return self->_onTime;
}

- (void)setOnTime:(NSNumber *)onTime
{
}

- (NSNumber)offWaitTime
{
  return self->_offWaitTime;
}

- (void)setOffWaitTime:(NSNumber *)offWaitTime
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
  objc_storeStrong((id *)&self->_offWaitTime, 0);
  objc_storeStrong((id *)&self->_onTime, 0);

  objc_storeStrong((id *)&self->_onOffControl, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v29 = 0;
  int v30 = 0;
  v28[0] = 0;
  v28[1] = 0;
  v27 = v28;
  v7 = objc_msgSend_onOffControl(self, a3, (uint64_t)a4);
  char v29 = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_onTime(self, v10, v11);
  LOWORD(v30) = objc_msgSend_unsignedShortValue(v12, v13, v14);

  v17 = objc_msgSend_offWaitTime(self, v15, v16);
  HIWORD(v30) = objc_msgSend_unsignedShortValue(v17, v18, v19);

  sub_244CC8F5C(0x62FuLL, 0, &v26);
  if (v26)
  {
    sub_244CB62B8((uint64_t)v21);
    v23 = 0;
    v24 = 0;
    uint64_t v22 = &unk_26F9536C8;
    char v25 = 0;
    sub_2447945A0((uint64_t)&v22, &v26, 0);
    sub_244CB6318((uint64_t)v21, (uint64_t)&v22, 0xFFFFFFFF, (uint64_t)v31);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2447F1E30(v21, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v21, &v26, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v26);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    uint64_t v22 = &unk_26F9536C8;
    sub_244794634(&v24);
    sub_244794634(&v23);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 2041;
  }
  sub_244794634(&v26);
  return (ChipError *)sub_24479466C((uint64_t)&v27);
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
    int v11 = 2070;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end