@interface SCATModernMenuFooterView
- (SCATModernMenuFooterView)initWithFrame:(CGRect)a3;
- (UIPageControl)moreItemsPageControl;
- (void)setMoreItemsPageControl:(id)a3;
@end

@implementation SCATModernMenuFooterView

- (SCATModernMenuFooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SCATModernMenuFooterView;
  v7 = -[SCATModernMenuFooterView initWithFrame:](&v24, "initWithFrame:");
  if (v7)
  {
    v8 = -[SCATModernMenuPageControl initWithFrame:]([SCATModernMenuPageControl alloc], "initWithFrame:", x, y, width, height);
    v9 = sub_100040EC8(@"MORE");
    [(SCATModernMenuPageControl *)v8 setScatSpeakableDescription:v9];

    [(SCATModernMenuFooterView *)v7 setMoreItemsPageControl:v8];
    [(SCATModernMenuFooterView *)v7 addSubview:v8];
    [(SCATModernMenuPageControl *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(SCATModernMenuPageControl *)v8 topAnchor];
    v22 = [(SCATModernMenuFooterView *)v7 topAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v25[0] = v21;
    v20 = [(SCATModernMenuPageControl *)v8 bottomAnchor];
    v19 = [(SCATModernMenuFooterView *)v7 bottomAnchor];
    v10 = [v20 constraintEqualToAnchor:v19];
    v25[1] = v10;
    v11 = [(SCATModernMenuPageControl *)v8 leadingAnchor];
    v12 = [(SCATModernMenuFooterView *)v7 leadingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:10.0];
    v25[2] = v13;
    v14 = [(SCATModernMenuPageControl *)v8 trailingAnchor];
    v15 = [(SCATModernMenuFooterView *)v7 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:-10.0];
    v25[3] = v16;
    v17 = +[NSArray arrayWithObjects:v25 count:4];
    +[NSLayoutConstraint activateConstraints:v17];
  }
  return v7;
}

- (UIPageControl)moreItemsPageControl
{
  return self->_moreItemsPageControl;
}

- (void)setMoreItemsPageControl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end