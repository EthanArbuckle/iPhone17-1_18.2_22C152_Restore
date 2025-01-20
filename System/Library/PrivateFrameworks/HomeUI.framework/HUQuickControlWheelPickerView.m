@interface HUQuickControlWheelPickerView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isUserInteractionActive;
- (CGSize)intrinsicContentSize;
- (HUQuickControlViewInteractionDelegate)interactionDelegate;
- (HUQuickControlWheelPickerView)initWithProfile:(id)a3;
- (HUQuickControlWheelPickerViewProfile)profile;
- (NSArray)items;
- (NSNumber)selectedRow;
- (UIImpactFeedbackGenerator)impactFeedbackGenerator;
- (UIPickerView)pickerView;
- (UISelectionFeedbackGenerator)selectionFeedbackGenerator;
- (UIView)bottomGradientView;
- (UIView)selectedRowSurroundingView;
- (UIView)topGradientView;
- (double)maxTextWidth;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (id)value;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (unint64_t)reachabilityState;
- (void)_actuateSelectionTapticFeedback;
- (void)_prepareForTapticFeedback;
- (void)_updateSelectedRowBorderView:(id)a3;
- (void)_updateUI;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)layoutSubviews;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setBottomGradientView:(id)a3;
- (void)setImpactFeedbackGenerator:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setItems:(id)a3;
- (void)setMaxTextWidth:(double)a3;
- (void)setPickerView:(id)a3;
- (void)setProfile:(id)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setSelectedRow:(id)a3;
- (void)setSelectedRowSurroundingView:(id)a3;
- (void)setSelectionFeedbackGenerator:(id)a3;
- (void)setTopGradientView:(id)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)tintColorDidChange;
@end

@implementation HUQuickControlWheelPickerView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlWheelPickerView)initWithProfile:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HUQuickControlWheelPickerView;
  v6 = [(HUQuickControlWheelPickerView *)&v35 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    id v8 = objc_alloc_init(MEMORY[0x1E4F42C78]);
    [(HUQuickControlWheelPickerView *)v7 setPickerView:v8];

    v9 = [(HUQuickControlWheelPickerView *)v7 pickerView];
    [v9 setDelegate:v7];

    v10 = [(HUQuickControlWheelPickerView *)v7 pickerView];
    [v10 setDataSource:v7];

    v11 = [(HUQuickControlWheelPickerView *)v7 pickerView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v12 = [(HUQuickControlWheelPickerView *)v7 pickerView];
    [(HUQuickControlWheelPickerView *)v7 addSubview:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(HUQuickControlWheelPickerView *)v7 setTopGradientView:v13];

    v14 = [(HUQuickControlWheelPickerView *)v7 topGradientView];
    [v14 setUserInteractionEnabled:0];

    v15 = [(HUQuickControlWheelPickerView *)v7 topGradientView];
    [(HUQuickControlWheelPickerView *)v7 addSubview:v15];

    id v16 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(HUQuickControlWheelPickerView *)v7 setBottomGradientView:v16];

    v17 = [(HUQuickControlWheelPickerView *)v7 bottomGradientView];
    [v17 setUserInteractionEnabled:0];

    v18 = [(HUQuickControlWheelPickerView *)v7 bottomGradientView];
    [(HUQuickControlWheelPickerView *)v7 addSubview:v18];

    v19 = [(HUQuickControlWheelPickerView *)v7 bottomGradientView];
    [v19 setHidden:1];

    id v20 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(HUQuickControlWheelPickerView *)v7 setSelectedRowSurroundingView:v20];

    v21 = [(HUQuickControlWheelPickerView *)v7 selectedRowSurroundingView];
    [v21 setUserInteractionEnabled:0];

    v22 = [(HUQuickControlWheelPickerView *)v7 selectedRowSurroundingView];
    [(HUQuickControlWheelPickerView *)v7 addSubview:v22];

    v23 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __49__HUQuickControlWheelPickerView_initWithProfile___block_invoke;
    v32 = &unk_1E6386F20;
    id v33 = v23;
    v24 = v7;
    v34 = v24;
    id v25 = v23;
    v26 = (void (**)(void *, void *))_Block_copy(&v29);
    v27 = [(HUQuickControlWheelPickerView *)v24 pickerView];
    v26[2](v26, v27);

    [MEMORY[0x1E4F28DC8] activateConstraints:v25];
  }

  return v7;
}

void __49__HUQuickControlWheelPickerView_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 leadingAnchor];
  v6 = [*(id *)(a1 + 40) leadingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  id v8 = *(void **)(a1 + 32);
  v9 = [v4 trailingAnchor];
  v10 = [*(id *)(a1 + 40) trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v8 addObject:v11];

  v12 = *(void **)(a1 + 32);
  id v13 = [v4 topAnchor];
  v14 = [*(id *)(a1 + 40) topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v12 addObject:v15];

  id v16 = *(void **)(a1 + 32);
  id v19 = [v4 bottomAnchor];

  v17 = [*(id *)(a1 + 40) bottomAnchor];
  v18 = [v19 constraintEqualToAnchor:v17];
  [v16 addObject:v18];
}

- (void)setItems:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToArray:self->_items] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_items, a3);
    [(HUQuickControlWheelPickerView *)self setNeedsLayout];
    [(HUQuickControlWheelPickerView *)self setMaxTextWidth:0.0];
    [(UIPickerView *)self->_pickerView reloadAllComponents];
  }
  [(HUQuickControlWheelPickerView *)self _updateUI];
}

- (void)setSelectedRow:(id)a3
{
  v14 = (NSNumber *)a3;
  if (self->_selectedRow != v14)
  {
    objc_storeStrong((id *)&self->_selectedRow, a3);
    uint64_t v5 = [(HUQuickControlWheelPickerView *)self items];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(HUQuickControlWheelPickerView *)self items];
      uint64_t v8 = [v7 count];
      uint64_t v9 = [(NSNumber *)v14 integerValue];

      if (v8 > v9)
      {
        [(HUQuickControlWheelPickerView *)self setUserInteractionActive:1];
        v10 = [(HUQuickControlWheelPickerView *)self items];
        v11 = objc_msgSend(v10, "objectAtIndex:", -[NSNumber integerValue](v14, "integerValue"));

        v12 = [(HUQuickControlWheelPickerView *)self interactionDelegate];
        id v13 = [v11 value];
        [v12 controlView:self valueDidChange:v13];

        [(HUQuickControlWheelPickerView *)self setUserInteractionActive:0];
        [(HUQuickControlWheelPickerView *)self setNeedsLayout];
      }
    }
  }
}

- (void)_updateUI
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(HUQuickControlWheelPickerView *)self items];
  int v4 = [v3 count];

  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      v6 = [(HUQuickControlWheelPickerView *)self items];
      v7 = [v6 objectAtIndex:v5];

      if ([v7 isSelected]) {
        break;
      }

      ++v5;
      uint64_t v8 = [(HUQuickControlWheelPickerView *)self items];
      int v9 = [v8 count];

      if (v5 >= v9) {
        goto LABEL_13;
      }
    }
    v10 = (void *)[objc_alloc(NSNumber) initWithInt:v5];
    [(HUQuickControlWheelPickerView *)self setSelectedRow:v10];

    v11 = [(HUQuickControlWheelPickerView *)self pickerView];
    uint64_t v12 = [v11 numberOfRowsInComponent:0];

    uint64_t v13 = [(HUQuickControlWheelPickerView *)self selectedRow];
    if (v13
      && (v14 = (void *)v13,
          [(HUQuickControlWheelPickerView *)self selectedRow],
          v15 = objc_claimAutoreleasedReturnValue(),
          uint64_t v16 = [v15 integerValue],
          v15,
          v14,
          v16 < v12))
    {
      v17 = [(HUQuickControlWheelPickerView *)self pickerView];
      v18 = [(HUQuickControlWheelPickerView *)self selectedRow];
      -[NSObject selectRow:inComponent:animated:](v17, "selectRow:inComponent:animated:", [v18 integerValue], 0, 0);
    }
    else
    {
      v17 = HFLogForCategory();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = [(HUQuickControlWheelPickerView *)self selectedRow];
      int v21 = 134217984;
      uint64_t v22 = [v18 integerValue];
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Unable to select row %ld as it exceeds number of rows in component", (uint8_t *)&v21, 0xCu);
    }

    goto LABEL_12;
  }
LABEL_13:
  id v19 = [(HUQuickControlWheelPickerView *)self pickerView];
  id v20 = [MEMORY[0x1E4F428B8] clearColor];
  [v19 _setMagnifierLineColor:v20];
}

- (void)_updateSelectedRowBorderView:(id)a3
{
  id v10 = a3;
  int v4 = [(HUQuickControlWheelPickerView *)self selectedRowSurroundingView];

  if (v4)
  {
    uint64_t v5 = [v10 colorWithAlphaComponent:0.1];
    v6 = [(HUQuickControlWheelPickerView *)self selectedRowSurroundingView];
    [v6 setBackgroundColor:v5];

    uint64_t v7 = [v10 CGColor];
    uint64_t v8 = [(HUQuickControlWheelPickerView *)self selectedRowSurroundingView];
    int v9 = [v8 layer];
    [v9 setBorderColor:v7];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlWheelPickerView;
  -[HUQuickControlWheelPickerView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  double v5 = 0.5;
  if (v3) {
    double v5 = 1.0;
  }
  [(HUQuickControlWheelPickerView *)self setAlpha:v5];
}

- (void)tintColorDidChange
{
  id v4 = [(HUQuickControlWheelPickerView *)self profile];
  BOOL v3 = [v4 tintColor];
  [(HUQuickControlWheelPickerView *)self _updateSelectedRowBorderView:v3];
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(HUQuickControlWheelPickerView *)self profile];
  id v4 = -[HUQuickControlWheelPickerView intrinsicSizeDescriptorForControlSize:](self, "intrinsicSizeDescriptorForControlSize:", [v3 controlSize]);
  [v4 intrinsicSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v121[2] = *MEMORY[0x1E4F143B8];
  v111.receiver = self;
  v111.super_class = (Class)HUQuickControlWheelPickerView;
  [(HUQuickControlWheelPickerView *)&v111 layoutSubviews];
  BOOL v3 = [(HUQuickControlWheelPickerView *)self pickerView];
  uint64_t v4 = [v3 numberOfRowsInComponent:0];

  uint64_t v5 = [(HUQuickControlWheelPickerView *)self selectedRow];
  if (!v5
    || (double v6 = (void *)v5,
        [(HUQuickControlWheelPickerView *)self selectedRow],
        double v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 integerValue],
        v7,
        v6,
        v8 >= v4))
  {
    v72 = HFLogForCategory();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v82 = [(HUQuickControlWheelPickerView *)self selectedRow];
      uint64_t v83 = [v82 integerValue];
      v84 = [(HUQuickControlWheelPickerView *)self items];
      uint64_t v85 = [v84 count];
      *(_DWORD *)buf = 134218496;
      uint64_t v113 = v83;
      __int16 v114 = 2048;
      uint64_t v115 = v4;
      __int16 v116 = 2048;
      uint64_t v117 = v85;
      _os_log_impl(&dword_1BE345000, v72, OS_LOG_TYPE_DEFAULT, "Selected row is %ld but number of rows in component is %ld. Number of wheel picker items is %ld.", buf, 0x20u);
    }
    goto LABEL_14;
  }
  double v9 = [(HUQuickControlWheelPickerView *)self pickerView];
  double v10 = [(HUQuickControlWheelPickerView *)self selectedRow];
  objc_msgSend(v9, "_contentSizeForRow:inComponent:", objc_msgSend(v10, "integerValue"), 0);
  double v12 = v11;
  double v14 = v13;

  v15 = [(HUQuickControlWheelPickerView *)self selectedRowSurroundingView];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;

  id v20 = [(HUQuickControlWheelPickerView *)self selectedRowSurroundingView];
  objc_msgSend(v20, "setFrame:", v17, v19, v12, v14);

  int v21 = [(HUQuickControlWheelPickerView *)self pickerView];
  [v21 center];
  double v23 = v22;
  double v25 = v24;
  v26 = [(HUQuickControlWheelPickerView *)self selectedRowSurroundingView];
  objc_msgSend(v26, "setCenter:", v23, v25);

  v27 = [(HUQuickControlWheelPickerView *)self profile];
  [v27 selectedRowBorderWidth];
  double v29 = v28;
  uint64_t v30 = [(HUQuickControlWheelPickerView *)self selectedRowSurroundingView];
  v31 = [v30 layer];
  [v31 setBorderWidth:v29];

  v32 = [(HUQuickControlWheelPickerView *)self profile];
  [v32 selectedRowCornerRadius];
  double v34 = v33;
  objc_super v35 = [(HUQuickControlWheelPickerView *)self selectedRowSurroundingView];
  v36 = [v35 layer];
  [v36 setCornerRadius:v34];

  v37 = [(HUQuickControlWheelPickerView *)self profile];
  uint64_t v38 = [v37 style];

  if (v38 != 1) {
    goto LABEL_15;
  }
  [(HUQuickControlWheelPickerView *)self bounds];
  double v40 = v39;
  v41 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v42 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v43 = [v42 colorWithAlphaComponent:0.0];

  v44 = [(HUQuickControlWheelPickerView *)self profile];
  if ([v44 sizeToFitTextWidth])
  {
    [(HUQuickControlWheelPickerView *)self maxTextWidth];
    if (v45 > 0.0)
    {
      [(HUQuickControlWheelPickerView *)self maxTextWidth];
      double v12 = v46;
    }
  }

  v47 = [(HUQuickControlWheelPickerView *)self pickerView];
  [v47 frame];
  double v49 = (v48 - v12) * 0.5;

  v50 = [(HUQuickControlWheelPickerView *)self topGradientView];
  objc_msgSend(v50, "setFrame:", v49, 0.0, v12, v40 / 2.5);

  v51 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v52 = [(HUQuickControlWheelPickerView *)self topGradientView];
  [v52 setBackgroundColor:v51];

  v53 = [MEMORY[0x1E4F39BD0] layer];
  v54 = [(HUQuickControlWheelPickerView *)self topGradientView];
  [v54 bounds];
  objc_msgSend(v53, "setFrame:");

  id v55 = v41;
  v121[0] = [v55 CGColor];
  id v56 = v43;
  v121[1] = [v56 CGColor];
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
  [v53 setColors:v57];

  id v58 = objc_alloc(NSNumber);
  LODWORD(v59) = 1058642330;
  v60 = (void *)[v58 initWithFloat:v59];
  v120[0] = v60;
  id v61 = objc_alloc(NSNumber);
  LODWORD(v62) = 1.0;
  v63 = (void *)[v61 initWithFloat:v62];
  v120[1] = v63;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:2];
  [v53 setLocations:v64];

  v65 = [(HUQuickControlWheelPickerView *)self topGradientView];
  v66 = [v65 layer];
  [v66 setMask:v53];

  v67 = [(HUQuickControlWheelPickerView *)self bottomGradientView];
  objc_msgSend(v67, "setFrame:", v49, v40 - v40 / 10.0 + 20.0, v12, v40 / 10.0);

  v68 = [(HUQuickControlWheelPickerView *)self bottomGradientView];
  [v68 setBackgroundColor:v55];

  v69 = [MEMORY[0x1E4F39BD0] layer];
  v70 = [(HUQuickControlWheelPickerView *)self bottomGradientView];
  [v70 bounds];
  objc_msgSend(v69, "setFrame:");

  id v71 = v56;
  v119[0] = [v71 CGColor];
  v72 = v55;
  v119[1] = [v72 CGColor];
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
  [v69 setColors:v73];

  v74 = (void *)[objc_alloc(NSNumber) initWithFloat:0.0];
  v118[0] = v74;
  id v75 = objc_alloc(NSNumber);
  LODWORD(v76) = 1.0;
  v77 = (void *)[v75 initWithFloat:v76];
  v118[1] = v77;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
  [v69 setLocations:v78];

  v79 = [(HUQuickControlWheelPickerView *)self bottomGradientView];
  v80 = [v79 layer];
  [v80 setMask:v69];

  v81 = [MEMORY[0x1E4F69138] sharedInstance];
  if ([v81 hostProcess] == 3)
  {

LABEL_12:
    v88 = [(HUQuickControlWheelPickerView *)self topGradientView];
    [v88 setHidden:1];

    v89 = [(HUQuickControlWheelPickerView *)self bottomGradientView];
    [v89 setHidden:1];

    goto LABEL_13;
  }
  v86 = [MEMORY[0x1E4F69138] sharedInstance];
  uint64_t v87 = [v86 hostProcess];

  if (v87 == 100) {
    goto LABEL_12;
  }
LABEL_13:
  v90 = [(HUQuickControlWheelPickerView *)self selectedRowSurroundingView];
  v91 = [v90 layer];
  [v91 setCornerRadius:v14 * 0.5];

LABEL_14:
LABEL_15:
  v92 = [(HUQuickControlWheelPickerView *)self profile];
  [v92 borderWidth];
  double v94 = v93;
  v95 = [(HUQuickControlWheelPickerView *)self pickerView];
  v96 = [v95 layer];
  [v96 setBorderWidth:v94];

  int v97 = [MEMORY[0x1E4F69758] shouldUseControlCenterMaterials];
  v98 = [(HUQuickControlWheelPickerView *)self profile];
  v99 = [v98 borderColor];
  v100 = v99;
  v101 = v99;
  if (v97)
  {
    v101 = [v99 colorWithAlphaComponent:0.7];
  }
  uint64_t v102 = [v101 CGColor];
  v103 = [(HUQuickControlWheelPickerView *)self pickerView];
  v104 = [v103 layer];
  [v104 setBorderColor:v102];

  if (v97) {
  v105 = [(HUQuickControlWheelPickerView *)self profile];
  }
  [v105 cornerRadius];
  double v107 = v106;
  v108 = [(HUQuickControlWheelPickerView *)self pickerView];
  v109 = [v108 layer];
  [v109 setCornerRadius:v107];

  [(HUQuickControlWheelPickerView *)self _updateUIForReachabilityState:[(HUQuickControlWheelPickerView *)self reachabilityState]];
  v110 = [(HUQuickControlWheelPickerView *)self profile];
  -[HUQuickControlWheelPickerView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", [v110 showOffState] ^ 1);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  double v6 = [NSNumber numberWithInteger:a4];
  [(HUQuickControlWheelPickerView *)self setSelectedRow:v6];

  [(HUQuickControlWheelPickerView *)self _prepareForTapticFeedback];

  [(HUQuickControlWheelPickerView *)self _actuateSelectionTapticFeedback];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v4 = [(HUQuickControlWheelPickerView *)self items];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v8 = a6;
  double v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  double v10 = [(HUQuickControlWheelPickerView *)self items];
  double v11 = [v10 objectAtIndex:a4];

  double v12 = [v11 text];
  double v13 = [(HUQuickControlWheelPickerView *)self profile];
  int v14 = [v13 uppercaseRowTitles];

  if (v14)
  {
    v15 = (void *)[v12 copy];
    uint64_t v16 = [v15 localizedUppercaseString];

    uint64_t v17 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:14.0];

    double v12 = (void *)v16;
    double v9 = (void *)v17;
  }
  objc_opt_class();
  id v18 = v8;
  if (objc_opt_isKindOfClass()) {
    double v19 = v18;
  }
  else {
    double v19 = 0;
  }
  id v20 = v19;

  id v21 = v18;
  if (!v20)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [v21 setTextAlignment:1];
    [v21 setFont:v9];
  }
  [v21 setText:v12];
  double v22 = objc_opt_new();
  [v22 setValue:v9 forKey:*MEMORY[0x1E4F42508]];
  [v12 sizeWithAttributes:v22];
  double v24 = v23;
  [(HUQuickControlWheelPickerView *)self maxTextWidth];
  if (v25 < v24) {
    [(HUQuickControlWheelPickerView *)self setMaxTextWidth:v24];
  }

  return v21;
}

- (void)setProfile:(id)a3
{
  uint64_t v4 = (HUQuickControlWheelPickerViewProfile *)a3;
  unint64_t v5 = [(HUQuickControlViewProfile *)self->_profile controlSize];
  uint64_t v6 = [(HUQuickControlViewProfile *)v4 controlSize];
  profile = self->_profile;
  self->_profile = v4;

  [(HUQuickControlWheelPickerView *)self setNeedsLayout];
  if (v5 != v6)
  {
    [(HUQuickControlWheelPickerView *)self invalidateIntrinsicContentSize];
  }
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  uint64_t v4 = HUQuickControlSliderMetricsForControlSize(a3);
  unint64_t v5 = [v4 sizeDescriptor];
  [v5 intrinsicSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7 * 2.5;
  double v11 = [(HUQuickControlWheelPickerView *)self profile];
  LODWORD(v5) = [v11 sizeToFitTextWidth];

  if (v5)
  {
    [(HUQuickControlWheelPickerView *)self maxTextWidth];
    if (v12 == 0.0)
    {
      double v14 = 150.0;
    }
    else
    {
      [(HUQuickControlWheelPickerView *)self maxTextWidth];
      double v14 = v13 + 60.0;
    }
    double v15 = fmax(v14, 100.0);
    if (v15 < v10) {
      double v10 = v15;
    }
    uint64_t v16 = [(HUQuickControlWheelPickerView *)self profile];
    uint64_t v17 = [v16 style];

    if (v17 == 1) {
      double v9 = v9 * 0.5;
    }
  }

  return +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 2, v10, v9);
}

- (id)value
{
  BOOL v3 = [(HUQuickControlWheelPickerView *)self pickerView];
  uint64_t v4 = [v3 selectedRowInComponent:0];

  unint64_t v5 = [(HUQuickControlWheelPickerView *)self items];
  double v6 = [v5 objectAtIndex:v4];

  return v6;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v7 = v4;
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v7;
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    [(HUQuickControlWheelPickerView *)self setItems:v6];
  }
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlWheelPickerView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 <= 2) {
    [(HUQuickControlWheelPickerView *)self setUserInteractionEnabled:(a3 & 7) == 2];
  }
}

- (void)_prepareForTapticFeedback
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42DD8]);
  [(HUQuickControlWheelPickerView *)self setSelectionFeedbackGenerator:v3];

  id v4 = [(HUQuickControlWheelPickerView *)self selectionFeedbackGenerator];
  [v4 prepare];
}

- (void)_actuateSelectionTapticFeedback
{
  id v3 = [(HUQuickControlWheelPickerView *)self selectionFeedbackGenerator];
  [v3 selectionChanged];

  id v4 = [(HUQuickControlWheelPickerView *)self selectionFeedbackGenerator];
  [v4 prepare];
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

- (HUQuickControlWheelPickerViewProfile)profile
{
  return self->_profile;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
}

- (UIView)topGradientView
{
  return self->_topGradientView;
}

- (void)setTopGradientView:(id)a3
{
}

- (UIView)bottomGradientView
{
  return self->_bottomGradientView;
}

- (void)setBottomGradientView:(id)a3
{
}

- (UIView)selectedRowSurroundingView
{
  return self->_selectedRowSurroundingView;
}

- (void)setSelectedRowSurroundingView:(id)a3
{
}

- (NSNumber)selectedRow
{
  return self->_selectedRow;
}

- (double)maxTextWidth
{
  return self->_maxTextWidth;
}

- (void)setMaxTextWidth:(double)a3
{
  self->_maxTextWidth = a3;
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectedRow, 0);
  objc_storeStrong((id *)&self->_selectedRowSurroundingView, 0);
  objc_storeStrong((id *)&self->_bottomGradientView, 0);
  objc_storeStrong((id *)&self->_topGradientView, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end