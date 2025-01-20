@interface CAMSemanticStylePickerTileOverlayView
+ (id)_sharedCornerImage;
- (CAMSemanticStylePickerTileOverlayView)initWithFrame:(CGRect)a3;
- (UIColor)materialColor;
- (UIImageView)_bottomLeftCorner;
- (UIImageView)_bottomRightCorner;
- (UIImageView)_topLeftCorner;
- (UIImageView)_topRightCorner;
- (UIView)_tileOverlay;
- (double)cornerTargetAlpha;
- (double)tileAlpha;
- (void)_updateAlphas;
- (void)_updateMaterialColor;
- (void)layoutSubviews;
- (void)setCornerTargetAlpha:(double)a3;
- (void)setMaterialColor:(id)a3;
- (void)setTileAlpha:(double)a3;
@end

@implementation CAMSemanticStylePickerTileOverlayView

- (CAMSemanticStylePickerTileOverlayView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CAMSemanticStylePickerTileOverlayView;
  v3 = -[CAMSemanticStylePickerTileOverlayView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_materialColor = (UIColor *)(id)[MEMORY[0x263F825C8] blackColor];
    v4 = [(id)objc_opt_class() _sharedCornerImage];
    v5 = [v4 imageWithRenderingMode:2];

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    topLeftCorner = v3->__topLeftCorner;
    v3->__topLeftCorner = v6;

    [(UIImageView *)v3->__topLeftCorner setImage:v5];
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    topRightCorner = v3->__topRightCorner;
    v3->__topRightCorner = v8;

    v10 = [v5 imageWithHorizontallyFlippedOrientation];
    [(UIImageView *)v3->__topRightCorner setImage:v10];

    id v11 = objc_alloc(MEMORY[0x263F827E8]);
    id v12 = v5;
    uint64_t v13 = [v12 CGImage];
    [v12 scale];
    v14 = objc_msgSend(v11, "initWithCGImage:scale:orientation:", v13, 5);
    v15 = [v14 imageWithRenderingMode:2];

    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    bottomLeftCorner = v3->__bottomLeftCorner;
    v3->__bottomLeftCorner = v16;

    [(UIImageView *)v3->__bottomLeftCorner setImage:v15];
    v18 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    bottomRightCorner = v3->__bottomRightCorner;
    v3->__bottomRightCorner = v18;

    v20 = [v15 imageWithHorizontallyFlippedOrientation];
    [(UIImageView *)v3->__bottomRightCorner setImage:v20];

    v21 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    tileOverlay = v3->__tileOverlay;
    v3->__tileOverlay = v21;

    [(CAMSemanticStylePickerTileOverlayView *)v3 addSubview:v3->__tileOverlay];
    [(CAMSemanticStylePickerTileOverlayView *)v3 addSubview:v3->__topLeftCorner];
    [(CAMSemanticStylePickerTileOverlayView *)v3 addSubview:v3->__topRightCorner];
    [(CAMSemanticStylePickerTileOverlayView *)v3 addSubview:v3->__bottomLeftCorner];
    [(CAMSemanticStylePickerTileOverlayView *)v3 addSubview:v3->__bottomRightCorner];
    v3->_tileAlpha = 0.0;
    v3->_cornerTargetAlpha = 1.0;
    [(CAMSemanticStylePickerTileOverlayView *)v3 _updateMaterialColor];
    [(CAMSemanticStylePickerTileOverlayView *)v3 _updateAlphas];
  }
  return v3;
}

+ (id)_sharedCornerImage
{
  if (_sharedCornerImage_onceToken != -1) {
    dispatch_once(&_sharedCornerImage_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)_sharedCornerImage___sharedCornerImage;
  return v2;
}

void __59__CAMSemanticStylePickerTileOverlayView__sharedCornerImage__block_invoke()
{
  v4.width = 14.0;
  v4.height = 14.0;
  UIGraphicsBeginImageContextWithOptions(v4, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, 0.0, 0.0);
  CGContextAddArc(CurrentContext, 14.0, 14.0, 14.0, 4.71238898, 3.14159265, 1);
  CGContextClosePath(CurrentContext);
  CGContextSetRGBFillColor(CurrentContext, 0.0, 0.0, 0.0, 1.0);
  CGContextFillPath(CurrentContext);
  uint64_t v1 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v2 = (void *)_sharedCornerImage___sharedCornerImage;
  _sharedCornerImage___sharedCornerImage = v1;
}

- (void)setCornerTargetAlpha:(double)a3
{
  if (self->_cornerTargetAlpha != a3)
  {
    self->_cornerTargetAlpha = a3;
    [(CAMSemanticStylePickerTileOverlayView *)self _updateAlphas];
  }
}

- (void)setTileAlpha:(double)a3
{
  if (self->_tileAlpha != a3)
  {
    self->_tileAlpha = a3;
    [(CAMSemanticStylePickerTileOverlayView *)self _updateAlphas];
  }
}

- (void)setMaterialColor:(id)a3
{
  if (self->_materialColor != a3)
  {
    self->_materialColor = (UIColor *)a3;
    [(CAMSemanticStylePickerTileOverlayView *)self _updateMaterialColor];
  }
}

- (void)_updateMaterialColor
{
  v3 = [(CAMSemanticStylePickerTileOverlayView *)self materialColor];
  CGSize v4 = [(CAMSemanticStylePickerTileOverlayView *)self _topLeftCorner];
  [v4 setTintColor:v3];

  v5 = [(CAMSemanticStylePickerTileOverlayView *)self materialColor];
  v6 = [(CAMSemanticStylePickerTileOverlayView *)self _topRightCorner];
  [v6 setTintColor:v5];

  v7 = [(CAMSemanticStylePickerTileOverlayView *)self materialColor];
  v8 = [(CAMSemanticStylePickerTileOverlayView *)self _bottomLeftCorner];
  [v8 setTintColor:v7];

  v9 = [(CAMSemanticStylePickerTileOverlayView *)self materialColor];
  v10 = [(CAMSemanticStylePickerTileOverlayView *)self _bottomRightCorner];
  [v10 setTintColor:v9];

  id v12 = [(CAMSemanticStylePickerTileOverlayView *)self materialColor];
  id v11 = [(CAMSemanticStylePickerTileOverlayView *)self _tileOverlay];
  [v11 setBackgroundColor:v12];
}

- (void)_updateAlphas
{
  [(CAMSemanticStylePickerTileOverlayView *)self tileAlpha];
  double v4 = v3;
  v5 = [(CAMSemanticStylePickerTileOverlayView *)self _tileOverlay];
  [v5 setAlpha:v4];

  [(CAMSemanticStylePickerTileOverlayView *)self cornerTargetAlpha];
  double v7 = v6;
  [(CAMSemanticStylePickerTileOverlayView *)self tileAlpha];
  double v9 = v7 - v8;
  [(CAMSemanticStylePickerTileOverlayView *)self tileAlpha];
  double v11 = v9 / (1.0 - v10);
  id v12 = [(CAMSemanticStylePickerTileOverlayView *)self _topLeftCorner];
  [v12 setAlpha:v11];

  uint64_t v13 = [(CAMSemanticStylePickerTileOverlayView *)self _topRightCorner];
  [v13 setAlpha:v11];

  v14 = [(CAMSemanticStylePickerTileOverlayView *)self _bottomLeftCorner];
  [v14 setAlpha:v11];

  id v15 = [(CAMSemanticStylePickerTileOverlayView *)self _bottomRightCorner];
  [v15 setAlpha:v11];
}

- (void)layoutSubviews
{
  [(CAMSemanticStylePickerTileOverlayView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CAMSemanticStylePickerTileOverlayView *)self _tileOverlay];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v12 = [(CAMSemanticStylePickerTileOverlayView *)self _topLeftCorner];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, 14.0, 14.0);

  uint64_t v13 = [(CAMSemanticStylePickerTileOverlayView *)self _topRightCorner];
  objc_msgSend(v13, "setFrame:", v8 + -14.0, 0.0, 14.0, 14.0);

  v14 = [(CAMSemanticStylePickerTileOverlayView *)self _bottomLeftCorner];
  objc_msgSend(v14, "setFrame:", 0.0, v10 + -14.0, 14.0, 14.0);

  id v15 = [(CAMSemanticStylePickerTileOverlayView *)self _bottomRightCorner];
  objc_msgSend(v15, "setFrame:", v8 + -14.0, v10 + -14.0, 14.0, 14.0);
}

- (UIImageView)_topLeftCorner
{
  return self->__topLeftCorner;
}

- (UIImageView)_topRightCorner
{
  return self->__topRightCorner;
}

- (UIImageView)_bottomLeftCorner
{
  return self->__bottomLeftCorner;
}

- (UIImageView)_bottomRightCorner
{
  return self->__bottomRightCorner;
}

- (UIView)_tileOverlay
{
  return self->__tileOverlay;
}

- (double)cornerTargetAlpha
{
  return self->_cornerTargetAlpha;
}

- (double)tileAlpha
{
  return self->_tileAlpha;
}

- (UIColor)materialColor
{
  return self->_materialColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tileOverlay, 0);
  objc_storeStrong((id *)&self->__bottomRightCorner, 0);
  objc_storeStrong((id *)&self->__bottomLeftCorner, 0);
  objc_storeStrong((id *)&self->__topRightCorner, 0);
  objc_storeStrong((id *)&self->__topLeftCorner, 0);
}

@end