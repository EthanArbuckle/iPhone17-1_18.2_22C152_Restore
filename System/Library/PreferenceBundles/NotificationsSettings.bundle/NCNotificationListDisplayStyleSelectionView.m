@interface NCNotificationListDisplayStyleSelectionView
+ (id)notificationListDisplayStyleSelectionImageForType:(unint64_t)a3;
+ (id)notificationListDisplayStyleSelectionImageNameForType:(unint64_t)a3;
+ (id)notificationListDisplayStyleSelectionLabelTitleForType:(unint64_t)a3;
+ (id)notificationListDisplayStyleSelectionViewOfType:(unint64_t)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isSelected;
- (CGRect)_selectionLabelLayoutRectForRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationListDisplayStyleSelectionView)initWithFrame:(CGRect)a3;
- (NCNotificationListDisplayStyleSelectionViewDelegate)delegate;
- (UIImageView)selectionImageView;
- (UILabel)encapsulatedSelectionLabel;
- (UILabel)selectionLabel;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (id)_newSelectionLabelIsEncapsulated:(BOOL)a3;
- (id)_selectionImageViewTintColorSelected:(BOOL)a3;
- (unint64_t)selectionType;
- (void)_configureSelectionImageViewIfNecessary;
- (void)_configureSelectionLabelIfNecessary;
- (void)_handleLocationViewPress:(id)a3;
- (void)_layoutSelectionImageView;
- (void)_layoutSelectionLabel;
- (void)_swapSelectionLabelsOnToggledSelected:(BOOL)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEncapsulatedSelectionLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionImageView:(id)a3;
- (void)setSelectionLabel:(id)a3;
- (void)setSelectionType:(unint64_t)a3;
@end

@implementation NCNotificationListDisplayStyleSelectionView

+ (id)notificationListDisplayStyleSelectionViewOfType:(unint64_t)a3
{
  v4 = -[NCNotificationListDisplayStyleSelectionView initWithFrame:]([NCNotificationListDisplayStyleSelectionView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(NCNotificationListDisplayStyleSelectionView *)v4 setSelectionType:a3];

  return v4;
}

+ (id)notificationListDisplayStyleSelectionLabelTitleForType:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v4 = v3;
      CFStringRef v5 = @"NOTIFICATION_LIST_DISPLAY_STYLE_LIST";
      goto LABEL_7;
    case 1uLL:
      v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v4 = v3;
      CFStringRef v5 = @"NOTIFICATION_LIST_DISPLAY_STYLE_STACK";
      goto LABEL_7;
    case 0uLL:
      v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v4 = v3;
      CFStringRef v5 = @"NOTIFICATION_LIST_DISPLAY_STYLE_COUNT";
LABEL_7:
      v6 = [v3 localizedStringForKey:v5 value:&stru_419A0 table:@"NotificationsSettings"];

      goto LABEL_9;
  }
  v6 = @"<unknown>";
LABEL_9:

  return v6;
}

+ (id)notificationListDisplayStyleSelectionImageNameForType:(unint64_t)a3
{
  v4 = NCDeviceTypePrefix();
  if (a3 > 2) {
    CFStringRef v5 = &stru_419A0;
  }
  else {
    CFStringRef v5 = off_41040[a3];
  }
  v6 = +[NSString stringWithFormat:@"%@-%@", v4, v5];

  return v6;
}

+ (id)notificationListDisplayStyleSelectionImageForType:(unint64_t)a3
{
  v4 = +[UIScreen mainScreen];
  CFStringRef v5 = [v4 traitCollection];
  v6 = (char *)[v5 userInterfaceIdiom];

  if ((unint64_t)v6 > 1)
  {
    v15 = 0;
  }
  else
  {
    v7 = [(id)objc_opt_class() notificationListDisplayStyleSelectionImageNameForType:a3];
    v8 = +[BSPlatform sharedInstance];
    v9 = (char *)[v8 homeButtonType];

    if (v6 == (unsigned char *)&dword_0 + 1 && v9 != (unsigned char *)&dword_0 + 2)
    {
      uint64_t v11 = [v7 stringByAppendingString:@"-legacy"];

      v7 = (void *)v11;
    }
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = +[UIImage imageNamed:v7 inBundle:v12];
    v14 = NCDeviceImageWithDefaultSystemClock(v13);

    v15 = [v14 imageWithRenderingMode:2];
  }

  return v15;
}

- (NCNotificationListDisplayStyleSelectionView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListDisplayStyleSelectionView;
  v3 = -[NCNotificationListDisplayStyleSelectionView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v3 action:"_handleLocationViewPress:"];
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = v4;

    [(UILongPressGestureRecognizer *)v3->_longPressGestureRecognizer setDelegate:v3];
    [(UILongPressGestureRecognizer *)v3->_longPressGestureRecognizer setMinimumPressDuration:0.0];
    [(UILongPressGestureRecognizer *)v3->_longPressGestureRecognizer setCancelPastAllowableMovement:1];
    [(NCNotificationListDisplayStyleSelectionView *)v3 addGestureRecognizer:v3->_longPressGestureRecognizer];
    v6 = [(NCNotificationListDisplayStyleSelectionView *)v3 layer];
    [v6 setAllowsGroupOpacity:1];
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    BOOL v3 = a3;
    self->_selected = a3;
    -[NCNotificationListDisplayStyleSelectionView _swapSelectionLabelsOnToggledSelected:](self, "_swapSelectionLabelsOnToggledSelected:");
    CFStringRef v5 = [(NCNotificationListDisplayStyleSelectionView *)self selectionImageView];
    v6 = [(NCNotificationListDisplayStyleSelectionView *)self _selectionImageViewTintColorSelected:v3];
    [v5 setTintColor:v6];

    [(NCNotificationListDisplayStyleSelectionView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(NCNotificationListDisplayStyleSelectionView *)self _configureSelectionImageViewIfNecessary];
  [(NCNotificationListDisplayStyleSelectionView *)self _configureSelectionLabelIfNecessary];
  selectionImageView = self->_selectionImageView;
  if (selectionImageView)
  {
    [(UIImageView *)selectionImageView frame];
    double v7 = CGRectGetHeight(v14) + 25.0;
  }
  else
  {
    double v7 = 0.0;
  }
  -[UILabel sizeThatFits:](self->_selectionLabel, "sizeThatFits:", width + -10.0, height);
  double v9 = v8 * 1.42;
  double v10 = v8 * 1.42 * 0.5;
  if (v10 <= 20.0) {
    double v9 = v10 + 20.0;
  }
  double v11 = ceil(v7 + v9 + 25.0);
  double v12 = width;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListDisplayStyleSelectionView;
  [(NCNotificationListDisplayStyleSelectionView *)&v3 layoutSubviews];
  [(NCNotificationListDisplayStyleSelectionView *)self _configureSelectionImageViewIfNecessary];
  [(NCNotificationListDisplayStyleSelectionView *)self _configureSelectionLabelIfNecessary];
  [(NCNotificationListDisplayStyleSelectionView *)self _layoutSelectionImageView];
  [(NCNotificationListDisplayStyleSelectionView *)self _layoutSelectionLabel];
}

- (void)_configureSelectionImageViewIfNecessary
{
  if (!self->_selectionImageView)
  {
    objc_msgSend((id)objc_opt_class(), "notificationListDisplayStyleSelectionImageForType:", -[NCNotificationListDisplayStyleSelectionView selectionType](self, "selectionType"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v3 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
    selectionImageView = self->_selectionImageView;
    self->_selectionImageView = v3;

    CFStringRef v5 = self->_selectionImageView;
    v6 = [(NCNotificationListDisplayStyleSelectionView *)self _selectionImageViewTintColorSelected:[(NCNotificationListDisplayStyleSelectionView *)self isSelected]];
    [(UIImageView *)v5 setTintColor:v6];

    [(UIImageView *)self->_selectionImageView setUserInteractionEnabled:0];
    [(NCNotificationListDisplayStyleSelectionView *)self addSubview:self->_selectionImageView];
  }
}

- (id)_selectionImageViewTintColorSelected:(BOOL)a3
{
  if (a3) {
    +[UIColor systemBlueColor];
  }
  else {
  objc_super v3 = +[UIColor grayColor];
  }

  return v3;
}

- (void)_configureSelectionLabelIfNecessary
{
  p_selectionLabel = &self->_selectionLabel;
  if (self->_selectionLabel || [(NCNotificationListDisplayStyleSelectionView *)self isSelected])
  {
    p_selectionLabel = &self->_encapsulatedSelectionLabel;
    if (self->_encapsulatedSelectionLabel
      || ![(NCNotificationListDisplayStyleSelectionView *)self isSelected])
    {
      return;
    }
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  *p_selectionLabel = (UILabel *)[(NCNotificationListDisplayStyleSelectionView *)self _newSelectionLabelIsEncapsulated:v4];

  _objc_release_x1();
}

- (id)_newSelectionLabelIsEncapsulated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = objc_msgSend((id)objc_opt_class(), "notificationListDisplayStyleSelectionLabelTitleForType:", -[NCNotificationListDisplayStyleSelectionView selectionType](self, "selectionType"));
  [v5 setText:v6];

  id v7 = &UIFontTextStyleCallout;
  if (!v3) {
    id v7 = &UIFontTextStyleFootnote;
  }
  double v8 = +[UIFont preferredFontForTextStyle:*v7];
  [v5 setFont:v8];

  [v5 setUserInteractionEnabled:0];
  [v5 setAdjustsFontSizeToFitWidth:1];
  [v5 setTextAlignment:1];
  [(NCNotificationListDisplayStyleSelectionView *)self addSubview:v5];
  if (v3)
  {
    double v9 = +[UIColor systemBlueColor];
    id v10 = objc_alloc_init((Class)NSTextEncapsulation);
    [v10 setColor:v9];
    [v10 setScale:2];
    [v10 setStyle:1];
    [v10 setPlatterSize:1];
    [v10 setShape:2];
    [v5 _setTextEncapsulation:v10];
    double v11 = +[UIColor systemBackgroundColor];
    [v5 setColor:v11];
    [v5 setAccessibilityTraits:UIAccessibilityTraitSelected];
  }
  return v5;
}

- (void)_layoutSelectionImageView
{
  selectionImageView = self->_selectionImageView;
  if (selectionImageView)
  {
    [(UIImageView *)selectionImageView frame];
    [(NCNotificationListDisplayStyleSelectionView *)self bounds];
    UIRectCenteredXInRect();
    uint64_t v4 = [(UIImageView *)self->_selectionImageView image];
    [v4 size];

    UIRectRoundToScale();
    id v5 = self->_selectionImageView;
    -[UIImageView setFrame:](v5, "setFrame:");
  }
}

- (void)_layoutSelectionLabel
{
  selectionLabel = self->_selectionLabel;
  if (selectionLabel)
  {
    uint64_t v4 = selectionLabel;
  }
  else
  {
    uint64_t v4 = self->_encapsulatedSelectionLabel;
    if (!v4) {
      return;
    }
  }
  v21 = v4;
  [(UILabel *)v4 frame];
  [(NCNotificationListDisplayStyleSelectionView *)self bounds];
  [(NCNotificationListDisplayStyleSelectionView *)self _selectionLabelLayoutRectForRect:"_selectionLabelLayoutRectForRect:"];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  -[UILabel sizeThatFits:](v21, "sizeThatFits:", v9, v11);
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.double width = v10;
  v23.size.double height = v12;
  CGRectGetWidth(v23);
  [(NCNotificationListDisplayStyleSelectionView *)self bounds];
  UIRectCenteredXInRect();
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [(UIImageView *)self->_selectionImageView frame];
  CGRectGetMaxY(v24);
  v25.origin.x = v14;
  v25.origin.y = v16;
  v25.size.double width = v18;
  v25.size.double height = v20;
  CGRectGetHeight(v25);
  [(UIImageView *)self->_selectionImageView frame];
  CGRectGetMaxY(v26);
  UIRectRoundToScale();
  -[UILabel setFrame:](v21, "setFrame:");
}

- (void)_handleLocationViewPress:(id)a3
{
  uint64_t v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 4) >= 2)
  {
    if (v4 == (unsigned char *)&dword_0 + 1)
    {
      uint64_t v6 = 1;
      goto LABEL_8;
    }
    if (v4 != (unsigned char *)&dword_0 + 3) {
      return;
    }
    if (![(NCNotificationListDisplayStyleSelectionView *)self isSelected])
    {
      [(NCNotificationListDisplayStyleSelectionView *)self setSelected:1];
      double v5 = [(NCNotificationListDisplayStyleSelectionView *)self delegate];
      [v5 notificationListDisplayStyleSelectionViewDidGetSelected:self];
    }
  }
  uint64_t v6 = 0;
LABEL_8:

  [(NCNotificationListDisplayStyleSelectionView *)self setHighlighted:v6];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_longPressGestureRecognizer == a3)
  {
    id v5 = a4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (CGRect)_selectionLabelLayoutRectForRect:(CGRect)a3
{
  _UIRectInset(self, a2, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height, 0.0, 5.0, 0.0, 5.0);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_swapSelectionLabelsOnToggledSelected:(BOOL)a3
{
  BOOL v3 = a3;
  [(NCNotificationListDisplayStyleSelectionView *)self _configureSelectionLabelIfNecessary];
  if (!v3)
  {
    p_encapsulatedSelectionLabel = &self->_encapsulatedSelectionLabel;
    encapsulatedSelectionLabel = self->_encapsulatedSelectionLabel;
    if (encapsulatedSelectionLabel)
    {
      double v7 = &OBJC_IVAR___NCNotificationListDisplayStyleSelectionView__selectionLabel;
      goto LABEL_6;
    }
LABEL_7:
    CGFloat v8 = 0;
    id v9 = 0;
    goto LABEL_8;
  }
  p_encapsulatedSelectionLabel = &self->_selectionLabel;
  encapsulatedSelectionLabel = self->_selectionLabel;
  if (!encapsulatedSelectionLabel) {
    goto LABEL_7;
  }
  double v7 = &OBJC_IVAR___NCNotificationListDisplayStyleSelectionView__encapsulatedSelectionLabel;
LABEL_6:
  CGFloat v8 = encapsulatedSelectionLabel;
  id v9 = *(id *)((char *)&self->super.super.super.isa + *v7);
  CGFloat v10 = *p_encapsulatedSelectionLabel;
  *p_encapsulatedSelectionLabel = 0;

LABEL_8:
  [(NCNotificationListDisplayStyleSelectionView *)self _layoutSelectionLabel];
  [v9 setAlpha:0.0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_C3FC;
  v15[3] = &unk_40D08;
  id v16 = v9;
  double v17 = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_C440;
  v13[3] = &unk_41020;
  CGFloat v14 = v17;
  double v11 = v17;
  id v12 = v9;
  +[UIView animateWithDuration:0 delay:v15 options:v13 animations:0.15 completion:0.0];
}

- (void)setHighlighted:(BOOL)a3
{
  if (a3)
  {
    [(NCNotificationListDisplayStyleSelectionView *)self setAlpha:0.5];
  }
  else
  {
    v5[5] = v3;
    v5[6] = v4;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_C4DC;
    v5[3] = &unk_40F58;
    v5[4] = self;
    +[UIView animateWithDuration:v5 animations:0.25];
  }
}

- (NCNotificationListDisplayStyleSelectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListDisplayStyleSelectionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (void)setSelectionType:(unint64_t)a3
{
  self->_selectionType = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIImageView)selectionImageView
{
  return self->_selectionImageView;
}

- (void)setSelectionImageView:(id)a3
{
}

- (UILabel)selectionLabel
{
  return self->_selectionLabel;
}

- (void)setSelectionLabel:(id)a3
{
}

- (UILabel)encapsulatedSelectionLabel
{
  return self->_encapsulatedSelectionLabel;
}

- (void)setEncapsulatedSelectionLabel:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_encapsulatedSelectionLabel, 0);
  objc_storeStrong((id *)&self->_selectionLabel, 0);
  objc_storeStrong((id *)&self->_selectionImageView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end