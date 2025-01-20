@interface MTRColorControlClusterStepColorTemperatureParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRColorControlClusterStepColorTemperatureParams)init;
- (NSNumber)colorTemperatureMaximumMireds;
- (NSNumber)colorTemperatureMinimumMireds;
- (NSNumber)optionsMask;
- (NSNumber)optionsOverride;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)stepMode;
- (NSNumber)stepSize;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)transitionTime;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setColorTemperatureMaximumMireds:(NSNumber *)colorTemperatureMaximumMireds;
- (void)setColorTemperatureMinimumMireds:(NSNumber *)colorTemperatureMinimumMireds;
- (void)setOptionsMask:(NSNumber *)optionsMask;
- (void)setOptionsOverride:(NSNumber *)optionsOverride;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setStepMode:(NSNumber *)stepMode;
- (void)setStepSize:(NSNumber *)stepSize;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setTransitionTime:(NSNumber *)transitionTime;
@end

@implementation MTRColorControlClusterStepColorTemperatureParams

- (MTRColorControlClusterStepColorTemperatureParams)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTRColorControlClusterStepColorTemperatureParams;
  v2 = [(MTRColorControlClusterStepColorTemperatureParams *)&v14 init];
  v3 = v2;
  if (v2)
  {
    stepMode = v2->_stepMode;
    v2->_stepMode = (NSNumber *)&unk_26F9C8548;

    stepSize = v3->_stepSize;
    v3->_stepSize = (NSNumber *)&unk_26F9C8548;

    transitionTime = v3->_transitionTime;
    v3->_transitionTime = (NSNumber *)&unk_26F9C8548;

    colorTemperatureMinimumMireds = v3->_colorTemperatureMinimumMireds;
    v3->_colorTemperatureMinimumMireds = (NSNumber *)&unk_26F9C8548;

    colorTemperatureMaximumMireds = v3->_colorTemperatureMaximumMireds;
    v3->_colorTemperatureMaximumMireds = (NSNumber *)&unk_26F9C8548;

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
  v4 = objc_alloc_init(MTRColorControlClusterStepColorTemperatureParams);
  v7 = objc_msgSend_stepMode(self, v5, v6);
  objc_msgSend_setStepMode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_stepSize(self, v9, v10);
  objc_msgSend_setStepSize_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_transitionTime(self, v13, v14);
  objc_msgSend_setTransitionTime_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_colorTemperatureMinimumMireds(self, v17, v18);
  objc_msgSend_setColorTemperatureMinimumMireds_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_colorTemperatureMaximumMireds(self, v21, v22);
  objc_msgSend_setColorTemperatureMaximumMireds_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: stepMode:%@; stepSize:%@; transitionTime:%@; colorTemperatureMinimumMireds:%@; colorTemperatureMaximumMireds:%@; optionsMask:%@; optionsOverride:%@; >",
    v5,
    self->_stepMode,
    self->_stepSize,
    self->_transitionTime,
    self->_colorTemperatureMinimumMireds,
    self->_colorTemperatureMaximumMireds,
    self->_optionsMask,
  v7 = self->_optionsOverride);

  return v7;
}

- (NSNumber)stepMode
{
  return self->_stepMode;
}

- (void)setStepMode:(NSNumber *)stepMode
{
}

- (NSNumber)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(NSNumber *)stepSize
{
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(NSNumber *)transitionTime
{
}

- (NSNumber)colorTemperatureMinimumMireds
{
  return self->_colorTemperatureMinimumMireds;
}

- (void)setColorTemperatureMinimumMireds:(NSNumber *)colorTemperatureMinimumMireds
{
}

- (NSNumber)colorTemperatureMaximumMireds
{
  return self->_colorTemperatureMaximumMireds;
}

- (void)setColorTemperatureMaximumMireds:(NSNumber *)colorTemperatureMaximumMireds
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
  objc_storeStrong((id *)&self->_colorTemperatureMaximumMireds, 0);
  objc_storeStrong((id *)&self->_colorTemperatureMinimumMireds, 0);
  objc_storeStrong((id *)&self->_transitionTime, 0);
  objc_storeStrong((id *)&self->_stepSize, 0);

  objc_storeStrong((id *)&self->_stepMode, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  v49[0] = 0;
  uint64_t v50 = 0;
  __int16 v51 = 0;
  v48[0] = 0;
  v48[1] = 0;
  v47 = v48;
  v7 = objc_msgSend_stepMode(self, a3, (uint64_t)a4);
  v49[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_stepSize(self, v10, v11);
  LOWORD(v50) = objc_msgSend_unsignedShortValue(v12, v13, v14);

  v17 = objc_msgSend_transitionTime(self, v15, v16);
  WORD1(v50) = objc_msgSend_unsignedShortValue(v17, v18, v19);

  uint64_t v22 = objc_msgSend_colorTemperatureMinimumMireds(self, v20, v21);
  WORD2(v50) = objc_msgSend_unsignedShortValue(v22, v23, v24);

  v27 = objc_msgSend_colorTemperatureMaximumMireds(self, v25, v26);
  HIWORD(v50) = objc_msgSend_unsignedShortValue(v27, v28, v29);

  v32 = objc_msgSend_optionsMask(self, v30, v31);
  LOBYTE(v51) = objc_msgSend_unsignedCharValue(v32, v33, v34);

  v37 = objc_msgSend_optionsOverride(self, v35, v36);
  HIBYTE(v51) = objc_msgSend_unsignedCharValue(v37, v38, v39);

  sub_244CC8F5C(0x62FuLL, 0, &v46);
  if (v46)
  {
    sub_244CB62B8((uint64_t)v41);
    v43 = 0;
    v44 = 0;
    v42 = &unk_26F9536C8;
    char v45 = 0;
    sub_2447945A0((uint64_t)&v42, &v46, 0);
    sub_244CB6318((uint64_t)v41, (uint64_t)&v42, 0xFFFFFFFF, (uint64_t)v52);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24482CEAC(v49, v41, 256, (uint64_t)retstr);
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
    retstr->mLine = 25315;
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
    int v11 = 25344;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end