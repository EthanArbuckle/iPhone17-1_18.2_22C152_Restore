@interface CEKLightingCubeMutableAppearance
- (CGColor)bottomFill;
- (CGColor)stroke;
- (CGColor)topFill;
- (CGColor)verticalFillColor;
- (CGGradient)background;
- (CGGradient)bottomInnerGlow;
- (CGGradient)bottomMask;
- (CGGradient)bottomOuterGlow;
- (CGGradient)topGlow;
- (CGGradient)topMask;
- (CGGradient)topOver;
- (double)verticalFillBackIntensity;
- (double)verticalFillFrontIntensity;
- (void)setBackground:(CGGradient *)a3;
- (void)setBottomFill:(CGColor *)a3;
- (void)setBottomInnerGlow:(CGGradient *)a3;
- (void)setBottomMask:(CGGradient *)a3;
- (void)setBottomOuterGlow:(CGGradient *)a3;
- (void)setStroke:(CGColor *)a3;
- (void)setTopFill:(CGColor *)a3;
- (void)setTopGlow:(CGGradient *)a3;
- (void)setTopMask:(CGGradient *)a3;
- (void)setTopOver:(CGGradient *)a3;
- (void)setVerticalFillBackIntensity:(double)a3;
- (void)setVerticalFillColor:(CGColor *)a3;
- (void)setVerticalFillFrontIntensity:(double)a3;
@end

@implementation CEKLightingCubeMutableAppearance

- (CGGradient)background
{
  return self->super._background;
}

- (void)setBackground:(CGGradient *)a3
{
  background = self->super._background;
  if (background != a3)
  {
    CGGradientRelease(background);
    self->super._background = CGGradientRetain(a3);
  }
}

- (CGColor)topFill
{
  return self->super._topFill;
}

- (void)setTopFill:(CGColor *)a3
{
  topFill = self->super._topFill;
  if (topFill != a3)
  {
    CGColorRelease(topFill);
    self->super._topFill = CGColorRetain(a3);
  }
}

- (CGGradient)topGlow
{
  return self->super._topGlow;
}

- (void)setTopGlow:(CGGradient *)a3
{
  topGlow = self->super._topGlow;
  if (topGlow != a3)
  {
    CGGradientRelease(topGlow);
    self->super._topGlow = CGGradientRetain(a3);
  }
}

- (CGGradient)topMask
{
  return self->super._topMask;
}

- (void)setTopMask:(CGGradient *)a3
{
  topMask = self->super._topMask;
  if (topMask != a3)
  {
    CGGradientRelease(topMask);
    self->super._topMask = CGGradientRetain(a3);
  }
}

- (CGColor)bottomFill
{
  return self->super._bottomFill;
}

- (void)setBottomFill:(CGColor *)a3
{
  bottomFill = self->super._bottomFill;
  if (bottomFill != a3)
  {
    CGColorRelease(bottomFill);
    self->super._bottomFill = CGColorRetain(a3);
  }
}

- (CGGradient)bottomInnerGlow
{
  return self->super._bottomInnerGlow;
}

- (void)setBottomInnerGlow:(CGGradient *)a3
{
  bottomInnerGlow = self->super._bottomInnerGlow;
  if (bottomInnerGlow != a3)
  {
    CGGradientRelease(bottomInnerGlow);
    self->super._bottomInnerGlow = CGGradientRetain(a3);
  }
}

- (CGGradient)bottomOuterGlow
{
  return self->super._bottomOuterGlow;
}

- (void)setBottomOuterGlow:(CGGradient *)a3
{
  bottomOuterGlow = self->super._bottomOuterGlow;
  if (bottomOuterGlow != a3)
  {
    CGGradientRelease(bottomOuterGlow);
    self->super._bottomOuterGlow = CGGradientRetain(a3);
  }
}

- (CGGradient)bottomMask
{
  return self->super._bottomMask;
}

- (void)setBottomMask:(CGGradient *)a3
{
  bottomMask = self->super._bottomMask;
  if (bottomMask != a3)
  {
    CGGradientRelease(bottomMask);
    self->super._bottomMask = CGGradientRetain(a3);
  }
}

- (CGGradient)topOver
{
  return self->super._topOver;
}

- (void)setTopOver:(CGGradient *)a3
{
  topOver = self->super._topOver;
  if (topOver != a3)
  {
    CGGradientRelease(topOver);
    self->super._topOver = CGGradientRetain(a3);
  }
}

- (CGColor)verticalFillColor
{
  return self->super._verticalFillColor;
}

- (void)setVerticalFillColor:(CGColor *)a3
{
  verticalFillColor = self->super._verticalFillColor;
  if (verticalFillColor != a3)
  {
    CGColorRelease(verticalFillColor);
    self->super._verticalFillColor = CGColorRetain(a3);
  }
}

- (double)verticalFillFrontIntensity
{
  return self->super._verticalFillFrontIntensity;
}

- (void)setVerticalFillFrontIntensity:(double)a3
{
  self->super._verticalFillFrontIntensity = a3;
}

- (double)verticalFillBackIntensity
{
  return self->super._verticalFillBackIntensity;
}

- (void)setVerticalFillBackIntensity:(double)a3
{
  self->super._verticalFillBackIntensity = a3;
}

- (CGColor)stroke
{
  return self->super._stroke;
}

- (void)setStroke:(CGColor *)a3
{
  stroke = self->super._stroke;
  if (stroke != a3)
  {
    CGColorRelease(stroke);
    self->super._stroke = CGColorRetain(a3);
  }
}

@end