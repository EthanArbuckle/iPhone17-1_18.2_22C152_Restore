@interface HUAlbumIconContentView
- (HUAlbumIconContentView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (void)_updateIconImage;
- (void)layoutSubviews;
- (void)setIconSize:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation HUAlbumIconContentView

- (HUAlbumIconContentView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HUAlbumIconContentView;
  v3 = -[HUIconContentView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C6D0]);
    [(HUAlbumIconContentView *)v3 setImageView:v4];

    v5 = [(HUAlbumIconContentView *)v3 imageView];
    [v5 setContentMode:1];

    v6 = [(HUAlbumIconContentView *)v3 imageView];
    v7 = [v6 layer];
    [v7 setCornerRadius:4.0];

    v8 = [(HUAlbumIconContentView *)v3 imageView];
    v9 = [v8 layer];
    [v9 setMasksToBounds:1];

    v10 = [(HUAlbumIconContentView *)v3 imageView];
    [(HUAlbumIconContentView *)v3 addSubview:v10];
  }
  return v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)HUAlbumIconContentView;
  [(HUAlbumIconContentView *)&v12 layoutSubviews];
  [(HUAlbumIconContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(HUAlbumIconContentView *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    double v10 = v9;
  }
  else {
    double v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    objc_super v12 = [v11 imageData];
    v13 = [(HUIconContentView *)self iconDescriptor];
    v14 = [v13 imageData];
    int v15 = [v12 isEqual:v14];
  }
  else
  {
    int v15 = 1;
  }
  unint64_t v16 = [(HUIconContentView *)self displayStyle];
  v17.receiver = self;
  v17.super_class = (Class)HUAlbumIconContentView;
  [(HUIconContentView *)&v17 updateWithIconDescriptor:v9 displayStyle:a4 animated:v5];
  if (!v15 || v16 != a4) {
    [(HUAlbumIconContentView *)self _updateIconImage];
  }
}

- (void)setIconSize:(unint64_t)a3
{
  unint64_t v5 = [(HUIconContentView *)self iconSize];
  v6.receiver = self;
  v6.super_class = (Class)HUAlbumIconContentView;
  [(HUIconContentView *)&v6 setIconSize:a3];
  if (v5 != a3) {
    [(HUAlbumIconContentView *)self _updateIconImage];
  }
}

- (void)_updateIconImage
{
  objc_opt_class();
  double v3 = [(HUIconContentView *)self iconDescriptor];
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  id v9 = v4;

  if (v9)
  {
    unint64_t v5 = (void *)MEMORY[0x263F1C6B0];
    objc_super v6 = [v9 imageData];
    double v7 = [v5 imageWithData:v6];

    id v8 = [(HUAlbumIconContentView *)self imageView];
    [v8 setImage:v7];
  }
  else
  {
    double v7 = [(HUAlbumIconContentView *)self imageView];
    [v7 setImage:0];
  }
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