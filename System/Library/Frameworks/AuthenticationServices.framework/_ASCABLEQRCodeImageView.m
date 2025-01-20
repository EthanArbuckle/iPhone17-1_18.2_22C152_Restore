@interface _ASCABLEQRCodeImageView
- (UIImage)image;
- (_ASCABLEQRCodeImageView)initWithFrame:(CGRect)a3;
- (void)setImage:(id)a3;
@end

@implementation _ASCABLEQRCodeImageView

- (_ASCABLEQRCodeImageView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_ASCABLEQRCodeImageView;
  v3 = -[_ASCABLEQRCodeImageView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x263F15E10];
    v6 = [(_ASCABLEQRCodeImageView *)v3 layer];
    [v6 setContentsGravity:v5];

    uint64_t v7 = *MEMORY[0x263F15D28];
    v8 = [(_ASCABLEQRCodeImageView *)v4 layer];
    [v8 setMagnificationFilter:v7];

    v9 = v4;
  }

  return v4;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  uint64_t v6 = [v5 CGImage];

  id v7 = [(_ASCABLEQRCodeImageView *)self layer];
  [v7 setContents:v6];
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
}

@end