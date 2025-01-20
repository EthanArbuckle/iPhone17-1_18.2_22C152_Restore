@interface HFAnalyticsCCPredictionEvent
+ (void)sendMetricsForPredictionEventAtStage:(unint64_t)a3 withCount:(unint64_t)a4;
- (HFAnalyticsCCPredictionEvent)initWithData:(id)a3;
- (id)payload;
- (unint64_t)predictionCount;
- (unint64_t)predictionStage;
- (void)setPredictionCount:(unint64_t)a3;
- (void)setPredictionStage:(unint64_t)a3;
@end

@implementation HFAnalyticsCCPredictionEvent

+ (void)sendMetricsForPredictionEventAtStage:(unint64_t)a3 withCount:(unint64_t)a4
{
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v6 forKeyedSubscript:@"predictionStage"];

  v7 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v7 forKeyedSubscript:@"predictionCount"];

  +[HFAnalytics sendEvent:1 withData:v8];
}

- (HFAnalyticsCCPredictionEvent)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"predictionStage"];
  uint64_t v6 = [v5 integerValue];

  if (!v6) {
    NSLog(&cfstr_Hfanalyticsccp.isa);
  }
  v7 = [v4 objectForKeyedSubscript:@"predictionCount"];
  uint64_t v8 = [v7 integerValue];

  v12.receiver = self;
  v12.super_class = (Class)HFAnalyticsCCPredictionEvent;
  v9 = [(HFAnalyticsEvent *)&v12 initWithEventType:1];
  v10 = v9;
  if (v9)
  {
    v9->_predictionStage = v6;
    v9->_predictionCount = v8;
  }

  return v10;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsCCPredictionEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HFAnalyticsCCPredictionEvent predictionStage](self, "predictionStage"));
  [v4 setObject:v5 forKeyedSubscript:@"predictionStage"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HFAnalyticsCCPredictionEvent predictionCount](self, "predictionCount"));
  [v4 setObject:v6 forKeyedSubscript:@"predictionCount"];

  return v4;
}

- (unint64_t)predictionStage
{
  return self->_predictionStage;
}

- (void)setPredictionStage:(unint64_t)a3
{
  self->_predictionStage = a3;
}

- (unint64_t)predictionCount
{
  return self->_predictionCount;
}

- (void)setPredictionCount:(unint64_t)a3
{
  self->_predictionCount = a3;
}

@end