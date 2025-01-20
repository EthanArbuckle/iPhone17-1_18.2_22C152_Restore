@interface UIColor(UIColor)
+ (uint64_t)colorWithComponentRGBA:()UIColor;
+ (uint64_t)colorWithVectorRGBA:()UIColor;
- (__n64)vectorRGBA;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
- (float)componentRGBA;
@end

@implementation UIColor(UIColor)

- (float)componentRGBA
{
  double v9 = 0.0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  double v5 = 0.0;
  uint64_t v6 = 0;
  if ([a1 getRed:&v9 green:&v8 blue:&v7 alpha:&v6])
  {
    return v9;
  }
  else
  {
    int v3 = [a1 getWhite:&v5 alpha:&v6];
    float result = 0.0;
    if (!v3) {
      return result;
    }
    return v5;
  }
}

- (__n64)vectorRGBA
{
  [a1 componentRGBA];
  result.n64_u32[1] = v1;
  return result;
}

+ (uint64_t)colorWithVectorRGBA:()UIColor
{
  LODWORD(a2) = a1.n128_u32[1];
  LODWORD(a3) = a1.n128_u32[2];
  LODWORD(a4) = a1.n128_u32[3];
  return objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", a1.n128_f64[0], a2, a3, a4);
}

+ (uint64_t)colorWithComponentRGBA:()UIColor
{
  return [MEMORY[0x263F1C550] colorWithRed:a1 green:a2 blue:a3 alpha:a4];
}

- (double)red
{
  [a1 componentRGBA];
  return v1;
}

- (double)green
{
  [a1 componentRGBA];
  return v1;
}

- (double)blue
{
  [a1 componentRGBA];
  return v1;
}

- (double)alpha
{
  [a1 componentRGBA];
  return v1;
}

@end