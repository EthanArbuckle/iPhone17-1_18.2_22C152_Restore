@interface HUTemperatureTextContentView
- (HUTemperatureTextContentView)initWithFrame:(CGRect)a3;
- (UILabel)temperatureLabel;
- (void)configureLabel;
- (void)layoutSubviews;
- (void)setTemperatureLabel:(id)a3;
- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation HUTemperatureTextContentView

- (HUTemperatureTextContentView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUTemperatureTextContentView;
  v3 = -[HUIconContentView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C768]);
    [(HUTemperatureTextContentView *)v3 setTemperatureLabel:v4];

    v5 = [(HUTemperatureTextContentView *)v3 temperatureLabel];
    [(HUTemperatureTextContentView *)v3 addSubview:v5];
  }
  return v3;
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUTemperatureTextContentView;
  [(HUIconContentView *)&v12 updateWithIconDescriptor:v8 displayStyle:a4 animated:v5];
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    [(HUTemperatureTextContentView *)self configureLabel];
    [(HUTemperatureTextContentView *)self setNeedsLayout];
  }
  else
  {
    NSLog(&cfstr_NoTemperatureI.isa);
  }
}

- (void)configureLabel
{
  v3 = [(HUIconContentView *)self iconDescriptor];
  uint64_t v4 = [v3 targetHeatingCoolingMode];

  if (v4)
  {
    BOOL v5 = [(HUIconContentView *)self iconDescriptor];
    uint64_t v6 = [v5 heatingCoolingMode];

    switch(v6)
    {
      case 0:
        uint64_t v7 = [MEMORY[0x263F1C550] systemGreenColor];
        goto LABEL_12;
      case 1:
        uint64_t v7 = [MEMORY[0x263F1C550] systemOrangeColor];
        goto LABEL_12;
      case 2:
        uint64_t v7 = [MEMORY[0x263F1C550] systemCyanColor];
        goto LABEL_12;
      case 3:
        uint64_t v7 = [MEMORY[0x263F1C550] darkGrayColor];
        goto LABEL_12;
      default:
        id v21 = 0;
        break;
    }
  }
  else
  {
    if ([(HUIconContentView *)self displayStyle] == 1) {
      [MEMORY[0x263F1C550] systemGrayColor];
    }
    else {
    uint64_t v7 = [(HUTemperatureTextContentView *)self tintColor];
    }
LABEL_12:
    id v21 = (id)v7;
  }
  id v8 = [(HUIconContentView *)self iconDescriptor];
  id v9 = [v8 formattedTemperature];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    HFLocalizedString();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_super v12 = v11;

  v13 = [MEMORY[0x263F1C658] systemFontOfSize:22.0 weight:*MEMORY[0x263F1D318]];
  v14 = [(HUTemperatureTextContentView *)self temperatureLabel];
  [v14 setText:v12];

  v15 = [MEMORY[0x263F1C550] clearColor];
  v16 = [(HUTemperatureTextContentView *)self temperatureLabel];
  [v16 setBackgroundColor:v15];

  v17 = [(HUTemperatureTextContentView *)self temperatureLabel];
  [v17 setFont:v13];

  v18 = [(HUTemperatureTextContentView *)self temperatureLabel];
  [v18 setTextColor:v21];

  v19 = [(HUTemperatureTextContentView *)self temperatureLabel];
  [v19 setAdjustsFontSizeToFitWidth:1];

  v20 = [(HUTemperatureTextContentView *)self temperatureLabel];
  [v20 setMinimumScaleFactor:0.2];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)HUTemperatureTextContentView;
  [(HUTemperatureTextContentView *)&v12 layoutSubviews];
  [(HUTemperatureTextContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(HUTemperatureTextContentView *)self temperatureLabel];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(HUTemperatureTextContentView *)self setClipsToBounds:0];
}

- (UILabel)temperatureLabel
{
  return self->_temperatureLabel;
}

- (void)setTemperatureLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end