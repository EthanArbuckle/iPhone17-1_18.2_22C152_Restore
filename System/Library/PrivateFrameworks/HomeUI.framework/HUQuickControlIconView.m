@interface HUQuickControlIconView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isUserInteractionActive;
- (CGRect)_getLabelsContainingRect;
- (CGSize)intrinsicContentSize;
- (HUIconView)iconView;
- (HUQuickControlIconView)initWithProfile:(id)a3;
- (HUQuickControlIconViewProfile)profile;
- (HUQuickControlViewInteractionDelegate)interactionDelegate;
- (UILabel)statusLabel;
- (UILabel)supplementaryLabel;
- (double)_iconAndLabelsHeight;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)viewValue;
- (unint64_t)reachabilityState;
- (void)_updateLabelFramesOrigins;
- (void)_updateLabelSizes;
- (void)_updateLayout;
- (void)_updateUI;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setIconView:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setProfile:(id)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setStatusLabel:(id)a3;
- (void)setSupplementaryLabel:(id)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setViewValue:(id)a3;
@end

@implementation HUQuickControlIconView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlIconView)initWithProfile:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUQuickControlIconView;
  v6 = [(HUQuickControlIconView *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v8 = (HUIconView *)objc_alloc_init(MEMORY[0x1E4F6A428]);
    iconView = v7->_iconView;
    v7->_iconView = v8;

    [(HUIconView *)v7->_iconView setUserInteractionEnabled:0];
    [(HUIconView *)v7->_iconView setContentMode:2];
    [(HUIconView *)v7->_iconView setIconSize:4];
    [(HUQuickControlIconView *)v7 addSubview:v7->_iconView];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    statusLabel = v7->_statusLabel;
    v7->_statusLabel = v10;

    [(UILabel *)v7->_statusLabel setNumberOfLines:0];
    [(UILabel *)v7->_statusLabel setTextAlignment:1];
    [(HUQuickControlIconView *)v7 addSubview:v7->_statusLabel];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    supplementaryLabel = v7->_supplementaryLabel;
    v7->_supplementaryLabel = v12;

    [(UILabel *)v7->_supplementaryLabel setNumberOfLines:0];
    [(UILabel *)v7->_supplementaryLabel setTextAlignment:1];
    [(HUQuickControlIconView *)v7 addSubview:v7->_supplementaryLabel];
  }

  return v7;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);

  [(HUQuickControlIconView *)self _updateUI];
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  [(HUQuickControlIconView *)self _iconAndLabelsHeight];
  id v5 = HUQuickControlIconViewMetricsForControlSize(a3, v4);
  v6 = [v5 sizeDescriptor];

  return v6;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_viewValue, a3);

  [(HUQuickControlIconView *)self _updateUI];
}

- (CGSize)intrinsicContentSize
{
  [(HUQuickControlIconView *)self _iconAndLabelsHeight];
  double v4 = v3;
  id v5 = [(HUQuickControlIconView *)self profile];
  v6 = HUQuickControlIconViewMetricsForControlSize([v5 controlSize], v4);
  v7 = [v6 sizeDescriptor];
  [v7 intrinsicSize];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlIconView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 <= 2) {
    [(HUQuickControlIconView *)self setAlpha:dbl_1BEA19D48[a3]];
  }
}

- (BOOL)isUserInteractionActive
{
  return 0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlIconView;
  [(HUQuickControlIconView *)&v3 layoutSubviews];
  [(HUQuickControlIconView *)self _updateLayout];
  [(HUQuickControlIconView *)self _updateUIForReachabilityState:[(HUQuickControlIconView *)self reachabilityState]];
}

- (void)_updateUI
{
  v55[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(HUQuickControlIconView *)self profile];
  double v4 = [v3 iconDescriptor];

  id v5 = [(HUQuickControlIconView *)self profile];
  v6 = [v5 iconDescriptor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F69658]);
    double v9 = [(HUQuickControlIconView *)self profile];
    double v10 = [v9 statusString];
    uint64_t v11 = [v8 initWithFormattedTemperature:v10 heatingCoolingMode:0 targetHeatingCoolingMode:0];

    double v4 = (void *)v11;
  }
  double v12 = [(HUQuickControlIconView *)self iconView];
  v50 = v4;
  [v12 updateWithIconDescriptor:v4 displayStyle:1 animated:1];

  uint64_t v13 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890] addingSymbolicTraits:2 options:0];
  v14 = objc_opt_new();
  [v14 setAlignment:1];
  LODWORD(v15) = 1.0;
  [v14 setHyphenationFactor:v15];
  [v14 setLineBreakMode:0];
  v16 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v17 = [v16 firstObject];

  v18 = [(HUQuickControlIconView *)self profile];
  uint64_t v19 = [v18 statusString];
  v20 = (void *)v19;
  v21 = &stru_1F18F92B8;
  if (v19) {
    v21 = (__CFString *)v19;
  }
  v22 = v21;

  v23 = [(HUQuickControlIconView *)self statusLabel];
  v51 = v22;
  [v23 setText:v22];

  v24 = [(HUQuickControlIconView *)self profile];
  v25 = [v24 statusTextColor];
  v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = [MEMORY[0x1E4F428B8] labelColor];
  }
  id v28 = v27;
  v49 = v27;

  uint64_t v29 = *MEMORY[0x1E4F42510];
  v55[0] = v28;
  uint64_t v30 = *MEMORY[0x1E4F42508];
  v54[0] = v29;
  v54[1] = v30;
  v31 = (void *)v13;
  v32 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v13 size:0.0];
  uint64_t v33 = *MEMORY[0x1E4F42540];
  v55[1] = v32;
  v55[2] = v14;
  uint64_t v34 = *MEMORY[0x1E4F24780];
  v54[2] = v33;
  v54[3] = v34;
  v55[3] = v17;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:4];
  v48 = v47 = v14;

  v35 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v51 attributes:v48];
  v36 = [(HUQuickControlIconView *)self statusLabel];
  [v36 setAttributedText:v35];

  v37 = [(HUQuickControlIconView *)self profile];
  uint64_t v38 = [v37 supplementaryString];
  v39 = (void *)v38;
  v40 = &stru_1F18F92B8;
  if (v38) {
    v40 = (__CFString *)v38;
  }
  v41 = v40;

  v52[0] = v29;
  v42 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v53[0] = v42;
  v52[1] = v30;
  v43 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v31 size:0.0];
  v53[1] = v43;
  v53[2] = v47;
  v52[2] = v33;
  v52[3] = v34;
  v53[3] = v17;
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:4];

  v45 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v41 attributes:v44];
  v46 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v46 setAttributedText:v45];

  [(HUQuickControlIconView *)self _updateLayout];
}

- (double)_iconAndLabelsHeight
{
  [(HUQuickControlIconView *)self _updateLabelSizes];
  [(HUQuickControlIconView *)self _getLabelsContainingRect];
  return v3 + 76.0;
}

- (void)_updateLayout
{
  [(HUQuickControlIconView *)self _iconAndLabelsHeight];
  double v4 = v3;
  [(HUQuickControlIconView *)self frame];
  double v6 = v5 * 0.5 + -35.0;
  [(HUQuickControlIconView *)self frame];
  double v8 = v7 * 0.5 - v4 * 0.5;
  double v9 = [(HUQuickControlIconView *)self iconView];
  objc_msgSend(v9, "setFrame:", v6, v8, 70.0, 70.0);

  [(HUQuickControlIconView *)self _updateLabelFramesOrigins];
}

- (void)_updateLabelSizes
{
  double v3 = [(HUQuickControlIconView *)self profile];
  uint64_t v4 = [v3 controlSize];
  double v5 = 120.0;
  if (v4 == 1) {
    double v5 = 280.0;
  }
  if (v4) {
    double v6 = v5;
  }
  else {
    double v6 = 330.0;
  }

  [(HUQuickControlIconView *)self frame];
  if (v7 <= 0.0)
  {
    double v9 = [(HUQuickControlIconView *)self iconView];
    [v9 frame];
    double v11 = v10 * 1.5;

    if (v11 >= v6) {
      double v6 = v11;
    }
  }
  else
  {
    [(HUQuickControlIconView *)self frame];
    if (v8 < v6) {
      double v6 = v8;
    }
  }
  double v12 = [(HUQuickControlIconView *)self statusLabel];
  objc_msgSend(v12, "sizeThatFits:", v6, 1.79769313e308);
  double v14 = v13;
  double v16 = v15;

  v17 = [(HUQuickControlIconView *)self statusLabel];
  [v17 frame];
  double v19 = v18;
  v20 = [(HUQuickControlIconView *)self statusLabel];
  [v20 frame];
  double v22 = v21;
  v23 = [(HUQuickControlIconView *)self statusLabel];
  objc_msgSend(v23, "setFrame:", v19, v22, v14, v16);

  v24 = [(HUQuickControlIconView *)self supplementaryLabel];
  objc_msgSend(v24, "sizeThatFits:", v6, 1.79769313e308);
  double v26 = v25;
  double v28 = v27;

  id v35 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v35 frame];
  double v30 = v29;
  v31 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v31 frame];
  double v33 = v32;
  uint64_t v34 = [(HUQuickControlIconView *)self supplementaryLabel];
  objc_msgSend(v34, "setFrame:", v30, v33, v26, v28);
}

- (CGRect)_getLabelsContainingRect
{
  [(HUQuickControlIconView *)self _updateLabelSizes];
  double v3 = [(HUQuickControlIconView *)self statusLabel];
  [v3 frame];
  double v5 = v4;

  double v6 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v6 frame];
  double v8 = v7;

  if (v5 >= v8) {
    double v5 = v8;
  }
  double v9 = [(HUQuickControlIconView *)self statusLabel];
  [v9 frame];
  double v11 = v10;

  double v12 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v12 frame];
  double v14 = v13;

  if (v11 >= v14) {
    double v11 = v14;
  }
  double v15 = [(HUQuickControlIconView *)self statusLabel];
  [v15 frame];
  double v17 = v16;
  double v18 = [(HUQuickControlIconView *)self statusLabel];
  [v18 frame];
  double v20 = v17 + v19;

  double v21 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v21 frame];
  double v23 = v22;
  v24 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v24 frame];
  double v26 = v23 + v25;

  if (v20 >= v26) {
    double v27 = v20;
  }
  else {
    double v27 = v26;
  }
  double v28 = v27 - v5;
  double v29 = [(HUQuickControlIconView *)self statusLabel];
  [v29 frame];
  double v31 = v30;
  double v32 = [(HUQuickControlIconView *)self statusLabel];
  [v32 frame];
  double v34 = v31 + v33;

  id v35 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v35 frame];
  double v37 = v36;
  uint64_t v38 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v38 frame];
  double v40 = v37 + v39;

  if (v34 >= v40) {
    double v41 = v34;
  }
  else {
    double v41 = v40;
  }
  double v42 = v41 - v11;
  double v43 = v5;
  double v44 = v11;
  double v45 = v28;
  result.size.height = v42;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (void)_updateLabelFramesOrigins
{
  [(HUQuickControlIconView *)self frame];
  double v4 = v3 * 0.5;
  double v5 = [(HUQuickControlIconView *)self statusLabel];
  [v5 frame];
  double v7 = v4 - v6 * 0.5;

  double v8 = [(HUQuickControlIconView *)self iconView];
  [v8 frame];
  double v10 = v9;
  double v11 = [(HUQuickControlIconView *)self iconView];
  [v11 frame];
  double v13 = v10 + v12 + 6.0;

  double v14 = [(HUQuickControlIconView *)self statusLabel];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;

  double v19 = [(HUQuickControlIconView *)self statusLabel];
  objc_msgSend(v19, "setFrame:", v7, v13, v16, v18);

  [(HUQuickControlIconView *)self frame];
  double v21 = v20 * 0.5;
  double v22 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v22 frame];
  double v24 = v21 - v23 * 0.5;

  double v25 = [(HUQuickControlIconView *)self statusLabel];
  [v25 frame];
  double v27 = v26;
  double v28 = [(HUQuickControlIconView *)self statusLabel];
  [v28 frame];
  double v30 = v27 + v29;

  double v31 = [(HUQuickControlIconView *)self supplementaryLabel];
  [v31 frame];
  double v33 = v32;
  double v35 = v34;

  id v36 = [(HUQuickControlIconView *)self supplementaryLabel];
  objc_msgSend(v36, "setFrame:", v24, v30, v33, v35);
}

- (HUQuickControlIconViewProfile)profile
{
  return self->_profile;
}

- (HUQuickControlViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (HUQuickControlViewInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (UILabel)supplementaryLabel
{
  return self->_supplementaryLabel;
}

- (void)setSupplementaryLabel:(id)a3
{
}

- (id)viewValue
{
  return self->_viewValue;
}

- (void)setViewValue:(id)a3
{
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewValue, 0);
  objc_storeStrong((id *)&self->_supplementaryLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end