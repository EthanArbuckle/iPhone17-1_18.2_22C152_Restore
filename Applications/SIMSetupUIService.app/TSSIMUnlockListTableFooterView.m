@interface TSSIMUnlockListTableFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (TSSIMUnlockListTableFooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TSSIMUnlockListTableFooterView

- (TSSIMUnlockListTableFooterView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)TSSIMUnlockListTableFooterView;
  v5 = -[TSSIMUnlockListTableFooterView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    id v6 = objc_alloc((Class)UIImageView);
    v7 = +[UIDevice currentDevice];
    id v8 = [v7 userInterfaceIdiom];
    if (v8)
    {
      int v9 = 0;
      CFStringRef v10 = @"guide";
    }
    else
    {
      v3 = +[UIScreen mainScreen];
      [v3 _referenceBounds];
      CFStringRef v10 = @"guide";
      if (CGRectGetHeight(v26) <= 812.0)
      {
        int v9 = 0;
      }
      else
      {
        v4 = +[BSPlatform sharedInstance];
        if ([v4 homeButtonType] == (id)2) {
          CFStringRef v10 = @"guide-d33like";
        }
        int v9 = 1;
      }
    }
    v11 = +[UIImage imageNamed:v10];
    v12 = (UIImageView *)[v6 initWithImage:v11];
    imageView = v5->_imageView;
    v5->_imageView = v12;

    if (v9) {
    if (!v8)
    }

    [(UIImageView *)v5->_imageView setContentMode:1];
    [(UIImageView *)v5->_imageView setClipsToBounds:1];
    [(TSSIMUnlockListTableFooterView *)v5 addSubview:v5->_imageView];
    v14 = objc_alloc_init(TSSIMUnlockCalloutLabel);
    slotOneLabel = v5->_slotOneLabel;
    v5->_slotOneLabel = v14;

    v16 = v5->_slotOneLabel;
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"HARDWARE_SLOT_ONE_NAME" value:&stru_100020AC8 table:@"Localizable"];
    [(TSSIMUnlockCalloutLabel *)v16 setText:v18];

    [(UIImageView *)v5->_imageView addSubview:v5->_slotOneLabel];
    v19 = objc_alloc_init(TSSIMUnlockCalloutLabel);
    slotTwoLabel = v5->_slotTwoLabel;
    v5->_slotTwoLabel = v19;

    v21 = v5->_slotTwoLabel;
    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"HARDWARE_SLOT_TWO_NAME" value:&stru_100020AC8 table:@"Localizable"];
    [(TSSIMUnlockCalloutLabel *)v21 setText:v23];

    [(UIImageView *)v5->_imageView addSubview:v5->_slotTwoLabel];
  }
  return v5;
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)TSSIMUnlockListTableFooterView;
  [(TSSIMUnlockListTableFooterView *)&v44 layoutSubviews];
  [(TSSIMUnlockListTableFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = +[UIDevice currentDevice];
  double v8 = 219.0;
  if ([v7 userInterfaceIdiom])
  {
    *(double *)&uint64_t v9 = 79.0;
    double v10 = 219.0;
  }
  else
  {
    v11 = +[UIScreen mainScreen];
    [v11 _referenceBounds];
    if (CGRectGetHeight(v45) <= 812.0)
    {
      double v10 = 219.0;
      *(double *)&uint64_t v9 = 79.0;
    }
    else
    {
      v12 = +[BSPlatform sharedInstance];
      id v13 = [v12 homeButtonType];
      if (v13 == (id)2) {
        double v10 = 240.0;
      }
      else {
        double v10 = 219.0;
      }
      uint64_t v9 = *((uint64_t *)&unk_1000180D0 + (v13 == (id)2));
    }
  }

  v14 = +[UIDevice currentDevice];
  if ([v14 userInterfaceIdiom])
  {
    double v41 = 231.0;
  }
  else
  {
    v15 = +[UIScreen mainScreen];
    [v15 _referenceBounds];
    if (CGRectGetHeight(v46) <= 812.0)
    {
      double v8 = 219.0;
      double v41 = 231.0;
    }
    else
    {
      v16 = +[BSPlatform sharedInstance];
      id v17 = [v16 homeButtonType];
      if (v17 == (id)2) {
        double v8 = 240.0;
      }
      else {
        double v8 = 219.0;
      }
      double v41 = dbl_1000180E0[v17 == (id)2];
    }
  }

  v18 = [(UIImageView *)self->_imageView image];

  if (v18)
  {
    -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v4, v6);
    double v20 = v19;
    v47.origin.double x = 0.0;
    v47.origin.double y = 0.0;
    v47.size.width = v4;
    v47.size.double height = v20;
    double v42 = *(double *)&v9;
    double Width = CGRectGetWidth(v47);
    v22 = [(UIImageView *)self->_imageView image];
    [v22 size];
    double v40 = v4;
    double v24 = v23;

    double v25 = v24 / v20;
    double v26 = Width - v10 * v25 + -20.0;
    -[TSSIMUnlockCalloutLabel sizeThatFits:](self->_slotOneLabel, "sizeThatFits:", v26, v20);
    double v28 = v27;
    double v39 = v10 * v25;
    double v43 = v27 * -0.5 + v42 * v25;
    double v29 = Width - v8 * v25 + -20.0;
    -[TSSIMUnlockCalloutLabel sizeThatFits:](self->_slotTwoLabel, "sizeThatFits:", v29, v20);
    double height = v30;
    double v32 = 0.0;
    double x = v8 * v25;
    double y = height * -0.5 + v41 * v25;
    double v35 = v26;
    double v37 = v39;
    double v36 = v40;
    double v38 = 0.0;
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double v29 = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    double v28 = height;
    double v35 = v29;
    double v43 = y;
    double v37 = CGRectZero.origin.x;
    double v20 = height;
    double v36 = v29;
    double v32 = y;
    double v38 = CGRectZero.origin.x;
  }
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v38, v32, v36, v20);
  -[TSSIMUnlockCalloutLabel setFrame:](self->_slotOneLabel, "setFrame:", v37, v43, v35, v28);
  -[TSSIMUnlockCalloutLabel setFrame:](self->_slotTwoLabel, "setFrame:", x, y, v29, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height);
  double v5 = width;
  result.double height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotTwoLabel, 0);
  objc_storeStrong((id *)&self->_slotOneLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end