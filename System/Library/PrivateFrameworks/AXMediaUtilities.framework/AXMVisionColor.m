@interface AXMVisionColor
+ (BOOL)supportsSecureCoding;
+ (id)colorWithHue:(unsigned __int8)a3 saturation:(unsigned __int8)a4 brightness:(unsigned __int8)a5;
+ (id)colorWithHueDegrees:(double)a3 saturation:(double)a4 brightness:(double)a5;
+ (id)colorWithRed:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5;
- (AXMVisionColor)init;
- (AXMVisionColor)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAXMVisionColor:(id)a3;
- (double)blueFloat;
- (double)brightnessFloat;
- (double)euclidianDistanceHS:(id)a3;
- (double)euclidianDistanceHSV:(id)a3;
- (double)greenFloat;
- (double)hueFloat;
- (double)hueRadians;
- (double)redFloat;
- (double)saturationFloat;
- (id)description;
- (unint64_t)hash;
- (void)_getHue:(char *)a3 saturation:(char *)a4 brightness:(char *)a5;
- (void)_getRed:(char *)a3 green:(char *)a4 blue:(char *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AXMVisionColor

+ (id)colorWithRed:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5
{
  v8 = objc_alloc_init((Class)a1);
  v8[8] = a3;
  v8[9] = a4;
  v8[10] = a5;
  [v8 _getHue:v8 + 11 saturation:v8 + 12 brightness:v8 + 13];

  return v8;
}

+ (id)colorWithHue:(unsigned __int8)a3 saturation:(unsigned __int8)a4 brightness:(unsigned __int8)a5
{
  v8 = objc_alloc_init((Class)a1);
  v8[11] = a3;
  v8[12] = a4;
  v8[13] = a5;
  [v8 _getRed:v8 + 8 green:v8 + 9 blue:v8 + 10];

  return v8;
}

+ (id)colorWithHueDegrees:(double)a3 saturation:(double)a4 brightness:(double)a5
{
  double v5 = fmax(a3, 0.0);
  double v6 = fmax(a4, 0.0);
  double v7 = fmax(a5, 0.0);
  if (v5 >= 360.0) {
    double v8 = 255.0;
  }
  else {
    double v8 = v5 * 255.0 / 360.0;
  }
  uint64_t v9 = (int)v8;
  if (v6 >= 1.0) {
    double v10 = 255.0;
  }
  else {
    double v10 = v6 * 255.0;
  }
  if (v7 >= 1.0) {
    double v11 = 255.0;
  }
  else {
    double v11 = v7 * 255.0;
  }
  return (id)[a1 colorWithHue:v9 saturation:(int)v10 brightness:(int)v11];
}

- (AXMVisionColor)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXMVisionColor;
  result = [(AXMVisionColor *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_saturation = 0;
    *(_DWORD *)&result->_red = 0;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"%@<%p> [r:%u g:%u b:%u] [h:%u s:%u b:%u]", v5, self, self->_red, self->_green, self->_blue, self->_hue, self->_saturation, self->_brightness];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AXMVisionColor *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AXMVisionColor *)self isEqualToAXMVisionColor:v4];
  }

  return v5;
}

- (BOOL)isEqualToAXMVisionColor:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  BOOL v5 = v4 && self->_red == v4[8] && self->_green == v4[9] && self->_blue == v4[10];

  return v5;
}

- (unint64_t)hash
{
  return *(unsigned __int16 *)&self->_red | ((unint64_t)self->_blue << 16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionColor)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXMVisionColor *)self init];
  if (v5)
  {
    double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"red"];
    double v7 = v6;
    if (v6) {
      v5->_red = [v6 unsignedCharValue];
    }
    double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"green"];

    if (v8) {
      v5->_green = [v8 unsignedCharValue];
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blue"];

    if (v9) {
      v5->_blue = [v9 unsignedCharValue];
    }
    double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hue"];

    if (v10) {
      v5->_hue = [v10 unsignedCharValue];
    }
    double v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"saturation"];

    if (v11) {
      v5->_saturation = [v11 unsignedCharValue];
    }
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brightness"];

    if (v12) {
      v5->_brightness = [v12 unsignedCharValue];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  uint64_t red = self->_red;
  id v6 = a3;
  double v7 = [v4 numberWithUnsignedChar:red];
  [v6 encodeObject:v7 forKey:@"red"];

  double v8 = [NSNumber numberWithUnsignedChar:self->_green];
  [v6 encodeObject:v8 forKey:@"green"];

  uint64_t v9 = [NSNumber numberWithUnsignedChar:self->_blue];
  [v6 encodeObject:v9 forKey:@"blue"];

  double v10 = [NSNumber numberWithUnsignedChar:self->_hue];
  [v6 encodeObject:v10 forKey:@"hue"];

  double v11 = [NSNumber numberWithUnsignedChar:self->_saturation];
  [v6 encodeObject:v11 forKey:@"saturation"];

  id v12 = [NSNumber numberWithUnsignedChar:self->_brightness];
  [v6 encodeObject:v12 forKey:@"brightness"];
}

- (void)_getHue:(char *)a3 saturation:(char *)a4 brightness:(char *)a5
{
  double v12 = 0.0;
  double v13 = 0.0;
  double v11 = 0.0;
  LOBYTE(v5) = self->_red;
  LOBYTE(v6) = self->_green;
  LOBYTE(v7) = self->_blue;
  _AXMRGBToHSB(&v13, &v12, &v11, (double)v5 / 255.0, (double)v6 / 255.0, (double)v7 / 255.0);
  *a3 = (int)(v13 * 255.0);
  *a4 = (int)(v12 * 255.0);
  *a5 = (int)(v11 * 255.0);
}

- (void)_getRed:(char *)a3 green:(char *)a4 blue:(char *)a5
{
  double v12 = 0.0;
  double v13 = 0.0;
  double v11 = 0.0;
  LOBYTE(v5) = self->_hue;
  LOBYTE(v6) = self->_saturation;
  LOBYTE(v7) = self->_brightness;
  _AXMHSBToRGB(&v13, &v12, &v11, (double)v5 / 255.0, (double)v6 / 255.0, (double)v7 / 255.0);
  *a3 = (int)(v13 * 255.0);
  *a4 = (int)(v12 * 255.0);
  *a5 = (int)(v11 * 255.0);
}

- (double)euclidianDistanceHSV:(id)a3
{
  id v4 = a3;
  [(AXMVisionColor *)self saturationFloat];
  double v6 = v5;
  [(AXMVisionColor *)self hueRadians];
  long double v8 = v6 * cos(v7);
  [(AXMVisionColor *)self saturationFloat];
  double v10 = v9;
  [(AXMVisionColor *)self hueRadians];
  long double v12 = v10 * sin(v11);
  [v4 saturationFloat];
  double v14 = v13;
  [v4 hueRadians];
  long double v16 = v14 * cos(v15);
  [v4 saturationFloat];
  double v18 = v17;
  [v4 hueRadians];
  long double v20 = v8 - v16;
  long double v21 = v12 - v18 * sin(v19);
  [(AXMVisionColor *)self brightnessFloat];
  double v23 = v22;
  [v4 brightnessFloat];
  double v25 = v24;

  return sqrt(v21 * v21 + v20 * v20 + (v23 - v25) * (v23 - v25));
}

- (double)euclidianDistanceHS:(id)a3
{
  id v4 = a3;
  [(AXMVisionColor *)self saturationFloat];
  double v6 = v5;
  [(AXMVisionColor *)self hueRadians];
  long double v8 = v6 * cos(v7);
  [(AXMVisionColor *)self saturationFloat];
  double v10 = v9;
  [(AXMVisionColor *)self hueRadians];
  long double v12 = v10 * sin(v11);
  [v4 saturationFloat];
  double v14 = v13;
  [v4 hueRadians];
  long double v16 = v14 * cos(v15);
  [v4 saturationFloat];
  double v18 = v17;
  [v4 hueRadians];
  long double v20 = v19;

  long double v21 = sin(v20);
  return sqrt((v12 - v18 * v21) * (v12 - v18 * v21) + (v8 - v16) * (v8 - v16));
}

- (double)redFloat
{
  LOBYTE(v2) = self->_red;
  return (double)v2 / 255.0;
}

- (double)greenFloat
{
  LOBYTE(v2) = self->_green;
  return (double)v2 / 255.0;
}

- (double)blueFloat
{
  LOBYTE(v2) = self->_blue;
  return (double)v2 / 255.0;
}

- (double)hueFloat
{
  LOBYTE(v2) = self->_hue;
  return (double)v2 / 255.0;
}

- (double)hueRadians
{
  [(AXMVisionColor *)self hueFloat];
  return (v2 + v2) * 3.14159265;
}

- (double)saturationFloat
{
  LOBYTE(v2) = self->_saturation;
  return (double)v2 / 255.0;
}

- (double)brightnessFloat
{
  LOBYTE(v2) = self->_brightness;
  return (double)v2 / 255.0;
}

@end