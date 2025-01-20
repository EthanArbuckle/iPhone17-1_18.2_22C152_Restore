@interface DYCaptureDescriptor
- (BOOL)armPreparedCapture;
- (BOOL)includeBacktraceInFbufs;
- (BOOL)isBoundaryLess;
- (BOOL)lockGraphicsAfterCapture;
- (BOOL)suspendAfterCapture;
- (BOOL)unlockGraphicThreadsOnActivateCapture;
- (DYCaptureDescriptor)initWithAPI:(unint64_t)a3;
- (NSURL)localFilePathURL;
- (unint64_t)api;
- (unint64_t)framesToCapture;
- (unint64_t)sessionId;
- (unint64_t)triggerFrame;
- (void)dealloc;
- (void)setArmPreparedCapture:(BOOL)a3;
- (void)setFramesToCapture:(unint64_t)a3;
- (void)setIncludeBacktraceInFbufs:(BOOL)a3;
- (void)setIsBoundaryLess:(BOOL)a3;
- (void)setLocalFilePathURL:(id)a3;
- (void)setLockGraphicsAfterCapture:(BOOL)a3;
- (void)setSessionId:(unint64_t)a3;
- (void)setSuspendAfterCapture:(BOOL)a3;
- (void)setTriggerFrame:(unint64_t)a3;
- (void)setUnlockGraphicThreadsOnActivateCapture:(BOOL)a3;
@end

@implementation DYCaptureDescriptor

- (DYCaptureDescriptor)initWithAPI:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DYCaptureDescriptor;
  result = [(DYCaptureDescriptor *)&v5 init];
  if (result)
  {
    result->_api = a3;
    *(_OWORD *)&result->_sessionId = xmmword_24F6955D0;
    result->_triggerFrame = 0xFFFFFFFFLL;
    *(_WORD *)&result->_suspendAfterCapture = 257;
    result->_includeBacktraceInFbufs = 1;
    *(_WORD *)&result->_unlockGraphicThreadsOnActivateCapture = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYCaptureDescriptor;
  [(DYCaptureDescriptor *)&v3 dealloc];
}

- (unint64_t)api
{
  return self->_api;
}

- (unint64_t)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(unint64_t)a3
{
  self->_sessionId = a3;
}

- (unint64_t)framesToCapture
{
  return self->_framesToCapture;
}

- (void)setFramesToCapture:(unint64_t)a3
{
  self->_framesToCapture = a3;
}

- (unint64_t)triggerFrame
{
  return self->_triggerFrame;
}

- (void)setTriggerFrame:(unint64_t)a3
{
  self->_triggerFrame = a3;
}

- (BOOL)suspendAfterCapture
{
  return self->_suspendAfterCapture;
}

- (void)setSuspendAfterCapture:(BOOL)a3
{
  self->_suspendAfterCapture = a3;
}

- (BOOL)lockGraphicsAfterCapture
{
  return self->_lockGraphicsAfterCapture;
}

- (void)setLockGraphicsAfterCapture:(BOOL)a3
{
  self->_lockGraphicsAfterCapture = a3;
}

- (BOOL)includeBacktraceInFbufs
{
  return self->_includeBacktraceInFbufs;
}

- (void)setIncludeBacktraceInFbufs:(BOOL)a3
{
  self->_includeBacktraceInFbufs = a3;
}

- (BOOL)isBoundaryLess
{
  return self->_isBoundaryLess;
}

- (void)setIsBoundaryLess:(BOOL)a3
{
  self->_isBoundaryLess = a3;
}

- (BOOL)unlockGraphicThreadsOnActivateCapture
{
  return self->_unlockGraphicThreadsOnActivateCapture;
}

- (void)setUnlockGraphicThreadsOnActivateCapture:(BOOL)a3
{
  self->_unlockGraphicThreadsOnActivateCapture = a3;
}

- (BOOL)armPreparedCapture
{
  return self->_armPreparedCapture;
}

- (void)setArmPreparedCapture:(BOOL)a3
{
  self->_armPreparedCapture = a3;
}

- (NSURL)localFilePathURL
{
  return self->_localFilePathURL;
}

- (void)setLocalFilePathURL:(id)a3
{
}

@end