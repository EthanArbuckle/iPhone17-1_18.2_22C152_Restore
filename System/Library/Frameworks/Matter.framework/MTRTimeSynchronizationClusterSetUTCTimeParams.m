@interface MTRTimeSynchronizationClusterSetUTCTimeParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRTimeSynchronizationClusterSetUTCTimeParams)init;
- (NSNumber)granularity;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timeSource;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)utcTime;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setGranularity:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimeSource:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setUtcTime:(id)a3;
@end

@implementation MTRTimeSynchronizationClusterSetUTCTimeParams

- (MTRTimeSynchronizationClusterSetUTCTimeParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRTimeSynchronizationClusterSetUTCTimeParams;
  v2 = [(MTRTimeSynchronizationClusterSetUTCTimeParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    utcTime = v2->_utcTime;
    v2->_utcTime = (NSNumber *)&unk_26F9C8548;

    granularity = v3->_granularity;
    v3->_granularity = (NSNumber *)&unk_26F9C8548;

    timeSource = v3->_timeSource;
    v3->_timeSource = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRTimeSynchronizationClusterSetUTCTimeParams);
  v7 = objc_msgSend_utcTime(self, v5, v6);
  objc_msgSend_setUtcTime_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_granularity(self, v9, v10);
  objc_msgSend_setGranularity_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timeSource(self, v13, v14);
  objc_msgSend_setTimeSource_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: utcTime:%@; granularity:%@; timeSource:%@; >",
    v5,
    self->_utcTime,
    self->_granularity,
  v7 = self->_timeSource);

  return v7;
}

- (NSNumber)utcTime
{
  return self->_utcTime;
}

- (void)setUtcTime:(id)a3
{
}

- (NSNumber)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(id)a3
{
}

- (NSNumber)timeSource
{
  return self->_timeSource;
}

- (void)setTimeSource:(id)a3
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
  objc_storeStrong((id *)&self->_timeSource, 0);
  objc_storeStrong((id *)&self->_granularity, 0);

  objc_storeStrong((id *)&self->_utcTime, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  uint64_t v32 = 0;
  *(_WORD *)v33 = 0;
  v31[0] = 0;
  v31[1] = 0;
  v30 = v31;
  v7 = objc_msgSend_utcTime(self, a3, (uint64_t)a4);
  uint64_t v32 = objc_msgSend_unsignedLongLongValue(v7, v8, v9);

  v12 = objc_msgSend_granularity(self, v10, v11);
  v33[0] = objc_msgSend_unsignedCharValue(v12, v13, v14);

  v17 = objc_msgSend_timeSource(self, v15, v16);

  if (v17)
  {
    *(_WORD *)&v33[1] = 1;
    v20 = objc_msgSend_timeSource(self, v18, v19);
    v33[2] = objc_msgSend_unsignedCharValue(v20, v21, v22);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v29);
  if (v29)
  {
    sub_244CB62B8((uint64_t)v24);
    v26 = 0;
    v27 = 0;
    v25 = &unk_26F9536C8;
    char v28 = 0;
    sub_2447945A0((uint64_t)&v25, &v29, 0);
    sub_244CB6318((uint64_t)v24, (uint64_t)&v25, 0xFFFFFFFF, (uint64_t)v34);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244805310((uint64_t)&v32, v24, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v24, &v29, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v29);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v25 = &unk_26F9536C8;
    sub_244794634(&v27);
    sub_244794634(&v26);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 7863;
  }
  sub_244794634(&v29);
  return (ChipError *)sub_24479466C((uint64_t)&v30);
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
    int v11 = 7892;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end