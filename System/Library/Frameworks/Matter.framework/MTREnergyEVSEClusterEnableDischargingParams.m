@interface MTREnergyEVSEClusterEnableDischargingParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTREnergyEVSEClusterEnableDischargingParams)init;
- (NSNumber)dischargingEnabledUntil;
- (NSNumber)maximumDischargeCurrent;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDischargingEnabledUntil:(id)a3;
- (void)setMaximumDischargeCurrent:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTREnergyEVSEClusterEnableDischargingParams

- (MTREnergyEVSEClusterEnableDischargingParams)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTREnergyEVSEClusterEnableDischargingParams;
  v2 = [(MTREnergyEVSEClusterEnableDischargingParams *)&v9 init];
  v3 = v2;
  if (v2)
  {
    dischargingEnabledUntil = v2->_dischargingEnabledUntil;
    v2->_dischargingEnabledUntil = 0;

    maximumDischargeCurrent = v3->_maximumDischargeCurrent;
    v3->_maximumDischargeCurrent = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEClusterEnableDischargingParams);
  v7 = objc_msgSend_dischargingEnabledUntil(self, v5, v6);
  objc_msgSend_setDischargingEnabledUntil_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_maximumDischargeCurrent(self, v9, v10);
  objc_msgSend_setMaximumDischargeCurrent_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_serverSideProcessingTimeout(self, v17, v18);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: dischargingEnabledUntil:%@; maximumDischargeCurrent:%@; >",
    v5,
    self->_dischargingEnabledUntil,
  v7 = self->_maximumDischargeCurrent);

  return v7;
}

- (NSNumber)dischargingEnabledUntil
{
  return self->_dischargingEnabledUntil;
}

- (void)setDischargingEnabledUntil:(id)a3
{
}

- (NSNumber)maximumDischargeCurrent
{
  return self->_maximumDischargeCurrent;
}

- (void)setMaximumDischargeCurrent:(id)a3
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
  objc_storeStrong((id *)&self->_maximumDischargeCurrent, 0);

  objc_storeStrong((id *)&self->_dischargingEnabledUntil, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  LOBYTE(v25) = 0;
  char v26 = 0;
  uint64_t v27 = 0;
  v24[0] = 0;
  v24[1] = 0;
  v23 = v24;
  v7 = objc_msgSend_dischargingEnabledUntil(self, a3, (uint64_t)a4);

  if (v7)
  {
    int v25 = 0;
    char v26 = 1;
    uint64_t v10 = objc_msgSend_dischargingEnabledUntil(self, v8, v9);
    int v25 = objc_msgSend_unsignedIntValue(v10, v11, v12);
  }
  v13 = objc_msgSend_maximumDischargeCurrent(self, v8, v9);
  uint64_t v27 = objc_msgSend_longLongValue(v13, v14, v15);

  sub_244CC8F5C(0x62FuLL, 0, &v22);
  if (v22)
  {
    sub_244CB62B8((uint64_t)v17);
    v19 = 0;
    v20 = 0;
    uint64_t v18 = &unk_26F9536C8;
    char v21 = 0;
    sub_2447945A0((uint64_t)&v18, &v22, 0);
    sub_244CB6318((uint64_t)v17, (uint64_t)&v18, 0xFFFFFFFF, (uint64_t)v28);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24481CB34((uint64_t)&v25, v17, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v17, &v22, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v22);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    uint64_t v18 = &unk_26F9536C8;
    sub_244794634(&v20);
    sub_244794634(&v19);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 17904;
  }
  sub_244794634(&v22);
  return (ChipError *)sub_24479466C((uint64_t)&v23);
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
    int v11 = 17933;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end