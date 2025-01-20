@interface CUIThemeGradient
- (BOOL)isDithered;
- (CGFunctionRef)_newColorShaderForDistance:(CGFunctionRef)result;
- (CGFunctionRef)colorShader;
- (CGImage)_createRadialGradientImageWithWidth:(double)a3 height:(double)a4;
- (CUIColor)_colorFromPSDGradientColor:(CGFloat)a3;
- (CUIThemeGradient)initWithColors:(id)a3 colorlocations:(id)a4 colorMidpoints:(id)a5 opacities:(id)a6 opacityLocations:(id)a7 opacityMidpoints:(id)a8 smoothingCoefficient:(double)a9 fillColor:(id)a10 colorSpace:(CGColorSpace *)a11;
- (CUIThemeGradient)initWithColors:(id)a3 colorlocations:(id)a4 colorMidpoints:(id)a5 opacities:(id)a6 opacityLocations:(id)a7 opacityMidpoints:(id)a8 smoothingCoefficient:(double)a9 fillColor:(id)a10 colorSpace:(CGColorSpace *)a11 dither:(BOOL)a12;
- (NSMutableArray)_psdGradientColorStopsWithColors:(void *)a3 locations:(uint64_t)a4 colorSpace:;
- (NSMutableArray)_psdGradientOpacityStopsWithOpacities:(void *)a3 locations:;
- (const)_psdGradientColorWithColor:(uint64_t)a3 colorSpace:;
- (double)smoothingCoefficient;
- (id)_initWithGradientEvaluator:(id)a3 colorSpace:(CGColorSpace *)a4;
- (id)colorLocations;
- (id)colorStops;
- (id)fillColor;
- (id)gradientByApplyingEffects:(id)a3;
- (id)interpolatedColorAtLocation:(double)a3;
- (id)opacityLocations;
- (id)opacityStops;
- (int)blendMode;
- (void)_tintColorStopsWithEffects:(uint64_t)a1;
- (void)dealloc;
- (void)drawAngleGradientInRect:(CGRect)a3 relativeCenterPosition:(CGPoint)a4 withContext:(CGContext *)a5;
- (void)drawFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 options:(unint64_t)a5 withContext:(CGContext *)a6;
- (void)drawInRect:(CGRect)a3 angle:(double)a4;
- (void)drawInRect:(CGRect)a3 angle:(double)a4 options:(unint64_t)a5 withContext:(CGContext *)a6;
- (void)drawInRect:(CGRect)a3 angle:(double)a4 withContext:(CGContext *)a5;
- (void)drawRadialGradientInRect:(CGRect)a3 relativeCenterPosition:(CGPoint)a4 withContext:(CGContext *)a5;
@end

@implementation CUIThemeGradient

- (NSMutableArray)_psdGradientOpacityStopsWithOpacities:(void *)a3 locations:
{
  if (!a1) {
    return 0;
  }
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a2 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(a2);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v10);
        v12 = [CUIPSDGradientOpacityStop alloc];
        objc_msgSend(objc_msgSend(a3, "objectAtIndex:", (char *)v10 + v8), "doubleValue");
        double v14 = v13;
        [v11 doubleValue];
        v16 = [(CUIPSDGradientOpacityStop *)v12 initWithLocation:v14 opacity:v15];
        [(NSMutableArray *)v5 addObject:v16];

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      v8 += (uint64_t)v10;
    }
    while (v7);
  }
  return v5;
}

- (const)_psdGradientColorWithColor:(uint64_t)a3 colorSpace:
{
  if (result)
  {
    v4 = result;
    id v5 = objc_msgSend(a2, "colorUsingCGColorSpace:");
    size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)[v5 CGColor]);
    result = CGColorGetComponents((CGColorRef)[v5 CGColor]);
    if (NumberOfComponents != 4 && NumberOfComponents != 2) {
      return (const CGFloat *)[+[NSAssertionHandler currentHandler] handleFailureInMethod:sel__psdGradientColorWithColor_colorSpace_, v4, @"CUIThemeGradient.m", 129, @"CUIThemeGradient can't initialize with unsupported color space: %@", a3 object file lineNumber description];
    }
  }
  return result;
}

- (NSMutableArray)_psdGradientColorStopsWithColors:(void *)a3 locations:(uint64_t)a4 colorSpace:
{
  if (!a1) {
    return 0;
  }
  uint64_t v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a2 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    id obj = a2;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      double v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(obj);
        }
        -[CUIThemeGradient _psdGradientColorWithColor:colorSpace:](a1, *(void **)(*((void *)&v18 + 1) + 8 * (void)v13), a4);
        double v14 = [CUIPSDGradientColorStop alloc];
        objc_msgSend(objc_msgSend(a3, "objectAtIndex:", (char *)v13 + v11), "doubleValue");
        double v15 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:](v14, "initWithLocation:gradientColor:");
        [(NSMutableArray *)v8 addObject:v15];

        double v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      v11 += (uint64_t)v13;
    }
    while (v10);
  }
  return v8;
}

- (id)_initWithGradientEvaluator:(id)a3 colorSpace:(CGColorSpace *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CUIThemeGradient;
  id v6 = [(CUIThemeGradient *)&v8 init];
  if (v6)
  {
    v6->gradientEvaluator = a3;
    v6->colorSpace = CGColorSpaceRetain(a4);
  }
  return v6;
}

- (CUIThemeGradient)initWithColors:(id)a3 colorlocations:(id)a4 colorMidpoints:(id)a5 opacities:(id)a6 opacityLocations:(id)a7 opacityMidpoints:(id)a8 smoothingCoefficient:(double)a9 fillColor:(id)a10 colorSpace:(CGColorSpace *)a11
{
  LOBYTE(v12) = 0;
  return [(CUIThemeGradient *)self initWithColors:a3 colorlocations:a4 colorMidpoints:a5 opacities:a6 opacityLocations:a7 opacityMidpoints:a8 smoothingCoefficient:a9 fillColor:a10 colorSpace:a11 dither:v12];
}

- (CUIThemeGradient)initWithColors:(id)a3 colorlocations:(id)a4 colorMidpoints:(id)a5 opacities:(id)a6 opacityLocations:(id)a7 opacityMidpoints:(id)a8 smoothingCoefficient:(double)a9 fillColor:(id)a10 colorSpace:(CGColorSpace *)a11 dither:(BOOL)a12
{
  if ([a3 count])
  {
    id v21 = [a3 count];
    if (v21 != [a4 count]) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CUIThemeGradient.m" lineNumber:172 description:@"CUIThemeGradient needs the same number of colors as there are of color locations for initialization"];
    }
    id v22 = [a6 count];
    if (v22 != [a7 count]) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CUIThemeGradient.m" lineNumber:173 description:@"CUIThemeGradient needs the same number of opacities as there are of opacity locations for initialization"];
    }
    -[CUIThemeGradient _psdGradientColorWithColor:colorSpace:]((const CGFloat *)self, a10, (uint64_t)a11);
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    v31 = [CUIPSDGradientEvaluator alloc];
    v32 = -[CUIThemeGradient _psdGradientColorStopsWithColors:locations:colorSpace:]((const CGFloat *)self, a3, a4, (uint64_t)a11);
    v33 = -[CUIPSDGradientEvaluator initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:](v31, "initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:", v32, a5, -[CUIThemeGradient _psdGradientOpacityStopsWithOpacities:locations:]((uint64_t)self, a6, a7), a8, a12, a9, v24, v26, v28, v30);
    v34 = [(CUIThemeGradient *)self _initWithGradientEvaluator:v33 colorSpace:a11];

    return v34;
  }
  else
  {
    v36 = self;
    return 0;
  }
}

- (id)gradientByApplyingEffects:(id)a3
{
  v3 = self;
  if (a3)
  {
    id v5 = [self->gradientEvaluator copy];
    v3 = (CUIThemeGradient *)[[CUIThemeGradient alloc] _initWithGradientEvaluator:v5 colorSpace:v3->colorSpace];
    -[CUIThemeGradient _tintColorStopsWithEffects:]((uint64_t)v3, a3);
  }
  return v3;
}

- (void)_tintColorStopsWithEffects:(uint64_t)a1
{
  if (a1)
  {
    v17 = *(void **)(a1 + 8);
    id v4 = [v17 colorStops];
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v4;
    id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v10 gradientColor];
          components[0] = v11;
          components[1] = v12;
          components[2] = v13;
          components[3] = v14;
          double v15 = CGColorCreate(*(CGColorSpaceRef *)(a1 + 24), components);
          v16 = (CGColor *)[a2 newColorByProcessingColor:v15];
          CGColorGetComponents(v16);
          [v10 location];
          objc_msgSend(v5, "addObject:", +[CUIPSDGradientColorStop colorStopWithLocation:gradientColor:](CUIPSDGradientColorStop, "colorStopWithLocation:gradientColor:"));
          CGColorRelease(v15);
          CGColorRelease(v16);
        }
        id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
    if (v5) {
      objc_msgSend(v17, "setColorStops:midpoints:", v5, objc_msgSend(v17, "colorMidpointLocations"));
    }
  }
}

- (CUIColor)_colorFromPSDGradientColor:(CGFloat)a3
{
  if (!a1) {
    return 0;
  }
  components[0] = a2;
  components[1] = a3;
  components[2] = a4;
  components[3] = a5;
  id v5 = CGColorCreate(*(CGColorSpaceRef *)(a1 + 24), components);
  id v6 = +[CUIColor colorWithCGColor:v5];
  CGColorRelease(v5);
  return v6;
}

- (id)colorStops
{
  id v3 = [self->gradientEvaluator colorStops];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unsigned __int8 v10 = [v9 isDoubleStop];
        char v11 = 1;
        do
        {
          if ([v9 isDoubleStop])
          {
            if (v11) {
              [v9 leadInColor];
            }
            else {
              [v9 leadOutColor];
            }
          }
          else
          {
            [v9 gradientColor];
          }
          -[NSMutableArray addObject:](v4, "addObject:", -[CUIThemeGradient _colorFromPSDGradientColor:]((uint64_t)self, v12, v13, v14, v15));
          char v16 = v10 & v11;
          char v11 = 0;
        }
        while ((v16 & 1) != 0);
      }
      id v6 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)colorLocations
{
  id v2 = [self->gradientEvaluator colorStops];
  id v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unsigned int v9 = [v8 isDoubleStop];
        [v8 location];
        [(NSMutableArray *)v3 addObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")];
        if (v9)
        {
          [v8 location];
          [(NSMutableArray *)v3 addObject:+[NSNumber numberWithDouble:v10 + 0.01]];
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)opacityStops
{
  id v2 = [self->gradientEvaluator opacityStops];
  id v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned __int8 v9 = [v8 isDoubleStop];
        char v10 = 1;
        do
        {
          if ([v8 isDoubleStop])
          {
            if (v10) {
              [v8 leadInOpacity];
            }
            else {
              [v8 leadOutOpacity];
            }
          }
          else
          {
            [v8 opacity];
          }
          [(NSMutableArray *)v3 addObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")];
          char v11 = v9 & v10;
          char v10 = 0;
        }
        while ((v11 & 1) != 0);
      }
      id v5 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)opacityLocations
{
  id v2 = [self->gradientEvaluator opacityStops];
  id v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unsigned int v9 = [v8 isDoubleStop];
        [v8 location];
        if (v9)
        {
          [(NSMutableArray *)v3 addObject:+[NSNumber numberWithDouble:v10 + -0.01]];
          [v8 location];
        }
        [(NSMutableArray *)v3 addObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")];
      }
      id v5 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  return v3;
}

- (double)smoothingCoefficient
{
  [self->gradientEvaluator smoothingCoefficient];
  return result;
}

- (BOOL)isDithered
{
  return [self->gradientEvaluator isDithered];
}

- (id)fillColor
{
  [self->gradientEvaluator fillColor];
  return -[CUIThemeGradient _colorFromPSDGradientColor:]((uint64_t)self, v3, v4, v5, v6);
}

- (int)blendMode
{
  return [self->gradientEvaluator blendMode];
}

- (void)dealloc
{
  CGColorSpaceRelease(self->colorSpace);
  colorShader = self->colorShader;
  if (colorShader) {
    CGFunctionRelease(colorShader);
  }
  gradientImage = self->_gradientImage;
  if (gradientImage) {
    CGImageRelease(gradientImage);
  }
  v5.receiver = self;
  v5.super_class = (Class)CUIThemeGradient;
  [(CUIThemeGradient *)&v5 dealloc];
}

- (CGFunctionRef)_newColorShaderForDistance:(CGFunctionRef)result
{
  if (result)
  {
    *(void *)&callbacks.version = 0;
    callbacks.evaluate = (CGFunctionEvaluateCallback)LinearGradientShaderFunction;
    callbacks.releaseInfo = (CGFunctionReleaseInfoCallback)GradientEvaluatorRelease;
    id v3 = [*((id *)result + 1) copy];
    [v3 customizeForDistance:a2];
    CFRetain(v3);

    *(_OWORD *)domain = xmmword_1A139EBD0;
    range[0] = 0.0;
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    range[1] = 1.0;
    uint64_t v7 = 0x3FF0000000000000;
    uint64_t v9 = 0x3FF0000000000000;
    uint64_t v10 = 0;
    uint64_t v11 = 0x3FF0000000000000;
    return CGFunctionCreate(v3, 1uLL, domain, 4uLL, range, &callbacks);
  }
  return result;
}

- (CGFunctionRef)colorShader
{
  if (result)
  {
    CGFunctionRef v1 = result;
    double result = (CGFunctionRef)*((void *)result + 2);
    if (!result)
    {
      *(void *)&callbacks.version = 0;
      callbacks.evaluate = (CGFunctionEvaluateCallback)LinearGradientShaderFunction;
      callbacks.releaseInfo = (CGFunctionReleaseInfoCallback)GradientEvaluatorRelease;
      *(_OWORD *)domain = xmmword_1A139EBD0;
      range[0] = 0.0;
      uint64_t v4 = 0;
      uint64_t v6 = 0;
      range[1] = 1.0;
      uint64_t v5 = 0x3FF0000000000000;
      uint64_t v7 = 0x3FF0000000000000;
      uint64_t v8 = 0;
      uint64_t v9 = 0x3FF0000000000000;
      double result = CGFunctionCreate(*((id *)v1 + 1), 1uLL, domain, 4uLL, range, &callbacks);
      *((void *)v1 + 2) = result;
    }
  }
  return result;
}

- (void)drawInRect:(CGRect)a3 angle:(double)a4 withContext:(CGContext *)a5
{
}

- (void)drawInRect:(CGRect)a3 angle:(double)a4 options:(unint64_t)a5 withContext:(CGContext *)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v15 = 0.0;
  double v16 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  FrameIntersectionWithAxis(&v15, &v13, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  CGContextSaveGState(a6);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGContextClipToRect(a6, v18);
  -[CUIThemeGradient drawFromPoint:toPoint:options:withContext:](self, "drawFromPoint:toPoint:options:withContext:", a5, a6, v15, v16, v13, v14);
  CGContextRestoreGState(a6);
}

- (void)drawInRect:(CGRect)a3 angle:(double)a4
{
  _CUILog(3, (uint64_t)"Calling drawInRect: witha a CUIThemeGradient.  This operation is not supported.", v4, v5, v6, v7, v8, v9, v10);
}

- (void)drawRadialGradientInRect:(CGRect)a3 relativeCenterPosition:(CGPoint)a4 withContext:(CGContext *)a5
{
  NSStringFromSelector(a2);
  _CUILog(3, (uint64_t)"%@: need to implement %@", v6, v7, v8, v9, v10, v11, (uint64_t)self);
}

- (void)drawAngleGradientInRect:(CGRect)a3 relativeCenterPosition:(CGPoint)a4 withContext:(CGContext *)a5
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  gradientImage = self->_gradientImage;
  if (!gradientImage)
  {
    gradientImage = [(CUIThemeGradient *)self _createRadialGradientImageWithWidth:256.0 height:256.0];
    self->_gradientImage = gradientImage;
  }
  double v14 = v11 + width * 0.5;
  double v15 = v10 + height * 0.5;
  double v16 = v15 - y;
  if (v14 - x <= 0.0) {
    double v17 = 0.0;
  }
  else {
    double v17 = v11 - (v14 - x);
  }
  if (v16 <= 0.0) {
    double v18 = 0.0;
  }
  else {
    double v18 = v10 - v16;
  }
  double v19 = width + vabdd_f64(v14, x);
  double v20 = height + vabdd_f64(v15, y);
  CGContextDrawImage(a5, *(CGRect *)&v17, gradientImage);
}

- (void)drawFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 options:(unint64_t)a5 withContext:(CGContext *)a6
{
  char v7 = a5;
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  BOOL v13 = a3.x == a4.x || a3.y == a4.y;
  if (v13 && [self->gradientEvaluator hasEdgePixel])
  {
    double v14 = vabdd_f64(x, v11);
    double v15 = vabdd_f64(y, v10);
    if (v14 <= v15) {
      double v14 = v15;
    }
    double v16 = -[CUIThemeGradient _newColorShaderForDistance:]((CGFunctionRef)self, v14);
    int v17 = 1;
  }
  else
  {
    double v16 = -[CUIThemeGradient colorShader]((CGFunctionRef)self);
    int v17 = 0;
  }
  v20.double x = v11;
  v20.double y = v10;
  v21.double x = x;
  v21.double y = y;
  Axial = CGShadingCreateAxial(self->colorSpace, v20, v21, v16, v7 & 1, (v7 & 2) != 0);
  CGContextDrawShading(a6, Axial);
  CGShadingRelease(Axial);
  if (v17)
  {
    CGFunctionRelease(v16);
  }
}

- (id)interpolatedColorAtLocation:(double)a3
{
  [self->gradientEvaluator _smoothedGradientColorAtLocation:a3];
  components[0] = v4;
  components[1] = v5;
  components[2] = v6;
  components[3] = v7;
  uint64_t v8 = CGColorCreate(self->colorSpace, components);
  uint64_t v9 = +[CUIColor colorWithCGColor:v8];
  CGColorRelease(v8);
  return v9;
}

- (CGImage)_createRadialGradientImageWithWidth:(double)a3 height:(double)a4
{
  double result = CreateARGBBitmapContext(a3, a4, 1.0);
  if (result)
  {
    uint64_t v8 = result;
    Data = (__int32 *)CGBitmapContextGetData(result);
    uint64_t SRGB = _CUIColorSpaceGetSRGB();
    if (a4 > 0.0)
    {
      double v11 = (CGColorSpace *)SRGB;
      uint64_t v12 = 0;
      double v13 = 0.0;
      float64x2_t v23 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
      do
      {
        if (a3 > 0.0)
        {
          double v14 = v13 - a4 * 0.5;
          double v15 = 0.0;
          uint64_t v16 = 1;
          do
          {
            double v17 = atan2(v14, v15 - a3 * 0.5);
            if (v14 < 0.0) {
              double v17 = v17 + 6.28318531;
            }
            id v18 = -[CUIThemeGradient interpolatedColorAtLocation:](self, "interpolatedColorAtLocation:", v17 / 6.28318531, *(_OWORD *)&v23);
            double v19 = (CGColor *)[v18 CGColor];
            if (CGColorGetColorSpace(v19) != v11) {
              double v19 = (CGColor *)objc_msgSend(objc_msgSend(v18, "colorUsingCGColorSpace:", v11), "CGColor");
            }
            Components = CGColorGetComponents(v19);
            uint32x2_t v21 = vshl_u32((uint32x2_t)vmovn_s64(vcvtq_s64_f64(vmulq_f64(*(float64x2_t *)(Components + 1), v23))), (uint32x2_t)0x800000010);
            *Data++ = v21.i32[0] | ((int)(*Components * 255.0) << 24) | (int)(Components[3] * 255.0) | v21.i32[1];
            double v15 = (double)v16++;
          }
          while (v15 < a3);
        }
        double v13 = (double)++v12;
      }
      while ((double)v12 < a4);
    }
    Image = CGBitmapContextCreateImage(v8);
    CGContextRelease(v8);
    return Image;
  }
  return result;
}

@end