@interface MTColor
+ (id)blackColor;
+ (id)colorWithCGColor:(CGColor *)a3;
+ (id)colorWithDescription:(id)a3;
+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)colorWithWhite:(double)a3 alpha:(double)a4;
+ (id)pinkColor;
+ (id)whiteColor;
- (CAColorMatrix)sourceOverColorMatrix;
- (CGColor)CGColor;
- (MTColor)colorWithAdditionalAlphaComponent:(double)a3;
- (MTColor)colorWithAlphaComponent:(double)a3;
- (id)_initWithCGColor:(CGColor *)a3;
- (id)_initWithDescription:(id)a3;
- (id)_rgbColor;
- (id)colorBlendedWithColor:(id)a3;
- (id)colorDescription;
- (void)dealloc;
@end

@implementation MTColor

+ (id)colorWithDescription:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"alpha"];

  if (v4)
  {
    v5 = [v3 objectForKey:@"white"];

    if (v5)
    {
      v6 = MTWhiteColor;
LABEL_4:
      v4 = (void *)[[v6 alloc] _initWithDescription:v3];
      goto LABEL_5;
    }
    v4 = [v3 objectForKey:@"red"];
    if (v4)
    {
      uint64_t v8 = [v3 objectForKey:@"green"];
      if (v8)
      {
        v9 = (void *)v8;
        v10 = [v3 objectForKey:@"blue"];

        if (v10)
        {
          v6 = MTRGBColor;
          goto LABEL_4;
        }
      }
      else
      {
      }
      v4 = 0;
    }
  }
LABEL_5:

  return v4;
}

+ (id)colorWithCGColor:(CGColor *)a3
{
  if (a3)
  {
    CGColorSpaceRef ColorSpace = CGColorGetColorSpace(a3);
    if (RGBColorSpace_onceToken != -1) {
      dispatch_once(&RGBColorSpace_onceToken, &__block_literal_global_135);
    }
    if (ColorSpace != (CGColorSpaceRef)RGBColorSpace___RGBColorSpace
      || (id v6 = [[MTRGBColor alloc] _initWithCGColor:a3]) == 0)
    {
      if (GrayColorSpace_onceToken != -1) {
        dispatch_once(&GrayColorSpace_onceToken, &__block_literal_global_137);
      }
      if (ColorSpace == (CGColorSpaceRef)GrayColorSpace___GrayColorSpace) {
        id v6 = [[MTWhiteColor alloc] _initWithCGColor:a3];
      }
      else {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)dealloc
{
  cachedColor = self->_cachedColor;
  if (cachedColor) {
    CGColorRelease(cachedColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTColor;
  [(MTColor *)&v4 dealloc];
}

+ (id)whiteColor
{
  return (id)[a1 colorWithWhite:1.0 alpha:1.0];
}

+ (id)blackColor
{
  return (id)[a1 colorWithWhite:0.0 alpha:1.0];
}

+ (id)pinkColor
{
  return (id)[a1 colorWithRed:1.0 green:0.752941176 blue:0.796078431 alpha:1.0];
}

+ (id)colorWithWhite:(double)a3 alpha:(double)a4
{
  objc_super v4 = [[MTWhiteColor alloc] initWithWhite:a3 alpha:a4];
  return v4;
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  id v6 = [[MTRGBColor alloc] initWithRed:a3 green:a4 blue:a5 alpha:a6];
  return v6;
}

- (id)_initWithCGColor:(CGColor *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"MTColor.m" lineNumber:256 description:@"Abstract"];

  return 0;
}

- (id)_initWithDescription:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"MTColor.m" lineNumber:261 description:@"Abstract"];

  return 0;
}

- (CGColor)CGColor
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MTColor.m" lineNumber:272 description:@"Abstract"];

  return 0;
}

- (id)colorDescription
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MTColor.m" lineNumber:277 description:@"Abstract"];

  return 0;
}

- (MTColor)colorWithAlphaComponent:(double)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"MTColor.m" lineNumber:282 description:@"Abstract"];

  return 0;
}

- (MTColor)colorWithAdditionalAlphaComponent:(double)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"MTColor.m" lineNumber:287 description:@"Abstract"];

  return 0;
}

- (id)colorBlendedWithColor:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"MTColor.m" lineNumber:292 description:@"Abstract"];

  return 0;
}

- (CAColorMatrix)sourceOverColorMatrix
{
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a3 object:self file:@"MTColor.m" lineNumber:297 description:@"Abstract"];

  uint64_t v8 = (_OWORD *)MEMORY[0x1E4F39AD8];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  *(_OWORD *)&retstr->m24 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  *(_OWORD *)&retstr->m33 = v9;
  *(_OWORD *)&retstr->m42 = v8[4];
  long long v10 = v8[1];
  *(_OWORD *)&retstr->m11 = *v8;
  *(_OWORD *)&retstr->m15 = v10;
  return result;
}

- (id)_rgbColor
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MTColor.m" lineNumber:302 description:@"Abstract"];

  return 0;
}

@end