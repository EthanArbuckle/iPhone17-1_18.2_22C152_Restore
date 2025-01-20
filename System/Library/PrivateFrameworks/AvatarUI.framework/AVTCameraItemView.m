@interface AVTCameraItemView
- (AVTCameraItemView)initWithFrame:(CGRect)a3;
- (CAShapeLayer)shapeLayer;
- (UIImageSymbolConfiguration)cameraConfiguration;
- (UIImageView)imageView;
- (void)layoutSubviews;
- (void)setCameraConfiguration:(id)a3;
- (void)setImageView:(id)a3;
- (void)setShapeLayer:(id)a3;
- (void)updateCameraImage;
@end

@implementation AVTCameraItemView

- (AVTCameraItemView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)AVTCameraItemView;
  v3 = -[AVTCameraItemView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(AVTCameraItemView *)v3 tintColor];
    v6 = [v5 colorWithAlphaComponent:0.15];

    v7 = [(AVTCameraItemView *)v4 tintColor];
    v8 = [v7 colorWithAlphaComponent:0.3];

    v9 = +[AVTUIColorRepository dynamicColorWithLightColor:v6 darkColor:v8];
    [(AVTCameraItemView *)v4 setBackgroundColor:v9];
    v10 = (void *)MEMORY[0x263F1C6C8];
    [(AVTCameraItemView *)v4 bounds];
    v12 = [v10 configurationWithPointSize:5 weight:v11 * 0.3];
    [(AVTCameraItemView *)v4 setCameraConfiguration:v12];

    v13 = (void *)MEMORY[0x263F1C6B0];
    v14 = [(AVTCameraItemView *)v4 cameraConfiguration];
    v15 = [v13 _systemImageNamed:@"camera.fill" withConfiguration:v14];

    v16 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v15];
    [(AVTCameraItemView *)v4 setImageView:v16];
    [v16 setContentMode:4];
    [(AVTCameraItemView *)v4 bounds];
    objc_msgSend(v16, "setFrame:");
    [v16 setAutoresizingMask:18];
    [(AVTCameraItemView *)v4 addSubview:v16];
    v17 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    shapeLayer = v4->_shapeLayer;
    v4->_shapeLayer = v17;

    v19 = v4->_shapeLayer;
    v20 = [(AVTCameraItemView *)v4 layer];
    [v20 setMask:v19];

    v21 = (void *)MEMORY[0x263F1C478];
    [(AVTCameraItemView *)v4 bounds];
    objc_msgSend(v21, "bezierPathWithOvalInRect:");
    id v22 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](v4->_shapeLayer, "setPath:", [v22 CGPath]);
  }
  return v4;
}

- (void)updateCameraImage
{
  v3 = (void *)MEMORY[0x263F1C478];
  [(AVTCameraItemView *)self bounds];
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  id v4 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_shapeLayer, "setPath:", [v4 CGPath]);

  v5 = (void *)MEMORY[0x263F1C6C8];
  [(AVTCameraItemView *)self bounds];
  id v12 = [v5 configurationWithPointSize:5 weight:v6 * 0.3];
  v7 = [(AVTCameraItemView *)self cameraConfiguration];
  char v8 = [v12 isEqualToConfiguration:v7];

  if ((v8 & 1) == 0)
  {
    [(AVTCameraItemView *)self setCameraConfiguration:v12];
    v9 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"camera.fill" withConfiguration:v12];
    v10 = [(AVTCameraItemView *)self imageView];
    [v10 setImage:v9];

    double v11 = [(AVTCameraItemView *)self imageView];
    [(AVTCameraItemView *)self bounds];
    objc_msgSend(v11, "setFrame:");
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTCameraItemView;
  [(AVTCameraItemView *)&v3 layoutSubviews];
  [(AVTCameraItemView *)self updateCameraImage];
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageSymbolConfiguration)cameraConfiguration
{
  return self->_cameraConfiguration;
}

- (void)setCameraConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraConfiguration, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
}

@end