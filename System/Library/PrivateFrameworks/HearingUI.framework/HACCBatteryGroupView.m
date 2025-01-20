@interface HACCBatteryGroupView
- (HACCBatteryGroupView)initWithFrame:(CGRect)a3;
- (HACCBatteryView)bottomBatteryView;
- (HACCBatteryView)topBatteryView;
- (void)setBottomBatteryView:(id)a3;
- (void)setTopBatteryView:(id)a3;
- (void)updateConstraints;
- (void)updateValueForDevice:(id)a3;
- (void)updateValueForLeft:(double)a3 right:(double)a4 andAvailableEars:(int)a5;
@end

@implementation HACCBatteryGroupView

- (HACCBatteryGroupView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HACCBatteryGroupView;
  v3 = -[HACCBatteryGroupView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(HACCBatteryView);
    [(HACCBatteryGroupView *)v3 addSubview:v4];
    [(HACCBatteryView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HACCBatteryGroupView *)v3 setTopBatteryView:v4];
    v5 = objc_alloc_init(HACCBatteryView);
    [(HACCBatteryGroupView *)v3 addSubview:v5];
    [(HACCBatteryView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HACCBatteryGroupView *)v3 setBottomBatteryView:v5];
  }
  return v3;
}

- (void)updateValueForDevice:(id)a3
{
  id v4 = a3;
  [v4 leftBatteryLevel];
  double v6 = v5;
  [v4 rightBatteryLevel];
  double v8 = v7;
  uint64_t v9 = [v4 availableEars];

  [(HACCBatteryGroupView *)self updateValueForLeft:v9 right:v6 andAvailableEars:v8];
}

- (void)updateValueForLeft:(double)a3 right:(double)a4 andAvailableEars:(int)a5
{
  double v6 = a4;
  if (a5 == 6)
  {
    if (vabdd_f64(a3, a4) >= 0.05)
    {
      v15 = [(HACCBatteryGroupView *)self topBatteryView];
      [v15 setValue:2 forEar:a3];

      v16 = [(HACCBatteryGroupView *)self bottomBatteryView];
      [v16 setValue:4 forEar:v6];

      v17 = [(HACCBatteryGroupView *)self bottomBatteryView];
      [v17 setHidden:0];

      v10 = [(HACCBatteryGroupView *)self topBatteryView];
      v11 = v10;
      uint64_t v12 = 0;
      goto LABEL_9;
    }
  }
  else if (!a5)
  {
    uint64_t v9 = [(HACCBatteryGroupView *)self topBatteryView];
    [v9 setHidden:1];

    v10 = [(HACCBatteryGroupView *)self bottomBatteryView];
    v11 = v10;
    uint64_t v12 = 1;
LABEL_9:
    [v10 setHidden:v12];
    goto LABEL_10;
  }
  v13 = [(HACCBatteryGroupView *)self topBatteryView];
  [v13 setHidden:0];

  v14 = [(HACCBatteryGroupView *)self bottomBatteryView];
  [v14 setHidden:1];

  if (a5 == 2) {
    double v6 = a3;
  }
  v11 = [(HACCBatteryGroupView *)self topBatteryView];
  [v11 setValue:6 forEar:v6];
LABEL_10:

  [(HACCBatteryGroupView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v3 = [(HACCBatteryGroupView *)self constraints];
  [(HACCBatteryGroupView *)self removeConstraints:v3];

  v30.receiver = self;
  v30.super_class = (Class)HACCBatteryGroupView;
  [(HACCBatteryGroupView *)&v30 updateConstraints];
  id v4 = [(HACCBatteryGroupView *)self topBatteryView];
  double v5 = [(HACCBatteryGroupView *)self bottomBatteryView];
  double v6 = [MEMORY[0x263F82438] sharedApplication];
  double v7 = [v6 preferredContentSizeCategory];

  if ((([v7 isEqualToString:*MEMORY[0x263F83410]] & 1) != 0
     || [v7 isEqualToString:*MEMORY[0x263F83408]])
    && ([MEMORY[0x263F472B0] deviceIsSmallPhone] & 1) == 0)
  {
    v22 = (void *)MEMORY[0x263F08938];
    v23 = _NSDictionaryOfVariableBindings(&cfstr_Topview.isa, v4, 0);
    v24 = [v22 constraintsWithVisualFormat:@"V:|[topView]|" options:0 metrics:0 views:v23];
    [(HACCBatteryGroupView *)self addConstraints:v24];

    v25 = (void *)MEMORY[0x263F08938];
    v26 = _NSDictionaryOfVariableBindings(&cfstr_Bottomview.isa, v5, 0);
    v27 = [v25 constraintsWithVisualFormat:@"V:|[bottomView]|" options:0 metrics:0 views:v26];
    [(HACCBatteryGroupView *)self addConstraints:v27];

    v28 = (void *)MEMORY[0x263F08938];
    v21 = _NSDictionaryOfVariableBindings(&cfstr_TopviewBottomv.isa, v4, v5, 0);
    v29 = [v28 constraintsWithVisualFormat:@"H:|-(0.0)-[topView]-[bottomView]-(0.0)-|" options:0 metrics:0 views:v21];
    [(HACCBatteryGroupView *)self addConstraints:v29];

    goto LABEL_9;
  }
  double v8 = (void *)MEMORY[0x263F08938];
  uint64_t v9 = _NSDictionaryOfVariableBindings(&cfstr_Topview.isa, v4, 0);
  v10 = [v8 constraintsWithVisualFormat:@"H:|[topView]|" options:0 metrics:0 views:v9];
  [(HACCBatteryGroupView *)self addConstraints:v10];

  v11 = (void *)MEMORY[0x263F08938];
  uint64_t v12 = _NSDictionaryOfVariableBindings(&cfstr_Bottomview.isa, v5, 0);
  v13 = [v11 constraintsWithVisualFormat:@"H:|[bottomView]|" options:0 metrics:0 views:v12];
  [(HACCBatteryGroupView *)self addConstraints:v13];

  v14 = (void *)MEMORY[0x263F08938];
  v15 = NSString;
  int v16 = [v5 isHidden];
  v17 = &stru_26DAB2B88;
  if (v16) {
    v17 = @"(0.0)";
  }
  v18 = [v15 stringWithFormat:@"V:|[topView]-(0.0)-[bottomView%@]|", v17];
  v19 = _NSDictionaryOfVariableBindings(&cfstr_TopviewBottomv.isa, v4, v5, 0);
  v20 = [v14 constraintsWithVisualFormat:v18 options:0 metrics:0 views:v19];
  [(HACCBatteryGroupView *)self addConstraints:v20];

  if (([v5 isHidden] & 1) == 0)
  {
    v21 = [MEMORY[0x263F08938] constraintWithItem:v4 attribute:8 relatedBy:0 toItem:v5 attribute:8 multiplier:1.0 constant:0.0];
    [(HACCBatteryGroupView *)self addConstraint:v21];
LABEL_9:
  }
}

- (HACCBatteryView)topBatteryView
{
  return self->_topBatteryView;
}

- (void)setTopBatteryView:(id)a3
{
}

- (HACCBatteryView)bottomBatteryView
{
  return self->_bottomBatteryView;
}

- (void)setBottomBatteryView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomBatteryView, 0);
  objc_storeStrong((id *)&self->_topBatteryView, 0);
}

@end