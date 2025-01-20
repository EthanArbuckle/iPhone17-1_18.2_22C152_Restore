@interface GAXFeatureView_Phone
- (BOOL)accessibilityActivate;
- (CGRect)popoverOriginRect;
- (GAXFeatureView_Phone)initWithIdentifier:(id)a3 type:(int64_t)a4 icon:(id)a5 text:(id)a6 detailText:(id)a7 initialState:(BOOL)a8 styleProvider:(id)a9;
- (UILabel)detailTextLabel;
- (UIView)textContainerView;
- (void)_applyAutolayoutConstraintsForAXSizesWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7;
- (void)_applyAutolayoutConstraintsForNonAXSizesWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7;
- (void)_applyAutolayoutConstraintsWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7;
- (void)_constructViewHierarchyWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7;
- (void)setDetailTextLabel:(id)a3;
- (void)setTextContainerView:(id)a3;
@end

@implementation GAXFeatureView_Phone

- (BOOL)accessibilityActivate
{
  return [(GAXFeatureView *)self _accessibilityActivateToggleSwitch];
}

- (GAXFeatureView_Phone)initWithIdentifier:(id)a3 type:(int64_t)a4 icon:(id)a5 text:(id)a6 detailText:(id)a7 initialState:(BOOL)a8 styleProvider:(id)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  switch(a4)
  {
    case 0:
      if (v16) {
        goto LABEL_11;
      }
      goto LABEL_14;
    case 1:
      if (!v15 || !v16 || v17) {
        goto LABEL_14;
      }
      goto LABEL_11;
    case 2:
      goto LABEL_14;
    case 3:
      if (v15 && v16 && !v17) {
        goto LABEL_11;
      }
LABEL_14:
      _AXLogWithFacility();
      v21 = 0;
      break;
    default:
LABEL_11:
      v23.receiver = self;
      v23.super_class = (Class)GAXFeatureView_Phone;
      v19 = -[GAXFeatureView_Phone initWithFrame:](&v23, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v20 = v19;
      if (v19)
      {
        [(GAXFeatureView *)v19 setIdentifier:v14];
        [(GAXFeatureView *)v20 setType:a4];
      }
      self = v20;
      v21 = self;
      break;
  }

  return v21;
}

- (void)_constructViewHierarchyWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)GAXFeatureView_Phone;
  [(GAXFeatureView *)&v27 _constructViewHierarchyWithIcon:v12 text:v13 detailText:v14 initialFeatureState:v8 styleProvider:v15];
  id v16 = objc_alloc((Class)UISwitch);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v20 = objc_msgSend(v16, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v20 setOn:v8];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v20 addTarget:self action:"_handleValueChanged:" forControlEvents:4096];
  [(GAXFeatureView *)self setToggleSwitch:v20];
  [(GAXFeatureView_Phone *)self addSubview:v20];
  if (v12)
  {
    v21 = [[GAXIconView alloc] initWithIcon:v12 styleProvider:v15];
    [(GAXIconView *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GAXFeatureView_Phone *)self addSubview:v21];
    [(GAXFeatureView *)self setIconView:v21];
  }
  id v22 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GAXFeatureView_Phone *)self addSubview:v22];
  [(GAXFeatureView_Phone *)self setTextContainerView:v22];
  objc_super v23 = [v15 featureViewTextFont];
  v24 = +[GAXInterfaceUtilities labelWithText:v13 font:v23 allowMultipleLines:1 textAlignment:4 styleProvider:v15];

  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GAXFeatureView *)self setTextLabel:v24];
  [v22 addSubview:v24];
  if (v14)
  {
    v25 = [v15 featureViewDetailTextFont];
    v26 = +[GAXInterfaceUtilities labelWithText:v14 font:v25 allowMultipleLines:1 textAlignment:4 styleProvider:v15];

    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v22 addSubview:v26];
    [(GAXFeatureView_Phone *)self setDetailTextLabel:v26];
    [(GAXFeatureView_Phone *)self setAccessibilityHint:v14];
  }
  [(GAXFeatureView_Phone *)self setAccessibilityLabel:v13];
  -[GAXFeatureView_Phone setAccessibilityTraits:](self, "setAccessibilityTraits:", [v20 accessibilityTraits]);
  [(GAXFeatureView_Phone *)self setIsAccessibilityElement:1];
}

- (void)_applyAutolayoutConstraintsWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7
{
  BOOL v7 = a6;
  v19.receiver = self;
  v19.super_class = (Class)GAXFeatureView_Phone;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  [(GAXFeatureView *)&v19 _applyAutolayoutConstraintsWithIcon:v15 text:v14 detailText:v13 initialFeatureState:v7 styleProvider:v12];
  id v16 = +[UIApplication sharedApplication];
  id v17 = [v16 preferredContentSizeCategory];
  uint64_t v18 = _UIContentSizeCategoryCompareToContentSizeCategory();

  if (v18 == -1) {
    [(GAXFeatureView_Phone *)self _applyAutolayoutConstraintsForNonAXSizesWithIcon:v15 text:v14 detailText:v13 initialFeatureState:v7 styleProvider:v12];
  }
  else {
    [(GAXFeatureView_Phone *)self _applyAutolayoutConstraintsForAXSizesWithIcon:v15 text:v14 detailText:v13 initialFeatureState:v7 styleProvider:v12];
  }
}

- (void)_applyAutolayoutConstraintsForAXSizesWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7
{
  id v9 = a7;
  v10 = [(GAXFeatureView *)self toggleSwitch];
  v11 = [(GAXFeatureView *)self iconView];
  id v12 = [(GAXFeatureView_Phone *)self textContainerView];
  id v13 = [(GAXFeatureView *)self textLabel];
  v95 = [(GAXFeatureView_Phone *)self detailTextLabel];
  [v9 featureViewToggleOffset];
  double v15 = v14;
  [v9 featureViewTextHorizontalPadding];
  double v17 = v16;
  LODWORD(v16) = 0.5;
  [v13 _setHyphenationFactor:v16];
  uint64_t v18 = +[NSMutableArray array];
  v98 = v11;
  if (a3)
  {
    v93 = v12;
    v96 = v10;
    objc_super v19 = [v11 topAnchor];
    id v20 = [(GAXFeatureView_Phone *)self topAnchor];
    v21 = [v19 constraintGreaterThanOrEqualToAnchor:v20];
    [v18 addObject:v21];

    id v22 = [v11 bottomAnchor];
    objc_super v23 = [(GAXFeatureView_Phone *)self bottomAnchor];
    v24 = [v22 constraintLessThanOrEqualToAnchor:v23];
    [v18 addObject:v24];

    v25 = [v13 font];
    [v25 capHeight];
    double v27 = v26;

    v28 = [v11 centerYAnchor];
    v29 = [v13 firstBaselineAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:v27 * -0.5];
    [v18 addObject:v30];

    v31 = [v13 attributedText];
    v91 = [v31 attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:0];
    id v32 = [v91 mutableCopy];
    v33 = v9;
    [v9 featureViewIconLargeTextLayoutTextIndent];
    objc_msgSend(v32, "setFirstLineHeadIndent:");
    v92 = v31;
    id v34 = [v31 mutableCopy];
    if ([v34 length])
    {
      NSAttributedStringKey v99 = NSParagraphStyleAttributeName;
      id v100 = v32;
      v35 = +[NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
      objc_msgSend(v34, "setAttributes:range:", v35, 0, 1);
    }
    [v13 setAttributedText:v34];
    v36 = objc_opt_new();
    [(GAXFeatureView_Phone *)self addLayoutGuide:v36];
    v37 = [v36 leadingAnchor];
    v38 = [(GAXFeatureView_Phone *)self leadingAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    [v18 addObject:v39];

    v40 = [v36 widthAnchor];
    [v33 featureViewIconStandardLayoutWidth];
    v42 = [v40 constraintEqualToConstant:v41 * 0.5];
    [v18 addObject:v42];

    v43 = [v98 centerXAnchor];
    v44 = [v36 trailingAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [v18 addObject:v45];

    id v9 = v33;
    v10 = v96;
    id v12 = v93;
  }
  v46 = [v12 topAnchor];
  v47 = [(GAXFeatureView_Phone *)self topAnchor];
  v48 = [v46 constraintGreaterThanOrEqualToAnchor:v47];
  [v18 addObject:v48];

  v49 = [v12 trailingAnchor];
  v50 = [(GAXFeatureView_Phone *)self trailingAnchor];
  v51 = [v49 constraintEqualToAnchor:v50 constant:v15];
  [v18 addObject:v51];

  v52 = [v12 leadingAnchor];
  v53 = [(GAXFeatureView_Phone *)self leadingAnchor];
  v54 = [v52 constraintEqualToAnchor:v53 constant:v17];
  [v18 addObject:v54];

  v55 = [v13 topAnchor];
  v56 = [v12 topAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  [v18 addObject:v57];

  v58 = [v13 leadingAnchor];
  v59 = [v12 leadingAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  [v18 addObject:v60];

  v61 = [v13 widthAnchor];
  v62 = [v12 widthAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  [v18 addObject:v63];

  v97 = v13;
  v64 = [v13 bottomAnchor];
  if (a5)
  {
    v65 = v95;
    v66 = [v95 topAnchor];
    v67 = [v64 constraintEqualToAnchor:v66];
    [v18 addObject:v67];

    v68 = [v95 leadingAnchor];
    v69 = [v12 leadingAnchor];
    v70 = [v68 constraintEqualToAnchor:v69];
    [v18 addObject:v70];

    v71 = [v95 widthAnchor];
    v72 = [v12 widthAnchor];
    v73 = [v71 constraintEqualToAnchor:v72];
    [v18 addObject:v73];

    v64 = [v95 bottomAnchor];
    v74 = [v12 bottomAnchor];
    [v64 constraintEqualToAnchor:v74];
    v76 = v75 = v12;
  }
  else
  {
    v74 = [v12 bottomAnchor];
    [v64 constraintEqualToAnchor:v74];
    v76 = v75 = v12;
    v65 = v95;
  }
  [v18 addObject:v76];

  LODWORD(v77) = AXResistAllCompressingAndStretching[0];
  LODWORD(v78) = AXResistAllCompressingAndStretching[1];
  LODWORD(v79) = AXResistAllCompressingAndStretching[2];
  LODWORD(v80) = AXResistAllCompressingAndStretching[3];
  objc_msgSend(v10, "ax_setContentHuggingAndCompressionResistance:", v77, v78, v79, v80);
  v81 = [v10 topAnchor];
  v82 = [v75 bottomAnchor];
  v83 = [v81 constraintEqualToAnchor:v82];
  [v18 addObject:v83];

  v84 = [v10 leadingAnchor];
  v85 = [v75 leadingAnchor];
  v86 = [v84 constraintEqualToAnchor:v85];
  [v18 addObject:v86];

  v87 = [v10 bottomAnchor];
  v88 = [(GAXFeatureView_Phone *)self bottomAnchor];
  [v9 featureViewAdditionalBottomOffsetForLargeText];
  v90 = [v87 constraintLessThanOrEqualToAnchor:v88 constant:-v89];
  [v18 addObject:v90];

  +[NSLayoutConstraint activateConstraints:v18];
}

- (void)_applyAutolayoutConstraintsForNonAXSizesWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7
{
  id v10 = a7;
  v11 = [(GAXFeatureView *)self toggleSwitch];
  id v12 = [(GAXFeatureView *)self iconView];
  id v13 = [(GAXFeatureView_Phone *)self textContainerView];
  double v14 = [(GAXFeatureView *)self textLabel];
  double v15 = [(GAXFeatureView_Phone *)self detailTextLabel];
  [v10 featureViewToggleOffset];
  double v17 = v16;
  [v10 featureViewToggleOffset];
  double v19 = v18;
  LODWORD(v18) = 1144750080;
  objc_msgSend(v11, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 4, self, v18);
  objc_msgSend(v11, "ax_constrainLayoutAttribute:asLessThanOrEqualToValueOfView:", 4, self);
  objc_msgSend(v11, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 10, self, v17);
  objc_msgSend(v11, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 6, self, v19);
  LODWORD(v20) = 1144750080;
  objc_msgSend(v11, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 3, self, v20);
  objc_msgSend(v11, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfView:", 3, self);
  LODWORD(v21) = 1148846080;
  [v11 setContentHuggingPriority:0 forAxis:v21];
  LODWORD(v22) = 1148846080;
  [v11 setContentHuggingPriority:1 forAxis:v22];
  LODWORD(v23) = 1148846080;
  [v11 setContentCompressionResistancePriority:0 forAxis:v23];
  LODWORD(v24) = 1148846080;
  [v11 setContentCompressionResistancePriority:1 forAxis:v24];
  if (a3)
  {
    LODWORD(v25) = 1144750080;
    [(GAXFeatureView_Phone *)v12 ax_constrainLayoutAttribute:4 asEqualToValueOfView:self priority:v25];
    [(GAXFeatureView_Phone *)v12 ax_constrainLayoutAttribute:4 asLessThanOrEqualToValueOfView:self];
    [(GAXFeatureView_Phone *)v12 ax_constrainLayoutAttribute:10 asEqualToValueOfView:self];
    [(GAXFeatureView_Phone *)v12 ax_constrainLayoutAttribute:5 asEqualToValueOfView:self];
    LODWORD(v26) = 1144750080;
    [(GAXFeatureView_Phone *)v12 ax_constrainLayoutAttribute:3 asEqualToValueOfView:self priority:v26];
    [(GAXFeatureView_Phone *)v12 ax_constrainLayoutAttribute:3 asGreaterThanOrEqualToValueOfView:self];
    double v27 = [(GAXFeatureView_Phone *)v12 widthAnchor];
    [v10 featureViewIconStandardLayoutWidth];
    objc_msgSend(v27, "constraintEqualToConstant:");
    v55 = id v54 = a5;
    v28 = (void *)v55;
    +[NSArray arrayWithObjects:&v55 count:1];
    v29 = v15;
    v30 = v12;
    id v32 = v31 = v10;
    +[NSLayoutConstraint activateConstraints:v32];

    id v10 = v31;
    id v12 = v30;
    double v15 = v29;

    a5 = v54;
    uint64_t v33 = 6;
    id v34 = v12;
  }
  else
  {
    uint64_t v33 = 5;
    id v34 = self;
  }
  [v10 featureViewTextHorizontalPadding];
  double v36 = v35;
  [v10 featureViewTextHorizontalPadding];
  double v38 = v37 * -0.5;
  objc_msgSend(v13, "ax_constrainLayoutAttribute:asLessThanOrEqualToValueOfView:", 4, self);
  objc_msgSend(v13, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 10, self);
  objc_msgSend(v13, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:", 5, v33, v34, v36);
  objc_msgSend(v13, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:", 6, 5, v11, v38);
  objc_msgSend(v13, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfView:", 3, self);
  LODWORD(v39) = 1144750080;
  objc_msgSend(v14, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 4, v13, v39);
  objc_msgSend(v14, "ax_constrainLayoutAttribute:asLessThanOrEqualToValueOfView:", 4, v13);
  LODWORD(v40) = 1144750080;
  objc_msgSend(v14, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 5, v13, v40);
  objc_msgSend(v14, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfView:", 5, v13);
  LODWORD(v41) = 1144750080;
  objc_msgSend(v14, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 6, v13, v41);
  objc_msgSend(v14, "ax_constrainLayoutAttribute:asLessThanOrEqualToValueOfView:", 6, v13);
  LODWORD(v42) = 1144750080;
  objc_msgSend(v14, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 3, v13, v42);
  objc_msgSend(v14, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfView:", 3, v13);
  LODWORD(v43) = 1132068864;
  [v14 setContentHuggingPriority:0 forAxis:v43];
  LODWORD(v44) = 1148846080;
  [v14 setContentHuggingPriority:1 forAxis:v44];
  LODWORD(v45) = 1144750080;
  [v14 setContentCompressionResistancePriority:0 forAxis:v45];
  LODWORD(v46) = 1148846080;
  [v14 setContentCompressionResistancePriority:1 forAxis:v46];
  if (a5)
  {
    LODWORD(v47) = 1144750080;
    objc_msgSend(v15, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 4, v13, v47);
    objc_msgSend(v15, "ax_constrainLayoutAttribute:asLessThanOrEqualToValueOfView:", 4, v13);
    LODWORD(v48) = 1144750080;
    objc_msgSend(v15, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 5, v13, v48);
    objc_msgSend(v15, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfView:", 5, v13);
    LODWORD(v49) = 1144750080;
    objc_msgSend(v15, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 6, v13, v49);
    objc_msgSend(v15, "ax_constrainLayoutAttribute:asLessThanOrEqualToValueOfView:", 6, v13);
    objc_msgSend(v15, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:", 3, 4, v14);
    LODWORD(v50) = 1132068864;
    [v15 setContentHuggingPriority:0 forAxis:v50];
    LODWORD(v51) = 1148846080;
    [v15 setContentHuggingPriority:1 forAxis:v51];
    LODWORD(v52) = 1144750080;
    [v15 setContentCompressionResistancePriority:0 forAxis:v52];
    LODWORD(v53) = 1148846080;
    [v15 setContentCompressionResistancePriority:1 forAxis:v53];
  }
}

- (CGRect)popoverOriginRect
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
}

- (UIView)textContainerView
{
  return self->_textContainerView;
}

- (void)setTextContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContainerView, 0);

  objc_storeStrong((id *)&self->_detailTextLabel, 0);
}

@end