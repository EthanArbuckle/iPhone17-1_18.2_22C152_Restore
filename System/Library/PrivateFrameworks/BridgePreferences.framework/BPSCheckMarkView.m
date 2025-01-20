@interface BPSCheckMarkView
- (BOOL)isChecked;
- (BPSCheckMarkView)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)imageView;
- (id)checkedImage;
- (id)uncheckedImage;
- (void)layoutSubviews;
- (void)setImageView:(id)a3;
- (void)setIsChecked:(BOOL)a3;
@end

@implementation BPSCheckMarkView

- (BPSCheckMarkView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BPSCheckMarkView;
  v3 = -[BPSCheckMarkView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
    v5 = [(BPSCheckMarkView *)v3 uncheckedImage];
    uint64_t v6 = [v4 initWithImage:v5];
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    [(BPSCheckMarkView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(BPSCheckMarkView *)self bounds];
  imageView = self->_imageView;
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 23.0;
  double v4 = 23.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setIsChecked:(BOOL)a3
{
  self->_isChecked = a3;
  imageView = self->_imageView;
  if (a3) {
    [(BPSCheckMarkView *)self checkedImage];
  }
  else {
  id v4 = [(BPSCheckMarkView *)self uncheckedImage];
  }
  [(UIImageView *)imageView setImage:v4];
}

- (id)checkedImage
{
  -[BPSCheckMarkView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  CGFloat width = v12.width;
  CGFloat height = v12.height;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  uint64_t v6 = [(BPSCheckMarkView *)self tintColor];
  [v6 setFill];

  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGContextFillEllipseInRect(CurrentContext, v13);
  v7 = [MEMORY[0x263F1C550] whiteColor];
  [v7 setStroke];

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 6.5, 12.0);
  CGPathAddLineToPoint(Mutable, 0, 9.5, 15.0);
  CGPathAddLineToPoint(Mutable, 0, 16.5, 8.5);
  CGContextSetLineCap(CurrentContext, kCGLineCapRound);
  CGContextSetLineWidth(CurrentContext, 1.5);
  CGContextAddPath(CurrentContext, Mutable);
  CGPathRelease(Mutable);
  CGContextStrokePath(CurrentContext);
  objc_super v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v9;
}

- (id)uncheckedImage
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  -[BPSCheckMarkView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x263F001B0], v4);
  double v6 = v5;
  double v8 = v7;
  -[BPSCheckMarkView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v10 = [(BPSCheckMarkView *)self tintColor];
  [v10 setStroke];

  v15.size.CGFloat width = v6 + -2.0;
  v15.size.CGFloat height = v8 + -2.0;
  v15.origin.x = 1.0;
  v15.origin.y = 1.0;
  CGContextStrokeEllipseInRect(CurrentContext, v15);
  v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v11;
}

- (BOOL)isChecked
{
  return self->_isChecked;
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