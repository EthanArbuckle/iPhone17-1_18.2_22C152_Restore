@interface GTReplayUpdateLibrary
+ (BOOL)supportsSecureCoding;
- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID;
- (GTReplayUpdateLibrary)initWithCoder:(id)a3;
- (NSData)shaderIR;
- (NSString)shaderSource;
- (NSURL)shaderURL;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setDispatchUID:(id)a3;
- (void)setShaderIR:(id)a3;
- (void)setShaderSource:(id)a3;
- (void)setShaderURL:(id)a3;
- (void)setStreamRef:(unint64_t)a3;
@end

@implementation GTReplayUpdateLibrary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayUpdateLibrary)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GTReplayUpdateLibrary;
  v5 = [(GTReplayRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shaderURL"];
    shaderURL = v5->_shaderURL;
    v5->_shaderURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shaderIR"];
    shaderIR = v5->_shaderIR;
    v5->_shaderIR = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shaderSource"];
    shaderSource = v5->_shaderSource;
    v5->_shaderSource = (NSString *)v10;

    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, @"dispatchUID");
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayUpdateLibrary;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, @"streamRef", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_shaderURL forKey:@"shaderURL"];
  [v4 encodeObject:self->_shaderIR forKey:@"shaderIR"];
  [v4 encodeObject:self->_shaderSource forKey:@"shaderSource"];
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, @"dispatchUID");
}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (NSURL)shaderURL
{
  return self->_shaderURL;
}

- (void)setShaderURL:(id)a3
{
}

- (NSData)shaderIR
{
  return self->_shaderIR;
}

- (void)setShaderIR:(id)a3
{
}

- (NSString)shaderSource
{
  return self->_shaderSource;
}

- (void)setShaderSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaderSource, 0);
  objc_storeStrong((id *)&self->_shaderIR, 0);
  objc_storeStrong((id *)&self->_shaderURL, 0);
}

@end