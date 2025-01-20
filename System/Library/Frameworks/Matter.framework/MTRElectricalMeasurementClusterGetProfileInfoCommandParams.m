@interface MTRElectricalMeasurementClusterGetProfileInfoCommandParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRElectricalMeasurementClusterGetProfileInfoCommandParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRElectricalMeasurementClusterGetProfileInfoCommandParams

- (MTRElectricalMeasurementClusterGetProfileInfoCommandParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRElectricalMeasurementClusterGetProfileInfoCommandParams;
  v2 = [(MTRElectricalMeasurementClusterGetProfileInfoCommandParams *)&v7 init];
  v3 = v2;
  if (v2)
  {
    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalMeasurementClusterGetProfileInfoCommandParams);
  objc_super v7 = objc_msgSend_timedInvokeTimeoutMs(self, v5, v6);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_serverSideProcessingTimeout(self, v9, v10);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v6 = objc_msgSend_stringWithFormat_(v2, v5, @"<%@: >", v4);

  return v6;
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
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  retstr->mError = 45;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRBackw"
                  "ardsCompatShims.mm";
  retstr->mLine = 11813;
  return self;
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
                            "P/MTRBackwardsCompatShims.mm";
    int v11 = 11830;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end