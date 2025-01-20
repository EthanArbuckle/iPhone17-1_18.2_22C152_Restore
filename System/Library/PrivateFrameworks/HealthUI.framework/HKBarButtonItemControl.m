@interface HKBarButtonItemControl
- (BOOL)collapseHeight;
- (BOOL)isEnabled;
- (CGSize)intrinsicContentSize;
- (HKBarButtonItemControl)initWithSystemItem:(int64_t)a3 preferredHeight:(double)a4 collapseHeight:(BOOL)a5;
- (UIBarButtonItem)barButtonItem;
- (UIControl)barButtonItemControl;
- (UIToolbar)toolbar;
- (double)horizontalMargin;
- (int64_t)preferredHeight;
- (void)_barButtonAction:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setCollapseHeight:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHorizontalMargin:(double)a3;
- (void)setPreferredHeight:(int64_t)a3;
- (void)setTintColor:(id)a3;
@end

@implementation HKBarButtonItemControl

- (HKBarButtonItemControl)initWithSystemItem:(int64_t)a3 preferredHeight:(double)a4 collapseHeight:(BOOL)a5
{
  v22.receiver = self;
  v22.super_class = (Class)HKBarButtonItemControl;
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v12 = -[HKBarButtonItemControl initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    double v14 = 44.0;
    if (a4 > 0.0) {
      double v14 = a4;
    }
    v12->_preferredHeight = (uint64_t)v14;
    v12->_collapseHeight = a5;
    v12->_horizontalMargin = 2.0;
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DF0]), "initWithFrame:", v8, v9, v10, v11);
    toolbar = v13->_toolbar;
    v13->_toolbar = (UIToolbar *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:a3 target:0 action:0];
    barButtonItem = v13->_barButtonItem;
    v13->_barButtonItem = (UIBarButtonItem *)v17;

    v19 = [(UIBarButtonItem *)v13->_barButtonItem createViewForToolbar:v13->_toolbar];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v13->_barButtonItemControl, v19);
      [(UIControl *)v13->_barButtonItemControl addTarget:v13 action:sel__barButtonAction_ forControlEvents:0x2000];
      [(HKBarButtonItemControl *)v13 addSubview:v13->_barButtonItemControl];
    }
    [(HKBarButtonItemControl *)v13 setClipsToBounds:1];
    v20 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(HKBarButtonItemControl *)v13 setBackgroundColor:v20];
  }
  return v13;
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKBarButtonItemControl;
  id v4 = a3;
  [(HKBarButtonItemControl *)&v5 setBackgroundColor:v4];
  -[UIControl setBackgroundColor:](self->_barButtonItemControl, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
}

- (void)setTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKBarButtonItemControl;
  id v4 = a3;
  [(HKBarButtonItemControl *)&v5 setTintColor:v4];
  -[UIControl setTintColor:](self->_barButtonItemControl, "setTintColor:", v4, v5.receiver, v5.super_class);
}

- (void)setHorizontalMargin:(double)a3
{
  self->_horizontalMargin = a3;
  [(HKBarButtonItemControl *)self invalidateIntrinsicContentSize];
  [(HKBarButtonItemControl *)self setNeedsLayout];
}

- (BOOL)isEnabled
{
  return [(UIControl *)self->_barButtonItemControl isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)layoutSubviews
{
  [(HKBarButtonItemControl *)self bounds];
  barButtonItemControl = self->_barButtonItemControl;
  -[UIControl setFrame:](barButtonItemControl, "setFrame:", 0.0, 0.0);
}

- (CGSize)intrinsicContentSize
{
  [(UIControl *)self->_barButtonItemControl frame];
  double v4 = v3 + self->_horizontalMargin * 2.0;
  double preferredHeight = (double)self->_preferredHeight;
  result.height = preferredHeight;
  result.width = v4;
  return result;
}

- (void)_barButtonAction:(id)a3
{
}

- (int64_t)preferredHeight
{
  return self->_preferredHeight;
}

- (void)setPreferredHeight:(int64_t)a3
{
  self->_double preferredHeight = a3;
}

- (BOOL)collapseHeight
{
  return self->_collapseHeight;
}

- (void)setCollapseHeight:(BOOL)a3
{
  self->_collapseHeight = a3;
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (UIControl)barButtonItemControl
{
  return self->_barButtonItemControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItemControl, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end