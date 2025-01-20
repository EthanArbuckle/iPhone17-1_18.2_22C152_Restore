@interface _ASCABLEQRCodeBadgeView
- (_ASCABLEQRCodeBadgeView)initWithFrame:(CGRect)a3;
- (id)_passkeyIcon;
- (void)_updateLayoutMetricsWithFrameSize:(CGSize)a3;
- (void)layoutSubviews;
@end

@implementation _ASCABLEQRCodeBadgeView

- (_ASCABLEQRCodeBadgeView)initWithFrame:(CGRect)a3
{
  v36[6] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)_ASCABLEQRCodeBadgeView;
  v3 = -[_ASCABLEQRCodeBadgeView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_ASCABLEQRCodeBadgePlatterView);
    platterView = v3->_platterView;
    v3->_platterView = &v4->super;

    [(UIView *)v3->_platterView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_ASCABLEQRCodeBadgeView *)v3 addSubview:v3->_platterView];
    id v6 = objc_alloc(MEMORY[0x263F82828]);
    v7 = [(_ASCABLEQRCodeBadgeView *)v3 _passkeyIcon];
    uint64_t v8 = [v6 initWithImage:v7];
    iconView = v3->_iconView;
    v3->_iconView = (UIImageView *)v8;

    v10 = [MEMORY[0x263F825C8] whiteColor];
    [(UIImageView *)v3->_iconView setTintColor:v10];

    [(UIImageView *)v3->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_ASCABLEQRCodeBadgeView *)v3 addSubview:v3->_iconView];
    v11 = [(UIImageView *)v3->_iconView centerXAnchor];
    v12 = [(UIView *)v3->_platterView centerXAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12];
    iconOffsetXConstraint = v3->_iconOffsetXConstraint;
    v3->_iconOffsetXConstraint = (NSLayoutConstraint *)v13;

    v15 = [(UIImageView *)v3->_iconView centerYAnchor];
    v16 = [(UIView *)v3->_platterView centerYAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16];
    iconOffsetYConstraint = v3->_iconOffsetYConstraint;
    v3->_iconOffsetYConstraint = (NSLayoutConstraint *)v17;

    v29 = (void *)MEMORY[0x263F08938];
    v34 = [(UIView *)v3->_platterView leadingAnchor];
    v33 = [(_ASCABLEQRCodeBadgeView *)v3 leadingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v36[0] = v32;
    v31 = [(UIView *)v3->_platterView trailingAnchor];
    v30 = [(_ASCABLEQRCodeBadgeView *)v3 trailingAnchor];
    v19 = [v31 constraintEqualToAnchor:v30];
    v36[1] = v19;
    v20 = [(UIView *)v3->_platterView topAnchor];
    v21 = [(_ASCABLEQRCodeBadgeView *)v3 topAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v36[2] = v22;
    v23 = [(UIView *)v3->_platterView bottomAnchor];
    v24 = [(_ASCABLEQRCodeBadgeView *)v3 bottomAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v36[3] = v25;
    v36[4] = v3->_iconOffsetXConstraint;
    v36[5] = v3->_iconOffsetYConstraint;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:6];
    [v29 activateConstraints:v26];

    v27 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_ASCABLEQRCodeBadgeView;
  [(_ASCABLEQRCodeBadgeView *)&v5 layoutSubviews];
  [(_ASCABLEQRCodeBadgeView *)self bounds];
  -[_ASCABLEQRCodeBadgeView _updateLayoutMetricsWithFrameSize:](self, "_updateLayoutMetricsWithFrameSize:", v3, v4);
}

- (id)_passkeyIcon
{
  return (id)[MEMORY[0x263F827E8] systemImageNamed:@"person.badge.key.fill"];
}

- (void)_updateLayoutMetricsWithFrameSize:(CGSize)a3
{
  double width = a3.width;
  -[NSLayoutConstraint setConstant:](self->_iconOffsetXConstraint, "setConstant:", a3.width * -0.035, a3.height);
  [(NSLayoutConstraint *)self->_iconOffsetYConstraint setConstant:width * -0.015];
  id v5 = [MEMORY[0x263F82818] configurationWithPointSize:width * 0.62];
  [(UIImageView *)self->_iconView setPreferredSymbolConfiguration:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconOffsetYConstraint, 0);
  objc_storeStrong((id *)&self->_iconOffsetXConstraint, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_platterView, 0);
}

@end