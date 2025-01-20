@interface GTReplaySessionInfo
+ (BOOL)supportsSecureCoding;
- (GTReplaySessionInfo)initWithCoder:(id)a3;
- (NSURL)gputraceURL;
- (unint64_t)accelerationViewerVersion;
- (unint64_t)shaderDebuggerVersion;
- (unint64_t)shaderProfilerVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setAccelerationViewerVersion:(unint64_t)a3;
- (void)setGputraceURL:(id)a3;
- (void)setShaderDebuggerVersion:(unint64_t)a3;
- (void)setShaderProfilerVersion:(unint64_t)a3;
@end

@implementation GTReplaySessionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplaySessionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplaySessionInfo;
  v5 = [(GTReplaySessionInfo *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gputraceURL"];
    gputraceURL = v5->_gputraceURL;
    v5->_gputraceURL = (NSURL *)v6;

    v5->_shaderDebuggerVersion = [v4 decodeInt64ForKey:@"shaderDebuggerVersion"];
    v5->_shaderProfilerVersion = [v4 decodeInt64ForKey:@"shaderProfilerVersion"];
    v5->_accelerationViewerVersion = [v4 decodeInt64ForKey:@"accelerationViewerVersion"];
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  gputraceURL = self->_gputraceURL;
  id v5 = a3;
  [v5 encodeObject:gputraceURL forKey:@"gputraceURL"];
  [v5 encodeInt64:self->_shaderDebuggerVersion forKey:@"shaderDebuggerVersion"];
  [v5 encodeInt64:self->_shaderProfilerVersion forKey:@"shaderProfilerVersion"];
  [v5 encodeInt64:self->_accelerationViewerVersion forKey:@"accelerationViewerVersion"];
}

- (NSURL)gputraceURL
{
  return self->_gputraceURL;
}

- (void)setGputraceURL:(id)a3
{
}

- (unint64_t)shaderDebuggerVersion
{
  return self->_shaderDebuggerVersion;
}

- (void)setShaderDebuggerVersion:(unint64_t)a3
{
  self->_shaderDebuggerVersion = a3;
}

- (unint64_t)shaderProfilerVersion
{
  return self->_shaderProfilerVersion;
}

- (void)setShaderProfilerVersion:(unint64_t)a3
{
  self->_shaderProfilerVersion = a3;
}

- (unint64_t)accelerationViewerVersion
{
  return self->_accelerationViewerVersion;
}

- (void)setAccelerationViewerVersion:(unint64_t)a3
{
  self->_accelerationViewerVersion = a3;
}

- (void).cxx_destruct
{
}

@end