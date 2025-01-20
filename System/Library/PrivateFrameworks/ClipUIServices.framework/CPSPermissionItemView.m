@interface CPSPermissionItemView
- (BOOL)hasBlurEffect;
- (BOOL)isOn;
- (CPSPermissionItemView)init;
- (CPSPermissionItemView)initWithCoder:(id)a3;
- (CPSPermissionItemView)initWithFrame:(CGRect)a3;
- (CPSPermissionItemView)initWithTitle:(id)a3 label:(id)a4 description:(id)a5;
- (void)layoutSubviews;
- (void)setHasBlurEffect:(BOOL)a3;
- (void)setOn:(BOOL)a3;
- (void)setUpSwitchWithLabel:(id)a3;
@end

@implementation CPSPermissionItemView

- (CPSPermissionItemView)initWithTitle:(id)a3 label:(id)a4 description:(id)a5
{
  v55[8] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v54.receiver = self;
  v54.super_class = (Class)CPSPermissionItemView;
  v11 = -[CPSPermissionItemView initWithFrame:](&v54, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    [(CPSPermissionItemView *)v11 setAxis:1];
    [(CPSPermissionItemView *)v12 setSpacing:10.0];
    v53 = v12;
    id v13 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v14 = [CPSVibrantLabel alloc];
    v15 = [(CPSVibrantLabel *)v14 initWithTextStyle:*MEMORY[0x1E4F43890] textVariant:256 vibrancyEffectStyle:1];
    [(CPSVibrantLabel *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSVibrantLabel *)v15 setText:v8];
    [(CPSVibrantLabel *)v15 setAdjustsFontSizeToFitWidth:1];
    [v13 addSubview:v15];
    [(CPSPermissionItemView *)v12 addArrangedSubview:v13];
    [(CPSPermissionItemView *)v12 setUpSwitchWithLabel:v9];
    id v16 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v17 = [CPSVibrantLabel alloc];
    v18 = [(CPSVibrantLabel *)v17 initWithTextStyle:*MEMORY[0x1E4F43880] textVariant:256 vibrancyEffectStyle:1];
    [(CPSVibrantLabel *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSVibrantLabel *)v18 setNumberOfLines:0];
    [(CPSVibrantLabel *)v18 setText:v10];
    [v16 addSubview:v18];
    [(CPSPermissionItemView *)v53 addArrangedSubview:v16];
    v39 = (void *)MEMORY[0x1E4F28DC8];
    v51 = [(CPSVibrantLabel *)v15 topAnchor];
    v50 = [v13 topAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v55[0] = v49;
    v46 = [(CPSVibrantLabel *)v15 leadingAnchor];
    v45 = [v13 leadingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45 constant:10.0];
    v55[1] = v44;
    v48 = v15;
    v43 = [(CPSVibrantLabel *)v15 trailingAnchor];
    v47 = v13;
    v42 = [v13 trailingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v55[2] = v41;
    v40 = [(CPSVibrantLabel *)v15 bottomAnchor];
    v38 = [v13 bottomAnchor];
    v36 = [v40 constraintEqualToAnchor:v38];
    v55[3] = v36;
    v35 = [(CPSVibrantLabel *)v18 topAnchor];
    v34 = [v16 topAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v55[4] = v33;
    v32 = [(CPSVibrantLabel *)v18 leadingAnchor];
    v31 = [v16 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:10.0];
    v55[5] = v30;
    [(CPSVibrantLabel *)v18 trailingAnchor];
    v19 = id v52 = v8;
    v37 = v16;
    v20 = [v16 trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v55[6] = v21;
    v22 = [(CPSVibrantLabel *)v18 bottomAnchor];
    [v16 bottomAnchor];
    v24 = id v23 = v10;
    v25 = [v22 constraintEqualToAnchor:v24];
    v55[7] = v25;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:8];
    v27 = id v26 = v9;
    [v39 activateConstraints:v27];

    id v9 = v26;
    v12 = v53;

    id v10 = v23;
    id v8 = v52;

    v53->_blurEffectNeedsUpdate = 1;
    v28 = v53;
  }
  return v12;
}

- (CPSPermissionItemView)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-[CPSPermissionItemView init:] is not available." userInfo:0];
  objc_exception_throw(v2);
}

- (CPSPermissionItemView)initWithFrame:(CGRect)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3A8], @"-[CPSPermissionItemView initWithFrame:] is not available.", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CPSPermissionItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-[CPSPermissionItemView initWithCoder:] is not available." userInfo:0];
  objc_exception_throw(v4);
}

- (void)setUpSwitchWithLabel:(id)a3
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [CPSVibrantLabel alloc];
  v6 = [(CPSVibrantLabel *)v5 initWithTextStyle:*MEMORY[0x1E4F438C8] textVariant:256 vibrancyEffectStyle:0];
  [(CPSVibrantLabel *)v6 setNumberOfLines:0];
  v7 = v6;
  v48 = v6;
  [(CPSVibrantLabel *)v6 setText:v4];

  id v8 = (UIVisualEffectView *)objc_opt_new();
  switchWithLabelVisualEffectView = self->_switchWithLabelVisualEffectView;
  self->_switchWithLabelVisualEffectView = v8;

  [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView _setContinuousCornerRadius:12.0];
  id v10 = (UIView *)objc_opt_new();
  switchWithLabelBackgroundView = self->_switchWithLabelBackgroundView;
  self->_switchWithLabelBackgroundView = v10;

  [(UIView *)self->_switchWithLabelBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  [(UIView *)self->_switchWithLabelBackgroundView setBackgroundColor:v12];

  [(UIView *)self->_switchWithLabelBackgroundView _setContinuousCornerRadius:12.0];
  id v13 = [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView contentView];
  [v13 addSubview:self->_switchWithLabelBackgroundView];

  v14 = (UISwitch *)objc_opt_new();
  permissionSwitch = self->_permissionSwitch;
  self->_permissionSwitch = v14;

  LODWORD(v16) = 1148846080;
  [(UISwitch *)self->_permissionSwitch setContentCompressionResistancePriority:0 forAxis:v16];
  id v17 = objc_alloc(MEMORY[0x1E4F42E20]);
  v18 = self->_permissionSwitch;
  v50[0] = v7;
  v50[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  v20 = (void *)[v17 initWithArrangedSubviews:v19];

  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v20 setAxis:0];
  [v20 setAlignment:3];
  v21 = [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView contentView];
  [v21 addSubview:v20];

  v38 = (void *)MEMORY[0x1E4F28DC8];
  v47 = [(UIView *)self->_switchWithLabelBackgroundView topAnchor];
  v46 = [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v49[0] = v45;
  v44 = [(UIView *)self->_switchWithLabelBackgroundView leadingAnchor];
  v43 = [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView leadingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v49[1] = v42;
  v41 = [(UIView *)self->_switchWithLabelBackgroundView trailingAnchor];
  v40 = [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView trailingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v49[2] = v39;
  v37 = [(UIView *)self->_switchWithLabelBackgroundView bottomAnchor];
  v36 = [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView bottomAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v49[3] = v35;
  v34 = [v20 topAnchor];
  v33 = [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:10.0];
  v49[4] = v32;
  v31 = [v20 leadingAnchor];
  v30 = [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:10.0];
  v49[5] = v29;
  v22 = [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView trailingAnchor];
  id v23 = [v20 trailingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23 constant:10.0];
  v49[6] = v24;
  v25 = [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView bottomAnchor];
  id v26 = [v20 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26 constant:10.0];
  v49[7] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:8];
  [v38 activateConstraints:v28];

  [(CPSPermissionItemView *)self addArrangedSubview:self->_switchWithLabelVisualEffectView];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CPSPermissionItemView;
  [(CPSPermissionItemView *)&v5 layoutSubviews];
  if (self->_blurEffectNeedsUpdate)
  {
    self->_blurEffectNeedsUpdate = 0;
    double v3 = 0.0;
    if (!self->_hasBlurEffect) {
      double v3 = 1.0;
    }
    [(UIView *)self->_switchWithLabelBackgroundView setAlpha:v3];
    if (self->_hasBlurEffect)
    {
      id v4 = [MEMORY[0x1E4F427D8] effectWithStyle:8];
      [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView setEffect:v4];
    }
    else
    {
      [(UIVisualEffectView *)self->_switchWithLabelVisualEffectView setEffect:0];
    }
  }
}

- (void)setHasBlurEffect:(BOOL)a3
{
  if (self->_hasBlurEffect != a3)
  {
    [(CPSPermissionItemView *)self layoutIfNeeded];
    self->_hasBlurEffect = a3;
    self->_blurEffectNeedsUpdate = 1;
    [(CPSPermissionItemView *)self setNeedsLayout];
    [(CPSPermissionItemView *)self layoutSubviews];
  }
}

- (BOOL)isOn
{
  return [(UISwitch *)self->_permissionSwitch isOn];
}

- (void)setOn:(BOOL)a3
{
}

- (BOOL)hasBlurEffect
{
  return self->_hasBlurEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissionSwitch, 0);
  objc_storeStrong((id *)&self->_switchWithLabelBackgroundView, 0);

  objc_storeStrong((id *)&self->_switchWithLabelVisualEffectView, 0);
}

@end