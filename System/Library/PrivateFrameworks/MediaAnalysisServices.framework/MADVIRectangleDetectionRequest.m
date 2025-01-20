@interface MADVIRectangleDetectionRequest
+ (BOOL)supportsSecureCoding;
- (MADVIRectangleDetectionRequest)init;
- (MADVIRectangleDetectionRequest)initWithCoder:(id)a3;
- (float)maximumAspectRatio;
- (float)minimumAspectRatio;
- (float)minimumConfidence;
- (float)minimumSize;
- (float)quadratureTolerance;
- (id)description;
- (unint64_t)maximumObservations;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumAspectRatio:(float)a3;
- (void)setMaximumObservations:(unint64_t)a3;
- (void)setMinimumAspectRatio:(float)a3;
- (void)setMinimumConfidence:(float)a3;
- (void)setMinimumSize:(float)a3;
- (void)setQuadratureTolerance:(float)a3;
@end

@implementation MADVIRectangleDetectionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIRectangleDetectionRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MADVIRectangleDetectionRequest;
  result = [(MADVIRectangleDetectionRequest *)&v3 init];
  if (result)
  {
    result->_minimumAspectRatio = 0.5;
    result->_maximumAspectRatio = 1.0;
    result->_quadratureTolerance = 30.0;
    result->_minimumSize = 0.2;
    result->_minimumConfidence = 0.0;
    result->_maximumObservations = 1;
  }
  return result;
}

- (MADVIRectangleDetectionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADVIRectangleDetectionRequest;
  v5 = [(MADRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"MinimumAspectRatio"];
    v5->_minimumAspectRatio = v6;
    [v4 decodeFloatForKey:@"MaximumAspectRatio"];
    v5->_maximumAspectRatio = v7;
    [v4 decodeFloatForKey:@"QuadratureTolerance"];
    v5->_quadratureTolerance = v8;
    [v4 decodeFloatForKey:@"MinimumSize"];
    v5->_minimumSize = v9;
    [v4 decodeFloatForKey:@"MinimumConfidence"];
    v5->_minimumConfidence = v10;
    v5->_maximumObservations = [v4 decodeIntegerForKey:@"MaximumObservations"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MADVIRectangleDetectionRequest;
  id v4 = a3;
  [(MADRequest *)&v10 encodeWithCoder:v4];
  *(float *)&double v5 = self->_minimumAspectRatio;
  objc_msgSend(v4, "encodeFloat:forKey:", @"MinimumAspectRatio", v5, v10.receiver, v10.super_class);
  *(float *)&double v6 = self->_maximumAspectRatio;
  [v4 encodeFloat:@"MaximumAspectRatio" forKey:v6];
  *(float *)&double v7 = self->_quadratureTolerance;
  [v4 encodeFloat:@"QuadratureTolerance" forKey:v7];
  *(float *)&double v8 = self->_minimumSize;
  [v4 encodeFloat:@"MinimumSize" forKey:v8];
  *(float *)&double v9 = self->_minimumConfidence;
  [v4 encodeFloat:@"MinimumConfidence" forKey:v9];
  [v4 encodeInteger:self->_maximumObservations forKey:@"MaximumObservations"];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"minimumAspectRatio: %0.2f, ", self->_minimumAspectRatio];
  [v3 appendFormat:@"maximumAspectRatio: %0.2f, ", self->_maximumAspectRatio];
  [v3 appendFormat:@"quadratureTolerance: %0.2f, ", self->_quadratureTolerance];
  [v3 appendFormat:@"minimumSize: %0.2f, ", self->_minimumSize];
  [v3 appendFormat:@"minimumConfidence: %0.2f, ", self->_minimumConfidence];
  [v3 appendFormat:@"maximumObservations: %lu, ", self->_maximumObservations];
  double v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  double v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (float)minimumAspectRatio
{
  return self->_minimumAspectRatio;
}

- (void)setMinimumAspectRatio:(float)a3
{
  self->_minimumAspectRatio = a3;
}

- (float)maximumAspectRatio
{
  return self->_maximumAspectRatio;
}

- (void)setMaximumAspectRatio:(float)a3
{
  self->_maximumAspectRatio = a3;
}

- (float)quadratureTolerance
{
  return self->_quadratureTolerance;
}

- (void)setQuadratureTolerance:(float)a3
{
  self->_quadratureTolerance = a3;
}

- (float)minimumSize
{
  return self->_minimumSize;
}

- (void)setMinimumSize:(float)a3
{
  self->_minimumSize = a3;
}

- (float)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(float)a3
{
  self->_minimumConfidence = a3;
}

- (unint64_t)maximumObservations
{
  return self->_maximumObservations;
}

- (void)setMaximumObservations:(unint64_t)a3
{
  self->_maximumObservations = a3;
}

@end