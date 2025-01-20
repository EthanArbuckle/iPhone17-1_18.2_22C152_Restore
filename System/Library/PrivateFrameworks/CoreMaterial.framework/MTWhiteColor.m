@interface MTWhiteColor
- (CAColorMatrix)sourceOverColorMatrix;
- (CGColor)CGColor;
- (MTWhiteColor)colorWithAdditionalAlphaComponent:(double)a3;
- (MTWhiteColor)colorWithAlphaComponent:(double)a3;
- (MTWhiteColor)initWithWhite:(double)a3 alpha:(double)a4;
- (double)alpha;
- (double)white;
- (id)_initWithCGColor:(CGColor *)a3;
- (id)_initWithDescription:(id)a3;
- (id)_rgbColor;
- (id)colorBlendedWithColor:(id)a3;
- (id)colorDescription;
- (id)description;
@end

@implementation MTWhiteColor

- (id)_initWithDescription:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MTColor.m", 421, @"Invalid parameter not satisfying: %@", @"colorDescription" object file lineNumber description];
  }
  v6 = [v5 objectForKey:@"alpha"];
  if (!v6)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MTColor.m", 423, @"Invalid parameter not satisfying: %@", @"wrappedAlpha != nil" object file lineNumber description];
  }
  v7 = [v5 objectForKey:@"white"];
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MTColor.m", 425, @"Invalid parameter not satisfying: %@", @"wrappedWhite != nil" object file lineNumber description];
  }
  [v7 floatValue];
  double v9 = v8;
  [v6 floatValue];
  v11 = [(MTWhiteColor *)self initWithWhite:v9 alpha:v10];

  return v11;
}

- (MTWhiteColor)initWithWhite:(double)a3 alpha:(double)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MTWhiteColor;
  v7 = [(MTWhiteColor *)&v12 init];
  if (v7)
  {
    if (a3 < 0.0 || a3 > 1.0)
    {
      float v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, v7, @"MTColor.m", 405, @"Invalid parameter not satisfying: %@", @"(0 <= white) && (white <= 1.0)" object file lineNumber description];
    }
    if (a4 < 0.0 || a4 > 1.0)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v7, @"MTColor.m", 406, @"Invalid parameter not satisfying: %@", @"(0 <= alpha) && (alpha <= 1.0)" object file lineNumber description];
    }
    v7->_white = a3;
    v7->_alpha = a4;
  }
  return v7;
}

- (CGColor)CGColor
{
  components[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  result = self->super._cachedColor;
  if (!result)
  {
    double alpha = self->_alpha;
    components[0] = self->_white;
    components[1] = alpha;
    if (GrayColorSpace_onceToken != -1) {
      dispatch_once(&GrayColorSpace_onceToken, &__block_literal_global_137);
    }
    result = CGColorCreate((CGColorSpaceRef)GrayColorSpace___GrayColorSpace, components);
    self->super._cachedColor = result;
  }
  return result;
}

- (CAColorMatrix)sourceOverColorMatrix
{
  return (CAColorMatrix *)MEMORY[0x1F40F4A58]();
}

- (id)_initWithCGColor:(CGColor *)a3
{
  if (!a3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MTColor.m", 414, @"Invalid parameter not satisfying: %@", @"cgColor" object file lineNumber description];

    goto LABEL_6;
  }
  ColorSpace = CGColorGetColorSpace(a3);
  v6 = CGColorSpaceGetName(ColorSpace);
  if (![v6 isEqualToString:*MEMORY[0x1E4F1DBB8]]
    || (Components = CGColorGetComponents(a3), CGColorGetNumberOfComponents(a3) != 2))
  {

LABEL_6:
    float v10 = 0;
    goto LABEL_7;
  }
  double v8 = *Components;
  double v9 = Components[1];

  self = [(MTWhiteColor *)self initWithWhite:v8 alpha:v9];
  float v10 = self;
LABEL_7:
  v11 = v10;

  return v11;
}

- (MTWhiteColor)colorWithAlphaComponent:(double)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWhite:self->_white alpha:a3];
  return (MTWhiteColor *)v3;
}

- (id)colorDescription
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"white";
  v3 = [NSNumber numberWithDouble:self->_white];
  v7[1] = @"alpha";
  v8[0] = v3;
  v4 = [NSNumber numberWithDouble:self->_alpha];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (MTWhiteColor)colorWithAdditionalAlphaComponent:(double)a3
{
  return [(MTWhiteColor *)self colorWithAlphaComponent:fmax(fmin(self->_alpha + a3, 1.0), 0.0)];
}

- (id)colorBlendedWithColor:(id)a3
{
  v4 = (double *)a3;
  id v5 = self;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double alpha = v5->_alpha;
      double v7 = v4[3];
      double v8 = 1.0;
      double v9 = alpha + v7 * (1.0 - alpha);
      if (v9 != 0.0) {
        double v8 = (alpha * v5->_white + v7 * v4[2] * (1.0 - alpha)) / v9;
      }
      uint64_t v10 = +[MTColor colorWithWhite:alpha:](MTColor, "colorWithWhite:alpha:", v8);
    }
    else
    {
      v11 = [(MTWhiteColor *)v5 _rgbColor];
      uint64_t v10 = [(MTWhiteColor *)v11 colorBlendedWithColor:v4];

      id v5 = v11;
    }

    id v5 = (MTWhiteColor *)v10;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; white: %f; alpha: %f>",
               objc_opt_class(),
               self,
               *(void *)&self->_white,
               *(void *)&self->_alpha);
}

- (id)_rgbColor
{
  v2 = [[MTRGBColor alloc] initWithRed:self->_white green:self->_white blue:self->_white alpha:self->_alpha];
  return v2;
}

- (double)white
{
  return self->_white;
}

- (double)alpha
{
  return self->_alpha;
}

@end