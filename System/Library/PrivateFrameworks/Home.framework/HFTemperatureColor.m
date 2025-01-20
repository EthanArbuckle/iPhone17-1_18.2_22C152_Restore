@interface HFTemperatureColor
- (BOOL)isEqual:(id)a3;
- (HFTemperatureColor)init;
- (HFTemperatureColor)initWithTemperatureInKelvin:(float)a3;
- (HFTemperatureColor)initWithTemperatureInMired:(float)a3;
- (NSString)description;
- (float)temperatureInKelvin;
- (float)temperatureInMired;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hf_RGBColorRepresentation;
- (id)valueDescription;
- (id)valueDescriptionInKelvin;
- (unint64_t)hash;
@end

@implementation HFTemperatureColor

- (HFTemperatureColor)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithTemperatureInMired_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFColorPrimitive.m", 110, @"%s is unavailable; use %@ instead",
    "-[HFTemperatureColor init]",
    v5);

  return 0;
}

- (HFTemperatureColor)initWithTemperatureInKelvin:(float)a3
{
  *(float *)&double v3 = 1000000.0 / a3;
  return [(HFTemperatureColor *)self initWithTemperatureInMired:v3];
}

- (HFTemperatureColor)initWithTemperatureInMired:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFTemperatureColor;
  result = [(HFTemperatureColor *)&v5 init];
  if (result) {
    result->_temperatureInMired = a3;
  }
  return result;
}

- (float)temperatureInKelvin
{
  return 1000000.0 / self->_temperatureInMired;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(HFTemperatureColor *)self temperatureInMired];
  return (id)objc_msgSend(v4, "initWithTemperatureInMired:");
}

- (id)hf_RGBColorRepresentation
{
  double v11 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  [(HFTemperatureColor *)self temperatureInKelvin];
  HFGetColorForLightTemperature((uint64_t)&v11, (uint64_t)&v10, (uint64_t)&v9, v2);
  double v3 = [HFRGBColor alloc];
  HIDWORD(v4) = HIDWORD(v11);
  *(float *)&double v4 = v11;
  HIDWORD(v6) = HIDWORD(v9);
  HIDWORD(v5) = HIDWORD(v10);
  *(float *)&double v5 = v10;
  *(float *)&double v6 = v9;
  v7 = [(HFRGBColor *)v3 initWithRed:v4 green:v5 blue:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (HFTemperatureColor *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(HFTemperatureColor *)self temperatureInMired];
      float v6 = v5;
      [(HFTemperatureColor *)v4 temperatureInMired];
      BOOL v8 = vabds_f32(v6, v7) < 0.001;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  float v2 = NSNumber;
  [(HFTemperatureColor *)self temperatureInMired];
  double v3 = objc_msgSend(v2, "numberWithFloat:");
  unint64_t v4 = [v3 hash];

  return v4;
}

- (id)valueDescription
{
  float v2 = NSString;
  [(HFTemperatureColor *)self temperatureInMired];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"%fm", v3);
}

- (id)valueDescriptionInKelvin
{
  float v2 = NSString;
  [(HFTemperatureColor *)self temperatureInKelvin];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"%.0fK", v3);
}

- (NSString)description
{
  float v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HFTemperatureColor;
  unint64_t v4 = [(HFTemperatureColor *)&v8 description];
  float v5 = [(HFTemperatureColor *)self valueDescription];
  float v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (float)temperatureInMired
{
  return self->_temperatureInMired;
}

@end