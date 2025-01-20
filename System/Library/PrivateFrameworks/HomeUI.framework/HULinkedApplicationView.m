@interface HULinkedApplicationView
- (BOOL)isInstalled;
- (HFItem)item;
- (HULinkedApplicationRatingView)ratingView;
- (HULinkedApplicationView)initWithFrame:(CGRect)a3;
- (NSArray)currentConstraints;
- (NSString)bundleID;
- (NSURL)storeURL;
- (UIButton)viewButton;
- (UIImageView)iconView;
- (UILabel)installedLabel;
- (UILabel)nameLabel;
- (UILabel)priceLabel;
- (UILabel)publisherLabel;
- (void)_viewButtonTapped:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCurrentConstraints:(id)a3;
- (void)setIconView:(id)a3;
- (void)setInstalledLabel:(id)a3;
- (void)setIsInstalled:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPriceLabel:(id)a3;
- (void)setPublisherLabel:(id)a3;
- (void)setRatingView:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setViewButton:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HULinkedApplicationView

- (HULinkedApplicationView)initWithFrame:(CGRect)a3
{
  v47.receiver = self;
  v47.super_class = (Class)HULinkedApplicationView;
  v3 = -[HULinkedApplicationView initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    [(HULinkedApplicationView *)v3 setIconView:v4];

    v5 = [(HULinkedApplicationView *)v3 iconView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(HULinkedApplicationView *)v3 iconView];
    LODWORD(v7) = 1148846080;
    [v6 setContentHuggingPriority:1 forAxis:v7];

    v8 = [(HULinkedApplicationView *)v3 iconView];
    LODWORD(v9) = 1148846080;
    [v8 setContentHuggingPriority:0 forAxis:v9];

    v10 = [(HULinkedApplicationView *)v3 iconView];
    [(HULinkedApplicationView *)v3 addSubview:v10];

    v11 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    [(HULinkedApplicationView *)v3 setViewButton:v11];

    v12 = [MEMORY[0x1E4F42A30] systemFontOfSize:18.0];
    v13 = [(HULinkedApplicationView *)v3 viewButton];
    v14 = [v13 titleLabel];
    [v14 setFont:v12];

    v15 = [(HULinkedApplicationView *)v3 viewButton];
    v16 = _HULocalizedStringWithDefaultValue(@"HULinkedApplicationViewButtonTitle", @"HULinkedApplicationViewButtonTitle", 1);
    [v15 setTitle:v16 forState:0];

    v17 = [(HULinkedApplicationView *)v3 viewButton];
    [v17 addTarget:v3 action:sel__viewButtonTapped_ forControlEvents:64];

    v18 = [(HULinkedApplicationView *)v3 viewButton];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(HULinkedApplicationView *)v3 viewButton];
    [(HULinkedApplicationView *)v3 addSubview:v19];

    v20 = objc_opt_new();
    [(HULinkedApplicationView *)v3 setNameLabel:v20];

    v21 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:12.0];
    v22 = [(HULinkedApplicationView *)v3 nameLabel];
    [v22 setFont:v21];

    v23 = [(HULinkedApplicationView *)v3 nameLabel];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

    v24 = [(HULinkedApplicationView *)v3 nameLabel];
    [(HULinkedApplicationView *)v3 addSubview:v24];

    v25 = objc_opt_new();
    [(HULinkedApplicationView *)v3 setPublisherLabel:v25];

    v26 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
    v27 = [(HULinkedApplicationView *)v3 publisherLabel];
    [v27 setFont:v26];

    v28 = [(HULinkedApplicationView *)v3 publisherLabel];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

    v29 = [(HULinkedApplicationView *)v3 publisherLabel];
    [(HULinkedApplicationView *)v3 addSubview:v29];

    v30 = [HULinkedApplicationRatingView alloc];
    v31 = -[HULinkedApplicationRatingView initWithFrame:](v30, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HULinkedApplicationView *)v3 setRatingView:v31];

    v32 = [(HULinkedApplicationView *)v3 ratingView];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

    v33 = [(HULinkedApplicationView *)v3 ratingView];
    [(HULinkedApplicationView *)v3 addSubview:v33];

    v34 = objc_opt_new();
    [(HULinkedApplicationView *)v3 setPriceLabel:v34];

    v35 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
    v36 = [(HULinkedApplicationView *)v3 priceLabel];
    [v36 setFont:v35];

    v37 = [(HULinkedApplicationView *)v3 priceLabel];
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

    v38 = [(HULinkedApplicationView *)v3 priceLabel];
    [(HULinkedApplicationView *)v3 addSubview:v38];

    v39 = objc_opt_new();
    [(HULinkedApplicationView *)v3 setInstalledLabel:v39];

    v40 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
    v41 = [(HULinkedApplicationView *)v3 installedLabel];
    [v41 setFont:v40];

    v42 = _HULocalizedStringWithDefaultValue(@"HULinkedApplicationInstalled", @"HULinkedApplicationInstalled", 1);
    v43 = [(HULinkedApplicationView *)v3 installedLabel];
    [v43 setText:v42];

    v44 = [(HULinkedApplicationView *)v3 installedLabel];
    [v44 setTranslatesAutoresizingMaskIntoConstraints:0];

    v45 = [(HULinkedApplicationView *)v3 installedLabel];
    [(HULinkedApplicationView *)v3 addSubview:v45];

    [(HULinkedApplicationView *)v3 setNeedsUpdateConstraints];
  }
  return v3;
}

- (void)updateConstraints
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = [(HULinkedApplicationView *)self iconView];
  v5 = [v4 widthAnchor];
  v6 = [v5 constraintEqualToConstant:60.0];
  [v3 addObject:v6];

  double v7 = [(HULinkedApplicationView *)self iconView];
  v8 = [v7 heightAnchor];
  double v9 = [v8 constraintEqualToConstant:60.0];
  [v3 addObject:v9];

  v10 = [(HULinkedApplicationView *)self iconView];
  v11 = [v10 leadingAnchor];
  v12 = [(HULinkedApplicationView *)self leadingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:15.0];
  [v3 addObject:v13];

  v14 = [(HULinkedApplicationView *)self iconView];
  v15 = [v14 centerYAnchor];
  v16 = [(HULinkedApplicationView *)self centerYAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v90 = v3;
  [v3 addObject:v17];

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v18 = [(HULinkedApplicationView *)self nameLabel];
  v96[0] = v18;
  v19 = [(HULinkedApplicationView *)self publisherLabel];
  v96[1] = v19;
  v20 = [(HULinkedApplicationView *)self priceLabel];
  v96[2] = v20;
  v21 = [(HULinkedApplicationView *)self installedLabel];
  v96[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:4];

  id obj = v22;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v92 objects:v97 count:16];
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v93 != v26) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        LODWORD(v24) = 1132003328;
        [v28 setContentHuggingPriority:0 forAxis:v24];
        v29 = [v28 leadingAnchor];
        v30 = [(HULinkedApplicationView *)self iconView];
        v31 = [v30 trailingAnchor];
        [v29 constraintEqualToAnchor:v31 constant:15.0];
        v33 = v32 = self;
        [v90 addObject:v33];

        self = v32;
        v34 = [v28 trailingAnchor];
        v35 = [(HULinkedApplicationView *)v32 viewButton];
        v36 = [v35 leadingAnchor];
        v37 = [v34 constraintEqualToAnchor:v36 constant:-15.0];
        [v90 addObject:v37];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v92 objects:v97 count:16];
    }
    while (v25);
  }

  v38 = [(HULinkedApplicationView *)self viewButton];
  v39 = [v38 trailingAnchor];
  v40 = [(HULinkedApplicationView *)self trailingAnchor];
  v41 = [v39 constraintEqualToAnchor:v40 constant:-15.0];
  [v90 addObject:v41];

  v42 = [(HULinkedApplicationView *)self viewButton];
  v43 = [v42 centerYAnchor];
  v44 = [(HULinkedApplicationView *)self centerYAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v90 addObject:v45];

  v46 = [(HULinkedApplicationView *)self ratingView];
  objc_super v47 = [v46 leadingAnchor];
  v48 = [(HULinkedApplicationView *)self iconView];
  v49 = [v48 trailingAnchor];
  v50 = [v47 constraintEqualToAnchor:v49 constant:15.0];
  [v90 addObject:v50];

  v51 = [(HULinkedApplicationView *)self bottomAnchor];
  v52 = [(HULinkedApplicationView *)self nameLabel];
  v53 = [v52 firstBaselineAnchor];
  v54 = [(HULinkedApplicationView *)self topAnchor];
  v55 = [v53 constraintEqualToAnchor:v54 constant:35.0];
  [v90 addObject:v55];

  v56 = [(HULinkedApplicationView *)self publisherLabel];
  v57 = [v56 firstBaselineAnchor];
  v58 = [(HULinkedApplicationView *)self nameLabel];
  v59 = [v58 firstBaselineAnchor];
  v60 = [v57 constraintEqualToAnchor:v59 constant:15.0];
  [v90 addObject:v60];

  LODWORD(v57) = [(HULinkedApplicationView *)self isInstalled];
  v61 = [(HULinkedApplicationView *)self priceLabel];
  v62 = v61;
  if (v57)
  {
    [v61 setHidden:1];

    v63 = [(HULinkedApplicationView *)self ratingView];
    [v63 setHidden:1];

    v64 = [(HULinkedApplicationView *)self installedLabel];
    [v64 setHidden:0];

    v65 = [(HULinkedApplicationView *)self installedLabel];
    v66 = [v65 firstBaselineAnchor];
    v67 = [(HULinkedApplicationView *)self publisherLabel];
    v68 = [v67 firstBaselineAnchor];
    v69 = [v66 constraintEqualToAnchor:v68 constant:15.0];
    [v90 addObject:v69];

    [(HULinkedApplicationView *)self installedLabel];
  }
  else
  {
    [v61 setHidden:0];

    v70 = [(HULinkedApplicationView *)self ratingView];
    [v70 setHidden:0];

    v71 = [(HULinkedApplicationView *)self installedLabel];
    [v71 setHidden:1];

    v72 = [(HULinkedApplicationView *)self ratingView];
    v73 = [v72 topAnchor];
    v74 = [(HULinkedApplicationView *)self publisherLabel];
    v75 = [v74 bottomAnchor];
    v76 = [v73 constraintEqualToAnchor:v75];
    [v90 addObject:v76];

    v77 = [(HULinkedApplicationView *)self priceLabel];
    v78 = [v77 topAnchor];
    v79 = [(HULinkedApplicationView *)self ratingView];
    v80 = [v79 bottomAnchor];
    v81 = [v78 constraintEqualToAnchor:v80];
    [v90 addObject:v81];

    [(HULinkedApplicationView *)self priceLabel];
  v82 = };
  v83 = [v82 firstBaselineAnchor];
  v84 = [v83 constraintEqualToAnchor:v51 constant:-25.0];
  [v90 addObject:v84];

  v85 = (void *)MEMORY[0x1E4F28DC8];
  v86 = [(HULinkedApplicationView *)self currentConstraints];
  [v85 deactivateConstraints:v86];

  [(HULinkedApplicationView *)self setCurrentConstraints:v90];
  v87 = (void *)MEMORY[0x1E4F28DC8];
  v88 = [(HULinkedApplicationView *)self currentConstraints];
  [v87 activateConstraints:v88];

  v91.receiver = self;
  v91.super_class = (Class)HULinkedApplicationView;
  [(HULinkedApplicationView *)&v91 updateConstraints];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v4 = [(HULinkedApplicationView *)self item];
  id v26 = [v4 latestResults];

  v5 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F689F8]];
  v6 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  double v7 = [v26 objectForKeyedSubscript:@"HFResultApplicationPublisher"];
  v8 = [v26 objectForKeyedSubscript:@"HFResultApplicationAverageRating"];
  [v8 floatValue];
  float v10 = v9;

  v11 = [v26 objectForKeyedSubscript:@"HFResultApplicationPrice"];
  v12 = [v26 objectForKeyedSubscript:@"HFResultApplicationIsInstalled"];
  uint64_t v13 = [v12 BOOLValue];

  v14 = [(HULinkedApplicationView *)self iconView];
  [v14 setImage:v5];

  v15 = [(HULinkedApplicationView *)self nameLabel];
  [v15 setText:v6];

  v16 = [(HULinkedApplicationView *)self publisherLabel];
  [v16 setText:v7];

  v17 = [(HULinkedApplicationView *)self ratingView];
  [v17 setRating:v10];

  v18 = [(HULinkedApplicationView *)self priceLabel];
  [v18 setText:v11];

  v19 = @"HULinkedApplicationViewButtonTitle";
  if (v13) {
    v19 = @"HULinkedApplicationOpenButtonTitle";
  }
  v20 = v19;
  v21 = [(HULinkedApplicationView *)self viewButton];
  v22 = _HULocalizedStringWithDefaultValue(v20, v20, 1);

  [v21 setTitle:v22 forState:0];
  uint64_t v23 = [(HULinkedApplicationView *)self viewButton];
  [v23 sizeToFit];

  [(HULinkedApplicationView *)self setIsInstalled:v13];
  double v24 = [v26 objectForKeyedSubscript:@"HFResultApplicationBundleIdentifier"];
  [(HULinkedApplicationView *)self setBundleID:v24];

  uint64_t v25 = [v26 objectForKeyedSubscript:@"HFResultApplicationStoreURL"];
  [(HULinkedApplicationView *)self setStoreURL:v25];

  [(HULinkedApplicationView *)self setNeedsUpdateConstraints];
}

- (void)_viewButtonTapped:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F68EE8]);
  v5 = [(HULinkedApplicationView *)self nameLabel];
  v6 = [v5 text];
  double v7 = [(HULinkedApplicationView *)self bundleID];
  v8 = [(HULinkedApplicationView *)self storeURL];
  id v10 = (id)[v4 initWithName:v6 bundleID:v7 payloadURL:0 storeURL:v8];

  id v9 = (id)[MEMORY[0x1E4F68EE8] handleRequest:v10];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)publisherLabel
{
  return self->_publisherLabel;
}

- (void)setPublisherLabel:(id)a3
{
}

- (HULinkedApplicationRatingView)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
}

- (UILabel)priceLabel
{
  return self->_priceLabel;
}

- (void)setPriceLabel:(id)a3
{
}

- (UILabel)installedLabel
{
  return self->_installedLabel;
}

- (void)setInstalledLabel:(id)a3
{
}

- (UIButton)viewButton
{
  return self->_viewButton;
}

- (void)setViewButton:(id)a3
{
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (void)setIsInstalled:(BOOL)a3
{
  self->_isInstalled = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
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
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_viewButton, 0);
  objc_storeStrong((id *)&self->_installedLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_publisherLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end