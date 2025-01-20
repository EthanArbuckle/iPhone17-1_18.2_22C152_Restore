@interface GTReplayShaderDebugRequest
+ (BOOL)supportsSecureCoding;
- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID;
- (GTReplayShaderDebugRequest)initWithCoder:(id)a3;
- (NSData)programData;
- (id)completionHandler;
- (int)programDataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchUID:(id)a3;
- (void)setProgramData:(id)a3;
- (void)setProgramDataVersion:(int)a3;
@end

@implementation GTReplayShaderDebugRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayShaderDebugRequest;
  v5 = [(GTReplayRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, @"dispatchUID");
    v5->_programDataVersion = [v4 decodeInt64ForKey:@"ProgramDataVersion"];
    uint64_t v6 = [v4 decodeDataObject];
    programData = v5->_programData;
    v5->_programData = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayShaderDebugRequest;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, @"dispatchUID");
  objc_msgSend(v4, "encodeInt64:forKey:", self->_programDataVersion, @"ProgramDataVersion", v5.receiver, v5.super_class);
  [v4 encodeDataObject:self->_programData];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (int)programDataVersion
{
  return self->_programDataVersion;
}

- (void)setProgramDataVersion:(int)a3
{
  self->_programDataVersion = a3;
}

- (NSData)programData
{
  return self->_programData;
}

- (void)setProgramData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programData, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end