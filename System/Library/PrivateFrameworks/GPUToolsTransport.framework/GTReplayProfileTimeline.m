@interface GTReplayProfileTimeline
+ (BOOL)supportsSecureCoding;
- (BOOL)shaderProfiling;
- (GTReplayProfileTimeline)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShaderProfiling:(BOOL)a3;
@end

@implementation GTReplayProfileTimeline

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayProfileTimeline)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayProfileTimeline;
  v5 = [(GTReplayProfileRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_shaderProfiling = [v4 decodeBoolForKey:@"shaderProfiling"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayProfileTimeline;
  id v4 = a3;
  [(GTReplayProfileRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_shaderProfiling, @"shaderProfiling", v5.receiver, v5.super_class);
}

- (BOOL)shaderProfiling
{
  return self->_shaderProfiling;
}

- (void)setShaderProfiling:(BOOL)a3
{
  self->_shaderProfiling = a3;
}

@end