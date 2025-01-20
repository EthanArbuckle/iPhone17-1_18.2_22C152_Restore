@interface MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams
- (MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams)init;
- (MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSArray)listOfAttributes;
- (NSNumber)maxNumberOfIntervals;
- (NSNumber)profileCount;
- (NSNumber)profileIntervalPeriod;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setListOfAttributes:(NSArray *)listOfAttributes;
- (void)setMaxNumberOfIntervals:(NSNumber *)maxNumberOfIntervals;
- (void)setProfileCount:(NSNumber *)profileCount;
- (void)setProfileIntervalPeriod:(NSNumber *)profileIntervalPeriod;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams

- (MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams;
  v2 = [(MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams *)&v13 init];
  v3 = v2;
  if (v2)
  {
    profileCount = v2->_profileCount;
    v2->_profileCount = (NSNumber *)&unk_26F9CA828;

    profileIntervalPeriod = v3->_profileIntervalPeriod;
    v3->_profileIntervalPeriod = (NSNumber *)&unk_26F9CA828;

    maxNumberOfIntervals = v3->_maxNumberOfIntervals;
    v3->_maxNumberOfIntervals = (NSNumber *)&unk_26F9CA828;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8);
    listOfAttributes = v3->_listOfAttributes;
    v3->_listOfAttributes = (NSArray *)v9;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams);
  v7 = objc_msgSend_profileCount(self, v5, v6);
  objc_msgSend_setProfileCount_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_profileIntervalPeriod(self, v9, v10);
  objc_msgSend_setProfileIntervalPeriod_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_maxNumberOfIntervals(self, v13, v14);
  objc_msgSend_setMaxNumberOfIntervals_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_listOfAttributes(self, v17, v18);
  objc_msgSend_setListOfAttributes_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: profileCount:%@; profileIntervalPeriod:%@; maxNumberOfIntervals:%@; listOfAttributes:%@; >",
    v5,
    self->_profileCount,
    self->_profileIntervalPeriod,
    self->_maxNumberOfIntervals,
  v7 = self->_listOfAttributes);

  return v7;
}

- (MTRElectricalMeasurementClusterGetProfileInfoResponseCommandParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  if (error)
  {
    LODWORD(v7) = 45;
    *((void *)&v7 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP"
                           "/MTRBackwardsCompatShims.mm";
    int v8 = 11774;
    sub_244B26908((uint64_t)MTRError, &v7);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (NSNumber)profileCount
{
  return self->_profileCount;
}

- (void)setProfileCount:(NSNumber *)profileCount
{
}

- (NSNumber)profileIntervalPeriod
{
  return self->_profileIntervalPeriod;
}

- (void)setProfileIntervalPeriod:(NSNumber *)profileIntervalPeriod
{
}

- (NSNumber)maxNumberOfIntervals
{
  return self->_maxNumberOfIntervals;
}

- (void)setMaxNumberOfIntervals:(NSNumber *)maxNumberOfIntervals
{
}

- (NSArray)listOfAttributes
{
  return self->_listOfAttributes;
}

- (void)setListOfAttributes:(NSArray *)listOfAttributes
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_listOfAttributes, 0);
  objc_storeStrong((id *)&self->_maxNumberOfIntervals, 0);
  objc_storeStrong((id *)&self->_profileIntervalPeriod, 0);

  objc_storeStrong((id *)&self->_profileCount, 0);
}

@end