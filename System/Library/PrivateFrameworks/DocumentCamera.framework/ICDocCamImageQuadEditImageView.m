@interface ICDocCamImageQuadEditImageView
- (BOOL)accessibilityIgnoresInvertColors;
- (CALayer)imageLayer;
- (ICDocCamImageQuadEditImageView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (double)imageOpacity;
- (int64_t)orientation;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 orientation:(int64_t)a4;
- (void)setImageLayer:(id)a3;
- (void)setImageOpacity:(double)a3;
- (void)setOrientation:(int64_t)a3;
@end

@implementation ICDocCamImageQuadEditImageView

- (ICDocCamImageQuadEditImageView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamImageQuadEditImageView;
  v3 = -[ICDocCamImageQuadEditImageView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(ICDocCamImageQuadEditImageView *)v3 layer];
    [v5 setMasksToBounds:0];

    id v6 = objc_alloc_init(MEMORY[0x263F157E8]);
    [(ICDocCamImageQuadEditImageView *)v4 setImageLayer:v6];

    v7 = [(ICDocCamImageQuadEditImageView *)v4 layer];
    v8 = [(ICDocCamImageQuadEditImageView *)v4 imageLayer];
    [v7 addSublayer:v8];

    v9 = [MEMORY[0x263F1C550] blackColor];
    [(ICDocCamImageQuadEditImageView *)v4 setBackgroundColor:v9];
  }
  return v4;
}

- (void)setImageOpacity:(double)a3
{
  self->_imageOpacity = a3;
  float v3 = a3;
  id v5 = [(ICDocCamImageQuadEditImageView *)self imageLayer];
  *(float *)&double v4 = v3;
  [v5 setOpacity:v4];
}

- (void)setFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)ICDocCamImageQuadEditImageView;
  -[ICDocCamImageQuadEditImageView setFrame:](&v21, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ICDocCamImageQuadEditImageView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(ICDocCamImageQuadEditImageView *)self layer];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  [(ICDocCamImageQuadEditImageView *)self bounds];
  double v17 = DCTSDCenterOfRect(v13, v14, v15, v16);
  double v19 = v18;
  v20 = [(ICDocCamImageQuadEditImageView *)self imageLayer];
  objc_msgSend(v20, "setPosition:", v17, v19);
}

- (void)setImage:(id)a3 orientation:(int64_t)a4
{
  id v6 = a3;
  double v7 = v6;
  if (*(_OWORD *)&self->_image != __PAIR128__(a4, (unint64_t)v6))
  {
    [v6 size];
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [v7 CGImage];
    CGFloat v13 = [(ICDocCamImageQuadEditImageView *)self imageLayer];
    [v13 setContents:v12];

    CGFloat v14 = [(ICDocCamImageQuadEditImageView *)self layer];
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v9, v11);

    CGFloat v15 = [(ICDocCamImageQuadEditImageView *)self imageLayer];
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, v9, v11);

    uint64_t matched = dc_clockwiseRotationsFromUpToMatchOrientation(a4);
    CGAffineTransformMakeRotation(&v19, (double)(unint64_t)matched * 1.57079633);
    double v17 = [(ICDocCamImageQuadEditImageView *)self imageLayer];
    CGAffineTransform v18 = v19;
    [v17 setAffineTransform:&v18];
  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (double)imageOpacity
{
  return self->_imageOpacity;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_imageLayer, 0);
}

@end