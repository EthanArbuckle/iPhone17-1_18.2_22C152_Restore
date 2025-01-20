@interface MTRUnitTestingClusterTestSecondBatchHelperRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRUnitTestingClusterTestSecondBatchHelperRequestParams)init;
- (NSNumber)fillCharacter;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)sizeOfResponseBuffer;
- (NSNumber)sleepBeforeResponseTimeMs;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFillCharacter:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setSizeOfResponseBuffer:(id)a3;
- (void)setSleepBeforeResponseTimeMs:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRUnitTestingClusterTestSecondBatchHelperRequestParams

- (MTRUnitTestingClusterTestSecondBatchHelperRequestParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRUnitTestingClusterTestSecondBatchHelperRequestParams;
  v2 = [(MTRUnitTestingClusterTestSecondBatchHelperRequestParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    sleepBeforeResponseTimeMs = v2->_sleepBeforeResponseTimeMs;
    v2->_sleepBeforeResponseTimeMs = (NSNumber *)&unk_26F9C8548;

    sizeOfResponseBuffer = v3->_sizeOfResponseBuffer;
    v3->_sizeOfResponseBuffer = (NSNumber *)&unk_26F9C8548;

    fillCharacter = v3->_fillCharacter;
    v3->_fillCharacter = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestSecondBatchHelperRequestParams);
  v7 = objc_msgSend_sleepBeforeResponseTimeMs(self, v5, v6);
  objc_msgSend_setSleepBeforeResponseTimeMs_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_sizeOfResponseBuffer(self, v9, v10);
  objc_msgSend_setSizeOfResponseBuffer_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_fillCharacter(self, v13, v14);
  objc_msgSend_setFillCharacter_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: sleepBeforeResponseTimeMs:%@; sizeOfResponseBuffer:%@; fillCharacter:%@; >",
    v5,
    self->_sleepBeforeResponseTimeMs,
    self->_sizeOfResponseBuffer,
  v7 = self->_fillCharacter);

  return v7;
}

- (NSNumber)sleepBeforeResponseTimeMs
{
  return self->_sleepBeforeResponseTimeMs;
}

- (void)setSleepBeforeResponseTimeMs:(id)a3
{
}

- (NSNumber)sizeOfResponseBuffer
{
  return self->_sizeOfResponseBuffer;
}

- (void)setSizeOfResponseBuffer:(id)a3
{
}

- (NSNumber)fillCharacter
{
  return self->_fillCharacter;
}

- (void)setFillCharacter:(id)a3
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
  objc_storeStrong((id *)&self->_fillCharacter, 0);
  objc_storeStrong((id *)&self->_sizeOfResponseBuffer, 0);

  objc_storeStrong((id *)&self->_sleepBeforeResponseTimeMs, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  int v29 = 0;
  char v30 = 0;
  v28[0] = 0;
  v28[1] = 0;
  v27 = v28;
  v7 = objc_msgSend_sleepBeforeResponseTimeMs(self, a3, (uint64_t)a4);
  LOWORD(v29) = objc_msgSend_unsignedShortValue(v7, v8, v9);

  v12 = objc_msgSend_sizeOfResponseBuffer(self, v10, v11);
  HIWORD(v29) = objc_msgSend_unsignedShortValue(v12, v13, v14);

  v17 = objc_msgSend_fillCharacter(self, v15, v16);
  char v30 = objc_msgSend_unsignedCharValue(v17, v18, v19);

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
    sub_2448482F4(v21, 256, (uint64_t)retstr);
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
    retstr->mLine = 40347;
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
    int v11 = 40376;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end