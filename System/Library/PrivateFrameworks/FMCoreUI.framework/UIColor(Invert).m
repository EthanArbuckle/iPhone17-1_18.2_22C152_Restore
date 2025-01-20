@interface UIColor(Invert)
- (id)invert;
@end

@implementation UIColor(Invert)

- (id)invert
{
  v15[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = (CGColor *)[v1 CGColor];
  size_t NumberOfComponents = CGColorGetNumberOfComponents(v2);
  if (NumberOfComponents >= 2)
  {
    uint64_t v4 = NumberOfComponents;
    Components = CGColorGetComponents(v2);
    if (v4 < 2)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = v4 - 1;
      v7 = (double *)Components;
      v8 = (double *)((char *)v15 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v9 = v4 - 1;
      do
      {
        double v10 = *v7++;
        *v8++ = 1.0 - v10;
        --v9;
      }
      while (v9);
    }
    *(CGFloat *)((char *)&v15[v6] - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0)) = Components[v6];
    ColorSpace = CGColorGetColorSpace(v2);
    v12 = CGColorCreate(ColorSpace, (const CGFloat *)((char *)v15 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0)));
    uint64_t v13 = [MEMORY[0x263F1C550] colorWithCGColor:v12];

    CGColorRelease(v12);
    id v1 = (id)v13;
  }
  return v1;
}

@end