@interface WFOpacitySliderView
- (UILabel)opacityLabel;
- (WFOpacitySlider)slider;
- (WFOpacitySliderView)init;
- (double)opacity;
- (void)didChangeOpacityValue:(id)a3;
- (void)layoutSubviews;
- (void)reset;
@end

@implementation WFOpacitySliderView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_opacityLabel);
  objc_destroyWeak((id *)&self->_slider);
}

- (UILabel)opacityLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_opacityLabel);
  return (UILabel *)WeakRetained;
}

- (WFOpacitySlider)slider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  return (WFOpacitySlider *)WeakRetained;
}

- (void)reset
{
  v3 = [(WFOpacitySliderView *)self slider];
  LODWORD(v4) = 1.0;
  [v3 setValue:v4];

  id v5 = [(WFOpacitySliderView *)self slider];
  [(WFOpacitySliderView *)self didChangeOpacityValue:v5];
}

- (double)opacity
{
  v2 = [(WFOpacitySliderView *)self slider];
  [v2 value];
  double v4 = v3;

  return v4;
}

- (void)didChangeOpacityValue:(id)a3
{
  double v4 = NSString;
  [a3 value];
  v6 = objc_msgSend(v4, "stringWithFormat:", @"%0.0f%%", roundf(v5 * 100.0));
  v7 = [(WFOpacitySliderView *)self opacityLabel];
  [v7 setText:v6];

  [(WFOpacitySliderView *)self sendActionsForControlEvents:4096];
  [(WFOpacitySliderView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)WFOpacitySliderView;
  [(WFOpacitySliderView *)&v49 layoutSubviews];
  float v3 = [(WFOpacitySliderView *)self slider];
  [v3 bounds];
  objc_msgSend(v3, "trackRectForBounds:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [v3 value];
  LODWORD(v48) = v20;
  objc_msgSend(v3, "thumbRectForBounds:trackRect:value:", v13, v15, v17, v19, v5, v7, v9, v11, v48);
  double v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  [v3 frame];
  CGFloat v30 = v22 + v29;
  v31 = [(WFOpacitySliderView *)self opacityLabel];
  [v31 sizeToFit];

  v50.origin.x = v30;
  v50.origin.y = v24;
  v50.size.width = v26;
  v50.size.height = v28;
  double MidX = CGRectGetMidX(v50);
  v33 = [(WFOpacitySliderView *)self opacityLabel];
  [v33 frame];
  double v35 = MidX + v34 * -0.5;
  [v3 frame];
  double v37 = v36;
  v38 = [(WFOpacitySliderView *)self opacityLabel];
  [v38 frame];
  double v40 = v37 - (v39 + 5.0);
  v41 = [(WFOpacitySliderView *)self opacityLabel];
  [v41 frame];
  double v43 = v42;
  v44 = [(WFOpacitySliderView *)self opacityLabel];
  [v44 frame];
  double v46 = v45;
  v47 = [(WFOpacitySliderView *)self opacityLabel];
  objc_msgSend(v47, "setFrame:", v35, v40, v43, v46);
}

- (WFOpacitySliderView)init
{
  v34.receiver = self;
  v34.super_class = (Class)WFOpacitySliderView;
  v2 = [(WFOpacitySliderView *)&v34 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F82E50]);
    double v4 = [MEMORY[0x263F824D8] effectWithStyle:2];
    double v5 = (void *)[v3 initWithEffect:v4];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFOpacitySliderView *)v2 addSubview:v5];
    id v6 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = [MEMORY[0x263F825C8] colorWithRed:0.149019608 green:0.196078431 blue:0.219607843 alpha:0.75];
    [v6 setBackgroundColor:v7];

    double v8 = [v5 contentView];
    [v8 addSubview:v6];

    double v9 = (void *)MEMORY[0x263F08938];
    double v10 = _NSDictionaryOfVariableBindings(&cfstr_Blurtintview.isa, v6, 0);
    double v11 = [v9 constraintsWithVisualFormat:@"H:|[blurTintView]|" options:0 metrics:0 views:v10];
    [v5 addConstraints:v11];

    double v12 = (void *)MEMORY[0x263F08938];
    double v13 = _NSDictionaryOfVariableBindings(&cfstr_Blurtintview.isa, v6, 0);
    double v14 = [v12 constraintsWithVisualFormat:@"V:|[blurTintView]|" options:0 metrics:0 views:v13];
    [v5 addConstraints:v14];

    double v15 = (void *)MEMORY[0x263F08938];
    double v16 = _NSDictionaryOfVariableBindings(&cfstr_Backgroundview.isa, v5, 0);
    double v17 = [v15 constraintsWithVisualFormat:@"H:|[backgroundView]|" options:0 metrics:0 views:v16];
    [(WFOpacitySliderView *)v2 addConstraints:v17];

    double v18 = (void *)MEMORY[0x263F08938];
    double v19 = _NSDictionaryOfVariableBindings(&cfstr_Backgroundview.isa, v5, 0);
    int v20 = [v18 constraintsWithVisualFormat:@"V:|[backgroundView]|" options:0 metrics:0 views:v19];
    [(WFOpacitySliderView *)v2 addConstraints:v20];

    double v21 = objc_alloc_init(WFOpacitySlider);
    [(WFOpacitySlider *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v22 = [MEMORY[0x263F85308] actionKitImageNamed:@"OverlayImageOpacitySliderThumbImage"];
    double v23 = [v22 UIImage];
    [(WFOpacitySlider *)v21 setThumbImage:v23 forState:0];

    CGFloat v24 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.756862745 blue:0.0274509804 alpha:1.0];
    [(WFOpacitySlider *)v21 setTintColor:v24];

    double v25 = [MEMORY[0x263F825C8] colorWithRed:0.22745098 green:0.274509804 blue:0.298039216 alpha:0.75];
    [(WFOpacitySlider *)v21 setMaximumTrackTintColor:v25];

    [(WFOpacitySlider *)v21 addTarget:v2 action:sel_didChangeOpacityValue_ forControlEvents:4096];
    [(WFOpacitySliderView *)v2 addSubview:v21];
    objc_storeWeak((id *)&v2->_slider, v21);
    id v26 = objc_alloc_init(MEMORY[0x263F828E0]);
    double v27 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
    [v26 setFont:v27];

    CGFloat v28 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.756862745 blue:0.0274509804 alpha:0.699999988];
    [v26 setTextColor:v28];

    [v26 setTextAlignment:1];
    [(WFOpacitySliderView *)v2 addSubview:v26];
    objc_storeWeak((id *)&v2->_opacityLabel, v26);
    double v29 = [MEMORY[0x263F08938] constraintWithItem:v21 attribute:7 relatedBy:0 toItem:v2 attribute:7 multiplier:0.699999988 constant:1.0];
    [(WFOpacitySliderView *)v2 addConstraint:v29];

    CGFloat v30 = [MEMORY[0x263F08938] constraintWithItem:v21 attribute:9 relatedBy:0 toItem:v2 attribute:9 multiplier:1.0 constant:0.0];
    [(WFOpacitySliderView *)v2 addConstraint:v30];

    v31 = [MEMORY[0x263F08938] constraintWithItem:v21 attribute:10 relatedBy:0 toItem:v2 attribute:10 multiplier:1.0 constant:0.0];
    [(WFOpacitySliderView *)v2 addConstraint:v31];

    [(WFOpacitySliderView *)v2 reset];
    v32 = v2;
  }
  return v2;
}

@end