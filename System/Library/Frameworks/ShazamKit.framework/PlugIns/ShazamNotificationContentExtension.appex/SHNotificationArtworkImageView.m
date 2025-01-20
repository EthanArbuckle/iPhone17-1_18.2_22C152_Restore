@interface SHNotificationArtworkImageView
- (CGSize)shadowOffset;
- (SHNotificationArtworkImageView)init;
- (SHNotificationArtworkImageView)initWithCoder:(id)a3;
- (SHNotificationArtworkImageView)initWithFrame:(CGRect)a3;
- (UIColor)shadowColor;
- (UIImage)image;
- (UIImageView)imageView;
- (double)cornerRadius;
- (double)shadowOpacity;
- (double)shadowRadius;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowRadius:(double)a3;
@end

@implementation SHNotificationArtworkImageView

- (SHNotificationArtworkImageView)init
{
  v5.receiver = self;
  v5.super_class = (Class)SHNotificationArtworkImageView;
  v2 = [(SHNotificationArtworkImageView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SHNotificationArtworkImageView *)v2 commonInit];
  }
  return v3;
}

- (SHNotificationArtworkImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SHNotificationArtworkImageView;
  v3 = -[SHNotificationArtworkImageView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SHNotificationArtworkImageView *)v3 commonInit];
  }
  return v4;
}

- (SHNotificationArtworkImageView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SHNotificationArtworkImageView;
  v3 = [(SHNotificationArtworkImageView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(SHNotificationArtworkImageView *)v3 commonInit];
  }
  return v4;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SHNotificationArtworkImageView;
  [(SHNotificationArtworkImageView *)&v18 layoutSubviews];
  [(SHNotificationArtworkImageView *)self setClipsToBounds:0];
  v3 = [(SHNotificationArtworkImageView *)self imageView];
  [v3 setClipsToBounds:1];

  v4 = [(SHNotificationArtworkImageView *)self imageView];
  objc_super v5 = [v4 layer];
  [v5 setMasksToBounds:1];

  [(SHNotificationArtworkImageView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(SHNotificationArtworkImageView *)self cornerRadius];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v7, v9, v11, v13, v14);
  id v15 = objc_claimAutoreleasedReturnValue();
  id v16 = [v15 CGPath];
  v17 = [(SHNotificationArtworkImageView *)self layer];
  [v17 setShadowPath:v16];
}

- (void)commonInit
{
  v3 = [(SHNotificationArtworkImageView *)self imageView];
  [(SHNotificationArtworkImageView *)self addSubview:v3];

  [(SHNotificationArtworkImageView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(SHNotificationArtworkImageView *)self imageView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  id v6 = [(SHNotificationArtworkImageView *)self imageView];
  [v6 setImage:v5];
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
  id v5 = a3;
  id v6 = [v5 CGColor];

  id v7 = [(SHNotificationArtworkImageView *)self layer];
  [v7 setShadowColor:v6];
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
  float v3 = a3;
  id v5 = [(SHNotificationArtworkImageView *)self layer];
  *(float *)&double v4 = v3;
  [v5 setShadowOpacity:v4];
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
  id v4 = [(SHNotificationArtworkImageView *)self layer];
  [v4 setShadowRadius:a3];
}

- (void)setShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  self->_shadowOffset = a3;
  id v5 = [(SHNotificationArtworkImageView *)self layer];
  objc_msgSend(v5, "setShadowOffset:", width, height);
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  [(SHNotificationArtworkImageView *)self bounds];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  id v5 = objc_claimAutoreleasedReturnValue();
  id v6 = [v5 CGPath];
  id v7 = [(SHNotificationArtworkImageView *)self layer];
  [v7 setShadowPath:v6];

  id v9 = [(SHNotificationArtworkImageView *)self imageView];
  double v8 = [v9 layer];
  [v8 setCornerRadius:a3];
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    id v4 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v5 = self->_imageView;
    self->_imageView = v4;

    [(UIImageView *)self->_imageView setAutoresizingMask:18];
    imageView = self->_imageView;
  }

  return imageView;
}

- (UIImage)image
{
  return self->_image;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end