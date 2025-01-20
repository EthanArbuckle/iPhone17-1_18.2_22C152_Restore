@interface HKGradientFillStyle
- (BOOL)_needsRenderForSize:(CGSize)a3;
- (HKGradientFillStyle)initWithFirstColor:(id)a3 secondColor:(id)a4;
- (HKGradientFillStyle)initWithFirstColor:(id)a3 secondColor:(id)a4 fillPercentage:(double)a5 fillDirection:(int64_t)a6 gradientSize:(double)a7;
- (NSLock)gradientFillStyleLock;
- (UIColor)firstColor;
- (UIColor)secondColor;
- (UIImage)cachedImageStorage;
- (double)fillPercentage;
- (double)gradientSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fillImageWithHeight:(double)a3;
- (id)fillImageWithWidth:(double)a3;
- (int64_t)fillDirection;
- (void)_renderCacheIfNecessaryForHeight:(double)a3;
- (void)_renderCacheIfNecessaryForSize:(CGSize)a3;
- (void)_renderCacheIfNecessaryForWidth:(double)a3;
- (void)_renderInContext:(CGContext *)a3 size:(CGSize)a4;
- (void)clearCache;
- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6;
@end

@implementation HKGradientFillStyle

- (HKGradientFillStyle)initWithFirstColor:(id)a3 secondColor:(id)a4
{
  return [(HKGradientFillStyle *)self initWithFirstColor:a3 secondColor:a4 fillPercentage:0 fillDirection:1.0 gradientSize:0.0];
}

- (HKGradientFillStyle)initWithFirstColor:(id)a3 secondColor:(id)a4 fillPercentage:(double)a5 fillDirection:(int64_t)a6 gradientSize:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HKGradientFillStyle;
  v15 = [(HKGradientFillStyle *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_firstColor, a3);
    objc_storeStrong((id *)&v16->_secondColor, a4);
    double v17 = 0.0;
    if (a5 >= 0.0) {
      double v17 = a5;
    }
    v16->_fillPercentage = fmin(v17, 1.0);
    v16->_fillDirection = a6;
    v16->_gradientSize = a7;
    v18 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    gradientFillStyleLock = v16->_gradientFillStyleLock;
    v16->_gradientFillStyleLock = v18;

    [(NSLock *)v16->_gradientFillStyleLock setName:@"HKGradientFillStyleLock"];
    cachedImageStorage = v16->_cachedImageStorage;
    v16->_cachedImageStorage = 0;
  }
  return v16;
}

- (void)clearCache
{
  v6.receiver = self;
  v6.super_class = (Class)HKGradientFillStyle;
  [(HKFillStyle *)&v6 clearCache];
  v3 = [(HKGradientFillStyle *)self gradientFillStyleLock];
  [v3 lock];

  cachedImageStorage = self->_cachedImageStorage;
  self->_cachedImageStorage = 0;

  v5 = [(HKGradientFillStyle *)self gradientFillStyleLock];
  [v5 unlock];
}

- (id)fillImageWithHeight:(double)a3
{
  v5 = [(HKGradientFillStyle *)self gradientFillStyleLock];
  [v5 lock];

  [(HKGradientFillStyle *)self _renderCacheIfNecessaryForHeight:a3];
  objc_super v6 = self->_cachedImageStorage;
  v7 = [(HKGradientFillStyle *)self gradientFillStyleLock];
  [v7 unlock];

  return v6;
}

- (id)fillImageWithWidth:(double)a3
{
  v5 = [(HKGradientFillStyle *)self gradientFillStyleLock];
  [v5 lock];

  [(HKGradientFillStyle *)self _renderCacheIfNecessaryForWidth:a3];
  objc_super v6 = self->_cachedImageStorage;
  v7 = [(HKGradientFillStyle *)self gradientFillStyleLock];
  [v7 unlock];

  return v6;
}

- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGContextSaveGState(a4);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  id v14 = [(HKGradientFillStyle *)self fillImageWithHeight:CGRectGetHeight(v16)];
  CGContextAddPath(a4, a3);
  CGContextClip(a4);
  objc_msgSend(v14, "drawInRect:blendMode:alpha:", 0, x, y, width, height, a6);
  CGContextRestoreGState(a4);
}

- (void)_renderCacheIfNecessaryForHeight:(double)a3
{
}

- (void)_renderCacheIfNecessaryForWidth:(double)a3
{
}

- (void)_renderCacheIfNecessaryForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (-[HKGradientFillStyle _needsRenderForSize:](self, "_needsRenderForSize:"))
  {
    objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__HKGradientFillStyle__renderCacheIfNecessaryForSize___block_invoke;
    v9[3] = &unk_1E6D53D88;
    v9[4] = self;
    *(double *)&v9[5] = width;
    *(double *)&v9[6] = height;
    v7 = [v6 imageWithActions:v9];
    cachedImageStorage = self->_cachedImageStorage;
    self->_cachedImageStorage = v7;
  }
}

uint64_t __54__HKGradientFillStyle__renderCacheIfNecessaryForSize___block_invoke(double *a1, void *a2)
{
  v3 = (void *)*((void *)a1 + 4);
  uint64_t v4 = [a2 CGContext];
  double v5 = a1[5];
  double v6 = a1[6];
  return objc_msgSend(v3, "_renderInContext:size:", v4, v5, v6);
}

- (BOOL)_needsRenderForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  cachedImageStorage = self->_cachedImageStorage;
  [(UIImage *)cachedImageStorage size];
  BOOL v9 = width != v7 || cachedImageStorage == 0;
  return height != v6 || v9;
}

- (void)_renderInContext:(CGContext *)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  locations[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  CGContextSaveGState(a3);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double fillPercentage = self->_fillPercentage;
  locations[0] = 0.0;
  locations[1] = fillPercentage;
  v23[0] = [(UIColor *)self->_firstColor CGColor];
  v23[1] = [(UIColor *)self->_secondColor CGColor];
  CFArrayRef v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v11 = CGGradientCreateWithColors(DeviceRGB, v10, locations);
  double gradientSize = self->_gradientSize;
  double v14 = *MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  switch(self->_fillDirection)
  {
    case 0:
      if (gradientSize <= 0.00000011920929) {
        double v15 = height;
      }
      else {
        double v15 = self->_gradientSize;
      }
      double v16 = 0.0;
      break;
    case 1:
      if (gradientSize <= 0.00000011920929) {
        double v17 = height;
      }
      else {
        double v17 = self->_gradientSize;
      }
      double v15 = height - v17;
      double v16 = 0.0;
      double v13 = height;
      double v14 = 0.0;
      break;
    case 2:
      if (gradientSize <= 0.00000011920929) {
        double v16 = width;
      }
      else {
        double v16 = self->_gradientSize;
      }
      double v15 = 0.0;
      break;
    case 3:
      if (gradientSize <= 0.00000011920929) {
        double v18 = width;
      }
      else {
        double v18 = self->_gradientSize;
      }
      double v16 = width - v18;
      double v15 = 0.0;
      double v13 = 0.0;
      double v14 = width;
      break;
    default:
      double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v16 = *MEMORY[0x1E4F1DAD8];
      break;
  }
  CGContextSaveGState(a3);
  v27.origin.double x = 0.0;
  v27.origin.double y = 0.0;
  v27.size.double width = width;
  v27.size.double height = height;
  CGContextAddRect(a3, v27);
  CGContextClip(a3);
  v25.double x = v14;
  v25.double y = v13;
  v26.double x = v16;
  v26.double y = v15;
  CGContextDrawLinearGradient(a3, v11, v25, v26, 0);
  if (gradientSize > 0.00000011920929)
  {
    CGContextSetFillColorWithColor(a3, [(UIColor *)self->_secondColor CGColor]);
    switch(self->_fillDirection)
    {
      case 0:
      case 2:
        double v19 = v16;
        double v20 = v15;
        goto LABEL_23;
      case 1:
      case 3:
        double v16 = v14 - v16;
        double v15 = v13 - v15;
        double v19 = 0.0;
        double v20 = 0.0;
LABEL_23:
        double v21 = height - v15;
        double v22 = width - v16;
        CGContextFillRect(a3, *(CGRect *)&v19);
        break;
      default:
        break;
    }
  }
  CGContextRestoreGState(a3);
  CGGradientRelease(v11);
  CGColorSpaceRelease(DeviceRGB);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKGradientFillStyle;
  uint64_t v4 = [(HKFillStyle *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 1, self->_firstColor);
  objc_storeStrong(v4 + 2, self->_secondColor);
  v4[3] = *(id *)&self->_fillPercentage;
  v4[4] = self->_fillDirection;
  v4[5] = *(id *)&self->_gradientSize;
  objc_storeStrong(v4 + 7, self->_cachedImageStorage);
  return v4;
}

- (UIColor)firstColor
{
  return self->_firstColor;
}

- (UIColor)secondColor
{
  return self->_secondColor;
}

- (double)fillPercentage
{
  return self->_fillPercentage;
}

- (int64_t)fillDirection
{
  return self->_fillDirection;
}

- (double)gradientSize
{
  return self->_gradientSize;
}

- (NSLock)gradientFillStyleLock
{
  return self->_gradientFillStyleLock;
}

- (UIImage)cachedImageStorage
{
  return self->_cachedImageStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImageStorage, 0);
  objc_storeStrong((id *)&self->_gradientFillStyleLock, 0);
  objc_storeStrong((id *)&self->_secondColor, 0);
  objc_storeStrong((id *)&self->_firstColor, 0);
}

@end