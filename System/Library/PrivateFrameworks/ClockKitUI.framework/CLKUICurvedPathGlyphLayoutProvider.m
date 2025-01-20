@interface CLKUICurvedPathGlyphLayoutProvider
- (CGAffineTransform)makeTransform;
- (CGPoint)layoutLocation;
- (CLKUICurvedPathGlyphLayoutProvider)init;
- (UIBezierPath)path;
- (double)baselineOffset;
- (double)extraWidthForImage;
- (double)maxTextWidth;
- (double)usedWidth;
- (int64_t)textAlignment;
- (void)setBaselineOffset:(double)a3;
- (void)setExtraWidthForImage:(double)a3;
- (void)setLayoutLocation:(CGPoint)a3;
- (void)setPath:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setUsedWidth:(double)a3;
@end

@implementation CLKUICurvedPathGlyphLayoutProvider

- (CLKUICurvedPathGlyphLayoutProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLKUICurvedPathGlyphLayoutProvider;
  v2 = [(CLKUICurvedPathGlyphLayoutProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CLKUIBezierPathStepper);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *((void *)v2 + 2) = 0;
    *((void *)v2 + 5) = 0;
    *((void *)v2 + 7) = 1;
    *(_OWORD *)(v2 + 72) = *MEMORY[0x1E4F1DAD8];
  }
  return (CLKUICurvedPathGlyphLayoutProvider *)v2;
}

- (void)setPath:(id)a3
{
  objc_super v6 = (UIBezierPath *)a3;
  if (self->_path != v6)
  {
    objc_storeStrong((id *)&self->_path, a3);
    [(CLKUIBezierPathStepper *)self->_pathStepper setPath:v6];
    [(CLKUIBezierPathStepper *)self->_pathStepper totalLength];
    self->_pathLength = v5;
  }
}

- (void)setUsedWidth:(double)a3
{
  if (self->_usedWidth != a3)
  {
    self->_usedWidth = a3;
    double v3 = 0.0;
    switch(self->_textAlignment)
    {
      case 0:
        goto LABEL_5;
      case 1:
      case 3:
      case 4:
        double v3 = (self->_pathLength - a3) * 0.5;
        goto LABEL_5;
      case 2:
        double v3 = self->_pathLength - a3;
LABEL_5:
        self->_startOffset = v3;
        break;
      default:
        return;
    }
  }
}

- (double)maxTextWidth
{
  return self->_pathLength - self->_extraWidthForImage;
}

- (CGAffineTransform)makeTransform
{
  v22[1] = *MEMORY[0x1E4F143B8];
  pathStepper = self->_pathStepper;
  objc_super v6 = [NSNumber numberWithDouble:self->_startOffset + self->_layoutLocation.x];
  v22[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v8 = [(CLKUIBezierPathStepper *)pathStepper mapOffsetsToPathPositions:v7];

  v9 = [v8 firstObject];
  [v9 tangent];
  double v11 = v10;

  v12 = [v8 firstObject];
  [v12 tangent];
  double v14 = v13;

  v15 = [v8 firstObject];
  [v15 point];
  CGFloat v17 = v16 + self->_baselineOffset * v14;

  v18 = [v8 firstObject];
  [v18 point];
  CGFloat v20 = v19 - self->_baselineOffset * v11;

  retstr->a = v11;
  retstr->b = v14;
  retstr->c = -v14;
  retstr->d = v11;
  retstr->tx = v17;
  retstr->ty = v20;

  return result;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (double)extraWidthForImage
{
  return self->_extraWidthForImage;
}

- (void)setExtraWidthForImage:(double)a3
{
  self->_extraWidthForImage = a3;
}

- (double)usedWidth
{
  return self->_usedWidth;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (CGPoint)layoutLocation
{
  double x = self->_layoutLocation.x;
  double y = self->_layoutLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLayoutLocation:(CGPoint)a3
{
  self->_layoutLocation = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathStepper, 0);
}

@end