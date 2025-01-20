@interface HKTitleDetailOptionalButtonView
- (HKTitleDetailOptionalButtonView)init;
- (id)_buttonConfigurationWithButtonTitle:(id)a3;
- (void)buttonTapped;
- (void)populateWithTitle:(id)a3 detail:(id)a4 buttonText:(id)a5 buttonAction:(id)a6;
- (void)setUp;
@end

@implementation HKTitleDetailOptionalButtonView

- (HKTitleDetailOptionalButtonView)init
{
  v5.receiver = self;
  v5.super_class = (Class)HKTitleDetailOptionalButtonView;
  v2 = -[HKTitleDetailOptionalButtonView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2) {
    [(HKTitleDetailOptionalButtonView *)v2 setUp];
  }
  return v3;
}

- (void)setUp
{
  v55[5] = *MEMORY[0x1E4F143B8];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  objc_super v5 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] variant:1024];
  [(UILabel *)self->_titleLabel setFont:v5];

  [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  [(HKTitleDetailOptionalButtonView *)self addSubview:self->_titleLabel];
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v6;

  [(UILabel *)self->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_detailLabel setNumberOfLines:0];
  v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_detailLabel setFont:v8];

  [(UILabel *)self->_detailLabel setAdjustsFontForContentSizeCategory:1];
  [(HKTitleDetailOptionalButtonView *)self addSubview:self->_detailLabel];
  v9 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  button = self->_button;
  self->_button = v9;

  [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_button setRole:1];
  [(UIButton *)self->_button addTarget:self action:sel_buttonTapped forControlEvents:64];
  [(HKTitleDetailOptionalButtonView *)self addSubview:self->_button];
  v51 = [(UIButton *)self->_button topAnchor];
  v49 = [(UILabel *)self->_detailLabel bottomAnchor];
  v47 = [v51 constraintEqualToAnchor:v49 constant:17.0];
  v55[0] = v47;
  v45 = [(UIButton *)self->_button leadingAnchor];
  v43 = [(HKTitleDetailOptionalButtonView *)self leadingAnchor];
  v41 = [v45 constraintEqualToAnchor:v43 constant:16.0];
  v55[1] = v41;
  v40 = [(UIButton *)self->_button trailingAnchor];
  v11 = [(HKTitleDetailOptionalButtonView *)self trailingAnchor];
  v12 = [v40 constraintEqualToAnchor:v11 constant:-16.0];
  v55[2] = v12;
  v13 = [(UIButton *)self->_button bottomAnchor];
  v14 = [(HKTitleDetailOptionalButtonView *)self bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:-16.0];
  v55[3] = v15;
  v16 = [(UIButton *)self->_button heightAnchor];
  v17 = [v16 constraintGreaterThanOrEqualToConstant:50.0];
  v55[4] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:5];
  buttonPresentConstraints = self->_buttonPresentConstraints;
  self->_buttonPresentConstraints = v18;

  v20 = [(UILabel *)self->_detailLabel bottomAnchor];
  v21 = [(HKTitleDetailOptionalButtonView *)self bottomAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:-16.0];
  v54 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  buttonOmittedConstraints = self->_buttonOmittedConstraints;
  self->_buttonOmittedConstraints = v23;

  v38 = (void *)MEMORY[0x1E4F28DC8];
  v52 = [(UILabel *)self->_titleLabel topAnchor];
  v50 = [(HKTitleDetailOptionalButtonView *)self topAnchor];
  v48 = [v52 constraintEqualToAnchor:v50 constant:20.0];
  v53[0] = v48;
  v46 = [(UILabel *)self->_titleLabel leadingAnchor];
  v44 = [(HKTitleDetailOptionalButtonView *)self leadingAnchor];
  v42 = [v46 constraintEqualToAnchor:v44 constant:16.0];
  v53[1] = v42;
  v39 = [(UILabel *)self->_titleLabel trailingAnchor];
  v37 = [(HKTitleDetailOptionalButtonView *)self trailingAnchor];
  v36 = [v39 constraintEqualToAnchor:v37 constant:-16.0];
  v53[2] = v36;
  v35 = [(UILabel *)self->_detailLabel topAnchor];
  v25 = [(UILabel *)self->_titleLabel bottomAnchor];
  v26 = [v35 constraintEqualToAnchor:v25 constant:4.0];
  v53[3] = v26;
  v27 = [(UILabel *)self->_detailLabel leadingAnchor];
  v28 = [(HKTitleDetailOptionalButtonView *)self leadingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 constant:16.0];
  v53[4] = v29;
  v30 = [(UILabel *)self->_detailLabel trailingAnchor];
  v31 = [(HKTitleDetailOptionalButtonView *)self trailingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31 constant:-16.0];
  v53[5] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:6];
  v34 = [v33 arrayByAddingObjectsFromArray:self->_buttonOmittedConstraints];
  [v38 activateConstraints:v34];
}

- (void)populateWithTitle:(id)a3 detail:(id)a4 buttonText:(id)a5 buttonAction:(id)a6
{
  titleLabel = self->_titleLabel;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  [(UILabel *)titleLabel setText:a3];
  [(UILabel *)self->_detailLabel setText:v13];

  id buttonAction = self->_buttonAction;
  v15 = _Block_copy(v11);

  id v16 = self->_buttonAction;
  self->_id buttonAction = v15;

  button = self->_button;
  v18 = [(HKTitleDetailOptionalButtonView *)self _buttonConfigurationWithButtonTitle:v12];

  [(UIButton *)button setConfiguration:v18];
  [(UIButton *)self->_button setHidden:v11 == 0];
  if (!v11 || buttonAction)
  {
    if (v11 || !buttonAction) {
      return;
    }
    v19 = &OBJC_IVAR___HKTitleDetailOptionalButtonView__buttonOmittedConstraints;
    v20 = &OBJC_IVAR___HKTitleDetailOptionalButtonView__buttonPresentConstraints;
  }
  else
  {
    v19 = &OBJC_IVAR___HKTitleDetailOptionalButtonView__buttonPresentConstraints;
    v20 = &OBJC_IVAR___HKTitleDetailOptionalButtonView__buttonOmittedConstraints;
  }
  [MEMORY[0x1E4F28DC8] deactivateConstraints:*(Class *)((char *)&self->super.super.super.isa + *v20)];
  v21 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v22 = *(uint64_t *)((char *)&self->super.super.super.isa + *v19);
  [v21 activateConstraints:v22];
}

- (id)_buttonConfigurationWithButtonTitle:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB14D8];
  id v4 = a3;
  objc_super v5 = [v3 grayButtonConfiguration];
  [v5 setTitle:v4];

  [v5 setCornerStyle:3];
  return v5;
}

- (void)buttonTapped
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonOmittedConstraints, 0);
  objc_storeStrong((id *)&self->_buttonPresentConstraints, 0);
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end