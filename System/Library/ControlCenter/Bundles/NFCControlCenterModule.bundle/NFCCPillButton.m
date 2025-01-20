@interface NFCCPillButton
- (NFCCPillButton)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (void)_contentSizeCategoryDidChange;
- (void)_setUp;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateOrientationIfNeeded;
@end

@implementation NFCCPillButton

- (NFCCPillButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NFCCPillButton;
  v3 = -[NFCCPillButton initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NFCCPillButton *)v3 _setUp];
    v5 = v4;
  }

  return v4;
}

- (void)_setUp
{
  [(NFCCPillButton *)self setClipsToBounds:1];
  v3 = +[CCUIControlCenterMaterialView controlCenterTertiaryCapturingMaterial];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  [(UIView *)self->_backgroundView setAutoresizingMask:18];
  [(NFCCPillButton *)self addSubview:self->_backgroundView];
  v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NFCCPillButton *)self addSubview:self->_titleLabel];
  [(NFCCPillButton *)self _contentSizeCategoryDidChange];
  objc_super v7 = [(NFCCPillButton *)self heightAnchor];
  v25 = [v7 constraintEqualToConstant:44.0];

  LODWORD(v8) = 1132068864;
  [v25 setPriority:v8];
  v26[0] = v25;
  v24 = [(UILabel *)self->_titleLabel leadingAnchor];
  v23 = [(NFCCPillButton *)self leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:20.0];
  v26[1] = v22;
  v21 = [(UILabel *)self->_titleLabel topAnchor];
  v20 = [(NFCCPillButton *)self topAnchor];
  v19 = [v21 constraintGreaterThanOrEqualToAnchor:v20 constant:11.0];
  v26[2] = v19;
  v9 = [(UILabel *)self->_titleLabel centerYAnchor];
  v10 = [(NFCCPillButton *)self centerYAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v26[3] = v11;
  v12 = [(NFCCPillButton *)self trailingAnchor];
  v13 = [(UILabel *)self->_titleLabel trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:20.0];
  v26[4] = v14;
  v15 = [(NFCCPillButton *)self bottomAnchor];
  v16 = [(UILabel *)self->_titleLabel bottomAnchor];
  v17 = [v15 constraintGreaterThanOrEqualToAnchor:v16 constant:11.0];
  v26[5] = v17;
  v18 = +[NSArray arrayWithObjects:v26 count:6];
  +[NSLayoutConstraint activateConstraints:v18];
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)NFCCPillButton;
  [(NFCCPillButton *)&v6 didMoveToWindow];
  v3 = [(NFCCPillButton *)self window];

  if (v3)
  {
    v4 = [(NFCCPillButton *)self visualStylingProviderForCategory:1];
    visualStylingProvider = self->_visualStylingProvider;
    if (v4 != visualStylingProvider)
    {
      [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:self->_titleLabel];
      objc_storeStrong((id *)&self->_visualStylingProvider, v4);
      [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:self->_titleLabel withStyle:1];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFCCPillButton;
  id v4 = a3;
  [(NFCCPillButton *)&v9 traitCollectionDidChange:v4];
  v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  objc_super v6 = [(NFCCPillButton *)self traitCollection];
  objc_super v7 = [v6 preferredContentSizeCategory];
  unsigned __int8 v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(NFCCPillButton *)self _contentSizeCategoryDidChange];
  }
}

- (void)updateOrientationIfNeeded
{
  id interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation != [UIApp activeInterfaceOrientation])
  {
    [(NFCCPillButton *)self _contentSizeCategoryDidChange];
  }
}

- (void)_contentSizeCategoryDidChange
{
  v3 = [(NFCCPillButton *)self traitCollection];
  id v8 = [v3 preferredContentSizeCategory];

  id v4 = [UIApp activeInterfaceOrientation];
  self->_id interfaceOrientation = (int64_t)v4;
  if (sub_780C((NSString *)v8, (uint64_t)v4))
  {
    v5 = UIContentSizeCategoryAccessibilityLarge;

    objc_super v6 = v5;
  }
  else
  {
    objc_super v6 = (NSString *)v8;
  }
  objc_super v9 = v6;
  objc_super v7 = +[UIFont bsui_preferredFontForTextStyle:UIFontTextStyleBody hiFontStyle:8 contentSizeCategory:v6];
  [(UILabel *)self->_titleLabel setFont:v7];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NFCCPillButton;
  [(NFCCPillButton *)&v8 layoutSubviews];
  [(NFCCPillButton *)self bounds];
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  double v7 = CGRectGetHeight(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  [(NFCCPillButton *)self _setContinuousCornerRadius:fmin(v7, CGRectGetWidth(v10)) * 0.5];
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NFCCPillButton;
  -[NFCCPillButton setHighlighted:](&v7, "setHighlighted:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_8264;
  v5[3] = &unk_C500;
  v5[4] = self;
  BOOL v6 = a3;
  +[UIView _animateUsingSpringInteractive:1 animations:v5 completion:0];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end