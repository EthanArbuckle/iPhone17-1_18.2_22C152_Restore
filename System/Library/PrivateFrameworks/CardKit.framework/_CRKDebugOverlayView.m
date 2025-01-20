@interface _CRKDebugOverlayView
- (NSString)debugText;
- (UIColor)color;
- (_CRKDebugOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setDebugText:(id)a3;
@end

@implementation _CRKDebugOverlayView

- (_CRKDebugOverlayView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_CRKDebugOverlayView;
  v3 = -[_CRKDebugOverlayView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_CRKDebugOverlayView *)v3 layer];
    [v5 setBorderWidth:2.0];

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    label = v4->_label;
    v4->_label = v6;

    [(UILabel *)v4->_label setNumberOfLines:0];
    [(UILabel *)v4->_label setTextAlignment:2];
    v8 = v4->_label;
    v9 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    [(UILabel *)v8 setFont:v9];

    [(_CRKDebugOverlayView *)v4 addSubview:v4->_label];
  }
  return v4;
}

- (void)setColor:(id)a3
{
  id v7 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    v5 = [(_CRKDebugOverlayView *)self layer];
    id v6 = v7;
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    [(UILabel *)self->_label setTextColor:v6];
    [(_CRKDebugOverlayView *)self setNeedsLayout];
  }
}

- (void)setDebugText:(id)a3
{
  id v5 = a3;
  if ((-[NSString isEqual:](self->_debugText, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_debugText, a3);
    [(UILabel *)self->_label setText:v5];
    [(_CRKDebugOverlayView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_CRKDebugOverlayView;
  [(_CRKDebugOverlayView *)&v13 layoutSubviews];
  [(UILabel *)self->_label sizeToFit];
  [(_CRKDebugOverlayView *)self bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  label = self->_label;
  double MaxX = CGRectGetMaxX(v14);
  [(UILabel *)self->_label bounds];
  double v9 = MaxX - CGRectGetWidth(v15) + -2.0 + -1.0;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v16);
  [(UILabel *)self->_label bounds];
  double v11 = MaxY - CGRectGetHeight(v17) + -2.0 + -1.0;
  [(UILabel *)self->_label bounds];
  double v12 = CGRectGetWidth(v18);
  [(UILabel *)self->_label bounds];
  -[UILabel setFrame:](label, "setFrame:", v9, v11, v12, CGRectGetHeight(v19));
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)debugText
{
  return self->_debugText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugText, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end