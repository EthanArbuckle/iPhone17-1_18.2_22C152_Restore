@interface NTKSquallTimeBezelView
- (NTKSquallTimeBezelView)initWithDevice:(id)a3 progressProvider:(id)a4;
- (id)_logoDimmedColor;
- (id)_logoHighlightedColor;
- (id)_logoTritiumColor;
- (void)_compositeBezelImagesA:(id)a3 andB:(id)a4 clippingPath:(id)a5 context:(CGContext *)a6;
- (void)_renderBezelTemplateForSize:(CGSize)a3 highlighted:(BOOL)a4 tritium:(BOOL)a5 rendererContext:(id)a6;
@end

@implementation NTKSquallTimeBezelView

- (NTKSquallTimeBezelView)initWithDevice:(id)a3 progressProvider:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NTKSquallTimeBezelView;
  v4 = [(NTKSquallBezelView *)&v9 initWithDevice:a3 progressProvider:a4];
  if (v4)
  {
    v5 = +[NTKSquallFaceBundle imageWithName:@"hermes-logo"];
    uint64_t v6 = [v5 imageWithRenderingMode:2];
    logoImage = v4->_logoImage;
    v4->_logoImage = (UIImage *)v6;
  }
  return v4;
}

- (id)_logoHighlightedColor
{
  v3 = [(NTKSquallBezelView *)self colorPalette];

  if (v3)
  {
    v4 = [(NTKSquallBezelView *)self colorPalette];
    v5 = [v4 logoHighlighted];
  }
  else
  {
    v5 = +[UIColor blackColor];
  }

  return v5;
}

- (id)_logoDimmedColor
{
  v3 = [(NTKSquallBezelView *)self colorPalette];

  if (v3)
  {
    v4 = [(NTKSquallBezelView *)self colorPalette];
    v5 = [v4 logoDimmed];
  }
  else
  {
    v5 = +[UIColor whiteColor];
  }

  return v5;
}

- (id)_logoTritiumColor
{
  v3 = [(NTKSquallBezelView *)self colorPalette];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(NTKSquallBezelView *)self colorPalette];
    uint64_t v6 = [v5 tritiumPalette];
    v7 = [v6 logoDimmed];
  }
  else
  {
    v7 = +[UIColor whiteColor];
  }

  return v7;
}

- (void)_renderBezelTemplateForSize:(CGSize)a3 highlighted:(BOOL)a4 tritium:(BOOL)a5 rendererContext:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  double height = a3.height;
  double width = a3.width;
  v27.receiver = self;
  v27.super_class = (Class)NTKSquallTimeBezelView;
  id v11 = a6;
  -[NTKSquallBezelView _renderBezelTemplateForSize:highlighted:tritium:rendererContext:](&v27, "_renderBezelTemplateForSize:highlighted:tritium:rendererContext:", v7, v6, v11, width, height);
  v12 = [(NTKSquallBezelView *)self device];
  double v13 = sub_3A88(v12);
  CGFloat v15 = v14;

  v16 = (CGContext *)[v11 CGContext];
  if (v6)
  {
    uint64_t v17 = [(NTKSquallTimeBezelView *)self _logoTritiumColor];
  }
  else
  {
    if (v7) {
      [(NTKSquallTimeBezelView *)self _logoHighlightedColor];
    }
    else {
    uint64_t v17 = [(NTKSquallTimeBezelView *)self _logoDimmedColor];
    }
  }
  v18 = (void *)v17;
  CGContextSaveGState(v16);
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_9770;
  transform.ty = height;
  CGContextConcatCTM(v16, &transform);
  [(UIImage *)self->_logoImage size];
  CGFloat v20 = v19;
  [(UIImage *)self->_logoImage size];
  CGFloat v22 = v21;
  v28.origin.x = v13;
  v28.origin.y = v15;
  v28.size.double width = v20;
  v28.size.double height = v22;
  CGContextBeginTransparencyLayerWithRect(v16, v28, 0);
  id v23 = v18;
  CGContextSetFillColorWithColor(v16, (CGColorRef)[v23 CGColor]);
  v24 = [(UIImage *)self->_logoImage CGImage];
  v29.origin.x = v13;
  v29.origin.y = v15;
  v29.size.double width = v20;
  v29.size.double height = v22;
  CGContextDrawImage(v16, v29, v24);
  CGContextSetBlendMode(v16, kCGBlendModeSourceIn);
  v30.origin.x = v13;
  v30.origin.y = v15;
  v30.size.double width = v20;
  v30.size.double height = v22;
  CGContextFillRect(v16, v30);
  CGContextEndTransparencyLayer(v16);
  v25.b = 0.0;
  v25.c = 0.0;
  v25.a = 1.0;
  *(_OWORD *)&v25.d = xmmword_9770;
  v25.ty = height;
  CGContextConcatCTM(v16, &v25);
  CGContextRestoreGState(v16);
}

- (void)_compositeBezelImagesA:(id)a3 andB:(id)a4 clippingPath:(id)a5 context:(CGContext *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = [(NTKSquallBezelView *)self device];
  sub_3A88(v13);
  double v15 = v14;

  v26.receiver = self;
  v26.super_class = (Class)NTKSquallTimeBezelView;
  [(NTKSquallBezelView *)&v26 _compositeBezelImageA:v10 clippingPath:v12 context:a6];
  [(NTKSquallBezelView *)self progress];
  if (v16 < v15)
  {
    [(NTKSquallBezelView *)self tritiumFraction];
    if (v17 == 0.0)
    {
      [v10 size];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      [(NTKSquallBezelView *)self progress];
      CGContextSetAlpha(a6, 1.0 - v22 / v15);
      CGContextSaveGState(a6);
      transform.b = 0.0;
      transform.c = 0.0;
      transform.a = 1.0;
      *(_OWORD *)&transform.d = xmmword_9770;
      transform.ty = v21;
      CGContextConcatCTM(a6, &transform);
      id v23 = (CGImage *)[v11 CGImage];
      v27.origin.x = 0.0;
      v27.origin.y = 0.0;
      v27.size.double width = v19;
      v27.size.double height = v21;
      CGContextDrawImage(a6, v27, v23);
      CGContextRestoreGState(a6);
      CGContextSetAlpha(a6, 1.0);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)NTKSquallTimeBezelView;
  [(NTKSquallBezelView *)&v24 _compositeBezelImageB:v11 clippingPath:v12 context:a6];
}

- (void).cxx_destruct
{
}

@end