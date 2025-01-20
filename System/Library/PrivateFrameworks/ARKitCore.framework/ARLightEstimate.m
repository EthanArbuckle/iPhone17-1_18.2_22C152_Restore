@interface ARLightEstimate
+ (BOOL)supportsSecureCoding;
- (ARLightEstimate)initWithAmbientIntensity:(double)a3 temperature:(double)a4;
- (ARLightEstimate)initWithCoder:(id)a3;
- (CGFloat)ambientColorTemperature;
- (CGFloat)ambientIntensity;
- (NSData)sphericalHarmonicsCoefficients;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARLightEstimate

- (ARLightEstimate)initWithAmbientIntensity:(double)a3 temperature:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ARLightEstimate;
  result = [(ARLightEstimate *)&v7 init];
  if (result)
  {
    result->_ambientIntensity = a3;
    result->_ambientColorTemperature = a4;
  }
  return result;
}

- (NSData)sphericalHarmonicsCoefficients
{
  v2.i64[0] = *(void *)&self->_ambientIntensity;
  double ambientColorTemperature = self->_ambientColorTemperature;
  float v5 = *(double *)v2.i64 / 1000.0;
  v2.f32[0] = ambientColorTemperature;
  return (NSData *)ARSphericalHarmonicsDataWithAmbientLight(v5, v2, ambientColorTemperature, v3);
}

- (id)description
{
  float32x4_t v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  float v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [(ARLightEstimate *)self ambientIntensity];
  [v6 appendFormat:@" ambientIntensity=%.2f", v7];
  [(ARLightEstimate *)self ambientColorTemperature];
  [v6 appendFormat:@" ambientColorTemperature=%.2f", v8];
  [v6 appendString:@">"];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARLightEstimate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARLightEstimate;
  float v5 = [(ARLightEstimate *)&v9 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"ambientIntensity"];
    v5->_ambientIntensity = v6;
    [v4 decodeDoubleForKey:@"ambientColorTemperature"];
    v5->_double ambientColorTemperature = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double ambientIntensity = self->_ambientIntensity;
  id v5 = a3;
  [v5 encodeDouble:@"ambientIntensity" forKey:ambientIntensity];
  [v5 encodeDouble:@"ambientColorTemperature" forKey:self->_ambientColorTemperature];
}

- (CGFloat)ambientIntensity
{
  return self->_ambientIntensity;
}

- (CGFloat)ambientColorTemperature
{
  return self->_ambientColorTemperature;
}

@end