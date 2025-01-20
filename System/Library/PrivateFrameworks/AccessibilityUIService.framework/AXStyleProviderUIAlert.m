@interface AXStyleProviderUIAlert
- (AXStyleProviderUIAlert)initWithType:(unint64_t)a3 text:(id)a4 subtitleText:(id)a5 iconImage:(id)a6 styleProvider:(id)a7 userInfo:(id)a8;
- (AXUIAlertStyleProvider)styleProvider;
- (unint64_t)alertType;
- (void)_appendParagraphWithText:(id)a3 withImage:(id)a4 withTextColor:(id)a5 font:(id)a6 textAlignment:(int64_t)a7 lineSpacing:(double)a8 paragraphSpacingBefore:(double)a9 toAttributedString:(id)a10;
- (void)_appendParagraphWithText:(id)a3 withTextColor:(id)a4 font:(id)a5 textAlignment:(int64_t)a6 lineSpacing:(double)a7 paragraphSpacingBefore:(double)a8 toAttributedString:(id)a9;
- (void)_cancelDismissalWithPanGesture:(id)a3;
- (void)_endDismissalWithPanGesture:(id)a3;
- (void)_handlePanGestureRecognizer:(id)a3;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)_updateDismissalWithPanGesture:(id)a3;
- (void)_updateViewForDismissalPercentage:(double)a3;
- (void)addToContainerView:(id)a3;
- (void)setAlertType:(unint64_t)a3;
- (void)setStyleProvider:(id)a3;
@end

@implementation AXStyleProviderUIAlert

- (AXStyleProviderUIAlert)initWithType:(unint64_t)a3 text:(id)a4 subtitleText:(id)a5 iconImage:(id)a6 styleProvider:(id)a7 userInfo:(id)a8
{
  id v14 = a4;
  id v208 = a5;
  id v209 = a6;
  id v212 = a7;
  id v15 = a8;
  v213.receiver = self;
  v213.super_class = (Class)AXStyleProviderUIAlert;
  v16 = [(AXStyleProviderUIAlert *)&v213 init];
  v17 = v16;
  if (!v16)
  {
    v29 = v209;
    goto LABEL_138;
  }
  id v202 = v15;
  [(AXUIAlert *)v16 setUserInfo:v15];
  int v18 = [v212 alertBackgroundStyleForType:a3];
  id v205 = v14;
  unint64_t v19 = a3;
  unint64_t v210 = a3;
  switch(v18)
  {
    case 0:
      v20 = [v212 alertBackgroundImageForType:a3];
      [v212 alertBackgroundImageCapInsetsForType:a3];
      BOOL v25 = v24 == *(double *)(MEMORY[0x263F1D1C0] + 8) && v21 == *MEMORY[0x263F1D1C0];
      if (!v25 || v23 != *(double *)(MEMORY[0x263F1D1C0] + 24) || v22 != *(double *)(MEMORY[0x263F1D1C0] + 16))
      {
        uint64_t v28 = objc_msgSend(v20, "resizableImageWithCapInsets:");

        v20 = (void *)v28;
        unint64_t v19 = a3;
      }
      id v207 = (id)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v20];
      goto LABEL_25;
    case 1:
      id v30 = objc_alloc(MEMORY[0x263F1CBE8]);
      uint64_t v31 = 2020;
      goto LABEL_18;
    case 2:
      id v30 = objc_alloc(MEMORY[0x263F1CBE8]);
      uint64_t v31 = 2030;
LABEL_18:
      id v207 = (id)[v30 initWithPrivateStyle:v31];
      break;
    case 3:
      id v32 = objc_alloc_init(MEMORY[0x263F1CB60]);
      v20 = (void *)[objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:2010];
      [v20 _setContinuousCornerRadius:10.0];
      [v32 addSubview:v20];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
      v33 = (void *)MEMORY[0x263F08938];
      v34 = _NSDictionaryOfVariableBindings(&cfstr_Backdropview.isa, v20, 0);
      v35 = [v33 constraintsWithVisualFormat:@"H:|-[backdropView]-|" options:0 metrics:0 views:v34];
      [v32 addConstraints:v35];

      v36 = (void *)MEMORY[0x263F08938];
      v37 = _NSDictionaryOfVariableBindings(&cfstr_Backdropview.isa, v20, 0);
      v38 = [v36 constraintsWithVisualFormat:@"V:|-[backdropView]-|" options:0 metrics:0 views:v37];
      id v207 = v32;
      [v32 addConstraints:v38];

      unint64_t v19 = v210;
      goto LABEL_25;
    case 4:
      id v39 = objc_alloc(MEMORY[0x263F1CB98]);
      v40 = [MEMORY[0x263F1C480] effectWithStyle:1200];
      id v207 = (id)[v39 initWithEffect:v40];

      goto LABEL_30;
    case 5:
      id v207 = objc_alloc_init(MEMORY[0x263F1CB60]);
      v41 = (void *)[objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:2010];
      v42 = [(AXStyleProviderUIAlert *)v17 traitCollection];
      uint64_t v43 = [v42 userInterfaceStyle];

      if (v43 == 2)
      {
        uint64_t v44 = [objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:2030];

        v41 = (void *)v44;
      }
      [v41 _setContinuousCornerRadius:30.0];
      v45 = [v41 layer];
      [v45 setShadowRadius:10.0];

      v46 = [v41 layer];
      LODWORD(v47) = 1050253722;
      [v46 setShadowOpacity:v47];

      v48 = [v41 layer];
      objc_msgSend(v48, "setShadowOffset:", 0.0, 10.0);

      v49 = [v41 layer];
      id v50 = [MEMORY[0x263F1C550] blackColor];
      objc_msgSend(v49, "setShadowColor:", objc_msgSend(v50, "CGColor"));

      [v207 addSubview:v41];
      [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
      v51 = (void *)MEMORY[0x263F08938];
      v52 = _NSDictionaryOfVariableBindings(&cfstr_Backdropview.isa, v41, 0);
      v53 = [v51 constraintsWithVisualFormat:@"H:|-[backdropView]-|" options:0 metrics:0 views:v52];
      [v207 addConstraints:v53];

      v54 = (void *)MEMORY[0x263F08938];
      v55 = _NSDictionaryOfVariableBindings(&cfstr_Backdropview.isa, v41, 0);
      v56 = [v54 constraintsWithVisualFormat:@"V:|-[backdropView]-|" options:0 metrics:0 views:v55];
      [v207 addConstraints:v56];

      unint64_t v19 = v210;
      break;
    case 6:
      id v207 = objc_alloc_init(MEMORY[0x263F1CB60]);
      v64 = (void *)[objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:2030];
      v65 = [(AXStyleProviderUIAlert *)v17 traitCollection];
      uint64_t v66 = [v65 userInterfaceStyle];

      if (v66 == 2)
      {
        uint64_t v67 = [objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:2030];

        v64 = (void *)v67;
      }
      [v64 _setContinuousCornerRadius:20.0];
      v68 = [v64 layer];
      [v68 setShadowRadius:10.0];

      v69 = [v64 layer];
      LODWORD(v70) = 1050253722;
      [v69 setShadowOpacity:v70];

      v71 = [v64 layer];
      objc_msgSend(v71, "setShadowOffset:", 0.0, 10.0);

      v72 = [v64 layer];
      id v73 = [MEMORY[0x263F1C550] blackColor];
      objc_msgSend(v72, "setShadowColor:", objc_msgSend(v73, "CGColor"));

      [v207 addSubview:v64];
      [v64 setTranslatesAutoresizingMaskIntoConstraints:0];
      v74 = (void *)MEMORY[0x263F08938];
      v75 = _NSDictionaryOfVariableBindings(&cfstr_Backdropview.isa, v64, 0);
      v76 = [v74 constraintsWithVisualFormat:@"H:|-[backdropView]-|" options:0 metrics:0 views:v75];
      [v207 addConstraints:v76];

      v77 = (void *)MEMORY[0x263F08938];
      v78 = _NSDictionaryOfVariableBindings(&cfstr_Backdropview.isa, v64, 0);
      v79 = [v77 constraintsWithVisualFormat:@"V:|-[backdropView]-|" options:0 metrics:0 views:v78];
      [v207 addConstraints:v79];

LABEL_30:
      unint64_t v19 = v210;
      break;
    case 7:
      id v57 = objc_alloc_init(MEMORY[0x263F1CB60]);
      v20 = (void *)[objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:2010];
      [v20 _setContinuousCornerRadius:47.0];
      [v57 addSubview:v20];
      v58 = [v57 layer];
      [v58 setShadowRadius:25.0];

      v59 = [v57 layer];
      LODWORD(v60) = 1036831949;
      [v59 setShadowOpacity:v60];

      v61 = [v57 layer];
      objc_msgSend(v61, "setShadowOffset:", 0.0, 15.0);

      id v207 = v57;
      v62 = [v57 layer];
      id v63 = [MEMORY[0x263F1C550] blackColor];
      objc_msgSend(v62, "setShadowColor:", objc_msgSend(v63, "CGColor"));

      unint64_t v19 = v210;
LABEL_25:

      break;
    default:
      id v207 = 0;
      break;
  }
  if (objc_opt_respondsToSelector())
  {
    [v212 alertBackgroundCornerRadiusForType:v19];
    double v81 = v80;
    if (fabs(v80) >= 2.22044605e-16)
    {
      v82 = [(AXStyleProviderUIAlert *)v17 layer];
      [v82 setCornerRadius:v81];

      [(AXStyleProviderUIAlert *)v17 setClipsToBounds:1];
    }
  }
  [v207 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AXStyleProviderUIAlert *)v17 addSubview:v207];
  v83 = [(AXStyleProviderUIAlert *)v17 layer];
  [v83 setAllowsGroupOpacity:v18 == 0];

  v84 = objc_opt_new();
  [v84 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AXStyleProviderUIAlert *)v17 addSubview:v84];
  BOOL v85 = v209 == 0;
  uint64_t v86 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:&stru_26D3C6970 attributes:0];
  BOOL v87 = v19 == 7;
  if (v19 == 7)
  {
    v88 = [v212 alertTextColorForType:7];
    v89 = [v212 alertTextFontForType:7];
    [v212 alertTextLineHeightOffsetForType:7];
    -[AXStyleProviderUIAlert _appendParagraphWithText:withImage:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:](v17, "_appendParagraphWithText:withImage:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:", v14, v209, v88, v89, 1, v86);

    unint64_t v92 = v210;
    BOOL v201 = 0;
    id v209 = 0;
LABEL_39:
    int v211 = v87;
    goto LABEL_40;
  }
  v90 = [v212 alertTextColorForType:v19];
  v91 = [v212 alertTextFontForType:v19];
  [v212 alertTextLineHeightOffsetForType:v210];
  -[AXStyleProviderUIAlert _appendParagraphWithText:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:](v17, "_appendParagraphWithText:withTextColor:font:textAlignment:lineSpacing:paragraphSpacingBefore:toAttributedString:", v14, v90, v91, v85, v86);

  unint64_t v92 = v210;
  BOOL v201 = v210 == 8;
  int v211 = 1;
  if (v210 != 6 && v210 != 8) {
    goto LABEL_39;
  }
LABEL_40:
  v93 = objc_opt_new();
  [v93 setTranslatesAutoresizingMaskIntoConstraints:0];
  v94 = v207;
  v203 = (void *)v86;
  v206 = v93;
  if (v208)
  {
    char v95 = v211 ^ 1;
    if (v92 == 3) {
      char v95 = 0;
    }
    if (v95)
    {
      v96 = [v212 alertSubtitleTextColorForType:v92];
      [v212 alertSubtitleTextFontForType:v92];
      v104 = unint64_t v103 = v92;
      [v212 alertSubtitleTextLineHeightOffsetForType:v103];
      double v106 = v105;
      [v212 alertSubtitleTextVerticalSpacingHeightWithTextForType:v103];
      [(AXStyleProviderUIAlert *)v17 _appendParagraphWithText:v208 withTextColor:v96 font:v104 textAlignment:v85 lineSpacing:v86 paragraphSpacingBefore:v106 toAttributedString:v107];

      v93 = v206;
    }
    else
    {
      v96 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:&stru_26D3C6970 attributes:0];
      [v212 alertSubtitleTextColorForType:v92];
      v98 = unint64_t v97 = v92;
      v99 = [v212 alertSubtitleTextFontForType:v97];
      [v212 alertSubtitleTextLineHeightOffsetForType:v97];
      double v101 = v100;
      [v212 alertSubtitleTextVerticalSpacingHeightWithTextForType:v97];
      [(AXStyleProviderUIAlert *)v17 _appendParagraphWithText:v208 withTextColor:v98 font:v99 textAlignment:v85 lineSpacing:v96 paragraphSpacingBefore:v101 toAttributedString:v102];

      uint64_t v86 = (uint64_t)v203;
      v93 = v206;
      [v206 setNumberOfLines:2];
      [v206 setAttributedText:v96];
      [v206 setLineBreakMode:4];
    }

    unint64_t v92 = v210;
  }
  [v84 addSubview:v93];
  v108 = objc_opt_new();
  [v108 setNumberOfLines:0];
  [v108 setAttributedText:v86];
  [v108 setLineBreakMode:0];
  [v108 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (v92 == 3)
  {
    [v108 setNumberOfLines:1];
    if ((v211 & 1) == 0)
    {
      id v109 = objc_alloc(MEMORY[0x263F1CB98]);
      v110 = (void *)MEMORY[0x263F1CB58];
      v111 = [MEMORY[0x263F1C480] effectWithStyle:5];
      v112 = [v110 effectForBlurEffect:v111];
      id v113 = (id)[v109 initWithEffect:v112];

LABEL_52:
      [v113 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v84 addSubview:v113];
      v114 = [v113 contentView];
      [v114 addSubview:v108];

      v115 = [v113 contentView];
      v116 = (void *)MEMORY[0x263F08938];
      v117 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v108, 0);
      v118 = [v116 constraintsWithVisualFormat:@"H:|[label]|" options:0 metrics:0 views:v117];
      [v115 addConstraints:v118];

      v204 = v113;
      v119 = [v113 contentView];
      v120 = (void *)MEMORY[0x263F08938];
      v121 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v108, 0);
      v122 = [v120 constraintsWithVisualFormat:@"V:|[label]|" options:0 metrics:0 views:v121];
      [v119 addConstraints:v122];

      v94 = v207;
      unint64_t v92 = v210;
      goto LABEL_54;
    }
LABEL_51:
    id v113 = objc_alloc_init(MEMORY[0x263F1CB98]);
    goto LABEL_52;
  }
  if (v211) {
    goto LABEL_51;
  }
  [v84 addSubview:v108];
  v204 = 0;
LABEL_54:
  v29 = v209;
  if (!v209)
  {
    if (v92 == 3) {
      char v139 = 1;
    }
    else {
      char v139 = v211;
    }
    if (v139) {
      goto LABEL_66;
    }
    objc_msgSend(v108, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfView:", 3, v84);
    goto LABEL_76;
  }
  v123 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v209];
  [v123 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (v92 == 3) {
    char v124 = 1;
  }
  else {
    char v124 = v211;
  }
  if ((v124 & 1) == 0)
  {
    [v84 addSubview:v123];
    objc_msgSend(v108, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfView:", 3, v84);
    if (v123)
    {
LABEL_77:
      objc_msgSend(v108, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 2, v84);
      objc_msgSend(v108, "ax_constrainLayoutAttribute:asLessThanOrEqualToValueOfView:", 4, v84);
      LODWORD(v145) = 1144750080;
      objc_msgSend(v108, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 3, v84, v145);
      LODWORD(v146) = 1144750080;
      objc_msgSend(v108, "ax_constrainLayoutAttribute:asEqualToValueOfView:priority:", 4, v84, v146);
      if (!v123) {
        goto LABEL_108;
      }
      int v147 = 0;
      goto LABEL_94;
    }
LABEL_76:
    objc_msgSend(v108, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 1, v84);
    v123 = 0;
    goto LABEL_77;
  }
  v125 = [v123 layer];
  [v125 setCornerRadius:4.0];

  v126 = [v123 layer];
  [v126 setMasksToBounds:1];

  [v84 addSubview:v123];
  if (v123)
  {
    v127 = v204;
    v128 = [MEMORY[0x263F08938] constraintWithItem:v204 attribute:5 relatedBy:0 toItem:v123 attribute:6 multiplier:1.0 constant:10.0];
    [v84 addConstraint:v128];

    v129 = [MEMORY[0x263F1C408] sharedApplication];
    v130 = [v129 preferredContentSizeCategory];
    NSComparisonResult v131 = UIContentSizeCategoryCompareToCategory(v130, (UIContentSizeCategory)*MEMORY[0x263F1D140]);

    if (v131 == NSOrderedDescending)
    {
      [v108 setNumberOfLines:0];
      v132 = (void *)MEMORY[0x263F08938];
      double v133 = 1.0;
      double v134 = 10.0;
      v135 = v204;
      uint64_t v136 = 3;
      v137 = v84;
      uint64_t v138 = 3;
    }
    else
    {
      v132 = (void *)MEMORY[0x263F08938];
      double v133 = 1.0;
      double v134 = 0.0;
      v135 = v204;
      uint64_t v136 = 10;
      v137 = v123;
      uint64_t v138 = 10;
    }
    v148 = [v132 constraintWithItem:v135 attribute:v136 relatedBy:0 toItem:v137 attribute:v138 multiplier:v133 constant:v134];
    [v84 addConstraint:v148];

    v144 = [MEMORY[0x263F08938] constraintWithItem:v204 attribute:6 relatedBy:0 toItem:v84 attribute:6 multiplier:1.0 constant:-5.0];
    v94 = v207;
    goto LABEL_81;
  }
LABEL_66:
  if (v211) {
    double v140 = 24.0;
  }
  else {
    double v140 = 5.0;
  }
  if (v211) {
    double v141 = 8.0;
  }
  else {
    double v141 = 13.0;
  }
  v142 = [MEMORY[0x263F08938] constraintWithItem:v204 attribute:5 relatedBy:0 toItem:v84 attribute:5 multiplier:1.0 constant:v140];
  [v84 addConstraint:v142];

  v143 = [MEMORY[0x263F08938] constraintWithItem:v204 attribute:6 relatedBy:0 toItem:v84 attribute:6 multiplier:1.0 constant:-v140];
  [v84 addConstraint:v143];

  v127 = v204;
  v144 = [MEMORY[0x263F08938] constraintWithItem:v204 attribute:3 relatedBy:0 toItem:v84 attribute:3 multiplier:1.0 constant:v141];
  v123 = 0;
LABEL_81:
  [v84 addConstraint:v144];

  if (v93)
  {
    double v149 = 0.0;
    if (v211)
    {
      double v150 = 8.0;
    }
    else
    {
      double v149 = 5.0;
      double v150 = 10.0;
    }
    if (v211) {
      double v151 = 24.0;
    }
    else {
      double v151 = 15.0;
    }
    if (v211) {
      double v152 = 24.0;
    }
    else {
      double v152 = 12.0;
    }
    v153 = [MEMORY[0x263F08938] constraintWithItem:v93 attribute:3 relatedBy:0 toItem:v127 attribute:4 multiplier:1.0 constant:v149];
    [v84 addConstraint:v153];

    v154 = [MEMORY[0x263F08938] constraintWithItem:v93 attribute:4 relatedBy:0 toItem:v84 attribute:4 multiplier:1.0 constant:-v150];
    [v84 addConstraint:v154];

    v155 = [MEMORY[0x263F08938] constraintWithItem:v93 attribute:5 relatedBy:0 toItem:v84 attribute:5 multiplier:1.0 constant:v151];
    [v84 addConstraint:v155];

    v156 = [MEMORY[0x263F08938] constraintWithItem:v93 attribute:6 relatedBy:0 toItem:v84 attribute:6 multiplier:1.0 constant:-v152];
    [v84 addConstraint:v156];
  }
  v29 = v209;
  unint64_t v92 = v210;
  if (v123)
  {
    objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 3, v84, 13.0);
    int v147 = 1;
    objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 1, v84, 13.0);
LABEL_94:
    if (v92 == 7)
    {
      objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 3, v84, 13.0);
      objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 1, v84, 18.0);
    }
    else
    {
      [v212 alertIconImageEdgeInsetsForType:v92];
      double v158 = v157;
      double v160 = v159;
      double v162 = v161;
      objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 1, v84, v163);
      objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:", 2, 1, v108, -v162);
      objc_msgSend(v123, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToValueOfView:withOffset:", 3, v84, v158);
      objc_msgSend(v123, "ax_constrainLayoutAttribute:asLessThanOrEqualToValueOfView:withOffset:", 4, v84, -v160);
      objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 10, v84, (v158 - v160) * 0.5);
      LODWORD(v164) = 1132068864;
      objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:priority:", 3, v84, v158, v164);
      LODWORD(v165) = 1132068864;
      objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:priority:", 4, v84, -v160, v165);
    }
    [v29 size];
    double v168 = v167;
    if (v147)
    {
      v169 = [MEMORY[0x263F1C408] sharedApplication];
      v170 = [v169 preferredContentSizeCategory];
      NSComparisonResult v171 = UIContentSizeCategoryCompareToCategory(v170, (UIContentSizeCategory)*MEMORY[0x263F1D140]);

      if (v171 == NSOrderedDescending)
      {
        double v172 = 40.0;
        v94 = v207;
      }
      else
      {
        v174 = [MEMORY[0x263F1C408] sharedApplication];
        v175 = [v174 preferredContentSizeCategory];
        NSComparisonResult v176 = UIContentSizeCategoryCompareToCategory(v175, (UIContentSizeCategory)*MEMORY[0x263F1D160]);

        double v172 = 30.0;
        BOOL v25 = v176 == NSOrderedDescending;
        v94 = v207;
        if (!v25)
        {
          v177 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", 30.0);
          v178 = [v177 preferredContentSizeCategory];
          NSComparisonResult v179 = UIContentSizeCategoryCompareToCategory(v178, (UIContentSizeCategory)*MEMORY[0x263F1D170]);

          BOOL v25 = v179 == NSOrderedDescending;
          v94 = v207;
          double v172 = 20.0;
          if (v25) {
            double v172 = 25.0;
          }
        }
      }
      if (v172 < v168) {
        double v168 = v172;
      }
      double v173 = v168;
      unint64_t v92 = v210;
    }
    else
    {
      double v173 = v166;
    }
    objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToConstant:", 7, v168);
    objc_msgSend(v123, "ax_constrainLayoutAttribute:asEqualToConstant:", 8, v173);
  }
LABEL_108:
  [v212 alertBackgroundSizeForType:v92];
  double v182 = v180;
  double v183 = v181;
  if (v180 <= 0.0)
  {
    BOOL v184 = 0;
    id v14 = v205;
  }
  else
  {
    id v14 = v205;
    BOOL v184 = vabdd_f64(v180, *(double *)&AXUIAlertSizeMetricFitting) >= 2.22044605e-16
        && vabdd_f64(v180, *(double *)&AXUIAlertSizeMetricFillingContainer) >= 2.22044605e-16;
  }
  if (v181 > 0.0 && vabdd_f64(v181, *(double *)&AXUIAlertSizeMetricFitting) >= 2.22044605e-16)
  {
    BOOL v185 = vabdd_f64(v181, *(double *)&AXUIAlertSizeMetricFillingContainer) >= 2.22044605e-16;
    if (!v184) {
      goto LABEL_120;
    }
  }
  else
  {
    BOOL v185 = 0;
    if (!v184) {
      goto LABEL_120;
    }
  }
  if (![v212 alertShouldGrowInAxis:0 forType:v92])
  {
    objc_msgSend(v94, "ax_constrainLayoutAttribute:asEqualToConstant:", 7, v182);
    if (!v185) {
      goto LABEL_128;
    }
LABEL_123:
    if ([v212 alertShouldGrowInAxis:1 forType:v92])
    {
      objc_msgSend(v94, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToConstant:", 8, v183);
    }
    else if (v92 != 3 && v211 != v92)
    {
      objc_msgSend(v94, "ax_constrainLayoutAttribute:asEqualToConstant:", 8, v183);
    }
    goto LABEL_128;
  }
  objc_msgSend(v94, "ax_constrainLayoutAttribute:asGreaterThanOrEqualToConstant:", 7, v182);
LABEL_120:
  if (v185) {
    goto LABEL_123;
  }
LABEL_128:
  [v212 alertContentEdgeInsetsForType:v92];
  double v187 = v186;
  double v189 = v188;
  double v191 = v190;
  objc_msgSend(v84, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 1, v17, v192);
  objc_msgSend(v84, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 2, v17, -v191);
  if ((AXDeviceHasHomeButton() & 1) != 0 || !AXDeviceIsPhone())
  {
    objc_msgSend(v84, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 3, v17, v187);
  }
  else
  {
    v193 = [v84 topAnchor];
    v194 = [(AXStyleProviderUIAlert *)v17 safeAreaLayoutGuide];
    v195 = [v194 topAnchor];
    v196 = [v193 constraintEqualToAnchor:v195];
    [v196 setActive:1];

    id v14 = v205;
    v94 = v207;

    unint64_t v92 = v210;
  }
  objc_msgSend(v84, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 4, v17, -v189);
  objc_msgSend(v94, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 9, v17);
  objc_msgSend(v94, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 7, v17);
  if (v211)
  {
    objc_msgSend(v94, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 8, v17, 10.0);
    double v197 = 3.0;
    if (v201) {
      double v197 = -3.0;
    }
    objc_msgSend(v94, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 4, v17, v197);
  }
  else
  {
    objc_msgSend(v94, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 8, v17);
    objc_msgSend(v94, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 10, v17);
  }
  [(AXStyleProviderUIAlert *)v17 setAlertType:v92];
  [(AXStyleProviderUIAlert *)v17 setStyleProvider:v212];
  v198 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v17 action:sel__handleTapGestureRecognizer_];
  [v84 addGestureRecognizer:v198];
  v199 = (void *)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:v17 action:sel__handlePanGestureRecognizer_];
  [v199 setMaximumNumberOfTouches:1];
  [v84 addGestureRecognizer:v199];

  id v15 = v202;
LABEL_138:

  return v17;
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  id v11 = a3;
  [v11 locationInView:self];
  if (-[AXStyleProviderUIAlert pointInside:withEvent:](self, "pointInside:withEvent:", 0)
    && (!v11 || [v11 state] == 3))
  {
    v4 = [(AXUIAlert *)self context];
    v5 = [v4 service];
    if ([v5 conformsToProtocol:&unk_26D3E3A80])
    {
      v6 = [(AXUIAlert *)self context];
      v7 = [v6 service];
    }
    else
    {
      v7 = 0;
    }

    if (objc_opt_respondsToSelector())
    {
      v8 = [(AXUIAlert *)self context];
      v9 = [v8 identifier];
      v10 = [(AXUIAlert *)self userInfo];
      [v7 alertWithIdentifierWasActivated:v9 userInfo:v10];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      v8 = [(AXUIAlert *)self context];
      v9 = [v8 identifier];
      [v7 alertWithIdentifierWasActivated:v9];
    }

    goto LABEL_12;
  }
LABEL_13:

  MEMORY[0x270F9A758]();
}

- (void)_handlePanGestureRecognizer:(id)a3
{
  id v9 = a3;
  switch([v9 state])
  {
    case 1:
      [v9 locationInView:self];
      self->_dismissalGestureYOffset = v4;
      [(AXStyleProviderUIAlert *)self frame];
      self->_backgroundViewDismissalOrigin.x = v5;
      self->_backgroundViewDismissalOrigin.y = v6;
      v7 = self;
      id v8 = v9;
      goto LABEL_4;
    case 2:
      v7 = self;
      id v8 = v9;
LABEL_4:
      [(AXStyleProviderUIAlert *)v7 _updateDismissalWithPanGesture:v8];
      break;
    case 3:
      [(AXStyleProviderUIAlert *)self _endDismissalWithPanGesture:v9];
      break;
    case 4:
      [(AXStyleProviderUIAlert *)self _cancelDismissalWithPanGesture:v9];
      break;
    default:
      break;
  }
}

- (void)_updateDismissalWithPanGesture:(id)a3
{
  [a3 translationInView:self];
  double v5 = v4;
  [(AXStyleProviderUIAlert *)self frame];
  -[AXStyleProviderUIAlert setFrame:](self, "setFrame:");
  [(AXStyleProviderUIAlert *)self frame];
  double v6 = -v5 / CGRectGetHeight(v8);

  [(AXStyleProviderUIAlert *)self _updateViewForDismissalPercentage:v6];
}

- (void)_updateViewForDismissalPercentage:(double)a3
{
  if (a3 <= 0.0)
  {
    [(AXStyleProviderUIAlert *)self frame];
    double x = self->_backgroundViewDismissalOrigin.x;
    double y = self->_backgroundViewDismissalOrigin.y;
    -[AXStyleProviderUIAlert setFrame:](self, "setFrame:", x, y);
  }
  else if (a3 > 0.3)
  {
    [(AXStyleProviderUIAlert *)self _endDismissalWithPanGesture:0];
  }
}

- (void)_endDismissalWithPanGesture:(id)a3
{
  id v4 = a3;
  [v4 translationInView:self];
  double v6 = v5;
  [v4 velocityInView:self];
  double v8 = v7;

  [(AXStyleProviderUIAlert *)self frame];
  double Height = CGRectGetHeight(v24);
  if (v8 > 800.0 || (double Height = -v6 / Height, Height > 0.3))
  {
    v10 = [(AXUIAlert *)self context];
    id v11 = [v10 service];
    if ([v11 conformsToProtocol:&unk_26D3E3A80])
    {
      v12 = [(AXUIAlert *)self context];
      id v20 = [v12 service];
    }
    else
    {
      id v20 = 0;
    }

    if (objc_opt_respondsToSelector())
    {
      v13 = [(AXUIAlert *)self context];
      id v14 = [v13 identifier];
      [v20 alertWithIdentifierDidDisappear:v14];
    }
    id v15 = +[AXUIDisplayManager sharedDisplayManager];
    v16 = [(AXUIAlert *)self context];
    v17 = [v16 identifier];
    int v18 = [(AXUIAlert *)self context];
    unint64_t v19 = [v18 service];
    [v15 hideAlertWithIdentifier:v17 forService:v19];
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __54__AXStyleProviderUIAlert__endDismissalWithPanGesture___block_invoke;
    v22[3] = &unk_2645C5968;
    v22[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v22 animations:0.2];
  }
}

uint64_t __54__AXStyleProviderUIAlert__endDismissalWithPanGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewForDismissalPercentage:0.0];
}

- (void)_cancelDismissalWithPanGesture:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__AXStyleProviderUIAlert__cancelDismissalWithPanGesture___block_invoke;
  v3[3] = &unk_2645C5968;
  v3[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:0.2];
}

uint64_t __57__AXStyleProviderUIAlert__cancelDismissalWithPanGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewForDismissalPercentage:0.0];
}

- (void)addToContainerView:(id)a3
{
  id v30 = a3;
  [(AXStyleProviderUIAlert *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  [v30 addSubview:self];
  id v4 = [(AXStyleProviderUIAlert *)self styleProvider];
  unint64_t v5 = [(AXStyleProviderUIAlert *)self alertType];
  [v4 alertEdgeInsetsForType:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  int v14 = [v4 alertPositionForType:v5];
  [v4 alertBackgroundSizeForType:v5];
  double v16 = vabdd_f64(v15, *(double *)&AXUIAlertSizeMetricFillingContainer);
  double v18 = vabdd_f64(v17, *(double *)&AXUIAlertSizeMetricFillingContainer);
  int v19 = v14 - 1;
  if ((v14 - 1) > 7)
  {
    uint64_t v21 = -1;
    uint64_t v20 = 1;
    uint64_t v22 = 1;
    uint64_t v23 = -1;
  }
  else
  {
    uint64_t v20 = qword_22176C288[v19];
    uint64_t v21 = qword_22176C2C8[v19];
    uint64_t v22 = qword_22176C308[v19];
    uint64_t v23 = qword_22176C348[v19];
  }
  if (v16 >= 2.22044605e-16) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = 0;
  }
  if (v16 >= 2.22044605e-16) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = 0;
  }
  if (v18 >= 2.22044605e-16) {
    uint64_t v26 = v20;
  }
  else {
    uint64_t v26 = 0;
  }
  if (v18 >= 2.22044605e-16) {
    uint64_t v27 = v21;
  }
  else {
    uint64_t v27 = 0;
  }
  [(AXStyleProviderUIAlert *)self ax_constrainLayoutAttribute:3 relatedBy:v26 toItem:v30 attribute:3 multiplier:1.0 constant:v7];
  [(AXStyleProviderUIAlert *)self ax_constrainLayoutAttribute:4 relatedBy:v27 toItem:v30 attribute:4 multiplier:1.0 constant:-v11];
  [(AXStyleProviderUIAlert *)self ax_constrainLayoutAttribute:1 relatedBy:v24 toItem:v30 attribute:1 multiplier:1.0 constant:v9];
  [(AXStyleProviderUIAlert *)self ax_constrainLayoutAttribute:2 relatedBy:v25 toItem:v30 attribute:2 multiplier:1.0 constant:-v13];
  if (v24) {
    BOOL v28 = v25 == 0;
  }
  else {
    BOOL v28 = 1;
  }
  if (!v28) {
    [(AXStyleProviderUIAlert *)self ax_constrainLayoutAttribute:9 asEqualToValueOfView:v30];
  }
  if (v26) {
    BOOL v29 = v27 == 0;
  }
  else {
    BOOL v29 = 1;
  }
  if (!v29) {
    [(AXStyleProviderUIAlert *)self ax_constrainLayoutAttribute:10 asEqualToValueOfView:v30];
  }
  if (v16 < 2.22044605e-16) {
    [(AXStyleProviderUIAlert *)self ax_constrainLayoutAttribute:7 asEqualToValueOfView:v30 withOffset:-(v9 + v13)];
  }
  if (v18 < 2.22044605e-16) {
    [(AXStyleProviderUIAlert *)self ax_constrainLayoutAttribute:8 asEqualToValueOfView:v30 withOffset:-(v7 + v11)];
  }
}

- (void)_appendParagraphWithText:(id)a3 withTextColor:(id)a4 font:(id)a5 textAlignment:(int64_t)a6 lineSpacing:(double)a7 paragraphSpacingBefore:(double)a8 toAttributedString:(id)a9
{
  v40[1] = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v16 = a9;
  id v17 = a5;
  id v18 = a3;
  uint64_t v19 = [v16 length];
  uint64_t v20 = (void *)MEMORY[0x263F1C268];
  if (v19)
  {
    uint64_t v21 = [MEMORY[0x263F1C358] defaultParagraphStyle];
    uint64_t v22 = (void *)[v21 mutableCopy];

    uint64_t v23 = (void *)MEMORY[0x263F1C658];
    [MEMORY[0x263F1C658] labelFontSize];
    uint64_t v24 = objc_msgSend(v23, "systemFontOfSize:");
    [v24 lineHeight];
    [v22 setParagraphSpacingBefore:a8 - v25];

    uint64_t v39 = *v20;
    v40[0] = v22;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n\n" attributes:v26];
    [v16 appendAttributedString:v27];
  }
  BOOL v28 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  BOOL v29 = (void *)[v28 mutableCopy];

  [v29 setAlignment:a6];
  if (fabs(a7) >= 2.22044605e-16) {
    [v29 setLineSpacing:a7];
  }
  id v30 = v15;
  uint64_t v31 = v30;
  if (!v30)
  {
    id v32 = v20;
    v33 = [(AXStyleProviderUIAlert *)self traitCollection];
    uint64_t v34 = [v33 userInterfaceStyle];

    if (v34 == 2) {
      [MEMORY[0x263F1C550] whiteColor];
    }
    else {
    uint64_t v31 = [MEMORY[0x263F1C550] blackColor];
    }
    uint64_t v20 = v32;
  }
  id v35 = objc_alloc(NSDictionary);
  v36 = objc_msgSend(v35, "initWithObjectsAndKeys:", v29, *v20, v17, *MEMORY[0x263F1C238], v31, *MEMORY[0x263F1C240], 0);

  v37 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v18 attributes:v36];
  [v16 appendAttributedString:v37];
}

- (void)_appendParagraphWithText:(id)a3 withImage:(id)a4 withTextColor:(id)a5 font:(id)a6 textAlignment:(int64_t)a7 lineSpacing:(double)a8 paragraphSpacingBefore:(double)a9 toAttributedString:(id)a10
{
  id v17 = a5;
  id v18 = (void *)MEMORY[0x263F1C358];
  id v19 = a10;
  id v20 = a6;
  id v21 = a4;
  id v22 = a3;
  uint64_t v23 = [v18 defaultParagraphStyle];
  uint64_t v24 = (void *)[v23 mutableCopy];

  [v24 setAlignment:a7];
  if (fabs(a8) >= 2.22044605e-16) {
    [v24 setLineSpacing:a8];
  }
  id v25 = v17;
  id v34 = v25;
  if (!v25)
  {
    uint64_t v26 = [(AXStyleProviderUIAlert *)self traitCollection];
    uint64_t v27 = [v26 userInterfaceStyle];

    if (v27 == 2) {
      [MEMORY[0x263F1C550] whiteColor];
    }
    else {
    id v25 = [MEMORY[0x263F1C550] blackColor];
    }
  }
  id v28 = objc_alloc(NSDictionary);
  BOOL v29 = objc_msgSend(v28, "initWithObjectsAndKeys:", v24, *MEMORY[0x263F1C268], v20, *MEMORY[0x263F1C238], v25, *MEMORY[0x263F1C240], 0);

  id v30 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v22 attributes:v29];
  id v31 = objc_alloc_init(MEMORY[0x263F1C370]);
  [v31 setImage:v21];

  id v32 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v31 attributes:v29];
  [v19 appendAttributedString:v32];

  v33 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"  "];
  [v19 appendAttributedString:v33];

  [v19 appendAttributedString:v30];
}

- (unint64_t)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(unint64_t)a3
{
  self->_alertType = a3;
}

- (AXUIAlertStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end