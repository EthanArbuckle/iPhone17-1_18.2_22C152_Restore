@interface BKUIPearlEnrollViewBottomContainer
- (BKUIPearlBottomContainerDelegate)delegate;
- (BKUIPearlEnrollViewBottomContainer)initWithFrame:(CGRect)a3 inBuddy:(BOOL)a4 scrollView:(id)a5 overlapScrollView:(id)a6 delegate:(id)a7 squareNeedsPositionLayout:(BOOL)a8;
- (BKUIPearlInstructionView)animatingInstructionView;
- (BKUIPearlInstructionView)instructionView;
- (BKUIScrollableContainer)offScreenScrollview;
- (BKUIScrollableContainer)onScreenScrollview;
- (BKUIScrollableContainer)overlappingScrollview;
- (BKUIScrollableContainer)scrollview;
- (BOOL)inBuddy;
- (BOOL)squareNeedsPositionLayout;
- (NSArray)onscreenScrollViewConstraints;
- (NSMutableDictionary)customDetailStrings;
- (NSMutableDictionary)customInstructionStrings;
- (UILayoutGuide)instructionBaselineLayoutGuide;
- (double)_topPaddingForButtonTray:(id)a3;
- (double)overlapValue;
- (id)_detailTextForState:(int)a3 substate:(int)a4;
- (id)_horizontalConstraintsForTagAlongTransitionView:(id)a3 state:(int)a4 position:(int64_t)a5;
- (id)_instructionTextForState:(int)a3 substate:(int)a4;
- (id)_locStateDetailedLabelNameForState:(int)a3;
- (id)_locStateNameForState:(int)a3;
- (id)_targetScrollViewForState:(int)a3;
- (id)_updateTopPaddingAndReturnHorizontalConstraintsForScrollView:(id)a3 state:(int)a4 position:(int64_t)a5;
- (id)bottomLinkButton;
- (id)buttonTray;
- (id)buttonTrayTopAnchor;
- (id)nextStateButton;
- (void)_configureInstructionView:(id)a3 forState:(int)a4 substate:(int)a5;
- (void)_updateButtonLayoutForScrollView:(id)a3;
- (void)_updateButtonVisibilityForScrollView:(id)a3;
- (void)_updateButtonVisibilityForScrollView:(id)a3 state:(int)a4 subState:(int)a5;
- (void)escapeHatchButtonWasPressed:(id)a3;
- (void)finalizeInstructionAnimation;
- (void)layoutSubviews;
- (void)nextStateButtonWasPressed:(id)a3;
- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6 parentView:(id)a7;
- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6 tagAlong:(id)a7 parentView:(id)a8;
- (void)retryWasPressed:(id)a3;
- (void)setAnimatingInstructionView:(id)a3;
- (void)setCustomDetailString:(id)a3 forState:(int)a4;
- (void)setCustomDetailStrings:(id)a3;
- (void)setCustomInstructionString:(id)a3 forState:(int)a4;
- (void)setCustomInstructionStrings:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInBuddy:(BOOL)a3;
- (void)setInstructionBaselineLayoutGuide:(id)a3;
- (void)setInstructionView:(id)a3;
- (void)setOffScreenScrollview:(id)a3;
- (void)setOnScreenScrollview:(id)a3;
- (void)setOnscreenScrollViewConstraints:(id)a3;
- (void)setOverlapValue:(double)a3;
- (void)setOverlappingScrollview:(id)a3;
- (void)setScrollview:(id)a3;
- (void)setSquareNeedsPositionLayout:(BOOL)a3;
- (void)setupInitialUI;
- (void)updateButtonLayout;
- (void)updateButtonVisibility;
- (void)updateInstructionViewContentForState:(int)a3 substate:(int)a4;
@end

@implementation BKUIPearlEnrollViewBottomContainer

- (BKUIPearlEnrollViewBottomContainer)initWithFrame:(CGRect)a3 inBuddy:(BOOL)a4 scrollView:(id)a5 overlapScrollView:(id)a6 delegate:(id)a7 squareNeedsPositionLayout:(BOOL)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v49.receiver = self;
  v49.super_class = (Class)BKUIPearlEnrollViewBottomContainer;
  v21 = -[BKUIPearlEnrollViewBottomContainer initWithFrame:](&v49, sel_initWithFrame_, x, y, width, height);
  v22 = v21;
  if (v21)
  {
    p_scrollview = (id *)&v21->_scrollview;
    objc_storeStrong((id *)&v21->_scrollview, a5);
    p_overlappingScrollview = (id *)&v22->_overlappingScrollview;
    objc_storeStrong((id *)&v22->_overlappingScrollview, a6);
    v22->_squareNeedsPositionLayout = a8;
    v25 = [*p_scrollview buttonTray];
    char v26 = [v25 willUseActionDelegate];

    if ((v26 & 1) == 0)
    {
      v27 = [*p_scrollview buttonTray];
      v28 = [v27 nextStateButton];
      [v28 addTarget:v22 action:sel_nextStateButtonWasPressed_ forControlEvents:0x2000];

      v29 = [*p_scrollview buttonTray];
      v30 = [v29 bottomLinkButton];
      [v30 addTarget:v22 action:sel_escapeHatchButtonWasPressed_ forControlEvents:0x2000];

      v31 = [*p_scrollview buttonTray];
      v32 = [v31 topLinkButton];
      [v32 addTarget:v22 action:sel_retryWasPressed_ forControlEvents:0x2000];
    }
    v33 = [*p_overlappingScrollview buttonTray];
    char v34 = [v33 willUseActionDelegate];

    if ((v34 & 1) == 0)
    {
      v35 = [*p_overlappingScrollview buttonTray];
      v36 = [v35 nextStateButton];
      [v36 addTarget:v22 action:sel_nextStateButtonWasPressed_ forControlEvents:0x2000];

      v37 = [*p_overlappingScrollview buttonTray];
      v38 = [v37 bottomLinkButton];
      [v38 addTarget:v22 action:sel_escapeHatchButtonWasPressed_ forControlEvents:0x2000];

      v39 = [*p_overlappingScrollview buttonTray];
      v40 = [v39 topLinkButton];
      [v40 addTarget:v22 action:sel_retryWasPressed_ forControlEvents:0x2000];
    }
    v22->_inBudddouble y = a4;
    uint64_t v41 = [MEMORY[0x1E4F1CA60] dictionary];
    customInstructionStrings = v22->_customInstructionStrings;
    v22->_customInstructionStrings = (NSMutableDictionary *)v41;

    uint64_t v43 = [MEMORY[0x1E4F1CA60] dictionary];
    customDetailStrings = v22->_customDetailStrings;
    v22->_customDetailStrings = (NSMutableDictionary *)v43;

    objc_storeWeak((id *)&v22->_delegate, v20);
    v22->_overlapValue = 47.0;
    v45 = +[BKUIDevice sharedInstance];
    if ([v45 isZoomEnabled])
    {
      v46 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v47 = [v46 userInterfaceIdiom];

      if (!v47) {
        v22->_overlapValue = v22->_overlapValue * 0.800000012;
      }
    }
    else
    {
    }
  }

  return v22;
}

- (void)setupInitialUI
{
  v49[8] = *MEMORY[0x1E4F143B8];
  v3 = [(BKUIPearlEnrollViewBottomContainer *)self scrollview];
  [(BKUIPearlEnrollViewBottomContainer *)self addSubview:v3];

  v4 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  [(BKUIPearlEnrollViewBottomContainer *)self addSubview:v4];

  v5 = [(BKUIPearlEnrollViewBottomContainer *)self scrollview];
  v6 = [v5 topAnchor];
  v7 = [(BKUIPearlEnrollViewBottomContainer *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v9 = [(BKUIPearlEnrollViewBottomContainer *)self scrollview];
  [v9 setTopToSuperViewConstraint:v8];

  v10 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  v11 = [v10 topAnchor];
  v12 = [(BKUIPearlEnrollViewBottomContainer *)self topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v14 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  [v14 setTopToSuperViewConstraint:v13];

  v36 = (void *)MEMORY[0x1E4F28DC8];
  v48 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  uint64_t v47 = [v48 topToSuperViewConstraint];
  v49[0] = v47;
  v46 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  v45 = [v46 bottomAnchor];
  v44 = [(BKUIPearlEnrollViewBottomContainer *)self bottomAnchor];
  uint64_t v43 = [v45 constraintEqualToAnchor:v44];
  v49[1] = v43;
  v42 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  uint64_t v41 = [v42 leadingAnchor];
  v40 = [(BKUIPearlEnrollViewBottomContainer *)self leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v49[2] = v39;
  v38 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  v37 = [v38 trailingAnchor];
  v35 = [(BKUIPearlEnrollViewBottomContainer *)self trailingAnchor];
  char v34 = [v37 constraintEqualToAnchor:v35];
  v49[3] = v34;
  v33 = [(BKUIPearlEnrollViewBottomContainer *)self scrollview];
  v32 = [v33 topToSuperViewConstraint];
  v49[4] = v32;
  v31 = [(BKUIPearlEnrollViewBottomContainer *)self scrollview];
  v30 = [v31 bottomAnchor];
  v29 = [(BKUIPearlEnrollViewBottomContainer *)self bottomAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v49[5] = v28;
  v15 = [(BKUIPearlEnrollViewBottomContainer *)self scrollview];
  v16 = [v15 leadingAnchor];
  v17 = [(BKUIPearlEnrollViewBottomContainer *)self leadingAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17];
  v49[6] = v18;
  id v19 = [(BKUIPearlEnrollViewBottomContainer *)self scrollview];
  id v20 = [v19 trailingAnchor];
  v21 = [(BKUIPearlEnrollViewBottomContainer *)self trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v49[7] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:8];
  [v36 activateConstraints:v23];

  v24 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  [(BKUIPearlEnrollViewBottomContainer *)self setOnScreenScrollview:v24];

  v25 = [(BKUIPearlEnrollViewBottomContainer *)self scrollview];
  [(BKUIPearlEnrollViewBottomContainer *)self setOffScreenScrollview:v25];

  char v26 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  v27 = [v26 instructionView];
  [(BKUIPearlEnrollViewBottomContainer *)self _configureInstructionView:v27 forState:2 substate:0];
}

- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6 parentView:(id)a7
{
}

- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6 tagAlong:(id)a7 parentView:(id)a8
{
  BOOL v9 = a6;
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a3;
  id v51 = a7;
  id v13 = a8;
  v14 = [(BKUIPearlEnrollViewBottomContainer *)self _targetScrollViewForState:v11];
  v15 = [(BKUIPearlEnrollViewBottomContainer *)self instructionView];
  uint64_t v16 = [v15 instruction];

  v17 = [(BKUIPearlEnrollViewBottomContainer *)self instructionView];
  uint64_t v18 = [v17 detail];

  id v19 = [(BKUIScrollableContainer *)v14 instructionView];
  id v20 = [(BKUIPearlEnrollViewBottomContainer *)self instructionView];
  objc_msgSend(v19, "setDarkMode:", objc_msgSend(v20, "darkMode"));

  [(BKUIPearlEnrollViewBottomContainer *)self _configureInstructionView:v19 forState:v11 substate:v10];
  v21 = [v19 instruction];
  objc_super v49 = (void *)v18;
  v50 = (void *)v16;
  if ([v21 isEqualToString:v16])
  {
    v22 = [v19 detail];
    uint64_t v23 = v18;
    v24 = v22;
    char v25 = [v22 isEqualToString:v23];

    if (v25)
    {
      [(BKUIScrollableContainer *)v14 layoutIfNeeded];
      char v26 = [(BKUIScrollableContainer *)v14 instructionView];
      [v26 layoutIfNeeded];

      [v13 setNeedsLayout];
      [v13 layoutIfNeeded];
      v27 = v49;
      goto LABEL_16;
    }
  }
  else
  {
  }
  if (v9) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v29 = v10;
  if (v9) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = 2;
  }
  v31 = [(BKUIPearlEnrollViewBottomContainer *)self _updateTopPaddingAndReturnHorizontalConstraintsForScrollView:v14 state:v11 position:v28];
  v32 = [(BKUIScrollableContainer *)v14 horizontalConstraint];
  [v32 setActive:0];

  [MEMORY[0x1E4F28DC8] activateConstraints:v31];
  -[BKUIScrollableContainer setContentOffset:animated:](v14, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(BKUIScrollableContainer *)v14 layoutIfNeeded];
  v33 = [(BKUIScrollableContainer *)v14 instructionView];
  [v33 layoutIfNeeded];

  [(BKUIPearlEnrollViewBottomContainer *)self _updateButtonVisibilityForScrollView:v14 state:v11 subState:v29];
  char v34 = [(BKUIScrollableContainer *)v14 buttonTray];
  [(BKUIPearlEnrollViewBottomContainer *)self _topPaddingForButtonTray:v34];
  double v36 = v35;
  v37 = [(BKUIScrollableContainer *)v14 buttonTrayTopAnchor];
  [v37 setConstant:v36];

  [v13 setNeedsLayout];
  id v47 = v13;
  [v13 layoutIfNeeded];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:v31];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_onscreenScrollViewConstraints];
  v38 = (void *)MEMORY[0x1E4F28DC8];
  v39 = [(BKUIPearlEnrollViewBottomContainer *)self onScreenScrollview];
  uint64_t v40 = v30;
  uint64_t v41 = [(BKUIPearlEnrollViewBottomContainer *)self _updateTopPaddingAndReturnHorizontalConstraintsForScrollView:v39 state:a4 position:v30];
  [v38 activateConstraints:v41];

  v42 = [(BKUIPearlEnrollViewBottomContainer *)self _updateTopPaddingAndReturnHorizontalConstraintsForScrollView:v14 state:v11 position:1];
  onscreenScrollViewConstraints = self->_onscreenScrollViewConstraints;
  self->_onscreenScrollViewConstraints = v42;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_onscreenScrollViewConstraints];
  if (v51)
  {
    v44 = [(BKUIPearlEnrollViewBottomContainer *)self _horizontalConstraintsForTagAlongTransitionView:v51 state:a4 position:v40];
    [v44 setActive:1];
  }
  onScreenScrollview = self->_onScreenScrollview;
  v27 = v49;
  if (v14 != onScreenScrollview)
  {
    objc_storeStrong((id *)&self->_offScreenScrollview, onScreenScrollview);
    objc_storeStrong((id *)&self->_onScreenScrollview, v14);
  }
  v46 = [(BKUIScrollableContainer *)v14 horizontalConstraint];
  [v46 setActive:1];

  id v13 = v47;
LABEL_16:
  if (v11 == 10)
  {
    [(BKUIScrollableContainer *)self->_overlappingScrollview setIndicatorStyle:1];
    [(BKUIScrollableContainer *)self->_scrollview setIndicatorStyle:1];
  }
}

- (id)_horizontalConstraintsForTagAlongTransitionView:(id)a3 state:(int)a4 position:(int64_t)a5
{
  id v7 = a3;
  v8 = v7;
  switch(a5)
  {
    case 2:
      uint64_t v11 = [v7 leftAnchor];
LABEL_7:
      BOOL v9 = (void *)v11;
      uint64_t v10 = [(BKUIPearlEnrollViewBottomContainer *)self rightAnchor];
      goto LABEL_8;
    case 1:
      uint64_t v11 = [v7 rightAnchor];
      goto LABEL_7;
    case 0:
      BOOL v9 = [v7 rightAnchor];
      uint64_t v10 = [(BKUIPearlEnrollViewBottomContainer *)self leftAnchor];
LABEL_8:
      v12 = (void *)v10;
      id v13 = [v9 constraintEqualToAnchor:v10];

      goto LABEL_10;
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

- (id)_updateTopPaddingAndReturnHorizontalConstraintsForScrollView:(id)a3 state:(int)a4 position:(int64_t)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = [v8 horizontalConstraint];
  [v9 setActive:0];

  if (a5 == 1)
  {
    uint64_t v10 = [v8 scrollContentView];
    uint64_t v13 = [v10 rightAnchor];
  }
  else
  {
    if (!a5)
    {
      uint64_t v10 = [v8 scrollContentView];
      uint64_t v11 = [v10 rightAnchor];
      uint64_t v12 = [(BKUIPearlEnrollViewBottomContainer *)self leftAnchor];
      goto LABEL_7;
    }
    uint64_t v10 = [v8 scrollContentView];
    uint64_t v13 = [v10 leftAnchor];
  }
  uint64_t v11 = (void *)v13;
  uint64_t v12 = [(BKUIPearlEnrollViewBottomContainer *)self rightAnchor];
LABEL_7:
  v14 = (void *)v12;
  v15 = [v11 constraintEqualToAnchor:v12];

  [v8 setHorizontalConstraint:v15];
  BOOL v16 = [(BKUIPearlEnrollViewBottomContainer *)self squareNeedsPositionLayout];
  if ((a4 - 5) < 0xFFFFFFFE || v16) {
    double v18 = 0.0;
  }
  else {
    double v18 = 47.0;
  }
  id v19 = [v8 topToSuperViewConstraint];
  [v19 setConstant:v18];

  if (a4 == 10)
  {
    id v20 = [v8 topToSuperViewConstraint];
    [v20 setConstant:0.0];
  }
  v23[0] = v15;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];

  return v21;
}

- (void)updateInstructionViewContentForState:(int)a3 substate:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = [(BKUIPearlEnrollViewBottomContainer *)self instructionView];
  id v8 = [(BKUIPearlEnrollViewBottomContainer *)self onScreenScrollview];
  [(BKUIPearlEnrollViewBottomContainer *)self _configureInstructionView:v7 forState:v5 substate:v4];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_onscreenScrollViewConstraints];
  BOOL v9 = [(BKUIPearlEnrollViewBottomContainer *)self _updateTopPaddingAndReturnHorizontalConstraintsForScrollView:v8 state:v5 position:1];
  onscreenScrollViewConstraints = self->_onscreenScrollViewConstraints;
  self->_onscreenScrollViewConstraints = v9;

  [MEMORY[0x1E4F39CF8] begin];
  uint64_t v11 = (void *)MEMORY[0x1E4F39CF8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__BKUIPearlEnrollViewBottomContainer_updateInstructionViewContentForState_substate___block_invoke;
  v14[3] = &unk_1E6EA21A8;
  id v15 = v7;
  id v16 = v8;
  v17 = self;
  id v12 = v8;
  id v13 = v7;
  [v11 setCompletionBlock:v14];
  [MEMORY[0x1E4F28DC8] activateConstraints:self->_onscreenScrollViewConstraints];
  [MEMORY[0x1E4F39CF8] commit];
  [(BKUIPearlEnrollViewBottomContainer *)self setNeedsLayout];
}

void __84__BKUIPearlEnrollViewBottomContainer_updateInstructionViewContentForState_substate___block_invoke(id *a1)
{
  [a1[4] setNeedsLayout];
  [a1[5] setNeedsLayout];
  [a1[6] updateButtonLayout];
  [a1[6] layoutIfNeeded];
  v2 = [a1[6] delegate];
  v3 = [v2 view];
  [v3 setNeedsLayout];

  id v5 = [a1[6] delegate];
  uint64_t v4 = [v5 view];
  [v4 layoutIfNeeded];
}

- (void)_configureInstructionView:(id)a3 forState:(int)a4 substate:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  customInstructionStrings = self->_customInstructionStrings;
  BOOL v9 = NSNumber;
  id v10 = a3;
  uint64_t v11 = [v9 numberWithUnsignedInt:v6];
  id v15 = [(NSMutableDictionary *)customInstructionStrings objectForKeyedSubscript:v11];

  if (!v15)
  {
    id v15 = [(BKUIPearlEnrollViewBottomContainer *)self _instructionTextForState:v6 substate:v5];
  }
  customDetailStrings = self->_customDetailStrings;
  id v13 = [NSNumber numberWithUnsignedInt:v6];
  v14 = [(NSMutableDictionary *)customDetailStrings objectForKeyedSubscript:v13];

  if (!v14)
  {
    v14 = [(BKUIPearlEnrollViewBottomContainer *)self _detailTextForState:v6 substate:v5];
  }
  [v10 setInstruction:v15];
  [v10 setDetail:v14];
}

- (id)_instructionTextForState:(int)a3 substate:(int)a4
{
  if (!a4)
  {
    uint64_t v11 = *(void *)&a3;
    customInstructionStrings = self->_customInstructionStrings;
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    v14 = [(NSMutableDictionary *)customInstructionStrings objectForKeyedSubscript:v13];

    if (v14) {
      goto LABEL_18;
    }
    uint64_t v6 = [(BKUIPearlEnrollViewBottomContainer *)self _locStateNameForState:v11];
    if (!v6)
    {
      v14 = 0;
      goto LABEL_17;
    }
    id v15 = [NSString stringWithFormat:@"INSTRUCTION_STATE_%@", v6];
    id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:v15 value:&stru_1F4081468 table:@"Pearl-periocular"];

    double v18 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v19 = [v18 userInterfaceIdiom];

    if ((v19 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      goto LABEL_16;
    }
    v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v20 = [v14 localizedStringForKey:v15 value:&stru_1F4081468 table:@"Pearl-j3xx"];

    v17 = (void *)v20;
LABEL_15:

LABEL_16:
    v14 = v17;
    goto LABEL_17;
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"INSTRUCTION_SUBSTATE_%i", *(void *)&a4);
  if (a4 == 11)
  {
    v21 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
    v22 = [v21 currentOperationHandler];
    id v10 = [v22 bkIdentities];

    if ((unint64_t)[v10 count] >= 2)
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"INSTRUCTION_TWO_ENROLLMENTS_SUBSTATE_%i", 11);

      uint64_t v6 = (void *)v23;
    }
    goto LABEL_12;
  }
  if (a4 == 15)
  {
    id v7 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
    id v8 = [v7 currentOperationHandler];
    int v9 = [v8 isEnrollmentAugmentationOnly];

    if (v9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"INSTRUCTION_SUBSTATE_AUGMENTATION_%i", 15);
      v6 = id v10 = v6;
LABEL_12:
    }
  }
  v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [v24 localizedStringForKey:v6 value:&stru_1F4081468 table:@"Pearl-periocular"];

  char v25 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v26 = [v25 userInterfaceIdiom];

  if ((v26 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = [v15 localizedStringForKey:v6 value:&stru_1F4081468 table:@"Pearl-j3xx"];
    goto LABEL_15;
  }
LABEL_17:

LABEL_18:

  return v14;
}

- (id)_detailTextForState:(int)a3 substate:(int)a4
{
  if (a4)
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"INSTRUCTION_DETAIL_SUBSTATE_%i", *(void *)&a4);
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:v4 value:&stru_1F4081468 table:@"Pearl-periocular"];

    id v7 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
LABEL_6:

      goto LABEL_8;
    }
    int v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:v4 value:&stru_1F4081468 table:@"Pearl-j3xx"];
    goto LABEL_4;
  }
  uint64_t v11 = *(void *)&a3;
  customDetailStrings = self->_customDetailStrings;
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  uint64_t v6 = [(NSMutableDictionary *)customDetailStrings objectForKeyedSubscript:v14];

  if (!v6)
  {
    uint64_t v4 = [(BKUIPearlEnrollViewBottomContainer *)self _locStateDetailedLabelNameForState:v11];
    if (!v4)
    {
      uint64_t v6 = 0;
      goto LABEL_6;
    }
    int v9 = [NSString stringWithFormat:@"INSTRUCTION_DETAIL_STATE_%@", v4];
    id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v10 = [v16 localizedStringForKey:v9 value:&stru_1F4081468 table:@"Pearl-periocular"];

    v17 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v18 = [v17 userInterfaceIdiom];

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      goto LABEL_5;
    }
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v19 = [v6 localizedStringForKey:v9 value:&stru_1F4081468 table:@"Pearl-j3xx"];

    id v10 = (void *)v19;
LABEL_4:

LABEL_5:
    uint64_t v6 = v10;
    goto LABEL_6;
  }
LABEL_8:

  return v6;
}

- (void)setCustomInstructionString:(id)a3 forState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  customInstructionStrings = self->_customInstructionStrings;
  if (!customInstructionStrings)
  {
    id v7 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v8 = self->_customInstructionStrings;
    self->_customInstructionStrings = v7;

    customInstructionStrings = self->_customInstructionStrings;
  }
  int v9 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)customInstructionStrings setObject:v10 forKeyedSubscript:v9];
}

- (void)setCustomDetailString:(id)a3 forState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  customDetailStrings = self->_customDetailStrings;
  if (!customDetailStrings)
  {
    id v7 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v8 = self->_customDetailStrings;
    self->_customDetailStrings = v7;

    customDetailStrings = self->_customDetailStrings;
  }
  int v9 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)customDetailStrings setObject:v10 forKeyedSubscript:v9];
}

- (id)_locStateDetailedLabelNameForState:(int)a3
{
  -[BKUIPearlEnrollViewBottomContainer _locStateNameForState:](self, "_locStateNameForState:");
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (a3 == 9)
  {

    uint64_t v4 = @"PARTIAL_CAPTURE";
  }

  return v4;
}

- (id)_locStateNameForState:(int)a3
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t v4 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      uint64_t v5 = [v4 enrollmentConfiguration];

      if (v5 == 4) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = @"TUTORIAL";
      }
      goto LABEL_51;
    case 3:
    case 4:
      uint64_t v6 = @"POSITIONING";
      goto LABEL_51;
    case 5:
      goto LABEL_28;
    case 6:
      goto LABEL_50;
    case 7:
      id v16 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      v17 = [v16 currentOperationHandler];
      if ([v17 isEnrollmentAugmentationOnly])
      {
        uint64_t v18 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
        int v19 = [v18 isFinalEnrollment];

        if (!v19) {
          goto LABEL_28;
        }
      }
      else
      {
      }
      v32 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      uint64_t v33 = [v32 enrollmentConfiguration];

      if (v33 == 4)
      {
LABEL_28:
        uint64_t v6 = @"FIRST_SCAN";
        goto LABEL_51;
      }
      char v34 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      if (([v34 isFinalEnrollment] & 1) == 0) {
        goto LABEL_65;
      }
      double v35 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      double v36 = [v35 currentOperationHandler];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
        v38 = [v37 currentOperationHandler];
        int v39 = [v38 centerBinComplete];

        uint64_t v6 = @"SECOND_SCAN";
        if (v39)
        {
          uint64_t v40 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
          uint64_t v41 = [v40 currentOperationHandler];
          int v42 = [v41 isEnrollmentAugmentationOnly];

          uint64_t v43 = @"THIRD_SCAN";
LABEL_58:
          if (!v42) {
            uint64_t v6 = v43;
          }
        }
      }
      else
      {

LABEL_65:
        uint64_t v6 = @"SECOND_SCAN";
      }
LABEL_51:
      return v6;
    case 8:
      uint64_t v20 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      v21 = [v20 currentOperationHandler];
      if ([v21 isEnrollmentAugmentationOnly])
      {
        v22 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
        if ([v22 isFinalEnrollment])
        {
          uint64_t v23 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
          if ([v23 isFinalEnrollment])
          {
            v24 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
            char v25 = [v24 currentOperationHandler];
            uint64_t v26 = [v25 enrollOperation];
            BOOL v27 = v26 == 0;
          }
          else
          {
            BOOL v27 = 0;
          }
        }
        else
        {
          BOOL v27 = 1;
        }
      }
      else
      {
        BOOL v27 = 0;
      }

      v44 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      v45 = [v44 currentOperationHandler];
      if ([v45 isEnrollmentAugmentationOnly])
      {
        v46 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
        id v47 = [v46 currentOperationHandler];
        int v48 = [v47 glassesFound] ^ 1;
      }
      else
      {
        int v48 = 0;
      }

      objc_super v49 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      uint64_t v50 = [v49 enrollmentConfiguration];

      if (v50 == 4)
      {
        uint64_t v6 = @"FACEID_SCAN_COMPLETE";
        goto LABEL_51;
      }
      if ((v48 | v27))
      {
LABEL_50:
        uint64_t v6 = @"FIRST_SCAN_COMPLETE";
        goto LABEL_51;
      }
      v52 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      if (([v52 isFinalEnrollment] & 1) == 0) {
        goto LABEL_67;
      }
      v53 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      v54 = [v53 currentOperationHandler];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_67:
        uint64_t v6 = @"SECOND_SCAN_COMPLETE";
        goto LABEL_51;
      }
      v55 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      v56 = [v55 currentOperationHandler];
      int v57 = [v56 centerBinComplete];

      uint64_t v6 = @"SECOND_SCAN_COMPLETE";
      if (!v57) {
        goto LABEL_51;
      }
      v58 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      v59 = [v58 currentOperationHandler];
      int v42 = [v59 isEnrollmentAugmentationOnly];

      uint64_t v43 = @"THIRD_SCAN_COMPLETE";
      goto LABEL_58;
    case 9:
      uint64_t v28 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      uint64_t v29 = [v28 currentOperationHandler];

      uint64_t v30 = [v29 enrollmentType];
      if (v30 == 3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v6 = 0;
          switch([v29 enrollmentConfiguration])
          {
            case 0:
              -[BKUIPearlEnrollViewBottomContainer _locStateNameForState:]();
            case 1:
              uint64_t v6 = @"THIRD_SCAN_COMPLETE";
              break;
            case 3:
              uint64_t v6 = @"SECOND_SCAN_COMPLETE";
              break;
            case 4:
              uint64_t v6 = @"FIRST_SCAN_COMPLETE";
              break;
            default:
              break;
          }
        }
        else
        {
          int v60 = [v29 isEnrollmentAugmentationOnly];
          v61 = @"SECOND_SCAN_COMPLETE";
          if (v60) {
            v61 = @"FIRST_SCAN_COMPLETE";
          }
          uint64_t v6 = v61;
        }
      }
      else
      {
        v31 = @"FIRST_SCAN_COMPLETE";
        if (v30 != 1) {
          v31 = 0;
        }
        if (v30 == 2) {
          uint64_t v6 = @"SECOND_SCAN_COMPLETE";
        }
        else {
          uint64_t v6 = v31;
        }
      }

      goto LABEL_51;
    case 10:
      id v7 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      uint64_t v8 = [v7 currentOperationHandler];
      if (![v8 supportsPeriocularEnrollment]
        || ![(BKUIPearlEnrollViewBottomContainer *)self inBuddy])
      {
        goto LABEL_39;
      }
      int v9 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
      id v10 = [v9 currentOperationHandler];
      uint64_t v11 = [v10 identity];
      if ([v11 hasPeriocularEnrollment])
      {
        id v12 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
        id v13 = [v12 currentOperationHandler];
        v14 = [v13 identity];
        char v15 = [v14 canAddPeriocularEnrollment];

        if (v15)
        {
          uint64_t v6 = @"PERIOCULAR_ENROLL_FINISHED_BUDDY";
          goto LABEL_51;
        }
      }
      else
      {

LABEL_39:
      }
      uint64_t v6 = @"ENROLL_FINISHED";
      goto LABEL_51;
    default:
      uint64_t v6 = 0;
      goto LABEL_51;
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BKUIPearlEnrollViewBottomContainer;
  [(BKUIPearlEnrollViewBottomContainer *)&v4 layoutSubviews];
  v3 = [(BKUIPearlEnrollViewBottomContainer *)self instructionView];
  [v3 layoutIfNeeded];
}

- (double)_topPaddingForButtonTray:(id)a3
{
  id v4 = a3;
  switch([v4 displayState])
  {
    case 1:
    case 3:
      uint64_t v5 = [v4 nextStateButton];
      [v5 alpha];
      if (v6 == 0.0) {
        double v3 = 25.0;
      }
      else {
        double v3 = 0.0;
      }
      goto LABEL_6;
    case 2:
      uint64_t v5 = [v4 bottomLinkButton];
      [v5 origin];
      double v3 = v7;
LABEL_6:

      break;
    case 4:
      [v4 size];
      double v3 = v8;
      break;
    default:
      break;
  }

  return v3;
}

- (void)finalizeInstructionAnimation
{
  double v3 = [(BKUIPearlEnrollViewBottomContainer *)self buttonTray];
  [v3 updateButtonLayout];

  id v4 = [(BKUIPearlEnrollViewBottomContainer *)self scrollview];
  [v4 setShowsVerticalScrollIndicator:0];

  uint64_t v5 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  [v5 setShowsVerticalScrollIndicator:0];

  double v6 = [(BKUIPearlEnrollViewBottomContainer *)self instructionView];
  id v11 = [v6 superview];

  double v7 = [v11 superview];
  [(BKUIPearlEnrollViewBottomContainer *)self bringSubviewToFront:v7];
  [(BKUIPearlEnrollViewBottomContainer *)self setNeedsLayout];
  [(BKUIPearlEnrollViewBottomContainer *)self layoutIfNeeded];
  [v7 contentSize];
  double v9 = v8;
  [v7 bounds];
  if (v9 > v10)
  {
    [v7 setShowsVerticalScrollIndicator:1];
    [v7 flashScrollIndicators];
  }
}

- (id)_targetScrollViewForState:(int)a3
{
  if (a3 == 2) {
    [(BKUIPearlEnrollViewBottomContainer *)self onScreenScrollview];
  }
  else {
  double v3 = [(BKUIPearlEnrollViewBottomContainer *)self offScreenScrollview];
  }

  return v3;
}

- (id)buttonTray
{
  v2 = [(BKUIPearlEnrollViewBottomContainer *)self onScreenScrollview];
  double v3 = [v2 buttonTray];

  return v3;
}

- (void)updateButtonLayout
{
  id v3 = [(BKUIPearlEnrollViewBottomContainer *)self onScreenScrollview];
  [(BKUIPearlEnrollViewBottomContainer *)self _updateButtonVisibilityForScrollView:v3];
}

- (id)bottomLinkButton
{
  v2 = [(BKUIPearlEnrollViewBottomContainer *)self onScreenScrollview];
  id v3 = [v2 buttonTray];
  id v4 = [v3 bottomLinkButton];

  return v4;
}

- (id)nextStateButton
{
  v2 = [(BKUIPearlEnrollViewBottomContainer *)self onScreenScrollview];
  id v3 = [v2 buttonTray];
  id v4 = [v3 nextStateButton];

  return v4;
}

- (id)buttonTrayTopAnchor
{
  v2 = [(BKUIPearlEnrollViewBottomContainer *)self onScreenScrollview];
  id v3 = [v2 buttonTrayTopAnchor];

  return v3;
}

- (BKUIPearlInstructionView)instructionView
{
  v2 = [(BKUIPearlEnrollViewBottomContainer *)self onScreenScrollview];
  id v3 = [v2 instructionView];

  return (BKUIPearlInstructionView *)v3;
}

- (void)nextStateButtonWasPressed:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  [v5 nextStateButtonPressed:v4];
}

- (void)escapeHatchButtonWasPressed:(id)a3
{
  id v3 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  [v3 escapeHatchButtonPressed];
}

- (void)retryWasPressed:(id)a3
{
  id v3 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  [v3 retryPressed];
}

- (void)updateButtonVisibility
{
  id v3 = [(BKUIPearlEnrollViewBottomContainer *)self instructionView];
  id v4 = [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  id v5 = [v4 instructionView];
  if (v3 == v5) {
    [(BKUIPearlEnrollViewBottomContainer *)self overlappingScrollview];
  }
  else {
  id v6 = [(BKUIPearlEnrollViewBottomContainer *)self scrollview];
  }

  [(BKUIPearlEnrollViewBottomContainer *)self _updateButtonVisibilityForScrollView:v6];
}

- (void)_updateButtonVisibilityForScrollView:(id)a3
{
  id v4 = a3;
  id v7 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  uint64_t v5 = [v7 state];
  id v6 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  -[BKUIPearlEnrollViewBottomContainer _updateButtonVisibilityForScrollView:state:subState:](self, "_updateButtonVisibilityForScrollView:state:subState:", v4, v5, [v6 substate]);
}

- (void)_updateButtonVisibilityForScrollView:(id)a3 state:(int)a4 subState:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v38 = a3;
  double v8 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  double v9 = [v8 _nextStateButtonTitleForState:v6 subState:v5];

  double v10 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  int v11 = [v10 state];

  if (v9) {
    uint64_t v12 = v11 != 2;
  }
  else {
    uint64_t v12 = 0;
  }
  if (v11 == 2 && v9)
  {
    id v13 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
    v14 = [v13 currentOperationHandler];
    uint64_t v12 = [v14 canStartEnrollmentOperation];
  }
  char v15 = [v38 buttonTray];
  id v16 = [v15 nextStateButton];
  v17 = v16;
  if (v9) {
    double v18 = 1.0;
  }
  else {
    double v18 = 0.0;
  }
  [v16 setAlpha:v18];

  int v19 = [v38 buttonTray];
  uint64_t v20 = [v19 nextStateButton];
  [v20 setEnabled:v12];

  v21 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  v22 = [v21 _escapeHatchTitleForState:v6];

  uint64_t v23 = [v38 buttonTray];
  v24 = [v23 bottomLinkButton];
  if ([v22 length]) {
    double v25 = 1.0;
  }
  else {
    double v25 = 0.0;
  }
  [v24 setAlpha:v25];

  uint64_t v26 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
  if ([v26 state] == 3)
  {
    BOOL v27 = [(BKUIPearlEnrollViewBottomContainer *)self delegate];
    uint64_t v28 = [v27 currentOperationHandler];
    int v29 = [v28 shouldShowRetryUI];

    uint64_t v30 = [v38 buttonTray];
    v31 = [v30 topLinkButton];
    v32 = v31;
    if (v29) {
      double v33 = 1.0;
    }
    else {
      double v33 = 0.0;
    }
    [v31 setAlpha:v33];

    char v34 = v38;
    if (v29)
    {
      [(BKUIPearlEnrollViewBottomContainer *)self _updateButtonLayoutForScrollView:v38];
      goto LABEL_21;
    }
  }
  else
  {

    double v35 = [v38 buttonTray];
    double v36 = [v35 topLinkButton];
    [v36 setAlpha:0.0];

    char v34 = v38;
  }
  v37 = [v34 buttonTray];
  [v37 updateButtonLayout];

LABEL_21:
}

- (void)_updateButtonLayoutForScrollView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 buttonTray];
  [v5 updateButtonLayout];

  uint64_t v6 = [v4 instructionView];
  [v6 layoutIfNeeded];

  id v10 = [v4 buttonTray];
  [(BKUIPearlEnrollViewBottomContainer *)self _topPaddingForButtonTray:v10];
  double v8 = v7;
  double v9 = [v4 buttonTrayTopAnchor];

  [v9 setConstant:v8];
}

- (void)setInstructionView:(id)a3
{
}

- (NSArray)onscreenScrollViewConstraints
{
  return self->_onscreenScrollViewConstraints;
}

- (void)setOnscreenScrollViewConstraints:(id)a3
{
}

- (double)overlapValue
{
  return self->_overlapValue;
}

- (void)setOverlapValue:(double)a3
{
  self->_overlapValue = a3;
}

- (UILayoutGuide)instructionBaselineLayoutGuide
{
  return self->_instructionBaselineLayoutGuide;
}

- (void)setInstructionBaselineLayoutGuide:(id)a3
{
}

- (BKUIScrollableContainer)onScreenScrollview
{
  return self->_onScreenScrollview;
}

- (void)setOnScreenScrollview:(id)a3
{
}

- (BKUIScrollableContainer)offScreenScrollview
{
  return self->_offScreenScrollview;
}

- (void)setOffScreenScrollview:(id)a3
{
}

- (BOOL)squareNeedsPositionLayout
{
  return self->_squareNeedsPositionLayout;
}

- (void)setSquareNeedsPositionLayout:(BOOL)a3
{
  self->_squareNeedsPositionLayout = a3;
}

- (BKUIPearlBottomContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKUIPearlBottomContainerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBudddouble y = a3;
}

- (BKUIPearlInstructionView)animatingInstructionView
{
  return self->_animatingInstructionView;
}

- (void)setAnimatingInstructionView:(id)a3
{
}

- (NSMutableDictionary)customInstructionStrings
{
  return self->_customInstructionStrings;
}

- (void)setCustomInstructionStrings:(id)a3
{
}

- (NSMutableDictionary)customDetailStrings
{
  return self->_customDetailStrings;
}

- (void)setCustomDetailStrings:(id)a3
{
}

- (BKUIScrollableContainer)scrollview
{
  return self->_scrollview;
}

- (void)setScrollview:(id)a3
{
}

- (BKUIScrollableContainer)overlappingScrollview
{
  return self->_overlappingScrollview;
}

- (void)setOverlappingScrollview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlappingScrollview, 0);
  objc_storeStrong((id *)&self->_scrollview, 0);
  objc_storeStrong((id *)&self->_customDetailStrings, 0);
  objc_storeStrong((id *)&self->_customInstructionStrings, 0);
  objc_storeStrong((id *)&self->_animatingInstructionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_offScreenScrollview, 0);
  objc_storeStrong((id *)&self->_onScreenScrollview, 0);
  objc_storeStrong((id *)&self->_instructionBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_onscreenScrollViewConstraints, 0);

  objc_storeStrong((id *)&self->_instructionView, 0);
}

- (void)_locStateNameForState:.cold.1()
{
}

@end