@interface HACCBatteryView
- (HACCBatteryView)initWithFrame:(CGRect)a3;
- (void)setValue:(double)a3 forEar:(int)a4;
@end

@implementation HACCBatteryView

- (HACCBatteryView)initWithFrame:(CGRect)a3
{
  v48[1] = *MEMORY[0x263EF8340];
  v46.receiver = self;
  v46.super_class = (Class)HACCBatteryView;
  v3 = -[HACCBatteryView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    sideLabel = v3->_sideLabel;
    v3->_sideLabel = v4;

    v6 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835B8] addingSymbolicTraits:32770 options:0];
    uint64_t v47 = *MEMORY[0x263F81850];
    v7 = [NSNumber numberWithDouble:*MEMORY[0x263F81800]];
    v48[0] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
    v9 = [v6 fontDescriptorByAddingAttributes:v8];

    v10 = v3->_sideLabel;
    v11 = (void *)MEMORY[0x263F81708];
    [v9 pointSize];
    v12 = objc_msgSend(v11, "fontWithDescriptor:size:", v9);
    [(UILabel *)v10 setFont:v12];

    v13 = v3->_sideLabel;
    v14 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)v3->_sideLabel setTextAlignment:2];
    [(UILabel *)v3->_sideLabel setClipsToBounds:0];
    [(HACCBatteryView *)v3 addSubview:v3->_sideLabel];
    [(UILabel *)v3->_sideLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = (void *)MEMORY[0x263F08938];
    v16 = _NSDictionaryOfVariableBindings(&cfstr_Sidelabel.isa, v3->_sideLabel, 0);
    v17 = [v15 constraintsWithVisualFormat:@"V:|[_sideLabel]|" options:0 metrics:0 views:v16];
    [(HACCBatteryView *)v3 addConstraints:v17];

    v18 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = v18;

    v20 = v3->_valueLabel;
    v21 = (void *)MEMORY[0x263F81708];
    [v9 pointSize];
    v22 = objc_msgSend(v21, "fontWithDescriptor:size:", v9);
    [(UILabel *)v20 setFont:v22];

    v23 = v3->_valueLabel;
    v24 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v23 setTextColor:v24];

    [(UILabel *)v3->_valueLabel setTextAlignment:0];
    [(UILabel *)v3->_valueLabel setClipsToBounds:0];
    [(HACCBatteryView *)v3 addSubview:v3->_valueLabel];
    [(UILabel *)v3->_valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = (void *)MEMORY[0x263F08938];
    v26 = _NSDictionaryOfVariableBindings(&cfstr_Valuelabel.isa, v3->_valueLabel, 0);
    v27 = [v25 constraintsWithVisualFormat:@"V:|[_valueLabel]|" options:0 metrics:0 views:v26];
    [(HACCBatteryView *)v3 addConstraints:v27];

    uint64_t v28 = [objc_alloc(MEMORY[0x263F82EC8]) initWithSizeCategory:0];
    batteryView = v3->_batteryView;
    v3->_batteryView = (_UIBatteryView *)v28;

    v30 = v3->_batteryView;
    v31 = [MEMORY[0x263F825C8] whiteColor];
    [(_UIBatteryView *)v30 setFillColor:v31];

    v32 = v3->_batteryView;
    v33 = [MEMORY[0x263F825C8] whiteColor];
    [(_UIBatteryView *)v32 setBodyColor:v33];

    v34 = v3->_batteryView;
    v35 = [MEMORY[0x263F825C8] whiteColor];
    [(_UIBatteryView *)v34 setPinColor:v35];

    [(_UIBatteryView *)v3->_batteryView setChargePercent:1.0];
    [(HACCBatteryView *)v3 addSubview:v3->_batteryView];
    [(_UIBatteryView *)v3->_batteryView setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    numberFormatter = v3->_numberFormatter;
    v3->_numberFormatter = v36;

    [(NSNumberFormatter *)v3->_numberFormatter setNumberStyle:3];
    [(NSNumberFormatter *)v3->_numberFormatter setMaximumFractionDigits:0];
    v38 = v3->_numberFormatter;
    v39 = [NSNumber numberWithInt:0];
    v40 = [(NSNumberFormatter *)v38 stringFromNumber:v39];
    [(NSNumberFormatter *)v38 setNotANumberSymbol:v40];

    v41 = [MEMORY[0x263F08938] constraintWithItem:v3->_batteryView attribute:10 relatedBy:0 toItem:v3->_valueLabel attribute:10 multiplier:1.0 constant:0.0];
    [(HACCBatteryView *)v3 addConstraint:v41];

    v42 = (void *)MEMORY[0x263F08938];
    v43 = _NSDictionaryOfVariableBindings(&cfstr_SidelabelValue.isa, v3->_sideLabel, v3->_valueLabel, v3->_batteryView, 0);
    v44 = [v42 constraintsWithVisualFormat:@"H:|[_sideLabel]-(>=6.0)-[_valueLabel]-(6.0)-[_batteryView]|" options:0 metrics:0 views:v43];
    [(HACCBatteryView *)v3 addConstraints:v44];
  }
  return v3;
}

- (void)setValue:(double)a3 forEar:(int)a4
{
  switch(a4)
  {
    case 0:
    case 6:
      [(UILabel *)self->_sideLabel setText:&stru_26DAB2B88];
      break;
    case 2:
      sideLabel = self->_sideLabel;
      goto LABEL_5;
    case 4:
      sideLabel = self->_sideLabel;
LABEL_5:
      v7 = hearingLocString();
      [(UILabel *)sideLabel setText:v7];

      break;
    default:
      break;
  }
  valueLabel = self->_valueLabel;
  numberFormatter = self->_numberFormatter;
  v10 = [NSNumber numberWithDouble:a3];
  v11 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v10];
  [(UILabel *)valueLabel setText:v11];

  batteryView = self->_batteryView;
  [(_UIBatteryView *)batteryView setChargePercent:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_sideLabel, 0);
}

@end