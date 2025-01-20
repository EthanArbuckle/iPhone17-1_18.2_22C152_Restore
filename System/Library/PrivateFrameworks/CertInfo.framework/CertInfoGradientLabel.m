@interface CertInfoGradientLabel
- (CGColor)_patternColor;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (UIFont)font;
- (UIImage)gradient;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)setGradient:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CertInfoGradientLabel

- (void)dealloc
{
  patternColor = self->_patternColor;
  if (patternColor) {
    CFRelease(patternColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)CertInfoGradientLabel;
  [(CertInfoGradientLabel *)&v4 dealloc];
}

- (UIFont)font
{
  font = self->_font;
  if (font)
  {
    v3 = font;
  }
  else
  {
    v3 = [MEMORY[0x263F1C658] systemFontOfSize:17.0];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  text = self->_text;
  objc_super v4 = [(CertInfoGradientLabel *)self font];
  -[NSString _legacy_sizeWithFont:constrainedToSize:lineBreakMode:](text, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v4, 4, *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setGradient:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v5 = (UIImage *)a3;
  p_gradient = &self->_gradient;
  if (self->_gradient != v5)
  {
    objc_storeStrong((id *)&self->_gradient, a3);
    patternColor = self->_patternColor;
    if (patternColor) {
      CFRelease(patternColor);
    }
    self->_patternColor = 0;
    if ([(UIImage *)*p_gradient CGImage])
    {
      Pattern = CGColorSpaceCreatePattern(0);
      [(UIImage *)*p_gradient scale];
      memset(&v12, 0, sizeof(v12));
      long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v13.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v13.c = v9;
      *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGAffineTransformScale(&v12, &v13, 1.0 / v10, -1.0 / v10);
      CGAffineTransform v13 = v12;
      v11 = (CGPattern *)CGPatternCreateWithImage2();
      *(_OWORD *)&v13.a = xmmword_218616F30;
      *(_OWORD *)&v13.c = unk_218616F40;
      self->_patternColor = CGColorCreateWithPattern(Pattern, v11, &v13.a);
      if (Pattern) {
        CFRelease(Pattern);
      }
      if (v11) {
        CFRelease(v11);
      }
    }
  }
}

- (CGColor)_patternColor
{
  return self->_patternColor;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CurrentContext = UIGraphicsGetCurrentContext();
  double v5 = [(CertInfoGradientLabel *)self text];
  double v6 = [(CertInfoGradientLabel *)self font];
  [(CertInfoGradientLabel *)self bounds];
  double v8 = v7;
  double v10 = v9;
  v11[0] = xmmword_218616F50;
  v11[1] = unk_218616F60;
  CGContextSetFillColor(CurrentContext, (const CGFloat *)v11);
  objc_msgSend(v5, "_legacy_drawAtPoint:withFont:", v6, v8, v10);
  CGContextSetFillColorWithColor(CurrentContext, [(CertInfoGradientLabel *)self _patternColor]);
  CGContextSaveGState(CurrentContext);
  v13.width = v8;
  v13.height = v10;
  CGContextSetPatternPhase(CurrentContext, v13);
  objc_msgSend(v5, "_legacy_drawAtPoint:withFont:", v6, v8, v10);
  CGContextRestoreGState(CurrentContext);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void)setFont:(id)a3
{
}

- (UIImage)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end