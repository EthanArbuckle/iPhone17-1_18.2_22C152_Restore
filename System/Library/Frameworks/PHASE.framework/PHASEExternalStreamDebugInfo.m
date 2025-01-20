@interface PHASEExternalStreamDebugInfo
+ (BOOL)supportsSecureCoding;
- (AVAudioFormat)clientFormat;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInput;
- (BOOL)isStreamPaused;
- (PHASEExternalStreamDebugInfo)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setClientFormat:(id)a3;
- (void)setInput:(BOOL)a3;
- (void)setStreamPaused:(BOOL)a3;
@end

@implementation PHASEExternalStreamDebugInfo

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(PHASEExternalStreamDebugInfo *)self clientFormat];
  v6 = [v4 clientFormat];
  if ([v5 isEqual:v6]
    && (int v7 = -[PHASEExternalStreamDebugInfo isInput](self, "isInput"), v7 == [v4 isInput]))
  {
    BOOL v9 = [(PHASEExternalStreamDebugInfo *)self isStreamPaused];
    int v8 = v9 ^ [v4 isStreamPaused] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_clientFormat forKey:@"clientFormat"];
  [v4 encodeBool:self->_input forKey:@"input"];
  [v4 encodeBool:self->_streamPaused forKey:@"streamPaused"];
}

- (PHASEExternalStreamDebugInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASEExternalStreamDebugInfo;
  v5 = [(PHASEExternalStreamDebugInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientFormat"];
    clientFormat = v5->_clientFormat;
    v5->_clientFormat = (AVAudioFormat *)v6;

    v5->_input = [v4 decodeBoolForKey:@"input"];
    v5->_streamPaused = [v4 decodeBoolForKey:@"streamPaused"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<PHASEExternalStreamDebugInfo:%p, clientFormat=%@, isInput=%d, isStreamPaused=%d>", self, self->_clientFormat, self->_input, self->_streamPaused];
}

- (void)setClientFormat:(id)a3
{
}

- (void)setInput:(BOOL)a3
{
  self->_input = a3;
}

- (void)setStreamPaused:(BOOL)a3
{
  self->_streamPaused = a3;
}

- (AVAudioFormat)clientFormat
{
  return self->_clientFormat;
}

- (BOOL)isInput
{
  return self->_input;
}

- (BOOL)isStreamPaused
{
  return self->_streamPaused;
}

- (void).cxx_destruct
{
}

@end