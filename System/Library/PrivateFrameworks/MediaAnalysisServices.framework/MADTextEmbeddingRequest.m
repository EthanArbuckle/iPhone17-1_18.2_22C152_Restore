@interface MADTextEmbeddingRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)calibrate;
- (BOOL)computeSafety;
- (BOOL)computeThreshold;
- (BOOL)extendedContextLength;
- (MADTextEmbeddingRequest)init;
- (MADTextEmbeddingRequest)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setCalibrate:(BOOL)a3;
- (void)setComputeSafety:(BOOL)a3;
- (void)setComputeThreshold:(BOOL)a3;
- (void)setExtendedContextLength:(BOOL)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation MADTextEmbeddingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextEmbeddingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MADTextEmbeddingRequest;
  v2 = [(MADTextEmbeddingRequest *)&v6 init];
  if (v2)
  {
    int v3 = _os_feature_enabled_impl();
    uint64_t v4 = 4;
    if (v3) {
      uint64_t v4 = 5;
    }
    v2->_version = v4;
  }
  return v2;
}

- (MADTextEmbeddingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADTextEmbeddingRequest;
  v5 = [(MADTextRequest *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_version = [v4 decodeIntegerForKey:@"Version"];
    v5->_calibrate = [v4 decodeBoolForKey:@"Calibrate"];
    v5->_computeThreshold = [v4 decodeBoolForKey:@"ComputeThreshold"];
    v5->_extendedContextLength = [v4 decodeBoolForKey:@"ExtendedContextLength"];
    v5->_computeSafety = [v4 decodeBoolForKey:@"ComputeSafety"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADTextEmbeddingRequest;
  id v4 = a3;
  [(MADTextRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_version, @"Version", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_calibrate forKey:@"Calibrate"];
  [v4 encodeBool:self->_computeThreshold forKey:@"ComputeThreshold"];
  [v4 encodeBool:self->_extendedContextLength forKey:@"ExtendedContextLength"];
  [v4 encodeBool:self->_computeSafety forKey:@"ComputeSafety"];
}

- (id)description
{
  int v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"version: %d, ", self->_version];
  if (self->_calibrate) {
    [v3 appendFormat:@"calibrate: %d, ", 1];
  }
  if (self->_computeThreshold) {
    [v3 appendFormat:@"computeThreshold: %d, ", 1];
  }
  if (self->_extendedContextLength) {
    [v3 appendFormat:@"extendedContextLength: %d, ", 1];
  }
  if (self->_computeSafety) {
    [v3 appendFormat:@"computeSafety: %d, ", 1];
  }
  objc_super v6 = [(MADTextRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  objc_super v7 = [(MADTextRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (BOOL)calibrate
{
  return self->_calibrate;
}

- (void)setCalibrate:(BOOL)a3
{
  self->_calibrate = a3;
}

- (BOOL)computeThreshold
{
  return self->_computeThreshold;
}

- (void)setComputeThreshold:(BOOL)a3
{
  self->_computeThreshold = a3;
}

- (BOOL)extendedContextLength
{
  return self->_extendedContextLength;
}

- (void)setExtendedContextLength:(BOOL)a3
{
  self->_extendedContextLength = a3;
}

- (BOOL)computeSafety
{
  return self->_computeSafety;
}

- (void)setComputeSafety:(BOOL)a3
{
  self->_computeSafety = a3;
}

@end