@interface HUNamedWallpaperCell
- (HUNamedWallpaperCell)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)imageView;
- (int64_t)contentMode;
- (void)setContentMode:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation HUNamedWallpaperCell

- (HUNamedWallpaperCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HUNamedWallpaperCell;
  v3 = -[HUNamedWallpaperCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v5 = [(HUNamedWallpaperCell *)v3 contentView];
    [v5 bounds];
    uint64_t v6 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    [(UIImageView *)v3->_imageView setAutoresizingMask:18];
    [(UIImageView *)v3->_imageView setContentMode:0];
    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    v8 = [(UIImageView *)v3->_imageView layer];
    [v8 setCornerRadius:4.0];

    v9 = [(HUNamedWallpaperCell *)v3 contentView];
    [v9 addSubview:v3->_imageView];
  }
  return v3;
}

- (UIImage)image
{
  v2 = [(HUNamedWallpaperCell *)self imageView];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(HUNamedWallpaperCell *)self imageView];
  [v5 setImage:v4];
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
  id v4 = [(HUNamedWallpaperCell *)self imageView];
  [v4 setContentMode:a3];
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end