@interface HFTemperatureColorProfile
- (HFTemperatureColorProfile)initWithMinimumTemperature:(float)a3 maximumTemperature:(float)a4;
- (float)adjustedTemperatureForTemperature:(float)a3;
- (float)maximumTemperature;
- (float)minimumTemperature;
- (id)adjustedColorPrimitiveForPrimitive:(id)a3;
@end

@implementation HFTemperatureColorProfile

- (HFTemperatureColorProfile)initWithMinimumTemperature:(float)a3 maximumTemperature:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HFTemperatureColorProfile;
  result = [(HFTemperatureColorProfile *)&v7 init];
  if (result)
  {
    result->_minimumTemperature = a3;
    result->_maximumTemperature = a4;
  }
  return result;
}

- (id)adjustedColorPrimitiveForPrimitive:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [v7 temperatureInMired];
    float v9 = v8;
    -[HFTemperatureColorProfile adjustedTemperatureForTemperature:](self, "adjustedTemperatureForTemperature:");
    float v11 = v10;
    if (vabds_f32(v10, v9) > 0.00000011921)
    {
      v12 = [HFTemperatureColor alloc];
      *(float *)&double v13 = v11;
      uint64_t v14 = [(HFTemperatureColor *)v12 initWithTemperatureInMired:v13];

      id v5 = (id)v14;
    }
  }

  return v5;
}

- (float)adjustedTemperatureForTemperature:(float)a3
{
  return fminf(fmaxf(self->_minimumTemperature, a3), self->_maximumTemperature);
}

- (float)minimumTemperature
{
  return self->_minimumTemperature;
}

- (float)maximumTemperature
{
  return self->_maximumTemperature;
}

@end