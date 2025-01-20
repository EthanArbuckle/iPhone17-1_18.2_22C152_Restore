@interface HACCCapsuleTitleView
- (BOOL)isAccessibilityElement;
- (HACCCapsuleTitleView)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (UIVisualEffectView)titleContainer;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setTitleContainer:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation HACCCapsuleTitleView

- (HACCCapsuleTitleView)initWithFrame:(CGRect)a3
{
  v52[8] = *MEMORY[0x263EF8340];
  v51.receiver = self;
  v51.super_class = (Class)HACCCapsuleTitleView;
  v3 = -[HACCCapsuleTitleView initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E50]);
    v5 = [MEMORY[0x263F82DF0] controlCenterSecondaryVibrancyEffect];
    uint64_t v6 = [v4 initWithEffect:v5];
    titleContainer = v3->_titleContainer;
    v3->_titleContainer = (UIVisualEffectView *)v6;

    [(UIVisualEffectView *)v3->_titleContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HACCCapsuleTitleView *)v3 addSubview:v3->_titleContainer];
    BOOL v8 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[HACCCapsuleTitleView semanticContentAttribute](v3, "semanticContentAttribute")) == 1;
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v9;

    v50 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835F0] addingSymbolicTraits:32770 options:0];
    v11 = v3->_titleLabel;
    v12 = (void *)MEMORY[0x263F81708];
    [v50 pointSize];
    v13 = objc_msgSend(v12, "fontWithDescriptor:size:", v50);
    [(UILabel *)v11 setFont:v13];

    v14 = v3->_titleLabel;
    v15 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v14 setTextColor:v15];

    [(UILabel *)v3->_titleLabel setTextAlignment:2 * v8];
    [(UILabel *)v3->_titleLabel setClipsToBounds:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    LODWORD(v16) = 1148846080;
    [(UILabel *)v3->_titleLabel setContentCompressionResistancePriority:1 forAxis:v16];
    LODWORD(v17) = 1148846080;
    [(UILabel *)v3->_titleLabel setContentCompressionResistancePriority:0 forAxis:v17];
    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(UIVisualEffectView *)v3->_titleContainer contentView];
    [v18 addSubview:v3->_titleLabel];

    v38 = (void *)MEMORY[0x263F08938];
    v49 = [(UIVisualEffectView *)v3->_titleContainer leadingAnchor];
    v48 = [(HACCCapsuleTitleView *)v3 leadingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v52[0] = v47;
    v46 = [(UIVisualEffectView *)v3->_titleContainer trailingAnchor];
    v45 = [(HACCCapsuleTitleView *)v3 trailingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v52[1] = v44;
    v43 = [(UIVisualEffectView *)v3->_titleContainer topAnchor];
    v42 = [(HACCCapsuleTitleView *)v3 topAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v52[2] = v41;
    v40 = [(UIVisualEffectView *)v3->_titleContainer bottomAnchor];
    v39 = [(HACCCapsuleTitleView *)v3 bottomAnchor];
    v37 = [v40 constraintEqualToAnchor:v39];
    v52[3] = v37;
    v35 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v36 = [(UIVisualEffectView *)v3->_titleContainer contentView];
    v34 = [v36 leadingAnchor];
    CCUILayoutGutter();
    v33 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34);
    v52[4] = v33;
    v31 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v32 = [(UIVisualEffectView *)v3->_titleContainer contentView];
    v30 = [v32 trailingAnchor];
    CCUILayoutGutter();
    v20 = [v31 constraintEqualToAnchor:v30 constant:-v19];
    v52[5] = v20;
    v21 = [(UILabel *)v3->_titleLabel topAnchor];
    v22 = [(UIVisualEffectView *)v3->_titleContainer contentView];
    v23 = [v22 topAnchor];
    v24 = [v21 constraintGreaterThanOrEqualToAnchor:v23 constant:10.0];
    v52[6] = v24;
    v25 = [(UILabel *)v3->_titleLabel lastBaselineAnchor];
    v26 = [(UIVisualEffectView *)v3->_titleContainer lastBaselineAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:-10.0];
    v52[7] = v27;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:8];
    [v38 activateConstraints:v28];
  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(HACCCapsuleTitleView *)self titleLabel];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83268];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIVisualEffectView)titleContainer
{
  return self->_titleContainer;
}

- (void)setTitleContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end