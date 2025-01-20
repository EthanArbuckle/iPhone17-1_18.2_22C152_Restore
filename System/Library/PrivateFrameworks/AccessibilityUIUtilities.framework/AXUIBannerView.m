@interface AXUIBannerView
- (AXUIBannerView)initWithFrame:(CGRect)a3;
- (NSArray)withSecondaryTextConstraints;
- (NSString)secondaryText;
- (NSString)text;
- (UILabel)secondaryTextLabel;
- (UILabel)textLabel;
- (double)defaultPlatterToTextVerticalSpacing;
- (double)defaultTitleToSubtitleVerticalSpacing;
- (double)platterToTextHorizontalSpacing;
- (double)platterWidth;
- (void)_updateSecondaryTextVisibility;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextLabel:(id)a3;
- (void)setText:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setWithSecondaryTextConstraints:(id)a3;
@end

@implementation AXUIBannerView

- (AXUIBannerView)initWithFrame:(CGRect)a3
{
  v114[3] = *MEMORY[0x1E4F143B8];
  v110.receiver = self;
  v110.super_class = (Class)AXUIBannerView;
  v3 = -[AXUIPlatterContainerView initWithFrame:](&v110, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E4FB1798];
    v6 = [(AXUIPlatterContainerView *)v3 primaryTextStyle];
    v105 = [v5 preferredFontForTextStyle:v6];

    id v7 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v8 = (void *)MEMORY[0x1E4FB1EA0];
    v9 = [(AXUIPlatterContainerView *)v4 platterBlurEffect];
    v10 = [v8 effectForBlurEffect:v9 style:0];
    v11 = (void *)[v7 initWithEffect:v10];

    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v12 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v13 = (void *)MEMORY[0x1E4FB1EA0];
    v14 = [(AXUIPlatterContainerView *)v4 platterBlurEffect];
    v15 = [v13 effectForBlurEffect:v14 style:1];
    v16 = (void *)[v12 initWithEffect:v15];

    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(AXUIPlatterContainerView *)v4 contentView];
    [v17 addSubview:v11];

    v18 = [(AXUIPlatterContainerView *)v4 contentView];
    [v18 addSubview:v16];

    v19 = [v11 contentView];
    v20 = [v16 contentView];
    v21 = objc_opt_new();
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v21 setFont:v105];
    [v21 setNumberOfLines:0];
    [v21 setTextAlignment:1];
    [v19 addSubview:v21];
    objc_storeStrong((id *)&v4->_textLabel, v21);
    v22 = objc_opt_new();
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [v22 setFont:v23];

    [v22 setNumberOfLines:0];
    [v22 setTextAlignment:1];
    v104 = v20;
    [v20 addSubview:v22];
    [v22 setHidden:1];
    objc_storeStrong((id *)&v4->_secondaryTextLabel, v22);
    v24 = [MEMORY[0x1E4F1CA48] array];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [(AXUIPlatterContainerView *)v4 contentView];
    v102 = v11;
    v27 = objc_msgSend(v25, "ax_constraintsToMakeView:sameDimensionsAsView:", v11, v26);
    [v24 addObjectsFromArray:v27];

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(AXUIPlatterContainerView *)v4 contentView];
    v101 = v16;
    v30 = objc_msgSend(v28, "ax_constraintsToMakeView:sameDimensionsAsView:", v16, v29);
    v31 = v24;
    [v24 addObjectsFromArray:v30];

    v32 = (void *)MEMORY[0x1E4FB17A8];
    v33 = [(AXUIPlatterContainerView *)v4 primaryTextStyle];
    v34 = [v32 metricsForTextStyle:v33];
    [(AXUIBannerView *)v4 defaultTitleToSubtitleVerticalSpacing];
    objc_msgSend(v34, "scaledValueForValue:");
    double v36 = v35;
    v37 = [v22 font];
    [v37 capHeight];
    double v39 = v36 + v38;

    v40 = (void *)MEMORY[0x1E4FB17A8];
    v41 = [(AXUIPlatterContainerView *)v4 primaryTextStyle];
    v42 = [v40 metricsForTextStyle:v41];
    [(AXUIBannerView *)v4 defaultPlatterToTextVerticalSpacing];
    objc_msgSend(v42, "scaledValueForValue:");
    double v44 = v43;

    [v105 capHeight];
    double v46 = v44 + v45;
    [(AXUIBannerView *)v4 platterToTextHorizontalSpacing];
    double v48 = v47;
    v49 = [v21 leadingAnchor];
    v50 = [v19 leadingAnchor];
    uint64_t v51 = [v49 constraintEqualToAnchor:v50 constant:v48];

    v52 = [v19 trailingAnchor];
    v53 = [v21 trailingAnchor];
    uint64_t v54 = [v52 constraintEqualToAnchor:v53 constant:v48];

    v100 = v19;
    v55 = [v19 bottomAnchor];
    v56 = v21;
    v57 = [v21 lastBaselineAnchor];
    uint64_t v58 = [v55 constraintEqualToAnchor:v57 constant:v44];

    v98 = (void *)v54;
    v99 = (void *)v51;
    v114[0] = v51;
    v114[1] = v54;
    v97 = (void *)v58;
    v114[2] = v58;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:3];
    v60 = [v22 text];
    uint64_t v61 = [v60 length];

    if (v61)
    {
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v62 = v59;
      uint64_t v63 = [v62 countByEnumeratingWithState:&v106 objects:v113 count:16];
      if (v63)
      {
        uint64_t v65 = v63;
        uint64_t v66 = *(void *)v107;
        do
        {
          uint64_t v67 = 0;
          do
          {
            if (*(void *)v107 != v66) {
              objc_enumerationMutation(v62);
            }
            LODWORD(v64) = 1144733696;
            [*(id *)(*((void *)&v106 + 1) + 8 * v67++) setPriority:v64];
          }
          while (v65 != v67);
          uint64_t v65 = [v62 countByEnumeratingWithState:&v106 objects:v113 count:16];
        }
        while (v65);
      }
    }
    v96 = v31;
    [v31 addObjectsFromArray:v59];
    v68 = [v22 firstBaselineAnchor];
    v103 = v56;
    v69 = [v56 lastBaselineAnchor];
    v95 = [v68 constraintEqualToAnchor:v69 constant:v39];

    v70 = [v22 leadingAnchor];
    v71 = [v104 leadingAnchor];
    v94 = [v70 constraintGreaterThanOrEqualToAnchor:v71 constant:v48];

    v72 = [v104 trailingAnchor];
    v73 = [v22 trailingAnchor];
    v93 = [v72 constraintGreaterThanOrEqualToAnchor:v73 constant:v48];

    v74 = [v104 bottomAnchor];
    v75 = [v22 lastBaselineAnchor];
    v91 = [v74 constraintEqualToAnchor:v75 constant:v44];

    v76 = [v22 centerXAnchor];
    v77 = [v104 centerXAnchor];
    v90 = [v76 constraintEqualToAnchor:v77];

    v112[0] = v95;
    v112[1] = v94;
    v112[2] = v93;
    v112[3] = v91;
    v112[4] = v90;
    uint64_t v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:5];
    withSecondaryTextConstraints = v4->_withSecondaryTextConstraints;
    v4->_withSecondaryTextConstraints = (NSArray *)v78;

    v80 = [v56 firstBaselineAnchor];
    [v100 topAnchor];
    v81 = v89 = v59;
    [v80 constraintEqualToAnchor:v81 constant:v46];
    v92 = v22;
    v83 = v82 = v4;
    v111[0] = v83;
    v84 = [v56 centerXAnchor];
    v85 = [v100 centerXAnchor];
    v86 = [v84 constraintEqualToAnchor:v85];
    v111[1] = v86;
    v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:2];
    [v96 addObjectsFromArray:v87];

    v4 = v82;
    [MEMORY[0x1E4F28DC8] activateConstraints:v96];
  }
  return v4;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(AXUIBannerView *)self textLabel];
  [v5 setText:v4];
}

- (NSString)text
{
  v2 = [(AXUIBannerView *)self textLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSecondaryText:(id)a3
{
  id v4 = a3;
  id v5 = [(AXUIBannerView *)self secondaryTextLabel];
  [v5 setText:v4];

  [(AXUIBannerView *)self _updateSecondaryTextVisibility];
}

- (void)_updateSecondaryTextVisibility
{
  v3 = [(AXUIBannerView *)self secondaryTextLabel];
  id v4 = [v3 text];
  uint64_t v5 = [v4 length];

  v6 = [(AXUIBannerView *)self secondaryTextLabel];
  int v7 = [v6 isHidden];

  if (v5)
  {
    if (!v7) {
      return;
    }
    v8 = [(AXUIBannerView *)self secondaryTextLabel];
    [v8 setHidden:0];

    v9 = (void *)MEMORY[0x1E4F28DC8];
    id v12 = [(AXUIBannerView *)self withSecondaryTextConstraints];
    objc_msgSend(v9, "activateConstraints:");
  }
  else
  {
    if (v7) {
      return;
    }
    v10 = [(AXUIBannerView *)self secondaryTextLabel];
    [v10 setHidden:1];

    v11 = (void *)MEMORY[0x1E4F28DC8];
    id v12 = [(AXUIBannerView *)self withSecondaryTextConstraints];
    objc_msgSend(v11, "deactivateConstraints:");
  }
}

- (double)platterWidth
{
  return 0.0;
}

- (double)defaultPlatterToTextVerticalSpacing
{
  return 27.0;
}

- (double)platterToTextHorizontalSpacing
{
  return 40.0;
}

- (double)defaultTitleToSubtitleVerticalSpacing
{
  return 18.0;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UILabel)secondaryTextLabel
{
  return self->_secondaryTextLabel;
}

- (void)setSecondaryTextLabel:(id)a3
{
}

- (NSArray)withSecondaryTextConstraints
{
  return self->_withSecondaryTextConstraints;
}

- (void)setWithSecondaryTextConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_withSecondaryTextConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
}

@end