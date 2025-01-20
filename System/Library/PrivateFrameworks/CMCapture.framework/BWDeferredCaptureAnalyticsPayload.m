@interface BWDeferredCaptureAnalyticsPayload
- (BOOL)fileBacked;
- (BWDeferredCaptureAnalyticsPayload)init;
- (id)eventDictionary;
- (id)eventName;
- (int)error;
- (int)processingType;
- (unsigned)commitDurationInMilliseconds;
- (unsigned)flushDurationInMilliseconds;
- (void)dealloc;
- (void)reset;
- (void)setCommitDurationInMilliseconds:(unsigned int)a3;
- (void)setError:(int)a3;
- (void)setFileBacked:(BOOL)a3;
- (void)setFlushDurationInMilliseconds:(unsigned int)a3;
- (void)setProcessingType:(int)a3;
@end

@implementation BWDeferredCaptureAnalyticsPayload

- (BWDeferredCaptureAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWDeferredCaptureAnalyticsPayload;
  v2 = [(BWDeferredCaptureAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWDeferredCaptureAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWDeferredCaptureAnalyticsPayload;
  [(BWDeferredCaptureAnalyticsPayload *)&v2 dealloc];
}

- (void)reset
{
  self->_commitDurationInMilliseconds = 0;
  self->_flushDurationInMilliseconds = 0;
  *(void *)&self->_error = 0;
  self->_fileBacked = 0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.DeferredCapture";
}

- (id)eventDictionary
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_error), @"error");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_processingType), @"processingType");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_fileBacked), @"fileBacked");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_commitDurationInMilliseconds), @"commitDurationInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_flushDurationInMilliseconds), @"flushDurationInMilliseconds");
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

- (unsigned)commitDurationInMilliseconds
{
  return self->_commitDurationInMilliseconds;
}

- (void)setCommitDurationInMilliseconds:(unsigned int)a3
{
  self->_commitDurationInMilliseconds = a3;
}

- (unsigned)flushDurationInMilliseconds
{
  return self->_flushDurationInMilliseconds;
}

- (void)setFlushDurationInMilliseconds:(unsigned int)a3
{
  self->_flushDurationInMilliseconds = a3;
}

@end