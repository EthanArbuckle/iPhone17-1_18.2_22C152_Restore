@interface CIConstColor
+ (id)alloc;
- (BOOL)isEqual:(id)a3;
- (CGColor)cgColor;
- (CGColorSpace)colorSpace;
- (CIConstColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(CGColorSpace *)a7;
- (const)components;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
- (unint64_t)hash;
- (unint64_t)numberOfComponents;
- (unint64_t)retainCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CIConstColor

+ (id)alloc
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3A8];
  v4 = (objc_class *)objc_opt_class();
  [v2 raise:v3, @"Calling Alloc on %@ is not allowed", NSStringFromClass(v4) format];
  return 0;
}

- (unint64_t)retainCount
{
  return 1;
}

- (unint64_t)numberOfComponents
{
  return 4;
}

- (const)components
{
  return (const double *)&self[1];
}

- (double)red
{
  return *(double *)&self[1].super.super.isa;
}

- (double)green
{
  return *(double *)&self[1].super._priv;
}

- (double)blue
{
  return *(double *)self[1].super._pad;
}

- (double)alpha
{
  return *(double *)&self[1].super._pad[1];
}

- (CGColorSpace)colorSpace
{
  if (GetDefaultColorSpace(void)::onceToken != -1) {
    dispatch_once(&GetDefaultColorSpace(void)::onceToken, &__block_literal_global_5);
  }
  return (CGColorSpace *)GetDefaultColorSpace(void)::cs;
}

- (CGColor)cgColor
{
  CGColorRef v2 = CGColorCreate([(CIConstColor *)self colorSpace], (const CGFloat *)&self[1]);
  CFAutorelease(v2);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(CIConstColor *)self components];
    v6 = (void *)[a3 components];
    return *(void *)v5 == *v6
        && *((void *)v5 + 1) == v6[1]
        && *((void *)v5 + 2) == v6[2]
        && *((void *)v5 + 3) == v6[3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return [a3 isEqual:self];
    }
    else
    {
      return 0;
    }
  }
}

- (unint64_t)hash
{
  int v3 = [(CIConstColor *)self numberOfComponents];
  v4 = [(CIConstColor *)self components];
  unint64_t result = v3;
  if (v3 >= 1)
  {
    uint64_t v6 = v3;
    do
    {
      double v7 = *v4++;
      unint64_t result = 33 * result + (int)vcvtd_n_s64_f64(v7, 0xAuLL);
      --v6;
    }
    while (v6);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CIConstColor;
  [(CIColor *)&v3 encodeWithCoder:a3];
}

- (CIConstColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(CGColorSpace *)a7
{
  v8 = [[CIColor alloc] initWithRed:a3 green:a4 blue:a5 alpha:a6];

  return v8;
}

@end