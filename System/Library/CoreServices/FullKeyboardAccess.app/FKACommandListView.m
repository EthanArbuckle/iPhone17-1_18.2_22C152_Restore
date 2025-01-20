@interface FKACommandListView
- (FKACommandListView)initWithCommandList:(id)a3 blurEffect:(id)a4;
@end

@implementation FKACommandListView

- (FKACommandListView)initWithCommandList:(id)a3 blurEffect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v131.receiver = self;
  v131.super_class = (Class)FKACommandListView;
  v8 = [(FKACommandListView *)&v131 init];
  if (v8)
  {
    id v9 = objc_alloc((Class)UIVisualEffectView);
    v10 = +[UIVibrancyEffect effectForBlurEffect:v7 style:0];
    id v11 = [v9 initWithEffect:v10];

    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v12 = objc_alloc((Class)UIVisualEffectView);
    id v110 = v7;
    v13 = +[UIVibrancyEffect effectForBlurEffect:v7 style:1];
    id v14 = [v12 initWithEffect:v13];

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FKACommandListView *)v8 addSubview:v11];
    v109 = v8;
    [(FKACommandListView *)v8 addSubview:v14];
    uint64_t v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    v16 = objc_opt_new();
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v115 = (void *)v15;
    [v16 setFont:v15];
    v17 = [v6 title];
    [v16 setText:v17];

    [v16 setTextAlignment:1];
    [v16 setNumberOfLines:0];
    v116 = v11;
    v18 = [v11 contentView];
    v114 = v16;
    [v18 addSubview:v16];

    v113 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleHeadline];
    v19 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleSubheadline];
    v124 = +[NSMutableArray array];
    v123 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    v112 = v6;
    id obj = [v6 items];
    v20 = &AXDeviceIsPad_ptr;
    id v125 = [obj countByEnumeratingWithState:&v127 objects:v135 count:16];
    v122 = v14;
    if (v125)
    {
      uint64_t v120 = *(void *)v128;
      do
      {
        for (i = 0; i != v125; i = (char *)i + 1)
        {
          if (*(void *)v128 != v120) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v127 + 1) + 8 * i);
          v23 = objc_opt_new();
          [v23 setFont:v123];
          v24 = [v22 name];
          [v23 setText:v24];

          [v23 setTextAlignment:4];
          [v23 setNumberOfLines:0];
          v25 = objc_opt_new();
          v26 = [v22 keyDescription];
          [v25 setText:v26];

          v27 = +[UIFont systemFontOfSize:15.0 weight:UIFontWeightSemibold];
          v28 = v19;
          v29 = [v19 scaledFontForFont:v27];
          [v25 setFont:v29];

          LODWORD(v30) = 1148829696;
          [v25 setContentCompressionResistancePriority:0 forAxis:v30];
          LODWORD(v31) = 1148813312;
          [v23 setContentCompressionResistancePriority:0 forAxis:v31];
          v32 = [FKACommandListItemView alloc];
          v134[0] = v23;
          v134[1] = v25;
          v33 = v20;
          v34 = [v20[155] arrayWithObjects:v134 count:2];
          v35 = [(FKACommandListItemView *)v32 initWithArrangedSubviews:v34];

          v36 = +[UIApplication sharedApplication];
          v37 = [v36 preferredContentSizeCategory];
          BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v37);

          if (IsAccessibilityCategory)
          {
            [(FKACommandListItemView *)v35 setAxis:1];
            [v25 setTextAlignment:4];
          }
          else
          {
            [(FKACommandListItemView *)v35 setAxis:0];
            v39 = +[UIApplication sharedApplication];
            objc_msgSend(v25, "setTextAlignment:", 2 * (objc_msgSend(v39, "userInterfaceLayoutDirection") != (id)1));
          }
          id v14 = v122;
          [(FKACommandListItemView *)v35 setDistribution:0];
          [v124 addObject:v35];

          v19 = v28;
          v20 = v33;
        }
        id v125 = [obj countByEnumeratingWithState:&v127 objects:v135 count:16];
      }
      while (v125);
    }
    v111 = v19;

    id v40 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v124];
    [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v40 setAxis:1];
    [v40 setBaselineRelativeArrangement:1];
    [v19 scaledValueForValue:18.0];
    double v42 = v41;
    [v123 capHeight];
    [v40 setSpacing:v42 + v43];
    v44 = [v14 contentView];
    [v44 addSubview:v40];

    v45 = +[NSMutableArray array];
    v46 = [v116 contentView];
    v8 = v109;
    v47 = +[NSLayoutConstraint ax_constraintsToMakeView:v109 sameDimensionsAsView:v46];
    [v45 addObjectsFromArray:v47];

    v48 = [v14 contentView];
    v49 = +[NSLayoutConstraint ax_constraintsToMakeView:v109 sameDimensionsAsView:v48];
    [v45 addObjectsFromArray:v49];

    [v113 scaledValueForValue:27.0];
    double v51 = v50;
    [v115 capHeight];
    double v53 = v51 + v52;
    [v19 scaledValueForValue:27.0];
    double v55 = v54;
    [v123 capHeight];
    double v57 = v55 + v56;
    id obja = [v114 firstBaselineAnchor];
    v107 = [(FKACommandListView *)v109 topAnchor];
    v105 = [obja constraintEqualToAnchor:v107 constant:v53];
    v133[0] = v105;
    v103 = [v114 leadingAnchor];
    v101 = [(FKACommandListView *)v109 leadingAnchor];
    v100 = [v103 constraintEqualToAnchor:v101];
    v133[1] = v100;
    v99 = [v114 trailingAnchor];
    v98 = [(FKACommandListView *)v109 trailingAnchor];
    v97 = [v99 constraintEqualToAnchor:v98];
    v133[2] = v97;
    v96 = [v40 firstBaselineAnchor];
    v95 = [v114 lastBaselineAnchor];
    v58 = [v96 constraintEqualToAnchor:v95 constant:v57];
    v133[3] = v58;
    v59 = [v40 leadingAnchor];
    v60 = [(FKACommandListView *)v109 leadingAnchor];
    v61 = [v59 constraintEqualToAnchor:v60 constant:40.0];
    v133[4] = v61;
    v126 = v40;
    [v40 trailingAnchor];
    v63 = v62 = v20;
    v64 = [(FKACommandListView *)v109 trailingAnchor];
    v65 = [v63 constraintEqualToAnchor:v64 constant:-40.0];
    v133[5] = v65;
    v66 = [v62[155] arrayWithObjects:v133 count:6];
    v121 = v45;
    [v45 addObjectsFromArray:v66];

    id v6 = v112;
    v67 = [v112 footerText];
    id v68 = [v67 length];

    if (v68)
    {
      v69 = objc_opt_new();
      [v69 setTranslatesAutoresizingMaskIntoConstraints:0];
      v70 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
      [v69 setFont:v70];

      [v69 setTextAlignment:1];
      v71 = [v112 footerText];
      [v69 setText:v71];

      [v69 setNumberOfLines:0];
      v72 = [v122 contentView];
      [v72 addSubview:v69];

      [v111 scaledValueForValue:27.0];
      double v74 = v73;
      v75 = [v69 font];
      [v75 capHeight];
      double v77 = v74 + v76;

      v78 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleFootnote];
      [v78 scaledValueForValue:27.0];
      double v80 = v79;

      v102 = [v69 leadingAnchor];
      uint64_t v81 = [(FKACommandListView *)v109 leadingAnchor];
      id objb = [v102 constraintEqualToAnchor:v81];
      v132[0] = objb;
      v108 = [v69 trailingAnchor];
      v106 = [(FKACommandListView *)v109 trailingAnchor];
      v104 = [v108 constraintEqualToAnchor:v106];
      v132[1] = v104;
      v82 = [v69 firstBaselineAnchor];
      v83 = [v126 lastBaselineAnchor];
      v84 = [v82 constraintEqualToAnchor:v83 constant:v77];
      v132[2] = v84;
      v85 = [(FKACommandListView *)v109 bottomAnchor];
      v86 = [v69 lastBaselineAnchor];
      v87 = [v85 constraintEqualToAnchor:v86 constant:v80];
      v132[3] = v87;
      v88 = +[NSArray arrayWithObjects:v132 count:4];
      [v121 addObjectsFromArray:v88];

      v89 = (void *)v81;
      v90 = v102;

      id v6 = v112;
      v91 = v111;
    }
    else
    {
      v91 = v111;
      [v111 scaledValueForValue:27.0];
      double v93 = v92;
      v69 = [v126 lastBaselineAnchor];
      v90 = [(FKACommandListView *)v109 bottomAnchor];
      v89 = [v69 constraintEqualToAnchor:v90 constant:-v93];
      [v121 addObject:v89];
    }

    +[NSLayoutConstraint activateConstraints:v121];
    id v7 = v110;
  }

  return v8;
}

@end