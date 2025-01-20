@interface APUISuggestionView
- (APUISuggestionsWidgetViewDelegate)delegate;
- (ATXProactiveSuggestion)suggestion;
- (BOOL)canEngageSuggestion;
- (NSArray)labels;
- (UIImageView)appImageView;
- (UILabel)reasonLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (int)_subtitleNumberOfLines;
- (int)_titleNumberOfLines;
- (unint64_t)platterSize;
- (void)_setAppImageViewWithBundleIdentifier:(id)a3;
- (void)_setAppImageViewWithImage:(id)a3;
- (void)_setINImage:(id)a3 withBundleID:(id)a4;
- (void)_updateMaximumNumberOfLines;
- (void)_updateReasonStylingProvider;
- (void)createViewsIfNeeded;
- (void)installReasonLabelIfNecessary;
- (void)layoutSuggestion:(id)a3;
- (void)setAppImageView:(id)a3;
- (void)setCanEngageSuggestion:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setINImage:(id)a3 withBundleID:(id)a4;
- (void)setLNImage:(id)a3 withBundleID:(id)a4;
- (void)setLabels:(id)a3;
- (void)setPlatterSize:(unint64_t)a3;
- (void)setReasonLabel:(id)a3;
- (void)setStackView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation APUISuggestionView

- (void)layoutSuggestion:(id)a3
{
  v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[APUISuggestionView layoutSuggestion:](v5);
  }

  [(APUISuggestionView *)self doesNotRecognizeSelector:a2];
}

- (void)createViewsIfNeeded
{
  v122[3] = *MEMORY[0x263EF8340];
  v3 = [(APUISuggestionView *)self stackView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C6D0]);
    [(APUISuggestionView *)self setAppImageView:v4];

    v5 = [(APUISuggestionView *)self appImageView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(APUISuggestionView *)self appImageView];
    [v6 setContentMode:1];

    double v7 = dbl_225AF7B30[[(APUISuggestionView *)self platterSize] == 2];
    uint64_t v8 = *MEMORY[0x263F1D280];
    uint64_t v9 = *MEMORY[0x263F1D168];
    if (self->_platterSize == 2) {
      uint64_t v10 = *MEMORY[0x263F1D168];
    }
    else {
      uint64_t v10 = *MEMORY[0x263F1D150];
    }
    v11 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D280] maximumContentSizeCategory:v10];
    id v12 = objc_alloc_init(MEMORY[0x263F1C768]);
    [(APUISuggestionView *)self setTitleLabel:v12];

    v13 = [MEMORY[0x263F1C550] labelColor];
    v14 = [(APUISuggestionView *)self titleLabel];
    [v14 setTextColor:v13];

    v15 = [MEMORY[0x263F1C668] metricsForTextStyle:v8];
    double v16 = *MEMORY[0x263F1D340];
    v17 = [MEMORY[0x263F1C658] systemFontOfSize:13.0 weight:*MEMORY[0x263F1D340]];
    v116 = v11;
    [v11 pointSize];
    v18 = objc_msgSend(v15, "scaledFontForFont:maximumPointSize:", v17);
    v19 = [(APUISuggestionView *)self titleLabel];
    [v19 setFont:v18];

    v20 = [(APUISuggestionView *)self titleLabel];
    [v20 setAdjustsFontSizeToFitWidth:0];

    v21 = [(APUISuggestionView *)self titleLabel];
    LODWORD(v22) = 1132068864;
    [v21 setContentCompressionResistancePriority:1 forAxis:v22];

    v23 = [(APUISuggestionView *)self subtitleLabel];
    [v23 setLineBreakMode:4];

    v24 = [(APUISuggestionView *)self titleLabel];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v25 = objc_alloc_init(MEMORY[0x263F1C768]);
    [(APUISuggestionView *)self setSubtitleLabel:v25];

    uint64_t v26 = *MEMORY[0x263F1D278];
    v27 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D278] maximumContentSizeCategory:v9];
    v28 = [(APUISuggestionView *)self subtitleLabel];
    [v28 setFont:v27];

    v29 = [MEMORY[0x263F1C550] labelColor];
    v30 = [(APUISuggestionView *)self subtitleLabel];
    [v30 setTextColor:v29];

    v31 = [(APUISuggestionView *)self subtitleLabel];
    LODWORD(v32) = 1132003328;
    [v31 setContentCompressionResistancePriority:1 forAxis:v32];

    v33 = [(APUISuggestionView *)self subtitleLabel];
    [v33 setLineBreakMode:4];

    v34 = [(APUISuggestionView *)self subtitleLabel];
    [v34 setTranslatesAutoresizingMaskIntoConstraints:0];

    v35 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:v26 maximumContentSizeCategory:v9];
    id v36 = objc_alloc_init(MEMORY[0x263F1C768]);
    [(APUISuggestionView *)self setReasonLabel:v36];

    v37 = [MEMORY[0x263F1C658] systemFontOfSize:11.0 weight:v16];
    v113 = v35;
    [v35 pointSize];
    v115 = v15;
    v38 = objc_msgSend(v15, "scaledFontForFont:maximumPointSize:", v37);
    v39 = [(APUISuggestionView *)self reasonLabel];
    [v39 setFont:v38];

    v40 = [(APUISuggestionView *)self reasonLabel];
    [v40 setLineBreakMode:4];

    v41 = [MEMORY[0x263F1C550] systemBlueColor];
    v42 = [(APUISuggestionView *)self reasonLabel];
    [v42 setTextColor:v41];

    v43 = [(APUISuggestionView *)self reasonLabel];
    [v43 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(APUISuggestionView *)self _updateReasonStylingProvider];
    [(APUISuggestionView *)self _updateMaximumNumberOfLines];
    v44 = [(APUISuggestionView *)self titleLabel];
    v122[0] = v44;
    v45 = [(APUISuggestionView *)self subtitleLabel];
    v122[1] = v45;
    v46 = [(APUISuggestionView *)self reasonLabel];
    v122[2] = v46;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v122 count:3];
    [(APUISuggestionView *)self setLabels:v47];

    id v48 = objc_alloc(MEMORY[0x263F1C9B8]);
    v49 = [(APUISuggestionView *)self titleLabel];
    v121[0] = v49;
    v50 = [(APUISuggestionView *)self subtitleLabel];
    v121[1] = v50;
    v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:2];
    v52 = (void *)[v48 initWithArrangedSubviews:v51];

    [v52 setAxis:1];
    [v52 setAlignment:1];
    [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v52 setSpacing:3.0];
    id v53 = objc_alloc(MEMORY[0x263F1C9B8]);
    v54 = [(APUISuggestionView *)self appImageView];
    v120[0] = v54;
    v120[1] = v52;
    v112 = v52;
    v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v120 count:2];
    v56 = (void *)[v53 initWithArrangedSubviews:v55];
    [(APUISuggestionView *)self setStackView:v56];

    unint64_t platterSize = self->_platterSize;
    v58 = [(APUISuggestionView *)self stackView];
    v59 = v58;
    if (platterSize == 2)
    {
      [v58 setAxis:0];

      v60 = [(APUISuggestionView *)self stackView];
      [v60 setAlignment:3];

      v61 = [(APUISuggestionView *)self stackView];
      v62 = v61;
      double v63 = 8.0;
    }
    else
    {
      [v58 setDistribution:0];

      v64 = [(APUISuggestionView *)self stackView];
      [v64 setAxis:1];

      v65 = [(APUISuggestionView *)self stackView];
      [v65 setAlignment:1];

      v61 = [(APUISuggestionView *)self stackView];
      v62 = v61;
      double v63 = 5.5;
    }
    [v61 setSpacing:v63];

    v66 = [(APUISuggestionView *)self stackView];
    [v66 setTranslatesAutoresizingMaskIntoConstraints:0];

    v67 = [(APUISuggestionView *)self stackView];
    [(APUISuggestionView *)self addSubview:v67];

    v96 = (void *)MEMORY[0x263F08938];
    v110 = [(APUISuggestionView *)self appImageView];
    v108 = [v110 heightAnchor];
    v106 = [(APUISuggestionView *)self heightAnchor];
    v104 = [v108 constraintEqualToAnchor:v106 multiplier:v7];
    v119[0] = v104;
    v102 = [(APUISuggestionView *)self appImageView];
    v98 = [v102 widthAnchor];
    v100 = [(APUISuggestionView *)self appImageView];
    v94 = [v100 heightAnchor];
    v93 = [v98 constraintEqualToAnchor:v94 multiplier:1.0];
    v119[1] = v93;
    v68 = [(APUISuggestionView *)self stackView];
    v69 = [v68 leadingAnchor];
    v70 = [(APUISuggestionView *)self leadingAnchor];
    v71 = [v69 constraintEqualToAnchor:v70 constant:16.0];
    v119[2] = v71;
    v72 = [(APUISuggestionView *)self trailingAnchor];
    v73 = [(APUISuggestionView *)self stackView];
    v74 = [v73 trailingAnchor];
    v75 = [v72 constraintGreaterThanOrEqualToAnchor:v74 constant:16.0];
    v119[3] = v75;
    v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:4];
    [v96 activateConstraints:v76];

    unint64_t v77 = self->_platterSize;
    v78 = (void *)MEMORY[0x263F08938];
    v79 = [(APUISuggestionView *)self stackView];
    v80 = v79;
    if (v77 == 2)
    {
      v81 = [v79 centerYAnchor];
      v82 = [(APUISuggestionView *)self centerYAnchor];
      v83 = [v81 constraintEqualToAnchor:v82];
      v118 = v83;
      v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v118 count:1];
      [v78 activateConstraints:v84];
    }
    else
    {
      v111 = [v79 topAnchor];
      uint64_t v105 = [(APUISuggestionView *)self topAnchor];
      uint64_t v101 = [v111 constraintEqualToAnchor:v105 constant:16.0];
      v117[0] = v101;
      v84 = [(APUISuggestionView *)self bottomAnchor];
      v114 = [(APUISuggestionView *)self stackView];
      v109 = [v114 bottomAnchor];
      v107 = [v84 constraintGreaterThanOrEqualToAnchor:v109 constant:16.0];
      v117[1] = v107;
      v103 = [(APUISuggestionView *)self titleLabel];
      v97 = [v103 trailingAnchor];
      v99 = [(APUISuggestionView *)self stackView];
      v95 = [v99 trailingAnchor];
      v85 = [v97 constraintEqualToAnchor:v95];
      v117[2] = v85;
      [(APUISuggestionView *)self subtitleLabel];
      v87 = v86 = v78;
      v88 = [v87 trailingAnchor];
      v89 = [(APUISuggestionView *)self stackView];
      v90 = [v89 trailingAnchor];
      v91 = [v88 constraintEqualToAnchor:v90];
      v117[3] = v91;
      v92 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:4];
      [v86 activateConstraints:v92];

      v83 = (void *)v101;
      v82 = (void *)v105;

      v81 = v111;
    }
  }
}

- (void)_updateReasonStylingProvider
{
  uint64_t v3 = [(APUISuggestionView *)self reasonLabel];
  if (v3)
  {
    uint64_t v8 = v3;
    [(MTVisualStylingProvider *)self->_reasonStylingProvider stopAutomaticallyUpdatingView:v3];
    id v4 = (void *)MEMORY[0x263F54000];
    v5 = [(APUISuggestionView *)self traitCollection];
    objc_msgSend(v4, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 0, 3, objc_msgSend(v5, "userInterfaceStyle"));
    v6 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    reasonStylingProvider = self->_reasonStylingProvider;
    self->_reasonStylingProvider = v6;

    [(MTVisualStylingProvider *)self->_reasonStylingProvider automaticallyUpdateView:v8 withStyle:21];
  }
  MEMORY[0x270F9A758]();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = __atxlog_handle_ui();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[APUISuggestionView traitCollectionDidChange:](v4);
  }

  [(APUISuggestionView *)self _updateMaximumNumberOfLines];
  [(APUISuggestionView *)self _updateReasonStylingProvider];
}

- (void)_updateMaximumNumberOfLines
{
  uint64_t v3 = [(APUISuggestionView *)self _titleNumberOfLines];
  id v4 = [(APUISuggestionView *)self titleLabel];
  [v4 setNumberOfLines:v3];

  uint64_t v5 = [(APUISuggestionView *)self _subtitleNumberOfLines];
  v6 = [(APUISuggestionView *)self subtitleLabel];
  [v6 setNumberOfLines:v5];

  id v7 = [(APUISuggestionView *)self reasonLabel];
  [v7 setNumberOfLines:1];
}

- (int)_titleNumberOfLines
{
  uint64_t v3 = [MEMORY[0x263F1CB00] currentTraitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  if (self->_platterSize == 2)
  {
    uint64_t v5 = (UIContentSizeCategory *)MEMORY[0x263F1D150];
LABEL_5:
    BOOL v9 = UIContentSizeCategoryCompareToCategory(v4, *v5) == NSOrderedDescending;
    int v10 = 1;
    goto LABEL_7;
  }
  v6 = [(APUISuggestionView *)self reasonLabel];
  id v7 = [v6 attributedText];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    uint64_t v5 = (UIContentSizeCategory *)MEMORY[0x263F1D170];
    goto LABEL_5;
  }
  BOOL v9 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x263F1D168]) == NSOrderedDescending;
  int v10 = 2;
LABEL_7:
  if (v9) {
    int v11 = v10;
  }
  else {
    int v11 = v10 + 1;
  }

  return v11;
}

- (int)_subtitleNumberOfLines
{
  uint64_t v3 = [MEMORY[0x263F1CB00] currentTraitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  if (self->_platterSize == 2)
  {
    if (UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x263F1D170]) == NSOrderedDescending) {
      int v5 = 1;
    }
    else {
      int v5 = 2;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (void)installReasonLabelIfNecessary
{
  v33[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(APUISuggestionView *)self reasonLabel];
  [v3 removeFromSuperview];

  id v4 = [(APUISuggestionView *)self reasonLabel];
  int v5 = [v4 attributedText];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [(APUISuggestionView *)self _updateMaximumNumberOfLines];
    id v7 = [(APUISuggestionView *)self reasonLabel];
    [(APUISuggestionView *)self addSubview:v7];

    v27 = (void *)MEMORY[0x263F08938];
    if (self->_platterSize == 2)
    {
      v31 = [(APUISuggestionView *)self stackView];
      uint64_t v8 = [v31 trailingAnchor];
      v29 = [(APUISuggestionView *)self reasonLabel];
      [v29 leadingAnchor];
      v28 = v30 = v8;
      uint64_t v26 = objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
      v33[0] = v26;
      BOOL v9 = [(APUISuggestionView *)self trailingAnchor];
      v24 = [(APUISuggestionView *)self reasonLabel];
      [v24 trailingAnchor];
      v23 = id v25 = v9;
      int v10 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", 16.0);
      v33[1] = v10;
      int v11 = [(APUISuggestionView *)self reasonLabel];
      id v12 = [v11 topAnchor];
      v13 = [(APUISuggestionView *)self topAnchor];
      v14 = [v12 constraintEqualToAnchor:v13 constant:16.0];
      v33[2] = v14;
      v15 = [(APUISuggestionView *)self reasonLabel];
      double v16 = [v15 bottomAnchor];
      v17 = [(APUISuggestionView *)self bottomAnchor];
      v18 = [v16 constraintLessThanOrEqualToAnchor:v17 constant:16.0];
      v33[3] = v18;
      v19 = v33;
    }
    else
    {
      v31 = [(APUISuggestionView *)self reasonLabel];
      v20 = [v31 topAnchor];
      v29 = [(APUISuggestionView *)self stackView];
      [v29 bottomAnchor];
      v28 = v30 = v20;
      uint64_t v26 = objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", 5.5);
      v32[0] = v26;
      v21 = [(APUISuggestionView *)self bottomAnchor];
      v24 = [(APUISuggestionView *)self reasonLabel];
      [v24 bottomAnchor];
      v23 = id v25 = v21;
      int v10 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", 16.0);
      v32[1] = v10;
      int v11 = [(APUISuggestionView *)self reasonLabel];
      id v12 = [v11 leadingAnchor];
      v13 = [(APUISuggestionView *)self leadingAnchor];
      v14 = [v12 constraintEqualToAnchor:v13 constant:16.0];
      v32[2] = v14;
      v15 = [(APUISuggestionView *)self reasonLabel];
      double v16 = [v15 trailingAnchor];
      v17 = [(APUISuggestionView *)self trailingAnchor];
      v18 = [v16 constraintLessThanOrEqualToAnchor:v17 constant:-16.0];
      v32[3] = v18;
      v19 = v32;
    }
    double v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
    [v27 activateConstraints:v22];
  }
}

- (void)_setINImage:(id)a3 withBundleID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [MEMORY[0x263F0FB98] sharedConnection];
    BOOL v9 = __atxlog_handle_ui();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v8;
      _os_log_impl(&dword_225AE0000, v9, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent: INRemoteImageProxy image using connection %@", buf, 0xCu);
    }

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__APUISuggestionView__setINImage_withBundleID___block_invoke;
    v15[3] = &unk_264764A88;
    id v16 = v8;
    id v17 = v6;
    v18 = self;
    id v19 = v7;
    id v10 = v7;
    id v11 = v8;
    [v11 loadImageDataAndSizeForImage:v17 reply:v15];
  }
  else
  {
    id v12 = __atxlog_handle_ui();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_225AE0000, v12, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent: using fetchUIImageWithCompletion %@", buf, 0xCu);
    }

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__APUISuggestionView__setINImage_withBundleID___block_invoke_19;
    v13[3] = &unk_264764AB0;
    v13[4] = self;
    id v14 = v7;
    id v11 = v7;
    [v6 fetchUIImageWithCompletion:v13];
  }
}

void __47__APUISuggestionView__setINImage_withBundleID___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_ui();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__APUISuggestionView__setINImage_withBundleID___block_invoke_cold_1((uint64_t)a1, v6, v7);
    }
  }
  uint64_t v8 = __atxlog_handle_ui();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_225AE0000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent:connection %@ reply loadedImage=%@", buf, 0x16u);
  }

  id v10 = [v5 _imageData];
  if (v10)
  {
    id v11 = [MEMORY[0x263F1C6B0] imageWithData:v10];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__APUISuggestionView__setINImage_withBundleID___block_invoke_16;
    block[3] = &unk_264764798;
    block[4] = a1[6];
    id v17 = v11;
    id v12 = v11;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __47__APUISuggestionView__setINImage_withBundleID___block_invoke_2;
    v14[3] = &unk_264764798;
    v13 = (void *)a1[7];
    v14[4] = a1[6];
    id v15 = v13;
    dispatch_async(MEMORY[0x263EF83A0], v14);
  }
}

uint64_t __47__APUISuggestionView__setINImage_withBundleID___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAppImageViewWithImage:*(void *)(a1 + 40)];
}

uint64_t __47__APUISuggestionView__setINImage_withBundleID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAppImageViewWithBundleIdentifier:*(void *)(a1 + 40)];
}

void __47__APUISuggestionView__setINImage_withBundleID___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__APUISuggestionView__setINImage_withBundleID___block_invoke_2_20;
  block[3] = &unk_2647648B8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __47__APUISuggestionView__setINImage_withBundleID___block_invoke_2_20(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "_setAppImageViewWithImage:");
  }
  else {
    return [v2 _setAppImageViewWithBundleIdentifier:a1[6]];
  }
}

- (void)setINImage:(id)a3 withBundleID:(id)a4
{
  if (a3) {
    [(APUISuggestionView *)self _setINImage:a3 withBundleID:a4];
  }
  else {
    [(APUISuggestionView *)self _setAppImageViewWithBundleIdentifier:a4];
  }
}

- (void)setLNImage:(id)a3 withBundleID:(id)a4
{
  id v6 = a4;
  id v9 = v6;
  if (a3)
  {
    uint64_t v7 = [a3 inImage];
    [(APUISuggestionView *)self setINImage:v7 withBundleID:v9];

    id v8 = (void *)v7;
  }
  else
  {
    [(APUISuggestionView *)self _setAppImageViewWithBundleIdentifier:v6];
    id v8 = v9;
  }
}

- (void)_setAppImageViewWithImage:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[APUISuggestionView _setAppImageViewWithImage:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent %s:  image: %@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = [(APUISuggestionView *)self appImageView];
  uint64_t v7 = [v6 layer];
  [v7 setCornerRadius:5.0];

  id v8 = [(APUISuggestionView *)self appImageView];
  [v8 setClipsToBounds:1];

  id v9 = [(APUISuggestionView *)self appImageView];
  [v9 setImage:v4];
}

- (void)_setAppImageViewWithBundleIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = __atxlog_handle_ui();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "-[APUISuggestionView _setAppImageViewWithBundleIdentifier:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent %s:  bundleId: %@", (uint8_t *)&v11, 0x16u);
  }

  id v6 = [(APUISuggestionView *)self appImageView];
  uint64_t v7 = [v6 layer];
  [v7 setCornerRadius:0.0];

  id v8 = [(APUISuggestionView *)self appImageView];
  [v8 setClipsToBounds:0];

  id v9 = [(APUISuggestionView *)self appImageView];
  int v10 = +[APUIAppIconDataSource iconForBundleIdentifier:v4 shouldApplyMask:1];
  [v9 setImage:v10];
}

- (unint64_t)platterSize
{
  return self->_platterSize;
}

- (void)setPlatterSize:(unint64_t)a3
{
  self->_unint64_t platterSize = a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIImageView)appImageView
{
  return self->_appImageView;
}

- (void)setAppImageView:(id)a3
{
}

- (UILabel)reasonLabel
{
  return self->_reasonLabel;
}

- (void)setReasonLabel:(id)a3
{
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (BOOL)canEngageSuggestion
{
  return self->_canEngageSuggestion;
}

- (void)setCanEngageSuggestion:(BOOL)a3
{
  self->_canEngageSuggestion = a3;
}

- (APUISuggestionsWidgetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APUISuggestionsWidgetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_reasonLabel, 0);
  objc_storeStrong((id *)&self->_appImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_reasonStylingProvider, 0);
}

- (void)layoutSuggestion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_225AE0000, log, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: -[APUISuggestionView layoutSuggestion:] should be called only from a subclass", v1, 2u);
}

- (void)traitCollectionDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  v2 = "-[APUISuggestionView traitCollectionDidChange:]";
  _os_log_debug_impl(&dword_225AE0000, log, OS_LOG_TYPE_DEBUG, "%{public}s", (uint8_t *)&v1, 0xCu);
}

void __47__APUISuggestionView__setINImage_withBundleID___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [a2 localizedDescription];
  int v7 = 134218754;
  uint64_t v8 = 5517;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v5;
  __int16 v13 = 2112;
  id v14 = v6;
  _os_log_error_impl(&dword_225AE0000, a3, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: Error with connection %@ loadImageDataAndSizeForImage %@: %@", (uint8_t *)&v7, 0x2Au);
}

@end