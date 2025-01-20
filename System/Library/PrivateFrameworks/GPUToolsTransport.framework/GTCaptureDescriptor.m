@interface GTCaptureDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoreUnusedResources;
- (BOOL)includeBacktrace;
- (BOOL)isToolsCapture;
- (BOOL)suspendAfterCapture;
- (GTCaptureDescriptor)initWithCoder:(id)a3;
- (GTCaptureDescriptor)initWithRequestID:(unint64_t)a3;
- (NSURL)outputURL;
- (id)description;
- (unint64_t)sessionID;
- (unint64_t)streamRef;
- (unint64_t)triggerHitsToEnd;
- (unint64_t)triggerHitsToStart;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnoreUnusedResources:(BOOL)a3;
- (void)setIncludeBacktrace:(BOOL)a3;
- (void)setIsToolsCapture:(BOOL)a3;
- (void)setOutputURL:(id)a3;
- (void)setSessionID:(unint64_t)a3;
- (void)setStreamRef:(unint64_t)a3;
- (void)setSuspendAfterCapture:(BOOL)a3;
- (void)setTriggerHitsToEnd:(unint64_t)a3;
- (void)setTriggerHitsToStart:(unint64_t)a3;
@end

@implementation GTCaptureDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureDescriptor)initWithRequestID:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GTCaptureDescriptor;
  v3 = [(GTCaptureRequest *)&v6 initWithRequestID:a3];
  v4 = v3;
  if (v3) {
    v3->_sessionID = [(GTCaptureRequest *)v3 requestID];
  }
  return v4;
}

- (GTCaptureDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTCaptureDescriptor;
  v5 = [(GTCaptureRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_sessionID = [v4 decodeInt64ForKey:@"sessionID"];
    v5->_triggerHitsToStart = [v4 decodeInt64ForKey:@"triggerHitsToStart"];
    v5->_triggerHitsToEnd = [v4 decodeInt64ForKey:@"triggerHitsToEnd"];
    v5->_suspendAfterCapture = [v4 decodeBoolForKey:@"suspendAfterCapture"];
    v5->_ignoreUnusedResources = [v4 decodeBoolForKey:@"ignoreUnusedResources"];
    v5->_isToolsCapture = [v4 decodeBoolForKey:@"isToolsCapture"];
    v5->_includeBacktrace = [v4 decodeBoolForKey:@"includeBacktrace"];
    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    uint64_t v6 = [v4 decodeObjectForKey:@"outputURL"];
    outputURL = v5->_outputURL;
    v5->_outputURL = (NSURL *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sessionID = self->_sessionID;
  id v5 = a3;
  [v5 encodeInt64:sessionID forKey:@"sessionID"];
  [v5 encodeInt64:self->_triggerHitsToStart forKey:@"triggerHitsToStart"];
  [v5 encodeInt64:self->_triggerHitsToEnd forKey:@"triggerHitsToEnd"];
  [v5 encodeBool:self->_suspendAfterCapture forKey:@"suspendAfterCapture"];
  [v5 encodeBool:self->_ignoreUnusedResources forKey:@"ignoreUnusedResources"];
  [v5 encodeBool:self->_isToolsCapture forKey:@"isToolsCapture"];
  [v5 encodeBool:self->_includeBacktrace forKey:@"includeBacktrace"];
  [v5 encodeInt64:self->_streamRef forKey:@"streamRef"];
  [v5 encodeObject:self->_outputURL forKey:@"outputURL"];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)GTCaptureDescriptor;
  id v4 = [(GTCaptureDescriptor *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@\n    sessionID: %llu", v4, self->_sessionID];

  return v5;
}

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->_unint64_t sessionID = a3;
}

- (unint64_t)triggerHitsToStart
{
  return self->_triggerHitsToStart;
}

- (void)setTriggerHitsToStart:(unint64_t)a3
{
  self->_triggerHitsToStart = a3;
}

- (unint64_t)triggerHitsToEnd
{
  return self->_triggerHitsToEnd;
}

- (void)setTriggerHitsToEnd:(unint64_t)a3
{
  self->_triggerHitsToEnd = a3;
}

- (BOOL)suspendAfterCapture
{
  return self->_suspendAfterCapture;
}

- (void)setSuspendAfterCapture:(BOOL)a3
{
  self->_suspendAfterCapture = a3;
}

- (BOOL)ignoreUnusedResources
{
  return self->_ignoreUnusedResources;
}

- (void)setIgnoreUnusedResources:(BOOL)a3
{
  self->_ignoreUnusedResources = a3;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (BOOL)includeBacktrace
{
  return self->_includeBacktrace;
}

- (void)setIncludeBacktrace:(BOOL)a3
{
  self->_includeBacktrace = a3;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
}

- (BOOL)isToolsCapture
{
  return self->_isToolsCapture;
}

- (void)setIsToolsCapture:(BOOL)a3
{
  self->_isToolsCapture = a3;
}

- (void).cxx_destruct
{
}

@end