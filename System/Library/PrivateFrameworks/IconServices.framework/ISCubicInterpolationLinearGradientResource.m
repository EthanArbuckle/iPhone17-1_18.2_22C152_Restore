@interface ISCubicInterpolationLinearGradientResource
- (IFColor)endingColor;
- (IFColor)startingColor;
- (ISCubicInterpolationLinearGradientResource)initWithStartingColor:(id)a3 endingColor:(id)a4;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (void)setEndingColor:(id)a3;
- (void)setStartingColor:(id)a3;
@end

@implementation ISCubicInterpolationLinearGradientResource

- (ISCubicInterpolationLinearGradientResource)initWithStartingColor:(id)a3 endingColor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISCubicInterpolationLinearGradientResource;
  v9 = [(ISCubicInterpolationLinearGradientResource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startingColor, a3);
    objc_storeStrong((id *)&v10->_endingColor, a4);
  }

  return v10;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v9) = 1046631210;
  LODWORD(v10) = 1000812293;
  LODWORD(v11) = 1062073097;
  LODWORD(v12) = 1.0;
  v13 = (void *)[v8 initWithControlPoints:v9 :v10 :v11 :v12];
  uint64_t v14 = (int)(height * 5.0);
  v15 = objc_opt_new();
  MEMORY[0x1F4188790](v15);
  v18 = (const CGFloat *)((char *)v34 - v17);
  if ((int)v14 >= 1)
  {
    uint64_t v19 = 0;
    float v20 = (float)(int)v14;
    do
    {
      *(float *)&double v16 = (float)(int)v19 / v20;
      [v13 _solveForInput:v16];
      float v22 = v21;
      v23 = [(ISCubicInterpolationLinearGradientResource *)self startingColor];
      v24 = [(ISCubicInterpolationLinearGradientResource *)self endingColor];
      v25 = [v23 blendColorWithFraction:v24 ofColor:v22];

      if (v25 && [v25 cgColor])
      {
        objc_msgSend(v15, "addObject:", objc_msgSend(v25, "cgColor"));
        v18[v19] = (float)((float)(int)v19 / v20);
      }

      ++v19;
    }
    while (v14 != v19);
  }
  v26 = objc_msgSend(MEMORY[0x1E4F6F1D8], "bitmapContextWithSize:scale:preset:", 0, width, height, a4);
  [v26 clear];
  CGGradientRef v27 = CGGradientCreateWithColors((CGColorSpaceRef)[MEMORY[0x1E4F6F1C8] deviceRGBColorSpace], (CFArrayRef)v15, v18);
  if (v27)
  {
    v28 = v27;
    CGFloat v29 = *MEMORY[0x1E4F1DAD8];
    CGFloat v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v31 = (CGContext *)[v26 cgContext];
    v37.x = 0.0;
    v36.x = v29;
    v36.y = v30;
    v37.y = height;
    CGContextDrawLinearGradient(v31, v28, v36, v37, 0);
    CGGradientRelease(v28);
  }
  v32 = [v26 image];

  return v32;
}

- (IFColor)startingColor
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartingColor:(id)a3
{
}

- (IFColor)endingColor
{
  return (IFColor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndingColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingColor, 0);
  objc_storeStrong((id *)&self->_startingColor, 0);
}

@end