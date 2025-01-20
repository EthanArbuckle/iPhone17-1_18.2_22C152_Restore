@interface ABShadowView
- (ABShadowView)initWithFrame:(CGRect)a3;
- (CGImage)_renderBottomVariableBlurMaskWithSize:(CGSize)a3;
- (void)_setupGradient;
- (void)layoutSubviews;
- (void)setTopShadowRatio:(double)a3;
@end

@implementation ABShadowView

- (ABShadowView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ABShadowView;
  v3 = -[ABShadowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_topShadowRatio = 0.5;
    [(ABShadowView *)v3 _setupGradient];
  }
  return v4;
}

- (void)_setupGradient
{
  v37[16] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F157D0] layer];
  topGradientLayer = self->_topGradientLayer;
  self->_topGradientLayer = v3;

  id v33 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.00392156863];
  v37[0] = [v33 CGColor];
  id v32 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0143711881];
  v37[1] = [v32 CGColor];
  id v31 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0442915775];
  v37[2] = [v31 CGColor];
  id v30 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0728674787];
  v37[3] = [v30 CGColor];
  id v29 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.114800887];
  v37[4] = [v29 CGColor];
  id v28 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.173203094];
  v37[5] = [v28 CGColor];
  id v27 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.250244738];
  v37[6] = [v27 CGColor];
  id v26 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.346236755];
  v37[7] = [v26 CGColor];
  id v25 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.458754447];
  v37[8] = [v25 CGColor];
  id v5 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.707279774];
  v37[9] = [v5 CGColor];
  id v6 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.822990973];
  v37[10] = [v6 CGColor];
  id v7 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.917060124];
  v37[11] = [v7 CGColor];
  id v8 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.952464435];
  v37[12] = [v8 CGColor];
  id v9 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.978587023];
  v37[13] = [v9 CGColor];
  id v10 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.994603225];
  v37[14] = [v10 CGColor];
  id v11 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v37[15] = [v11 CGColor];
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:16];
  [(CAGradientLayer *)self->_topGradientLayer setColors:v12];

  [(CAGradientLayer *)self->_topGradientLayer setLocations:&unk_26FB8E7C0];
  CATransform3DMakeScale(&v35, 1.0, -1.0, 1.0);
  v13 = self->_topGradientLayer;
  CATransform3D v34 = v35;
  [(CAGradientLayer *)v13 setTransform:&v34];
  v14 = [(ABShadowView *)self layer];
  [v14 addSublayer:self->_topGradientLayer];

  v15 = [MEMORY[0x263F15758] layer];
  bottomVariableBlurLayer = self->_bottomVariableBlurLayer;
  self->_bottomVariableBlurLayer = v15;

  v17 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DB0]];
  v36 = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  [(CABackdropLayer *)self->_bottomVariableBlurLayer setFilters:v18];

  [(CABackdropLayer *)self->_bottomVariableBlurLayer setValue:&unk_26FB8E550 forKeyPath:@"filters.variableBlur.inputRadius"];
  [(CABackdropLayer *)self->_bottomVariableBlurLayer setValue:MEMORY[0x263EFFA88] forKeyPath:@"filters.variableBlur.inputNormalizeEdges"];
  v19 = [(ABShadowView *)self layer];
  [v19 addSublayer:self->_bottomVariableBlurLayer];

  v20 = [MEMORY[0x263F157D0] layer];
  bottomGradientLayer = self->_bottomGradientLayer;
  self->_bottomGradientLayer = v20;

  v22 = [(CAGradientLayer *)self->_topGradientLayer colors];
  [(CAGradientLayer *)self->_bottomGradientLayer setColors:v22];

  v23 = [(CAGradientLayer *)self->_topGradientLayer locations];
  [(CAGradientLayer *)self->_bottomGradientLayer setLocations:v23];

  v24 = [(ABShadowView *)self layer];
  [v24 addSublayer:self->_bottomGradientLayer];
}

- (void)setTopShadowRatio:(double)a3
{
  if (a1)
  {
    if (*((double *)a1 + 54) != a3)
    {
      *((double *)a1 + 54) = a3;
      return (void *)[a1 setNeedsLayout];
    }
  }
  return a1;
}

- (void)layoutSubviews
{
  [(ABShadowView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = v5 * 0.75;
  -[CAGradientLayer setFrame:](self->_topGradientLayer, "setFrame:", 0.0, 0.0);
  [(ABShadowView *)self bounds];
  -[CAGradientLayer setFrame:](self->_bottomGradientLayer, "setFrame:", 0.0, v6 - v7);
  [(CABackdropLayer *)self->_bottomVariableBlurLayer frame];
  double v8 = v6 * 0.45;
  double v9 = v6 - v6 * 0.45;
  v14.origin.x = 0.0;
  v14.origin.y = v9;
  v14.size.width = v4;
  v14.size.height = v8;
  if (!CGRectEqualToRect(v13, v14))
  {
    -[CABackdropLayer setFrame:](self->_bottomVariableBlurLayer, "setFrame:", 0.0, v9, v4, v8);
    id v10 = -[ABShadowView _renderBottomVariableBlurMaskWithSize:](self, "_renderBottomVariableBlurMaskWithSize:", v4, v8);
    bottomVariableBlurLayer = self->_bottomVariableBlurLayer;
    [(CABackdropLayer *)bottomVariableBlurLayer setValue:v10 forKeyPath:@"filters.variableBlur.inputMaskImage"];
  }
}

- (CGImage)_renderBottomVariableBlurMaskWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  double v7 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  double v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:32];
  LODWORD(v9) = 1053609165;
  LODWORD(v10) = 1.0;
  LODWORD(v11) = 1.0;
  v12 = [MEMORY[0x263F15808] functionWithControlPoints:v9 :0.0 :v10 :v11];
  CGRect v13 = (CGFloat *)malloc_type_malloc(0x100uLL, 0x100004000313F17uLL);
  for (uint64_t i = 0; i != 32; ++i)
  {
    double v15 = (double)i;
    double v16 = (double)i / 31.0;
    *(float *)&double v15 = v16;
    [v12 _solveForInput:v15];
    v13[i] = v17;
    id v18 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0 - v16];
    objc_msgSend(v8, "addObject:", objc_msgSend(v18, "CGColor"));
  }
  v19 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v8, v13);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.double width = width;
  v24.size.double height = height;
  CGContextClearRect(v7, v24);
  v22.x = 0.0;
  v22.y = 0.0;
  v23.x = 0.0;
  v23.y = height;
  CGContextDrawLinearGradient(v7, v19, v22, v23, 3u);
  CGImageRef Image = CGBitmapContextCreateImage(v7);
  CFAutorelease(Image);
  if (DeviceRGB) {
    CFRelease(DeviceRGB);
  }
  if (v19) {
    CFRelease(v19);
  }
  free(v13);
  if (v7) {
    CFRelease(v7);
  }

  return Image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomVariableBlurLayer, 0);
  objc_storeStrong((id *)&self->_bottomGradientLayer, 0);

  objc_storeStrong((id *)&self->_topGradientLayer, 0);
}

@end