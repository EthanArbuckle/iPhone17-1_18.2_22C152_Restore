@interface MXAnimationMetric
+ (BOOL)supportsSecureCoding;
- (MXAnimationMetric)initWithCoder:(id)a3;
- (MXAnimationMetric)initWithGlitchTimeRatio:(id)a3;
- (NSMeasurement)scrollHitchTimeRatio;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXAnimationMetric

- (MXAnimationMetric)initWithGlitchTimeRatio:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXAnimationMetric;
  v6 = [(MXMetric *)&v10 init];
  if (v6)
  {
    [v5 doubleValue];
    if (v7 <= 0.0)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_scrollHitchTimeRatio, a3);
  }
  v8 = v6;
LABEL_6:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MXAnimationMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXAnimationMetric;
  id v5 = [(MXMetric *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scrollHitchTimeRatio"];
    scrollHitchTimeRatio = v5->_scrollHitchTimeRatio;
    v5->_scrollHitchTimeRatio = (NSMeasurement *)v6;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_scrollHitchTimeRatio)
  {
    id v4 = [(MXMetric *)self measurementFormatter];
    id v5 = [v4 stringFromMeasurement:self->_scrollHitchTimeRatio];
    [v3 setObject:v5 forKey:@"scrollHitchTimeRatio"];
  }

  return v3;
}

- (NSMeasurement)scrollHitchTimeRatio
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end