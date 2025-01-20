@interface MTREnergyEVSEClusterEnableChargingParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTREnergyEVSEClusterEnableChargingParams)init;
- (NSNumber)chargingEnabledUntil;
- (NSNumber)maximumChargeCurrent;
- (NSNumber)minimumChargeCurrent;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setChargingEnabledUntil:(id)a3;
- (void)setMaximumChargeCurrent:(id)a3;
- (void)setMinimumChargeCurrent:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTREnergyEVSEClusterEnableChargingParams

- (MTREnergyEVSEClusterEnableChargingParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTREnergyEVSEClusterEnableChargingParams;
  v2 = [(MTREnergyEVSEClusterEnableChargingParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    chargingEnabledUntil = v2->_chargingEnabledUntil;
    v2->_chargingEnabledUntil = 0;

    minimumChargeCurrent = v3->_minimumChargeCurrent;
    v3->_minimumChargeCurrent = (NSNumber *)&unk_26F9C8548;

    maximumChargeCurrent = v3->_maximumChargeCurrent;
    v3->_maximumChargeCurrent = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterEnableChargingParams);
  v7 = objc_msgSend_chargingEnabledUntil(self, v5, v6);
  objc_msgSend_setChargingEnabledUntil_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_minimumChargeCurrent(self, v9, v10);
  objc_msgSend_setMinimumChargeCurrent_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_maximumChargeCurrent(self, v13, v14);
  objc_msgSend_setMaximumChargeCurrent_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: chargingEnabledUntil:%@; minimumChargeCurrent:%@; maximumChargeCurrent:%@; >",
    v5,
    self->_chargingEnabledUntil,
    self->_minimumChargeCurrent,
  v7 = self->_maximumChargeCurrent);

  return v7;
}

- (NSNumber)chargingEnabledUntil
{
  return self->_chargingEnabledUntil;
}

- (void)setChargingEnabledUntil:(id)a3
{
}

- (NSNumber)minimumChargeCurrent
{
  return self->_minimumChargeCurrent;
}

- (void)setMinimumChargeCurrent:(id)a3
{
}

- (NSNumber)maximumChargeCurrent
{
  return self->_maximumChargeCurrent;
}

- (void)setMaximumChargeCurrent:(id)a3
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
  objc_storeStrong((id *)&self->_maximumChargeCurrent, 0);
  objc_storeStrong((id *)&self->_minimumChargeCurrent, 0);

  objc_storeStrong((id *)&self->_chargingEnabledUntil, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  LOBYTE(v30) = 0;
  char v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  v29[0] = 0;
  v29[1] = 0;
  v28 = v29;
  v7 = objc_msgSend_chargingEnabledUntil(self, a3, (uint64_t)a4);

  if (v7)
  {
    int v30 = 0;
    char v31 = 1;
    uint64_t v10 = objc_msgSend_chargingEnabledUntil(self, v8, v9);
    int v30 = objc_msgSend_unsignedIntValue(v10, v11, v12);
  }
  v13 = objc_msgSend_minimumChargeCurrent(self, v8, v9);
  uint64_t v32 = objc_msgSend_longLongValue(v13, v14, v15);

  uint64_t v18 = objc_msgSend_maximumChargeCurrent(self, v16, v17);
  uint64_t v33 = objc_msgSend_longLongValue(v18, v19, v20);

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
    sub_24481C8CC((uint64_t)&v30, v22, 256, (uint64_t)retstr);
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
    retstr->mLine = 17814;
  }
  sub_244794634(&v27);
  return (ChipError *)sub_24479466C((uint64_t)&v28);
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
    int v11 = 17843;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end