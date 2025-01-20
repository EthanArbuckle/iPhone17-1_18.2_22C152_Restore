@interface MCLRatingsView
- (BOOL)actionVariant;
- (MCLRatingsView)initWithFrame:(CGRect)a3;
- (UIImage)emptyImage;
- (UIImage)fullImage;
- (double)spacing;
- (double)value;
- (void)drawRect:(CGRect)a3;
- (void)setActionVariant:(BOOL)a3;
- (void)setEmptyImage:(id)a3;
- (void)setFullImage:(id)a3;
- (void)setSpacing:(double)a3;
- (void)setValue:(double)a3;
- (void)updateConstraints;
@end

@implementation MCLRatingsView

- (MCLRatingsView)initWithFrame:(CGRect)a3
{
  CGRect v10 = a3;
  SEL v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)MCLRatingsView;
  v9 = -[MCLRatingsView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    id v5 = (id)[(MCLRatingsView *)v9 layer];
    [v5 setShouldRasterize:1];

    [(MCLRatingsView *)v9 setContentMode:3];
    id v6 = (id)[MEMORY[0x263F825C8] whiteColor];
    -[MCLRatingsView setBackgroundColor:](v9, "setBackgroundColor:");

    -[MCLRatingsView setSpacing:](v9, "setSpacing:");
    [(MCLRatingsView *)v9 setValue:0.0];
    v9->_imageaspect = 1.0;
  }
  v4 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v4;
}

- (void)setSpacing:(double)a3
{
}

- (void)setValue:(double)a3
{
  if (a3 >= 0.0)
  {
    if (a3 > 5.0) {
      self->_value = 5.0;
    }
  }
  else
  {
    self->_value = 0.0;
  }
  if (a3 != self->_value)
  {
    self->_value = a3;
    [(MCLRatingsView *)self setNeedsDisplay];
  }
}

- (void)setEmptyImage:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_emptyImage, location[0]);
  [(MCLRatingsView *)v4 setNeedsDisplay];
  objc_storeStrong(location, 0);
}

- (void)setFullImage:(id)a3
{
  SEL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] && ([location[0] size], v3 > 0.0))
  {
    objc_storeStrong((id *)&v8->_fullImage, location[0]);
    [location[0] size];
    double v6 = v4;
    [location[0] size];
    v8->_imageaspect = v6 / v5;
  }
  else
  {
    v8->_imageaspect = 1.0;
  }
  [(MCLRatingsView *)v8 setNeedsUpdateConstraints];
  [(MCLRatingsView *)v8 setNeedsDisplay];
  objc_storeStrong(location, 0);
}

- (void)updateConstraints
{
  double v4 = self;
  v3[1] = (id)a2;
  if (self->_widthConstraint) {
    [(NSLayoutConstraint *)v4->_widthConstraint setActive:0];
  }
  v3[0] = (id)[MEMORY[0x263F08938] constraintWithItem:v4 attribute:7 relatedBy:0 toItem:v4 attribute:8 multiplier:5.0 * v4->_imageaspect constant:5.0 * v4->_spacing];
  [v3[0] setActive:1];
  objc_storeStrong((id *)&v4->_widthConstraint, v3[0]);
  v2.receiver = v4;
  v2.super_class = (Class)MCLRatingsView;
  [(MCLRatingsView *)&v2 updateConstraints];
  objc_storeStrong(v3, 0);
}

- (void)drawRect:(CGRect)a3
{
  if (self->_fullImage)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    [(MCLRatingsView *)self bounds];
    v12.origin.x = v3;
    v12.origin.y = v4;
    v12.size.height = v5;
    v12.size.width = v5 * self->_imageaspect;
    for (int i = 1; i <= 5; ++i)
    {
      if (self->_value < (double)i)
      {
        -[UIImage drawInRect:](self->_emptyImage, "drawInRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
        if (self->_value > (double)(i - 1))
        {
          CGRectMake_0();
          rect.origin.x = v6;
          rect.origin.y = v7;
          rect.size.width = v8;
          rect.size.height = v9;
          CGContextSaveGState(CurrentContext);
          UIRectClip(rect);
          -[UIImage drawInRect:](self->_fullImage, "drawInRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
          CGContextRestoreGState(CurrentContext);
        }
      }
      else
      {
        -[UIImage drawInRect:](self->_fullImage, "drawInRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
      }
      v12.origin.x = CGRectGetMaxX(v12) + self->_spacing;
    }
  }
}

- (double)spacing
{
  return self->_spacing;
}

- (double)value
{
  return self->_value;
}

- (UIImage)emptyImage
{
  return self->_emptyImage;
}

- (UIImage)fullImage
{
  return self->_fullImage;
}

- (BOOL)actionVariant
{
  return self->_actionVariant;
}

- (void)setActionVariant:(BOOL)a3
{
  self->_actionVariant = a3;
}

- (void).cxx_destruct
{
}

@end