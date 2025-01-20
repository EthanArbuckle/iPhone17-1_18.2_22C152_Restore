@interface EKUIEventStatusButtonsView
+ (BOOL)isActionDestructive:(int64_t)a3;
+ (id)_appliesToAllTitleForAction:(int64_t)a3;
+ (id)buttonTitleForAction:(int64_t)a3 orb:(BOOL)a4;
+ (id)imageForAction:(int64_t)a3 selected:(BOOL)a4;
- (BOOL)_shouldCenterButton;
- (BOOL)disableButtonHighlights;
- (BOOL)shouldUseVerticalLayout;
- (EKUIEventStatusButtonsView)initWithFrame:(CGRect)a3 actions:(id)a4 delegate:(id)a5;
- (EKUIEventStatusButtonsView)initWithFrame:(CGRect)a3 actions:(id)a4 delegate:(id)a5 options:(unint64_t)a6;
- (EKUIEventStatusButtonsViewDelegate)delegate;
- (NSArray)actions;
- (UIButton)centerButton;
- (UIButton)leadingButton;
- (UIButton)trailingButton;
- (UIEdgeInsets)buttonsTouchInsets;
- (double)_buttonFontSizeFromDelegate;
- (double)_defaultFontSizeForButtons;
- (double)_minimumFontSize;
- (double)_updateFontFromDelegate;
- (id)_fontWithSize:(double)a3 selected:(BOOL)a4;
- (id)_horizontalConstraintStringForMiddleButtonsStartingAt:(unint64_t)a3 endingAt:(unint64_t)a4 resultingViews:(id)a5;
- (id)_newToolbarButton;
- (id)buttonForAction:(int64_t)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)_actionForButton:(id)a3;
- (int64_t)_buttonIndexForAction:(int64_t)a3;
- (int64_t)selectedAction;
- (int64_t)textSizeMode;
- (void)_appliesToAllButtonTapped:(id)a3;
- (void)_buttonTapped:(id)a3;
- (void)_buttonTappedInternal:(id)a3 appliesToAll:(BOOL)a4;
- (void)_setupButtons;
- (void)_setupConstraints;
- (void)_updateButtonFonts:(id)a3;
- (void)_updateButtonFontsWithOverrideSize:(double)a3;
- (void)_updateButtonFontsWithSize:(double)a3;
- (void)_updateSelectionToButton:(id)a3;
- (void)findPointerInteractionWithButton:(id)a3 actions:(id)a4;
- (void)layoutSubviews;
- (void)setActions:(id)a3;
- (void)setButtonsTouchInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableButtonHighlights:(BOOL)a3;
- (void)setSelectedAction:(int64_t)a3;
- (void)setShouldUseVerticalLayout:(BOOL)a3;
- (void)setTextSizeMode:(int64_t)a3;
- (void)updateConstraints;
- (void)updateForMiniBarState:(BOOL)a3;
@end

@implementation EKUIEventStatusButtonsView

- (EKUIEventStatusButtonsView)initWithFrame:(CGRect)a3 actions:(id)a4 delegate:(id)a5
{
  return -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](self, "initWithFrame:actions:delegate:options:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (EKUIEventStatusButtonsView)initWithFrame:(CGRect)a3 actions:(id)a4 delegate:(id)a5 options:(unint64_t)a6
{
  char v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)EKUIEventStatusButtonsView;
  v16 = -[EKUIEventStatusButtonsView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v15);
    v17->_textSizeMode = 0;
    objc_storeStrong((id *)&v17->_actions, a4);
    v17->_outsideMargin = 0.0;
    v17->_forcesSingleButtonToCenter = v6 & 1;
    v17->_inboxStyle = (v6 & 2) != 0;
    v17->_allowAppliesToAll = (v6 & 4) != 0;
    LODWORD(v18) = 1144750080;
    [(EKUIEventStatusButtonsView *)v17 setContentCompressionResistancePriority:0 forAxis:v18];
    [(EKUIEventStatusButtonsView *)v17 _setupButtons];
  }

  return v17;
}

- (id)_newToolbarButton
{
  v3 = +[CalWideStatusButton buttonWithType:1];
  [v3 addTarget:self action:sel__buttonTapped_ forControlEvents:64];
  v4 = [v3 titleLabel];
  [(EKUIEventStatusButtonsView *)self _buttonFontSizeFromDelegate];
  char v6 = -[EKUIEventStatusButtonsView _fontWithSize:selected:](self, "_fontWithSize:selected:", [v3 isSelected], v5);
  [v4 setFont:v6];

  v7 = [v3 titleLabel];
  [v7 setLineBreakMode:4];

  return v3;
}

- (void)findPointerInteractionWithButton:(id)a3 actions:(id)a4
{
  id v6 = a4;
  v7 = [a3 interactions];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__EKUIEventStatusButtonsView_findPointerInteractionWithButton_actions___block_invoke;
  v9[3] = &unk_1E6087C00;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __71__EKUIEventStatusButtonsView_findPointerInteractionWithButton_actions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = v11;
  if (isKindOfClass)
  {
    id v8 = v11;
    v9 = [v8 delegate];
    id v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      *a4 = 1;
    }

    v7 = v11;
  }
}

- (void)_setupButtons
{
  v54[2] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSArray *)self->_actions count];
  buttons = self->_buttons;
  if (buttons)
  {
    double v5 = (void *)[(NSArray *)buttons mutableCopy];
  }
  else
  {
    double v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  }
  id obj = v5;
  NSUInteger v38 = v3;
  unint64_t v39 = objc_msgSend(v5, "count", &self->_buttons);
  if (v3)
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [(NSArray *)self->_actions objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 integerValue];

      if (v6 >= v39)
      {
        id v9 = [(EKUIEventStatusButtonsView *)self _newToolbarButton];
        [obj addObject:v9];
        [(EKUIEventStatusButtonsView *)self addSubview:v9];
      }
      else
      {
        id v9 = [obj objectAtIndexedSubscript:v6];
      }
      [v9 setSelected:0];
      id v10 = [(id)objc_opt_class() buttonTitleForAction:v8 orb:0];
      [v9 setTitle:v10 forState:0];
      [v9 setTag:v8];
      uint64_t v11 = [(id)objc_opt_class() _appliesToAllTitleForAction:v8];
      v12 = (void *)v11;
      if (self->_allowAppliesToAll && v11)
      {
        objc_initWeak(&location, self);
        objc_initWeak(&from, v9);
        v13 = (void *)MEMORY[0x1E4FB1970];
        id v14 = (void *)MEMORY[0x1E4FB13F0];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __43__EKUIEventStatusButtonsView__setupButtons__block_invoke;
        v50[3] = &unk_1E6087C28;
        objc_copyWeak(&v51, &location);
        objc_copyWeak(&v52, &from);
        id v15 = [v14 actionWithTitle:v10 image:0 identifier:0 handler:v50];
        v54[0] = v15;
        v16 = (void *)MEMORY[0x1E4FB13F0];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_2;
        v47[3] = &unk_1E6087C28;
        objc_copyWeak(&v48, &location);
        objc_copyWeak(&v49, &from);
        v17 = [v16 actionWithTitle:v12 image:0 identifier:0 handler:v47];
        v54[1] = v17;
        double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
        v19 = [v13 menuWithChildren:v18];
        [v9 setMenu:v19];

        objc_destroyWeak(&v49);
        objc_destroyWeak(&v48);
        objc_destroyWeak(&v52);
        objc_destroyWeak(&v51);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
      objc_super v20 = [MEMORY[0x1E4FB1618] whiteColor];
      [v9 setTitleColor:v20 forState:4];

      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v21) = 1148829696;
      [v9 setContentCompressionResistancePriority:0 forAxis:v21];
      LODWORD(v22) = 1148846080;
      [v9 setContentCompressionResistancePriority:1 forAxis:v22];
      if ([(EKUIEventStatusButtonsView *)self shouldUseVerticalLayout]) {
        uint64_t v23 = 4;
      }
      else {
        uint64_t v23 = 0;
      }
      [v9 setContentHorizontalAlignment:v23];
      LODWORD(v24) = 1144750080;
      [v9 setContentHuggingPriority:1 forAxis:v24];
      v25 = [v9 titleLabel];
      LODWORD(v26) = 1148846080;
      [v25 setContentHuggingPriority:1 forAxis:v26];

      LODWORD(v27) = 1148846080;
      [v9 setContentHuggingPriority:0 forAxis:v27];
      v28 = [v9 titleLabel];
      LODWORD(v29) = 1148846080;
      [v28 setContentHuggingPriority:0 forAxis:v29];

      ++v6;
    }
    while (v38 != v6);
  }
  v30 = (void *)[obj copy];
  if (v38 < v39)
  {
    NSUInteger v31 = v38;
    do
    {
      v32 = [v30 objectAtIndexedSubscript:v31];
      [v32 removeFromSuperview];
      [obj removeObject:v32];

      ++v31;
    }
    while (v39 != v31);
  }
  objc_storeStrong(v37, obj);
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_buttonsTouchInsets.top, *MEMORY[0x1E4FB2848]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_buttonsTouchInsets.bottom, *(float64x2_t *)(MEMORY[0x1E4FB2848] + 16)))), 0xFuLL))))-[EKUIEventStatusButtonsView setButtonsTouchInsets:](self, "setButtonsTouchInsets:", -10.0, -10.0, -10.0, -10.0); {
  if (v38 != v39)
  }
    [(EKUIEventStatusButtonsView *)self _setupConstraints];
  BOOL v33 = [(EKUIEventStatusButtonsView *)self _shouldCenterButton];
  id v34 = *v37;
  if (v33)
  {
    v35 = [v34 firstObject];
    id location = 0;
    p_id location = &location;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_3;
    v42[3] = &unk_1E6087C50;
    v42[4] = &location;
    [(EKUIEventStatusButtonsView *)self findPointerInteractionWithButton:v35 actions:v42];
    if (!*((unsigned char *)p_location + 24))
    {
      v36 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
      [v35 addInteraction:v36];
    }
    _Block_object_dispose(&location, 8);
  }
  else
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_4;
    v41[3] = &unk_1E6087CA0;
    v41[4] = self;
    [v34 enumerateObjectsUsingBlock:v41];
  }
  [(EKUIEventStatusButtonsView *)self setNeedsLayout];
}

void __43__EKUIEventStatusButtonsView__setupButtons__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _buttonTapped:v2];
}

void __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _appliesToAllButtonTapped:v2];
}

uint64_t __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_5;
  v6[3] = &unk_1E6087C78;
  id v7 = v3;
  id v5 = v3;
  [v4 findPointerInteractionWithButton:v5 actions:v6];
}

uint64_t __43__EKUIEventStatusButtonsView__setupButtons__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeInteraction:a2];
}

- (void)_setupConstraints
{
  id v2 = self;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F28000uLL;
  if ([(NSArray *)self->_currentConstraints count])
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v2->_currentConstraints];
    currentConstraints = v2->_currentConstraints;
    v2->_currentConstraints = 0;
  }
  uint64_t v5 = [(NSArray *)v2->_buttons count];
  if (v2->_buttons) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    unint64_t v7 = v5;
    uint64_t v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(EKUIEventStatusButtonsView *)v2 _shouldCenterButton])
    {
      id v9 = [(NSArray *)v2->_buttons firstObject];
      id v10 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v11 = _NSDictionaryOfVariableBindings(&cfstr_Button.isa, v9, 0);
      v12 = [v10 constraintsWithVisualFormat:@"H:|[button]" options:0 metrics:0 views:v11];
      uint64_t v13 = [v12 firstObject];
      leadingMarginConstraint = v2->_leadingMarginConstraint;
      v2->_leadingMarginConstraint = (NSLayoutConstraint *)v13;

      [(NSArray *)v8 addObject:v2->_leadingMarginConstraint];
      id v15 = (void *)MEMORY[0x1E4F28DC8];
      v16 = _NSDictionaryOfVariableBindings(&cfstr_Button.isa, v9, 0);
      v17 = [v15 constraintsWithVisualFormat:@"H:[button]|" options:0 metrics:0 views:v16];
      uint64_t v18 = [v17 firstObject];
      trailingMarginConstraint = v2->_trailingMarginConstraint;
      v2->_trailingMarginConstraint = (NSLayoutConstraint *)v18;

      [(NSArray *)v8 addObject:v2->_trailingMarginConstraint];
      objc_super v20 = (void *)MEMORY[0x1E4F28DC8];
      double v21 = _NSDictionaryOfVariableBindings(&cfstr_Button.isa, v9, 0);
      double v22 = [v20 constraintsWithVisualFormat:@"V:|[button]|" options:0 metrics:0 views:v21];
      [(NSArray *)v8 addObjectsFromArray:v22];
    }
    else
    {
      if (v7 != 1)
      {
        BOOL v36 = [(EKUIEventStatusButtonsView *)v2 shouldUseVerticalLayout];
        v37 = [(NSArray *)v2->_buttons firstObject];
        uint64_t v38 = [(NSArray *)v2->_buttons lastObject];
        unint64_t v39 = (void *)MEMORY[0x1E4F28DC8];
        v94 = v2;
        v92 = (void *)v38;
        if (v36)
        {
          v40 = (void *)v38;
          id firstValue = v37;
          v41 = _NSDictionaryOfVariableBindings(&cfstr_Topbutton.isa, v37, 0);
          v42 = [v39 constraintsWithVisualFormat:@"V:|[topButton]" options:0 metrics:0 views:v41];
          [(NSArray *)v8 addObjectsFromArray:v42];

          v43 = (void *)MEMORY[0x1E4F28DC8];
          v44 = _NSDictionaryOfVariableBindings(&cfstr_Bottombutton.isa, v40, 0);
          uint64_t v45 = [v43 constraintsWithVisualFormat:@"V:[bottomButton]|" options:0 metrics:0 views:v44];
          [(NSArray *)v8 addObjectsFromArray:v45];

          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id obj = v2->_buttons;
          uint64_t v46 = [(NSArray *)obj countByEnumeratingWithState:&v95 objects:v105 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            id v48 = 0;
            uint64_t v49 = *(void *)v96;
            do
            {
              uint64_t v50 = 0;
              id v51 = v48;
              do
              {
                if (*(void *)v96 != v49) {
                  objc_enumerationMutation(obj);
                }
                id v52 = *(void **)(*((void *)&v95 + 1) + 8 * v50);
                v53 = [*(id *)(v3 + 3528) constraintWithItem:v52 attribute:5 relatedBy:0 toItem:v2 attribute:5 multiplier:1.0 constant:0.0];
                [(NSArray *)v8 addObject:v53];

                v54 = [*(id *)(v3 + 3528) constraintWithItem:v2 attribute:6 relatedBy:1 toItem:v52 attribute:6 multiplier:1.0 constant:0.0];
                [(NSArray *)v8 addObject:v54];

                if (v51)
                {
                  v55 = [v52 firstBaselineAnchor];
                  v56 = [v51 lastBaselineAnchor];
                  v57 = [v55 constraintEqualToSystemSpacingBelowAnchor:v56 multiplier:1.0];

                  LODWORD(v58) = 1144750080;
                  [v57 setPriority:v58];
                  [(NSArray *)v8 addObject:v57];
                  v59 = [v52 firstBaselineAnchor];
                  v60 = [v51 lastBaselineAnchor];
                  v61 = [v59 constraintGreaterThanOrEqualToAnchor:v60 constant:40.0];
                  [(NSArray *)v8 addObject:v61];

                  id v2 = v94;
                  unint64_t v3 = 0x1E4F28000;
                }
                id v48 = v52;

                ++v50;
                id v51 = v48;
              }
              while (v47 != v50);
              uint64_t v47 = [(NSArray *)obj countByEnumeratingWithState:&v95 objects:v105 count:16];
            }
            while (v47);
          }
          else
          {
            id v48 = 0;
          }
        }
        else
        {
          v62 = _NSDictionaryOfVariableBindings(&cfstr_Leadingbutton.isa, v37, 0);
          v63 = [v39 constraintsWithVisualFormat:@"V:|[leadingButton]|" options:0 metrics:0 views:v62];
          [(NSArray *)v8 addObjectsFromArray:v63];

          if (v7 < 3)
          {
            v78 = (void *)MEMORY[0x1E4F28DC8];
            v79 = v92;
            if (v2->_inboxStyle)
            {
              v69 = [MEMORY[0x1E4F28DC8] constraintWithItem:v92 attribute:9 relatedBy:0 toItem:v2 attribute:9 multiplier:1.0 constant:0.0];
              LODWORD(v80) = 1144750080;
              [v69 setPriority:v80];
              [(NSArray *)v8 addObject:v69];
              v81 = (void *)MEMORY[0x1E4F28DC8];
              v70 = _NSDictionaryOfVariableBindings(&cfstr_LeadingbuttonT_1.isa, v37, v92, 0);
              v82 = [v81 constraintsWithVisualFormat:@"H:|[leadingButton]-(>=minInboxStylePadding)-[trailingButton]" options:24 metrics:&unk_1F0D03D58 views:v70];
              [(NSArray *)v8 addObjectsFromArray:v82];
            }
            else
            {
              v69 = _NSDictionaryOfVariableBindings(&cfstr_LeadingbuttonT_1.isa, v37, v92, 0);
              v70 = [v78 constraintsWithVisualFormat:@"H:|-(==minPadding)-[leadingButton]-(>=minPadding)-[trailingButton]-(==minPadding)-|" options:24 metrics:&unk_1F0D03D58 views:v69];
              [(NSArray *)v8 addObjectsFromArray:v70];
            }
          }
          else
          {
            uint64_t v64 = [MEMORY[0x1E4F28DC8] constraintWithItem:v37 attribute:5 relatedBy:0 toItem:v2 attribute:5 multiplier:1.0 constant:0.0];
            v65 = v2->_leadingMarginConstraint;
            v2->_leadingMarginConstraint = (NSLayoutConstraint *)v64;

            [(NSArray *)v8 addObject:v2->_leadingMarginConstraint];
            uint64_t v66 = [MEMORY[0x1E4F28DC8] constraintWithItem:v92 attribute:6 relatedBy:0 toItem:v2 attribute:6 multiplier:1.0 constant:0.0];
            v67 = v2->_trailingMarginConstraint;
            v2->_trailingMarginConstraint = (NSLayoutConstraint *)v66;

            [(NSArray *)v8 addObject:v2->_trailingMarginConstraint];
            unint64_t v68 = v7 - 2;
            v69 = [(NSArray *)v2->_buttons objectAtIndexedSubscript:1];
            v70 = [(NSArray *)v2->_buttons objectAtIndexedSubscript:v68];
            v71 = (void *)MEMORY[0x1E4F28DC8];
            v72 = _NSDictionaryOfVariableBindings(&cfstr_Firstmiddlebut.isa, v69, 0);
            v73 = [v71 constraintsWithVisualFormat:@"V:|[firstMiddleButton]|" options:0 metrics:&unk_1F0D03D58 views:v72];
            [(NSArray *)v8 addObjectsFromArray:v73];

            if (v2->_inboxStyle)
            {
              v74 = [MEMORY[0x1E4F28DC8] constraintWithItem:v69 attribute:9 relatedBy:0 toItem:v2 attribute:9 multiplier:1.0 constant:0.0];
              [(NSArray *)v8 addObject:v74];

              v75 = (void *)MEMORY[0x1E4F28DC8];
              _NSDictionaryOfVariableBindings(&cfstr_LeadingbuttonT.isa, v37, v92, v69, 0);
              id v76 = (id)objc_claimAutoreleasedReturnValue();
              [v75 constraintsWithVisualFormat:@"H:|[leadingButton]-(>=minInboxStylePadding)-[firstMiddleButton]-(>=minInboxStylePadding)-[trailingButton]|" options:2048 metrics:&unk_1F0D03D58 views:v76];
              id v77 = (id)objc_claimAutoreleasedReturnValue();
              [(NSArray *)v8 addObjectsFromArray:v77];
            }
            else
            {
              id v76 = objc_alloc_init(MEMORY[0x1E4FB1940]);
              [(EKUIEventStatusButtonsView *)v2 addLayoutGuide:v76];
              v83 = [MEMORY[0x1E4F28DC8] constraintWithItem:v76 attribute:9 relatedBy:0 toItem:v2 attribute:9 multiplier:1.0 constant:0.0];
              [(NSArray *)v8 addObject:v83];

              v84 = (void *)MEMORY[0x1E4F28DC8];
              v85 = _NSDictionaryOfVariableBindings(&cfstr_LeadingbuttonT_0.isa, v37, v92, v76, 0);
              v86 = [v84 constraintsWithVisualFormat:@"H:[leadingButton]-(>=minPadding)-[centerGuide]-(>=minPadding)-[trailingButton]" options:24 metrics:&unk_1F0D03D58 views:v85];
              [(NSArray *)v8 addObjectsFromArray:v86];

              id v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              v87 = [(EKUIEventStatusButtonsView *)v2 _horizontalConstraintStringForMiddleButtonsStartingAt:1 endingAt:v68 resultingViews:v77];
              v88 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v87 options:24 metrics:&unk_1F0D03D58 views:v77];
              [(NSArray *)v8 addObjectsFromArray:v88];

              v89 = [MEMORY[0x1E4F28DC8] constraintWithItem:v69 attribute:5 relatedBy:0 toItem:v76 attribute:5 multiplier:1.0 constant:0.0];
              [(NSArray *)v8 addObject:v89];

              v90 = [MEMORY[0x1E4F28DC8] constraintWithItem:v70 attribute:6 relatedBy:0 toItem:v76 attribute:6 multiplier:1.0 constant:0.0];
              [(NSArray *)v8 addObject:v90];
            }
            v79 = v92;
          }
        }
        goto LABEL_12;
      }
      id v9 = [(NSArray *)v2->_buttons firstObject];
      uint64_t v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:5 relatedBy:0 toItem:v2 attribute:5 multiplier:1.0 constant:0.0];
      double v24 = v2->_leadingMarginConstraint;
      v2->_leadingMarginConstraint = (NSLayoutConstraint *)v23;

      [(NSArray *)v8 addObject:v2->_leadingMarginConstraint];
      v25 = v2->_trailingMarginConstraint;
      v2->_trailingMarginConstraint = 0;

      double v26 = [(EKUIEventStatusButtonsView *)v2 trailingAnchor];
      double v27 = [v9 trailingAnchor];
      v28 = [v26 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v27 multiplier:1.0];
      [(NSArray *)v8 addObject:v28];

      double v29 = (void *)MEMORY[0x1E4F28DC8];
      v30 = _NSDictionaryOfVariableBindings(&cfstr_Theonlybutton.isa, v9, 0);
      NSUInteger v31 = [v29 constraintsWithVisualFormat:@"V:|[theOnlyButton]|" options:0 metrics:0 views:v30];
      [(NSArray *)v8 addObjectsFromArray:v31];
    }
LABEL_12:
    v32 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      BOOL v33 = v32;
      id v34 = [(EKUIEventStatusButtonsView *)v2 delegate];
      *(_DWORD *)buf = 136315650;
      v100 = "-[EKUIEventStatusButtonsView _setupConstraints]";
      __int16 v101 = 2112;
      v102 = v8;
      __int16 v103 = 2112;
      v104 = v34;
      _os_log_impl(&dword_1B3F4C000, v33, OS_LOG_TYPE_DEBUG, "%s: Activating constraints [%@] for status button view with delegate [%@]", buf, 0x20u);
    }
    [MEMORY[0x1E4F28DC8] activateConstraints:v8];
    v35 = v2->_currentConstraints;
    v2->_currentConstraints = v8;
  }
}

- (id)_horizontalConstraintStringForMiddleButtonsStartingAt:(unint64_t)a3 endingAt:(unint64_t)a4 resultingViews:(id)a5
{
  id v8 = a5;
  if (a3 > a4)
  {
    id v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = 0;
      id v10 = "endIndex was greater than startIndex when trying to generate the constraint string for the event status buttons";
      uint64_t v11 = (uint8_t *)&v17;
LABEL_12:
      _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if ([(NSArray *)self->_buttons count] <= a4)
  {
    id v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v10 = "endIndex was greater than the number of buttons when trying to generate the constraint string for the event status buttons";
      uint64_t v11 = buf;
      goto LABEL_12;
    }
LABEL_13:
    v12 = &stru_1F0CC2140;
    goto LABEL_14;
  }
  v12 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"H:"];
  do
  {
    uint64_t v13 = [(NSArray *)self->_buttons objectAtIndexedSubscript:a3];
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"button%lu", a3);
    [v8 setObject:v13 forKey:v14];
    [(__CFString *)v12 appendFormat:@"[%@]", v14];
    if (a4 != a3) {
      [(__CFString *)v12 appendString:@"-(>=minPadding)-"];
    }

    ++a3;
  }
  while (a3 <= a4);
LABEL_14:

  return v12;
}

- (void)_buttonTapped:(id)a3
{
}

- (void)_appliesToAllButtonTapped:(id)a3
{
}

- (void)_buttonTappedInternal:(id)a3 appliesToAll:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSArray *)self->_buttons indexOfObject:v6] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(EKUIEventStatusButtonsView *)self setSelectedAction:[(EKUIEventStatusButtonsView *)self _actionForButton:v6]];
    unint64_t v7 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSNumber;
      id v9 = v7;
      id v10 = objc_msgSend(v8, "numberWithInteger:", -[EKUIEventStatusButtonsView selectedAction](self, "selectedAction"));
      uint64_t v11 = [NSNumber numberWithBool:v4];
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      __int16 v17 = 2114;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_DEFAULT, "Selected action: [%{public}@], appliesToAll: %{public}@.", buf, 0x16u);
    }
    v12 = [(EKUIEventStatusButtonsView *)self delegate];
    int64_t v13 = [(EKUIEventStatusButtonsView *)self selectedAction];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__EKUIEventStatusButtonsView__buttonTappedInternal_appliesToAll___block_invoke;
    v14[3] = &unk_1E6087570;
    v14[4] = self;
    [v12 eventStatusButtonsView:self didSelectAction:v13 appliesToAll:v4 ifCancelled:v14];
  }
}

uint64_t __65__EKUIEventStatusButtonsView__buttonTappedInternal_appliesToAll___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedAction:0];
}

- (void)_updateSelectionToButton:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(EKUIEventStatusButtonsView *)self disableButtonHighlights])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_buttons;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(id *)(*((void *)&v12 + 1) + 8 * v9);
          if (v10 == v4)
          {
            id v10 = v4;
            uint64_t v11 = 1;
          }
          else
          {
            uint64_t v11 = 0;
          }
          objc_msgSend(v10, "setSelected:", v11, (void)v12);
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (int64_t)_actionForButton:(id)a3
{
  return [a3 tag];
}

- (int64_t)_buttonIndexForAction:(int64_t)a3
{
  if (![(NSArray *)self->_buttons count]) {
    return -1;
  }
  int64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = [(NSArray *)self->_buttons objectAtIndexedSubscript:v5];
    uint64_t v7 = [v6 tag];

    if (v7 == a3) {
      break;
    }
    if (++v5 >= [(NSArray *)self->_buttons count]) {
      return -1;
    }
  }
  return v5;
}

- (id)buttonForAction:(int64_t)a3
{
  int64_t v4 = [(EKUIEventStatusButtonsView *)self _buttonIndexForAction:a3];
  if (v4 < 0)
  {
    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = [(NSArray *)self->_buttons objectAtIndexedSubscript:v4];
  }

  return v5;
}

+ (id)buttonTitleForAction:(int64_t)a3 orb:(BOOL)a4
{
  int64_t v5 = 0;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 > 1023)
  {
    if (a3 >= 0x8000)
    {
      if (a3 >= 0x40000)
      {
        switch(a3)
        {
          case 0x40000:
            uint64_t v6 = EventKitUIBundle();
            uint64_t v7 = v6;
            uint64_t v8 = @"Unsubscribe from This Calendar";
            goto LABEL_45;
          case 0x80000:
            uint64_t v6 = EventKitUIBundle();
            uint64_t v7 = v6;
            uint64_t v8 = @"Delete Reminder";
            goto LABEL_45;
          case 0x100000:
            uint64_t v6 = EventKitUIBundle();
            uint64_t v7 = v6;
            uint64_t v8 = @"Remove Event";
            goto LABEL_45;
        }
        goto LABEL_50;
      }
      if (a3 == 0x8000)
      {
        uint64_t v6 = EventKitUIBundle();
        uint64_t v7 = v6;
        uint64_t v8 = @"Cancel Proposed Time";
        goto LABEL_45;
      }
      if (a3 == 0x10000)
      {
        uint64_t v6 = EventKitUIBundle();
        uint64_t v7 = v6;
        uint64_t v8 = @"Report Junk";
        goto LABEL_45;
      }
      if (a3 != 0x20000) {
        goto LABEL_50;
      }
      uint64_t v6 = EventKitUIBundle();
      uint64_t v7 = v6;
      uint64_t v8 = @"DeclineSharedCalendar";
      uint64_t v9 = @"Decline";
    }
    else
    {
      if (a3 <= 4095)
      {
        switch(a3)
        {
          case 1024:
            uint64_t v6 = EventKitUIBundle();
            uint64_t v7 = v6;
            uint64_t v8 = @"View Event";
            goto LABEL_45;
          case 1792:
            goto LABEL_47;
          case 2048:
            uint64_t v6 = EventKitUIBundle();
            uint64_t v7 = v6;
            uint64_t v8 = @"Update Event";
LABEL_45:
            uint64_t v9 = &stru_1F0CC2140;
            goto LABEL_46;
        }
LABEL_50:
        uint64_t v11 = (void *)kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          long long v12 = NSNumber;
          long long v13 = v11;
          long long v14 = [v12 numberWithInteger:a3];
          int v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_1B3F4C000, v13, OS_LOG_TYPE_ERROR, "invalid action passed to buttonTitleForAction: %@", (uint8_t *)&v15, 0xCu);
        }
        int64_t v5 = 0;
        goto LABEL_47;
      }
      if (a3 == 4096)
      {
LABEL_32:
        uint64_t v6 = EventKitUIBundle();
        uint64_t v7 = v6;
        uint64_t v8 = @"Accept";
        goto LABEL_45;
      }
      if (a3 != 0x2000)
      {
        if (a3 == 0x4000)
        {
          uint64_t v6 = EventKitUIBundle();
          uint64_t v7 = v6;
          uint64_t v8 = @"Reply";
          goto LABEL_45;
        }
        goto LABEL_50;
      }
      uint64_t v6 = EventKitUIBundle();
      uint64_t v7 = v6;
      uint64_t v8 = @"Ignore Proposed Time";
      uint64_t v9 = @"Ignore";
    }
LABEL_46:
    int64_t v5 = [v6 localizedStringForKey:v8 value:v9 table:0];

    goto LABEL_47;
  }
  if (a3 > 31)
  {
    if (a3 <= 127)
    {
      if (a3 == 32)
      {
        uint64_t v6 = EventKitUIBundle();
        uint64_t v7 = v6;
        uint64_t v8 = @"OK";
        goto LABEL_45;
      }
      if (a3 == 64)
      {
        uint64_t v6 = EventKitUIBundle();
        uint64_t v7 = v6;
        uint64_t v8 = @"Join Calendar";
        goto LABEL_45;
      }
    }
    else
    {
      switch(a3)
      {
        case 128:
          uint64_t v6 = EventKitUIBundle();
          uint64_t v7 = v6;
          uint64_t v8 = @"Ignore";
          goto LABEL_45;
        case 256:
          uint64_t v6 = EventKitUIBundle();
          uint64_t v7 = v6;
          uint64_t v8 = @"View Comment";
          goto LABEL_45;
        case 512:
          uint64_t v6 = EventKitUIBundle();
          uint64_t v7 = v6;
          uint64_t v8 = @"View Comments";
          goto LABEL_45;
      }
    }
    goto LABEL_50;
  }
  switch(a3)
  {
    case 0:
    case 7:
      break;
    case 1:
      goto LABEL_32;
    case 2:
      uint64_t v6 = EventKitUIBundle();
      uint64_t v7 = v6;
      uint64_t v8 = @"Maybe";
      goto LABEL_45;
    case 4:
      uint64_t v6 = EventKitUIBundle();
      uint64_t v7 = v6;
      uint64_t v8 = @"Decline";
      uint64_t v9 = @"Decline";
      goto LABEL_46;
    case 8:
      uint64_t v6 = EventKitUIBundle();
      uint64_t v7 = v6;
      uint64_t v8 = @"Add To Calendar";
      goto LABEL_45;
    case 16:
      uint64_t v6 = EventKitUIBundle();
      uint64_t v7 = v6;
      uint64_t v8 = @"Delete Event";
      goto LABEL_45;
    default:
      goto LABEL_50;
  }
LABEL_47:

  return v5;
}

+ (id)_appliesToAllTitleForAction:(int64_t)a3
{
  int64_t v4 = 0;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 > 1023)
  {
    if (a3 >= 0x8000)
    {
      if (a3 >= 0x40000)
      {
        if (a3 == 0x40000 || a3 == 0x80000 || a3 == 0x100000) {
          goto LABEL_41;
        }
      }
      else if (a3 == 0x8000 || a3 == 0x10000 || a3 == 0x20000)
      {
        goto LABEL_41;
      }
    }
    else if (a3 > 4095)
    {
      if (a3 == 4096 || a3 == 0x2000 || a3 == 0x4000) {
        goto LABEL_41;
      }
    }
    else if (a3 == 1024 || a3 == 1792 || a3 == 2048)
    {
      goto LABEL_41;
    }
    goto LABEL_31;
  }
  if (a3 <= 31)
  {
    switch(a3)
    {
      case 0:
      case 7:
      case 8:
        goto LABEL_41;
      case 1:
        int64_t v5 = EventKitUIBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"Accept All";
        goto LABEL_39;
      case 2:
        int64_t v5 = EventKitUIBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"Maybe All";
        goto LABEL_39;
      case 4:
        int64_t v5 = EventKitUIBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"Decline All";
        goto LABEL_39;
      case 16:
        int64_t v5 = EventKitUIBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"Delete All - inbox button";
        long long v12 = @"Delete All";
        goto LABEL_40;
      default:
        goto LABEL_31;
    }
    goto LABEL_41;
  }
  if (a3 <= 127)
  {
    if (a3 != 32)
    {
      if (a3 == 64) {
        goto LABEL_41;
      }
LABEL_31:
      uint64_t v8 = (void *)kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = NSNumber;
        id v10 = v8;
        uint64_t v11 = [v9 numberWithInteger:a3];
        int v14 = 138412290;
        int v15 = v11;
        _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_ERROR, "invalid action passed to buttonTitleForAction: %@", (uint8_t *)&v14, 0xCu);
      }
      int64_t v4 = 0;
      goto LABEL_41;
    }
    int64_t v5 = EventKitUIBundle();
    uint64_t v6 = v5;
    uint64_t v7 = @"OK All";
  }
  else
  {
    if (a3 != 128)
    {
      if (a3 == 256 || a3 == 512) {
        goto LABEL_41;
      }
      goto LABEL_31;
    }
    int64_t v5 = EventKitUIBundle();
    uint64_t v6 = v5;
    uint64_t v7 = @"Ignore All";
  }
LABEL_39:
  long long v12 = &stru_1F0CC2140;
LABEL_40:
  int64_t v4 = [v5 localizedStringForKey:v7 value:v12 table:0];

LABEL_41:

  return v4;
}

+ (id)imageForAction:(int64_t)a3 selected:(BOOL)a4
{
  int64_t v5 = 0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 > 1023)
  {
    if (a3 >= 0x8000)
    {
      if (a3 >= 0x40000)
      {
        if (a3 != 0x40000 && a3 != 0x80000 && a3 != 0x100000) {
          goto LABEL_40;
        }
LABEL_30:
        uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
        uint64_t v7 = @"trash";
LABEL_45:
        int64_t v5 = [v6 systemImageNamed:v7];
        goto LABEL_46;
      }
      if (a3 != 0x8000)
      {
        if (a3 == 0x10000)
        {
          uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
          uint64_t v7 = @"bin.xmark";
          goto LABEL_45;
        }
        if (a3 == 0x20000)
        {
LABEL_16:
          uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
          if (a4) {
            uint64_t v7 = @"xmark.circle.fill";
          }
          else {
            uint64_t v7 = @"xmark.circle";
          }
          goto LABEL_45;
        }
        goto LABEL_40;
      }
    }
    else
    {
      if (a3 <= 4095)
      {
        if (a3 == 1024 || a3 == 1792) {
          goto LABEL_46;
        }
        if (a3 != 2048) {
          goto LABEL_40;
        }
        uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
        uint64_t v7 = @"square.and.arrow.down";
        goto LABEL_45;
      }
      if (a3 == 4096) {
        goto LABEL_34;
      }
      if (a3 != 0x2000)
      {
        if (a3 == 0x4000) {
          goto LABEL_46;
        }
        goto LABEL_40;
      }
    }
LABEL_31:
    uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v7 = @"xmark";
    goto LABEL_45;
  }
  if (a3 > 31)
  {
    if (a3 > 127)
    {
      if (a3 != 128)
      {
        if (a3 == 256 || a3 == 512) {
          goto LABEL_46;
        }
        goto LABEL_40;
      }
      goto LABEL_31;
    }
    if (a3 == 32 || a3 == 64)
    {
LABEL_34:
      uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v7 = @"checkmark";
      goto LABEL_45;
    }
LABEL_40:
    uint64_t v8 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = NSNumber;
      id v10 = v8;
      uint64_t v11 = [v9 numberWithInteger:a3];
      int v13 = 138412290;
      int v14 = v11;
      _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_ERROR, "invalid action passed to imageForAction: %@", (uint8_t *)&v13, 0xCu);
    }
    int64_t v5 = 0;
    goto LABEL_46;
  }
  switch(a3)
  {
    case 0:
    case 7:
      break;
    case 1:
      uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
      if (a4) {
        uint64_t v7 = @"checkmark.circle.fill";
      }
      else {
        uint64_t v7 = @"checkmark.circle";
      }
      goto LABEL_45;
    case 2:
      uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
      if (a4) {
        uint64_t v7 = @"questionmark.circle.fill";
      }
      else {
        uint64_t v7 = @"questionmark.circle";
      }
      goto LABEL_45;
    case 4:
      goto LABEL_16;
    case 8:
      uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v7 = @"plus";
      goto LABEL_45;
    case 16:
      goto LABEL_30;
    default:
      goto LABEL_40;
  }
LABEL_46:

  return v5;
}

+ (BOOL)isActionDestructive:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  LOBYTE(v4) = 1;
  if (a3 > 1023)
  {
    if (a3 >= 0x8000)
    {
      if (a3 >= 0x40000)
      {
        if (a3 == 0x40000 || a3 == 0x80000 || a3 == 0x100000) {
          return v4;
        }
      }
      else
      {
        if (a3 == 0x8000 || a3 == 0x10000) {
          return v4;
        }
        if (a3 == 0x20000) {
          goto LABEL_27;
        }
      }
    }
    else if (a3 > 4095)
    {
      if (a3 == 4096 || a3 == 0x2000 || a3 == 0x4000) {
        goto LABEL_27;
      }
    }
    else if (a3 == 1024 || a3 == 1792 || a3 == 2048)
    {
      goto LABEL_27;
    }
  }
  else if (a3 <= 127)
  {
    if ((unint64_t)(a3 - 4) <= 0x3C)
    {
      if (((1 << (a3 - 4)) & 0x1000000010000019) != 0) {
        goto LABEL_27;
      }
      if (a3 == 16) {
        return v4;
      }
    }
    if ((unint64_t)a3 < 3) {
      goto LABEL_27;
    }
  }
  else
  {
    if (a3 == 128) {
      return v4;
    }
    if (a3 == 256 || a3 == 512) {
      goto LABEL_27;
    }
  }
  int64_t v5 = (void *)kEKUILogHandle;
  BOOL v4 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    uint64_t v6 = NSNumber;
    uint64_t v7 = v5;
    uint64_t v8 = [v6 numberWithInteger:a3];
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "invalid action passed to isActionDestructive: %@", (uint8_t *)&v10, 0xCu);

LABEL_27:
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  buttons = self->_buttons;
  id v6 = a4;
  uint64_t v7 = [(NSArray *)buttons firstObject];
  uint64_t v8 = [v7 titleLabel];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  [v6 location];
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v25.origin.double x = v10;
  v25.origin.double y = v12;
  v25.size.double width = v14;
  v25.size.double height = v16;
  v24.double x = v18;
  v24.double y = v20;
  if (CGRectContainsPoint(v25, v24))
  {
    double v21 = objc_msgSend(MEMORY[0x1E4FB1AD8], "regionWithRect:identifier:", 0, v10, v12, v14, v16);
  }
  else
  {
    double v21 = 0;
  }

  return v21;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  BOOL v4 = [(NSArray *)self->_buttons firstObject];
  int64_t v5 = [v4 titleLabel];
  [v5 frame];
  CGRect v17 = CGRectInset(v16, -6.0, -6.0);
  double x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double height = v17.size.height;
  double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v5];
  double v11 = [MEMORY[0x1E4FB1AB0] effectWithPreview:v10];
  double v12 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:", x, y, width, height);
  double v13 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v11 shape:v12];

  return v13;
}

- (void)setTextSizeMode:(int64_t)a3
{
  if (self->_textSizeMode != a3)
  {
    self->_textSizeMode = a3;
    [(EKUIEventStatusButtonsView *)self _defaultFontSizeForButtons];
    -[EKUIEventStatusButtonsView _updateButtonFontsWithSize:](self, "_updateButtonFontsWithSize:");
    [(EKUIEventStatusButtonsView *)self setNeedsLayout];
  }
}

- (UIButton)leadingButton
{
  unint64_t v3 = [(NSArray *)self->_buttons count];
  if (v3)
  {
    unint64_t v3 = [(NSArray *)self->_buttons objectAtIndex:0];
  }

  return (UIButton *)v3;
}

- (UIButton)centerButton
{
  if ([(NSArray *)self->_buttons count] < 2)
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = [(NSArray *)self->_buttons objectAtIndex:1];
  }

  return (UIButton *)v3;
}

- (UIButton)trailingButton
{
  unint64_t v3 = [(NSArray *)self->_buttons count];
  if (v3)
  {
    unint64_t v3 = [(NSArray *)self->_buttons lastObject];
  }

  return (UIButton *)v3;
}

- (void)setActions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 isEqualToArray:self->_actions] & 1) == 0)
  {
    id v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      actions = self->_actions;
      int v8 = 136315906;
      double v9 = "-[EKUIEventStatusButtonsView setActions:]";
      __int16 v10 = 2112;
      double v11 = self;
      __int16 v12 = 2112;
      double v13 = actions;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "%s: Action set on status buttons [%@] changed from old actions [%@] to new actions [%@]", (uint8_t *)&v8, 0x2Au);
    }
    objc_storeStrong((id *)&self->_actions, a3);
    [(EKUIEventStatusButtonsView *)self _setupButtons];
  }
}

- (void)setButtonsTouchInsets:(UIEdgeInsets)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_buttonsTouchInsets = &self->_buttonsTouchInsets;
  if (self->_buttonsTouchInsets.left != a3.left
    || self->_buttonsTouchInsets.top != a3.top
    || self->_buttonsTouchInsets.right != a3.right
    || self->_buttonsTouchInsets.bottom != a3.bottom)
  {
    p_buttonsTouchInsets->top = a3.top;
    self->_buttonsTouchInsets.left = a3.left;
    self->_buttonsTouchInsets.bottom = a3.bottom;
    self->_buttonsTouchInsets.right = a3.right;
    -[EKUIEventStatusButtonsView _setTouchInsets:](self, "_setTouchInsets:");
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v8 = self->_buttons;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_setTouchInsets:", p_buttonsTouchInsets->top, p_buttonsTouchInsets->left, p_buttonsTouchInsets->bottom, p_buttonsTouchInsets->right, (void)v13);
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)setSelectedAction:(int64_t)a3
{
  if (self->_selectedAction != a3)
  {
    self->_selectedAction = a3;
    BOOL v4 = -[EKUIEventStatusButtonsView buttonForAction:](self, "buttonForAction:");
    [(EKUIEventStatusButtonsView *)self _updateSelectionToButton:v4];

    [(EKUIEventStatusButtonsView *)self setNeedsLayout];
  }
}

- (void)setDisableButtonHighlights:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_disableButtonHighlights != a3)
  {
    self->_disableButtonHighlights = a3;
    if (a3)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      unint64_t v3 = self->_buttons;
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v9;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(v3);
            }
            objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setSelected:", 0, (void)v8);
          }
          while (v5 != v7);
          uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        }
        while (v5);
      }
    }
  }
}

- (void)setShouldUseVerticalLayout:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_shouldUseVerticalLayout != a3)
  {
    BOOL v3 = a3;
    self->_shouldUseVerticalLayout = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = self->_buttons;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      if (v3) {
        uint64_t v9 = 4;
      }
      else {
        uint64_t v9 = 0;
      }
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setContentHorizontalAlignment:", v9, (void)v11);
        }
        while (v7 != v10);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    [(EKUIEventStatusButtonsView *)self _setupConstraints];
  }
}

- (BOOL)_shouldCenterButton
{
  return [(NSArray *)self->_buttons count] == 1 && self->_forcesSingleButtonToCenter;
}

- (void)_updateButtonFontsWithSize:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_buttons;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "titleLabel", (void)v13);
        long long v12 = -[EKUIEventStatusButtonsView _fontWithSize:selected:](self, "_fontWithSize:selected:", [v10 isSelected], a3);
        [v11 setFont:v12];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_updateButtonFonts:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_buttons;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "titleLabel", (void)v11);
        [v10 setFont:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_updateButtonFontsWithOverrideSize:(double)a3
{
  uint64_t v5 = [(EKUIEventStatusButtonsView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(EKUIEventStatusButtonsView *)self delegate];
    uint64_t v8 = [v7 eventStatusButtonsViewButtonFont:self];
    id v9 = [v8 fontWithSize:a3];

    [(EKUIEventStatusButtonsView *)self _updateButtonFonts:v9];
  }
  else
  {
    [(EKUIEventStatusButtonsView *)self _updateButtonFontsWithSize:a3];
  }
}

- (double)_defaultFontSizeForButtons
{
  double result = 17.0;
  if (!self->_textSizeMode) {
    return 13.0;
  }
  return result;
}

- (double)_minimumFontSize
{
  return 13.0;
}

- (id)_fontWithSize:(double)a3 selected:(BOOL)a4
{
  if (a4) {
    [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:a3];
  }
  else {
  id v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a3];
  }

  return v4;
}

- (double)_updateFontFromDelegate
{
  BOOL v3 = [(EKUIEventStatusButtonsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  uint64_t v5 = [(EKUIEventStatusButtonsView *)self delegate];
  char v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 eventStatusButtonsViewButtonFont:self];

    [(EKUIEventStatusButtonsView *)self _updateButtonFonts:v7];
    [v7 pointSize];
    double v9 = v8;
  }
  else
  {
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0
      || ([(EKUIEventStatusButtonsView *)self delegate],
          long long v11 = objc_claimAutoreleasedReturnValue(),
          [v11 eventStatusButtonsViewButtonFontSize:self],
          double v9 = v12,
          v11,
          v9 == 0.0))
    {
      [(EKUIEventStatusButtonsView *)self _defaultFontSizeForButtons];
      double v9 = v13;
    }
    [(EKUIEventStatusButtonsView *)self _updateButtonFontsWithSize:v9];
  }
  return v9;
}

- (double)_buttonFontSizeFromDelegate
{
  BOOL v3 = [(EKUIEventStatusButtonsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  uint64_t v5 = [(EKUIEventStatusButtonsView *)self delegate];
  char v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 eventStatusButtonsViewButtonFont:self];

    [v7 pointSize];
    double v9 = v8;

    return v9;
  }
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    long long v11 = [(EKUIEventStatusButtonsView *)self delegate];
    [v11 eventStatusButtonsViewButtonFontSize:self];
    double v9 = v12;

    return v9;
  }

  [(EKUIEventStatusButtonsView *)self _defaultFontSizeForButtons];
  return result;
}

- (void)updateConstraints
{
  leadingMarginConstraint = self->_leadingMarginConstraint;
  if (leadingMarginConstraint) {
    [(NSLayoutConstraint *)leadingMarginConstraint setConstant:self->_outsideMargin];
  }
  trailingMarginConstraint = self->_trailingMarginConstraint;
  if (trailingMarginConstraint) {
    [(NSLayoutConstraint *)trailingMarginConstraint setConstant:-self->_outsideMargin];
  }
  v5.receiver = self;
  v5.super_class = (Class)EKUIEventStatusButtonsView;
  [(EKUIEventStatusButtonsView *)&v5 updateConstraints];
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)EKUIEventStatusButtonsView;
  [(EKUIEventStatusButtonsView *)&v37 layoutSubviews];
  [(EKUIEventStatusButtonsView *)self _updateFontFromDelegate];
  double v4 = v3;
  unint64_t v5 = [(NSArray *)self->_buttons count];
  if (![(EKUIEventStatusButtonsView *)self shouldUseVerticalLayout])
  {
    double v12 = (double)v5;
    while (1)
    {
      if (self->_inboxStyle)
      {
        if ([(NSArray *)self->_buttons count] != 3) {
          break;
        }
        double v13 = [(EKUIEventStatusButtonsView *)self leadingButton];
        double v14 = _CachedSizeForButton(v13);

        long long v15 = [(EKUIEventStatusButtonsView *)self centerButton];
        double v16 = _CachedSizeForButton(v15);

        CGRect v17 = [(EKUIEventStatusButtonsView *)self trailingButton];
        double v18 = _CachedSizeForButton(v17);

        [(EKUIEventStatusButtonsView *)self bounds];
        CGFloat Width = CGRectGetWidth(v38);
        double v20 = v16 * 0.5 + 12.0;
        double v21 = v14 + v20;
        double v22 = Width * 0.5;
        double v23 = v20 + v18;
        if (v21 <= v22 && v23 <= v22) {
          break;
        }
        double v25 = v4 + -1.0;
        [(EKUIEventStatusButtonsView *)self _minimumFontSize];
        if (v4 + -1.0 < v26) {
          break;
        }
      }
      else
      {
        if (v5)
        {
          uint64_t v27 = 0;
          double v28 = 0.0;
          do
          {
            double v29 = [(NSArray *)self->_buttons objectAtIndexedSubscript:v27];
            double v28 = v28 + _CachedSizeForButton(v29);

            ++v27;
          }
          while (v5 != v27);
        }
        else
        {
          double v28 = 0.0;
        }
        [(EKUIEventStatusButtonsView *)self bounds];
        if (v28 + v12 * 46.0 < v30 && v5 > 2)
        {
          [(EKUIEventStatusButtonsView *)self bounds];
          CalRoundToScreenScale((v35 - v28 + v12 * -46.0) * 0.5);
          double v6 = v36;
          goto LABEL_3;
        }
        double v32 = v28 + v12 * 20.0;
        [(EKUIEventStatusButtonsView *)self bounds];
        double v6 = 0.0;
        if (v32 <= v33) {
          goto LABEL_3;
        }
        double v25 = v4 + -1.0;
        [(EKUIEventStatusButtonsView *)self _minimumFontSize];
        if (v4 + -1.0 < v34) {
          goto LABEL_3;
        }
      }
      [(EKUIEventStatusButtonsView *)self _updateButtonFontsWithOverrideSize:v25];
      double v4 = v25;
    }
  }
  double v6 = 0.0;
LABEL_3:
  if (self->_outsideMargin != v6 && !self->_inboxStyle)
  {
    self->_outsideMargin = v6;
    [(EKUIEventStatusButtonsView *)self setNeedsUpdateConstraints];
  }
  uint64_t v7 = [(EKUIEventStatusButtonsView *)self delegate];
  [v7 eventStatusButtonsView:self calculatedFontSizeToFit:v4];

  if (v5)
  {
    double v8 = [(NSArray *)self->_buttons firstObject];
    [v8 layoutIfNeeded];
  }
  double v9 = [(EKUIEventStatusButtonsView *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    long long v11 = [(EKUIEventStatusButtonsView *)self delegate];
    [v11 statusButtonsDidLayout];
  }
}

- (void)updateForMiniBarState:(BOOL)a3
{
}

- (EKUIEventStatusButtonsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKUIEventStatusButtonsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)selectedAction
{
  return self->_selectedAction;
}

- (NSArray)actions
{
  return self->_actions;
}

- (UIEdgeInsets)buttonsTouchInsets
{
  double top = self->_buttonsTouchInsets.top;
  double left = self->_buttonsTouchInsets.left;
  double bottom = self->_buttonsTouchInsets.bottom;
  double right = self->_buttonsTouchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)textSizeMode
{
  return self->_textSizeMode;
}

- (BOOL)disableButtonHighlights
{
  return self->_disableButtonHighlights;
}

- (BOOL)shouldUseVerticalLayout
{
  return self->_shouldUseVerticalLayout;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_buttons, 0);
}

@end