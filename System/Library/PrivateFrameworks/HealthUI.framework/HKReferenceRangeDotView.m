@interface HKReferenceRangeDotView
- (CGRect)desiredDotViewFrame;
- (HKReferenceRangeDotView)initWithFrame:(CGRect)a3;
- (UIColor)dotColor;
- (_HKReferenceRangeDotViewDot)dotView;
- (void)setDotColor:(id)a3;
- (void)setDotView:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation HKReferenceRangeDotView

- (HKReferenceRangeDotView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKReferenceRangeDotView;
  v3 = -[HKReferenceRangeDotView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(HKReferenceRangeDotView *)v3 setBackgroundColor:v4];

    [(HKReferenceRangeDotView *)v3 setClipsToBounds:0];
    v5 = [_HKReferenceRangeDotViewDot alloc];
    [(HKReferenceRangeDotView *)v3 desiredDotViewFrame];
    v6 = -[_HKReferenceRangeDotViewDot initWithFrame:](v5, "initWithFrame:");
    [(HKReferenceRangeDotView *)v3 addSubview:v6];
    objc_storeWeak((id *)&v3->_dotView, v6);
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKReferenceRangeDotView;
  -[HKReferenceRangeDotView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(HKReferenceRangeDotView *)self desiredDotViewFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dotView);
  objc_msgSend(WeakRetained, "setFrame:", v5, v7, v9, v11);
}

- (CGRect)desiredDotViewFrame
{
  [(HKReferenceRangeDotView *)self bounds];
  return CGRectInset(*(CGRect *)&v2, -1.0, -1.0);
}

- (UIColor)dotColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dotView);
  v3 = [WeakRetained dotColor];

  return (UIColor *)v3;
}

- (void)setDotColor:(id)a3
{
  p_dotView = &self->_dotView;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dotView);
  [WeakRetained setDotColor:v4];
}

- (_HKReferenceRangeDotViewDot)dotView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dotView);
  return (_HKReferenceRangeDotViewDot *)WeakRetained;
}

- (void)setDotView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end