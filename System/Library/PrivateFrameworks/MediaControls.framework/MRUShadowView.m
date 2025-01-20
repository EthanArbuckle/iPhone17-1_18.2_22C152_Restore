@interface MRUShadowView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGSize)offset;
- (MRUShadowView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (double)radius;
- (float)opacity;
- (id)compositingFilter;
- (void)setColor:(id)a3;
- (void)setCompositingFilter:(id)a3;
- (void)setOffset:(CGSize)a3;
- (void)setOpacity:(float)a3;
- (void)setRadius:(double)a3;
@end

@implementation MRUShadowView

- (MRUShadowView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRUShadowView;
  v3 = -[MRUShadowView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MRUShadowView *)v3 layer];
    [v5 setShadowPathIsBounds:1];

    [(MRUShadowView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)setColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];
  id v5 = [(MRUShadowView *)self layer];
  [v5 setShadowColor:v4];
}

- (void)setCompositingFilter:(id)a3
{
  id v4 = a3;
  id v5 = [(MRUShadowView *)self layer];
  [v5 setCompositingFilter:v4];
}

- (void)setOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(MRUShadowView *)self layer];
  objc_msgSend(v5, "setShadowOffset:", width, height);
}

- (void)setRadius:(double)a3
{
  id v4 = [(MRUShadowView *)self layer];
  [v4 setShadowRadius:a3];
}

- (void)setOpacity:(float)a3
{
  id v5 = [(MRUShadowView *)self layer];
  *(float *)&double v4 = a3;
  [v5 setShadowOpacity:v4];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUShadowView;
  if ([(MRUShadowView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 hasPrefix:@"shadow"];
  }

  return v5;
}

- (UIColor)color
{
  return self->_color;
}

- (id)compositingFilter
{
  return self->_compositingFilter;
}

- (CGSize)offset
{
  double width = self->_offset.width;
  double height = self->_offset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (float)opacity
{
  return self->_opacity;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_compositingFilter, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end