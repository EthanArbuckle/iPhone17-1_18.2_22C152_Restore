@interface BWDeferredProcessingAnalyticsPayload
- (BOOL)fileBacked;
- (BOOL)interactiveQoS;
- (BWDeferredProcessingAnalyticsPayload)init;
- (NSString)processingResult;
- (id)eventDictionary;
- (id)eventName;
- (int)containerProcessingCount;
- (int)error;
- (int)processingType;
- (unint64_t)containerSizeInBytes;
- (unsigned)containerAgeInSeconds;
- (unsigned)graphPrepareDurationInMilliseconds;
- (unsigned)jobDurationInMilliseconds;
- (void)dealloc;
- (void)reset;
- (void)setContainerAgeInSeconds:(unsigned int)a3;
- (void)setContainerProcessingCount:(int)a3;
- (void)setContainerSizeInBytes:(unint64_t)a3;
- (void)setError:(int)a3;
- (void)setFileBacked:(BOOL)a3;
- (void)setGraphPrepareDurationInMilliseconds:(unsigned int)a3;
- (void)setInteractiveQoS:(BOOL)a3;
- (void)setJobDurationInMilliseconds:(unsigned int)a3;
- (void)setProcessingResult:(id)a3;
- (void)setProcessingType:(int)a3;
@end

@implementation BWDeferredProcessingAnalyticsPayload

- (BWDeferredProcessingAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWDeferredProcessingAnalyticsPayload;
  v2 = [(BWDeferredProcessingAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWDeferredProcessingAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredProcessingAnalyticsPayload;
  [(BWDeferredProcessingAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_error = 0;
  [(BWDeferredProcessingAnalyticsPayload *)self setProcessingResult:@"Unknown"];
  self->_processingType = 0;
  self->_fileBacked = 0;
  self->_containerAgeInSeconds = 0;
  self->_containerSizeInBytes = 0;
  self->_interactiveQoS = 0;
  *(void *)&self->_jobDurationInMilliseconds = 0;
  self->_graphPrepareDurationInMilliseconds = 0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.DeferredProcessing";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_error), @"error");
  [v3 setObject:self->_processingResult forKeyedSubscript:@"processingResult"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_processingType), @"processingType");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_fileBacked), @"fileBacked");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_containerAgeInSeconds), @"containerAgeInSeconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_containerSizeInBytes), @"containerSizeInBytes");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_interactiveQoS), @"interactiveQoS");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_graphPrepareDurationInMilliseconds), @"graphPrepareDurationInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_jobDurationInMilliseconds), @"jobDurationInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_containerProcessingCount), @"containerProcessingCount");
  return v3;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (NSString)processingResult
{
  return self->_processingResult;
}

- (void)setProcessingResult:(id)a3
{
}

- (int)processingType
{
  return self->_processingType;
}

- (void)setProcessingType:(int)a3
{
  self->_processingType = a3;
}

- (BOOL)fileBacked
{
  return self->_fileBacked;
}

- (void)setFileBacked:(BOOL)a3
{
  self->_fileBacked = a3;
}

- (unsigned)containerAgeInSeconds
{
  return self->_containerAgeInSeconds;
}

- (void)setContainerAgeInSeconds:(unsigned int)a3
{
  self->_containerAgeInSeconds = a3;
}

- (unint64_t)containerSizeInBytes
{
  return self->_containerSizeInBytes;
}

- (void)setContainerSizeInBytes:(unint64_t)a3
{
  self->_containerSizeInBytes = a3;
}

- (BOOL)interactiveQoS
{
  return self->_interactiveQoS;
}

- (void)setInteractiveQoS:(BOOL)a3
{
  self->_interactiveQoS = a3;
}

- (unsigned)graphPrepareDurationInMilliseconds
{
  return self->_graphPrepareDurationInMilliseconds;
}

- (void)setGraphPrepareDurationInMilliseconds:(unsigned int)a3
{
  self->_graphPrepareDurationInMilliseconds = a3;
}

- (unsigned)jobDurationInMilliseconds
{
  return self->_jobDurationInMilliseconds;
}

- (void)setJobDurationInMilliseconds:(unsigned int)a3
{
  self->_jobDurationInMilliseconds = a3;
}

- (int)containerProcessingCount
{
  return self->_containerProcessingCount;
}

- (void)setContainerProcessingCount:(int)a3
{
  self->_containerProcessingCount = a3;
}

@end