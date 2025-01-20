@interface BWTOFAssistedAutoFocusEstimatorAnalyticsPayload
- (BWTOFAssistedAutoFocusEstimatorAnalyticsPayload)init;
- (NSDictionary)estimatorResults;
- (NSString)clientApplicationID;
- (NSString)portType;
- (id)eventDictionary;
- (id)eventName;
- (unsigned)streamingTime;
- (void)dealloc;
- (void)reset;
- (void)setClientApplicationID:(id)a3;
- (void)setEstimatorResults:(id)a3;
- (void)setPortType:(id)a3;
- (void)setStreamingTime:(unsigned int)a3;
@end

@implementation BWTOFAssistedAutoFocusEstimatorAnalyticsPayload

- (BWTOFAssistedAutoFocusEstimatorAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWTOFAssistedAutoFocusEstimatorAnalyticsPayload;
  v2 = [(BWTOFAssistedAutoFocusEstimatorAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWTOFAssistedAutoFocusEstimatorAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWTOFAssistedAutoFocusEstimatorAnalyticsPayload;
  [(BWTOFAssistedAutoFocusEstimatorAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_portType = 0;
  self->_clientApplicationID = 0;

  self->_estimatorResults = 0;
  self->_streamingTime = 0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.TOFAssistedAutoFocusEstimator";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  portType = self->_portType;
  if (portType) {
    [v3 setObject:portType forKeyedSubscript:@"portType"];
  }
  clientApplicationID = self->_clientApplicationID;
  if (clientApplicationID)
  {
    [v4 setObject:clientApplicationID forKeyedSubscript:@"clientApplicationID"];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), @"clientIDType");
  }
  if (self->_streamingTime) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"streamingTime");
  }
  estimatorResults = self->_estimatorResults;
  if (estimatorResults)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551C8]), @"testingPFLError");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551A8]), @"testingAvgLuxLevel");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551D8]), @"testingRMSMotion");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551E8]), @"testingTime");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551B0]), @"testingDeltaTemperature");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551C0]), @"testingMinSubjectDistance");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551B8]), @"testingMaxSubjectDistance");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551D0]), @"testingRMSDefocus");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551E0]), @"testingStatus");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55240]), @"trainingStartPFLError");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55210]), @"trainingEndPFLError");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551F8]), @"trainingAvgLuxLevel");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55238]), @"trainingRMSMotion");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55250]), @"trainingTime");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55208]), @"trainingDeltaTemperature");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55228]), @"trainingOffsetCorrection");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55220]), @"trainingMinSubjectDistance");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55218]), @"trainingMaxSubjectDistance");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55230]), @"trainingRMSDefocus");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551F0]), @"timeSinceLastTraining");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55200]), @"trainingConvergenceStatus");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F55248]), @"trainingStatus");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E4F551A0]), @"APEStatus");
  }
  return v4;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

- (NSDictionary)estimatorResults
{
  return self->_estimatorResults;
}

- (void)setEstimatorResults:(id)a3
{
}

- (unsigned)streamingTime
{
  return self->_streamingTime;
}

- (void)setStreamingTime:(unsigned int)a3
{
  self->_streamingTime = a3;
}

@end