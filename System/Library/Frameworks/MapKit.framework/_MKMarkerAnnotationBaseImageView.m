@interface _MKMarkerAnnotationBaseImageView
+ (CGPath)_pathForBaseImageType:(int64_t)a3 radius:(double)a4 tailLength:(double)a5;
+ (id)_gradientImageName:(int64_t)a3;
- (BOOL)_isFillColorClear;
- (_MKMarkerAnnotationBaseImageContent)_baseImageContent;
- (_MKMarkerAnnotationBaseImageView)initWithBalloonRadius:(double)a3 tailLength:(double)a4;
- (_MKMarkerAnnotationBaseImageView)initWithFrame:(CGRect)a3;
- (_MKMarkerAnnotationBaseImageView)initWithOvalInSize:(CGSize)a3;
- (id)_renderBaseImage:(CGContext *)a3 inRect:(CGRect)a4 scale:(double)a5;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_fillPath:(CGPath *)a3 inContext:(CGContext *)a4 inRect:(CGRect)a5 scale:(double)a6;
- (void)_renderBaseContent;
- (void)_renderContentUsingGraphicsPath:(CGPath *)a3;
- (void)_renderGradientForRectaloon;
- (void)_setBaseImageContent:(id)a3;
- (void)_strokePath:(CGPath *)a3 inContext:(CGContext *)a4 scale:(double)a5;
@end

@implementation _MKMarkerAnnotationBaseImageView

- (_MKMarkerAnnotationBaseImageView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MKMarkerAnnotationBaseImageView;
  v3 = -[_MKMarkerAnnotationBaseImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (_MKMarkerAnnotationBaseImageView)initWithBalloonRadius:(double)a3 tailLength:(double)a4
{
  result = -[_MKMarkerAnnotationBaseImageView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3 + a3, a4 + a3 * 2.0);
  if (result) {
    result->_tailLength = a4;
  }
  return result;
}

- (_MKMarkerAnnotationBaseImageView)initWithOvalInSize:(CGSize)a3
{
  result = -[_MKMarkerAnnotationBaseImageView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
  if (result) {
    result->_tailLength = 0.0;
  }
  return result;
}

- (void)_setBaseImageContent:(id)a3
{
  objc_storeStrong((id *)&self->_baseImageContent, a3);
  id v5 = a3;
  id v8 = [MEMORY[0x1E4F42F80] _currentTraitCollection];
  v6 = (void *)MEMORY[0x1E4F42F80];
  objc_super v7 = [(_MKMarkerAnnotationBaseImageView *)self traitCollection];
  [v6 _setCurrentTraitCollection:v7];

  [(_MKMarkerAnnotationBaseImageView *)self _renderBaseContent];
  [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v8];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  [(_MKMarkerAnnotationBaseImageView *)self _renderBaseContent];
  v3.receiver = self;
  v3.super_class = (Class)_MKMarkerAnnotationBaseImageView;
  [(_MKMarkerAnnotationBaseImageView *)&v3 _dynamicUserInterfaceTraitDidChange];
}

- (void)_renderBaseContent
{
  baseImageContent = self->_baseImageContent;
  if (baseImageContent)
  {
    if ([(_MKMarkerAnnotationBaseImageContent *)baseImageContent baseImageType] == 6)
    {
      [(_MKMarkerAnnotationBaseImageView *)self _renderGradientForRectaloon];
    }
    else
    {
      [(_MKMarkerAnnotationBaseImageView *)self bounds];
      double v5 = v4;
      if ([(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent baseImageType]
        && [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent baseImageType] != 1)
      {
        double v5 = v5 * 0.5;
      }
      v6 = (const CGPath *)objc_msgSend((id)objc_opt_class(), "_pathForBaseImageType:radius:tailLength:", -[_MKMarkerAnnotationBaseImageContent baseImageType](self->_baseImageContent, "baseImageType"), v5, self->_tailLength);
      [(_MKMarkerAnnotationBaseImageView *)self _renderContentUsingGraphicsPath:v6];
      CGPathRelease(v6);
    }
  }
}

- (void)_renderContentUsingGraphicsPath:(CGPath *)a3
{
  [(_MKMarkerAnnotationBaseImageView *)self _currentScreenScale];
  double v6 = v5;
  [(_MKMarkerAnnotationBaseImageView *)self bounds];
  double v8 = v6 * v7;
  [(_MKMarkerAnnotationBaseImageView *)self bounds];
  double v10 = v6 * v9;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12 = CGBitmapContextCreate(0, (unint64_t)v8, (unint64_t)v10, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  -[_MKMarkerAnnotationBaseImageView _fillPath:inContext:inRect:scale:](self, "_fillPath:inContext:inRect:scale:", a3, v12, 0.0, 0.0, v8, v10, v6);
  [(_MKMarkerAnnotationBaseImageView *)self _strokePath:a3 inContext:v12 scale:v6];
  -[_MKMarkerAnnotationBaseImageView _renderBaseImage:inRect:scale:](self, "_renderBaseImage:inRect:scale:", v12, 0.0, 0.0, v8, v10, v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  CGContextRelease(v12);
  [(_MKMarkerAnnotationBaseImageView *)self setImage:v13];
}

+ (CGPath)_pathForBaseImageType:(int64_t)a3 radius:(double)a4 tailLength:(double)a5
{
  double v6 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  if (qword_1E91541B0 != -1) {
    dispatch_once(&qword_1E91541B0, &__block_literal_global_106);
  }
  *(float *)&a4 = v6;
  double v8 = [NSNumber numberWithFloat:a4];
  v16[0] = v8;
  *(float *)&double v9 = a5;
  double v10 = [NSNumber numberWithFloat:v9];
  v16[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  v12 = [(id)_MergedGlobals_1_12 objectForKeyedSubscript:v11];

  if (!v12)
  {
    if ((unint64_t)a3 > 5)
    {
      v12 = 0;
    }
    else
    {
      if (((1 << a3) & 3) != 0)
      {
        v17.origin.x = 0.0;
        v17.origin.y = 0.0;
        v17.size.width = v6;
        v17.size.height = v6;
        id v13 = CGPathCreateWithEllipseInRect(v17, 0);
      }
      else if (((1 << a3) & 0xC) != 0)
      {
        id v13 = +[_MKBezierPathView _createPathForBalloonRadius:v6 tailLength:a5];
      }
      else
      {
        id v13 = +[_MKBezierPathView _createSmoothTransitionPathForBalloonRadius:v6 tailLength:a5];
      }
      v12 = v13;
    }
    [(id)_MergedGlobals_1_12 setObject:v12 forKey:v11];
    CGPathRelease((CGPathRef)v12);
  }
  v14 = (CGPath *)MEMORY[0x18C138850](v12);

  return v14;
}

- (void)_fillPath:(CGPath *)a3 inContext:(CGContext *)a4 inRect:(CGRect)a5 scale:(double)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGContextSaveGState(a4);
  [(_MKMarkerAnnotationBaseImageView *)self bounds];
  CGContextTranslateCTM(a4, 0.0, v14 * a6);
  CGContextScaleCTM(a4, a6, -a6);
  CGContextAddPath(a4, a3);
  CGContextClip(a4);
  id v15 = [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent fillColor];
  CGContextSetFillColorWithColor(a4, (CGColorRef)[v15 CGColor]);

  CGContextFillPath(a4);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGContextFillRect(a4, v17);

  CGContextRestoreGState(a4);
}

- (void)_strokePath:(CGPath *)a3 inContext:(CGContext *)a4 scale:(double)a5
{
  uint64_t v9 = [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent strokeColor];
  if (v9)
  {
    double v10 = (void *)v9;
    [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent strokeWidth];
    double v12 = v11;

    if (v12 > 0.0)
    {
      CGContextSaveGState(a4);
      [(_MKMarkerAnnotationBaseImageView *)self bounds];
      CGContextTranslateCTM(a4, 0.0, v13 * a5);
      CGContextScaleCTM(a4, a5, -a5);
      [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent strokeWidth];
      CGContextSetLineWidth(a4, v14);
      memset(&v33, 0, sizeof(v33));
      [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent strokeWidth];
      CGFloat v16 = v15 * 0.5;
      [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent strokeWidth];
      CGAffineTransformMakeTranslation(&v33, v16, v17 * 0.5);
      [(_MKMarkerAnnotationBaseImageView *)self bounds];
      double v19 = v18;
      [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent strokeWidth];
      double v21 = v19 - v20;
      [(_MKMarkerAnnotationBaseImageView *)self bounds];
      CGFloat v23 = v21 / v22;
      [(_MKMarkerAnnotationBaseImageView *)self bounds];
      double v25 = v24;
      [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent strokeWidth];
      double v27 = v25 - v26;
      [(_MKMarkerAnnotationBaseImageView *)self bounds];
      CGAffineTransform v31 = v33;
      CGAffineTransformScale(&v32, &v31, v23, v27 / v28);
      CGAffineTransform v33 = v32;
      v29 = (const CGPath *)MEMORY[0x18C138880](a3, &v33);
      CGContextAddPath(a4, v29);
      id v30 = [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent strokeColor];
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v30 CGColor]);

      CGContextStrokePath(a4);
      CGPathRelease(v29);
      CGContextRestoreGState(a4);
    }
  }
}

- (id)_renderBaseImage:(CGContext *)a3 inRect:(CGRect)a4 scale:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v11 = objc_msgSend((id)objc_opt_class(), "_gradientImageName:", -[_MKMarkerAnnotationBaseImageContent baseImageType](self->_baseImageContent, "baseImageType"));
  if (_MKLinkedOnOrAfterReleaseSet(3338)
    && v11
    && ![(_MKMarkerAnnotationBaseImageView *)self _isFillColorClear])
  {
    objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", v11);
    id v14 = objc_claimAutoreleasedReturnValue();
    double v15 = (CGImage *)[v14 CGImage];
    CGContextSetBlendMode(a3, (CGBlendMode)[(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent blendMode]);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGContextDrawImage(a3, v21, v15);
  }
  else if (![(_MKMarkerAnnotationBaseImageView *)self _isFillColorClear])
  {
    id v12 = [(_MKMarkerAnnotationBaseImageView *)self image];
    double v13 = (CGImage *)[v12 CGImage];

    CGContextSetBlendMode(a3, kCGBlendModeDestinationAtop);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGContextDrawImage(a3, v20, v13);
  }
  Image = CGBitmapContextCreateImage(a3);
  double v17 = [MEMORY[0x1E4F42A80] imageWithCGImage:Image];
  CGImageRelease(Image);

  return v17;
}

- (void)_renderGradientForRectaloon
{
  [(_MKMarkerAnnotationBaseImageView *)self _currentScreenScale];
  double v4 = v3;
  id v5 = [(_MKMarkerAnnotationBaseImageView *)self image];
  double v6 = (CGImage *)[v5 CGImage];

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  [(_MKMarkerAnnotationBaseImageView *)self bounds];
  double v9 = v4 * v8;
  [(_MKMarkerAnnotationBaseImageView *)self bounds];
  double v11 = v4 * v10;
  id v12 = CGBitmapContextCreate(0, (unint64_t)v9, (unint64_t)(v4 * v10), 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextResetCTM();
  v22.origin.CGFloat x = 0.0;
  v22.origin.CGFloat y = 0.0;
  v22.size.CGFloat width = v9;
  v22.size.CGFloat height = v11;
  CGContextDrawImage(v12, v22, v6);
  double v13 = [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent fillColor];

  if (v13)
  {
    CGContextSaveGState(v12);
    CGContextSetBlendMode(v12, kCGBlendModeSourceIn);
    id v14 = [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent fillColor];
    CGContextSetFillColorWithColor(v12, (CGColorRef)[v14 CGColor]);

    v23.origin.CGFloat x = 0.0;
    v23.origin.CGFloat y = 0.0;
    v23.size.CGFloat width = v9;
    v23.size.CGFloat height = v11;
    CGContextFillRect(v12, v23);
    CGContextRestoreGState(v12);
  }
  Image = CGBitmapContextCreateImage(v12);
  CGFloat v16 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:Image scale:0 orientation:v4];
  [(_MKMarkerAnnotationBaseImageView *)self setImage:v16];
  double v17 = objc_msgSend((id)objc_opt_class(), "_gradientImageName:", -[_MKMarkerAnnotationBaseImageContent baseImageType](self->_baseImageContent, "baseImageType"));
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", v17);
    id v18 = objc_claimAutoreleasedReturnValue();
    double v19 = (CGImage *)[v18 CGImage];
    CGContextSetBlendMode(v12, (CGBlendMode)[(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent blendMode]);
    v24.origin.CGFloat x = 0.0;
    v24.origin.CGFloat y = 0.0;
    v24.size.CGFloat width = v9;
    v24.size.CGFloat height = v11;
    CGContextDrawImage(v12, v24, v19);
    Image = CGBitmapContextCreateImage(v12);
  }
  id v20 = (id)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:Image scale:0 orientation:v4];

  CGContextRelease(v12);
  CGImageRelease(Image);
  [(_MKMarkerAnnotationBaseImageView *)self setImage:v20];
}

+ (id)_gradientImageName:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return *(&off_1E54BF490 + a3 - 1);
  }
}

- (BOOL)_isFillColorClear
{
  v2 = [(_MKMarkerAnnotationBaseImageContent *)self->_baseImageContent fillColor];
  double v3 = [MEMORY[0x1E4F428B8] clearColor];
  BOOL v4 = v2 == v3;

  return v4;
}

- (_MKMarkerAnnotationBaseImageContent)_baseImageContent
{
  return self->_baseImageContent;
}

- (void).cxx_destruct
{
}

@end