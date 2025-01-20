@interface WFContentAttributionTableViewCell
- (NSLayoutConstraint)firstLineBaseLineConstaint;
- (NSLayoutConstraint)secondLineBaseLineConstaint;
- (UILabel)accountIdentifierLabel;
- (UILabel)bundleNameLabel;
- (UILabel)contentItemsCountLabel;
- (UILabel)disclosureLevelLabel;
- (UILabel)managedLevelLabel;
- (UIStackView)contentStackView;
- (WFContentAttributionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setAccountIdentifierLabel:(id)a3;
- (void)setBundleNameLabel:(id)a3;
- (void)setContentItemsCountLabel:(id)a3;
- (void)setContentStackView:(id)a3;
- (void)setDisclosureLevelLabel:(id)a3;
- (void)setFirstLineBaseLineConstaint:(id)a3;
- (void)setManagedLevelLabel:(id)a3;
- (void)setSecondLineBaseLineConstaint:(id)a3;
- (void)updateCellWithContentAttribution:(id)a3;
@end

@implementation WFContentAttributionTableViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondLineBaseLineConstaint, 0);
  objc_storeStrong((id *)&self->_firstLineBaseLineConstaint, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_contentItemsCountLabel, 0);
  objc_storeStrong((id *)&self->_disclosureLevelLabel, 0);
  objc_storeStrong((id *)&self->_managedLevelLabel, 0);
  objc_storeStrong((id *)&self->_accountIdentifierLabel, 0);
  objc_storeStrong((id *)&self->_bundleNameLabel, 0);
}

- (void)setSecondLineBaseLineConstaint:(id)a3
{
}

- (NSLayoutConstraint)secondLineBaseLineConstaint
{
  return self->_secondLineBaseLineConstaint;
}

- (void)setFirstLineBaseLineConstaint:(id)a3
{
}

- (NSLayoutConstraint)firstLineBaseLineConstaint
{
  return self->_firstLineBaseLineConstaint;
}

- (void)setContentStackView:(id)a3
{
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentItemsCountLabel:(id)a3
{
}

- (UILabel)contentItemsCountLabel
{
  return self->_contentItemsCountLabel;
}

- (void)setDisclosureLevelLabel:(id)a3
{
}

- (UILabel)disclosureLevelLabel
{
  return self->_disclosureLevelLabel;
}

- (void)setManagedLevelLabel:(id)a3
{
}

- (UILabel)managedLevelLabel
{
  return self->_managedLevelLabel;
}

- (void)setAccountIdentifierLabel:(id)a3
{
}

- (UILabel)accountIdentifierLabel
{
  return self->_accountIdentifierLabel;
}

- (void)setBundleNameLabel:(id)a3
{
}

- (UILabel)bundleNameLabel
{
  return self->_bundleNameLabel;
}

- (void)updateCellWithContentAttribution:(id)a3
{
  id v5 = a3;
  v6 = [v5 origin];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v6 appDescriptor],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 bundleIdentifier],
        id v49 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v49))
  {
    v3 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v49 allowPlaceholder:0 error:0];
    v8 = [v3 localizedShortName];
    char v9 = 0;
  }
  else
  {
    id v49 = 0;
    v8 = 0;
    char v9 = 1;
  }
  v10 = [(WFContentAttributionTableViewCell *)self bundleNameLabel];
  [v10 setText:v8];

  if ((v9 & 1) == 0)
  {
  }
  v11 = [(WFContentAttributionTableViewCell *)self bundleNameLabel];
  v12 = [v11 text];
  BOOL v13 = [v12 length] == 0;
  v14 = [(WFContentAttributionTableViewCell *)self bundleNameLabel];
  [v14 setHidden:v13];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [v6 accountIdentifier];
  }
  else
  {
    v15 = 0;
  }
  v16 = [(WFContentAttributionTableViewCell *)self accountIdentifierLabel];
  [v16 setText:v15];

  v17 = [(WFContentAttributionTableViewCell *)self accountIdentifierLabel];
  v18 = [v17 text];
  BOOL v19 = [v18 length] == 0;
  v20 = [(WFContentAttributionTableViewCell *)self accountIdentifierLabel];
  [v20 setHidden:v19];

  unint64_t v21 = [v6 managedLevel] - 1;
  if (v21 > 2) {
    v22 = @"None";
  }
  else {
    v22 = off_264900290[v21];
  }
  v23 = [(WFContentAttributionTableViewCell *)self managedLevelLabel];
  [v23 setText:v22];

  v24 = [(WFContentAttributionTableViewCell *)self managedLevelLabel];
  v25 = [v24 text];
  BOOL v26 = [v25 length] == 0;
  v27 = [(WFContentAttributionTableViewCell *)self managedLevelLabel];
  [v27 setHidden:v26];

  v28 = NSString;
  v29 = [v5 privateItemIdentifiers];
  v30 = objc_msgSend(v28, "stringWithFormat:", @"%d privateItemIdentifiers", objc_msgSend(v29, "count"));
  v31 = [(WFContentAttributionTableViewCell *)self contentItemsCountLabel];
  [v31 setText:v30];

  uint64_t v32 = [v5 disclosureLevel];
  if (v32 == 1) {
    v33 = @"Private";
  }
  else {
    v33 = @"Public";
  }
  v34 = [(WFContentAttributionTableViewCell *)self disclosureLevelLabel];
  [v34 setText:v33];

  v35 = [(WFContentAttributionTableViewCell *)self disclosureLevelLabel];
  v36 = [v35 text];
  BOOL v37 = [v36 length] == 0;
  v38 = [(WFContentAttributionTableViewCell *)self disclosureLevelLabel];
  [v38 setHidden:v37];

  v39 = [(WFContentAttributionTableViewCell *)self accountIdentifierLabel];
  LODWORD(v36) = [v39 isHidden];

  v40 = [(WFContentAttributionTableViewCell *)self contentStackView];
  v41 = v40;
  if (v36) {
    uint64_t v42 = 3;
  }
  else {
    uint64_t v42 = 0;
  }
  [v40 setAlignment:v42];

  v43 = [(WFContentAttributionTableViewCell *)self accountIdentifierLabel];
  uint64_t v44 = [v43 isHidden] ^ 1;
  v45 = [(WFContentAttributionTableViewCell *)self firstLineBaseLineConstaint];
  [v45 setActive:v44];

  v46 = [(WFContentAttributionTableViewCell *)self accountIdentifierLabel];
  uint64_t v47 = [v46 isHidden] ^ 1;
  v48 = [(WFContentAttributionTableViewCell *)self secondLineBaseLineConstaint];
  [v48 setActive:v47];
}

- (WFContentAttributionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v85[3] = *MEMORY[0x263EF8340];
  v81.receiver = self;
  v81.super_class = (Class)WFContentAttributionTableViewCell;
  v4 = [(WFContentAttributionTableViewCell *)&v81 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    bundleNameLabel = v4->_bundleNameLabel;
    v4->_bundleNameLabel = v5;

    [(UILabel *)v4->_bundleNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = *MEMORY[0x263F83570];
    v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v4->_bundleNameLabel setFont:v8];

    char v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    accountIdentifierLabel = v4->_accountIdentifierLabel;
    v4->_accountIdentifierLabel = v9;

    [(UILabel *)v4->_accountIdentifierLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:v7];
    [(UILabel *)v4->_accountIdentifierLabel setFont:v11];

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    managedLevelLabel = v4->_managedLevelLabel;
    v4->_managedLevelLabel = v12;

    [(UILabel *)v4->_managedLevelLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v14 = *MEMORY[0x263F83588];
    v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
    [(UILabel *)v4->_managedLevelLabel setFont:v15];

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    disclosureLevelLabel = v4->_disclosureLevelLabel;
    v4->_disclosureLevelLabel = v16;

    [(UILabel *)v4->_disclosureLevelLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [MEMORY[0x263F81708] preferredFontForTextStyle:v14];
    [(UILabel *)v4->_disclosureLevelLabel setFont:v18];

    BOOL v19 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    contentItemsCountLabel = v4->_contentItemsCountLabel;
    v4->_contentItemsCountLabel = v19;

    [(UILabel *)v4->_contentItemsCountLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    unint64_t v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:v14];
    [(UILabel *)v4->_contentItemsCountLabel setFont:v21];

    id v22 = objc_alloc(MEMORY[0x263F82BF8]);
    v85[0] = v4->_bundleNameLabel;
    v85[1] = v4->_accountIdentifierLabel;
    v85[2] = v4->_contentItemsCountLabel;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:3];
    v24 = (void *)[v22 initWithArrangedSubviews:v23];

    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 setAxis:1];
    [v24 setSpacing:8.0];
    [v24 setAlignment:1];
    v25 = v24;
    v80 = v24;
    [v24 setDistribution:1];
    id v26 = objc_alloc(MEMORY[0x263F82BF8]);
    v84[0] = v4->_disclosureLevelLabel;
    v84[1] = v4->_managedLevelLabel;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
    v28 = (void *)[v26 initWithArrangedSubviews:v27];

    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v28 setAxis:1];
    [v28 setSpacing:8.0];
    [v28 setAlignment:4];
    v29 = v28;
    v79 = v28;
    [v28 setDistribution:1];
    id v30 = objc_alloc(MEMORY[0x263F82BF8]);
    v83[0] = v25;
    v83[1] = v29;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:2];
    uint64_t v32 = (void *)[v30 initWithArrangedSubviews:v31];
    [(WFContentAttributionTableViewCell *)v4 setContentStackView:v32];

    v33 = [(WFContentAttributionTableViewCell *)v4 contentStackView];
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

    v34 = [(WFContentAttributionTableViewCell *)v4 contentStackView];
    [v34 setAxis:0];

    v35 = [(WFContentAttributionTableViewCell *)v4 contentStackView];
    [v35 setSpacing:8.0];

    v36 = [(WFContentAttributionTableViewCell *)v4 contentStackView];
    [v36 setAlignment:2];

    BOOL v37 = [(WFContentAttributionTableViewCell *)v4 contentView];
    v38 = [(WFContentAttributionTableViewCell *)v4 contentStackView];
    [v37 addSubview:v38];

    v66 = (void *)MEMORY[0x263F08938];
    v78 = [(WFContentAttributionTableViewCell *)v4 contentView];
    v77 = [v78 layoutMarginsGuide];
    v75 = [v77 topAnchor];
    v76 = [(WFContentAttributionTableViewCell *)v4 contentStackView];
    v74 = [v76 layoutMarginsGuide];
    v73 = [v74 topAnchor];
    v72 = [v75 constraintEqualToAnchor:v73];
    v82[0] = v72;
    v71 = [(WFContentAttributionTableViewCell *)v4 contentView];
    v70 = [v71 layoutMarginsGuide];
    v68 = [v70 bottomAnchor];
    v69 = [(WFContentAttributionTableViewCell *)v4 contentStackView];
    v67 = [v69 layoutMarginsGuide];
    v65 = [v67 bottomAnchor];
    v64 = [v68 constraintEqualToAnchor:v65];
    v82[1] = v64;
    v63 = [(WFContentAttributionTableViewCell *)v4 contentView];
    v62 = [v63 layoutMarginsGuide];
    v60 = [v62 leadingAnchor];
    v61 = [(WFContentAttributionTableViewCell *)v4 contentStackView];
    v59 = [v61 layoutMarginsGuide];
    v58 = [v59 leadingAnchor];
    v39 = [v60 constraintEqualToAnchor:v58];
    v82[2] = v39;
    v40 = [(WFContentAttributionTableViewCell *)v4 contentView];
    v41 = [v40 layoutMarginsGuide];
    uint64_t v42 = [v41 trailingAnchor];
    v43 = [(WFContentAttributionTableViewCell *)v4 contentStackView];
    uint64_t v44 = [v43 layoutMarginsGuide];
    v45 = [v44 trailingAnchor];
    v46 = [v42 constraintEqualToAnchor:v45];
    v82[3] = v46;
    uint64_t v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:4];
    [v66 activateConstraints:v47];

    v48 = [(UILabel *)v4->_bundleNameLabel firstBaselineAnchor];
    id v49 = [(UILabel *)v4->_disclosureLevelLabel firstBaselineAnchor];
    uint64_t v50 = [v48 constraintEqualToAnchor:v49];
    firstLineBaseLineConstaint = v4->_firstLineBaseLineConstaint;
    v4->_firstLineBaseLineConstaint = (NSLayoutConstraint *)v50;

    v52 = [(UILabel *)v4->_accountIdentifierLabel firstBaselineAnchor];
    v53 = [(UILabel *)v4->_managedLevelLabel firstBaselineAnchor];
    uint64_t v54 = [v52 constraintEqualToAnchor:v53];
    secondLineBaseLineConstaint = v4->_secondLineBaseLineConstaint;
    v4->_secondLineBaseLineConstaint = (NSLayoutConstraint *)v54;

    v56 = v4;
  }

  return v4;
}

@end