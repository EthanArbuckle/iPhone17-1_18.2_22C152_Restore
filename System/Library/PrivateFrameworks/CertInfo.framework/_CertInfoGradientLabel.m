@interface _CertInfoGradientLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (_CertInfoGradientLabel)initWithTrusted:(BOOL)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
@end

@implementation _CertInfoGradientLabel

- (_CertInfoGradientLabel)initWithTrusted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)_CertInfoGradientLabel;
  v4 = -[_CertInfoGradientLabel initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v4)
  {
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    v7 = v6;
    if (v3) {
      v8 = @"TRUSTED";
    }
    else {
      v8 = @"NOT_TRUSTED";
    }
    uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26C9B5AF8 table:@"CertInfo"];
    text = v4->_text;
    v4->_text = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x263F1C658] boldSystemFontOfSize:15.0];
    font = v4->_font;
    v4->_font = (UIFont *)v11;

    [(_CertInfoGradientLabel *)v4 setBackgroundColor:0];
    [(_CertInfoGradientLabel *)v4 setOpaque:0];
    if (v3)
    {
      uint64_t v13 = [MEMORY[0x263F1C6B0] imageNamed:@"TrustedCheckmark" inBundle:v5];
      checkImage = v4->_checkImage;
      v4->_checkImage = (UIImage *)v13;

      v15 = @"TrustedTextGradient";
    }
    else
    {
      v15 = @"NotTrustedTextGradient";
    }
    id v16 = [MEMORY[0x263F1C6B0] imageNamed:v15 inBundle:v5];
    if ([v16 CGImage])
    {
      Pattern = CGColorSpaceCreatePattern(0);
      [v16 scale];
      memset(&v22, 0, sizeof(v22));
      long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v24.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v24.c = v18;
      *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGAffineTransformScale(&v22, &v24, 1.0 / v19, -1.0 / v19);
      CGAffineTransform v24 = v22;
      v20 = (CGPattern *)CGPatternCreateWithImage2();
      *(_OWORD *)&v24.a = xmmword_218616FD0;
      *(_OWORD *)&v24.c = unk_218616FE0;
      v4->_patternColor = CGColorCreateWithPattern(Pattern, v20, &v24.a);
      if (Pattern) {
        CFRelease(Pattern);
      }
      if (v20) {
        CFRelease(v20);
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  patternColor = self->_patternColor;
  if (patternColor) {
    CFRelease(patternColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)_CertInfoGradientLabel;
  [(_CertInfoGradientLabel *)&v4 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[NSString _legacy_sizeWithFont:constrainedToSize:lineBreakMode:](self->_text, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", self->_font, 4, *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  double v5 = v4;
  double v7 = v6;
  checkImage = self->_checkImage;
  if (checkImage)
  {
    [(UIImage *)checkImage size];
    double v5 = v5 + v9 + 2.0;
  }
  double v10 = v5;
  double v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CurrentContext = UIGraphicsGetCurrentContext();
  [(_CertInfoGradientLabel *)self bounds];
  double v7 = v6;
  checkImage = self->_checkImage;
  if (checkImage)
  {
    [(UIImage *)checkImage size];
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = self->_checkImage;
    [(_CertInfoGradientLabel *)self bounds];
    -[UIImage drawAtPoint:](v13, "drawAtPoint:", 0.0, (v14 - v12) * 0.5);
    double v15 = v10 + 2.0;
  }
  else
  {
    double v15 = v5;
  }
  v16[0] = xmmword_218616FF0;
  v16[1] = unk_218617000;
  CGContextSetFillColor(CurrentContext, (const CGFloat *)v16);
  -[NSString _legacy_drawAtPoint:withFont:](self->_text, "_legacy_drawAtPoint:withFont:", self->_font, v15, v7);
  CGContextSetFillColorWithColor(CurrentContext, self->_patternColor);
  CGContextSaveGState(CurrentContext);
  v18.width = v15;
  v18.height = v7;
  CGContextSetPatternPhase(CurrentContext, v18);
  -[NSString _legacy_drawAtPoint:withFont:](self->_text, "_legacy_drawAtPoint:withFont:", self->_font, v15, v7);
  CGContextRestoreGState(CurrentContext);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkImage, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end