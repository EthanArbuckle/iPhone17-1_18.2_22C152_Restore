@interface HDHeadphoneExposureStatisticUpdateResult
+ (id)_resultWithIncludedSeries:(BOOL)a3 canTriggerNotification:(BOOL)a4;
+ (id)_resultWithIncludedSeries:(BOOL)a3 samples:(id)a4;
+ (id)resultForAggregation;
+ (id)resultForEmptySamplesAdded;
+ (id)resultForSamplesAdded:(id)a3 includedSeries:(BOOL)a4;
+ (id)resultForSamplesJournaled:(id)a3;
- (BOOL)canTriggerNotification;
- (BOOL)includedSeries;
- (id)_initWithIncludedSeries:(BOOL)a3 canTriggerNotification:(BOOL)a4;
- (void)combineWithResult:(id)a3;
@end

@implementation HDHeadphoneExposureStatisticUpdateResult

+ (id)resultForEmptySamplesAdded
{
  return (id)[a1 _resultWithIncludedSeries:1 canTriggerNotification:0];
}

+ (id)resultForAggregation
{
  return (id)[a1 _resultWithIncludedSeries:1 canTriggerNotification:0];
}

+ (id)resultForSamplesAdded:(id)a3 includedSeries:(BOOL)a4
{
  return (id)[a1 _resultWithIncludedSeries:a4 samples:a3];
}

+ (id)resultForSamplesJournaled:(id)a3
{
  return (id)[a1 _resultWithIncludedSeries:0 samples:a3];
}

- (void)combineWithResult:(id)a3
{
  id v6 = a3;
  int v4 = [(HDHeadphoneExposureStatisticUpdateResult *)self includedSeries];
  if (v4) {
    LOBYTE(v4) = [v6 includedSeries];
  }
  self->_includedSeries = v4;
  if ([(HDHeadphoneExposureStatisticUpdateResult *)self canTriggerNotification]) {
    char v5 = 1;
  }
  else {
    char v5 = [v6 canTriggerNotification];
  }
  self->_canTriggerNotification = v5;
  MEMORY[0x270F9A758]();
}

+ (id)_resultWithIncludedSeries:(BOOL)a3 samples:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hk_canTriggerHeadphoneExposureNotification", (void)v12))
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v10 = [a1 _resultWithIncludedSeries:v4 canTriggerNotification:v7];

  return v10;
}

+ (id)_resultWithIncludedSeries:(BOOL)a3 canTriggerNotification:(BOOL)a4
{
  BOOL v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithIncludedSeries:a3 canTriggerNotification:a4];
  return v4;
}

- (id)_initWithIncludedSeries:(BOOL)a3 canTriggerNotification:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HDHeadphoneExposureStatisticUpdateResult;
  id v6 = [(HDHeadphoneExposureStatisticUpdateResult *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_includedSeries = a3;
    v6->_canTriggerNotification = a4;
    uint64_t v8 = v6;
  }

  return v7;
}

- (BOOL)includedSeries
{
  return self->_includedSeries;
}

- (BOOL)canTriggerNotification
{
  return self->_canTriggerNotification;
}

@end