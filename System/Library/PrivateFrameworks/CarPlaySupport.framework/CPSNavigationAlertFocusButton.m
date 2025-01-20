@interface CPSNavigationAlertFocusButton
+ (CPSNavigationAlertFocusButton)buttonWithAction:(id)a3 progressView:(id)a4 isPrimary:(BOOL)a5;
- (BOOL)isPrimary;
- (CGSize)intrinsicContentSize;
- (CPAlertAction)alertAction;
- (CPSNavigationAlertProgressView)progressView;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAlertAction:(id)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setProgressView:(id)a3;
@end

@implementation CPSNavigationAlertFocusButton

+ (CPSNavigationAlertFocusButton)buttonWithAction:(id)a3 progressView:(id)a4 isPrimary:(BOOL)a5
{
  v42[4] = *MEMORY[0x263EF8340];
  id v41 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = 0;
  objc_storeStrong(&v39, a4);
  BOOL v38 = a5;
  id v37 = (id)objc_msgSend(v41, "buttonWithType:");
  id v24 = CPSBackgroundColorForAlertAction(location[0], a5);
  objc_msgSend(v37, "setBackgroundColor:");

  id v25 = CPSLabelColorForAlertAction(location[0], a5);
  objc_msgSend(v37, "setTitleColor:forState:");

  id v26 = CPSLabelColorForAlertAction(location[0], a5);
  objc_msgSend(v37, "setTitleColor:forState:");

  id v27 = (id)[location[0] title];
  objc_msgSend(v37, "setTitle:forState:");

  id v29 = (id)[v37 titleLabel];
  id v28 = (id)[MEMORY[0x263F1C658] systemFontOfSize:15.0 weight:*MEMORY[0x263F1D340]];
  objc_msgSend(v29, "setFont:");

  id v30 = (id)[v37 titleLabel];
  [v30 setAdjustsFontSizeToFitWidth:1];

  id v31 = (id)[v37 titleLabel];
  [v31 setMinimumScaleFactor:0.899999976];

  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v37 setAlertAction:location[0]];
  [v37 setIsPrimary:a5];
  id v32 = (id)[v37 layer];
  [v32 setCornerRadius:6.0];

  id v33 = (id)[v37 layer];
  [v33 setMaskedCorners:15];

  uint64_t v34 = *MEMORY[0x263F15A20];
  id v35 = (id)[v37 layer];
  [v35 setCornerCurve:v34];

  id v36 = (id)[v37 layer];
  [v36 setMasksToBounds:1];

  if (v39)
  {
    [v37 setProgressView:v39];
    [v37 addSubview:v39];
    id v7 = (id)[v37 titleLabel];
    objc_msgSend(v37, "bringSubviewToFront:");

    v8 = (void *)MEMORY[0x263F08938];
    id v21 = (id)[v39 leadingAnchor];
    id v20 = (id)[v37 leadingAnchor];
    id v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
    v42[0] = v19;
    id v18 = (id)[v39 trailingAnchor];
    id v17 = (id)[v37 trailingAnchor];
    id v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v42[1] = v16;
    id v15 = (id)[v39 topAnchor];
    id v14 = (id)[v37 topAnchor];
    id v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
    v42[2] = v13;
    id v12 = (id)[v39 bottomAnchor];
    id v11 = (id)[v37 bottomAnchor];
    id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
    v42[3] = v10;
    id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
    objc_msgSend(v8, "activateConstraints:");
  }
  id v6 = v37;
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);

  return (CPSNavigationAlertFocusButton *)v6;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSNavigationAlertFocusButton;
  [(CPSNavigationAlertFocusButton *)&v5 pressesBegan:location[0] withEvent:v6];
  if (_pressesContainsPressType(location[0], 4)) {
    [(CPSNavigationAlertFocusButton *)v8 setHighlighted:1];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSNavigationAlertFocusButton;
  [(CPSNavigationAlertFocusButton *)&v5 pressesEnded:location[0] withEvent:v6];
  if (_pressesContainsPressType(location[0], 4)) {
    [(CPSNavigationAlertFocusButton *)v8 setHighlighted:0];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSNavigationAlertFocusButton;
  [(CPSNavigationAlertFocusButton *)&v5 pressesCancelled:location[0] withEvent:v6];
  if (_pressesContainsPressType(location[0], 4)) {
    [(CPSNavigationAlertFocusButton *)v8 setHighlighted:0];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (CGSize)intrinsicContentSize
{
  CGSizeMake_11();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CPAlertAction)alertAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertAction);

  return (CPAlertAction *)WeakRetained;
}

- (void)setAlertAction:(id)a3
{
}

- (CPSNavigationAlertProgressView)progressView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressView);

  return (CPSNavigationAlertProgressView *)WeakRetained;
}

- (void)setProgressView:(id)a3
{
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (void).cxx_destruct
{
}

@end