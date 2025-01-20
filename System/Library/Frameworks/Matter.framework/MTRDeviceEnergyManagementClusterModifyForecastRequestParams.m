@interface MTRDeviceEnergyManagementClusterModifyForecastRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDeviceEnergyManagementClusterModifyForecastRequestParams)init;
- (NSArray)slotAdjustments;
- (NSNumber)cause;
- (NSNumber)forecastID;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCause:(id)a3;
- (void)setForecastID:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setSlotAdjustments:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterModifyForecastRequestParams

- (MTRDeviceEnergyManagementClusterModifyForecastRequestParams)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRDeviceEnergyManagementClusterModifyForecastRequestParams;
  v2 = [(MTRDeviceEnergyManagementClusterModifyForecastRequestParams *)&v13 init];
  v3 = v2;
  if (v2)
  {
    forecastID = v2->_forecastID;
    v2->_forecastID = (NSNumber *)&unk_26F9C8548;

    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF8C0], v5, v6);
    slotAdjustments = v3->_slotAdjustments;
    v3->_slotAdjustments = (NSArray *)v7;

    cause = v3->_cause;
    v3->_cause = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterModifyForecastRequestParams);
  uint64_t v7 = objc_msgSend_forecastID(self, v5, v6);
  objc_msgSend_setForecastID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_slotAdjustments(self, v9, v10);
  objc_msgSend_setSlotAdjustments_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_cause(self, v13, v14);
  objc_msgSend_setCause_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: forecastID:%@; slotAdjustments:%@; cause:%@; >",
    v5,
    self->_forecastID,
    self->_slotAdjustments,
  uint64_t v7 = self->_cause);

  return v7;
}

- (NSNumber)forecastID
{
  return self->_forecastID;
}

- (void)setForecastID:(id)a3
{
}

- (NSArray)slotAdjustments
{
  return self->_slotAdjustments;
}

- (void)setSlotAdjustments:(id)a3
{
}

- (NSNumber)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
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
  objc_storeStrong((id *)&self->_cause, 0);
  objc_storeStrong((id *)&self->_slotAdjustments, 0);

  objc_storeStrong((id *)&self->_forecastID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  int v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  char v33 = 0;
  v29[0] = 0;
  v29[1] = 0;
  v28 = v29;
  uint64_t v6 = objc_msgSend_forecastID(self, a3, (uint64_t)a4);
  int v30 = objc_msgSend_unsignedIntValue(v6, v7, v8);

  v11 = objc_msgSend_slotAdjustments(self, v9, v10);
  uint64_t v14 = objc_msgSend_count(v11, v12, v13);

  if (v14) {
    operator new();
  }
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  v17 = objc_msgSend_cause(self, v15, v16);
  char v33 = objc_msgSend_unsignedCharValue(v17, v18, v19);

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
    sub_24481B404((uint64_t)&v30, v22, 256, (uint64_t)retstr);
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
    retstr->mLine = 17333;
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
  uint64_t v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 17362;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end