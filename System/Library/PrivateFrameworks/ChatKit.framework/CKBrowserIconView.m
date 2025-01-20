@interface CKBrowserIconView
+ (id)_pieImageForPercentComplete:(double)a3 size:(CGSize)a4 center:(CGPoint)a5 radius:(double)a6;
- (BOOL)animating;
- (CADisplayLink)displayLink;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKBrowserIconView)initWithFrame:(CGRect)a3;
- (UIImage)iconImage;
- (double)animationEndPercentComplete;
- (double)animationStartPercentComplete;
- (double)animationStartTime;
- (double)percentComplete;
- (void)_onDisplayLink:(id)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationEndPercentComplete:(double)a3;
- (void)setAnimationStartPercentComplete:(double)a3;
- (void)setAnimationStartTime:(double)a3;
- (void)setDisplayLink:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setPercentComplete:(double)a3;
- (void)setPercentComplete:(double)a3 animated:(BOOL)a4;
@end

@implementation CKBrowserIconView

- (CKBrowserIconView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKBrowserIconView;
  v3 = -[CKBrowserIconView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CKBrowserIconView *)v3 setOpaque:0];
  }
  return v4;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CKBrowserIconView;
  [(CKBrowserIconView *)&v3 dealloc];
}

- (void)setIconImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_iconImage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_iconImage, a3);
    objc_super v6 = [MEMORY[0x1E4F39BE8] layer];
    objc_msgSend(v6, "setContents:", -[UIImage CGImage](self->_iconImage, "CGImage"));
    v7 = [(CKBrowserIconView *)self layer];
    [v7 setMask:v6];

    [(CKBrowserIconView *)self setNeedsDisplay];
    [(CKBrowserIconView *)self invalidateIntrinsicContentSize];

    v5 = v8;
  }
}

- (void)setPercentComplete:(double)a3
{
}

- (void)setPercentComplete:(double)a3 animated:(BOOL)a4
{
  if (a4)
  {
    if (![(CKBrowserIconView *)self animating])
    {
      [(CKBrowserIconView *)self percentComplete];
      if (v6 == a3) {
        return;
      }
    }
    v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceReferenceDate];
    double v9 = v8;

    [(CKBrowserIconView *)self setAnimationStartTime:v9];
    [(CKBrowserIconView *)self percentComplete];
    -[CKBrowserIconView setAnimationStartPercentComplete:](self, "setAnimationStartPercentComplete:");
    [(CKBrowserIconView *)self setAnimationEndPercentComplete:a3];
    [(CKBrowserIconView *)self setAnimating:1];
  }
  else
  {
    -[CKBrowserIconView setAnimating:](self, "setAnimating:");
    if (self->_percentComplete == a3) {
      return;
    }
    self->_percentComplete = a3;
  }

  [(CKBrowserIconView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CKBrowserIconView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  UIRectGetCenter();
  double v31 = v16;
  double v32 = v17;
  if (v16 >= v17) {
    double v16 = v17;
  }
  double v29 = v16;
  CurrentContext = UIGraphicsGetCurrentContext();
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGContextClearRect(CurrentContext, v34);
  v19 = [(CKBrowserIconView *)self iconImage];

  if (v19)
  {
    v20 = [(CKBrowserIconView *)self iconImage];
    objc_msgSend(v20, "drawInRect:blendMode:alpha:", 17, v9, v11, v13, v15, 0.7);
  }
  [(CKBrowserIconView *)self percentComplete];
  if (v21 < 100.0)
  {
    v22 = objc_opt_class();
    [(CKBrowserIconView *)self percentComplete];
    double v24 = v23;
    [(CKBrowserIconView *)self bounds];
    objc_msgSend(v22, "_pieImageForPercentComplete:size:center:radius:", v24, v25, v26, v31, v32, v29 + -3.0);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    [v30 size];
    objc_msgSend(v30, "drawInRect:blendMode:alpha:", 0, ceil(v31 - v27 * 0.5), ceil(v32 - v28 * 0.5), v27, v28, 1.0);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v3 = [(CKBrowserIconView *)self iconImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CKBrowserIconView *)self iconImage];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CKBrowserIconView;
  [(CKBrowserIconView *)&v13 layoutSubviews];
  double v3 = [(CKBrowserIconView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [v3 mask];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

+ (id)_pieImageForPercentComplete:(double)a3 size:(CGSize)a4 center:(CGPoint)a5 radius:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.height;
  double width = a4.width;
  double v11 = [MEMORY[0x1E4F42D90] mainScreen];
  [v11 scale];
  double v13 = v12;

  double v14 = ceil(height * v13);
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v17 = CGBitmapContextCreate(0, vcvtpd_u64_f64(width * v13), vcvtpd_u64_f64(height * v13), 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  v28.size.double width = (double)(unint64_t)ceil(width * v13);
  v28.origin.double x = 0.0;
  v28.origin.double y = 0.0;
  v28.size.double height = (double)(unint64_t)v14;
  CGContextClearRect(v17, v28);
  CGContextTranslateCTM(v17, 0.0, (double)(unint64_t)v14);
  CGContextScaleCTM(v17, v13, -v13);
  CGContextGetCTM(&v26, v17);
  CGContextSetBaseCTM();
  UIGraphicsPushContext(v17);
  v18 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.7];
  [v18 set];

  v29.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v29.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  v29.size.double width = width;
  v29.size.double height = height;
  UIRectFill(v29);
  v19 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.2];
  [v19 set];

  v20 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, a6, 0.0, 6.28318531);
  [v20 setLineWidth:3.0];
  [v20 strokeWithBlendMode:17 alpha:1.0];
  if (fabs(a3) >= 2.22044605e-16)
  {
    double v21 = [MEMORY[0x1E4F427D0] bezierPath];
    objc_msgSend(v21, "moveToPoint:", x, y);
    objc_msgSend(v21, "addLineToPoint:", x, y - a6);
    objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, a6, -1.57079633, a3 / 100.0 * 6.28318531 + -1.57079633);
    objc_msgSend(v21, "addLineToPoint:", x, y);
    [v21 fillWithBlendMode:17 alpha:1.0];
  }
  UIGraphicsPopContext();
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  double v23 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:Image scale:0 orientation:v13];
  CGImageRelease(Image);

  return v23;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (a3)
    {
      double v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__onDisplayLink_];
      [(CKBrowserIconView *)self setDisplayLink:v4];

      id v7 = [(CKBrowserIconView *)self displayLink];
      double v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v7 addToRunLoop:v5 forMode:*MEMORY[0x1E4F1C4B0]];
    }
    else
    {
      double v6 = [(CKBrowserIconView *)self displayLink];
      [v6 invalidate];

      [(CKBrowserIconView *)self setDisplayLink:0];
    }
  }
}

- (void)_onDisplayLink:(id)a3
{
  double v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3);
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  [(CKBrowserIconView *)self animationStartTime];
  double v8 = v7;
  [(CKBrowserIconView *)self animationEndPercentComplete];
  double v10 = v9;
  [(CKBrowserIconView *)self animationStartPercentComplete];
  double v12 = vabdd_f64(v10, v11) * 0.005;
  [(CKBrowserIconView *)self animationStartTime];
  if (v6 <= v13 + v12)
  {
    double v15 = v6 - v8;
    [(CKBrowserIconView *)self animationStartPercentComplete];
    double v17 = v16;
    double v18 = v15 / v12;
    [(CKBrowserIconView *)self animationEndPercentComplete];
    double v20 = v19;
    [(CKBrowserIconView *)self animationStartPercentComplete];
    self->_percentComplete = v17 + v18 * (v20 - v21);
  }
  else
  {
    [(CKBrowserIconView *)self animationEndPercentComplete];
    self->_percentComplete = v14;
    [(CKBrowserIconView *)self setAnimating:0];
  }

  [(CKBrowserIconView *)self setNeedsDisplay];
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (BOOL)animating
{
  return self->_animating;
}

- (double)animationStartTime
{
  return self->_animationStartTime;
}

- (void)setAnimationStartTime:(double)a3
{
  self->_animationStartTime = a3;
}

- (double)animationStartPercentComplete
{
  return self->_animationStartPercentComplete;
}

- (void)setAnimationStartPercentComplete:(double)a3
{
  self->_animationStartPercentComplete = a3;
}

- (double)animationEndPercentComplete
{
  return self->_animationEndPercentComplete;
}

- (void)setAnimationEndPercentComplete:(double)a3
{
  self->_animationEndPercentComplete = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end