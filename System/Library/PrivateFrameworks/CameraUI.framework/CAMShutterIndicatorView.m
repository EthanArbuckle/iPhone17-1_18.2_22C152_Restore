@interface CAMShutterIndicatorView
- (CAMShutterIndicatorView)initWithCoder:(id)a3;
- (CAMShutterIndicatorView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (NSAttributedString)_indicatorText;
- (void)_commonCAMShutterIndicatorViewInitialization;
- (void)drawRect:(CGRect)a3;
@end

@implementation CAMShutterIndicatorView

- (CAMShutterIndicatorView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMShutterIndicatorView;
  v3 = -[CAMShutterIndicatorView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMShutterIndicatorView *)v3 _commonCAMShutterIndicatorViewInitialization];
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMShutterIndicatorViewInitialization
{
  v14[3] = *MEMORY[0x263EF8340];
  v13[0] = *MEMORY[0x263F814F0];
  v3 = +[CAMFont cameraFontOfSize:12.0];
  uint64_t v4 = *MEMORY[0x263F81510];
  v14[0] = v3;
  v14[1] = &unk_26BDDF408;
  uint64_t v5 = *MEMORY[0x263F81500];
  v13[1] = v4;
  v13[2] = v5;
  v6 = [MEMORY[0x263F825C8] whiteColor];
  v14[2] = v6;
  objc_super v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  id v8 = objc_alloc(MEMORY[0x263F086A0]);
  v9 = CAMLocalizedFrameworkString(@"SHUTTER", @"Label for the hardware button which controls the Camera shutter.");
  v10 = (NSAttributedString *)[v8 initWithString:v9 attributes:v7];
  indicatorText = self->__indicatorText;
  self->__indicatorText = v10;

  v12 = [MEMORY[0x263F825C8] clearColor];
  [(CAMShutterIndicatorView *)self setBackgroundColor:v12];

  [(CAMShutterIndicatorView *)self setUserInteractionEnabled:0];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CAMShutterIndicatorView *)self _indicatorText];
  [v2 size];
  UIRoundToViewScale();
  double v4 = v3;

  double v5 = 33.0;
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (NSAttributedString)_indicatorText
{
  return self->__indicatorText;
}

- (void)drawRect:(CGRect)a3
{
  [(CAMShutterIndicatorView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12, v5, v7, v9, v11, 3.0, 3.0);
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  v43.origin.x = v5;
  v43.origin.y = v7;
  v43.size.width = v9;
  v43.size.height = v11;
  CGRect v44 = CGRectInset(v43, 2.0, 0.0);
  v39 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12, v44.origin.x, v44.origin.y, v44.size.width, v44.size.height + -2.0, 2.0, 2.0);
  v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
  [v13 set];

  [v40 fill];
  v38 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", v5, v7, v9, v11);
  [v38 appendPath:v39];
  [v38 setUsesEvenOddFillRule:1];
  [v38 addClip];
  v14 = [MEMORY[0x263F825C8] whiteColor];
  [v14 set];

  [v40 fill];
  CGContextRestoreGState(CurrentContext);
  v37 = [(CAMShutterIndicatorView *)self _indicatorText];
  [v37 size];
  UIRectCenteredIntegralRectScale();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19 + 1.0;
  v45.origin.x = v5;
  v45.origin.y = v7;
  v45.size.width = v9;
  v45.size.height = v11;
  CGFloat v21 = CGRectGetMinY(v45) + 13.0;
  v42.width = v9;
  v42.height = v11;
  UIGraphicsBeginImageContextWithOptions(v42, 0, 0.0);
  UIGraphicsGetCurrentContext();
  objc_msgSend(v37, "drawInRect:", v20, v21, v16, v18, 0);
  v22 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CGContextSaveGState(CurrentContext);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v46.origin.x = v5;
  v46.origin.y = v7;
  v46.size.width = v9;
  v46.size.height = v11;
  CGFloat Height = CGRectGetHeight(v46);
  CGContextTranslateCTM(CurrentContext, 0.0, -Height);
  id v24 = v22;
  v25 = (CGImage *)[v24 CGImage];
  size_t Width = CGImageGetWidth(v25);
  size_t v27 = CGImageGetHeight(v25);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(v25);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(v25);
  size_t BytesPerRow = CGImageGetBytesPerRow(v25);
  DataProvider = CGImageGetDataProvider(v25);
  Decode = CGImageGetDecode(v25);
  BOOL ShouldInterpolate = CGImageGetShouldInterpolate(v25);
  v34 = CGImageMaskCreate(Width, v27, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, Decode, ShouldInterpolate);
  v47.origin.x = v5;
  v47.origin.y = v7;
  v47.size.width = v9;
  v47.size.height = v11;
  CGContextClipToMask(CurrentContext, v47, v34);
  v35 = [MEMORY[0x263F825C8] whiteColor];
  [v35 set];

  v48.origin.x = v5;
  v48.origin.y = v7;
  v48.size.width = v9;
  v48.size.height = v11;
  CGRect v49 = CGRectInset(v48, 3.0, 0.0);
  v36 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, v49.origin.x, v49.origin.y + 3.0, v49.size.width, v49.size.height, 2.0, 2.0);
  [v36 fill];
  CGContextRestoreGState(CurrentContext);
  CGImageRelease(v34);
}

- (CAMShutterIndicatorView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMShutterIndicatorView;
  double v3 = [(CAMShutterIndicatorView *)&v7 initWithCoder:a3];
  double v4 = v3;
  if (v3)
  {
    [(CAMShutterIndicatorView *)v3 _commonCAMShutterIndicatorViewInitialization];
    double v5 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end