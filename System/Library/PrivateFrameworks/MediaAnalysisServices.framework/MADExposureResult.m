@interface MADExposureResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithExposureScore:(double)a3;
- (MADExposureResult)initWithCoder:(id)a3;
- (MADExposureResult)initWithExposureScore:(double)a3;
- (double)exposureScore;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADExposureResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADExposureResult)initWithExposureScore:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADExposureResult;
  result = [(MADResult *)&v5 init];
  if (result) {
    result->_exposureScore = a3;
  }
  return result;
}

+ (id)resultWithExposureScore:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithExposureScore:a3];
  return v3;
}

- (MADExposureResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADExposureResult;
  objc_super v5 = [(MADResult *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"ExposureScore"];
    v5->_exposureScore = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADExposureResult;
  [(MADResult *)&v5 encodeWithCoder:v4];
  [v4 encodeDouble:@"ExposureScore" forKey:self->_exposureScore];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"%@: %.3f>", @"ExposureScore", *(void *)&self->_exposureScore];
  return v3;
}

- (double)exposureScore
{
  return self->_exposureScore;
}

@end