@interface ARDepthBasedPersonDetectionResult
- (ARDepthBasedPersonDetectionResult)initWithBoundingBox:(CGRect)a3;
- (ARDepthBasedPersonDetectionResult)initWithCoder:(id)a3;
- (double)initialBoundingBoxAvg;
- (float)meanValue;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)numberOfSamples;
- (void)addSampleValue:(float)a3;
- (void)addSampleValueWithHighConfidence:(float)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInitialBoundingBoxAvg:(double)a3;
@end

@implementation ARDepthBasedPersonDetectionResult

- (ARDepthBasedPersonDetectionResult)initWithBoundingBox:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ARDepthBasedPersonDetectionResult;
  result = -[ARPersonDetectionResult initWithBoundingBox:](&v4, sel_initWithBoundingBox_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_sumDepthValues = 0.0;
    result->_numberDepthPixels = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARDepthBasedPersonDetectionResult;
  id result = [(ARPersonDetectionResult *)&v5 copyWithZone:a3];
  if (result)
  {
    *((_DWORD *)result + 10) = LODWORD(self->_sumDepthValues);
    *((void *)result + 6) = self->_numberDepthPixels;
    *((void *)result + 8) = self->_numberDepthPixelsWithHighConfidence;
    *((_DWORD *)result + 14) = LODWORD(self->_sumDepthValuesWithHighConfidence);
  }
  return result;
}

- (ARDepthBasedPersonDetectionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARDepthBasedPersonDetectionResult;
  objc_super v5 = [(ARPersonDetectionResult *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"sumDepthValues"];
    v5->_sumDepthValues = v6;
    v5->_numberDepthPixels = [v4 decodeIntegerForKey:@"numberDepthPixels"];
    v5->_numberDepthPixelsWithHighConfidence = [v4 decodeIntegerForKey:@"numberDepthPixelsWithHighConfidence"];
    v5->_sumDepthValuesWithHighConfidence = (float)[v4 decodeIntegerForKey:@"sumDepthValuesWithHighConfidence"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARDepthBasedPersonDetectionResult;
  id v4 = a3;
  [(ARPersonDetectionResult *)&v6 encodeWithCoder:v4];
  *(float *)&double v5 = self->_sumDepthValues;
  objc_msgSend(v4, "encodeFloat:forKey:", @"sumDepthValues", v5, v6.receiver, v6.super_class);
  [v4 encodeInteger:self->_numberDepthPixels forKey:@"numberDepthPixels"];
  [v4 encodeInteger:self->_numberDepthPixelsWithHighConfidence forKey:@"numberDepthPixelsWithHighConfidence"];
  [v4 encodeInteger:(uint64_t)self->_sumDepthValuesWithHighConfidence forKey:@"sumDepthValuesWithHighConfidence"];
}

- (unint64_t)numberOfSamples
{
  return self->_numberDepthPixels;
}

- (void)addSampleValue:(float)a3
{
  self->_sumDepthValues = self->_sumDepthValues + a3;
  ++self->_numberDepthPixels;
}

- (void)addSampleValueWithHighConfidence:(float)a3
{
  self->_sumDepthValuesWithHighConfidence = self->_sumDepthValuesWithHighConfidence + a3;
  ++self->_numberDepthPixelsWithHighConfidence;
}

- (float)meanValue
{
  int64_t numberDepthPixels = self->_numberDepthPixels;
  if (!numberDepthPixels) {
    return NAN;
  }
  float numberDepthPixelsWithHighConfidence = (float)self->_numberDepthPixelsWithHighConfidence;
  float v4 = (double)numberDepthPixels * 0.75;
  if (numberDepthPixelsWithHighConfidence <= v4) {
    return self->_sumDepthValues / (float)numberDepthPixels;
  }
  else {
    return self->_sumDepthValuesWithHighConfidence / numberDepthPixelsWithHighConfidence;
  }
}

- (double)initialBoundingBoxAvg
{
  return self->_initialBoundingBoxAvg;
}

- (void)setInitialBoundingBoxAvg:(double)a3
{
  self->_initialBoundingBoxAvg = a3;
}

@end