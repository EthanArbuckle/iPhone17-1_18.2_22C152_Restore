@interface MADVideoSafetyFrameSampling
+ (BOOL)supportsSecureCoding;
- (BOOL)uniformSampling;
- (MADVideoSafetyFrameSampling)initWithCoder:(id)a3;
- (MADVideoSafetyFrameSampling)initWithFrameLimit:(unint64_t)a3 uniformSampling:(BOOL)a4;
- (MADVideoSafetyFrameSampling)initWithFramesPerSync:(unint64_t)a3 frameLimit:(unint64_t)a4 uniformSampling:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)frameLimit;
- (unint64_t)framesPerSync;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVideoSafetyFrameSampling

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoSafetyFrameSampling)initWithFramesPerSync:(unint64_t)a3 frameLimit:(unint64_t)a4 uniformSampling:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MADVideoSafetyFrameSampling;
  result = [(MADVideoSafetyFrameSampling *)&v9 init];
  if (result)
  {
    result->_framesPerSync = a3;
    result->_frameLimit = a4;
    result->_uniformSampling = a5;
  }
  return result;
}

- (MADVideoSafetyFrameSampling)initWithFrameLimit:(unint64_t)a3 uniformSampling:(BOOL)a4
{
  return [(MADVideoSafetyFrameSampling *)self initWithFramesPerSync:0 frameLimit:a3 uniformSampling:a4];
}

- (MADVideoSafetyFrameSampling)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADVideoSafetyFrameSampling;
  v5 = [(MADVideoSafetyFrameSampling *)&v7 init];
  if (v5)
  {
    v5->_framesPerSync = [v4 decodeIntegerForKey:@"FramesPerSync"];
    v5->_frameLimit = [v4 decodeIntegerForKey:@"FrameLimit"];
    v5->_uniformSampling = [v4 decodeBoolForKey:@"UniformSampling"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t framesPerSync = self->_framesPerSync;
  id v5 = a3;
  [v5 encodeInteger:framesPerSync forKey:@"FramesPerSync"];
  [v5 encodeInteger:self->_frameLimit forKey:@"FrameLimit"];
  [v5 encodeBool:self->_uniformSampling forKey:@"UniformSampling"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p", v5, self];

  [v3 appendFormat:@", framesPerSync: %lu", self->_framesPerSync];
  [v3 appendFormat:@", frameLimit: %lu", self->_frameLimit];
  if (self->_uniformSampling) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@", uniformSampling: %@", v6];
  [v3 appendString:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t framesPerSync = self->_framesPerSync;
  unint64_t frameLimit = self->_frameLimit;
  BOOL uniformSampling = self->_uniformSampling;
  return (id)[v4 initWithFramesPerSync:framesPerSync frameLimit:frameLimit uniformSampling:uniformSampling];
}

- (unint64_t)framesPerSync
{
  return self->_framesPerSync;
}

- (unint64_t)frameLimit
{
  return self->_frameLimit;
}

- (BOOL)uniformSampling
{
  return self->_uniformSampling;
}

@end