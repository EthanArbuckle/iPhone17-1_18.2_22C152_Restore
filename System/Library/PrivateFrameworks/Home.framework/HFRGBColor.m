@interface HFRGBColor
- (BOOL)isEqual:(id)a3;
- (HFRGBColor)init;
- (HFRGBColor)initWithHue:(float)a3 saturation:(float)a4 brightness:(float)a5;
- (HFRGBColor)initWithRed:(float)a3 green:(float)a4 blue:(float)a5;
- (HFRGBColor)initWithUIColor:(id)a3;
- (NSString)description;
- (UIColor)UIColor;
- (float)blue;
- (float)green;
- (float)red;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueDescription;
- (unint64_t)hash;
- (void)getHue:(float *)a3 saturation:(float *)a4 brightness:(float *)a5;
@end

@implementation HFRGBColor

- (unint64_t)hash
{
  [(HFRGBColor *)self red];
  signed int v4 = vcvts_n_s32_f32(v3, 0x10uLL);
  [(HFRGBColor *)self green];
  uint64_t v6 = 13 * ((int)vcvts_n_s32_f32(v5, 0x10uLL) + 13 * v4);
  [(HFRGBColor *)self blue];
  return v6 + (int)vcvts_n_s32_f32(v7, 0x10uLL);
}

- (float)red
{
  return self->_red;
}

- (float)green
{
  return self->_green;
}

- (float)blue
{
  return self->_blue;
}

- (HFRGBColor)initWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HFRGBColor;
  result = [(HFRGBColor *)&v9 init];
  if (result)
  {
    result->_red = a3;
    result->_green = a4;
    result->_blue = a5;
  }
  return result;
}

- (HFRGBColor)initWithHue:(float)a3 saturation:(float)a4 brightness:(float)a5
{
  double v11 = 0.0;
  double v12 = 0.0;
  double v10 = 0.0;
  HFConvertHSBToRGB(&v12, &v11, &v10, a3, a4, a5);
  HIDWORD(v7) = HIDWORD(v11);
  HIDWORD(v6) = HIDWORD(v12);
  *(float *)&double v6 = v12;
  *(float *)&double v7 = v11;
  HIDWORD(v8) = HIDWORD(v10);
  *(float *)&double v8 = v10;
  return [(HFRGBColor *)self initWithRed:v6 green:v7 blue:v8];
}

- (HFRGBColor)init
{
  signed int v4 = [MEMORY[0x263F08690] currentHandler];
  float v5 = NSStringFromSelector(sel_initWithRed_green_blue_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFColorPrimitive.m", 21, @"%s is unavailable; use %@ instead",
    "-[HFRGBColor init]",
    v5);

  return 0;
}

- (HFRGBColor)initWithUIColor:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HFColorPrimitive.m", 43, @"Invalid parameter not satisfying: %@", @"color" object file lineNumber description];
  }
  double v13 = 0.0;
  double v14 = 0.0;
  double v12 = 0.0;
  [v5 getRed:&v14 green:&v13 blue:&v12 alpha:0];
  HIDWORD(v7) = HIDWORD(v13);
  HIDWORD(v6) = HIDWORD(v14);
  *(float *)&double v6 = v14;
  *(float *)&double v7 = v13;
  HIDWORD(v8) = HIDWORD(v12);
  *(float *)&double v8 = v12;
  objc_super v9 = [(HFRGBColor *)self initWithRed:v6 green:v7 blue:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(HFRGBColor *)self red];
  int v6 = v5;
  [(HFRGBColor *)self green];
  int v8 = v7;
  [(HFRGBColor *)self blue];
  LODWORD(v9) = LODWORD(v10);
  LODWORD(v10) = v6;
  LODWORD(v11) = v8;
  return (id)[v4 initWithRed:v10 green:v11 blue:v9];
}

- (UIColor)UIColor
{
  float v3 = (void *)MEMORY[0x263F1C550];
  [(HFRGBColor *)self red];
  double v5 = v4;
  [(HFRGBColor *)self green];
  double v7 = v6;
  [(HFRGBColor *)self blue];
  return (UIColor *)[v3 colorWithRed:v5 green:v7 blue:v8 alpha:1.0];
}

- (void)getHue:(float *)a3 saturation:(float *)a4 brightness:(float *)a5
{
  double v18 = 0.0;
  double v19 = 0.0;
  double v17 = 0.0;
  [(HFRGBColor *)self red];
  double v10 = v9;
  [(HFRGBColor *)self green];
  double v12 = v11;
  [(HFRGBColor *)self blue];
  HFConvertRGBToHSB(&v19, &v18, &v17, v10, v12, v13);
  if (a3)
  {
    float v14 = v19;
    *a3 = v14;
  }
  if (a4)
  {
    float v15 = v18;
    *a4 = v15;
  }
  if (a5)
  {
    float v16 = v17;
    *a5 = v16;
  }
}

- (BOOL)isEqual:(id)a3
{
  float v4 = (HFRGBColor *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      [(HFRGBColor *)self red];
      float v7 = v6;
      [(HFRGBColor *)v5 red];
      if (vabds_f32(v7, v8) >= 0.001
        || ([(HFRGBColor *)self green], float v10 = v9, [(HFRGBColor *)v5 green], vabds_f32(v10, v11) >= 0.001))
      {
        BOOL v15 = 0;
      }
      else
      {
        [(HFRGBColor *)self blue];
        float v13 = v12;
        [(HFRGBColor *)v5 blue];
        BOOL v15 = vabds_f32(v13, v14) < 0.001;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (id)valueDescription
{
  float v3 = NSString;
  [(HFRGBColor *)self red];
  double v5 = v4;
  [(HFRGBColor *)self green];
  double v7 = v6;
  [(HFRGBColor *)self blue];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"RGB(%f,%f,%f)", *(void *)&v5, *(void *)&v7, v8);
}

- (NSString)description
{
  float v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HFRGBColor;
  float v4 = [(HFRGBColor *)&v8 description];
  double v5 = [(HFRGBColor *)self valueDescription];
  float v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

@end