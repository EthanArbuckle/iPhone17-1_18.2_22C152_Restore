@interface HUTemperatureUnitControlView
+ (Class)valueClass;
- (BOOL)canBeHighlighted;
- (BOOL)viewDisabled;
- (HUControlViewDelegate)delegate;
- (HUTemperatureUnitControlView)initWithFrame:(CGRect)a3;
- (NSArray)labelConstraints;
- (NSString)identifier;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (id)_unitStringForCurrentUnit;
- (id)value;
- (int64_t)currentUnit;
- (void)setCanBeHighlighted:(BOOL)a3;
- (void)setCurrentUnit:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabelConstraints:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setValue:(id)a3;
- (void)setViewDisabled:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation HUTemperatureUnitControlView

- (HUTemperatureUnitControlView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HUTemperatureUnitControlView;
  v3 = -[HUTemperatureUnitControlView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v6 = *MEMORY[0x1E4F43870];
    v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v3->_titleLabel setFont:v7];

    v8 = _HULocalizedStringWithDefaultValue(@"HUTemperatureUnitTitle", @"HUTemperatureUnitTitle", 1);
    [(UILabel *)v3->_titleLabel setText:v8];

    [(HUTemperatureUnitControlView *)v3 addSubview:v3->_titleLabel];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v9;

    [(UILabel *)v3->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v6];
    [(UILabel *)v3->_detailLabel setFont:v11];

    v12 = [MEMORY[0x1E4F428B8] systemMidGrayColor];
    [(UILabel *)v3->_detailLabel setTextColor:v12];

    [(HUTemperatureUnitControlView *)v3 addSubview:v3->_detailLabel];
  }
  return v3;
}

- (void)updateConstraints
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HUTemperatureUnitControlView *)self titleLabel];
  v5 = [v4 leadingAnchor];
  uint64_t v6 = [(HUTemperatureUnitControlView *)self leadingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  v8 = [(HUTemperatureUnitControlView *)self titleLabel];
  v9 = [v8 topAnchor];
  v10 = [(HUTemperatureUnitControlView *)self topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v3 addObject:v11];

  v12 = [(HUTemperatureUnitControlView *)self titleLabel];
  v13 = [v12 bottomAnchor];
  objc_super v14 = [(HUTemperatureUnitControlView *)self bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  v16 = [(HUTemperatureUnitControlView *)self detailLabel];
  v17 = [v16 trailingAnchor];
  v18 = [(HUTemperatureUnitControlView *)self trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v3 addObject:v19];

  v20 = [(HUTemperatureUnitControlView *)self detailLabel];
  v21 = [v20 topAnchor];
  v22 = [(HUTemperatureUnitControlView *)self topAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  [v3 addObject:v23];

  v24 = [(HUTemperatureUnitControlView *)self detailLabel];
  uint64_t v25 = [v24 bottomAnchor];
  v26 = [(HUTemperatureUnitControlView *)self bottomAnchor];
  v27 = [(id)v25 constraintEqualToAnchor:v26];
  [v3 addObject:v27];

  v28 = [(HUTemperatureUnitControlView *)self labelConstraints];
  LOBYTE(v25) = [v3 isEqualToArray:v28];

  if ((v25 & 1) == 0)
  {
    v29 = [(HUTemperatureUnitControlView *)self labelConstraints];

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E4F28DC8];
      v31 = [(HUTemperatureUnitControlView *)self labelConstraints];
      [v30 deactivateConstraints:v31];
    }
    [(HUTemperatureUnitControlView *)self setLabelConstraints:v3];
    [MEMORY[0x1E4F28DC8] activateConstraints:v3];
  }
  v32.receiver = self;
  v32.super_class = (Class)HUTemperatureUnitControlView;
  [(HUTemperatureUnitControlView *)&v32 updateConstraints];
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)value
{
  v2 = NSNumber;
  int64_t v3 = [(HUTemperatureUnitControlView *)self currentUnit];

  return (id)[v2 numberWithInteger:v3];
}

- (void)setValue:(id)a3
{
  if (a3)
  {
    -[HUTemperatureUnitControlView setCurrentUnit:](self, "setCurrentUnit:", [a3 integerValue]);
    [(HUTemperatureUnitControlView *)self _unitStringForCurrentUnit];
  }
  else
  {
    HFLocalizedString();
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(HUTemperatureUnitControlView *)self detailLabel];
  [v4 setText:v5];
}

- (void)setDisabled:(BOOL)a3
{
  self->_viewDisabled = a3;
  if (a3) {
    [MEMORY[0x1E4F428B8] systemLightGrayColor];
  }
  else {
  id v5 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v4 = [(HUTemperatureUnitControlView *)self titleLabel];
  [v4 setTextColor:v5];
}

- (id)_unitStringForCurrentUnit
{
  int64_t v2 = [(HUTemperatureUnitControlView *)self currentUnit];
  if (!v2)
  {
    int64_t v3 = @"HUTemperatureCelsiusUnitTitle";
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    int64_t v3 = @"HUTemperatureFahrenheitUnitTitle";
LABEL_5:
    v4 = _HULocalizedStringWithDefaultValue(v3, v3, 1);
    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (HUControlViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUControlViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canBeHighlighted
{
  return self->_canBeHighlighted;
}

- (void)setCanBeHighlighted:(BOOL)a3
{
  self->_canBeHighlighted = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (int64_t)currentUnit
{
  return self->_currentUnit;
}

- (void)setCurrentUnit:(int64_t)a3
{
  self->_currentUnit = a3;
}

- (BOOL)viewDisabled
{
  return self->_viewDisabled;
}

- (void)setViewDisabled:(BOOL)a3
{
  self->_viewDisabled = a3;
}

- (NSArray)labelConstraints
{
  return self->_labelConstraints;
}

- (void)setLabelConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end