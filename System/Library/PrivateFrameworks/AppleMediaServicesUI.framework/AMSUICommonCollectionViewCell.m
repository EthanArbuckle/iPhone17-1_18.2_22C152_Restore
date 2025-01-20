@interface AMSUICommonCollectionViewCell
- (AMSUICommonCollectionViewCell)init;
- (AMSUICommonCollectionViewCell)initWithFrame:(CGRect)a3;
- (AMSUICommonView)underlyingContentView;
- (id)tintColor;
- (void)_setup;
- (void)layoutSubviews;
@end

@implementation AMSUICommonCollectionViewCell

- (AMSUICommonCollectionViewCell)init
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUICommonCollectionViewCell;
  v2 = [(AMSUICommonCollectionViewCell *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AMSUICommonCollectionViewCell *)v2 _setup];
  }
  return v3;
}

- (AMSUICommonCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonCollectionViewCell;
  v3 = -[AMSUICommonCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AMSUICommonCollectionViewCell *)v3 _setup];
  }
  return v4;
}

- (id)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUICommonCollectionViewCell;
  v2 = [(AMSUICommonCollectionViewCell *)&v4 tintColor];
  return v2;
}

- (void)_setup
{
  if (!self->_underlyingContentView)
  {
    v3 = objc_alloc_init(AMSUICommonView);
    underlyingContentView = self->_underlyingContentView;
    self->_underlyingContentView = v3;

    v6.receiver = self;
    v6.super_class = (Class)AMSUICommonCollectionViewCell;
    objc_super v5 = [(AMSUICommonCollectionViewCell *)&v6 contentView];
    [v5 addSubview:self->_underlyingContentView];
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AMSUICommonCollectionViewCell;
  [(AMSUICommonCollectionViewCell *)&v14 layoutSubviews];
  v13.receiver = self;
  v13.super_class = (Class)AMSUICommonCollectionViewCell;
  v3 = [(AMSUICommonCollectionViewCell *)&v13 contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(AMSUICommonCollectionViewCell *)self underlyingContentView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (AMSUICommonView)underlyingContentView
{
  return self->_underlyingContentView;
}

- (void).cxx_destruct
{
}

@end