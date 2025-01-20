@interface DOCAddTagView
- (BOOL)isEditing;
- (BOOL)scribbleInteractionShouldDelayFocus:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CAShapeLayer)backgroundShapeLayer;
- (DOCAddTagTextFieldDelegate)delegate;
- (DOCAddTagView)initWithFrame:(CGRect)a3;
- (DOCAddTagViewTextField)tagNameTextField;
- (DOCTagDotView)tagDotView;
- (NSArray)notificationObservances;
- (NSString)text;
- (UILabel)addNewTagLabel;
- (void)_updateBorderPath;
- (void)_updateShapeLayerAttributes;
- (void)cancel;
- (void)commit;
- (void)dealloc;
- (void)handleTapGesture:(id)a3;
- (void)layoutSubviews;
- (void)scribbleInteractionWillBeginWriting:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShowingAddNewTagLabel:(BOOL)a3;
- (void)setupHoverEffects;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateBackground;
- (void)updateHoverEffects;
@end

@implementation DOCAddTagView

- (DOCAddTagView)initWithFrame:(CGRect)a3
{
  v128[4] = *MEMORY[0x263EF8340];
  v125.receiver = self;
  v125.super_class = (Class)DOCAddTagView;
  v3 = -[DOCAddTagView initWithFrame:](&v125, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F15880] layer];
    backgroundShapeLayer = v3->_backgroundShapeLayer;
    v3->_backgroundShapeLayer = (CAShapeLayer *)v4;

    [(CAShapeLayer *)v3->_backgroundShapeLayer setFillColor:0];
    v6 = [(DOCAddTagView *)v3 layer];
    [v6 addSublayer:v3->_backgroundShapeLayer];

    v7 = (void *)MEMORY[0x263F81708];
    v8 = +[DOCTagAppearance pickerList];
    v9 = [v8 titleTextStyle];
    v119 = [v7 preferredFontForTextStyle:v9];

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    addNewTagLabel = v3->_addNewTagLabel;
    v3->_addNewTagLabel = v10;

    v12 = _DocumentManagerBundle();
    v13 = [v12 localizedStringForKey:@"Add New Tag [Action Title]" value:@"Add New Tag…" table:@"Localizable"];
    [(UILabel *)v3->_addNewTagLabel setText:v13];

    [(UILabel *)v3->_addNewTagLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_addNewTagLabel setFont:v119];
    [(UILabel *)v3->_addNewTagLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v14) = 1148846080;
    [(UILabel *)v3->_addNewTagLabel setContentCompressionResistancePriority:1 forAxis:v14];
    v15 = [[DOCTagDotView alloc] initWithDefaultTagDimension:1 adjustsSizeForContentSizeCategory:DOCDefaultTagDimension()];
    tagDotView = v3->_tagDotView;
    v3->_tagDotView = v15;

    v17 = [MEMORY[0x263F3ABC0] untitledTagForRendering:0];
    [(DOCTagDotView *)v3->_tagDotView setItemTag:v17];

    v18 = objc_alloc_init(DOCAddTagViewTextField);
    tagNameTextField = v3->_tagNameTextField;
    v3->_tagNameTextField = v18;

    [(DOCAddTagViewTextField *)v3->_tagNameTextField setFont:v119];
    [(DOCAddTagViewTextField *)v3->_tagNameTextField setAdjustsFontForContentSizeCategory:1];
    [(DOCAddTagViewTextField *)v3->_tagNameTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v20) = 1148846080;
    [(DOCAddTagViewTextField *)v3->_tagNameTextField setContentCompressionResistancePriority:1 forAxis:v20];
    [(DOCAddTagViewTextField *)v3->_tagNameTextField setEnablesReturnKeyAutomatically:1];
    [(DOCAddTagViewTextField *)v3->_tagNameTextField setDelegate:v3];
    v116 = (void *)[objc_alloc(MEMORY[0x263F82B78]) initWithDelegate:v3];
    [(DOCAddTagViewTextField *)v3->_tagNameTextField addInteraction:v116];
    [(DOCAddTagViewTextField *)v3->_tagNameTextField addTarget:v3 action:sel_textFieldDidChange_ forControlEvents:0x20000];
    v21 = [(DOCAddTagView *)v3 tagDotView];
    [(DOCAddTagView *)v3 addSubview:v21];

    v22 = [(DOCAddTagView *)v3 addNewTagLabel];
    [(DOCAddTagView *)v3 addSubview:v22];

    v23 = [(DOCAddTagView *)v3 tagNameTextField];
    [(DOCAddTagView *)v3 addSubview:v23];

    v24 = +[DOCTagAppearance makerUI];
    LODWORD(v13) = [v24 inputFieldShowsLeadingDot];

    if (v13)
    {
      v25 = [(DOCAddTagView *)v3 tagNameTextField];
      v26 = [v25 leadingAnchor];
      v27 = [(DOCAddTagView *)v3 addNewTagLabel];
      v28 = [v27 leadingAnchor];
      v115 = [v26 constraintEqualToAnchor:v28];

      v29 = [(DOCAddTagView *)v3 addNewTagLabel];
      v30 = [v29 trailingAnchor];
      v31 = [(DOCAddTagView *)v3 tagNameTextField];
      v32 = [v31 trailingAnchor];
      [v30 constraintEqualToAnchor:v32];
    }
    else
    {
      v33 = +[DOCTagAppearance pickerList];
      objc_msgSend(v33, "spacing_leadingEdgeToDot");
      double v35 = v34;

      v36 = [(DOCAddTagView *)v3 tagNameTextField];
      v37 = [v36 leadingAnchor];
      v38 = [(DOCAddTagView *)v3 layoutMarginsGuide];
      v39 = [v38 leadingAnchor];
      v115 = [v37 constraintEqualToAnchor:v39 constant:v35];

      v29 = [(DOCAddTagView *)v3 addNewTagLabel];
      v30 = [v29 trailingAnchor];
      v31 = [(DOCAddTagView *)v3 tagNameTextField];
      v32 = [v31 trailingAnchor];
      [v30 constraintEqualToAnchor:v32 constant:v35];
    v108 = };

    v40 = +[DOCTagAppearance makerUI];
    [v40 inputFieldRoundedCornerBackgroundMargins];
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;

    if (v44 != *(double *)(MEMORY[0x263F82250] + 8)
      || v42 != *MEMORY[0x263F82250]
      || v48 != *(double *)(MEMORY[0x263F82250] + 24)
      || v46 != *(double *)(MEMORY[0x263F82250] + 16))
    {
      v117 = [(DOCAddTagView *)v3 tagNameTextField];
      v49 = (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *)objc_opt_new();
      [(DOCTextFieldRoundedBackgroundView *)v49 setTranslatesAutoresizingMaskIntoConstraints:0];
      backgroundDuringTextInput = v3->_backgroundDuringTextInput;
      v3->_backgroundDuringTextInput = v49;
      v51 = v49;

      [(DOCAddTagView *)v3 addSubview:v51];
      v102 = (void *)MEMORY[0x263F08938];
      v113 = [(DOCTextFieldRoundedBackgroundView *)v51 topAnchor];
      v111 = [v117 topAnchor];
      v109 = [v113 constraintEqualToAnchor:v111 constant:-v42];
      v128[0] = v109;
      v106 = [(DOCTextFieldRoundedBackgroundView *)v51 bottomAnchor];
      v104 = [v117 bottomAnchor];
      v52 = [v106 constraintEqualToAnchor:v104 constant:v46];
      v128[1] = v52;
      v53 = [(DOCTextFieldRoundedBackgroundView *)v51 leadingAnchor];
      v54 = [v117 leadingAnchor];
      v55 = [v53 constraintEqualToAnchor:v54 constant:-v44];
      v128[2] = v55;
      v56 = [(DOCTextFieldRoundedBackgroundView *)v51 trailingAnchor];
      v57 = [v117 trailingAnchor];
      v58 = [v56 constraintEqualToAnchor:v57 constant:v48];
      v128[3] = v58;
      v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:4];
      [v102 activateConstraints:v59];

      v60 = (void *)MEMORY[0x263F82E00];
      v123[0] = MEMORY[0x263EF8330];
      v123[1] = 3221225472;
      v123[2] = __31__DOCAddTagView_initWithFrame___block_invoke;
      v123[3] = &unk_2648FB608;
      v124 = v3;
      [v60 performWithoutAnimation:v123];
    }
    v61 = +[DOCTagAppearance pickerList];
    [v61 cellInteriorLayoutMargins];
    [(DOCAddTagView *)v3 setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];

    v80 = (void *)MEMORY[0x263F08938];
    v112 = [(DOCAddTagView *)v3 leadingAnchor];
    v118 = [(DOCAddTagView *)v3 tagDotView];
    v110 = [v118 leadingAnchor];
    v114 = +[DOCTagAppearance pickerList];
    objc_msgSend(v114, "spacing_leadingEdgeToDot");
    v107 = [v112 constraintEqualToAnchor:v110 constant:-v62];
    v127[0] = v107;
    v105 = [(DOCAddTagView *)v3 tagDotView];
    v100 = [v105 trailingAnchor];
    v103 = [(DOCAddTagView *)v3 addNewTagLabel];
    v99 = [v103 leadingAnchor];
    v101 = +[DOCTagAppearance pickerList];
    objc_msgSend(v101, "spacing_dotToTitle");
    v98 = [v100 constraintEqualToAnchor:v99 constant:-v63];
    v127[1] = v98;
    v97 = [(DOCAddTagView *)v3 addNewTagLabel];
    v95 = [v97 trailingAnchor];
    v96 = [(DOCAddTagView *)v3 layoutMarginsGuide];
    v94 = [v96 trailingAnchor];
    v93 = [v95 constraintEqualToAnchor:v94];
    v127[2] = v93;
    v127[3] = v115;
    v127[4] = v108;
    v92 = [(DOCAddTagView *)v3 addNewTagLabel];
    v90 = [v92 firstBaselineAnchor];
    v91 = [(DOCAddTagView *)v3 layoutMarginsGuide];
    v89 = [v91 topAnchor];
    v88 = [v90 constraintEqualToSystemSpacingBelowAnchor:v89 multiplier:0.979591837];
    v127[5] = v88;
    v87 = [(DOCAddTagView *)v3 layoutMarginsGuide];
    v85 = [v87 bottomAnchor];
    v86 = [(DOCAddTagView *)v3 addNewTagLabel];
    v84 = [v86 lastBaselineAnchor];
    v83 = [v85 constraintEqualToSystemSpacingBelowAnchor:v84 multiplier:1.12];
    v127[6] = v83;
    v82 = [(DOCAddTagView *)v3 tagDotView];
    v81 = [v82 centerYAnchor];
    v64 = [(DOCAddTagView *)v3 addNewTagLabel];
    v65 = [v64 centerYAnchor];
    v66 = [v81 constraintEqualToAnchor:v65];
    v127[7] = v66;
    v67 = [(DOCAddTagView *)v3 addNewTagLabel];
    v68 = [v67 firstBaselineAnchor];
    v69 = [(DOCAddTagView *)v3 tagNameTextField];
    v70 = [v69 firstBaselineAnchor];
    v71 = [v68 constraintEqualToAnchor:v70];
    v127[8] = v71;
    v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v127 count:9];
    [v80 activateConstraints:v72];

    v73 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v3 action:sel_handleTapGesture_];
    [(DOCAddTagView *)v3 addGestureRecognizer:v73];

    objc_initWeak(&location, v3);
    v74 = [MEMORY[0x263F08A00] defaultCenter];
    v75 = [MEMORY[0x263F08A48] mainQueue];
    v120[0] = MEMORY[0x263EF8330];
    v120[1] = 3221225472;
    v120[2] = __31__DOCAddTagView_initWithFrame___block_invoke_2;
    v120[3] = &unk_2648FB658;
    objc_copyWeak(&v121, &location);
    v76 = [v74 addObserverForName:*MEMORY[0x263F83190] object:0 queue:v75 usingBlock:v120];
    v126 = v76;
    uint64_t v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v126 count:1];
    notificationObservances = v3->_notificationObservances;
    v3->_notificationObservances = (NSArray *)v77;

    [(DOCAddTagView *)v3 setupHoverEffects];
    objc_destroyWeak(&v121);
    objc_destroyWeak(&location);
  }
  return v3;
}

uint64_t __31__DOCAddTagView_initWithFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBackground];
}

void __31__DOCAddTagView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateBackground];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  notificationObservances = self->_notificationObservances;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __24__DOCAddTagView_dealloc__block_invoke;
  v7[3] = &unk_2648FB680;
  id v8 = v3;
  id v5 = v3;
  [(NSArray *)notificationObservances enumerateObjectsUsingBlock:v7];

  v6.receiver = self;
  v6.super_class = (Class)DOCAddTagView;
  [(DOCAddTagView *)&v6 dealloc];
}

uint64_t __24__DOCAddTagView_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObserver:a2];
}

- (BOOL)isEditing
{
  v2 = [(DOCAddTagView *)self tagNameTextField];
  char v3 = [v2 isEditing];

  return v3;
}

- (void)setupHoverEffects
{
  [(DOCAddTagViewTextField *)self->_tagNameTextField setHoverStyle:0];
  char v3 = +[DOCTagAppearance pickerList];
  uint64_t v4 = [v3 cellContentHoverStyle];
  [(DOCAddTagView *)self setHoverStyle:v4];

  [(DOCAddTagView *)self updateHoverEffects];
}

- (void)updateHoverEffects
{
  uint64_t v3 = [(DOCAddTagView *)self isEditing] ^ 1;
  id v4 = [(DOCAddTagView *)self hoverStyle];
  [v4 setEnabled:v3];
}

- (void)updateBackground
{
  [(DOCAddTagView *)self _updateShapeLayerAttributes];
  [(DOCAddTagView *)self _updateBorderPath];
  if (self->_backgroundDuringTextInput)
  {
    BOOL v3 = [(DOCAddTagView *)self isEditing];
    [(DOCTextFieldRoundedBackgroundView *)self->_backgroundDuringTextInput setHidden:v3 ^ 1];
    [(CAShapeLayer *)self->_backgroundShapeLayer setHidden:v3];
  }

  [(DOCAddTagView *)self updateHoverEffects];
}

- (void)_updateShapeLayerAttributes
{
  id v10 = [(DOCAddTagView *)self backgroundShapeLayer];
  BOOL v3 = +[DOCTagAppearance pickerList];
  int v4 = [v3 addTagCellShowsDashedBorder];

  if (v4)
  {
    if ([(DOCAddTagView *)self isEditing])
    {
      id v5 = 0;
    }
    else if (UIAccessibilityIsBoldTextEnabled())
    {
      id v5 = &unk_26DF542B0;
    }
    else
    {
      id v5 = &unk_26DF542C8;
    }
    [v10 setLineDashPattern:v5];
    BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
    double v9 = 1.0;
    if (IsBoldTextEnabled) {
      double v9 = 2.0;
    }
    [v10 setLineWidth:v9];
    id v6 = [MEMORY[0x263F825C8] separatorColor];
    objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v6, "CGColor"));
  }
  else
  {
    id v6 = +[DOCTagAppearance pickerList];
    id v7 = [v6 backgroundColorForTag:0 selected:0];
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v7, "CGColor"));
  }
}

- (void)_updateBorderPath
{
  BOOL v3 = [(DOCAddTagView *)self backgroundShapeLayer];
  [v3 lineWidth];
  CGFloat v5 = v4 * 0.5;

  [(DOCAddTagView *)self bounds];
  CGRect v28 = CGRectInset(v27, v5, v5);
  double x = v28.origin.x;
  double y = v28.origin.y;
  double width = v28.size.width;
  double height = v28.size.height;
  if (CGRectIsNull(v28))
  {
    id v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x263F824C0];
    v12 = +[DOCTagAppearance pickerList];
    [v12 cellCornerRadius];
    id v10 = objc_msgSend(v11, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v13);
  }
  id v25 = v10;
  uint64_t v14 = [v25 CGPath];
  v15 = [(DOCAddTagView *)self backgroundShapeLayer];
  [v15 setPath:v14];

  [(DOCAddTagView *)self bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(DOCAddTagView *)self backgroundShapeLayer];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)DOCAddTagView;
  [(DOCAddTagView *)&v17 layoutSubviews];
  BOOL v3 = [(DOCAddTagView *)self backgroundShapeLayer];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(DOCAddTagView *)self bounds];
  v19.origin.double x = v12;
  v19.origin.double y = v13;
  v19.size.double width = v14;
  v19.size.double height = v15;
  v18.origin.double x = v5;
  v18.origin.double y = v7;
  v18.size.double width = v9;
  v18.size.double height = v11;
  BOOL v16 = CGRectEqualToRect(v18, v19);

  if (!v16) {
    [(DOCAddTagView *)self updateBackground];
  }
}

- (void)commit
{
  BOOL v3 = [(DOCAddTagView *)self tagNameTextField];
  [(DOCAddTagView *)self textFieldShouldReturn:v3];

  [(DOCAddTagView *)self endEditing:0];
  id v4 = [(DOCAddTagView *)self tagNameTextField];
  [v4 setText:&stru_26DF49380];
}

- (void)cancel
{
  [(DOCAddTagView *)self endEditing:1];

  [(DOCAddTagView *)self setShowingAddNewTagLabel:1];
}

- (void)handleTapGesture:(id)a3
{
  id v3 = [(DOCAddTagView *)self tagNameTextField];
  [v3 becomeFirstResponder];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  [(DOCAddTagView *)self setShowingAddNewTagLabel:0];
  [(DOCAddTagView *)self updateBackground];
  id v4 = [(DOCAddTagView *)self delegate];
  [v4 addTagTextFieldDidBeginEditing:self];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = [(DOCAddTagView *)self delegate];
  int v5 = [v4 addTagTextFieldShouldEndEditing:self];

  if (v5)
  {
    [(DOCAddTagView *)self setShowingAddNewTagLabel:1];
    [(DOCAddTagView *)self updateBackground];
    id v6 = [(DOCAddTagView *)self delegate];
    [v6 addTagTextFieldDidEndEditing:self];
  }
}

- (void)setShowingAddNewTagLabel:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(DOCAddTagView *)self addNewTagLabel];
  id v6 = v5;
  if (v3)
  {
    [v5 setHidden:0];

    CGFloat v7 = [(DOCAddTagView *)self tagDotView];
    [v7 setHidden:0];

    double v8 = [(DOCAddTagView *)self tagNameTextField];
    [v8 setText:&stru_26DF49380];

    id v14 = [(DOCAddTagView *)self tagNameTextField];
    [v14 setPlaceholder:&stru_26DF49380];
  }
  else
  {
    [v5 setHidden:1];

    CGFloat v9 = +[DOCTagAppearance makerUI];
    uint64_t v10 = [v9 inputFieldShowsLeadingDot] ^ 1;
    CGFloat v11 = [(DOCAddTagView *)self tagDotView];
    [v11 setHidden:v10];

    _DocumentManagerBundle();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    CGFloat v12 = [v14 localizedStringForKey:@"Tag Name" value:@"Tag Name" table:@"Localizable"];
    CGFloat v13 = [(DOCAddTagView *)self tagNameTextField];
    [v13 setPlaceholder:v12];
  }
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = [(DOCAddTagView *)self delegate];
  [v4 addTagTextFieldDidChange:self];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  int v5 = [(DOCAddTagView *)self delegate];
  id v6 = [(DOCAddTagView *)self tagNameTextField];
  CGFloat v7 = [v6 text];
  int v8 = [v5 addTagTextField:self userDidCreateTagWithName:v7];

  if (v8) {
    [v4 resignFirstResponder];
  }

  return v8;
}

- (NSString)text
{
  v2 = [(DOCAddTagView *)self tagNameTextField];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (BOOL)scribbleInteractionShouldDelayFocus:(id)a3
{
  return 1;
}

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__DOCAddTagView_scribbleInteractionWillBeginWriting___block_invoke;
  v3[3] = &unk_2648FB608;
  v3[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v3 animations:0.2];
}

uint64_t __53__DOCAddTagView_scribbleInteractionWillBeginWriting___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowingAddNewTagLabel:0];
}

- (DOCAddTagTextFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DOCAddTagTextFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DOCTagDotView)tagDotView
{
  return self->_tagDotView;
}

- (UILabel)addNewTagLabel
{
  return self->_addNewTagLabel;
}

- (DOCAddTagViewTextField)tagNameTextField
{
  return self->_tagNameTextField;
}

- (CAShapeLayer)backgroundShapeLayer
{
  return self->_backgroundShapeLayer;
}

- (NSArray)notificationObservances
{
  return self->_notificationObservances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservances, 0);
  objc_storeStrong((id *)&self->_backgroundShapeLayer, 0);
  objc_storeStrong((id *)&self->_tagNameTextField, 0);
  objc_storeStrong((id *)&self->_addNewTagLabel, 0);
  objc_storeStrong((id *)&self->_tagDotView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_backgroundDuringTextInput, 0);
}

@end