@interface WDSpinnerTableViewCell
+ (NSString)defaultReuseIdentifier;
- (NSString)waitingReason;
- (UIActivityIndicatorView)spinner;
- (UILabel)waitingReasonLabel;
- (UIView)contentContainerView;
- (WDSpinnerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)setContentContainerView:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setWaitingReason:(id)a3;
- (void)setWaitingReasonLabel:(id)a3;
- (void)setupConstraints;
- (void)setupSubviews;
@end

@implementation WDSpinnerTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)@"WDSpinnerTableViewCellIdentifier";
}

- (WDSpinnerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WDSpinnerTableViewCell;
  v4 = [(WDSpinnerTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(WDSpinnerTableViewCell *)v4 setSelectionStyle:0];
    [(WDSpinnerTableViewCell *)v5 setupSubviews];
    [(WDSpinnerTableViewCell *)v5 setupConstraints];
  }
  return v5;
}

- (void)setupSubviews
{
  v3 = objc_opt_new();
  [(WDSpinnerTableViewCell *)self setContentContainerView:v3];

  v4 = [(WDSpinnerTableViewCell *)self contentView];
  v5 = [(WDSpinnerTableViewCell *)self contentContainerView];
  [v4 addSubview:v5];

  v6 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  [(WDSpinnerTableViewCell *)self setSpinner:v6];

  objc_super v7 = [(WDSpinnerTableViewCell *)self contentContainerView];
  v8 = [(WDSpinnerTableViewCell *)self spinner];
  [v7 addSubview:v8];

  v9 = [(WDSpinnerTableViewCell *)self spinner];
  [v9 setHidesWhenStopped:0];

  id v10 = [(WDSpinnerTableViewCell *)self spinner];
  [v10 startAnimating];
}

- (void)setupConstraints
{
  v3 = [(WDSpinnerTableViewCell *)self contentView];
  v4 = [v3 heightAnchor];
  id v48 = [v4 constraintGreaterThanOrEqualToConstant:*MEMORY[0x263F1D608]];

  LODWORD(v5) = 1132068864;
  [v48 setPriority:v5];
  [v48 setActive:1];
  v6 = [(WDSpinnerTableViewCell *)self contentContainerView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v7 = [(WDSpinnerTableViewCell *)self contentContainerView];
  v8 = [v7 centerXAnchor];
  v9 = [(WDSpinnerTableViewCell *)self contentView];
  id v10 = [v9 centerXAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [(WDSpinnerTableViewCell *)self contentContainerView];
  v13 = [v12 centerYAnchor];
  v14 = [(WDSpinnerTableViewCell *)self contentView];
  v15 = [v14 centerYAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [(WDSpinnerTableViewCell *)self contentContainerView];
  v18 = [v17 leadingAnchor];
  v19 = [(WDSpinnerTableViewCell *)self contentView];
  v20 = [v19 leadingAnchor];
  v21 = [v18 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v20 multiplier:1.0];
  [v21 setActive:1];

  v22 = [(WDSpinnerTableViewCell *)self contentView];
  v23 = [v22 trailingAnchor];
  v24 = [(WDSpinnerTableViewCell *)self contentContainerView];
  v25 = [v24 trailingAnchor];
  v26 = [v23 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v25 multiplier:1.0];
  [v26 setActive:1];

  v27 = [(WDSpinnerTableViewCell *)self contentContainerView];
  v28 = [v27 topAnchor];
  v29 = [(WDSpinnerTableViewCell *)self contentView];
  v30 = [v29 topAnchor];
  v31 = [v28 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v30 multiplier:1.0];
  [v31 setActive:1];

  v32 = [(WDSpinnerTableViewCell *)self contentView];
  v33 = [v32 bottomAnchor];
  v34 = [(WDSpinnerTableViewCell *)self contentContainerView];
  v35 = [v34 bottomAnchor];
  v36 = [v33 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v35 multiplier:1.0];
  [v36 setActive:1];

  v37 = [(WDSpinnerTableViewCell *)self spinner];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

  v38 = [(WDSpinnerTableViewCell *)self spinner];
  v39 = [v38 centerXAnchor];
  v40 = [(WDSpinnerTableViewCell *)self contentContainerView];
  v41 = [v40 centerXAnchor];
  v42 = [v39 constraintEqualToAnchor:v41];
  [v42 setActive:1];

  v43 = [(WDSpinnerTableViewCell *)self spinner];
  v44 = [v43 centerYAnchor];
  v45 = [(WDSpinnerTableViewCell *)self contentContainerView];
  v46 = [v45 centerYAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  [v47 setActive:1];
}

- (void)setWaitingReason:(id)a3
{
  id v4 = a3;
  double v5 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];

  if (!v5)
  {
    v6 = [(WDSpinnerTableViewCell *)self contentContainerView];
    objc_super v7 = [(WDSpinnerTableViewCell *)self contentContainerView];
    v8 = [v7 constraints];
    [v6 removeConstraints:v8];

    v9 = objc_opt_new();
    [(WDSpinnerTableViewCell *)self setWaitingReasonLabel:v9];

    id v10 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
    [v10 setNumberOfLines:0];

    v11 = [MEMORY[0x263F1C550] lightGrayColor];
    v12 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
    [v12 setTextColor:v11];

    v13 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v14 = [(WDSpinnerTableViewCell *)self contentContainerView];
    v15 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
    [v14 addSubview:v15];

    v16 = [(WDSpinnerTableViewCell *)self spinner];
    v17 = [v16 centerYAnchor];
    v18 = [(WDSpinnerTableViewCell *)self contentContainerView];
    v19 = [v18 centerYAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
    v22 = [v21 centerYAnchor];
    v23 = [(WDSpinnerTableViewCell *)self contentContainerView];
    v24 = [v23 centerYAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [v25 setActive:1];

    v26 = [(WDSpinnerTableViewCell *)self contentContainerView];
    v27 = [v26 topAnchor];
    v28 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
    v29 = [v28 topAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];
    [v30 setActive:1];

    v31 = [(WDSpinnerTableViewCell *)self contentContainerView];
    v32 = [v31 bottomAnchor];
    v33 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
    v34 = [v33 bottomAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [(WDSpinnerTableViewCell *)self contentContainerView];
    v37 = [v36 leadingAnchor];
    v38 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
    v39 = [v38 leadingAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    [v40 setActive:1];

    v41 = [(WDSpinnerTableViewCell *)self spinner];
    v42 = [v41 leadingAnchor];
    v43 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
    v44 = [v43 trailingAnchor];
    v45 = [v42 constraintEqualToSystemSpacingAfterAnchor:v44 multiplier:1.0];
    [v45 setActive:1];

    v46 = [(WDSpinnerTableViewCell *)self spinner];
    v47 = [v46 trailingAnchor];
    id v48 = [(WDSpinnerTableViewCell *)self contentContainerView];
    v49 = [v48 trailingAnchor];
    v50 = [v47 constraintEqualToAnchor:v49];
    [v50 setActive:1];
  }
  id v51 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
  [v51 setText:v4];
}

- (NSString)waitingReason
{
  v2 = [(WDSpinnerTableViewCell *)self waitingReasonLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)WDSpinnerTableViewCell;
  [(WDSpinnerTableViewCell *)&v4 prepareForReuse];
  v3 = [(WDSpinnerTableViewCell *)self spinner];
  [v3 startAnimating];
}

- (UIView)contentContainerView
{
  return (UIView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setContentContainerView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setSpinner:(id)a3
{
}

- (UILabel)waitingReasonLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setWaitingReasonLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingReasonLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end