@interface AVSampleBufferRequest
+ (AVSampleBufferRequest)sampleBufferRequestWithStartCursor:(id)a3;
- (AVSampleBufferRequest)init;
- (AVSampleBufferRequest)initWithStartCursor:(AVSampleCursor *)startCursor;
- (AVSampleBufferRequestDirection)direction;
- (AVSampleBufferRequestMode)mode;
- (AVSampleCursor)limitCursor;
- (AVSampleCursor)startCursor;
- (CMTime)overrideTime;
- (NSInteger)maxSampleCount;
- (NSInteger)preferredMinSampleCount;
- (int)_figSampleGeneratorReadPolicy;
- (unsigned)_figSampleGeneratorReadFlags;
- (void)dealloc;
- (void)setDirection:(AVSampleBufferRequestDirection)direction;
- (void)setLimitCursor:(AVSampleCursor *)limitCursor;
- (void)setMaxSampleCount:(NSInteger)maxSampleCount;
- (void)setMode:(AVSampleBufferRequestMode)mode;
- (void)setOverrideTime:(CMTime *)overrideTime;
- (void)setPreferredMinSampleCount:(NSInteger)preferredMinSampleCount;
@end

@implementation AVSampleBufferRequest

+ (AVSampleBufferRequest)sampleBufferRequestWithStartCursor:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStartCursor:a3];
  return (AVSampleBufferRequest *)v3;
}

- (AVSampleBufferRequest)initWithStartCursor:(AVSampleCursor *)startCursor
{
  v9.receiver = self;
  v9.super_class = (Class)AVSampleBufferRequest;
  v4 = [(AVSampleBufferRequest *)&v9 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVSampleBufferRequestInternal);
    v4->_request = v5;
    CFRetain(v5);
    if (startCursor && v4->_request)
    {
      v4->_request->startCursor = startCursor;
      request = v4->_request;
      v7 = (_OWORD *)MEMORY[0x1E4F1F9F8];
      request->overrideTime.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      *(_OWORD *)&request->overrideTime.value = *v7;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (AVSampleBufferRequest)init
{
  return [(AVSampleBufferRequest *)self initWithStartCursor:0];
}

- (void)dealloc
{
  request = self->_request;
  if (request)
  {

    CFRelease(self->_request);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferRequest;
  [(AVSampleBufferRequest *)&v4 dealloc];
}

- (AVSampleCursor)startCursor
{
  return self->_request->startCursor;
}

- (AVSampleBufferRequestDirection)direction
{
  return self->_request->direction;
}

- (void)setDirection:(AVSampleBufferRequestDirection)direction
{
  self->_request->direction = direction;
}

- (AVSampleCursor)limitCursor
{
  return self->_request->limitCursor;
}

- (void)setLimitCursor:(AVSampleCursor *)limitCursor
{
  v5 = limitCursor;

  self->_request->limitCursor = limitCursor;
}

- (NSInteger)preferredMinSampleCount
{
  return self->_request->preferredMinSampleCount;
}

- (void)setPreferredMinSampleCount:(NSInteger)preferredMinSampleCount
{
  self->_request->preferredMinSampleCount = preferredMinSampleCount;
}

- (NSInteger)maxSampleCount
{
  return self->_request->maxSampleCount;
}

- (void)setMaxSampleCount:(NSInteger)maxSampleCount
{
  self->_request->maxSampleCount = maxSampleCount;
}

- (AVSampleBufferRequestMode)mode
{
  return self->_request->mode;
}

- (int)_figSampleGeneratorReadPolicy
{
  return 2 * (self->_request->mode != 1);
}

- (unsigned)_figSampleGeneratorReadFlags
{
  return self->_request->mode == 2;
}

- (void)setMode:(AVSampleBufferRequestMode)mode
{
  self->_request->mode = mode;
}

- (CMTime)overrideTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self->timescale
                                                                                      + 56);
  return self;
}

- (void)setOverrideTime:(CMTime *)overrideTime
{
  request = self->_request;
  long long v4 = *(_OWORD *)&overrideTime->value;
  request->overrideTime.epoch = overrideTime->epoch;
  *(_OWORD *)&request->overrideTime.value = v4;
}

@end