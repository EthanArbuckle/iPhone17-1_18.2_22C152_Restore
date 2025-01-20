@interface MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams)init;
- (NSNumber)attributeId;
- (NSNumber)numberOfIntervals;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)startTime;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAttributeId:(NSNumber *)attributeId;
- (void)setNumberOfIntervals:(NSNumber *)numberOfIntervals;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setStartTime:(NSNumber *)startTime;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams

- (MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams;
  v2 = [(MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    attributeId = v2->_attributeId;
    v2->_attributeId = (NSNumber *)&unk_26F9CA828;

    startTime = v3->_startTime;
    v3->_startTime = (NSNumber *)&unk_26F9CA828;

    numberOfIntervals = v3->_numberOfIntervals;
    v3->_numberOfIntervals = (NSNumber *)&unk_26F9CA828;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalMeasurementClusterGetMeasurementProfileCommandParams);
  v7 = objc_msgSend_attributeId(self, v5, v6);
  objc_msgSend_setAttributeId_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_startTime(self, v9, v10);
  objc_msgSend_setStartTime_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_numberOfIntervals(self, v13, v14);
  objc_msgSend_setNumberOfIntervals_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: attributeId:%@; startTime:%@; numberOfIntervals:%@; >",
    v5,
    self->_attributeId,
    self->_startTime,
  v7 = self->_numberOfIntervals);

  return v7;
}

- (NSNumber)attributeId
{
  return self->_attributeId;
}

- (void)setAttributeId:(NSNumber *)attributeId
{
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(NSNumber *)startTime
{
}

- (NSNumber)numberOfIntervals
{
  return self->_numberOfIntervals;
}

- (void)setNumberOfIntervals:(NSNumber *)numberOfIntervals
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
  objc_storeStrong((id *)&self->_numberOfIntervals, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_attributeId, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  retstr->mError = 45;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRBackw"
                  "ardsCompatShims.mm";
  retstr->mLine = 11931;
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
    int v11 = 11948;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end