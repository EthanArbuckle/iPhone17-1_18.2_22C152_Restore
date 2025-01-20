@interface CUIPSDGradient
+ (CUIPSDGradient)cuiPSDGradientWithColors:(id)a3 locations:(id)a4 midpointLocations:(id)a5 angle:(double)a6 isRadial:(BOOL)a7;
+ (CUIPSDGradient)cuiPSDGradientWithColors:(id)a3 locations:(id)a4 midpointLocations:(id)a5 angle:(double)a6 style:(unsigned int)a7;
+ (id)getMidpointLocationFromArray:(id)a3 atIndex:(int64_t)a4 withPolicy:(int)a5;
- (CUIPSDGradient)initWithEvaluator:(id)a3 drawingAngle:(double)a4 gradientStyle:(unsigned int)a5;
- (CUIPSDGradientEvaluator)evaluator;
- (double)drawingAngle;
- (unsigned)gradientStyle;
- (void)dealloc;
- (void)setDrawingAngle:(double)a3;
- (void)setEvaluator:(id)a3;
- (void)setGradientStyle:(unsigned int)a3;
@end

@implementation CUIPSDGradient

+ (id)getMidpointLocationFromArray:(id)a3 atIndex:(int64_t)a4 withPolicy:(int)a5
{
  switch(a5)
  {
    case 0:
      return 0;
    case 2:
      if (a4)
      {
        id v5 = a3;
        int64_t v6 = a4 - 1;
        return [v5 objectAtIndex:v6];
      }
      break;
    case 3:
      id v5 = a3;
      int64_t v6 = a4;
      return [v5 objectAtIndex:v6];
  }
  return &unk_1EF4A6BA8;
}

+ (CUIPSDGradient)cuiPSDGradientWithColors:(id)a3 locations:(id)a4 midpointLocations:(id)a5 angle:(double)a6 isRadial:(BOOL)a7
{
  if (a7) {
    uint64_t v7 = 1382312992;
  }
  else {
    uint64_t v7 = 1282306592;
  }
  return (CUIPSDGradient *)[a1 cuiPSDGradientWithColors:a3 locations:a4 midpointLocations:a5 angle:v7 style:a6];
}

+ (CUIPSDGradient)cuiPSDGradientWithColors:(id)a3 locations:(id)a4 midpointLocations:(id)a5 angle:(double)a6 style:(unsigned int)a7
{
  uint64_t v12 = (uint64_t)[a3 count];
  id v13 = [a4 count];
  id v14 = [a5 count];
  if ((id)v12 != v13) {
    return 0;
  }
  if (!v14)
  {
    unsigned int v30 = a7;
    int v15 = 1;
    goto LABEL_8;
  }
  if (v14 != (id)(v12 - 1))
  {
    if (v14 == (id)v12)
    {
      unsigned int v30 = a7;
      int v15 = 3;
      goto LABEL_8;
    }
    return 0;
  }
  unsigned int v30 = a7;
  int v15 = 2;
LABEL_8:
  unsigned int v33 = v15;
  id v34 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
  id v16 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
  id v32 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
  id v31 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
  if (v12 >= 1)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", i), "doubleValue");
      double v19 = v18;
      v20 = (CGColor *)[a3 objectAtIndex:i];
      int64_t NumberOfComponents = CGColorGetNumberOfComponents(v20);
      if (NumberOfComponents >= 3)
      {
        int64_t v22 = NumberOfComponents;
        Components = CGColorGetComponents(v20);
        v24 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:]([CUIPSDGradientColorStop alloc], "initWithLocation:gradientColor:", v19, *Components, Components[1], Components[2], 1.0);
        id v25 = +[CUIPSDGradient getMidpointLocationFromArray:a5 atIndex:i withPolicy:v33];
        [v16 addObject:v25];
        [v34 addObject:v24];
        if (v22 != 3)
        {
          v26 = [[CUIPSDGradientOpacityStop alloc] initWithLocation:v19 opacity:Components[3]];
          [v31 addObject:v25];
          [v32 addObject:v26];
        }
      }
    }
  }
  v27 = -[CUIPSDGradientEvaluator initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:]([CUIPSDGradientEvaluator alloc], "initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:", v34, v16, v32, v31, 1, 100.0, 0.0, 0.0, 0.0, 1.0);

  v28 = [[CUIPSDGradient alloc] initWithEvaluator:v27 drawingAngle:v30 gradientStyle:a6];
  return v28;
}

- (CUIPSDGradient)initWithEvaluator:(id)a3 drawingAngle:(double)a4 gradientStyle:(unsigned int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CUIPSDGradient;
  v8 = [(CUIPSDGradient *)&v10 init];
  if (v8)
  {
    v8->evaluator = (CUIPSDGradientEvaluator *)a3;
    v8->drawingAngle = a4;
    v8->gradientStyle = a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradient;
  [(CUIPSDGradient *)&v3 dealloc];
}

- (CUIPSDGradientEvaluator)evaluator
{
  return (CUIPSDGradientEvaluator *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEvaluator:(id)a3
{
}

- (double)drawingAngle
{
  return self->drawingAngle;
}

- (void)setDrawingAngle:(double)a3
{
  self->drawingAngle = a3;
}

- (unsigned)gradientStyle
{
  return self->gradientStyle;
}

- (void)setGradientStyle:(unsigned int)a3
{
  self->gradientStyle = a3;
}

@end