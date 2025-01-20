@interface HRAtrialFibrillationConfirmationCycleMetric
- (HRAtrialFibrillationConfirmationCycleMetric)initWithAgeBin:(unint64_t)a3 numberOfPositiveTachograms:(int64_t)a4 numberOfNegativeTachograms:(int64_t)a5 algorithmVersion:(int64_t)a6 biologicalSex:(int64_t)a7 userShouldBeAlerted:(BOOL)a8 cycleDuration:(double)a9 additionalMetrics:(id)a10;
- (NSDictionary)payload;
- (NSMutableDictionary)eventPayload;
- (void)setEventPayload:(id)a3;
@end

@implementation HRAtrialFibrillationConfirmationCycleMetric

- (HRAtrialFibrillationConfirmationCycleMetric)initWithAgeBin:(unint64_t)a3 numberOfPositiveTachograms:(int64_t)a4 numberOfNegativeTachograms:(int64_t)a5 algorithmVersion:(int64_t)a6 biologicalSex:(int64_t)a7 userShouldBeAlerted:(BOOL)a8 cycleDuration:(double)a9 additionalMetrics:(id)a10
{
  BOOL v11 = a8;
  id v17 = a10;
  v32.receiver = self;
  v32.super_class = (Class)HRAtrialFibrillationConfirmationCycleMetric;
  v18 = [(HRAtrialFibrillationConfirmationCycleMetric *)&v32 init];
  if (v18)
  {
    if (a4 >= 1) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = -1;
    }
    if (v11) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v19;
    }
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
    eventPayload = v18->_eventPayload;
    v18->_eventPayload = (NSMutableDictionary *)v21;

    v23 = NSStringFromHKHRAnalyticsAgeBin();
    [(NSMutableDictionary *)v18->_eventPayload setObject:v23 forKeyedSubscript:@"age"];

    v24 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v18->_eventPayload setObject:v24 forKeyedSubscript:@"numberOfPositiveTachograms"];

    v25 = [NSNumber numberWithInteger:a5];
    [(NSMutableDictionary *)v18->_eventPayload setObject:v25 forKeyedSubscript:@"numberOfNegativeTachograms"];

    v26 = [NSNumber numberWithInteger:a6];
    [(NSMutableDictionary *)v18->_eventPayload setObject:v26 forKeyedSubscript:@"algorithmVersionIRN"];

    if ((unint64_t)a7 > 3) {
      v27 = @"Unknown";
    }
    else {
      v27 = off_1E69B46C8[a7];
    }
    [(NSMutableDictionary *)v18->_eventPayload setObject:v27 forKeyedSubscript:@"sex"];
    v28 = [NSNumber numberWithInteger:v20];
    [(NSMutableDictionary *)v18->_eventPayload setObject:v28 forKeyedSubscript:@"cycleResult"];

    if (a4 > 0 || v11) {
      uint64_t v29 = (uint64_t)(a9 / 60.0);
    }
    else {
      uint64_t v29 = -1;
    }
    v30 = [NSNumber numberWithInteger:v29];
    [(NSMutableDictionary *)v18->_eventPayload setObject:v30 forKeyedSubscript:@"cycleDuration"];
  }
  return v18;
}

- (NSDictionary)payload
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  v3 = [(HRAtrialFibrillationConfirmationCycleMetric *)self eventPayload];
  v4 = [v2 dictionaryWithDictionary:v3];

  return (NSDictionary *)v4;
}

- (NSMutableDictionary)eventPayload
{
  return self->_eventPayload;
}

- (void)setEventPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end