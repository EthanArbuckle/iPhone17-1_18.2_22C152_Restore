@interface WFOverlayImageTransform
- (CGPoint)center;
- (CGRect)bounds;
- (WFOverlayImageTransform)init;
- (WFOverlayImageTransform)initWithCenter:(CGPoint)a3 bounds:(CGRect)a4 rotation:(double)a5 scale:(double)a6 opacity:(double)a7;
- (double)opacity;
- (double)rotation;
- (double)scale;
- (id)initForCenteringImage:(id)a3 inBackgroundImage:(id)a4;
- (void)applyToImageFile:(id)a3 withOverlayImage:(id)a4 completionHandler:(id)a5;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setOpacity:(double)a3;
- (void)setRotation:(double)a3;
- (void)setScale:(double)a3;
@end

@implementation WFOverlayImageTransform

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)applyToImageFile:(id)a3 withOverlayImage:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  WFImageSizeFromFile();
  id v10 = v7;
  WFAsyncTransformedImageFromImage();
}

void __79__WFOverlayImageTransform_applyToImageFile_withOverlayImage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a3;
  objc_msgSend(a2, "drawInContext:inRect:", v13, a4, a5, a6, a7);
  id v30 = v13;
  v14 = (CGContext *)[v30 CGContext];
  [*(id *)(a1 + 32) scale];
  CGFloat v16 = v15;
  [*(id *)(a1 + 32) scale];
  CGContextScaleCTM(v14, v16, v17);
  [*(id *)(a1 + 32) center];
  CGFloat v19 = v18;
  [*(id *)(a1 + 32) center];
  CGContextTranslateCTM(v14, v19, v20);
  [*(id *)(a1 + 32) rotation];
  CGContextRotateCTM(v14, v21);
  v22 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) bounds];
  CGFloat v23 = CGRectGetWidth(v32) * -0.5;
  [*(id *)(a1 + 32) bounds];
  CGFloat v24 = CGRectGetHeight(v33) * -0.5;
  [*(id *)(a1 + 32) bounds];
  double v26 = v25;
  [*(id *)(a1 + 32) bounds];
  double v28 = v27;
  [*(id *)(a1 + 32) opacity];
  objc_msgSend(v22, "drawInContext:inRect:blendMode:alpha:", v30, 0, v23, v24, v26, v28, v29);
}

- (id)initForCenteringImage:(id)a3 inBackgroundImage:(id)a4
{
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  id v8 = a4;
  [a3 sizeInPoints];
  double v10 = v9;
  double v12 = v11;
  [v8 sizeInPoints];
  double v14 = v13;
  v24.origin.double x = v6;
  v24.origin.double y = v7;
  v24.size.double width = v10;
  v24.size.double height = v12;
  double v15 = v14 / CGRectGetWidth(v24);
  [v8 sizeInPoints];
  double v17 = v16;
  v25.origin.double x = v6;
  v25.origin.double y = v7;
  v25.size.double width = v10;
  v25.size.double height = v12;
  double v18 = fmin(v15, v17 / CGRectGetHeight(v25)) / 1.5;
  [v8 sizeInPoints];
  double v20 = v19 * 0.5 / v18;
  [v8 sizeInPoints];
  double v22 = v21;

  return -[WFOverlayImageTransform initWithCenter:bounds:rotation:scale:opacity:](self, "initWithCenter:bounds:rotation:scale:opacity:", v20, v22 * 0.5 / v18, v6, v7, v10, v12, 0.0, v18, 0x3FF0000000000000);
}

- (WFOverlayImageTransform)initWithCenter:(CGPoint)a3 bounds:(CGRect)a4 rotation:(double)a5 scale:(double)a6 opacity:(double)a7
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v13 = a3.y;
  CGFloat v14 = a3.x;
  double v15 = [(WFOverlayImageTransform *)self init];
  double v16 = v15;
  if (v15)
  {
    v15->_center.CGFloat y = v13;
    v15->_bounds.origin.CGFloat x = x;
    v15->_bounds.origin.CGFloat y = y;
    v15->_bounds.size.CGFloat width = width;
    v15->_bounds.size.CGFloat height = height;
    v15->_rotation = a5;
    v15->_scale = a6;
    v15->_opacitCGFloat y = a7;
    v15->_center.CGFloat x = v14;
    double v17 = v15;
  }

  return v16;
}

- (WFOverlayImageTransform)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFOverlayImageTransform;
  v2 = [(WFOverlayImageTransform *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_scale = 1.0;
    v4 = v2;
  }

  return v3;
}

@end