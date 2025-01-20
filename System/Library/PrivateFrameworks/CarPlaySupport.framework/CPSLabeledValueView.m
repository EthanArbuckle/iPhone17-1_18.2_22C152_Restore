@interface CPSLabeledValueView
- (CPSLabeledValueView)init;
- (UILabel)label;
- (UILabel)valueText;
- (void)setTextColor:(id)a3;
@end

@implementation CPSLabeledValueView

- (CPSLabeledValueView)init
{
  v38[7] = *MEMORY[0x263EF8340];
  SEL v36 = a2;
  v37 = 0;
  v35.receiver = self;
  v35.super_class = (Class)CPSLabeledValueView;
  v37 = [(CPSLabeledValueView *)&v35 init];
  objc_storeStrong((id *)&v37, v37);
  if (v37)
  {
    [(CPSLabeledValueView *)v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v34 = (id)[MEMORY[0x263F1C550] whiteColor];
    id v33 = objc_alloc_init(MEMORY[0x263F1C768]);
    id v5 = v33;
    id v6 = (id)objc_msgSend(MEMORY[0x263F1C658], "monospacedDigitSystemFontOfSize:weight:");
    objc_msgSend(v5, "setFont:");

    objc_msgSend(v33, "setTextAlignment:");
    [v33 setTextColor:v34];
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&v37->_valueText, v33);
    [(CPSLabeledValueView *)v37 addSubview:v33];
    id v32 = objc_alloc_init(MEMORY[0x263F1C768]);
    id v7 = v32;
    id v8 = (id)[MEMORY[0x263F1C658] systemFontOfSize:12.0 weight:*MEMORY[0x263F1D338]];
    objc_msgSend(v7, "setFont:");

    [v32 setTextAlignment:1];
    [v32 setTextColor:v34];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&v37->_label, v32);
    [(CPSLabeledValueView *)v37 addSubview:v32];
    id v10 = (id)[v32 firstBaselineAnchor];
    id v9 = (id)[v33 lastBaselineAnchor];
    id v31 = (id)objc_msgSend(v10, "constraintEqualToAnchor:constant:", 14.0);

    LODWORD(v2) = 1148846080;
    [v31 setPriority:v2];
    v11 = (void *)MEMORY[0x263F08938];
    id v30 = (id)[v33 centerXAnchor];
    id v29 = (id)[(CPSLabeledValueView *)v37 centerXAnchor];
    id v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
    v38[0] = v28;
    id v27 = (id)[v32 centerXAnchor];
    id v26 = (id)[(CPSLabeledValueView *)v37 centerXAnchor];
    id v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
    v38[1] = v25;
    id v24 = (id)[(CPSLabeledValueView *)v37 widthAnchor];
    id v23 = (id)[v33 widthAnchor];
    id v22 = (id)objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:");
    v38[2] = v22;
    id v21 = (id)[(CPSLabeledValueView *)v37 widthAnchor];
    id v20 = (id)[v32 widthAnchor];
    id v19 = (id)objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:");
    v38[3] = v19;
    v38[4] = v31;
    id v18 = (id)[v33 topAnchor];
    id v17 = (id)[(CPSLabeledValueView *)v37 topAnchor];
    id v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v38[5] = v16;
    id v15 = (id)[(CPSLabeledValueView *)v37 bottomAnchor];
    id v14 = (id)[v32 bottomAnchor];
    id v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
    v38[6] = v13;
    id v12 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:7];
    objc_msgSend(v11, "activateConstraints:");

    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  v4 = v37;
  objc_storeStrong((id *)&v37, 0);
  return v4;
}

- (void)setTextColor:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSLabeledValueView *)v6 valueText];
  [(UILabel *)v3 setTextColor:location[0]];

  v4 = [(CPSLabeledValueView *)v6 label];
  [(UILabel *)v4 setTextColor:location[0]];

  objc_storeStrong(location, 0);
}

- (UILabel)valueText
{
  return self->_valueText;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

@end