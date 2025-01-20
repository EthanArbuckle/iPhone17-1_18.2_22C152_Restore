@interface CHSWidgetDisplayProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (CHSWidgetDisplayProperties)initWithCoder:(id)a3;
- (CHSWidgetDisplayProperties)initWithDisplayConfiguration:(id)a3;
- (CHSWidgetDisplayProperties)initWithScale:(double)a3 colorGamut:(unint64_t)a4;
- (CHSWidgetDisplayProperties)initWithSize:(CGSize)a3 scale:(double)a4 colorGamut:(unint64_t)a5;
- (CHSWidgetDisplayProperties)initWithWidgetDisplayProperties:(id)a3;
- (double)scale;
- (id)description;
- (id)fallbackDisplayProperties;
- (int64_t)comparedTo:(id)a3;
- (unint64_t)colorGamut;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetDisplayProperties

- (CHSWidgetDisplayProperties)initWithScale:(double)a3 colorGamut:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CHSWidgetDisplayProperties;
  result = [(CHSWidgetDisplayProperties *)&v12 init];
  if (result)
  {
    result->_scale = a3;
    result->_colorGamut = a4;
    __asm { FMOV            V0.2D, #1.0 }
    result->_size = _Q0;
  }
  return result;
}

- (CHSWidgetDisplayProperties)initWithSize:(CGSize)a3 scale:(double)a4 colorGamut:(unint64_t)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  result = [(CHSWidgetDisplayProperties *)self initWithScale:a5 colorGamut:a4];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
  }
  return result;
}

- (CHSWidgetDisplayProperties)initWithDisplayConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 colorGamut];
  [v4 pointScale];
  v6 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:](self, "initWithScale:colorGamut:", v5 != 1);

  return v6;
}

- (CHSWidgetDisplayProperties)initWithWidgetDisplayProperties:(id)a3
{
  id v4 = a3;
  [v4 scale];
  v6 = -[CHSWidgetDisplayProperties initWithScale:colorGamut:](self, "initWithScale:colorGamut:", [v4 colorGamut], v5);

  return v6;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  double scale = self->_scale;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __38__CHSWidgetDisplayProperties_isEqual___block_invoke;
  v22[3] = &unk_1E56C8440;
  id v11 = v9;
  id v23 = v11;
  id v12 = (id)[v5 appendCGFloat:v22 counterpart:scale];
  unint64_t colorGamut = self->_colorGamut;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __38__CHSWidgetDisplayProperties_isEqual___block_invoke_2;
  v20 = &unk_1E56C84B8;
  id v14 = v11;
  id v21 = v14;
  id v15 = (id)[v5 appendUnsignedInteger:colorGamut counterpart:&v17];
  LOBYTE(colorGamut) = objc_msgSend(v5, "isEqual", v17, v18, v19, v20);

  return colorGamut;
}

double __38__CHSWidgetDisplayProperties_isEqual___block_invoke(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 24);
}

uint64_t __38__CHSWidgetDisplayProperties_isEqual___block_invoke_2(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 32);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendCGFloat:self->_scale];
  id v5 = (id)[v3 appendUnsignedInteger:self->_colorGamut];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendDouble:@"scale" withName:2 decimalPrecision:self->_scale];
  if (self->_colorGamut) {
    id v5 = @"sRGB";
  }
  else {
    id v5 = @"P3";
  }
  [v3 appendString:v5 withName:@"gamut"];
  unint64_t v6 = [v3 build];

  return v6;
}

- (int64_t)comparedTo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CHSWidgetDisplayProperties *)self hash];
  if (v5 >= [v4 hash])
  {
    unint64_t v7 = [(CHSWidgetDisplayProperties *)self hash];
    int64_t v6 = v7 > [v4 hash];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (id)fallbackDisplayProperties
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if (self->_colorGamut) {
    id v4 = [[CHSWidgetDisplayProperties alloc] initWithScale:0 colorGamut:self->_scale];
  }
  else {
    id v4 = [[CHSWidgetDisplayProperties alloc] initWithScale:1 colorGamut:self->_scale];
  }
  [v3 addObject:v4];

  for (double i = 3.0; i > self->_scale; double i = i + -1.0)
  {
    if (self->_colorGamut)
    {
      int64_t v6 = [[CHSWidgetDisplayProperties alloc] initWithScale:self->_colorGamut colorGamut:i];
      [v3 addObject:v6];

      unint64_t v7 = [[CHSWidgetDisplayProperties alloc] initWithScale:0 colorGamut:i];
    }
    else
    {
      v8 = [[CHSWidgetDisplayProperties alloc] initWithScale:self->_colorGamut colorGamut:i];
      [v3 addObject:v8];

      unint64_t v7 = [[CHSWidgetDisplayProperties alloc] initWithScale:1 colorGamut:i];
    }
    [v3 addObject:v7];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double scale = self->_scale;
  *(float *)&double scale = scale;
  id v7 = v4;
  [v4 encodeFloat:@"scale" forKey:scale];
  int64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_colorGamut];
  [v7 encodeObject:v6 forKey:@"colorGamut"];
}

- (CHSWidgetDisplayProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"scale"];
  float v6 = v5;
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorGamut"];
  uint64_t v8 = [v7 unsignedIntegerValue];
  double v9 = v6;

  v10 = [(CHSWidgetDisplayProperties *)self initWithScale:v8 colorGamut:v9];
  id v11 = v10;
  if (v10)
  {
    v10->_double scale = v9;
    v10->_unint64_t colorGamut = v8;
  }

  return v11;
}

- (unint64_t)colorGamut
{
  return self->_colorGamut;
}

- (double)scale
{
  return self->_scale;
}

@end