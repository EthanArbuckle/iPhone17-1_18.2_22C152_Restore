@interface MTRActionsClusterStartActionWithDurationParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRActionsClusterStartActionWithDurationParams)init;
- (NSNumber)actionID;
- (NSNumber)duration;
- (NSNumber)invokeID;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActionID:(NSNumber *)actionID;
- (void)setDuration:(NSNumber *)duration;
- (void)setInvokeID:(NSNumber *)invokeID;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRActionsClusterStartActionWithDurationParams

- (MTRActionsClusterStartActionWithDurationParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRActionsClusterStartActionWithDurationParams;
  v2 = [(MTRActionsClusterStartActionWithDurationParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    actionID = v2->_actionID;
    v2->_actionID = (NSNumber *)&unk_26F9C8548;

    invokeID = v3->_invokeID;
    v3->_invokeID = 0;

    duration = v3->_duration;
    v3->_duration = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRActionsClusterStartActionWithDurationParams);
  v7 = objc_msgSend_actionID(self, v5, v6);
  objc_msgSend_setActionID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_invokeID(self, v9, v10);
  objc_msgSend_setInvokeID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_duration(self, v13, v14);
  objc_msgSend_setDuration_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: actionID:%@; invokeID:%@; duration:%@; >",
    v5,
    self->_actionID,
    self->_invokeID,
  v7 = self->_duration);

  return v7;
}

- (NSNumber)actionID
{
  return self->_actionID;
}

- (void)setActionID:(NSNumber *)actionID
{
}

- (NSNumber)invokeID
{
  return self->_invokeID;
}

- (void)setInvokeID:(NSNumber *)invokeID
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(NSNumber *)duration
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
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_invokeID, 0);

  objc_storeStrong((id *)&self->_actionID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  v30[0] = 0;
  char v31 = 0;
  int v33 = 0;
  v29[0] = 0;
  v29[1] = 0;
  v28 = v29;
  v7 = objc_msgSend_actionID(self, a3, (uint64_t)a4);
  v30[0] = objc_msgSend_unsignedShortValue(v7, v8, v9);

  v12 = objc_msgSend_invokeID(self, v10, v11);

  if (v12)
  {
    char v31 = 1;
    int v32 = 0;
    v15 = objc_msgSend_invokeID(self, v13, v14);
    int v32 = objc_msgSend_unsignedIntValue(v15, v16, v17);
  }
  uint64_t v18 = objc_msgSend_duration(self, v13, v14);
  int v33 = objc_msgSend_unsignedIntValue(v18, v19, v20);

  sub_244CC8F5C(0x62FuLL, 0, &v27);
  if (v27)
  {
    sub_244CB62B8((uint64_t)v22);
    v24 = 0;
    v25 = 0;
    v23 = &unk_26F9536C8;
    char v26 = 0;
    sub_2447945A0((uint64_t)&v23, &v27, 0);
    sub_244CB6318((uint64_t)v22, (uint64_t)&v23, 0xFFFFFFFF, (uint64_t)v34);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2447F73A4((uint64_t)v30, v22, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v22, &v27, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v27);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v23 = &unk_26F9536C8;
    sub_244794634(&v25);
    sub_244794634(&v24);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 3486;
  }
  sub_244794634(&v27);
  return (ChipError *)sub_24479466C((uint64_t)&v28);
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
    int v11 = 3515;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end