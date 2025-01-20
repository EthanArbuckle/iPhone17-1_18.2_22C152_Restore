@interface HUEnergyIndicatorAccessoryView
- (CGSize)sizeThatFits:(CGSize)a3;
- (HUEnergyIndicatorAccessoryView)initWithEnergyIndicator:(id)a3;
- (NSMutableArray)constraints;
- (UIView)energyIndicatorView;
- (void)setConstraints:(id)a3;
- (void)setEnergyIndicatorView:(id)a3;
- (void)updateConstraints;
@end

@implementation HUEnergyIndicatorAccessoryView

- (HUEnergyIndicatorAccessoryView)initWithEnergyIndicator:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUEnergyIndicatorAccessoryView;
  v6 = [(HUEnergyIndicatorAccessoryView *)&v12 init];
  v7 = v6;
  if (v6)
  {
    p_energyIndicatorView = (id *)&v6->_energyIndicatorView;
    objc_storeStrong((id *)&v6->_energyIndicatorView, a3);
    [*p_energyIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [MEMORY[0x1E4F428B8] clearColor];
    [*p_energyIndicatorView setBackgroundColor:v9];

    [*p_energyIndicatorView setContentMode:1];
    [*p_energyIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(HUEnergyIndicatorAccessoryView *)v7 energyIndicatorView];
    [(HUEnergyIndicatorAccessoryView *)v7 addSubview:v10];

    [(HUEnergyIndicatorAccessoryView *)v7 setNeedsUpdateConstraints];
  }

  return v7;
}

- (void)updateConstraints
{
  v3 = [(HUEnergyIndicatorAccessoryView *)self constraints];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = (void *)MEMORY[0x1E4F28DC8];
    v6 = [(HUEnergyIndicatorAccessoryView *)self energyIndicatorView];
    v7 = [v5 constraintWithItem:v6 attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:16.0];
    [v4 addObject:v7];

    v8 = (void *)MEMORY[0x1E4F28DC8];
    v9 = [(HUEnergyIndicatorAccessoryView *)self energyIndicatorView];
    v10 = [v8 constraintWithItem:v9 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:16.0];
    [v4 addObject:v10];

    v11 = (void *)MEMORY[0x1E4F28DC8];
    objc_super v12 = [(HUEnergyIndicatorAccessoryView *)self energyIndicatorView];
    v13 = [v11 constraintWithItem:v12 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:-16.0];
    [v4 addObject:v13];

    v14 = (void *)MEMORY[0x1E4F28DC8];
    v15 = [(HUEnergyIndicatorAccessoryView *)self energyIndicatorView];
    v16 = [v14 constraintWithItem:v15 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:0.0];
    [v4 addObject:v16];

    [(HUEnergyIndicatorAccessoryView *)self setConstraints:v4];
    v17 = (void *)MEMORY[0x1E4F28DC8];
    v18 = [(HUEnergyIndicatorAccessoryView *)self constraints];
    [v17 activateConstraints:v18];
  }
  v19.receiver = self;
  v19.super_class = (Class)HUEnergyIndicatorAccessoryView;
  [(HUEnergyIndicatorAccessoryView *)&v19 updateConstraints];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(HUEnergyIndicatorAccessoryView *)self energyIndicatorView];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
  double v5 = v4;
  double v7 = v6;

  double v8 = v5 + 16.0;
  double v9 = v7 + 32.0;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIView)energyIndicatorView
{
  return self->_energyIndicatorView;
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void)setEnergyIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_energyIndicatorView, 0);
}

@end