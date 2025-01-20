@interface HKQuantitySeriesTableViewCell
+ (id)reuseIdentifier;
- (HKQuantitySeriesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)currentConstraints;
- (id)_makeAccessibilityConstraints;
- (id)_makeConstraints;
- (void)_configureLabels;
- (void)_configureLayoutForTraitCollection:(id)a3;
- (void)setCurrentConstraints:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKQuantitySeriesTableViewCell

- (HKQuantitySeriesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HKQuantitySeriesTableViewCell;
  v4 = [(HKQuantitySeriesTableViewCell *)&v8 initWithStyle:1 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKQuantitySeriesTableViewCell *)v4 _configureLabels];
    v6 = [(HKQuantitySeriesTableViewCell *)v5 traitCollection];
    [(HKQuantitySeriesTableViewCell *)v5 _configureLayoutForTraitCollection:v6];
  }
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKQuantitySeriesTableViewCell;
  id v4 = a3;
  [(HKQuantitySeriesTableViewCell *)&v9 traitCollectionDidChange:v4];
  v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  v6 = [(HKQuantitySeriesTableViewCell *)self traitCollection];
  v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    objc_super v8 = [(HKQuantitySeriesTableViewCell *)self traitCollection];
    [(HKQuantitySeriesTableViewCell *)self _configureLayoutForTraitCollection:v8];
  }
}

+ (id)reuseIdentifier
{
  return @"HKQuantitySeriesTableViewCell";
}

- (void)_configureLabels
{
  v3 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  LODWORD(v5) = 1144750080;
  [v4 setContentCompressionResistancePriority:0 forAxis:v5];

  v6 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  LODWORD(v7) = 1144750080;
  [v6 setContentHuggingPriority:0 forAxis:v7];

  objc_super v8 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  [v9 setLineBreakMode:0];

  v10 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  [v10 setNumberOfLines:0];

  v11 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  LODWORD(v12) = 1132068864;
  [v11 setContentCompressionResistancePriority:0 forAxis:v12];

  id v14 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  LODWORD(v13) = 1132068864;
  [v14 setContentHuggingPriority:0 forAxis:v13];
}

- (void)_configureLayoutForTraitCollection:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28DC8];
  id v5 = a3;
  v6 = [(HKQuantitySeriesTableViewCell *)self currentConstraints];
  [v4 deactivateConstraints:v6];

  [(HKQuantitySeriesTableViewCell *)self setCurrentConstraints:0];
  double v7 = [v5 preferredContentSizeCategory];

  LODWORD(v5) = UIContentSizeCategoryIsAccessibilityCategory(v7);
  if (v5) {
    [(HKQuantitySeriesTableViewCell *)self _makeAccessibilityConstraints];
  }
  else {
  objc_super v8 = [(HKQuantitySeriesTableViewCell *)self _makeConstraints];
  }
  [(HKQuantitySeriesTableViewCell *)self setCurrentConstraints:v8];

  objc_super v9 = (void *)MEMORY[0x1E4F28DC8];
  id v10 = [(HKQuantitySeriesTableViewCell *)self currentConstraints];
  [v9 activateConstraints:v10];
}

- (id)_makeConstraints
{
  v54[4] = *MEMORY[0x1E4F143B8];
  v3 = [(HKQuantitySeriesTableViewCell *)self contentView];
  id v4 = [v3 layoutMarginsGuide];

  v45 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  v43 = [v45 topAnchor];
  v41 = [v4 topAnchor];
  v39 = [v43 constraintEqualToAnchor:v41];
  v54[0] = v39;
  v37 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  v35 = [v37 bottomAnchor];
  v33 = [v4 bottomAnchor];
  id v5 = [v35 constraintEqualToAnchor:v33];
  v54[1] = v5;
  v6 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  double v7 = [v6 topAnchor];
  objc_super v8 = [v4 topAnchor];
  objc_super v9 = [v7 constraintEqualToAnchor:v8];
  v54[2] = v9;
  id v10 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  v11 = [v10 bottomAnchor];
  v47 = v4;
  double v12 = [v4 bottomAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  v54[3] = v13;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:4];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v14 = v31;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v14);
        }
        LODWORD(v16) = 1148829696;
        [*(id *)(*((void *)&v48 + 1) + 8 * i) setPriority:v16];
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v17);
  }

  v46 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  v44 = [v46 leadingAnchor];
  v42 = [v47 leadingAnchor];
  v40 = [v44 constraintEqualToAnchor:v42];
  v52[0] = v40;
  v38 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  v36 = [v38 trailingAnchor];
  v34 = [v47 trailingAnchor];
  v32 = [v36 constraintEqualToAnchor:v34];
  v52[1] = v32;
  v20 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  v21 = [v20 leadingAnchor];
  v22 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  v23 = [v22 trailingAnchor];
  v24 = [v21 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v23 multiplier:1.0];
  v52[2] = v24;
  v25 = [(HKQuantitySeriesTableViewCell *)self contentView];
  v26 = [v25 heightAnchor];
  v27 = [v26 constraintGreaterThanOrEqualToConstant:44.0];
  v52[3] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];
  id v30 = [v14 arrayByAddingObjectsFromArray:v28];

  return v30;
}

- (id)_makeAccessibilityConstraints
{
  v36[7] = *MEMORY[0x1E4F143B8];
  v3 = [(HKQuantitySeriesTableViewCell *)self contentView];
  id v4 = [v3 layoutMarginsGuide];

  v35 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  v34 = [v35 topAnchor];
  v33 = [v4 topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v36[0] = v32;
  v31 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  id v30 = [v31 leadingAnchor];
  v29 = [v4 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v36[1] = v28;
  v27 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  v26 = [v27 trailingAnchor];
  v25 = [v4 trailingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v36[2] = v24;
  v23 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  v21 = [v23 topAnchor];
  v22 = [(HKQuantitySeriesTableViewCell *)self textLabel];
  v20 = [v22 bottomAnchor];
  v19 = [v21 constraintEqualToSystemSpacingBelowAnchor:v20 multiplier:1.0];
  v36[3] = v19;
  uint64_t v18 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  uint64_t v17 = [v18 bottomAnchor];
  double v16 = [v4 bottomAnchor];
  id v5 = [v17 constraintEqualToAnchor:v16];
  v36[4] = v5;
  v6 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  double v7 = [v6 leadingAnchor];
  objc_super v8 = [v4 leadingAnchor];
  objc_super v9 = [v7 constraintEqualToAnchor:v8];
  v36[5] = v9;
  id v10 = [(HKQuantitySeriesTableViewCell *)self detailTextLabel];
  v11 = [v10 trailingAnchor];
  double v12 = [v4 trailingAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  v36[6] = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:7];

  return v15;
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end