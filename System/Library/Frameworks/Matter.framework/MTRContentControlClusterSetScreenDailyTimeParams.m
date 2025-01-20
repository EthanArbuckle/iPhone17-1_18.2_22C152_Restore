@interface MTRContentControlClusterSetScreenDailyTimeParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRContentControlClusterSetScreenDailyTimeParams)init;
- (NSNumber)screenTime;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setScreenTime:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRContentControlClusterSetScreenDailyTimeParams

- (MTRContentControlClusterSetScreenDailyTimeParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRContentControlClusterSetScreenDailyTimeParams;
  v2 = [(MTRContentControlClusterSetScreenDailyTimeParams *)&v8 init];
  v3 = v2;
  if (v2)
  {
    screenTime = v2->_screenTime;
    v2->_screenTime = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentControlClusterSetScreenDailyTimeParams);
  v7 = objc_msgSend_screenTime(self, v5, v6);
  objc_msgSend_setScreenTime_(v4, v8, (uint64_t)v7);

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
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: screenTime:%@ >", v5, self->_screenTime);;

  return v7;
}

- (NSNumber)screenTime
{
  return self->_screenTime;
}

- (void)setScreenTime:(id)a3
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

  objc_storeStrong((id *)&self->_screenTime, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  int v18 = 0;
  v17[0] = 0;
  v17[1] = 0;
  v16 = v17;
  uint64_t v6 = objc_msgSend_screenTime(self, a3, (uint64_t)a4);
  int v18 = objc_msgSend_unsignedIntValue(v6, v7, v8);

  sub_244CC8F5C(0x62FuLL, 0, &v15);
  if (v15)
  {
    sub_244CB62B8((uint64_t)v10);
    v12 = 0;
    v13 = 0;
    v11 = &unk_26F9536C8;
    char v14 = 0;
    sub_2447945A0((uint64_t)&v11, &v15, 0);
    sub_244CB6318((uint64_t)v10, (uint64_t)&v11, 0xFFFFFFFF, (uint64_t)v19);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24480B6A4(v10, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v10, &v15, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v15);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v11 = &unk_26F9536C8;
    sub_244794634(&v13);
    sub_244794634(&v12);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 31241;
  }
  sub_244794634(&v15);
  return (ChipError *)sub_24479466C((uint64_t)&v16);
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
    int v11 = 31270;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end