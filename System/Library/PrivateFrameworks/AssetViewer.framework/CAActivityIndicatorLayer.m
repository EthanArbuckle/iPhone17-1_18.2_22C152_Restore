@interface CAActivityIndicatorLayer
- (BOOL)isAnimating;
- (CAActivityIndicatorLayer)initWithColor:(id)a3;
- (double)_alphaValueForStep:(int64_t)a3;
- (double)_spokeLengthForGearWidth:(double)a3;
- (double)_spokeWidthForGearWidth:(double)a3;
- (double)_widthForGearWidth:(double)result;
- (id)imageForStep:(int64_t)a3 withColor:(CGColor *)a4;
- (id)spinnerImages;
- (int64_t)_spokeCount;
- (int64_t)_spokeFrameRatio;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation CAActivityIndicatorLayer

- (CAActivityIndicatorLayer)initWithColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAActivityIndicatorLayer;
  v6 = [(CAActivityIndicatorLayer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_spokeFrameRatio = 2;
    v6->_spokeCount = 8;
    objc_storeStrong((id *)&v6->_uiColor, a3);
    v7->_color = [(UIColor *)v7->_uiColor CGColor];
  }

  return v7;
}

- (id)spinnerImages
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CAActivityIndicatorLayer_spinnerImages__block_invoke;
  v3[3] = &unk_1E6DD74F8;
  v3[4] = self;
  v3[5] = a2;
  if (spinnerImages_onceToken != -1) {
    dispatch_once(&spinnerImages_onceToken, v3);
  }
  return (id)spinnerImages__spinnerImages;
}

void __41__CAActivityIndicatorLayer_spinnerImages__block_invoke(uint64_t a1)
{
  v2 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v2 = _asvLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1E2840000, v2, OS_LOG_TYPE_INFO, "#Inline: Creating spinner images", v10, 2u);
  }
  v3 = objc_opt_new();
  for (uint64_t i = 0; i != 16; ++i)
  {
    id v5 = [*(id *)(a1 + 32) imageForStep:i withColor:*(void *)(*(void *)(a1 + 32) + 48)];
    uint64_t v6 = [v5 CGImage];

    if (!v6)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"CAActivityIndicatorLayer.m" lineNumber:74 description:@"Expect image to be generated"];
    }
    [v3 addObject:v6];
  }
  uint64_t v8 = [v3 copy];
  objc_super v9 = (void *)spinnerImages__spinnerImages;
  spinnerImages__spinnerImages = v8;
}

- (void)startAnimating
{
  id v5 = [(CAActivityIndicatorLayer *)self spinnerImages];
  v3 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"contents"];
  [v3 setCalculationMode:*MEMORY[0x1E4F39D78]];
  [v3 setDuration:0.800000012];
  LODWORD(v4) = 2139095040;
  [v3 setRepeatCount:v4];
  [v3 setValues:v5];
  [(CAActivityIndicatorLayer *)self addAnimation:v3 forKey:@"contents"];
}

- (void)stopAnimating
{
  [(CAActivityIndicatorLayer *)self removeAllAnimations];
  [(CAActivityIndicatorLayer *)self setContents:0];
}

- (BOOL)isAnimating
{
  v2 = [(CAActivityIndicatorLayer *)self animationKeys];
  char v3 = [v2 containsObject:@"contents"];

  return v3;
}

- (double)_spokeWidthForGearWidth:(double)a3
{
  double v3 = 1.0;
  if (a3 == 14.0) {
    return v3;
  }
  if (a3 == 20.0)
  {
    BOOL v4 = self->_spokeCount == 12;
    double v5 = 1.25;
    double v3 = 1.0;
    goto LABEL_4;
  }
  double v3 = 1.75;
  if (a3 == 30.0) {
    return v3;
  }
  double v3 = 2.0;
  if (a3 == 32.0) {
    return v3;
  }
  if (a3 == 37.0)
  {
    BOOL v4 = self->_spokeCount == 12;
    double v5 = 2.5;
    double v3 = 1.5;
LABEL_4:
    if (!v4) {
      return v5;
    }
    return v3;
  }
  double v3 = 3.5;
  if (a3 != 60.0)
  {
    double v7 = nearbyint(a3 / 7.5) * 0.5;
    double v3 = 1.0;
    if (v7 >= 1.0) {
      return v7;
    }
  }
  return v3;
}

- (double)_spokeLengthForGearWidth:(double)a3
{
  if (a3 != 20.0) {
    return nearbyint(a3 * 0.25);
  }
  [(CAActivityIndicatorLayer *)self contentsScale];
  return round(v5 * 6.5 / v5);
}

- (double)_widthForGearWidth:(double)result
{
  if (result == 37.0) {
    return 35.0;
  }
  return result;
}

- (double)_alphaValueForStep:(int64_t)a3
{
  int64_t v5 = [(CAActivityIndicatorLayer *)self _spokeCount];
  int64_t v6 = [(CAActivityIndicatorLayer *)self _spokeFrameRatio] * v5;
  double result = 1.0;
  if ((unint64_t)(v6 - 2) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    double result = (double)a3 * (-0.68 / (double)(v6 / 2)) + 1.0;
    if (result < 0.32) {
      return 0.32;
    }
  }
  return result;
}

- (id)imageForStep:(int64_t)a3 withColor:(CGColor *)a4
{
  [(CAActivityIndicatorLayer *)self _spokeWidthForGearWidth:20.0];
  double v8 = v7;
  [(CAActivityIndicatorLayer *)self _spokeLengthForGearWidth:20.0];
  double v10 = v9;
  int64_t spokeCount = self->_spokeCount;
  [(CAActivityIndicatorLayer *)self _widthForGearWidth:20.0];
  double v13 = v12 * 0.5;
  v14 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, v12 * 0.5 - v8, v10, v8 + v8, v8);
  [(CAActivityIndicatorLayer *)self _widthForGearWidth:20.0];
  double v16 = v15;
  v33.width = 20.0;
  v33.height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v33, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  size_t NumberOfComponents = CGColorGetNumberOfComponents(a4);
  Components = CGColorGetComponents(a4);
  if (NumberOfComponents) {
    double v20 = Components[NumberOfComponents - 1];
  }
  else {
    double v20 = 1.0;
  }
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, 0.0, 0.0);
  int64_t v21 = [(CAActivityIndicatorLayer *)self _spokeFrameRatio];
  int64_t v22 = [(CAActivityIndicatorLayer *)self _spokeFrameRatio];
  if (spokeCount >= 1)
  {
    uint64_t v23 = 0;
    int64_t v24 = a3 % v21;
    int64_t v25 = a3 / v22;
    do
    {
      int64_t v26 = v24 + [(CAActivityIndicatorLayer *)self _spokeFrameRatio] * (v25 + v23);
      int64_t v27 = v26 % ([(CAActivityIndicatorLayer *)self _spokeFrameRatio] * spokeCount);
      CGContextSaveGState(CurrentContext);
      CGContextTranslateCTM(CurrentContext, v13, v13);
      CGContextRotateCTM(CurrentContext, -6.28318531 / (double)spokeCount * (double)(int)v23);
      CGContextTranslateCTM(CurrentContext, -v13, -v13);
      [(CAActivityIndicatorLayer *)self _alphaValueForStep:v27];
      CopyWithAlpha = CGColorCreateCopyWithAlpha(a4, v20 * v28);
      CGContextSetFillColorWithColor(CurrentContext, CopyWithAlpha);
      CGContextSetStrokeColorWithColor(CurrentContext, CopyWithAlpha);
      [v14 fillWithBlendMode:17 alpha:0.85];
      CGContextRestoreGState(CurrentContext);
      ++v23;
    }
    while (spokeCount != v23);
  }
  CGContextTranslateCTM(CurrentContext, (20.0 - v16) * -0.5, (20.0 - v16) * -0.5);
  CGContextRestoreGState(CurrentContext);
  v30 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v30;
}

- (int64_t)_spokeCount
{
  return self->_spokeCount;
}

- (int64_t)_spokeFrameRatio
{
  return self->_spokeFrameRatio;
}

- (void).cxx_destruct
{
}

@end