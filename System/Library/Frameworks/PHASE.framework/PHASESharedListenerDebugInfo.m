@interface PHASESharedListenerDebugInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PHASESharedListenerDebugInfo)initWithCoder:(id)a3;
- (float)gain;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setGain:(float)a3;
@end

@implementation PHASESharedListenerDebugInfo

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHASESharedListenerDebugInfo;
  if ([(PHASESharedEntityDebugInfo *)&v10 isEqual:v4])
  {
    [(PHASESharedListenerDebugInfo *)self gain];
    float v6 = v5;
    [v4 gain];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PHASESharedListenerDebugInfo;
  [(PHASESharedEntityDebugInfo *)&v6 encodeWithCoder:v4];
  *(float *)&double v5 = self->_gain;
  [v4 encodeFloat:@"gain" forKey:v5];
}

- (PHASESharedListenerDebugInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHASESharedListenerDebugInfo;
  double v5 = [(PHASESharedEntityDebugInfo *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"gain"];
    v5->_gain = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  [(PHASESharedEntityDebugInfo *)self transform];
  double v5 = v4;
  [(PHASESharedEntityDebugInfo *)self transform];
  double v7 = v6;
  [(PHASESharedEntityDebugInfo *)self transform];
  return (id)[v3 stringWithFormat:@"<PHASESharedListenerDebugInfo:%p position=[%0.1f, %0.1f, %0.1f], referenceCount=%d, gain=%0.1f>", self, *(void *)&v5, *(void *)&v7, v8, -[PHASESharedEntityDebugInfo referenceCount](self, "referenceCount"), self->_gain];
}

- (void)setGain:(float)a3
{
  self->_gain = a3;
}

- (float)gain
{
  return self->_gain;
}

@end