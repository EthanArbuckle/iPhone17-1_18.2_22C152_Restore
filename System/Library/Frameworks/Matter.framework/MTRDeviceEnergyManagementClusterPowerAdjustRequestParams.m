@interface MTRDeviceEnergyManagementClusterPowerAdjustRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDeviceEnergyManagementClusterPowerAdjustRequestParams)init;
- (NSNumber)cause;
- (NSNumber)duration;
- (NSNumber)power;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCause:(id)a3;
- (void)setDuration:(id)a3;
- (void)setPower:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterPowerAdjustRequestParams

- (MTRDeviceEnergyManagementClusterPowerAdjustRequestParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRDeviceEnergyManagementClusterPowerAdjustRequestParams;
  v2 = [(MTRDeviceEnergyManagementClusterPowerAdjustRequestParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    power = v2->_power;
    v2->_power = (NSNumber *)&unk_26F9C8548;

    duration = v3->_duration;
    v3->_duration = (NSNumber *)&unk_26F9C8548;

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
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterPowerAdjustRequestParams);
  v7 = objc_msgSend_power(self, v5, v6);
  objc_msgSend_setPower_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_duration(self, v9, v10);
  objc_msgSend_setDuration_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: power:%@; duration:%@; cause:%@; >",
    v5,
    self->_power,
    self->_duration,
  v7 = self->_cause);

  return v7;
}

- (NSNumber)power
{
  return self->_power;
}

- (void)setPower:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
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
  objc_storeStrong((id *)&self->_duration, 0);

  objc_storeStrong((id *)&self->_power, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  uint64_t v29 = 0;
  int v30 = 0;
  char v31 = 0;
  v28[0] = 0;
  v28[1] = 0;
  v27 = v28;
  v7 = objc_msgSend_power(self, a3, (uint64_t)a4);
  uint64_t v29 = objc_msgSend_longLongValue(v7, v8, v9);

  v12 = objc_msgSend_duration(self, v10, v11);
  int v30 = objc_msgSend_unsignedIntValue(v12, v13, v14);

  v17 = objc_msgSend_cause(self, v15, v16);
  char v31 = objc_msgSend_unsignedCharValue(v17, v18, v19);

  sub_244CC8F5C(0x62FuLL, 0, &v26);
  if (v26)
  {
    sub_244CB62B8((uint64_t)v21);
    v23 = 0;
    v24 = 0;
    uint64_t v22 = &unk_26F9536C8;
    char v25 = 0;
    sub_2447945A0((uint64_t)&v22, &v26, 0);
    sub_244CB6318((uint64_t)v21, (uint64_t)&v22, 0xFFFFFFFF, (uint64_t)v32);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24481AEA0((uint64_t)&v29, v21, 256, (uint64_t)retstr);
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
    retstr->mLine = 16900;
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
    int v11 = 16929;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end