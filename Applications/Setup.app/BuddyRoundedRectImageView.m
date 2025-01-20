@interface BuddyRoundedRectImageView
- (BOOL)usesMask;
- (BuddyRoundedRectImageView)initWithFrame:(CGRect)a3;
- (BuddyRoundedRectImageView)initWithImage:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImage)image;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setUsesMask:(BOOL)a3;
@end

@implementation BuddyRoundedRectImageView

- (BuddyRoundedRectImageView)initWithFrame:(CGRect)a3
{
  CGRect v10 = a3;
  SEL v8 = a2;
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyRoundedRectImageView;
  id location = -[BuddyRoundedRectImageView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    id v3 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v4 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v3;

    [location addSubview:*((void *)location + 1)];
  }
  v5 = (BuddyRoundedRectImageView *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (BuddyRoundedRectImageView)initWithImage:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v7;
  id v7 = 0;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  objc_storeStrong(&v7, v7);
  if (v7) {
    [*((id *)v7 + 1) setImage:location[0]];
  }
  v4 = (BuddyRoundedRectImageView *)v7;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v4;
}

- (void)setImage:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UIImageView *)v4->_imageView setImage:location[0]];
  objc_storeStrong(location, 0);
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setUsesMask:(BOOL)a3
{
  if (self->_usesMask != a3)
  {
    self->_usesMask = a3;
    if (self->_usesMask)
    {
      UIRoundToViewScale();
      double v4 = v3;
      id v5 = [(BuddyRoundedRectImageView *)self layer];
      [v5 setCornerRadius:v4];

      [(BuddyRoundedRectImageView *)self setClipsToBounds:1];
    }
    else
    {
      id v6 = [(BuddyRoundedRectImageView *)self layer];
      [v6 setCornerRadius:0.0];

      [(BuddyRoundedRectImageView *)self setClipsToBounds:0];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height, a2, self, *(void *)&a3.width, *(void *)&a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  [(BuddyRoundedRectImageView *)self bounds];
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v2, v3, v4, v5, *(void *)&v2, *(void *)&v3, *(void *)&v4, *(void *)&v5, *(void *)&v2, *(void *)&v3, *(void *)&v4, *(void *)&v5, *(void *)&v2, *(void *)&v3, *(void *)&v4, *(void *)&v5);
}

- (BOOL)usesMask
{
  return self->_usesMask;
}

- (void).cxx_destruct
{
}

@end