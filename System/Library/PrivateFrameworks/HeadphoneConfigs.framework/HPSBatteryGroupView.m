@interface HPSBatteryGroupView
- (HPSBatteryGroupView)initWithFrame:(CGRect)a3 batteryPercent:(unsigned __int8)a4 isCharging:(BOOL)a5 glyph:(id)a6 batteryLevelDescription:(id)a7;
- (HPSBatteryIconView)batteryIconView;
- (void)createBatteryGroupView:(BOOL)a3;
- (void)setBatteryIconView:(id)a3;
- (void)setChargePercent:(unsigned __int8)a3;
@end

@implementation HPSBatteryGroupView

- (HPSBatteryGroupView)initWithFrame:(CGRect)a3 batteryPercent:(unsigned __int8)a4 isCharging:(BOOL)a5 glyph:(id)a6 batteryLevelDescription:(id)a7
{
  BOOL v9 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HPSBatteryGroupView;
  v18 = -[HPSBatteryGroupView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v19 = v18;
  if (v18)
  {
    v18->batteryPercentNumber = a4;
    objc_storeStrong((id *)&v18->batteryGlyphView, a6);
    objc_storeStrong((id *)&v19->batteryLevelDescription, a7);
    [(HPSBatteryGroupView *)v19 createBatteryGroupView:v9];
  }

  return v19;
}

- (void)createBatteryGroupView:(BOOL)a3
{
  BOOL v3 = a3;
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = objc_alloc_init(HPSBatteryIconView);
  objc_storeStrong((id *)&self->_batteryIconView, v5);
  [(HPSBatteryIconView *)v5 setIsCharging:v3];
  [(HPSBatteryIconView *)v5 setContentMode:1];
  [(HPSBatteryIconView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  batteryPercentLabel = self->batteryPercentLabel;
  self->batteryPercentLabel = v6;

  [(UILabel *)self->batteryPercentLabel setContentMode:1];
  [(UILabel *)self->batteryPercentLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->batteryPercentLabel setAdjustsFontSizeToFitWidth:1];
  [(HPSBatteryGroupView *)self setChargePercent:self->batteryPercentNumber];
  [(HPSBatteryGroupView *)self addSubview:v5];
  batteryGlyphView = self->batteryGlyphView;
  if (batteryGlyphView)
  {
    [(UIImageView *)batteryGlyphView setContentMode:1];
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v9 setAxis:0];
    [v9 setAlignment:3];
    [v9 setDistribution:2];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setSemanticContentAttribute:3];
    [(UIImageView *)self->batteryGlyphView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 addArrangedSubview:self->batteryGlyphView];
    [v9 addArrangedSubview:self->batteryPercentLabel];
    [(HPSBatteryGroupView *)self addSubview:v9];
    v10 = [v9 heightAnchor];
    v11 = [v10 constraintEqualToConstant:20.0];
    [v45 addObject:v11];

    v12 = [(UIImageView *)self->batteryGlyphView heightAnchor];
    v13 = [(UILabel *)self->batteryPercentLabel heightAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    [v45 addObject:v14];

    v15 = [v9 heightAnchor];
    id v16 = [(UILabel *)self->batteryPercentLabel heightAnchor];
    id v17 = [v15 constraintEqualToAnchor:v16];
    [v45 addObject:v17];

    v18 = [(HPSBatteryIconView *)v5 topAnchor];
    v19 = [(HPSBatteryGroupView *)self topAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v45 addObject:v20];

    objc_super v21 = [(HPSBatteryIconView *)v5 centerXAnchor];
    v22 = [(HPSBatteryGroupView *)self centerXAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v45 addObject:v23];

    v24 = [v9 centerXAnchor];
    v25 = [(HPSBatteryIconView *)v5 centerXAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v45 addObject:v26];

    v27 = [v9 topAnchor];
    v28 = [(HPSBatteryIconView *)v5 bottomAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:5.0];
    [v45 addObject:v29];

    v30 = [v9 bottomAnchor];
    v31 = [(HPSBatteryGroupView *)self bottomAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v45 addObject:v32];
  }
  else
  {
    [(HPSBatteryGroupView *)self addSubview:self->batteryPercentLabel];
    v33 = [(HPSBatteryIconView *)v5 topAnchor];
    v34 = [(HPSBatteryGroupView *)self topAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v45 addObject:v35];

    v36 = [(HPSBatteryIconView *)v5 centerXAnchor];
    v37 = [(HPSBatteryGroupView *)self centerXAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [v45 addObject:v38];

    v39 = [(UILabel *)self->batteryPercentLabel centerXAnchor];
    v40 = [(HPSBatteryIconView *)v5 centerXAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v45 addObject:v41];

    v42 = [(UILabel *)self->batteryPercentLabel topAnchor];
    v43 = [(HPSBatteryIconView *)v5 bottomAnchor];
    v44 = [v42 constraintEqualToAnchor:v43 constant:5.0];
    [v45 addObject:v44];

    id v9 = [(UILabel *)self->batteryPercentLabel bottomAnchor];
    v30 = [(HPSBatteryGroupView *)self bottomAnchor];
    v31 = [v9 constraintEqualToAnchor:v30];
    [v45 addObject:v31];
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:v45];
}

- (void)setChargePercent:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  double v5 = 0.0;
  if (a3) {
    double v5 = 1.0;
  }
  [(HPSBatteryGroupView *)self setAlpha:v5];
  [(_UIBatteryView *)self->_batteryIconView setChargePercent:(double)v3 / 100.0];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%u%%", v3);
  [(UILabel *)self->batteryPercentLabel setText:v6];

  if (self->batteryLevelDescription)
  {
    id v7 = [NSString stringWithFormat:@"%@%u%%", self->batteryLevelDescription, v3];
    [(UILabel *)self->batteryPercentLabel setText:v7];
  }
}

- (HPSBatteryIconView)batteryIconView
{
  return self->_batteryIconView;
}

- (void)setBatteryIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryIconView, 0);
  objc_storeStrong((id *)&self->batteryPercentLabel, 0);
  objc_storeStrong((id *)&self->batteryLevelDescription, 0);

  objc_storeStrong((id *)&self->batteryGlyphView, 0);
}

@end