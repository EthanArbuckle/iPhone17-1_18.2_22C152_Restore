@interface HKElectrocardiogramTableViewCell
+ (double)estimatedHeight;
+ (id)defaultReuseIdentifier;
- (BOOL)bottomPaddingDisabled;
- (HKElectrocardiogram)sample;
- (HKElectrocardiogramCardView)cardView;
- (HKElectrocardiogramTableViewCell)initWithSample:(id)a3 dateCache:(id)a4 onboarding:(BOOL)a5 activeAlgorithmVersion:(int64_t)a6;
- (NSLayoutConstraint)bottomPaddingConstraint;
- (void)_setupConstraints;
- (void)_setupUIWithSample:(id)a3 dateCache:(id)a4 onboarding:(BOOL)a5 activeAlgorithmVersion:(int64_t)a6;
- (void)prepareForReuse;
- (void)setActiveAlgorithmVersion:(int64_t)a3;
- (void)setBottomPaddingConstraint:(id)a3;
- (void)setBottomPaddingDisabled:(BOOL)a3;
- (void)setCardView:(id)a3;
- (void)setSample:(id)a3;
@end

@implementation HKElectrocardiogramTableViewCell

- (HKElectrocardiogramTableViewCell)initWithSample:(id)a3 dateCache:(id)a4 onboarding:(BOOL)a5 activeAlgorithmVersion:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = [(id)objc_opt_class() defaultReuseIdentifier];
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramTableViewCell;
  v13 = [(HKElectrocardiogramTableViewCell *)&v15 initWithStyle:0 reuseIdentifier:v12];

  if (v13)
  {
    [(HKElectrocardiogramTableViewCell *)v13 _setupUIWithSample:v10 dateCache:v11 onboarding:v7 activeAlgorithmVersion:a6];
    [(HKElectrocardiogramTableViewCell *)v13 _setupConstraints];
  }

  return v13;
}

- (void)setActiveAlgorithmVersion:(int64_t)a3
{
  id v4 = [(HKElectrocardiogramTableViewCell *)self cardView];
  [v4 setActiveAlgorithmVersion:a3];
}

- (void)setSample:(id)a3
{
  id v4 = a3;
  id v5 = [(HKElectrocardiogramTableViewCell *)self cardView];
  [v5 setSample:v4];
}

- (HKElectrocardiogram)sample
{
  v2 = [(HKElectrocardiogramTableViewCell *)self cardView];
  v3 = [v2 sample];

  return (HKElectrocardiogram *)v3;
}

- (void)setBottomPaddingDisabled:(BOOL)a3
{
  self->_bottomPaddingDisabled = a3;
  if (a3) {
    double v3 = 0.0;
  }
  else {
    double v3 = 16.0;
  }
  id v4 = [(HKElectrocardiogramTableViewCell *)self bottomPaddingConstraint];
  [v4 setConstant:v3];
}

+ (id)defaultReuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramTableViewCell;
  [(HKElectrocardiogramTableViewCell *)&v4 prepareForReuse];
  double v3 = [(HKElectrocardiogramTableViewCell *)self cardView];
  [v3 setSample:0];
}

+ (double)estimatedHeight
{
  +[HKElectrocardiogramCardView estimatedHeight];
  return result;
}

- (void)_setupUIWithSample:(id)a3 dateCache:(id)a4 onboarding:(BOOL)a5 activeAlgorithmVersion:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = (void *)MEMORY[0x1E4FB1618];
  id v11 = a4;
  id v12 = a3;
  v13 = [v10 clearColor];
  [(HKElectrocardiogramTableViewCell *)self setBackgroundColor:v13];

  v14 = [[HKElectrocardiogramCardView alloc] initWithSample:v12 dateCache:v11 onboarding:v7 activeAlgorithmVersion:a6 isSampleInteractive:1];
  [(HKElectrocardiogramTableViewCell *)self setCardView:v14];

  objc_super v15 = [(HKElectrocardiogramTableViewCell *)self cardView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(HKElectrocardiogramTableViewCell *)self contentView];
  v17 = [(HKElectrocardiogramTableViewCell *)self cardView];
  [v16 addSubview:v17];

  [(HKElectrocardiogramTableViewCell *)self setSelectionStyle:0];
}

- (void)_setupConstraints
{
  double v3 = [(HKElectrocardiogramTableViewCell *)self cardView];
  objc_super v4 = [(HKElectrocardiogramTableViewCell *)self contentView];
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  id v5 = [(HKElectrocardiogramTableViewCell *)self cardView];
  v6 = [v5 topAnchor];
  BOOL v7 = [(HKElectrocardiogramTableViewCell *)self contentView];
  v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  id v10 = [(HKElectrocardiogramTableViewCell *)self contentView];
  id v11 = [v10 bottomAnchor];
  id v12 = [(HKElectrocardiogramTableViewCell *)self cardView];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13 constant:16.0];
  [(HKElectrocardiogramTableViewCell *)self setBottomPaddingConstraint:v14];

  id v15 = [(HKElectrocardiogramTableViewCell *)self bottomPaddingConstraint];
  [v15 setActive:1];
}

- (BOOL)bottomPaddingDisabled
{
  return self->_bottomPaddingDisabled;
}

- (HKElectrocardiogramCardView)cardView
{
  return self->_cardView;
}

- (void)setCardView:(id)a3
{
}

- (NSLayoutConstraint)bottomPaddingConstraint
{
  return self->_bottomPaddingConstraint;
}

- (void)setBottomPaddingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
}

@end