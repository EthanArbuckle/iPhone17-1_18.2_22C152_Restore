@interface BWOpportunisticInferenceAnalyticsPayload
- (BWOpportunisticInferenceAnalyticsPayload)init;
- (id)eventDictionary;
- (id)eventName;
- (int64_t)inferenceDeadlineOverdue;
- (int64_t)totalInferenceExecutionTime;
- (unsigned)facesProcessedCount;
- (void)reset;
- (void)setFacesProcessedCount:(unsigned int)a3;
- (void)setInferenceDeadlineOverdue:(int64_t)a3;
- (void)setTotalInferenceExecutionTime:(int64_t)a3;
@end

@implementation BWOpportunisticInferenceAnalyticsPayload

- (BWOpportunisticInferenceAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWOpportunisticInferenceAnalyticsPayload;
  v2 = [(BWOpportunisticInferenceAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWOpportunisticInferenceAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  self->_facesProcessedCount = 0;
  self->_totalInferenceExecutionTime = 0;
  self->_inferenceDeadlineOverdue = 0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.OpportunisticInference";
}

- (id)eventDictionary
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_totalInferenceExecutionTime), @"totalInferenceExecutionTimeMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_inferenceDeadlineOverdue), @"inferenceDeadlineOverdueMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_facesProcessedCount), @"facesProcessedCount");
  return v3;
}

- (int64_t)totalInferenceExecutionTime
{
  return self->_totalInferenceExecutionTime;
}

- (void)setTotalInferenceExecutionTime:(int64_t)a3
{
  self->_totalInferenceExecutionTime = a3;
}

- (int64_t)inferenceDeadlineOverdue
{
  return self->_inferenceDeadlineOverdue;
}

- (void)setInferenceDeadlineOverdue:(int64_t)a3
{
  self->_inferenceDeadlineOverdue = a3;
}

- (unsigned)facesProcessedCount
{
  return self->_facesProcessedCount;
}

- (void)setFacesProcessedCount:(unsigned int)a3
{
  self->_facesProcessedCount = a3;
}

@end