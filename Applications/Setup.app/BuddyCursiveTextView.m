@interface BuddyCursiveTextView
- (BuddyCursiveTextView)init;
- (BuddyCursiveTextView)initWithFrame:(CGRect)a3;
- (double)duration;
- (void)configure;
- (void)layoutSubviews;
- (void)loadText:(id)a3 pointSize:(double)a4;
- (void)setAccessibilityLabel:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setTime:(float)a3;
@end

@implementation BuddyCursiveTextView

- (BuddyCursiveTextView)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyCursiveTextView;
  id location = [(BuddyCursiveTextView *)&v4 init];
  objc_storeStrong(&location, location);
  if (location) {
    [location configure];
  }
  v2 = (BuddyCursiveTextView *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (BuddyCursiveTextView)initWithFrame:(CGRect)a3
{
  CGRect v8 = a3;
  SEL v6 = a2;
  id location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyCursiveTextView;
  id location = -[BuddyCursiveTextView initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location) {
    [location configure];
  }
  v3 = (BuddyCursiveTextView *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)configure
{
  v2 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
  textLayer = self->_textLayer;
  self->_textLayer = v2;

  objc_super v4 = self->_textLayer;
  [(BuddyCursiveTextView *)self bounds];
  -[CAShapeLayer setFrame:](v4, "setFrame:", v5, v6, v7, v8);
  [(CAShapeLayer *)self->_textLayer setShadowRadius:1.0];
  LODWORD(v9) = 1036831949;
  [(CAShapeLayer *)self->_textLayer setShadowOpacity:v9];
  v10 = self->_textLayer;
  double v11 = sub_10008E9E4();
  -[CAShapeLayer setShadowOffset:](v10, "setShadowOffset:", v11, v12, *(void *)&v11, *(void *)&v12);
  id v13 = [(BuddyCursiveTextView *)self layer];
  [v13 addSublayer:self->_textLayer];
}

- (void)layoutSubviews
{
  double v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyCursiveTextView;
  [(BuddyCursiveTextView *)&v7 layoutSubviews];
  textLayer = v9->_textLayer;
  [(BuddyCursiveTextView *)v9 bounds];
  -[CAShapeLayer setFrame:](textLayer, "setFrame:", v3, v4, v5, v6, *(void *)&v3, *(void *)&v4, *(void *)&v5, *(void *)&v6);
}

- (void)loadText:(id)a3 pointSize:(double)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v15 = a4;
  double v5 = [BuddyCursiveTextPath alloc];
  double v6 = [(BuddyCursiveTextPath *)v5 initWithURL:location[0]];
  textPath = v17->_textPath;
  v17->_textPath = v6;

  if (v17->_textPath)
  {
    p_textTransform = &v17->_textTransform;
    double v9 = v17->_textPath;
    [(CAShapeLayer *)v17->_textLayer bounds];
    if (v9) {
      -[BuddyCursiveTextPath transformForRect:pointSize:flipped:](v9, "transformForRect:pointSize:flipped:", 1, v10, v11, v12, v13, v15);
    }
    else {
      memset(__b, 0, sizeof(__b));
    }
    memcpy(p_textTransform, __b, sizeof(CGAffineTransform));
  }
  objc_storeStrong(location, 0);
}

- (double)duration
{
  [(BuddyCursiveTextPath *)self->_textPath duration];
  return result;
}

- (void)setTime:(float)a3
{
  path = [(BuddyCursiveTextPath *)self->_textPath pathForTime:a3];
  CopyByTransformingPath = CGPathCreateCopyByTransformingPath(path, &self->_textTransform);
  [(CAShapeLayer *)self->_textLayer setPath:CopyByTransformingPath];
  [(CAShapeLayer *)self->_textLayer setShadowPath:CopyByTransformingPath];
  CGPathRelease(CopyByTransformingPath);
  CGPathRelease(path);
}

- (void)setFillColor:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CAShapeLayer setFillColor:](v4->_textLayer, "setFillColor:", [location[0] CGColor]);
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityLabel:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)BuddyCursiveTextView;
  [(BuddyCursiveTextView *)&v3 setAccessibilityLabel:location[0]];
  [(BuddyCursiveTextPath *)v5->_textPath setAccessibilityLabel:location[0]];
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end