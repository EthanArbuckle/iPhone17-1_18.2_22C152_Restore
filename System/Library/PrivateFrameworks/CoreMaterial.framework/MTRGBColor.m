@interface MTRGBColor
- (CAColorMatrix)sourceOverColorMatrix;
- (CGColor)CGColor;
- (MTRGBColor)colorWithAdditionalAlphaComponent:(double)a3;
- (MTRGBColor)colorWithAlphaComponent:(double)a3;
- (MTRGBColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
- (id)_initWithCGColor:(CGColor *)a3;
- (id)_initWithDescription:(id)a3;
- (id)colorBlendedWithColor:(id)a3;
- (id)colorDescription;
- (id)description;
@end

@implementation MTRGBColor

- (MTRGBColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v18.receiver = self;
  v18.super_class = (Class)MTRGBColor;
  v11 = [(MTRGBColor *)&v18 init];
  if (v11)
  {
    if (a3 < 0.0 || a3 > 1.0)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v11, @"MTColor.m", 314, @"Invalid parameter not satisfying: %@", @"(0 <= red) && (red <= 1.0)" object file lineNumber description];
    }
    if (a4 < 0.0 || a4 > 1.0)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v11, @"MTColor.m", 315, @"Invalid parameter not satisfying: %@", @"(0 <= green) && (green <= 1.0)" object file lineNumber description];
    }
    if (a5 < 0.0 || a5 > 1.0)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v11, @"MTColor.m", 316, @"Invalid parameter not satisfying: %@", @"(0 <= blue) && (blue <= 1.0)" object file lineNumber description];
    }
    if (a6 < 0.0 || a6 > 1.0)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, v11, @"MTColor.m", 317, @"Invalid parameter not satisfying: %@", @"(0 <= alpha) && (alpha <= 1.0)" object file lineNumber description];
    }
    v11->_red = a3;
    v11->_green = a4;
    v11->_blue = a5;
    v11->_alpha = a6;
  }
  return v11;
}

- (id)_initWithCGColor:(CGColor *)a3
{
  if (!a3)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MTColor.m", 327, @"Invalid parameter not satisfying: %@", @"cgColor" object file lineNumber description];

    goto LABEL_6;
  }
  ColorSpace = CGColorGetColorSpace(a3);
  v6 = CGColorSpaceGetName(ColorSpace);
  if (![v6 isEqualToString:*MEMORY[0x1E4F1DBE8]]
    || (Components = CGColorGetComponents(a3), CGColorGetNumberOfComponents(a3) != 4))
  {

LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  double v8 = *Components;
  double v9 = Components[1];
  double v10 = Components[2];
  double v11 = Components[3];

  self = [(MTRGBColor *)self initWithRed:v8 green:v9 blue:v10 alpha:v11];
  v12 = self;
LABEL_7:
  v13 = v12;

  return v13;
}

- (id)_initWithDescription:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MTColor.m", 334, @"Invalid parameter not satisfying: %@", @"colorDescription" object file lineNumber description];
  }
  v6 = [v5 objectForKey:@"alpha"];
  if (!v6)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"MTColor.m", 336, @"Invalid parameter not satisfying: %@", @"wrappedAlpha != nil" object file lineNumber description];
  }
  v7 = [v5 objectForKey:@"red"];
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"MTColor.m", 338, @"Invalid parameter not satisfying: %@", @"wrappedRed != nil" object file lineNumber description];
  }
  double v8 = [v5 objectForKey:@"green"];
  if (!v8)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"MTColor.m", 340, @"Invalid parameter not satisfying: %@", @"wrappedGreen != nil" object file lineNumber description];
  }
  double v9 = [v5 objectForKey:@"blue"];
  if (!v9)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"MTColor.m", 342, @"Invalid parameter not satisfying: %@", @"wrappedBlue != nil" object file lineNumber description];
  }
  [v7 floatValue];
  double v11 = v10;
  [v8 floatValue];
  double v13 = v12;
  [v9 floatValue];
  double v15 = v14;
  [v6 floatValue];
  v17 = [(MTRGBColor *)self initWithRed:v11 green:v13 blue:v15 alpha:v16];

  return v17;
}

- (CGColor)CGColor
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  result = self->super._cachedColor;
  if (!result)
  {
    double green = self->_green;
    double blue = self->_blue;
    double alpha = self->_alpha;
    components[0] = self->_red;
    components[1] = green;
    components[2] = blue;
    components[3] = alpha;
    if (RGBColorSpace_onceToken != -1) {
      dispatch_once(&RGBColorSpace_onceToken, &__block_literal_global_135);
    }
    result = CGColorCreate((CGColorSpaceRef)RGBColorSpace___RGBColorSpace, components);
    self->super._cachedColor = result;
  }
  return result;
}

- (id)colorDescription
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"red";
  v3 = [NSNumber numberWithDouble:self->_red];
  v10[0] = v3;
  v9[1] = @"green";
  v4 = [NSNumber numberWithDouble:self->_green];
  v10[1] = v4;
  v9[2] = @"blue";
  id v5 = [NSNumber numberWithDouble:self->_blue];
  v10[2] = v5;
  v9[3] = @"alpha";
  v6 = [NSNumber numberWithDouble:self->_alpha];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (MTRGBColor)colorWithAlphaComponent:(double)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRed:self->_red green:self->_green blue:self->_blue alpha:a3];
  return (MTRGBColor *)v3;
}

- (MTRGBColor)colorWithAdditionalAlphaComponent:(double)a3
{
  return [(MTRGBColor *)self colorWithAlphaComponent:fmax(fmin(self->_alpha + a3, 1.0), 0.0)];
}

- (id)colorBlendedWithColor:(id)a3
{
  v4 = self;
  if (a3)
  {
    id v5 = [a3 _rgbColor];
    v6 = v5;
    double alpha = v4->_alpha;
    double v8 = v5[5];
    double v9 = 1.0;
    double v10 = 1.0 - alpha;
    double v11 = alpha + v8 * (1.0 - alpha);
    double v12 = 1.0;
    double v13 = 1.0;
    if (v11 != 0.0)
    {
      double v9 = (alpha * v4->_red + v8 * v5[2] * v10) / v11;
      double v12 = (alpha * v4->_green + v8 * v5[3] * v10) / v11;
      double v13 = (alpha * v4->_blue + v8 * v5[4] * v10) / v11;
    }
    uint64_t v14 = +[MTColor colorWithRed:green:blue:alpha:](MTColor, "colorWithRed:green:blue:alpha:", v9, v12, v13);

    v4 = (MTRGBColor *)v14;
  }
  return v4;
}

- (CAColorMatrix)sourceOverColorMatrix
{
  float red = self->_red;
  float green = self->_green;
  float blue = self->_blue;
  float alpha = self->_alpha;
  return (CAColorMatrix *)MEMORY[0x1F40F4A58](red, green, blue, alpha);
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; red: %f; green: %f; blue: %f; alpha: %f>",
               objc_opt_class(),
               self,
               *(void *)&self->_red,
               *(void *)&self->_green,
               *(void *)&self->_blue,
               *(void *)&self->_alpha);
}

- (double)red
{
  return self->_red;
}

- (double)green
{
  return self->_green;
}

- (double)blue
{
  return self->_blue;
}

- (double)alpha
{
  return self->_alpha;
}

@end