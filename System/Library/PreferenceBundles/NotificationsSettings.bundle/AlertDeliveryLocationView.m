@interface AlertDeliveryLocationView
+ (double)preferredHeightInWidth:(double)a3;
+ (id)preferredFont;
- (AlertDeliveryLocationView)initWithFrame:(CGRect)a3;
- (BOOL)_isTemplateViewForSizing;
- (BOOL)highlighted;
- (BOOL)selected;
- (CGRect)_usedRect;
- (id)_alertDeliveryLocationImageForType:(unint64_t)a3;
- (id)_typeImageViewTintColorSelected:(BOOL)a3;
- (unint64_t)type;
- (void)_animateStateChange;
- (void)_setIsTemplateViewForSizing:(BOOL)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setType:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForUserInterfaceStyleChange;
@end

@implementation AlertDeliveryLocationView

- (AlertDeliveryLocationView)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)AlertDeliveryLocationView;
  v3 = -[AlertDeliveryLocationView initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  typeImageView = v3->_typeImageView;
  v3->_typeImageView = v4;

  v6 = v3->_typeImageView;
  v7 = [(AlertDeliveryLocationView *)v3 _typeImageViewTintColorSelected:0];
  [(UIImageView *)v6 setTintColor:v7];

  id v8 = objc_alloc((Class)UIImageView);
  v9 = +[UIImage systemImageNamed:@"circle"];
  v10 = (UIImageView *)[v8 initWithImage:v9];
  uncheckedView = v3->_uncheckedView;
  v3->_uncheckedView = v10;

  [(UIImageView *)v3->_uncheckedView setContentMode:4];
  [(UIImageView *)v3->_uncheckedView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  v12 = v3->_uncheckedView;
  v13 = +[UIColor tertiaryLabelColor];
  [(UIImageView *)v12 setTintColor:v13];

  v14 = v3->_uncheckedView;
  v15 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody scale:3];
  [(UIImageView *)v14 setPreferredSymbolConfiguration:v15];

  id v16 = objc_alloc((Class)UIImageView);
  v17 = +[UIImage systemImageNamed:@"checkmark.circle.fill"];
  v18 = (UIImageView *)[v16 initWithImage:v17];
  checkedView = v3->_checkedView;
  v3->_checkedView = v18;

  [(UIImageView *)v3->_checkedView setContentMode:4];
  [(UIImageView *)v3->_checkedView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  v20 = v3->_checkedView;
  v21 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody scale:3];
  [(UIImageView *)v20 setPreferredSymbolConfiguration:v21];

  v22 = (UILabel *)objc_alloc_init((Class)UILabel);
  typeLabel = v3->_typeLabel;
  v3->_typeLabel = v22;

  [(UILabel *)v3->_typeLabel setNumberOfLines:0];
  [(UILabel *)v3->_typeLabel setTextAlignment:1];
  v24 = v3->_typeLabel;
  v25 = +[AlertDeliveryLocationView preferredFont];
  [(UILabel *)v24 setFont:v25];

  [(AlertDeliveryLocationView *)v3 addSubview:v3->_typeImageView];
  [(AlertDeliveryLocationView *)v3 addSubview:v3->_uncheckedView];
  [(AlertDeliveryLocationView *)v3 addSubview:v3->_checkedView];
  [(AlertDeliveryLocationView *)v3 addSubview:v3->_typeLabel];
  return v3;
}

- (id)_alertDeliveryLocationImageForType:(unint64_t)a3
{
  if (a3 > 2) {
    v5 = 0;
  }
  else {
    v5 = off_41388[a3];
  }
  v6 = NCDeviceTypePrefix();
  v7 = +[NSString stringWithFormat:@"%@-%@", v6, v5];

  id v8 = +[UIScreen mainScreen];
  v9 = [v8 traitCollection];
  v10 = (char *)[v9 userInterfaceIdiom];

  if (v10 == (unsigned char *)&dword_0 + 1)
  {
    v11 = +[BSPlatform sharedInstance];
    v12 = (char *)[v11 homeButtonType];

    if (v12 != (unsigned char *)&dword_0 + 2)
    {
      uint64_t v13 = +[NSString stringWithFormat:@"%@-legacy", v7];

      v7 = (void *)v13;
    }
    v14 = [(AlertDeliveryLocationView *)self traitCollection];
    v15 = (char *)[v14 userInterfaceStyle];

    if (v15 == (unsigned char *)&dword_0 + 2)
    {
      uint64_t v16 = +[NSString stringWithFormat:@"%@-dark", v7];

      v7 = (void *)v16;
    }
  }
  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = +[UIImage imageNamed:v7 inBundle:v17];
  v19 = v18;
  if (!a3)
  {
    uint64_t v20 = NCDeviceImageWithDefaultSystemClock(v18);

    v19 = (void *)v20;
  }
  v21 = [v19 imageWithRenderingMode:2];

  return v21;
}

- (void)layoutSubviews
{
  unsigned int v3 = [(AlertDeliveryLocationView *)self highlighted];
  double v4 = 0.5056;
  if (!v3) {
    double v4 = 1.0;
  }
  [(AlertDeliveryLocationView *)self setAlpha:v4];
  [(AlertDeliveryLocationView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  v9 = [(UIImageView *)self->_typeImageView image];
  [v9 size];

  UIRectCenteredXInRect();
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v42 = v15;
  CGFloat v43 = v14;
  -[UIImageView setFrame:](self->_typeImageView, "setFrame:");
  -[UILabel sizeThatFits:](self->_typeLabel, "sizeThatFits:", v6, 1.79769313e308);
  double v16 = v8;
  UIRectCenteredXInRect();
  -[UILabel setFrame:](self->_typeLabel, "setFrame:");
  v17 = [(UILabel *)self->_typeLabel font];
  [v17 _scaledValueForValue:18.0];
  double v19 = v18;

  v46.origin.x = v11;
  v46.origin.y = v13;
  v46.size.height = v42;
  v46.size.width = v43;
  [(UILabel *)self->_typeLabel _setFirstLineBaselineFrameOriginY:v19 + CGRectGetMaxY(v46)];
  uint64_t v20 = [(UILabel *)self->_typeLabel font];
  [v20 _scaledValueForValue:14.0];

  [(UIImageView *)self->_checkedView intrinsicContentSize];
  if (v21 >= v22) {
    double v23 = v21;
  }
  else {
    double v23 = v22;
  }
  [(UILabel *)self->_typeLabel frame];
  CGRectGetMaxY(v47);
  UIRectCenteredXInRect();
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  if (![(AlertDeliveryLocationView *)self _isTemplateViewForSizing])
  {
    double v32 = v16 - v23;
    v48.origin.x = v25;
    v48.origin.y = v27;
    v48.size.width = v29;
    v48.size.height = v31;
    double MinY = CGRectGetMinY(v48);
    v49.origin.x = v25;
    v49.origin.y = v32;
    v49.size.width = v23;
    v49.size.height = v23;
    if (MinY < CGRectGetMinY(v49))
    {
      double v27 = v32;
      double v29 = v23;
      double v31 = v23;
    }
  }
  memset(&v45, 0, sizeof(v45));
  if ([(AlertDeliveryLocationView *)self selected])
  {
    long long v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v45.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v45.c = v34;
    *(_OWORD *)&v45.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    CGAffineTransformMakeScale(&v45, 0.01, 0.01);
  }
  checkedView = self->_checkedView;
  long long v36 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v44.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v44.c = v36;
  *(_OWORD *)&v44.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(UIImageView *)checkedView setTransform:&v44];
  -[UIImageView setFrame:](self->_checkedView, "setFrame:", v25, v27, v29, v31);
  v37 = self->_checkedView;
  CGAffineTransform v44 = v45;
  [(UIImageView *)v37 setTransform:&v44];
  -[UIImageView setFrame:](self->_uncheckedView, "setFrame:", v25, v27, v29, v31);
  [(UIImageView *)self->_checkedView _setCornerRadius:v23 * 0.5];
  [(UIImageView *)self->_uncheckedView _setCornerRadius:v23 * 0.5];
  v38 = self->_checkedView;
  if ([(AlertDeliveryLocationView *)self selected]) {
    double v39 = 1.0;
  }
  else {
    double v39 = 0.0;
  }
  [(UIImageView *)v38 setAlpha:v39];
  uncheckedView = self->_uncheckedView;
  if ([(AlertDeliveryLocationView *)self selected]) {
    double v41 = 0.0;
  }
  else {
    double v41 = 1.0;
  }
  [(UIImageView *)uncheckedView setAlpha:v41];
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
  switch(a3)
  {
    case 2uLL:
      double v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      double v6 = v5;
      CFStringRef v7 = @"BANNER_ALERTS";
      goto LABEL_7;
    case 1uLL:
      double v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      double v6 = v5;
      CFStringRef v7 = @"HISTORY_DESTINATION";
      goto LABEL_7;
    case 0uLL:
      double v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      double v6 = v5;
      CFStringRef v7 = @"LOCK_SCREEN_DESTINATION";
LABEL_7:
      id v9 = [v5 localizedStringForKey:v7 value:&stru_419A0 table:@"NotificationsSettings"];

      goto LABEL_9;
  }
  id v9 = 0;
LABEL_9:
  [(UILabel *)self->_typeLabel setText:v9];
  double v8 = [(AlertDeliveryLocationView *)self _alertDeliveryLocationImageForType:a3];
  [(UIImageView *)self->_typeImageView setImage:v8];
  [(AlertDeliveryLocationView *)self setNeedsLayout];
}

- (void)updateForUserInterfaceStyleChange
{
  id v3 = [(AlertDeliveryLocationView *)self _alertDeliveryLocationImageForType:self->_type];
  [(UIImageView *)self->_typeImageView setImage:v3];
  [(AlertDeliveryLocationView *)self setNeedsLayout];
}

- (void)_animateStateChange
{
  [(AlertDeliveryLocationView *)self setNeedsLayout];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1E0C0;
  v3[3] = &unk_40F58;
  v3[4] = self;
  +[UIView _animateUsingDefaultTimingWithOptions:2054 animations:v3 completion:0];
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(AlertDeliveryLocationView *)self selected] != a3)
  {
    self->_selected = v5;
    typeImageView = self->_typeImageView;
    double v8 = [(AlertDeliveryLocationView *)self _typeImageViewTintColorSelected:v5];
    [(UIImageView *)typeImageView setTintColor:v8];

    if (v4)
    {
      [(AlertDeliveryLocationView *)self _animateStateChange];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if ([(AlertDeliveryLocationView *)self highlighted] != a3)
  {
    self->_highlighted = a3;
    [(AlertDeliveryLocationView *)self setNeedsLayout];
  }
}

- (CGRect)_usedRect
{
  [(UIImageView *)self->_typeImageView frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UILabel *)self->_typeLabel frame];
  v45.origin.CGFloat x = v11;
  v45.origin.CGFloat y = v12;
  v45.size.CGFloat width = v13;
  v45.size.CGFloat height = v14;
  v40.origin.CGFloat x = v4;
  v40.origin.CGFloat y = v6;
  v40.size.CGFloat width = v8;
  v40.size.CGFloat height = v10;
  CGRect v41 = CGRectUnion(v40, v45);
  CGFloat x = v41.origin.x;
  CGFloat y = v41.origin.y;
  CGFloat width = v41.size.width;
  CGFloat height = v41.size.height;
  [(UIImageView *)self->_checkedView frame];
  v46.origin.CGFloat x = v19;
  v46.origin.CGFloat y = v20;
  v46.size.CGFloat width = v21;
  v46.size.CGFloat height = v22;
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGRect v43 = CGRectUnion(v42, v46);
  CGFloat v23 = v43.origin.x;
  CGFloat v24 = v43.origin.y;
  CGFloat v25 = v43.size.width;
  CGFloat v26 = v43.size.height;
  [(UIImageView *)self->_uncheckedView frame];
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  CGFloat v35 = v23;
  CGFloat v36 = v24;
  CGFloat v37 = v25;
  CGFloat v38 = v26;

  return CGRectUnion(*(CGRect *)&v35, *(CGRect *)&v28);
}

+ (id)preferredFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
}

+ (double)preferredHeightInWidth:(double)a3
{
  uint64_t v3 = 0;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  do
  {
    CGFloat v8 = -[AlertDeliveryLocationView initWithFrame:]([AlertDeliveryLocationView alloc], "initWithFrame:", 0.0, 0.0, a3, 1000.0);
    [(AlertDeliveryLocationView *)v8 _setIsTemplateViewForSizing:1];
    [(AlertDeliveryLocationView *)v8 setType:v3];
    [(AlertDeliveryLocationView *)v8 layoutIfNeeded];
    [(AlertDeliveryLocationView *)v8 _usedRect];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.double height = height;
    if (CGRectIsNull(v19))
    {
      double height = v16;
    }
    else
    {
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.double height = height;
      v22.origin.CGFloat x = v10;
      v22.origin.CGFloat y = v12;
      v22.size.CGFloat width = v14;
      v22.size.double height = v16;
      CGRect v21 = CGRectUnion(v20, v22);
      CGFloat v10 = v21.origin.x;
      CGFloat v12 = v21.origin.y;
      CGFloat v14 = v21.size.width;
      double height = v21.size.height;
    }

    ++v3;
    CGFloat x = v10;
    CGFloat y = v12;
    CGFloat width = v14;
  }
  while (v3 != 3);
  return height;
}

- (id)_typeImageViewTintColorSelected:(BOOL)a3
{
  if (a3) {
    +[UIColor systemBlueColor];
  }
  else {
  uint64_t v3 = +[UIColor grayColor];
  }

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AlertDeliveryLocationView;
  id v4 = a3;
  [(AlertDeliveryLocationView *)&v8 traitCollectionDidChange:v4];
  id v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  CGFloat v6 = [(AlertDeliveryLocationView *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(AlertDeliveryLocationView *)self updateForUserInterfaceStyleChange];
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)_isTemplateViewForSizing
{
  return self->_isTemplateViewForSizing;
}

- (void)_setIsTemplateViewForSizing:(BOOL)a3
{
  self->_isTemplateViewForSizing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkedView, 0);
  objc_storeStrong((id *)&self->_uncheckedView, 0);
  objc_storeStrong((id *)&self->_typeLabel, 0);

  objc_storeStrong((id *)&self->_typeImageView, 0);
}

@end