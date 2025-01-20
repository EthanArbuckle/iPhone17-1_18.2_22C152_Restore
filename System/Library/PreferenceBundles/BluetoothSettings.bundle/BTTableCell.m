@interface BTTableCell
- (BOOL)hasLimitedConnectivity;
- (BTTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIActivityIndicatorView)spinner;
- (int)state;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDeviceState:(int)a3;
- (void)setDeviceStatePaired:(BOOL)a3 andConnected:(BOOL)a4 andPendingSetup:(BOOL)a5;
- (void)setHasLimitedConnectivity:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setState:(int)a3;
@end

@implementation BTTableCell

- (void)layoutSubviews
{
  v85[1] = *MEMORY[0x263EF8340];
  v83.receiver = self;
  v83.super_class = (Class)BTTableCell;
  [(PSTableCell *)&v83 layoutSubviews];
  v3 = [(PSTableCell *)self titleLabel];
  [v3 frame];
  double v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;

  double v12 = 0.0;
  double v13 = 0.0;
  if ([(BTTableCell *)self state] <= 2)
  {
    [(BTTableCell *)self layoutMargins];
    double v13 = v14;
  }
  if ([(BTTableCell *)self state] <= 2)
  {
    [(BTTableCell *)self layoutMargins];
    double v12 = v15;
  }
  uint64_t v16 = [(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection];
  if ([(BTTableCell *)self state] == 1 || [(BTTableCell *)self state] == 4)
  {
    v17 = [(PSTableCell *)self valueLabel];
    [v17 setAlpha:0.0];

    v18 = [(BTTableCell *)self spinner];
    [v18 frame];
    double v20 = v19;
    double v22 = v21;

    if (!v16)
    {
      v23 = [(BTTableCell *)self contentView];
      [v23 frame];
      double v12 = v24 - v20 - v12;
    }
    v25 = [(BTTableCell *)self contentView];
    [v25 frame];
    CGFloat v27 = floor((v26 - v22) * 0.5);

    v86.origin.double x = v12;
    v86.origin.double y = v27;
    v86.size.double width = v20;
    v86.size.double height = v22;
    CGRect v87 = CGRectIntegral(v86);
    double x = v87.origin.x;
    double y = v87.origin.y;
    double width = v87.size.width;
    double height = v87.size.height;
    v32 = [(BTTableCell *)self spinner];
    objc_msgSend(v32, "setFrame:", x, y, width, height);

    v33 = [(BTTableCell *)self spinner];
    [v33 startAnimating];

    v34 = [(BTTableCell *)self contentView];
    [v34 frame];
    double v36 = v35 - v20;
    v37 = [(BTTableCell *)self contentView];
    [v37 layoutMargins];
    double v9 = v36 - v38 - v13 + -12.0;
  }
  else
  {
    v51 = [(BTTableCell *)self spinner];
    [v51 stopAnimating];

    v52 = [(PSTableCell *)self valueLabel];
    [v52 setAlpha:1.0];

    v53 = [(BTTableCell *)self traitCollection];
    v54 = [v53 preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v54);

    if (IsAccessibilityCategory) {
      goto LABEL_14;
    }
    v56 = [(PSTableCell *)self valueLabel];
    v57 = [v56 text];
    v58 = [(BTTableCell *)self contentView];
    [v58 bounds];
    double v60 = v59;
    double v62 = v61;
    uint64_t v84 = *MEMORY[0x263F814F0];
    v63 = [(PSTableCell *)self valueLabel];
    v64 = [v63 font];
    v85[0] = v64;
    v65 = [NSDictionary dictionaryWithObjects:v85 forKeys:&v84 count:1];
    objc_msgSend(v57, "boundingRectWithSize:options:attributes:context:", 0, v65, 0, v60, v62);
    double v67 = v66;
    double v69 = v68;

    double v70 = ceil(v67);
    double v71 = ceil(v69);
    double v72 = v13;
    if (!v16)
    {
      v73 = [(BTTableCell *)self contentView];
      [v73 frame];
      double v72 = v74 - v70 - v13;
    }
    v90.origin.double x = v72;
    v90.origin.double y = v7;
    v90.size.double width = v70;
    v90.size.double height = v71;
    CGRect v91 = CGRectIntegral(v90);
    double v75 = v91.origin.x;
    double v76 = v91.origin.y;
    double v77 = v91.size.width;
    double v78 = v91.size.height;
    v79 = [(PSTableCell *)self valueLabel];
    objc_msgSend(v79, "setFrame:", v75, v76, v77, v78);

    v34 = [(BTTableCell *)self contentView];
    [v34 frame];
    double v81 = v80 - v70;
    v37 = [(BTTableCell *)self contentView];
    [v37 layoutMargins];
    double v9 = floor(v81 - v82 - v13 + -12.0);
  }

  v39 = [(BTTableCell *)self contentView];
  v40 = v39;
  if (v16)
  {
    [v39 size];
    double v42 = v41 - v9;
    v43 = [(BTTableCell *)self contentView];
    [v43 layoutMargins];
    double v5 = v42 - v44;
  }
  else
  {
    [v39 layoutMargins];
    double v5 = v45;
  }

LABEL_14:
  v88.origin.double x = v5;
  v88.origin.double y = v7;
  v88.size.double width = v9;
  v88.size.double height = v11;
  CGRect v89 = CGRectIntegral(v88);
  double v46 = v89.origin.x;
  double v47 = v89.origin.y;
  double v48 = v89.size.width;
  double v49 = v89.size.height;
  v50 = [(PSTableCell *)self titleLabel];
  objc_msgSend(v50, "setFrame:", v46, v47, v48, v49);
}

- (int)state
{
  return self->_state;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (BTTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BTTableCell;
  double v5 = [(PSTableCell *)&v10 initWithStyle:1 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v6;

    [(UIActivityIndicatorView *)v5->_spinner setHidesWhenStopped:1];
    double v8 = [(BTTableCell *)v5 contentView];
    [v8 addSubview:v5->_spinner];
  }
  return v5;
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_spinner removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)BTTableCell;
  [(PSTableCell *)&v3 dealloc];
}

- (void)setDeviceState:(int)a3
{
  [(BTTableCell *)self setState:*(void *)&a3];
  switch([(BTTableCell *)self state])
  {
    case 0:
    case 1:
      double v4 = [(PSTableCell *)self valueLabel];
      [v4 setText:0];
      goto LABEL_5;
    case 2:
      double v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v8 = [v4 localizedStringForKey:@"PAIRED_AND_CONNECTED" value:&stru_26F24FEE8 table:@"Devices"];
      double v9 = [(PSTableCell *)self valueLabel];
      [v9 setText:v8];

LABEL_5:
      objc_super v10 = self;
      uint64_t v11 = 0;
      goto LABEL_8;
    case 3:
    case 4:
      double v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      CGFloat v7 = @"PAIRED";
      goto LABEL_7;
    case 5:
      double v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      CGFloat v7 = @"PAIRED_AND_CONNECTED";
LABEL_7:
      double v12 = [v5 localizedStringForKey:v7 value:&stru_26F24FEE8 table:@"Devices"];
      double v13 = [(PSTableCell *)self valueLabel];
      [v13 setText:v12];

      objc_super v10 = self;
      uint64_t v11 = 4;
LABEL_8:
      [(BTTableCell *)v10 setAccessoryType:v11];
      return;
    case 6:
      double v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v15 = v14;
      uint64_t v16 = @"PAIRED";
      goto LABEL_13;
    case 7:
      double v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v15 = v14;
      uint64_t v16 = @"PAIRED_AND_CONNECTED";
LABEL_13:
      v17 = [v14 localizedStringForKey:v16 value:&stru_26F24FEE8 table:@"Devices"];
      v18 = [(PSTableCell *)self valueLabel];
      [v18 setText:v17];

      [(BTTableCell *)self setAccessoryType:4];
      id v19 = [MEMORY[0x263F825C8] systemOrangeColor];
      [(BTTableCell *)self setTintColor:v19];

      break;
    default:
      return;
  }
}

- (void)setDeviceStatePaired:(BOOL)a3 andConnected:(BOOL)a4 andPendingSetup:(BOOL)a5
{
  if (a4) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a4) {
    int v6 = 5;
  }
  else {
    int v6 = 3;
  }
  if (a3) {
    unsigned int v5 = v6;
  }
  if (a4) {
    unsigned int v7 = 7;
  }
  else {
    unsigned int v7 = 6;
  }
  if (a5) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v5;
  }
  [(BTTableCell *)self setDeviceState:v8];
}

- (void)setSpinner:(id)a3
{
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)hasLimitedConnectivity
{
  return self->_hasLimitedConnectivity;
}

- (void)setHasLimitedConnectivity:(BOOL)a3
{
  self->_hasLimitedConnectivitdouble y = a3;
}

- (void).cxx_destruct
{
}

@end