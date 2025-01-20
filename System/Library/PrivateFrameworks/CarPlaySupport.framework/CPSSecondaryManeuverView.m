@interface CPSSecondaryManeuverView
- (CPManeuver)maneuver;
- (CPSAbridgableLabel)instructionLabel;
- (CPSSecondaryManeuverView)initWithManeuver:(id)a3;
- (CPTravelEstimates)currentTravelEstimates;
- (UIImageView)symbolView;
- (double)generatedHeight;
- (double)generatedWidth;
- (double)horizontalInset;
- (id)accessibilityName:(id)a3;
- (int64_t)style;
- (unint64_t)guidanceStyle;
- (void)generateLayoutConfigurationsForSizeIfNecessary:(CGSize)a3 force:(BOOL)a4;
- (void)setCurrentTravelEstimates:(id)a3;
- (void)setGeneratedHeight:(double)a3;
- (void)setGeneratedWidth:(double)a3;
- (void)setGuidanceStyle:(unint64_t)a3;
- (void)setInstructionLabel:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSymbolView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSSecondaryManeuverView

- (id)accessibilityName:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = (id)[(CPSSecondaryManeuverView *)v17 traitCollection];
  uint64_t v15 = [v14 userInterfaceStyle];

  if (v15 == 1)
  {
    v12 = NSString;
    v3 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v3);
    id v18 = (id)[v12 stringWithFormat:@"%@%@-Light", v13, location[0]];
  }
  else if (v15 == 2)
  {
    v10 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v4);
    id v18 = (id)[v10 stringWithFormat:@"%@%@-Dark", v11, location[0]];
  }
  else
  {
    v8 = NSString;
    v5 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v5);
    id v18 = (id)[v8 stringWithFormat:@"%@%@", v9, location[0]];
  }
  objc_storeStrong(location, 0);
  v6 = v18;

  return v6;
}

- (CPSSecondaryManeuverView)initWithManeuver:(id)a3
{
  v113 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v113;
  v113 = 0;
  v111.receiver = v3;
  v111.super_class = (Class)CPSSecondaryManeuverView;
  v113 = [(CPSSecondaryManeuverView *)&v111 init];
  objc_storeStrong((id *)&v113, v113);
  if (v113)
  {
    objc_storeStrong((id *)&v113->_maneuver, location[0]);
    uint64_t v4 = [location[0] displayStyle];
    v113->_style = v4;
    v113->_guidanceStyle = 2;
    [(CPSSecondaryManeuverView *)v113 setTranslatesAutoresizingMaskIntoConstraints:0];
    -[CPSSecondaryManeuverView setContentCompressionResistancePriority:forAxis:](v113, "setContentCompressionResistancePriority:forAxis:");
    LODWORD(v5) = 1148846080;
    [(CPSSecondaryManeuverView *)v113 setContentHuggingPriority:1 forAxis:v5];
    id v110 = (id)[MEMORY[0x263EFF980] array];
    uint64_t v103 = 0;
    v104 = &v103;
    int v105 = 838860800;
    int v106 = 48;
    v107 = __Block_byref_object_copy__5;
    v108 = __Block_byref_object_dispose__5;
    id v109 = 0;
    v87 = v113;
    uint64_t v102 = [(CPSSecondaryManeuverView *)v113 style];
    uint64_t v101 = 4;
    if (v102 >= 4) {
      v86 = (void *)v101;
    }
    else {
      v86 = (void *)v102;
    }
    v100[1] = v86;
    [(CPSSecondaryManeuverView *)v87 setStyle:v86];
    uint64_t v92 = MEMORY[0x263EF8330];
    int v93 = -1073741824;
    int v94 = 0;
    v95 = __45__CPSSecondaryManeuverView_initWithManeuver___block_invoke;
    v96 = &unk_2648A5B08;
    v99[1] = &v103;
    id v97 = location[0];
    v98 = v113;
    v99[0] = v110;
    v100[0] = (id)MEMORY[0x230F4C6B0](&v92);
    id v91 = (id)[location[0] symbolImage];
    id v90 = 0;
    unint64_t v89 = [location[0] displayStyle];
    [(CPSSecondaryManeuverView *)v113 horizontalInset];
    double v88 = v6;
    if (!v91 || v89 == 4)
    {
      (*((void (**)(void))v100[0] + 2))();
      id v18 = v110;
      id v17 = (id)[(id)v104[5] leadingAnchor];
      id v16 = (id)[(CPSSecondaryManeuverView *)v113 leadingAnchor];
      id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", v88);
      objc_msgSend(v18, "addObject:");

      id v14 = v110;
      id v13 = (id)[(id)v104[5] trailingAnchor];
      id v12 = (id)[(CPSSecondaryManeuverView *)v113 trailingAnchor];
      id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:constant:", -v88);
      objc_msgSend(v14, "addObject:");
    }
    else
    {
      v85 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v91];
      id v7 = v90;
      id v90 = v85;

      [v85 setContentMode:1];
      [v85 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v84 = [(CPSSecondaryManeuverView *)v113 accessibilityName:@"Symbol"];
      objc_msgSend(v85, "setAccessibilityLabel:");

      [(CPSSecondaryManeuverView *)v113 addSubview:v85];
      id v83 = v110;
      id v82 = (id)[v85 topAnchor];
      id v81 = (id)[(CPSSecondaryManeuverView *)v113 topAnchor];
      id v80 = (id)objc_msgSend(v82, "constraintEqualToAnchor:constant:", 6.0);
      objc_msgSend(v83, "addObject:");

      id v79 = v110;
      id v78 = (id)[v85 bottomAnchor];
      id v77 = (id)[(CPSSecondaryManeuverView *)v113 bottomAnchor];
      id v76 = (id)objc_msgSend(v78, "constraintLessThanOrEqualToAnchor:constant:", -6.0);
      objc_msgSend(v79, "addObject:");

      id v75 = v110;
      id v74 = (id)[v85 heightAnchor];
      id v73 = (id)[v74 constraintLessThanOrEqualToConstant:18.0];
      objc_msgSend(v75, "addObject:");

      if (v89 == 3)
      {
        id v72 = v110;
        id v71 = (id)[v90 leadingAnchor];
        id v70 = (id)[(CPSSecondaryManeuverView *)v113 leadingAnchor];
        id v69 = (id)objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:constant:", v88);
        objc_msgSend(v72, "addObject:");

        id v68 = v110;
        id v67 = (id)[v90 trailingAnchor];
        id v66 = (id)[(CPSSecondaryManeuverView *)v113 trailingAnchor];
        id v65 = (id)objc_msgSend(v67, "constraintLessThanOrEqualToAnchor:constant:", -v88);
        objc_msgSend(v68, "addObject:");

        id v64 = v110;
        id v63 = (id)[v90 centerXAnchor];
        id v62 = (id)[(CPSSecondaryManeuverView *)v113 centerXAnchor];
        id v61 = (id)objc_msgSend(v63, "constraintEqualToAnchor:");
        objc_msgSend(v64, "addObject:");

        id v60 = v110;
        id v59 = (id)[v90 widthAnchor];
        id v58 = (id)[v59 constraintLessThanOrEqualToConstant:120.0];
        objc_msgSend(v60, "addObject:");

        id v57 = v110;
        id v56 = (id)[v90 topAnchor];
        id v55 = (id)[(CPSSecondaryManeuverView *)v113 topAnchor];
        id v54 = (id)objc_msgSend(v56, "constraintEqualToAnchor:constant:", 6.0);
        objc_msgSend(v57, "addObject:");

        id v53 = v110;
        id v52 = (id)[v90 bottomAnchor];
        id v51 = (id)[(CPSSecondaryManeuverView *)v113 bottomAnchor];
        id v50 = (id)objc_msgSend(v52, "constraintEqualToAnchor:constant:", -6.0);
        objc_msgSend(v53, "addObject:");
      }
      else
      {
        (*((void (**)(void))v100[0] + 2))();
        id v49 = v110;
        id v48 = (id)[v90 widthAnchor];
        id v47 = (id)[v48 constraintLessThanOrEqualToConstant:18.0];
        objc_msgSend(v49, "addObject:");

        id v46 = v110;
        id v45 = (id)[(id)v104[5] lastBaselineAnchor];
        id v44 = (id)[v90 bottomAnchor];
        id v43 = (id)objc_msgSend(v45, "constraintEqualToAnchor:");
        objc_msgSend(v46, "addObject:");

        if (v89 > 1)
        {
          if (v89 == 2)
          {
            id v30 = v110;
            id v29 = (id)[(id)v104[5] leadingAnchor];
            id v28 = (id)[(CPSSecondaryManeuverView *)v113 leadingAnchor];
            id v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:constant:", v88);
            objc_msgSend(v30, "addObject:");

            id v26 = v110;
            id v25 = (id)[v90 leadingAnchor];
            id v24 = (id)[(id)v104[5] trailingAnchor];
            id v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:constant:", v88);
            objc_msgSend(v26, "addObject:");

            id v22 = v110;
            id v21 = (id)[v90 trailingAnchor];
            id v20 = (id)[(CPSSecondaryManeuverView *)v113 trailingAnchor];
            id v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:constant:", -v88);
            objc_msgSend(v22, "addObject:");
          }
        }
        else
        {
          id v42 = v110;
          id v41 = (id)[v90 leadingAnchor];
          id v40 = (id)[(CPSSecondaryManeuverView *)v113 leadingAnchor];
          id v39 = (id)objc_msgSend(v41, "constraintEqualToAnchor:constant:", v88);
          objc_msgSend(v42, "addObject:");

          id v38 = v110;
          id v37 = (id)[(id)v104[5] leadingAnchor];
          id v36 = (id)[v90 trailingAnchor];
          id v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:constant:", v88);
          objc_msgSend(v38, "addObject:");

          id v34 = v110;
          id v33 = (id)[(id)v104[5] trailingAnchor];
          id v32 = (id)[(CPSSecondaryManeuverView *)v113 trailingAnchor];
          id v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:constant:", -v88);
          objc_msgSend(v34, "addObject:");
        }
      }
      objc_storeStrong((id *)&v113->_symbolView, v90);
      LODWORD(v8) = 1148846080;
      [(UIImageView *)v113->_symbolView setContentCompressionResistancePriority:1 forAxis:v8];
    }
    [MEMORY[0x263F08938] activateConstraints:v110];
    objc_storeStrong(&v90, 0);
    objc_storeStrong(&v91, 0);
    objc_storeStrong(v100, 0);
    objc_storeStrong(v99, 0);
    objc_storeStrong((id *)&v98, 0);
    objc_storeStrong(&v97, 0);
    _Block_object_dispose(&v103, 8);
    objc_storeStrong(&v109, 0);
    objc_storeStrong(&v110, 0);
  }
  v10 = v113;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v113, 0);
  return v10;
}

void __45__CPSSecondaryManeuverView_initWithManeuver___block_invoke(uint64_t a1)
{
  v1 = objc_alloc_init(CPSAbridgableLabel);
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;

  LODWORD(v4) = 1148846080;
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setContentHuggingPriority:1 forAxis:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setNumberOfLines:0];
  id v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v18 = (id)[MEMORY[0x263F1C550] labelColor];
  objc_msgSend(v17, "setTextColor:");

  id v19 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v20 = (id)[MEMORY[0x263F1C658] systemFontOfSize:12.0 weight:*MEMORY[0x263F1D338]];
  objc_msgSend(v19, "setFont:");

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTranslatesAutoresizingMaskIntoConstraints:0];
  id v22 = (id)[*(id *)(a1 + 32) attributedInstructionVariants];

  if (v22)
  {
    id v15 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v16 = (id)[*(id *)(a1 + 32) attributedInstructionVariants];
    objc_msgSend(v15, "setAttributedTextVariants:");
  }
  else
  {
    id v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v14 = (id)[*(id *)(a1 + 32) instructionVariants];
    objc_msgSend(v13, "setTextVariants:");
  }
  [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  double v5 = *(void **)(a1 + 48);
  id v8 = (id)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) topAnchor];
  id v7 = (id)[*(id *)(a1 + 40) topAnchor];
  id v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:constant:", 6.0);
  objc_msgSend(v5, "addObject:");

  v9 = *(void **)(a1 + 48);
  id v12 = (id)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) bottomAnchor];
  id v11 = (id)[*(id *)(a1 + 40) bottomAnchor];
  id v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:constant:", -6.0);
  objc_msgSend(v9, "addObject:");

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 456), *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
}

- (void)generateLayoutConfigurationsForSizeIfNecessary:(CGSize)a3 force:(BOOL)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  CGSize v25 = a3;
  id v24 = self;
  SEL v23 = a2;
  BOOL v22 = a4;
  id v16 = (id)[MEMORY[0x263F1CB00] currentTraitCollection];
  BOOL v17 = [v16 userInterfaceIdiom] == 3;

  BOOL v21 = v17;
  char v20 = BSFloatIsZero() & 1;
  [(CPSSecondaryManeuverView *)v24 generatedWidth];
  char v19 = BSFloatEqualToFloat() & 1;
  if (v17 && (v20 & 1) == 0 && (v19 & 1) == 0 || v22)
  {
    [(CPSSecondaryManeuverView *)v24 setGeneratedWidth:v25.width];
    v9 = [CPSSecondaryManeuverView alloc];
    id v10 = [(CPSSecondaryManeuverView *)v24 maneuver];
    id v18 = -[CPSSecondaryManeuverView initWithManeuver:](v9, "initWithManeuver:");

    id v11 = v18;
    CGRectMake_8();
    -[CPSSecondaryManeuverView setFrame:](v11, "setFrame:", v4, v5, v6, v7);
    id v12 = (void *)MEMORY[0x263F08938];
    id v15 = (id)[(CPSSecondaryManeuverView *)v18 widthAnchor];
    id v14 = (id)[v15 constraintEqualToConstant:v25.width];
    v26[0] = v14;
    id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    objc_msgSend(v12, "activateConstraints:");

    [(CPSSecondaryManeuverView *)v18 layoutIfNeeded];
    [(CPSSecondaryManeuverView *)v18 bounds];
    [(CPSSecondaryManeuverView *)v24 setGeneratedHeight:v8];
    objc_storeStrong((id *)&v18, 0);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11.receiver = v13;
  v11.super_class = (Class)CPSSecondaryManeuverView;
  [(CPSSecondaryManeuverView *)&v11 traitCollectionDidChange:location[0]];
  double v7 = [(CPSSecondaryManeuverView *)v13 symbolView];
  double v6 = [(CPSSecondaryManeuverView *)v13 maneuver];
  double v5 = [(CPManeuver *)v6 symbolImage];
  -[UIImageView setImage:](v7, "setImage:");

  v9 = [(CPSSecondaryManeuverView *)v13 symbolView];
  id v8 = [(CPSSecondaryManeuverView *)v13 accessibilityName:@"Symbol"];
  -[UIImageView setAccessibilityLabel:](v9, "setAccessibilityLabel:");

  id v10 = v13;
  [(CPSSecondaryManeuverView *)v13 bounds];
  -[CPSSecondaryManeuverView generateLayoutConfigurationsForSizeIfNecessary:force:](v10, "generateLayoutConfigurationsForSizeIfNecessary:force:", 1, v3, v4);
  objc_storeStrong(location, 0);
}

- (double)horizontalInset
{
  return 9.0;
}

- (CPManeuver)maneuver
{
  return self->_maneuver;
}

- (double)generatedHeight
{
  return self->_generatedHeight;
}

- (void)setGeneratedHeight:(double)a3
{
  self->_generatedHeight = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (CPTravelEstimates)currentTravelEstimates
{
  return self->_currentTravelEstimates;
}

- (void)setCurrentTravelEstimates:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_currentTravelEstimates, location[0]);
  objc_storeStrong(location, 0);
}

- (unint64_t)guidanceStyle
{
  return self->_guidanceStyle;
}

- (void)setGuidanceStyle:(unint64_t)a3
{
  self->_guidanceStyle = a3;
}

- (UIImageView)symbolView
{
  return self->_symbolView;
}

- (void)setSymbolView:(id)a3
{
}

- (CPSAbridgableLabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
}

- (double)generatedWidth
{
  return self->_generatedWidth;
}

- (void)setGeneratedWidth:(double)a3
{
  self->_generatedWidth = a3;
}

- (void).cxx_destruct
{
}

@end