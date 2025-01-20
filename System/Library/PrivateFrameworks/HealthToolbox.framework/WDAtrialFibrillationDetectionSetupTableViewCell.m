@interface WDAtrialFibrillationDetectionSetupTableViewCell
+ (id)defaultReuseIdentifier;
- (WDAtrialFibrillationDetectionSetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WDAtrialFibrillationDetectionSetupView)setupView;
- (void)_setUpConstraints;
@end

@implementation WDAtrialFibrillationDetectionSetupTableViewCell

- (WDAtrialFibrillationDetectionSetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)WDAtrialFibrillationDetectionSetupTableViewCell;
  v4 = [(WDAtrialFibrillationDetectionSetupTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(WDAtrialFibrillationDetectionSetupTableViewCell *)v4 setSelectionStyle:0];
    v6 = [MEMORY[0x263F1C550] clearColor];
    [(WDAtrialFibrillationDetectionSetupTableViewCell *)v5 setBackgroundColor:v6];

    v7 = [WDAtrialFibrillationDetectionSetupView alloc];
    uint64_t v8 = -[HKOnboardingSetupView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    setupView = v5->_setupView;
    v5->_setupView = (WDAtrialFibrillationDetectionSetupView *)v8;

    [(WDAtrialFibrillationDetectionSetupView *)v5->_setupView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(WDAtrialFibrillationDetectionSetupTableViewCell *)v5 contentView];
    [v10 addSubview:v5->_setupView];

    [(WDAtrialFibrillationDetectionSetupTableViewCell *)v5 _setUpConstraints];
  }
  return v5;
}

- (void)_setUpConstraints
{
  id v4 = [(WDAtrialFibrillationDetectionSetupTableViewCell *)self setupView];
  v3 = [(WDAtrialFibrillationDetectionSetupTableViewCell *)self contentView];
  objc_msgSend(v4, "hk_alignConstraintsWithView:", v3);
}

+ (id)defaultReuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (WDAtrialFibrillationDetectionSetupView)setupView
{
  return self->_setupView;
}

- (void).cxx_destruct
{
}

@end