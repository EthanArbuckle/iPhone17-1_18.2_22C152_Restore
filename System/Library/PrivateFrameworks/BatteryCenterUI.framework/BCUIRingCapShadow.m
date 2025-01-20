@interface BCUIRingCapShadow
+ (id)_ringCapShadowImageWithRingBounds:(CGRect)a3 lineWidth:(double)a4 scale:(double)a5;
+ (id)ringCapShadowForRingWithBounds:(CGRect)a3 lineWidth:(double)a4;
- (CGRect)_shadowCapFrame;
- (CGRect)ringBounds;
- (double)arcFraction;
- (double)lineWidth;
- (id)_initWithRingBounds:(CGRect)a3 lineWidth:(double)a4;
- (void)layoutSubviews;
- (void)setArcFraction:(double)a3;
@end

@implementation BCUIRingCapShadow

+ (id)ringCapShadowForRingWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  id v4 = -[BCUIRingCapShadow _initWithRingBounds:lineWidth:]([BCUIRingCapShadow alloc], "_initWithRingBounds:lineWidth:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);

  return v4;
}

- (void)setArcFraction:(double)a3
{
  if (self->_arcFraction != a3)
  {
    self->_arcFraction = a3;
    [(BCUIRingCapShadow *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)BCUIRingCapShadow;
  [(BCUIRingCapShadow *)&v23 layoutSubviews];
  [(BCUIRingCapShadow *)self _shadowCapFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  shadowCapImageView = self->_shadowCapImageView;
  if (shadowCapImageView) {
    [(UIImageView *)shadowCapImageView transform];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __35__BCUIRingCapShadow_layoutSubviews__block_invoke;
  v19[3] = &unk_1E6BE0AC0;
  v19[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v19];
  -[UIImageView setFrame:](self->_shadowCapImageView, "setFrame:", v4, v6, v8, v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  long long v16 = v20;
  v15[2] = __35__BCUIRingCapShadow_layoutSubviews__block_invoke_2;
  v15[3] = &unk_1E6BE0C28;
  v15[4] = self;
  long long v17 = v21;
  long long v18 = v22;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v15];
  CGFloat v12 = (self->_arcFraction + -0.75 + self->_arcFraction + -0.75) * 3.14159265;
  v13 = self->_shadowCapImageView;
  CGAffineTransformMakeRotation(&v14, v12);
  [(UIImageView *)v13 setTransform:&v14];
}

uint64_t __35__BCUIRingCapShadow_layoutSubviews__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 408);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __35__BCUIRingCapShadow_layoutSubviews__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 408);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

+ (id)_ringCapShadowImageWithRingBounds:(CGRect)a3 lineWidth:(double)a4 scale:(double)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11 = NSString;
  CGFloat v12 = CGRectGetWidth(a3);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  v13 = objc_msgSend(v11, "stringWithFormat:", @"ringCapShadow-%fx%f%f@%f", *(void *)&v12, CGRectGetHeight(v19), *(void *)&a4, *(void *)&a5);
  CGAffineTransform v14 = +[BCUIMappedImageCache sharedCache];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__BCUIRingCapShadow__ringCapShadowImageWithRingBounds_lineWidth_scale___block_invoke;
  v17[3] = &__block_descriptor_80_e18___UIImage_16__0_Q8l;
  *(CGFloat *)&v17[4] = x;
  *(CGFloat *)&v17[5] = y;
  *(CGFloat *)&v17[6] = width;
  *(CGFloat *)&v17[7] = height;
  *(double *)&v17[8] = a4;
  *(double *)&v17[9] = a5;
  v15 = [v14 imageForKey:v13 generatingIfNecessaryWithBlock:v17];

  return v15;
}

id __71__BCUIRingCapShadow__ringCapShadowImageWithRingBounds_lineWidth_scale___block_invoke(double *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  double v2 = a1[8];
  double v1 = a1[9];
  double v3 = a1[4];
  double v4 = a1[5];
  double v5 = a1[6];
  double v6 = a1[7];
  *(_OWORD *)&v38[4] = *MEMORY[0x1E4F1DB30];
  *(_DWORD *)v26 = 1065353216;
  *(_OWORD *)&v26[4] = *(_OWORD *)v38;
  *(_DWORD *)&v26[20] = *(_DWORD *)&v38[16];
  uint64_t v27 = 0x4014000000000000;
  double v7 = objc_msgSend(MEMORY[0x1E4FB1818], "mt_shadowTemplateImageWithAttributes:scale:maskCornerRadius:continuousCorners:maskSize:resizableCapInsets:", v26, 0, 0, v1, v2 * 0.5, v2 * 0.5 + v2 * 0.5, v2 * 0.5 + v2 * 0.5);
  double v8 = [v7 imageWithRenderingMode:2];

  double v9 = objc_alloc_init(BCUIRingView);
  double v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [(BCUIRingView *)v9 setStrokeColor:v10];

  -[BCUIRingView setFrame:](v9, "setFrame:", v3, v4, v5, v6);
  [(BCUIRingView *)v9 setRingStart:0.755];
  [(BCUIRingView *)v9 setRingEnd:1.0];
  DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
  v41.origin.CGFloat x = v3;
  v41.origin.CGFloat y = v4;
  v41.size.CGFloat width = v5;
  v41.size.CGFloat height = v6;
  size_t Width = (unint64_t)CGRectGetWidth(v41);
  v42.origin.CGFloat x = v3;
  v42.origin.CGFloat y = v4;
  v42.size.CGFloat width = v5;
  v42.size.CGFloat height = v6;
  CGFloat Height = CGRectGetHeight(v42);
  CGAffineTransform v14 = CGBitmapContextCreate(0, Width, (unint64_t)Height, 8uLL, 0, DeviceGray, 0);
  CGColorSpaceRelease(DeviceGray);
  v15 = [(BCUIRingView *)v9 layer];
  [v15 renderInContext:v14];

  CGImageRef Image = CGBitmapContextCreateImage(v14);
  CGContextRelease(v14);

  [v8 size];
  double v18 = v17;
  double v20 = v19;
  long long v21 = [MEMORY[0x1E4FB17E0] preferredFormat];
  [v21 setScale:v1];
  long long v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v21, v18, v20);
  *(void *)v26 = MEMORY[0x1E4F143A8];
  *(void *)&v26[8] = 3221225472;
  *(void *)&v26[16] = __NewRingCapShadowImage_block_invoke;
  uint64_t v27 = (uint64_t)&unk_1E6BE0C70;
  double v29 = v3;
  double v30 = v4;
  double v31 = v5;
  double v32 = v6;
  double v33 = v2;
  double v34 = v1;
  double v35 = v18;
  double v36 = v20;
  CGImageRef v37 = Image;
  id v28 = v8;
  id v23 = v8;
  v24 = [v22 imageWithActions:v26];

  return v24;
}

- (id)_initWithRingBounds:(CGRect)a3 lineWidth:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)BCUIRingCapShadow;
  double v9 = [(BCUIRingCapShadow *)&v21 init];
  p_isa = (id *)&v9->super.super.super.isa;
  if (v9)
  {
    v9->_ringBounds.origin.double x = x;
    v9->_ringBounds.origin.double y = y;
    v9->_ringBounds.size.double width = width;
    v9->_ringBounds.size.double height = height;
    v9->_linesize_t Width = a4;
    id v11 = objc_alloc(MEMORY[0x1E4FB1838]);
    CGFloat v12 = objc_opt_class();
    v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 scale];
    v15 = objc_msgSend(v12, "_ringCapShadowImageWithRingBounds:lineWidth:scale:", x, y, width, height, a4, v14);
    uint64_t v16 = [v11 initWithImage:v15];
    id v17 = p_isa[51];
    p_isa[51] = (id)v16;

    [p_isa addSubview:p_isa[51]];
    double v18 = [p_isa layer];
    [v18 setAllowsGroupBlending:0];

    double v19 = [p_isa[51] layer];
    [v19 setCompositingFilter:*MEMORY[0x1E4F3A2E0]];
  }
  return p_isa;
}

- (CGRect)_shadowCapFrame
{
  CGRect v16 = CGRectInset(self->_ringBounds, self->_lineWidth * 0.5, self->_lineWidth * 0.5);
  CoordinatesOfPointAtArcFraction(v16.origin.x, v16.origin.y, v16.size.width, v16.size.height, self->_arcFraction);
  UIPointRoundToScale();
  double v4 = v3;
  double v6 = v5;
  double v7 = [(UIImageView *)self->_shadowCapImageView image];
  [v7 size];
  double v9 = v8;
  double v11 = v10;

  double v12 = v4 - v9 * 0.5;
  double v13 = v6 - v11 * 0.5;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)ringBounds
{
  double x = self->_ringBounds.origin.x;
  double y = self->_ringBounds.origin.y;
  double width = self->_ringBounds.size.width;
  double height = self->_ringBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (double)arcFraction
{
  return self->_arcFraction;
}

- (void).cxx_destruct
{
}

@end