@interface MTRColorControlClusterColorLoopSetParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRColorControlClusterColorLoopSetParams)init;
- (NSNumber)action;
- (NSNumber)direction;
- (NSNumber)optionsMask;
- (NSNumber)optionsOverride;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)startHue;
- (NSNumber)time;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)updateFlags;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAction:(NSNumber *)action;
- (void)setDirection:(NSNumber *)direction;
- (void)setOptionsMask:(NSNumber *)optionsMask;
- (void)setOptionsOverride:(NSNumber *)optionsOverride;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setStartHue:(NSNumber *)startHue;
- (void)setTime:(NSNumber *)time;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUpdateFlags:(NSNumber *)updateFlags;
@end

@implementation MTRColorControlClusterColorLoopSetParams

- (MTRColorControlClusterColorLoopSetParams)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTRColorControlClusterColorLoopSetParams;
  v2 = [(MTRColorControlClusterColorLoopSetParams *)&v14 init];
  v3 = v2;
  if (v2)
  {
    updateFlags = v2->_updateFlags;
    v2->_updateFlags = (NSNumber *)&unk_26F9C8548;

    action = v3->_action;
    v3->_action = (NSNumber *)&unk_26F9C8548;

    direction = v3->_direction;
    v3->_direction = (NSNumber *)&unk_26F9C8548;

    time = v3->_time;
    v3->_time = (NSNumber *)&unk_26F9C8548;

    startHue = v3->_startHue;
    v3->_startHue = (NSNumber *)&unk_26F9C8548;

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
  v4 = objc_alloc_init(MTRColorControlClusterColorLoopSetParams);
  v7 = objc_msgSend_updateFlags(self, v5, v6);
  objc_msgSend_setUpdateFlags_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_action(self, v9, v10);
  objc_msgSend_setAction_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_direction(self, v13, v14);
  objc_msgSend_setDirection_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_time(self, v17, v18);
  objc_msgSend_setTime_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_startHue(self, v21, v22);
  objc_msgSend_setStartHue_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_optionsMask(self, v25, v26);
  objc_msgSend_setOptionsMask_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_optionsOverride(self, v29, v30);
  objc_msgSend_setOptionsOverride_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_timedInvokeTimeoutMs(self, v33, v34);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_serverSideProcessingTimeout(self, v37, v38);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: updateFlags:%@; action:%@; direction:%@; time:%@; startHue:%@; optionsMask:%@; optionsOverride:%@; >",
    v5,
    self->_updateFlags,
    self->_action,
    self->_direction,
    self->_time,
    self->_startHue,
    self->_optionsMask,
  v7 = self->_optionsOverride);

  return v7;
}

- (NSNumber)updateFlags
{
  return self->_updateFlags;
}

- (void)setUpdateFlags:(NSNumber *)updateFlags
{
}

- (NSNumber)action
{
  return self->_action;
}

- (void)setAction:(NSNumber *)action
{
}

- (NSNumber)direction
{
  return self->_direction;
}

- (void)setDirection:(NSNumber *)direction
{
}

- (NSNumber)time
{
  return self->_time;
}

- (void)setTime:(NSNumber *)time
{
}

- (NSNumber)startHue
{
  return self->_startHue;
}

- (void)setStartHue:(NSNumber *)startHue
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
  objc_storeStrong((id *)&self->_startHue, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_direction, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_updateFlags, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v49 = 0;
  char v50 = 0;
  int v51 = 0;
  __int16 v52 = 0;
  v48[0] = 0;
  v48[1] = 0;
  v47 = v48;
  v7 = objc_msgSend_updateFlags(self, a3, (uint64_t)a4);
  LOBYTE(v49) = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_action(self, v10, v11);
  HIBYTE(v49) = objc_msgSend_unsignedCharValue(v12, v13, v14);

  v17 = objc_msgSend_direction(self, v15, v16);
  char v50 = objc_msgSend_unsignedCharValue(v17, v18, v19);

  uint64_t v22 = objc_msgSend_time(self, v20, v21);
  LOWORD(v51) = objc_msgSend_unsignedShortValue(v22, v23, v24);

  v27 = objc_msgSend_startHue(self, v25, v26);
  HIWORD(v51) = objc_msgSend_unsignedShortValue(v27, v28, v29);

  v32 = objc_msgSend_optionsMask(self, v30, v31);
  LOBYTE(v52) = objc_msgSend_unsignedCharValue(v32, v33, v34);

  v37 = objc_msgSend_optionsOverride(self, v35, v36);
  HIBYTE(v52) = objc_msgSend_unsignedCharValue(v37, v38, v39);

  sub_244CC8F5C(0x62FuLL, 0, &v46);
  if (v46)
  {
    sub_244CB62B8((uint64_t)v41);
    v43 = 0;
    v44 = 0;
    v42 = &unk_26F9536C8;
    char v45 = 0;
    sub_2447945A0((uint64_t)&v42, &v46, 0);
    sub_244CB6318((uint64_t)v41, (uint64_t)&v42, 0xFFFFFFFF, (uint64_t)v53);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24482C6D4((uint64_t)&v49, v41, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v41, &v46, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v46);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v42 = &unk_26F9536C8;
    sub_244794634(&v44);
    sub_244794634(&v43);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 25006;
  }
  sub_244794634(&v46);
  return (ChipError *)sub_24479466C((uint64_t)&v47);
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
    int v11 = 25035;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end