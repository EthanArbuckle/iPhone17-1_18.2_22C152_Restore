@interface BKUIButtonTray
- (BKUIButtonTray)initWithFrame:(CGRect)a3;
- (BKUIButtonTray)initWithFrame:(CGRect)a3 willUseActionDelegate:(BOOL)a4;
- (BKUIButtonTrayActionDelegate)actionDelegate;
- (BOOL)inSheet;
- (BOOL)isInline;
- (BOOL)willUseActionDelegate;
- (CGSize)intrinsicContentSize;
- (NSArray)layoutConstraints;
- (NSLayoutConstraint)escapeHatchButtonBottomConstraint;
- (NSLayoutConstraint)escapeHatchButtonLeadingConstraint;
- (NSLayoutConstraint)escapeHatchButtonTrailingConstraint;
- (NSLayoutConstraint)nextStateButtonContainerBottomConstraintTall;
- (NSLayoutConstraint)nextStateButtonContainerHorizontalPositionConstraint;
- (UIButton)bottomLinkButton;
- (UIButton)nextStateButton;
- (UIButton)topLinkButton;
- (UITraitChangeRegistration)traitChangeRegistration;
- (UIView)bottomPaddingView;
- (UIView)nextStateButtonContainer;
- (double)_bottomPadding;
- (id)nextStateButtonContainerHorizontalPositionConstraint:(BOOL)a3;
- (int64_t)displayState;
- (void)_layoutInternalButtonsForDisplayState:(int64_t)a3;
- (void)continueButtonPressed:(id)a3;
- (void)linkButtonPressed:(id)a3;
- (void)setActionDelegate:(id)a3;
- (void)setBottomLinkButton:(id)a3;
- (void)setBottomPaddingView:(id)a3;
- (void)setEscapeHatchButtonBottomConstraint:(id)a3;
- (void)setEscapeHatchButtonLeadingConstraint:(id)a3;
- (void)setEscapeHatchButtonTrailingConstraint:(id)a3;
- (void)setInSheet:(BOOL)a3;
- (void)setIsInline:(BOOL)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setNextStateButton:(id)a3;
- (void)setNextStateButtonContainer:(id)a3;
- (void)setNextStateButtonContainerBottomConstraintTall:(id)a3;
- (void)setNextStateButtonContainerHorizontalPositionConstraint:(id)a3;
- (void)setTopLinkButton:(id)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setWillUseActionDelegate:(BOOL)a3;
- (void)showRetryButton;
- (void)topLinkButtonPressed:(id)a3;
- (void)updateButtonLayout;
@end

@implementation BKUIButtonTray

- (BKUIButtonTray)initWithFrame:(CGRect)a3
{
  return -[BKUIButtonTray initWithFrame:willUseActionDelegate:](self, "initWithFrame:willUseActionDelegate:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (BKUIButtonTray)initWithFrame:(CGRect)a3 willUseActionDelegate:(BOOL)a4
{
  BOOL v103 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v121[4] = *MEMORY[0x1E4F143B8];
  v114.receiver = self;
  v114.super_class = (Class)BKUIButtonTray;
  v8 = -[BKUIButtonTray initWithFrame:](&v114, sel_initWithFrame_);
  if (v8)
  {
    +[BKUIStyle _obkStyleButtonMarginsForParentBounds:](BKUIStyle, "_obkStyleButtonMarginsForParentBounds:", x, y, width, height);
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", x, y, width, height);
    nextStateButtonContainer = v8->_nextStateButtonContainer;
    p_nextStateButtonContainer = (id *)&v8->_nextStateButtonContainer;
    v8->_nextStateButtonContainer = (UIView *)v13;

    [(UIView *)v8->_nextStateButtonContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BKUIButtonTray *)v8 addSubview:v8->_nextStateButtonContainer];
    v15 = +[BKUIStyle sharedStyle];
    v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"START_ENROLL" value:&stru_1F4081468 table:@"Pearl-periocular"];
    uint64_t v18 = [v15 continueButtonWithTitle:v17 inView:v8->_nextStateButtonContainer];
    nextStateButton = v8->_nextStateButton;
    p_nextStateButton = (id *)&v8->_nextStateButton;
    v8->_nextStateButton = (UIButton *)v18;

    v20 = [(UIButton *)v8->_nextStateButton layer];
    [v20 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    uint64_t v21 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    p_bottomLinkButton = (id *)&v8->_bottomLinkButton;
    bottomLinkButton = v8->_bottomLinkButton;
    v8->_bottomLinkButton = (UIButton *)v21;

    v24 = (void *)MEMORY[0x1E4F42A38];
    BOOL v25 = [(BKUIButtonTray *)v8 inSheet];
    v26 = (void *)MEMORY[0x1E4F438F8];
    if (!v25) {
      v26 = (void *)MEMORY[0x1E4F43870];
    }
    v107 = objc_msgSend(v24, "preferredFontDescriptorWithTextStyle:", *v26, 440);
    v27 = (void *)MEMORY[0x1E4F42A30];
    v28 = [v107 fontDescriptorWithSymbolicTraits:2];
    v108 = [v27 fontWithDescriptor:v28 size:0.0];

    v29 = [*p_bottomLinkButton titleLabel];
    [v29 setFont:v108];

    v30 = [*p_bottomLinkButton titleLabel];
    [v30 setAdjustsFontSizeToFitWidth:1];

    [*p_bottomLinkButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BKUIButtonTray *)v8 addSubview:*p_bottomLinkButton];
    LODWORD(v31) = 1148846080;
    [*p_bottomLinkButton setContentHuggingPriority:1 forAxis:v31];
    v32 = [*p_bottomLinkButton leftAnchor];
    v33 = [(BKUIButtonTray *)v8 leftAnchor];
    uint64_t v34 = [v32 constraintEqualToAnchor:v33 constant:v10];
    escapeHatchButtonLeadingConstraint = v8->_escapeHatchButtonLeadingConstraint;
    v8->_escapeHatchButtonLeadingConstraint = (NSLayoutConstraint *)v34;

    v36 = [*p_bottomLinkButton rightAnchor];
    v37 = [(BKUIButtonTray *)v8 rightAnchor];
    double v38 = -v12;
    uint64_t v39 = [v36 constraintEqualToAnchor:v37 constant:v38];
    escapeHatchButtonTrailingConstraint = v8->_escapeHatchButtonTrailingConstraint;
    v8->_escapeHatchButtonTrailingConstraint = (NSLayoutConstraint *)v39;

    LODWORD(v41) = 1148829696;
    [(NSLayoutConstraint *)v8->_escapeHatchButtonBottomConstraint setPriority:v41];

    v42 = (void *)MEMORY[0x1E4F28DC8];
    v121[0] = v8->_escapeHatchButtonLeadingConstraint;
    v121[1] = v8->_escapeHatchButtonTrailingConstraint;
    v43 = [*p_bottomLinkButton centerXAnchor];
    v44 = [(BKUIButtonTray *)v8 centerXAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v121[2] = v45;
    v46 = [*p_bottomLinkButton heightAnchor];
    [*p_nextStateButton frame];
    v48 = [v46 constraintEqualToConstant:v47];
    v121[3] = v48;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:4];
    [v42 activateConstraints:v49];

    v50 = [*p_nextStateButtonContainer rightAnchor];
    v51 = [(BKUIButtonTray *)v8 rightAnchor];
    uint64_t v52 = [v50 constraintEqualToAnchor:v51];
    nextStateButtonContainerHorizontalPositionConstraint = v8->_nextStateButtonContainerHorizontalPositionConstraint;
    v8->_nextStateButtonContainerHorizontalPositionConstraint = (NSLayoutConstraint *)v52;

    v54 = [(BKUIButtonTray *)v8 topAnchor];
    v55 = [*p_nextStateButtonContainer topAnchor];
    v56 = [v54 constraintEqualToAnchor:v55 constant:-5.0];
    v120 = v56;
    uint64_t v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
    layoutConstraints = v8->_layoutConstraints;
    v8->_layoutConstraints = (NSArray *)v57;

    v59 = (void *)MEMORY[0x1E4F28DC8];
    v60 = [(BKUIButtonTray *)v8 layoutConstraints];
    [v59 activateConstraints:v60];

    v61 = (void *)MEMORY[0x1E4F28DC8];
    v119[0] = v8->_nextStateButtonContainerHorizontalPositionConstraint;
    v62 = [*p_nextStateButtonContainer widthAnchor];
    v63 = [(BKUIButtonTray *)v8 widthAnchor];
    v64 = [v62 constraintEqualToAnchor:v63];
    v119[1] = v64;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
    [v61 activateConstraints:v65];

    [*p_nextStateButton setAlpha:0.0];
    [*p_nextStateButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [*p_nextStateButtonContainer addSubview:*p_nextStateButton];
    v102 = (void *)MEMORY[0x1E4F28DC8];
    v106 = [*p_nextStateButton topAnchor];
    v105 = [*p_nextStateButtonContainer topAnchor];
    v104 = [v106 constraintEqualToAnchor:v105];
    v118[0] = v104;
    v66 = [*p_nextStateButton bottomAnchor];
    v67 = [*p_nextStateButtonContainer bottomAnchor];
    v68 = [v66 constraintEqualToAnchor:v67];
    v118[1] = v68;
    v69 = [*p_nextStateButton heightAnchor];
    [*p_nextStateButton frame];
    v71 = [v69 constraintEqualToConstant:v70];
    v118[2] = v71;
    v72 = [*p_nextStateButton bottomAnchor];
    v73 = [*p_nextStateButtonContainer bottomAnchor];
    v74 = [v72 constraintEqualToAnchor:v73];
    v118[3] = v74;
    v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:4];
    [v102 activateConstraints:v75];

    v76 = [*p_nextStateButton leftAnchor];
    v77 = [*p_nextStateButtonContainer leftAnchor];
    v78 = [v76 constraintEqualToAnchor:v77 constant:v10];
    v117[0] = v78;
    v79 = [*p_nextStateButton rightAnchor];
    v80 = [*p_nextStateButtonContainer rightAnchor];
    v81 = [v79 constraintEqualToAnchor:v80 constant:v38];
    v117[1] = v81;
    v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];

    v83 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v84 = [v83 userInterfaceIdiom];

    if ((v84 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v85 = [(UIButton *)v8->_nextStateButton widthAnchor];
      +[BKUIStyle _buttonSizeForPads];
      v86 = objc_msgSend(v85, "constraintEqualToConstant:");
      v116[0] = v86;
      v87 = [(UIButton *)v8->_nextStateButton centerXAnchor];
      v88 = [(BKUIButtonTray *)v8 centerXAnchor];
      v89 = [v87 constraintEqualToAnchor:v88];
      v116[1] = v89;
      uint64_t v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];

      v82 = (void *)v90;
    }
    [MEMORY[0x1E4F28DC8] activateConstraints:v82];
    [(BKUIButtonTray *)v8 _layoutInternalButtonsForDisplayState:3];
    uint64_t v91 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    topLinkButton = v8->_topLinkButton;
    v8->_topLinkButton = (UIButton *)v91;

    v93 = [(UIButton *)v8->_topLinkButton titleLabel];
    [v93 setFont:v108];

    v94 = [(UIButton *)v8->_topLinkButton titleLabel];
    [v94 setAdjustsFontSizeToFitWidth:1];

    [(UIButton *)v8->_topLinkButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v95 = v8->_topLinkButton;
    v96 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v97 = [v96 localizedStringForKey:@"TRY_AGAIN" value:&stru_1F4081468 table:@"Pearl-periocular"];
    [(UIButton *)v95 setTitle:v97 forState:0];

    [(UIButton *)v8->_topLinkButton setAlpha:0.0];
    if (v103)
    {
      v8->_willUseActionDelegate = v103;
      [(UIButton *)v8->_topLinkButton addTarget:v8 action:sel_topLinkButtonPressed_ forControlEvents:64];
      [(UIButton *)v8->_nextStateButton addTarget:v8 action:sel_continueButtonPressed_ forControlEvents:64];
      [*(id *)((char *)&v8->super.super.super.isa + v101) addTarget:v8 action:sel_linkButtonPressed_ forControlEvents:64];
    }
    objc_initWeak(&location, v8);
    v115[0] = objc_opt_class();
    v115[1] = objc_opt_class();
    v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __54__BKUIButtonTray_initWithFrame_willUseActionDelegate___block_invoke;
    v111[3] = &unk_1E6EA2070;
    objc_copyWeak(&v112, &location);
    v99 = [(BKUIButtonTray *)v8 registerForTraitChanges:v98 withHandler:v111];
    [(BKUIButtonTray *)v8 setTraitChangeRegistration:v99];

    objc_destroyWeak(&v112);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __54__BKUIButtonTray_initWithFrame_willUseActionDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained bounds];
  +[BKUIStyle _obkStyleButtonMarginsForParentBounds:](BKUIStyle, "_obkStyleButtonMarginsForParentBounds:");
  double v2 = v1;
  double v4 = v3;
  v5 = [WeakRetained escapeHatchButtonLeadingConstraint];
  [v5 setConstant:v2];

  v6 = [WeakRetained escapeHatchButtonTrailingConstraint];
  [v6 setConstant:-v4];

  [WeakRetained setNeedsLayout];
  [WeakRetained layoutIfNeeded];
}

- (void)topLinkButtonPressed:(id)a3
{
  id v3 = [(BKUIButtonTray *)self actionDelegate];
  [v3 buttonSelectedWithButtonTrayPosition:1];
}

- (void)linkButtonPressed:(id)a3
{
  id v3 = [(BKUIButtonTray *)self actionDelegate];
  [v3 buttonSelectedWithButtonTrayPosition:3];
}

- (void)continueButtonPressed:(id)a3
{
  id v3 = [(BKUIButtonTray *)self actionDelegate];
  [v3 buttonSelectedWithButtonTrayPosition:2];
}

- (void)_layoutInternalButtonsForDisplayState:(int64_t)a3
{
  v43[3] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28DC8];
  v6 = [(BKUIButtonTray *)self layoutConstraints];
  [v5 deactivateConstraints:v6];

  switch(a3)
  {
    case 1:
      v7 = [(BKUIButtonTray *)self nextStateButtonContainer];
      v8 = [v7 topAnchor];
      double v38 = [(BKUIButtonTray *)self topAnchor];
      uint64_t v39 = v8;
      v37 = objc_msgSend(v8, "constraintEqualToAnchor:constant:", 5.0);
      v43[0] = v37;
      v36 = [(BKUIButtonTray *)self bottomLinkButton];
      double v9 = [v36 topAnchor];
      double v10 = [(UIView *)self->_nextStateButtonContainer bottomAnchor];
      v35 = v9;
      double v11 = [v9 constraintEqualToAnchor:v10 constant:0.0];
      v43[1] = v11;
      double v12 = [(BKUIButtonTray *)self nextStateButtonContainer];
      uint64_t v13 = [v12 bottomAnchor];
      v14 = [(BKUIButtonTray *)self bottomAnchor];
      [(BKUIButtonTray *)self _bottomPadding];
      v16 = [v13 constraintEqualToAnchor:v14 constant:-v15];
      v43[2] = v16;
      v17 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v18 = v43;
      goto LABEL_4;
    case 2:
      v19 = [(BKUIButtonTray *)self bottomLinkButton];
      [v19 setAlpha:1.0];

      v7 = [(BKUIButtonTray *)self nextStateButtonContainer];
      v20 = [v7 topAnchor];
      double v38 = [(BKUIButtonTray *)self topAnchor];
      uint64_t v39 = v20;
      v37 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", 0.0);
      v42[0] = v37;
      v36 = [(BKUIButtonTray *)self bottomLinkButton];
      uint64_t v21 = [v36 topAnchor];
      double v10 = [(BKUIButtonTray *)self topAnchor];
      v35 = v21;
      double v11 = [v21 constraintEqualToAnchor:v10 constant:5.0];
      v42[1] = v11;
      double v12 = [(BKUIButtonTray *)self nextStateButtonContainer];
      uint64_t v13 = [v12 bottomAnchor];
      v14 = [(BKUIButtonTray *)self bottomAnchor];
      [(BKUIButtonTray *)self _bottomPadding];
      v16 = [v13 constraintEqualToAnchor:v14 constant:-v22];
      v42[2] = v16;
      v17 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v18 = v42;
LABEL_4:
      v23 = [v17 arrayWithObjects:v18 count:3];
      [(BKUIButtonTray *)self setLayoutConstraints:v23];
      goto LABEL_8;
    case 3:
      uint64_t v34 = [(BKUIButtonTray *)self nextStateButtonContainer];
      v24 = [v34 topAnchor];
      double v38 = [(BKUIButtonTray *)self topAnchor];
      uint64_t v39 = v24;
      v37 = objc_msgSend(v24, "constraintEqualToAnchor:constant:", 5.0);
      v41[0] = v37;
      v36 = [(BKUIButtonTray *)self bottomLinkButton];
      BOOL v25 = [v36 topAnchor];
      double v10 = [(BKUIButtonTray *)self nextStateButtonContainer];
      double v11 = [v10 bottomAnchor];
      v35 = v25;
      double v12 = [v25 constraintEqualToAnchor:v11 constant:5.0];
      v41[1] = v12;
      uint64_t v13 = [(BKUIButtonTray *)self bottomLinkButton];
      v14 = [v13 bottomAnchor];
      v16 = [(BKUIButtonTray *)self bottomAnchor];
      [(BKUIButtonTray *)self _bottomPadding];
      v23 = [v14 constraintEqualToAnchor:v16 constant:-v26];
      v41[2] = v23;
      v27 = (void *)MEMORY[0x1E4F1C978];
      v28 = v41;
      goto LABEL_7;
    case 4:
      uint64_t v34 = [(BKUIButtonTray *)self nextStateButtonContainer];
      v29 = [v34 topAnchor];
      double v38 = [(BKUIButtonTray *)self topAnchor];
      uint64_t v39 = v29;
      v37 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", 0.0);
      v40[0] = v37;
      v36 = [(BKUIButtonTray *)self bottomLinkButton];
      v30 = [v36 topAnchor];
      double v10 = [(BKUIButtonTray *)self nextStateButtonContainer];
      double v11 = [v10 bottomAnchor];
      v35 = v30;
      double v12 = [v30 constraintEqualToAnchor:v11 constant:0.0];
      v40[1] = v12;
      uint64_t v13 = [(BKUIButtonTray *)self bottomLinkButton];
      v14 = [v13 bottomAnchor];
      v16 = [(BKUIButtonTray *)self bottomAnchor];
      v23 = [v14 constraintEqualToAnchor:v16 constant:0.0];
      v40[2] = v23;
      v27 = (void *)MEMORY[0x1E4F1C978];
      v28 = v40;
LABEL_7:
      double v31 = [v27 arrayWithObjects:v28 count:3];
      [(BKUIButtonTray *)self setLayoutConstraints:v31];

      v7 = v34;
LABEL_8:

      break;
    default:
      break;
  }
  v32 = (void *)MEMORY[0x1E4F28DC8];
  v33 = [(BKUIButtonTray *)self layoutConstraints];
  [v32 activateConstraints:v33];
}

- (id)nextStateButtonContainerHorizontalPositionConstraint:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(BKUIButtonTray *)self nextStateButtonContainer];
  [v5 removeConstraint:self->_nextStateButtonContainerHorizontalPositionConstraint];

  v6 = [(BKUIButtonTray *)self nextStateButtonContainerHorizontalPositionConstraint];
  [v6 setActive:0];

  v7 = [(BKUIButtonTray *)self nextStateButtonContainer];
  v8 = v7;
  if (v3)
  {
    double v9 = [v7 rightAnchor];
    [(BKUIButtonTray *)self leftAnchor];
  }
  else
  {
    double v9 = [v7 leftAnchor];
    [(BKUIButtonTray *)self rightAnchor];
  double v10 = };
  double v11 = [v9 constraintEqualToAnchor:v10];
  [(BKUIButtonTray *)self setNextStateButtonContainerHorizontalPositionConstraint:v11];

  return [(BKUIButtonTray *)self nextStateButtonContainerHorizontalPositionConstraint];
}

- (void)updateButtonLayout
{
  BOOL v3 = [(BKUIButtonTray *)self topLinkButton];
  [v3 alpha];
  double v5 = v4;

  if (v5 == 1.0)
  {
    [(BKUIButtonTray *)self showRetryButton];
    v6 = [(BKUIButtonTray *)self nextStateButton];
    [v6 setHidden:1];

    [(BKUIButtonTray *)self _layoutInternalButtonsForDisplayState:3];
  }
  else
  {
    v7 = [(BKUIButtonTray *)self topLinkButton];
    [v7 removeFromSuperview];

    v8 = [(BKUIButtonTray *)self nextStateButton];
    [v8 setHidden:0];
  }
  double v9 = [(BKUIButtonTray *)self nextStateButtonContainer];
  [v9 setNeedsLayout];

  double v10 = [(BKUIButtonTray *)self nextStateButton];
  [v10 setNeedsLayout];

  id v11 = [(BKUIButtonTray *)self topLinkButton];
  [v11 setNeedsLayout];
}

- (void)showRetryButton
{
  v29[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(BKUIButtonTray *)self nextStateButtonContainer];
  double v4 = [(BKUIButtonTray *)self topLinkButton];
  [v3 addSubview:v4];

  v19 = (void *)MEMORY[0x1E4F28DC8];
  v28 = [(BKUIButtonTray *)self topLinkButton];
  double v26 = [v28 leadingAnchor];
  v27 = [(BKUIButtonTray *)self nextStateButtonContainer];
  BOOL v25 = [v27 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v29[0] = v24;
  v23 = [(BKUIButtonTray *)self topLinkButton];
  uint64_t v21 = [v23 trailingAnchor];
  double v22 = [(BKUIButtonTray *)self nextStateButtonContainer];
  v20 = [v22 trailingAnchor];
  uint64_t v18 = [v21 constraintEqualToAnchor:v20];
  v29[1] = v18;
  v17 = [(BKUIButtonTray *)self topLinkButton];
  v16 = [v17 topAnchor];
  double v5 = [(BKUIButtonTray *)self nextStateButtonContainer];
  v6 = [v5 topAnchor];
  v7 = [v16 constraintEqualToAnchor:v6];
  v29[2] = v7;
  v8 = [(BKUIButtonTray *)self topLinkButton];
  double v9 = [v8 bottomAnchor];
  double v10 = [(BKUIButtonTray *)self nextStateButtonContainer];
  id v11 = [v10 bottomAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  v29[3] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v19 activateConstraints:v13];

  v14 = [(BKUIButtonTray *)self topLinkButton];
  [v14 setAlpha:1.0];

  double v15 = [(BKUIButtonTray *)self topLinkButton];
  [v15 setEnabled:1];

  [(BKUIButtonTray *)self _layoutInternalButtonsForDisplayState:3];
}

- (double)_bottomPadding
{
  BOOL v2 = [(BKUIButtonTray *)self inSheet];
  double result = 34.0;
  if (v2) {
    return 5.0;
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(BKUIButtonTray *)self frame];
  double v4 = v3;
  double v5 = [(BKUIButtonTray *)self nextStateButtonContainer];
  [v5 intrinsicContentSize];
  double v7 = v6;
  v8 = [(BKUIButtonTray *)self bottomLinkButton];
  [v8 intrinsicContentSize];
  double v10 = v7 + v9;
  [(BKUIButtonTray *)self _bottomPadding];
  double v12 = v11 + v10 + 10.0;

  double v13 = v4;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (int64_t)displayState
{
  double v4 = [(BKUIButtonTray *)self nextStateButton];
  [v4 alpha];
  double v6 = v5;
  if (v5 == 1.0
    || ([(BKUIButtonTray *)self topLinkButton],
        BOOL v2 = objc_claimAutoreleasedReturnValue(),
        [v2 alpha],
        v7 == 1.0))
  {
    v8 = [(BKUIButtonTray *)self bottomLinkButton];
    [v8 alpha];
    double v10 = v9;

    if (v6 != 1.0) {
    if (v10 == 1.0)
    }
      return 3;
  }
  else
  {
  }
  double v12 = [(BKUIButtonTray *)self nextStateButton];
  [v12 alpha];
  if (v13 == 0.0)
  {
    double v14 = [(BKUIButtonTray *)self bottomLinkButton];
    [v14 alpha];
    double v16 = v15;

    if (v16 == 1.0) {
      return 2;
    }
  }
  else
  {
  }
  v17 = [(BKUIButtonTray *)self nextStateButton];
  [v17 alpha];
  if (v18 == 1.0)
  {
    v19 = [(BKUIButtonTray *)self bottomLinkButton];
    [v19 alpha];
    double v21 = v20;

    if (v21 == 0.0) {
      return 1;
    }
    else {
      return 4;
    }
  }
  else
  {

    return 4;
  }
}

- (UIButton)nextStateButton
{
  return self->_nextStateButton;
}

- (void)setNextStateButton:(id)a3
{
}

- (UIView)nextStateButtonContainer
{
  return self->_nextStateButtonContainer;
}

- (void)setNextStateButtonContainer:(id)a3
{
}

- (NSLayoutConstraint)nextStateButtonContainerHorizontalPositionConstraint
{
  return self->_nextStateButtonContainerHorizontalPositionConstraint;
}

- (void)setNextStateButtonContainerHorizontalPositionConstraint:(id)a3
{
}

- (UIButton)bottomLinkButton
{
  return self->_bottomLinkButton;
}

- (void)setBottomLinkButton:(id)a3
{
}

- (UIButton)topLinkButton
{
  return self->_topLinkButton;
}

- (void)setTopLinkButton:(id)a3
{
}

- (NSLayoutConstraint)nextStateButtonContainerBottomConstraintTall
{
  return self->_nextStateButtonContainerBottomConstraintTall;
}

- (void)setNextStateButtonContainerBottomConstraintTall:(id)a3
{
}

- (NSLayoutConstraint)escapeHatchButtonLeadingConstraint
{
  return self->_escapeHatchButtonLeadingConstraint;
}

- (void)setEscapeHatchButtonLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)escapeHatchButtonTrailingConstraint
{
  return self->_escapeHatchButtonTrailingConstraint;
}

- (void)setEscapeHatchButtonTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)escapeHatchButtonBottomConstraint
{
  return self->_escapeHatchButtonBottomConstraint;
}

- (void)setEscapeHatchButtonBottomConstraint:(id)a3
{
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (void)setIsInline:(BOOL)a3
{
  self->_isInline = a3;
}

- (BOOL)willUseActionDelegate
{
  return self->_willUseActionDelegate;
}

- (void)setWillUseActionDelegate:(BOOL)a3
{
  self->_willUseActionDelegate = a3;
}

- (BKUIButtonTrayActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (BKUIButtonTrayActionDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (void)setInSheet:(BOOL)a3
{
  self->_inSheet = a3;
}

- (UIView)bottomPaddingView
{
  return self->_bottomPaddingView;
}

- (void)setBottomPaddingView:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_bottomPaddingView, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_escapeHatchButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_escapeHatchButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_escapeHatchButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainerBottomConstraintTall, 0);
  objc_storeStrong((id *)&self->_topLinkButton, 0);
  objc_storeStrong((id *)&self->_bottomLinkButton, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainerHorizontalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainer, 0);

  objc_storeStrong((id *)&self->_nextStateButton, 0);
}

@end