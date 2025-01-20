@interface HKPrescriptionPickerCell
- (BOOL)isOn;
- (HKPrescriptionPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HKPrescriptionPickerCellDelegate)delegate;
- (HKVisionPrescription)prescription;
- (UIButton)showDetailsButton;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UIStackView)buttonsStackView;
- (UIStackView)contentStackView;
- (UIStackView)sampleInfoStackView;
- (UISwitch)toggleView;
- (void)_didTapShowDetailsButton;
- (void)_didToggleSwitch:(id)a3;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)prepareForReuse;
- (void)setButtonsStackView:(id)a3;
- (void)setContentStackView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)setPrescription:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSampleInfoStackView:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setShowDetailsButton:(id)a3;
- (void)setToggleView:(id)a3;
@end

@implementation HKPrescriptionPickerCell

- (HKPrescriptionPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKPrescriptionPickerCell;
  v4 = [(HKPrescriptionPickerCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKPrescriptionPickerCell *)v4 _setupSubviews];
    [(HKPrescriptionPickerCell *)v5 _setupConstraints];
  }
  return v5;
}

- (void)_setupSubviews
{
  v48[3] = *MEMORY[0x1E4F143B8];
  [(HKPrescriptionPickerCell *)self _setContinuousCornerRadius:10.0];
  [(HKPrescriptionPickerCell *)self setSelectionStyle:0];
  v3 = [(HKPrescriptionPickerCell *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 6)
  {
    v5 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(HKPrescriptionPickerCell *)self setBackgroundColor:v5];
  }
  id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v11;

  [(UILabel *)self->_primaryLabel setAdjustsFontForContentSizeCategory:1];
  uint64_t v13 = *MEMORY[0x1E4FB28C8];
  v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 2);
  [(UILabel *)self->_primaryLabel setFont:v14];

  [(UILabel *)self->_primaryLabel setNumberOfLines:0];
  v15 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_primaryLabel setTextColor:v15];

  [(UILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v16;

  [(UILabel *)self->_secondaryLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
  v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v13];
  [(UILabel *)self->_secondaryLabel setFont:v18];

  v19 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_secondaryLabel setTextColor:v19];

  [(UILabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v43 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28D8]);
  v21 = [MEMORY[0x1E4FB1830] configurationWithFont:v43];
  v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.text" withConfiguration:v21];
  [v20 setImage:v22];

  v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v24 = [v23 localizedStringForKey:@"VIEW_PRESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-VRX"];
  [v20 setTitle:v24];

  objc_msgSend(v20, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  [v20 setImagePadding:3.0];
  objc_initWeak(&location, self);
  v25 = (void *)MEMORY[0x1E4FB13F0];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __42__HKPrescriptionPickerCell__setupSubviews__block_invoke;
  v44[3] = &unk_1E6D522F8;
  objc_copyWeak(&v45, &location);
  v26 = [v25 actionWithHandler:v44];
  v27 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v20 primaryAction:v26];
  showDetailsButton = self->_showDetailsButton;
  self->_showDetailsButton = v27;

  [(UIButton *)self->_showDetailsButton setTranslatesAutoresizingMaskIntoConstraints:0];
  id v29 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v30 = self->_secondaryLabel;
  v48[0] = self->_primaryLabel;
  v48[1] = v30;
  v48[2] = self->_showDetailsButton;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  v32 = (UIStackView *)[v29 initWithArrangedSubviews:v31];
  sampleInfoStackView = self->_sampleInfoStackView;
  self->_sampleInfoStackView = v32;

  [(UIStackView *)self->_sampleInfoStackView setAlignment:1];
  [(UIStackView *)self->_sampleInfoStackView setAxis:1];
  [(UIStackView *)self->_sampleInfoStackView setDistribution:0];
  [(UIStackView *)self->_sampleInfoStackView setSpacing:6.0];
  [(UIStackView *)self->_sampleInfoStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v34 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
  toggleView = self->_toggleView;
  self->_toggleView = v34;

  [(UISwitch *)self->_toggleView addTarget:self action:sel__didToggleSwitch_ forControlEvents:4096];
  [(UISwitch *)self->_toggleView setContentMode:1];
  [(UISwitch *)self->_toggleView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v36) = 1148846080;
  [(UISwitch *)self->_toggleView setContentCompressionResistancePriority:0 forAxis:v36];
  id v37 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v38 = self->_toggleView;
  v47[0] = self->_sampleInfoStackView;
  v47[1] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  v40 = (UIStackView *)[v37 initWithArrangedSubviews:v39];
  contentStackView = self->_contentStackView;
  self->_contentStackView = v40;

  [(UIStackView *)self->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_contentStackView setAlignment:3];
  [(UIStackView *)self->_contentStackView setAxis:0];
  [(UIStackView *)self->_contentStackView setDistribution:0];
  [(UIStackView *)self->_contentStackView setSpacing:5.0];
  [(UIStackView *)self->_contentStackView setLayoutMarginsRelativeArrangement:1];
  -[UIStackView setDirectionalLayoutMargins:](self->_contentStackView, "setDirectionalLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  v42 = [(HKPrescriptionPickerCell *)self contentView];
  [v42 addSubview:self->_contentStackView];

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);
}

void __42__HKPrescriptionPickerCell__setupSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapShowDetailsButton];
}

- (void)_setupConstraints
{
  contentStackView = self->_contentStackView;
  id v3 = [(HKPrescriptionPickerCell *)self contentView];
  [(UIStackView *)contentStackView hk_alignConstraintsWithView:v3];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HKPrescriptionPickerCell;
  [(HKPrescriptionPickerCell *)&v4 prepareForReuse];
  [(UILabel *)self->_primaryLabel setText:0];
  [(UILabel *)self->_secondaryLabel setText:0];
  [(UISwitch *)self->_toggleView setOn:0];
  prescription = self->_prescription;
  self->_prescription = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)_didTapShowDetailsButton
{
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v3 = objc_loadWeakRetained(&to);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    [v5 didTapShowDetailsButtonForCell:self];
  }
  objc_destroyWeak(&to);
}

- (void)_didToggleSwitch:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v5 = objc_loadWeakRetained(&to);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "didToggleSwitchForCell:isOn:", self, -[UISwitch isOn](self->_toggleView, "isOn"));
  }
  objc_destroyWeak(&to);
}

- (void)setPrescription:(id)a3
{
  id v19 = a3;
  objc_storeStrong((id *)&self->_prescription, a3);
  id v5 = v19;
  if (v19)
  {
    char v6 = HKVisionPrescriptionTypeDetailedLongLocalizedString(v19);
    [(UILabel *)self->_primaryLabel setText:v6];

    id v7 = [v19 dateIssued];
    double v8 = HKLocalizedStringForDateAndTemplate(v7, 10);
    [(UILabel *)self->_secondaryLabel setText:v8];

    HKVisionPrescriptionType v9 = [(HKVisionPrescription *)self->_prescription prescriptionType];
    double v10 = @"UIA.Health.Contacts";
    if (v9 == HKVisionPrescriptionTypeGlasses) {
      double v10 = @"UIA.Health.Glasses";
    }
    v11 = v10;
    v12 = HKVisionPrescriptionRawDescription(v19);
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      id v14 = (id)objc_msgSend(v12, "hk_stringByRemovingCharactersInSet:", v13);

      uint64_t v15 = [NSString stringWithFormat:@"%@.%@", v11, v12];

      v11 = (__CFString *)v15;
    }
    v16 = [(__CFString *)v11 stringByAppendingString:@".Cell.StaticText"];
    [(UILabel *)self->_primaryLabel setAccessibilityIdentifier:v16];

    v17 = [(__CFString *)v11 stringByAppendingString:@".Cell.Switch"];
    [(UISwitch *)self->_toggleView setAccessibilityIdentifier:v17];

    v18 = [(__CFString *)v11 stringByAppendingString:@".ViewPrescription.Button"];
    [(UIButton *)self->_showDetailsButton setAccessibilityIdentifier:v18];

    id v5 = v19;
  }
}

- (void)setOn:(BOOL)a3
{
}

- (BOOL)isOn
{
  return [(UISwitch *)self->_toggleView isOn];
}

- (HKVisionPrescription)prescription
{
  return self->_prescription;
}

- (HKPrescriptionPickerCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKPrescriptionPickerCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UIButton)showDetailsButton
{
  return self->_showDetailsButton;
}

- (void)setShowDetailsButton:(id)a3
{
}

- (UIStackView)sampleInfoStackView
{
  return self->_sampleInfoStackView;
}

- (void)setSampleInfoStackView:(id)a3
{
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (void)setButtonsStackView:(id)a3
{
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
}

- (UISwitch)toggleView
{
  return self->_toggleView;
}

- (void)setToggleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_sampleInfoStackView, 0);
  objc_storeStrong((id *)&self->_showDetailsButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prescription, 0);
}

@end