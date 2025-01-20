@interface MTRMicrowaveOvenControlClusterSetCookingParametersParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRMicrowaveOvenControlClusterSetCookingParametersParams)init;
- (NSNumber)cookMode;
- (NSNumber)cookTime;
- (NSNumber)powerSetting;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)startAfterSetting;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)wattSettingIndex;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCookMode:(id)a3;
- (void)setCookTime:(id)a3;
- (void)setPowerSetting:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setStartAfterSetting:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setWattSettingIndex:(id)a3;
@end

@implementation MTRMicrowaveOvenControlClusterSetCookingParametersParams

- (MTRMicrowaveOvenControlClusterSetCookingParametersParams)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRMicrowaveOvenControlClusterSetCookingParametersParams;
  v2 = [(MTRMicrowaveOvenControlClusterSetCookingParametersParams *)&v12 init];
  v3 = v2;
  if (v2)
  {
    cookMode = v2->_cookMode;
    v2->_cookMode = 0;

    cookTime = v3->_cookTime;
    v3->_cookTime = 0;

    powerSetting = v3->_powerSetting;
    v3->_powerSetting = 0;

    wattSettingIndex = v3->_wattSettingIndex;
    v3->_wattSettingIndex = 0;

    startAfterSetting = v3->_startAfterSetting;
    v3->_startAfterSetting = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMicrowaveOvenControlClusterSetCookingParametersParams);
  v7 = objc_msgSend_cookMode(self, v5, v6);
  objc_msgSend_setCookMode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_cookTime(self, v9, v10);
  objc_msgSend_setCookTime_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_powerSetting(self, v13, v14);
  objc_msgSend_setPowerSetting_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_wattSettingIndex(self, v17, v18);
  objc_msgSend_setWattSettingIndex_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_startAfterSetting(self, v21, v22);
  objc_msgSend_setStartAfterSetting_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: cookMode:%@; cookTime:%@; powerSetting:%@; wattSettingIndex:%@; startAfterSetting:%@; >",
    v5,
    self->_cookMode,
    self->_cookTime,
    self->_powerSetting,
    self->_wattSettingIndex,
  v7 = self->_startAfterSetting);

  return v7;
}

- (NSNumber)cookMode
{
  return self->_cookMode;
}

- (void)setCookMode:(id)a3
{
}

- (NSNumber)cookTime
{
  return self->_cookTime;
}

- (void)setCookTime:(id)a3
{
}

- (NSNumber)powerSetting
{
  return self->_powerSetting;
}

- (void)setPowerSetting:(id)a3
{
}

- (NSNumber)wattSettingIndex
{
  return self->_wattSettingIndex;
}

- (void)setWattSettingIndex:(id)a3
{
}

- (NSNumber)startAfterSetting
{
  return self->_startAfterSetting;
}

- (void)setStartAfterSetting:(id)a3
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
  objc_storeStrong((id *)&self->_startAfterSetting, 0);
  objc_storeStrong((id *)&self->_wattSettingIndex, 0);
  objc_storeStrong((id *)&self->_powerSetting, 0);
  objc_storeStrong((id *)&self->_cookTime, 0);

  objc_storeStrong((id *)&self->_cookMode, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  LOBYTE(v46) = 0;
  char v47 = 0;
  LOBYTE(v49) = 0;
  LOBYTE(v50) = 0;
  LOBYTE(v51) = 0;
  v45[0] = 0;
  v45[1] = 0;
  v44 = v45;
  v7 = objc_msgSend_cookMode(self, a3, (uint64_t)a4);

  if (v7)
  {
    __int16 v46 = 1;
    uint64_t v10 = objc_msgSend_cookMode(self, v8, v9);
    HIBYTE(v46) = objc_msgSend_unsignedCharValue(v10, v11, v12);
  }
  v13 = objc_msgSend_cookTime(self, v8, v9);

  if (v13)
  {
    char v47 = 1;
    int v48 = 0;
    v16 = objc_msgSend_cookTime(self, v14, v15);
    int v48 = objc_msgSend_unsignedIntValue(v16, v17, v18);
  }
  v19 = objc_msgSend_powerSetting(self, v14, v15);

  if (v19)
  {
    __int16 v49 = 1;
    uint64_t v22 = objc_msgSend_powerSetting(self, v20, v21);
    HIBYTE(v49) = objc_msgSend_unsignedCharValue(v22, v23, v24);
  }
  v25 = objc_msgSend_wattSettingIndex(self, v20, v21);

  if (v25)
  {
    __int16 v50 = 1;
    v28 = objc_msgSend_wattSettingIndex(self, v26, v27);
    HIBYTE(v50) = objc_msgSend_unsignedCharValue(v28, v29, v30);
  }
  v31 = objc_msgSend_startAfterSetting(self, v26, v27);

  if (v31)
  {
    __int16 v51 = 1;
    v34 = objc_msgSend_startAfterSetting(self, v32, v33);
    HIBYTE(v51) = objc_msgSend_BOOLValue(v34, v35, v36);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v43);
  if (v43)
  {
    sub_244CB62B8((uint64_t)v38);
    v40 = 0;
    v41 = 0;
    v39 = &unk_26F9536C8;
    char v42 = 0;
    sub_2447945A0((uint64_t)&v39, &v43, 0);
    sub_244CB6318((uint64_t)v38, (uint64_t)&v39, 0xFFFFFFFF, (uint64_t)v52);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24480F5B8(&v46, v38, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v38, &v43, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v43);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v39 = &unk_26F9536C8;
    sub_244794634(&v41);
    sub_244794634(&v40);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 13054;
  }
  sub_244794634(&v43);
  return (ChipError *)sub_24479466C((uint64_t)&v44);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  uint64_t v15 = 0;
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
    int v11 = 13083;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end