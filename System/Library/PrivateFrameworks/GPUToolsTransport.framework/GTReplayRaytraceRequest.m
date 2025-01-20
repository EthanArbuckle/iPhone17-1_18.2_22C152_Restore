@interface GTReplayRaytraceRequest
+ (BOOL)supportsSecureCoding;
- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID;
- (GTReplayRaytraceRequest)initWithCoder:(id)a3;
- (id)description;
- (id)streamHandler;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setDispatchUID:(id)a3;
- (void)setStreamHandler:(id)a3;
- (void)setStreamRef:(unint64_t)a3;
@end

@implementation GTReplayRaytraceRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayRaytraceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayRaytraceRequest;
  v5 = [(GTReplayRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, @"dispatchUID");
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayRaytraceRequest;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, @"streamRef", v5.receiver, v5.super_class);
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, @"dispatchUID");
}

- (id)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)GTReplayRaytraceRequest;
  v3 = [(GTReplayRaytraceRequest *)&v6 self];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)streamHandler
{
  return self->_streamHandler;
}

- (void)setStreamHandler:(id)a3
{
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (void).cxx_destruct
{
}

@end