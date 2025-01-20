@interface PKPaletteToolPickerAndColorPickerView
- (BOOL)_hasColorPickerContainerView;
- (BOOL)_useCompactSize;
- (BOOL)isInputAssistantViewVisible;
- (BOOL)isLassoToolEditingViewVisible;
- (BOOL)isSmallestSupportedCompactWidth;
- (BOOL)wantsColorPickerContainerViewInHierarchy;
- (NSLayoutConstraint)compactColorPickerContainerViewHeightConstraint;
- (NSLayoutConstraint)compactColorPickerContainerViewWidthConstraint;
- (NSLayoutConstraint)compactToolPickerContainerViewHeightConstraint;
- (NSLayoutConstraint)compactToolPickerContainerViewWidthConstraint;
- (NSLayoutConstraint)lassoToolEditingContainerViewCompactHeightConstraint;
- (NSLayoutConstraint)lassoToolEditingContainerViewCompactWidthConstraint;
- (NSLayoutConstraint)lassoToolEditingContainerViewHeightConstraint;
- (NSLayoutConstraint)lassoToolEditingContainerViewWidthConstraint;
- (NSLayoutConstraint)toolPickerContainerViewHeightConstraint;
- (NSLayoutConstraint)toolPickerContainerViewWidthConstraint;
- (NSString)lassoToolEditingViewIdentifier;
- (PKDrawingPaletteInputAssistantView)paletteInputAssistantView;
- (PKPaletteColorPickerContainerView)colorPickerContainerView;
- (PKPaletteColorPickerView)colorPickerView;
- (PKPaletteToolPickerAndColorPickerView)init;
- (PKPaletteToolPickerContainerView)toolPickerContainerView;
- (PKPaletteToolPickerView)toolPickerView;
- (UIStackView)stackView;
- (UIView)lassoToolEditingContainerView;
- (UIView)lassoToolEditingView;
- (double)_compactToolsContainerWidth;
- (double)_stackViewSpacing;
- (double)scalingFactor;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)contextEditingMode;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_updateUI;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
- (void)setColorPickerContainerView:(id)a3;
- (void)setCompactColorPickerContainerViewHeightConstraint:(id)a3;
- (void)setCompactColorPickerContainerViewWidthConstraint:(id)a3;
- (void)setCompactToolPickerContainerViewHeightConstraint:(id)a3;
- (void)setCompactToolPickerContainerViewWidthConstraint:(id)a3;
- (void)setContextEditingMode:(int64_t)a3;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setInputAssistantViewVisible:(BOOL)a3;
- (void)setIsSmallestSupportedCompactWidth:(BOOL)a3;
- (void)setLassoToolEditingContainerView:(id)a3;
- (void)setLassoToolEditingContainerViewCompactHeightConstraint:(id)a3;
- (void)setLassoToolEditingContainerViewCompactWidthConstraint:(id)a3;
- (void)setLassoToolEditingContainerViewHeightConstraint:(id)a3;
- (void)setLassoToolEditingContainerViewWidthConstraint:(id)a3;
- (void)setLassoToolEditingViewIdentifier:(id)a3;
- (void)setLassoToolEditingViewVisible:(BOOL)a3;
- (void)setScalingFactor:(double)a3;
- (void)setStackView:(id)a3;
- (void)setToolPickerContainerView:(id)a3;
- (void)setToolPickerContainerViewHeightConstraint:(id)a3;
- (void)setToolPickerContainerViewWidthConstraint:(id)a3;
- (void)setWantsColorPickerContainerViewInHierarchy:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPaletteToolPickerAndColorPickerView

- (PKPaletteToolPickerAndColorPickerView)init
{
  v72[4] = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)PKPaletteToolPickerAndColorPickerView;
  v2 = [(PKPaletteToolPickerAndColorPickerView *)&v71 init];
  v3 = v2;
  if (v2)
  {
    v2->_scalingFactor = 1.0;
    v2->_wantsColorPickerContainerViewInHierarchy = 1;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    lassoToolEditingViewForIdentifierTable = v3->_lassoToolEditingViewForIdentifierTable;
    v3->_lassoToolEditingViewForIdentifierTable = (NSMutableDictionary *)v4;

    v6 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    stackView = v3->_stackView;
    v3->_stackView = v6;

    [(UIStackView *)v3->_stackView setAxis:0];
    [(UIStackView *)v3->_stackView setAlignment:3];
    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteToolPickerAndColorPickerView *)v3 addSubview:v3->_stackView];
    v65 = (void *)MEMORY[0x1E4F28DC8];
    v70 = [(UIStackView *)v3->_stackView topAnchor];
    v69 = [(PKPaletteToolPickerAndColorPickerView *)v3 topAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v72[0] = v68;
    v67 = [(UIStackView *)v3->_stackView bottomAnchor];
    v66 = [(PKPaletteToolPickerAndColorPickerView *)v3 bottomAnchor];
    v8 = [v67 constraintEqualToAnchor:v66];
    v72[1] = v8;
    v9 = [(UIStackView *)v3->_stackView leftAnchor];
    v10 = [(PKPaletteToolPickerAndColorPickerView *)v3 leftAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v72[2] = v11;
    v12 = [(UIStackView *)v3->_stackView rightAnchor];
    v13 = [(PKPaletteToolPickerAndColorPickerView *)v3 rightAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v72[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:4];
    [v65 activateConstraints:v15];

    v16 = objc_alloc_init(PKPaletteToolPickerContainerView);
    toolPickerContainerView = v3->_toolPickerContainerView;
    v3->_toolPickerContainerView = v16;

    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_toolPickerContainerView];
    v18 = [(PKPaletteToolPickerContainerView *)v3->_toolPickerContainerView heightAnchor];
    v19 = [(UIStackView *)v3->_stackView heightAnchor];
    uint64_t v20 = [v18 constraintEqualToAnchor:v19];
    toolPickerContainerViewHeightConstraint = v3->_toolPickerContainerViewHeightConstraint;
    v3->_toolPickerContainerViewHeightConstraint = (NSLayoutConstraint *)v20;

    v22 = [(PKPaletteToolPickerContainerView *)v3->_toolPickerContainerView widthAnchor];
    v23 = [(UIStackView *)v3->_stackView widthAnchor];
    uint64_t v24 = [v22 constraintEqualToAnchor:v23];
    toolPickerContainerViewWidthConstraint = v3->_toolPickerContainerViewWidthConstraint;
    v3->_toolPickerContainerViewWidthConstraint = (NSLayoutConstraint *)v24;

    v26 = [(PKPaletteToolPickerContainerView *)v3->_toolPickerContainerView widthAnchor];
    uint64_t v27 = [v26 constraintEqualToConstant:28.0];
    compactToolPickerContainerViewWidthConstraint = v3->_compactToolPickerContainerViewWidthConstraint;
    v3->_compactToolPickerContainerViewWidthConstraint = (NSLayoutConstraint *)v27;

    v29 = [(PKPaletteToolPickerContainerView *)v3->_toolPickerContainerView heightAnchor];
    v30 = [(UIStackView *)v3->_stackView heightAnchor];
    uint64_t v31 = [v29 constraintEqualToAnchor:v30];
    compactToolPickerContainerViewHeightConstraint = v3->_compactToolPickerContainerViewHeightConstraint;
    v3->_compactToolPickerContainerViewHeightConstraint = (NSLayoutConstraint *)v31;

    LODWORD(v33) = 1148829696;
    [(NSLayoutConstraint *)v3->_toolPickerContainerViewWidthConstraint setPriority:v33];
    LODWORD(v34) = 1148829696;
    [(NSLayoutConstraint *)v3->_toolPickerContainerViewHeightConstraint setPriority:v34];
    v35 = objc_alloc_init(PKPaletteColorPickerContainerView);
    colorPickerContainerView = v3->_colorPickerContainerView;
    v3->_colorPickerContainerView = v35;

    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_colorPickerContainerView];
    v37 = [(PKPaletteColorPickerContainerView *)v3->_colorPickerContainerView widthAnchor];
    uint64_t v38 = [v37 constraintEqualToConstant:28.0];
    compactColorPickerContainerViewWidthConstraint = v3->_compactColorPickerContainerViewWidthConstraint;
    v3->_compactColorPickerContainerViewWidthConstraint = (NSLayoutConstraint *)v38;

    v40 = [(PKPaletteColorPickerContainerView *)v3->_colorPickerContainerView heightAnchor];
    uint64_t v41 = [v40 constraintEqualToConstant:28.0];
    compactColorPickerContainerViewHeightConstraint = v3->_compactColorPickerContainerViewHeightConstraint;
    v3->_compactColorPickerContainerViewHeightConstraint = (NSLayoutConstraint *)v41;

    v43 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    lassoToolEditingContainerView = v3->_lassoToolEditingContainerView;
    v3->_lassoToolEditingContainerView = v43;

    [(UIView *)v3->_lassoToolEditingContainerView setClipsToBounds:1];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_lassoToolEditingContainerView];
    v45 = [(UIView *)v3->_lassoToolEditingContainerView widthAnchor];
    uint64_t v46 = [v45 constraintEqualToConstant:0.0];
    lassoToolEditingContainerViewWidthConstraint = v3->_lassoToolEditingContainerViewWidthConstraint;
    v3->_lassoToolEditingContainerViewWidthConstraint = (NSLayoutConstraint *)v46;

    v48 = [(UIView *)v3->_lassoToolEditingContainerView heightAnchor];
    uint64_t v49 = [v48 constraintEqualToConstant:0.0];
    lassoToolEditingContainerViewHeightConstraint = v3->_lassoToolEditingContainerViewHeightConstraint;
    v3->_lassoToolEditingContainerViewHeightConstraint = (NSLayoutConstraint *)v49;

    v51 = [(UIView *)v3->_lassoToolEditingContainerView widthAnchor];
    uint64_t v52 = [v51 constraintEqualToConstant:200.0];
    lassoToolEditingContainerViewCompactWidthConstraint = v3->_lassoToolEditingContainerViewCompactWidthConstraint;
    v3->_lassoToolEditingContainerViewCompactWidthConstraint = (NSLayoutConstraint *)v52;

    v54 = [(UIView *)v3->_lassoToolEditingContainerView heightAnchor];
    v55 = [(UIStackView *)v3->_stackView heightAnchor];
    uint64_t v56 = [v54 constraintEqualToAnchor:v55];
    lassoToolEditingContainerViewCompactHeightConstraint = v3->_lassoToolEditingContainerViewCompactHeightConstraint;
    v3->_lassoToolEditingContainerViewCompactHeightConstraint = (NSLayoutConstraint *)v56;

    LODWORD(v58) = 1148829696;
    [(NSLayoutConstraint *)v3->_lassoToolEditingContainerViewWidthConstraint setPriority:v58];
    LODWORD(v59) = 1148829696;
    [(NSLayoutConstraint *)v3->_lassoToolEditingContainerViewHeightConstraint setPriority:v59];
    v60 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    lassoToolEditingViewForNilIdentifier = v3->_lassoToolEditingViewForNilIdentifier;
    v3->_lassoToolEditingViewForNilIdentifier = v60;

    v62 = objc_alloc_init(PKDrawingPaletteInputAssistantView);
    paletteInputAssistantView = v3->_paletteInputAssistantView;
    v3->_paletteInputAssistantView = v62;

    [(PKDrawingPaletteInputAssistantView *)v3->_paletteInputAssistantView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_paletteInputAssistantView];
    [(PKPaletteToolPickerAndColorPickerView *)v3 _updateUI];
  }
  return v3;
}

- (PKPaletteToolPickerView)toolPickerView
{
  v2 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerContainerView];
  v3 = [v2 toolPickerView];

  return (PKPaletteToolPickerView *)v3;
}

- (PKPaletteColorPickerView)colorPickerView
{
  v2 = [(PKPaletteToolPickerAndColorPickerView *)self colorPickerContainerView];
  v3 = [v2 colorPickerView];

  return (PKPaletteColorPickerView *)v3;
}

- (void)setInputAssistantViewVisible:(BOOL)a3
{
  if (self->_inputAssistantViewVisible != a3)
  {
    self->_inputAssistantViewVisible = a3;
    [(PKPaletteToolPickerAndColorPickerView *)self _updateUI];
  }
}

- (void)setWantsColorPickerContainerViewInHierarchy:(BOOL)a3
{
  if (self->_wantsColorPickerContainerViewInHierarchy != a3)
  {
    self->_wantsColorPickerContainerViewInHierarchy = a3;
    [(PKPaletteToolPickerAndColorPickerView *)self _updateUI];
  }
}

- (void)setLassoToolEditingViewVisible:(BOOL)a3
{
  if (self->_lassoToolEditingViewVisible != a3)
  {
    self->_lassoToolEditingViewVisible = a3;
    [(PKPaletteToolPickerAndColorPickerView *)self _updateUI];
  }
}

- (void)setLassoToolEditingViewIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self->_lassoToolEditingViewIdentifier;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

LABEL_9:
    v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  v8 = v11;
  if (!v7)
  {
LABEL_8:
    v9 = (NSString *)[(NSString *)v8 copy];
    lassoToolEditingViewIdentifier = self->_lassoToolEditingViewIdentifier;
    self->_lassoToolEditingViewIdentifier = v9;

    [(PKPaletteToolPickerAndColorPickerView *)self _updateUI];
    goto LABEL_9;
  }
LABEL_10:
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerContainerView];
  -[PKPaletteToolPickerAndColorPickerView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  v13 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerContainerView];
  v14 = objc_msgSend(v13, "hitTest:withEvent:", v7, v10, v12);

  if (v14)
  {
    id v15 = v14;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPaletteToolPickerAndColorPickerView;
    -[PKPaletteToolPickerAndColorPickerView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteToolPickerAndColorPickerView *)self _updateUI];
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKPaletteToolPickerAndColorPickerView *)self _updateUI];
  }
}

- (void)setCornerLocation:(unint64_t)a3
{
  if (self->_cornerLocation != a3)
  {
    self->_cornerLocation = a3;
    [(PKPaletteToolPickerAndColorPickerView *)self _updateUI];
  }
}

- (void)setContextEditingMode:(int64_t)a3
{
  if (self->_contextEditingMode != a3)
  {
    self->_contextEditingMode = a3;
    [(PKPaletteToolPickerAndColorPickerView *)self _updateUI];
  }
}

- (BOOL)_useCompactSize
{
  v3 = [(PKPaletteToolPickerAndColorPickerView *)self traitCollection];
  id v4 = [(PKPaletteToolPickerAndColorPickerView *)self window];
  v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (void)_updateUI
{
  v112[4] = *MEMORY[0x1E4F143B8];
  if ([(PKPaletteToolPickerAndColorPickerView *)self wantsColorPickerContainerViewInHierarchy]&& ![(PKPaletteToolPickerAndColorPickerView *)self _hasColorPickerContainerView])
  {
    v3 = [(PKPaletteToolPickerAndColorPickerView *)self stackView];
    id v4 = [(PKPaletteToolPickerAndColorPickerView *)self colorPickerContainerView];
    [v3 addArrangedSubview:v4];

    goto LABEL_7;
  }
  if (![(PKPaletteToolPickerAndColorPickerView *)self wantsColorPickerContainerViewInHierarchy]&& [(PKPaletteToolPickerAndColorPickerView *)self _hasColorPickerContainerView])
  {
    v3 = [(PKPaletteToolPickerAndColorPickerView *)self colorPickerContainerView];
    [v3 removeFromSuperview];
LABEL_7:
  }
  v5 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingViewIdentifier];

  if (v5)
  {
    lassoToolEditingViewForIdentifierTable = self->_lassoToolEditingViewForIdentifierTable;
    id v7 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingViewIdentifier];
    v8 = [(NSMutableDictionary *)lassoToolEditingViewForIdentifierTable objectForKey:v7];

    if (!v8)
    {
      v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      double v9 = self->_lassoToolEditingViewForIdentifierTable;
      double v10 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingViewIdentifier];
      [(NSMutableDictionary *)v9 setObject:v8 forKey:v10];
    }
  }
  else
  {
    v8 = self->_lassoToolEditingViewForNilIdentifier;
  }
  double v11 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingView];

  obj = v8;
  if (v8 != v11)
  {
    double v12 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingView];
    [v12 removeFromSuperview];

    v13 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerView];
    [v13 addSubview:v8];

    [(UIView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v97 = (void *)MEMORY[0x1E4F28DC8];
    v104 = [(UIView *)v8 topAnchor];
    v106 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerView];
    v102 = [v106 topAnchor];
    v101 = [v104 constraintEqualToAnchor:v102];
    v112[0] = v101;
    v99 = [(UIView *)v8 leadingAnchor];
    v100 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerView];
    v98 = [v100 leadingAnchor];
    v96 = [v99 constraintEqualToAnchor:v98];
    v112[1] = v96;
    v14 = [(UIView *)v8 trailingAnchor];
    id v15 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerView];
    v16 = [v15 trailingAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    v112[2] = v17;
    objc_super v18 = [(UIView *)obj bottomAnchor];
    v19 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerView];
    uint64_t v20 = [v19 bottomAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v112[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:4];
    [v97 activateConstraints:v22];

    objc_storeStrong((id *)&self->_lassoToolEditingView, obj);
  }
  uint64_t v23 = [(PKPaletteToolPickerAndColorPickerView *)self isLassoToolEditingViewVisible] ^ 1;
  uint64_t v24 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerView];
  [v24 setHidden:v23];

  uint64_t v25 = [(PKPaletteToolPickerAndColorPickerView *)self isInputAssistantViewVisible] ^ 1;
  v26 = [(PKPaletteToolPickerAndColorPickerView *)self paletteInputAssistantView];
  [v26 setHidden:v25];

  [(PKPaletteToolPickerAndColorPickerView *)self scalingFactor];
  double v28 = v27;
  v29 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerContainerView];
  [v29 setScalingFactor:v28];

  [(PKPaletteToolPickerAndColorPickerView *)self scalingFactor];
  double v31 = v30;
  v32 = [(PKPaletteToolPickerAndColorPickerView *)self colorPickerView];
  [v32 setScalingFactor:v31];

  [(PKPaletteToolPickerAndColorPickerView *)self scalingFactor];
  double v34 = v33;
  v35 = [(PKPaletteToolPickerAndColorPickerView *)self paletteInputAssistantView];
  [v35 setScalingFactor:v34];

  unint64_t v36 = [(PKPaletteToolPickerAndColorPickerView *)self edgeLocation];
  v37 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerContainerView];
  [v37 setEdgeLocation:v36];

  unint64_t v38 = [(PKPaletteToolPickerAndColorPickerView *)self cornerLocation];
  v39 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerContainerView];
  [v39 setCornerLocation:v38];

  unint64_t v40 = [(PKPaletteToolPickerAndColorPickerView *)self edgeLocation];
  uint64_t v41 = [(PKPaletteToolPickerAndColorPickerView *)self colorPickerView];
  [v41 setEdgeLocation:v40];

  unint64_t v42 = [(PKPaletteToolPickerAndColorPickerView *)self edgeLocation];
  v43 = [(PKPaletteToolPickerAndColorPickerView *)self paletteInputAssistantView];
  [v43 setEdgeLocation:v42];

  [(PKPaletteToolPickerAndColorPickerView *)self _stackViewSpacing];
  double v45 = v44;
  uint64_t v46 = [(PKPaletteToolPickerAndColorPickerView *)self stackView];
  [v46 setSpacing:v45];

  v103 = (void *)MEMORY[0x1E4F28DC8];
  v107 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerContainerViewWidthConstraint];
  v111[0] = v107;
  v105 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerContainerViewHeightConstraint];
  v111[1] = v105;
  v47 = [(PKPaletteToolPickerAndColorPickerView *)self compactToolPickerContainerViewWidthConstraint];
  v111[2] = v47;
  v48 = [(PKPaletteToolPickerAndColorPickerView *)self compactToolPickerContainerViewHeightConstraint];
  v111[3] = v48;
  uint64_t v49 = [(PKPaletteToolPickerAndColorPickerView *)self compactColorPickerContainerViewWidthConstraint];
  v111[4] = v49;
  v50 = [(PKPaletteToolPickerAndColorPickerView *)self compactColorPickerContainerViewHeightConstraint];
  v111[5] = v50;
  v51 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerViewWidthConstraint];
  v111[6] = v51;
  uint64_t v52 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerViewHeightConstraint];
  v111[7] = v52;
  v53 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerViewCompactWidthConstraint];
  v111[8] = v53;
  v54 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerViewCompactHeightConstraint];
  v111[9] = v54;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:10];
  [v103 deactivateConstraints:v55];

  if ([(PKPaletteToolPickerAndColorPickerView *)self _useCompactSize])
  {
    uint64_t v56 = [(PKPaletteToolPickerAndColorPickerView *)self stackView];
    [v56 setAxis:0];

    v57 = (void *)MEMORY[0x1E4F28DC8];
    double v58 = [(PKPaletteToolPickerAndColorPickerView *)self compactToolPickerContainerViewHeightConstraint];
    v110[0] = v58;
    double v59 = [(PKPaletteToolPickerAndColorPickerView *)self compactToolPickerContainerViewWidthConstraint];
    v110[1] = v59;
    v60 = [(PKPaletteToolPickerAndColorPickerView *)self compactColorPickerContainerViewHeightConstraint];
    v110[2] = v60;
    v61 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerViewCompactWidthConstraint];
    v110[3] = v61;
    v62 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerViewCompactHeightConstraint];
    v110[4] = v62;
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:5];
    [v57 activateConstraints:v63];

    if (![(PKPaletteToolPickerAndColorPickerView *)self contextEditingMode]
      || [(PKPaletteToolPickerAndColorPickerView *)self contextEditingMode] == 3
      || [(PKPaletteToolPickerAndColorPickerView *)self contextEditingMode] == 4)
    {
      uint64_t v64 = 1;
      uint64_t v65 = 2;
    }
    else
    {
      uint64_t v64 = 0;
      uint64_t v65 = 1;
    }
    v66 = obj;
    v67 = [(PKPaletteToolPickerAndColorPickerView *)self colorPickerView];
    [v67 setColorPickerMode:v65];

    v68 = [(PKPaletteToolPickerAndColorPickerView *)self compactColorPickerContainerViewWidthConstraint];
    [v68 setActive:v64];

    BOOL v69 = [(PKPaletteToolPickerAndColorPickerView *)self isLassoToolEditingViewVisible];
    if (v69) {
      double v70 = 34.0;
    }
    else {
      double v70 = 28.0;
    }
    if (!v69 && v64)
    {
      if (PKIsVisionDevice())
      {
        if (PKIsVisionDevice()) {
          double v70 = 534.0;
        }
        else {
          double v70 = 372.0;
        }
      }
      else
      {
        double v70 = 268.0;
      }
      [(PKPaletteToolPickerAndColorPickerView *)self _compactToolsContainerWidth];
      if (v70 >= v94) {
        double v70 = v94;
      }
    }
    v88 = [(PKPaletteToolPickerAndColorPickerView *)self compactToolPickerContainerViewWidthConstraint];
    [v88 setConstant:v70];
  }
  else
  {
    objc_super v71 = [(PKPaletteToolPickerAndColorPickerView *)self colorPickerView];
    [v71 setColorPickerMode:0];

    unint64_t v72 = [(PKPaletteToolPickerAndColorPickerView *)self edgeLocation];
    BOOL v74 = v72 == 2 || v72 == 8;
    double v75 = PKPaletteColorSwatchesSize(v74);
    double v77 = v76;
    [(PKPaletteToolPickerAndColorPickerView *)self scalingFactor];
    double v79 = v75 * v78;
    v80 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerViewWidthConstraint];
    [v80 setConstant:v79];

    [(PKPaletteToolPickerAndColorPickerView *)self scalingFactor];
    double v82 = v77 * v81;
    v83 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerViewHeightConstraint];
    [v83 setConstant:v82];

    v84 = (void *)MEMORY[0x1E4F1CA48];
    v85 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerViewWidthConstraint];
    v109[0] = v85;
    v86 = [(PKPaletteToolPickerAndColorPickerView *)self lassoToolEditingContainerViewHeightConstraint];
    v109[1] = v86;
    v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
    v88 = [v84 arrayWithArray:v87];

    unint64_t v89 = [(PKPaletteToolPickerAndColorPickerView *)self edgeLocation];
    if (v89 == 8 || v89 == 2)
    {
      v90 = [(PKPaletteToolPickerAndColorPickerView *)self stackView];
      [v90 setAxis:1];

      uint64_t v91 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerContainerViewWidthConstraint];
    }
    else
    {
      v92 = [(PKPaletteToolPickerAndColorPickerView *)self stackView];
      [v92 setAxis:0];

      uint64_t v91 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerContainerViewHeightConstraint];
    }
    v93 = (void *)v91;
    v66 = obj;
    [v88 addObject:v91];

    [MEMORY[0x1E4F28DC8] activateConstraints:v88];
  }

  v95 = [(PKPaletteToolPickerAndColorPickerView *)self colorPickerContainerView];
  [v95 setLayoutAxis:1];
}

- (double)_compactToolsContainerWidth
{
  v3 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerView];
  id v4 = [v3 toolViews];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 0.0;
  }
  BOOL v6 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerView];
  id v7 = [v6 toolViews];
  double v8 = (double)(unint64_t)[v7 count];
  double v9 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerView];
  double v10 = [v9 toolViews];
  if ([v10 count] >= 8) {
    double v11 = 7.0;
  }
  else {
    double v11 = 5.0;
  }
  double v12 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerView];
  v13 = [v12 toolViews];
  double v14 = v11 * (double)(unint64_t)([v13 count] - 1) + v8 * 34.0;

  return v14;
}

- (double)_stackViewSpacing
{
  BOOL v3 = [(PKPaletteToolPickerAndColorPickerView *)self _useCompactSize];
  double result = 16.0;
  if (!v3)
  {
    [(PKPaletteToolPickerAndColorPickerView *)self scalingFactor];
    return v5 * 36.0;
  }
  return result;
}

- (BOOL)_hasColorPickerContainerView
{
  BOOL v3 = [(PKPaletteToolPickerAndColorPickerView *)self stackView];
  id v4 = [v3 arrangedSubviews];
  double v5 = [(PKPaletteToolPickerAndColorPickerView *)self colorPickerContainerView];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  char v6 = [(PKPaletteToolPickerAndColorPickerView *)self toolPickerView];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PKPaletteToolPickerAndColorPickerView_dismissPalettePopoverWithCompletion___block_invoke;
  v12[3] = &unk_1E64C61C0;
  id v7 = v5;
  v13 = v7;
  [v6 dismissPalettePopoverWithCompletion:v12];

  dispatch_group_enter(v7);
  double v8 = [(PKPaletteToolPickerAndColorPickerView *)self colorPickerContainerView];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PKPaletteToolPickerAndColorPickerView_dismissPalettePopoverWithCompletion___block_invoke_2;
  v10[3] = &unk_1E64C61C0;
  double v9 = v7;
  double v11 = v9;
  [v8 dismissPalettePopoverWithCompletion:v10];

  if (v4) {
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], v4);
  }
}

void __77__PKPaletteToolPickerAndColorPickerView_dismissPalettePopoverWithCompletion___block_invoke(uint64_t a1)
{
}

void __77__PKPaletteToolPickerAndColorPickerView_dismissPalettePopoverWithCompletion___block_invoke_2(uint64_t a1)
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaletteToolPickerAndColorPickerView;
  [(PKPaletteToolPickerAndColorPickerView *)&v10 traitCollectionDidChange:v4];
  double v5 = [(PKPaletteToolPickerAndColorPickerView *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    id v7 = [(PKPaletteToolPickerAndColorPickerView *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];
    uint64_t v9 = [v4 horizontalSizeClass];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(PKPaletteToolPickerAndColorPickerView *)self _updateUI];
LABEL_6:
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPaletteToolPickerContainerView)toolPickerContainerView
{
  return self->_toolPickerContainerView;
}

- (void)setToolPickerContainerView:(id)a3
{
}

- (PKPaletteColorPickerContainerView)colorPickerContainerView
{
  return self->_colorPickerContainerView;
}

- (void)setColorPickerContainerView:(id)a3
{
}

- (BOOL)wantsColorPickerContainerViewInHierarchy
{
  return self->_wantsColorPickerContainerViewInHierarchy;
}

- (NSString)lassoToolEditingViewIdentifier
{
  return self->_lassoToolEditingViewIdentifier;
}

- (UIView)lassoToolEditingView
{
  return self->_lassoToolEditingView;
}

- (BOOL)isLassoToolEditingViewVisible
{
  return self->_lassoToolEditingViewVisible;
}

- (PKDrawingPaletteInputAssistantView)paletteInputAssistantView
{
  return self->_paletteInputAssistantView;
}

- (int64_t)contextEditingMode
{
  return self->_contextEditingMode;
}

- (BOOL)isSmallestSupportedCompactWidth
{
  return self->_isSmallestSupportedCompactWidth;
}

- (void)setIsSmallestSupportedCompactWidth:(BOOL)a3
{
  self->_isSmallestSupportedCompactWidth = a3;
}

- (BOOL)isInputAssistantViewVisible
{
  return self->_inputAssistantViewVisible;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)toolPickerContainerViewWidthConstraint
{
  return self->_toolPickerContainerViewWidthConstraint;
}

- (void)setToolPickerContainerViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolPickerContainerViewHeightConstraint
{
  return self->_toolPickerContainerViewHeightConstraint;
}

- (void)setToolPickerContainerViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)compactToolPickerContainerViewWidthConstraint
{
  return self->_compactToolPickerContainerViewWidthConstraint;
}

- (void)setCompactToolPickerContainerViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)compactToolPickerContainerViewHeightConstraint
{
  return self->_compactToolPickerContainerViewHeightConstraint;
}

- (void)setCompactToolPickerContainerViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)compactColorPickerContainerViewWidthConstraint
{
  return self->_compactColorPickerContainerViewWidthConstraint;
}

- (void)setCompactColorPickerContainerViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)compactColorPickerContainerViewHeightConstraint
{
  return self->_compactColorPickerContainerViewHeightConstraint;
}

- (void)setCompactColorPickerContainerViewHeightConstraint:(id)a3
{
}

- (UIView)lassoToolEditingContainerView
{
  return self->_lassoToolEditingContainerView;
}

- (void)setLassoToolEditingContainerView:(id)a3
{
}

- (NSLayoutConstraint)lassoToolEditingContainerViewWidthConstraint
{
  return self->_lassoToolEditingContainerViewWidthConstraint;
}

- (void)setLassoToolEditingContainerViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)lassoToolEditingContainerViewHeightConstraint
{
  return self->_lassoToolEditingContainerViewHeightConstraint;
}

- (void)setLassoToolEditingContainerViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)lassoToolEditingContainerViewCompactWidthConstraint
{
  return self->_lassoToolEditingContainerViewCompactWidthConstraint;
}

- (void)setLassoToolEditingContainerViewCompactWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)lassoToolEditingContainerViewCompactHeightConstraint
{
  return self->_lassoToolEditingContainerViewCompactHeightConstraint;
}

- (void)setLassoToolEditingContainerViewCompactHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewCompactHeightConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewCompactWidthConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingContainerView, 0);
  objc_storeStrong((id *)&self->_compactColorPickerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_compactColorPickerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_compactToolPickerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_compactToolPickerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_toolPickerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_paletteInputAssistantView, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingView, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingViewIdentifier, 0);
  objc_storeStrong((id *)&self->_colorPickerContainerView, 0);
  objc_storeStrong((id *)&self->_toolPickerContainerView, 0);
  objc_storeStrong((id *)&self->_lassoToolEditingViewForIdentifierTable, 0);

  objc_storeStrong((id *)&self->_lassoToolEditingViewForNilIdentifier, 0);
}

@end