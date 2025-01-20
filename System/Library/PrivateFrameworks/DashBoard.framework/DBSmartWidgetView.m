@interface DBSmartWidgetView
- (DBSmartWidgetEngine)engine;
- (DBSmartWidgetPrediction)prediction;
- (DBSmartWidgetView)initWithFrame:(CGRect)a3;
- (UIImageView)imageview;
- (UILabel)nextRefreshDebugLabel;
- (UILabel)scoreDebugLabel;
- (UILabel)subTitleLabel;
- (UILabel)titleLabel;
- (UILabel)validRangesDebugLabel;
- (void)_updateImageBorder;
- (void)_updateViews;
- (void)didMoveToWindow;
- (void)predictionDidUpdate:(id)a3;
- (void)setEngine:(id)a3;
- (void)setImageview:(id)a3;
- (void)setNextRefreshDebugLabel:(id)a3;
- (void)setPrediction:(id)a3;
- (void)setScoreDebugLabel:(id)a3;
- (void)setSubTitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setValidRangesDebugLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBSmartWidgetView

- (DBSmartWidgetView)initWithFrame:(CGRect)a3
{
  v98[19] = *MEMORY[0x263EF8340];
  v97.receiver = self;
  v97.super_class = (Class)DBSmartWidgetView;
  v3 = -[DBSmartWidgetView initWithFrame:](&v97, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(DBSmartWidgetView *)v3 layer];
    [v5 setAllowsGroupBlending:0];

    id v6 = objc_alloc(MEMORY[0x263F82828]);
    double v7 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
    imageview = v4->_imageview;
    v4->_imageview = (UIImageView *)v11;

    [(UIImageView *)v4->_imageview setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(UIImageView *)v4->_imageview layer];
    [v13 setCornerRadius:8.0];

    v14 = [(UIImageView *)v4->_imageview layer];
    [v14 setCornerCurve:*MEMORY[0x263F15A20]];

    [(UIImageView *)v4->_imageview setClipsToBounds:1];
    [(DBSmartWidgetView *)v4 addSubview:v4->_imageview];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v15;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [MEMORY[0x263F825C8] _labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v17];

    v18 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1280];
    [(UILabel *)v4->_titleLabel setFont:v18];

    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_titleLabel setNumberOfLines:1];
    [(DBSmartWidgetView *)v4 addSubview:v4->_titleLabel];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    subTitleLabel = v4->_subTitleLabel;
    v4->_subTitleLabel = (UILabel *)v19;

    [(UILabel *)v4->_subTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [MEMORY[0x263F825C8] _carSystemPrimaryColor];
    [(UILabel *)v4->_subTitleLabel setTextColor:v21];

    v22 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83588] variant:256];
    [(UILabel *)v4->_subTitleLabel setFont:v22];

    [(UILabel *)v4->_subTitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_subTitleLabel setNumberOfLines:1];
    [(DBSmartWidgetView *)v4 addSubview:v4->_subTitleLabel];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    scoreDebugLabel = v4->_scoreDebugLabel;
    v4->_scoreDebugLabel = (UILabel *)v23;

    [(UILabel *)v4->_scoreDebugLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    [(UILabel *)v4->_scoreDebugLabel setTextColor:v25];

    v26 = [MEMORY[0x263F81708] systemFontOfSize:5.0];
    [(UILabel *)v4->_scoreDebugLabel setFont:v26];

    [(UILabel *)v4->_scoreDebugLabel setNumberOfLines:0];
    v27 = [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
    [(UILabel *)v4->_scoreDebugLabel setBackgroundColor:v27];

    [(DBSmartWidgetView *)v4 addSubview:v4->_scoreDebugLabel];
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    nextRefreshDebugLabel = v4->_nextRefreshDebugLabel;
    v4->_nextRefreshDebugLabel = (UILabel *)v28;

    [(UILabel *)v4->_nextRefreshDebugLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    [(UILabel *)v4->_nextRefreshDebugLabel setTextColor:v30];

    v31 = [MEMORY[0x263F81708] systemFontOfSize:5.0];
    [(UILabel *)v4->_nextRefreshDebugLabel setFont:v31];

    [(UILabel *)v4->_nextRefreshDebugLabel setNumberOfLines:1];
    v32 = [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
    [(UILabel *)v4->_nextRefreshDebugLabel setBackgroundColor:v32];

    [(DBSmartWidgetView *)v4 addSubview:v4->_nextRefreshDebugLabel];
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    validRangesDebugLabel = v4->_validRangesDebugLabel;
    v4->_validRangesDebugLabel = (UILabel *)v33;

    [(UILabel *)v4->_validRangesDebugLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v35 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    [(UILabel *)v4->_validRangesDebugLabel setTextColor:v35];

    v36 = [MEMORY[0x263F81708] systemFontOfSize:5.0];
    [(UILabel *)v4->_validRangesDebugLabel setFont:v36];

    [(UILabel *)v4->_validRangesDebugLabel setNumberOfLines:0];
    v37 = [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
    [(UILabel *)v4->_validRangesDebugLabel setBackgroundColor:v37];

    [(DBSmartWidgetView *)v4 addSubview:v4->_validRangesDebugLabel];
    v75 = (void *)MEMORY[0x263F08938];
    v96 = [(UIImageView *)v4->_imageview heightAnchor];
    v95 = [v96 constraintEqualToConstant:40.0];
    v98[0] = v95;
    v94 = [(UIImageView *)v4->_imageview centerYAnchor];
    v93 = [(DBSmartWidgetView *)v4 centerYAnchor];
    v92 = [v94 constraintEqualToAnchor:v93];
    v98[1] = v92;
    v91 = [(UIImageView *)v4->_imageview leadingAnchor];
    v90 = [(DBSmartWidgetView *)v4 leadingAnchor];
    v89 = [v91 constraintEqualToAnchor:v90 constant:13.0];
    v98[2] = v89;
    v88 = [(UIImageView *)v4->_imageview widthAnchor];
    v87 = [(UIImageView *)v4->_imageview heightAnchor];
    v86 = [v88 constraintEqualToAnchor:v87];
    v98[3] = v86;
    v85 = [(UILabel *)v4->_titleLabel firstBaselineAnchor];
    v84 = [(UIImageView *)v4->_imageview topAnchor];
    v83 = [v85 constraintEqualToAnchor:v84 constant:17.0];
    v98[4] = v83;
    v82 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v81 = [(UIImageView *)v4->_imageview trailingAnchor];
    v80 = [v82 constraintEqualToAnchor:v81 constant:8.0];
    v98[5] = v80;
    v79 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v78 = [(DBSmartWidgetView *)v4 trailingAnchor];
    v77 = [v79 constraintEqualToAnchor:v78 constant:-8.0];
    v98[6] = v77;
    v76 = [(UILabel *)v4->_subTitleLabel firstBaselineAnchor];
    v74 = [(UILabel *)v4->_titleLabel lastBaselineAnchor];
    v73 = [v76 constraintEqualToAnchor:v74 constant:17.0];
    v98[7] = v73;
    v72 = [(UILabel *)v4->_subTitleLabel leadingAnchor];
    v71 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v70 = [v72 constraintEqualToAnchor:v71];
    v98[8] = v70;
    v69 = [(UILabel *)v4->_subTitleLabel trailingAnchor];
    v68 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v98[9] = v67;
    v66 = [(UILabel *)v4->_scoreDebugLabel leadingAnchor];
    v65 = [(DBSmartWidgetView *)v4 leadingAnchor];
    v64 = [v66 constraintEqualToAnchor:v65 constant:5.0];
    v98[10] = v64;
    v63 = [(UILabel *)v4->_scoreDebugLabel trailingAnchor];
    v62 = [(DBSmartWidgetView *)v4 trailingAnchor];
    v61 = [v63 constraintEqualToAnchor:v62 constant:-5.0];
    v98[11] = v61;
    v60 = [(UILabel *)v4->_scoreDebugLabel bottomAnchor];
    v59 = [(DBSmartWidgetView *)v4 bottomAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:-5.0];
    v98[12] = v58;
    v57 = [(UILabel *)v4->_nextRefreshDebugLabel leadingAnchor];
    v56 = [(DBSmartWidgetView *)v4 leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 constant:5.0];
    v98[13] = v55;
    v54 = [(UILabel *)v4->_nextRefreshDebugLabel trailingAnchor];
    v53 = [(DBSmartWidgetView *)v4 trailingAnchor];
    v52 = [v54 constraintEqualToAnchor:v53 constant:-5.0];
    v98[14] = v52;
    v51 = [(UILabel *)v4->_nextRefreshDebugLabel topAnchor];
    v50 = [(DBSmartWidgetView *)v4 topAnchor];
    v49 = [v51 constraintEqualToAnchor:v50 constant:5.0];
    v98[15] = v49;
    v48 = [(UILabel *)v4->_validRangesDebugLabel leadingAnchor];
    v38 = [(DBSmartWidgetView *)v4 leadingAnchor];
    v39 = [v48 constraintEqualToAnchor:v38 constant:5.0];
    v98[16] = v39;
    v40 = [(UILabel *)v4->_validRangesDebugLabel trailingAnchor];
    v41 = [(DBSmartWidgetView *)v4 trailingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:-5.0];
    v98[17] = v42;
    v43 = [(UILabel *)v4->_validRangesDebugLabel topAnchor];
    v44 = [(UILabel *)v4->_nextRefreshDebugLabel bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44 constant:5.0];
    v98[18] = v45;
    v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:19];
    [v75 activateConstraints:v46];
  }
  return v4;
}

- (void)setPrediction:(id)a3
{
  v4 = (DBSmartWidgetPrediction *)a3;
  v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetView setPrediction:]((uint64_t)v4, v5);
  }

  [(DBSmartWidgetPrediction *)self->_prediction removeObserver:self];
  prediction = self->_prediction;
  self->_prediction = v4;
  double v7 = v4;

  [(DBSmartWidgetView *)self _updateViews];
  [(DBSmartWidgetPrediction *)self->_prediction addObserver:self];
}

- (void)_updateViews
{
  v3 = [(DBSmartWidgetView *)self prediction];
  v4 = [v3 image];
  v5 = [(DBSmartWidgetView *)self imageview];
  [v5 setImage:v4];

  id v6 = [(DBSmartWidgetView *)self prediction];
  double v7 = [v6 compositingFilter];
  double v8 = [(DBSmartWidgetView *)self imageview];
  double v9 = [v8 layer];
  [v9 setCompositingFilter:v7];

  double v10 = [(DBSmartWidgetView *)self prediction];
  uint64_t v11 = [v10 title];
  v12 = [(DBSmartWidgetView *)self titleLabel];
  [v12 setText:v11];

  v13 = [(DBSmartWidgetView *)self titleLabel];
  [v13 setAccessibilityIdentifier:@"SmartWidgetTitle"];

  v14 = [(DBSmartWidgetView *)self prediction];
  uint64_t v15 = [v14 subtitle];
  v16 = [(DBSmartWidgetView *)self subTitleLabel];
  [v16 setText:v15];

  v17 = [(DBSmartWidgetView *)self subTitleLabel];
  [v17 setAccessibilityIdentifier:@"SmartWidgetSubtitle"];

  [(DBSmartWidgetView *)self _updateImageBorder];
  v18 = [MEMORY[0x263F30E28] smartWidgetDebugShowScore];
  LODWORD(v15) = [v18 valueBool];

  uint64_t v19 = v15 ^ 1;
  v20 = [(DBSmartWidgetView *)self scoreDebugLabel];
  [v20 setHidden:v19];

  v21 = [(DBSmartWidgetView *)self nextRefreshDebugLabel];
  [v21 setHidden:v19];

  v22 = [(DBSmartWidgetView *)self validRangesDebugLabel];
  [v22 setHidden:v19];

  if (v19)
  {
    v32 = [(DBSmartWidgetView *)self scoreDebugLabel];
    [v32 setText:&stru_26E13A820];

    uint64_t v33 = [(DBSmartWidgetView *)self nextRefreshDebugLabel];
    [v33 setText:&stru_26E13A820];

    id v34 = [(DBSmartWidgetView *)self validRangesDebugLabel];
    [v34 setText:&stru_26E13A820];
  }
  else
  {
    uint64_t v23 = [(DBSmartWidgetView *)self prediction];
    v24 = [v23 debugScoreText];
    v25 = [(DBSmartWidgetView *)self scoreDebugLabel];
    [v25 setText:v24];

    v26 = [(DBSmartWidgetView *)self engine];
    v27 = [v26 nextRefresh];
    uint64_t v28 = +[DBDateFormatter formattedTimeStamp:v27];
    v29 = [(DBSmartWidgetView *)self nextRefreshDebugLabel];
    [v29 setText:v28];

    id v34 = [(DBSmartWidgetView *)self prediction];
    v30 = [v34 debugValidRangesText];
    v31 = [(DBSmartWidgetView *)self validRangesDebugLabel];
    [v31 setText:v30];
  }
}

- (void)_updateImageBorder
{
  v3 = [(DBSmartWidgetView *)self traitCollection];
  if ([v3 userInterfaceStyle] == 1)
  {
    v4 = [(DBSmartWidgetView *)self prediction];
    int v5 = [v4 showImageBorder];

    if (v5)
    {
      id v6 = [(DBSmartWidgetView *)self imageview];
      double v7 = [v6 layer];
      [v7 setBorderWidth:0.5];

      id v15 = [MEMORY[0x263F825C8] blackColor];
      id v8 = [v15 colorWithAlphaComponent:0.0700000003];
      uint64_t v9 = [v8 CGColor];
      double v10 = [(DBSmartWidgetView *)self imageview];
      uint64_t v11 = [v10 layer];
      [v11 setBorderColor:v9];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v12 = [(DBSmartWidgetView *)self imageview];
  v13 = [v12 layer];
  [v13 setBorderWidth:0.0];

  id v15 = [MEMORY[0x263F825C8] clearColor];
  uint64_t v14 = [v15 CGColor];
  id v8 = [(DBSmartWidgetView *)self imageview];
  double v10 = [v8 layer];
  [v10 setBorderColor:v14];
LABEL_6:
}

- (void)predictionDidUpdate:(id)a3
{
  id v4 = a3;
  int v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetView predictionDidUpdate:]((uint64_t)v4, v5);
  }

  [(DBSmartWidgetView *)self _updateViews];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DBSmartWidgetView;
  id v4 = a3;
  [(DBSmartWidgetView *)&v6 traitCollectionDidChange:v4];
  int v5 = [(DBSmartWidgetView *)self prediction];
  [v5 traitCollectionDidChange:v4];

  [(DBSmartWidgetView *)self _updateImageBorder];
}

- (void)didMoveToWindow
{
  v3 = [(DBSmartWidgetView *)self prediction];
  [v3 traitCollectionDidChange:0];

  [(DBSmartWidgetView *)self _updateImageBorder];
}

- (DBSmartWidgetPrediction)prediction
{
  return self->_prediction;
}

- (DBSmartWidgetEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  return (DBSmartWidgetEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (UIImageView)imageview
{
  return self->_imageview;
}

- (void)setImageview:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
}

- (UILabel)scoreDebugLabel
{
  return self->_scoreDebugLabel;
}

- (void)setScoreDebugLabel:(id)a3
{
}

- (UILabel)nextRefreshDebugLabel
{
  return self->_nextRefreshDebugLabel;
}

- (void)setNextRefreshDebugLabel:(id)a3
{
}

- (UILabel)validRangesDebugLabel
{
  return self->_validRangesDebugLabel;
}

- (void)setValidRangesDebugLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validRangesDebugLabel, 0);
  objc_storeStrong((id *)&self->_nextRefreshDebugLabel, 0);
  objc_storeStrong((id *)&self->_scoreDebugLabel, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageview, 0);
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_prediction, 0);
}

- (void)setPrediction:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "Set prediction: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)predictionDidUpdate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "Prediction updated: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end