@interface ICSEffectPickerViewCell
+ (NSString)reuseIdentifier;
- (ICSEffectPickerViewCell)initWithFrame:(CGRect)a3;
- (TUVideoEffect)videoEffect;
- (UIImageView)imageView;
- (void)setImageView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setVideoEffect:(id)a3;
@end

@implementation ICSEffectPickerViewCell

- (ICSEffectPickerViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICSEffectPickerViewCell;
  v3 = -[ICSEffectPickerViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(ICSEffectPickerViewCell *)v3 layer];
    [v5 setMasksToBounds:1];

    v6 = [(ICSEffectPickerViewCell *)v4 layer];
    [v6 setCornerRadius:10.0];
  }
  return v4;
}

- (void)setVideoEffect:(id)a3
{
  p_videoEffect = &self->_videoEffect;
  objc_storeStrong((id *)&self->_videoEffect, a3);
  id v6 = a3;
  id v8 = [(TUVideoEffect *)*p_videoEffect thumbnailImage];

  v7 = [(ICSEffectPickerViewCell *)self imageView];
  [v7 setImage:v8];
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    v5 = self->_imageView;
    self->_imageView = v4;

    [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [(UIImageView *)self->_imageView layer];
    [v6 setMasksToBounds:1];

    [(ICSEffectPickerViewCell *)self addSubview:self->_imageView];
    v7 = [(UIImageView *)self->_imageView heightAnchor];
    id v8 = [(ICSEffectPickerViewCell *)self heightAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:-20.0];

    v10 = [(UIImageView *)self->_imageView widthAnchor];
    v11 = [(ICSEffectPickerViewCell *)self widthAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:-20.0];

    v13 = [(UIImageView *)self->_imageView centerXAnchor];
    v14 = [(ICSEffectPickerViewCell *)self centerXAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];

    v16 = [(UIImageView *)self->_imageView centerYAnchor];
    v17 = [(ICSEffectPickerViewCell *)self centerYAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];

    v21[0] = v9;
    v21[1] = v12;
    v21[2] = v15;
    v21[3] = v18;
    v19 = +[NSArray arrayWithObjects:v21 count:4];
    +[NSLayoutConstraint activateConstraints:v19];

    imageView = self->_imageView;
  }

  return imageView;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICSEffectPickerViewCell;
  -[ICSEffectPickerViewCell setSelected:](&v11, "setSelected:");
  if (v3)
  {
    id v5 = +[UIColor colorWithWhite:0.0 alpha:0.3];
    id v6 = [v5 CGColor];
    v7 = [(ICSEffectPickerViewCell *)self layer];
    [v7 setBorderColor:v6];

    id v8 = [(ICSEffectPickerViewCell *)self layer];
    [v8 setBorderWidth:2.0];

    +[UIColor colorWithWhite:0.5 alpha:0.5];
  }
  else
  {
    v9 = [(ICSEffectPickerViewCell *)self layer];
    [v9 setBorderWidth:0.0];

    +[UIColor clearColor];
  v10 = };
  [(ICSEffectPickerViewCell *)self setBackgroundColor:v10];
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"ICSEffectPickerViewCellReuseIdentifier";
}

- (TUVideoEffect)videoEffect
{
  return self->_videoEffect;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_videoEffect, 0);
}

@end