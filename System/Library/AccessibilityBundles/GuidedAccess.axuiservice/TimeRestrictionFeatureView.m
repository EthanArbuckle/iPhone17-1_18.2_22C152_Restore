@interface TimeRestrictionFeatureView
- (CGRect)accessibilityFrame:(id)a3;
- (NSLayoutConstraint)detailTextZeroHeightConstraint;
- (TimeRestrictionFeatureView)initWithIdentifier:(id)a3 type:(int64_t)a4 icon:(id)a5 text:(id)a6 detailText:(id)a7 initialState:(BOOL)a8 initialDuration:(int64_t)a9 styleProvider:(id)a10;
- (UIAccessibilityElement)topShelfAXElement;
- (UIDatePicker)datePicker;
- (UIView)topShelfContainer;
- (id)_datePickerWithInitialEnabledState:(BOOL)a3 initialDurationInMinutes:(int64_t)a4;
- (id)accessibilityElements;
- (id)accessibilityHint:(id)a3;
- (id)accessibilityLabel:(id)a3;
- (int64_t)durationInMinutes;
- (void)_applyAutolayoutConstraintsWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7;
- (void)_constructViewHierarchyWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7;
- (void)_handleDatePickerValueDidChange:(id)a3;
- (void)_handleValueChanged:(id)a3;
- (void)_setDatePickerVisible:(BOOL)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)resetCountDownDurationForDatePicker;
- (void)setDatePicker:(id)a3;
- (void)setDetailTextZeroHeightConstraint:(id)a3;
- (void)setDurationInMinutes:(int64_t)a3;
- (void)setTopShelfAXElement:(id)a3;
- (void)setTopShelfContainer:(id)a3;
@end

@implementation TimeRestrictionFeatureView

- (TimeRestrictionFeatureView)initWithIdentifier:(id)a3 type:(int64_t)a4 icon:(id)a5 text:(id)a6 detailText:(id)a7 initialState:(BOOL)a8 initialDuration:(int64_t)a9 styleProvider:(id)a10
{
  v13.receiver = self;
  v13.super_class = (Class)TimeRestrictionFeatureView;
  v10 = [(GAXFeatureView_Phone *)&v13 initWithIdentifier:a3 type:a4 icon:a5 text:a6 detailText:a7 initialState:a8 styleProvider:a10];
  v11 = v10;
  if (v10) {
    [(TimeRestrictionFeatureView *)v10 setDurationInMinutes:a9];
  }
  return v11;
}

- (id)_datePickerWithInitialEnabledState:(BOOL)a3 initialDurationInMinutes:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)UIDatePicker), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addTarget:self action:"_handleDatePickerValueDidChange:" forControlEvents:4096];
  [v7 setGaxDatePickerEnabled:v5];
  [v7 setDatePickerMode:3];
  [v7 setPreferredDatePickerStyle:1];
  [v7 updateSelectedDurationInMinutes:a4 animated:1];

  return v7;
}

- (void)_constructViewHierarchyWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7
{
  v21.receiver = self;
  v21.super_class = (Class)TimeRestrictionFeatureView;
  [(GAXFeatureView_Phone *)&v21 _constructViewHierarchyWithIcon:a3 text:a4 detailText:a5 initialFeatureState:a6 styleProvider:a7];
  id v8 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TimeRestrictionFeatureView *)self setTopShelfContainer:v8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = [(TimeRestrictionFeatureView *)self subviews];
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v14 removeFromSuperview];
        [v8 addSubview:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v11);
  }

  [(TimeRestrictionFeatureView *)self addSubview:v8];
  [(TimeRestrictionFeatureView *)self setIsAccessibilityElement:0];
  id v15 = [objc_alloc((Class)UIAccessibilityElement) initWithAccessibilityContainer:self];
  [(TimeRestrictionFeatureView *)self setTopShelfAXElement:v15];

  v16 = [(TimeRestrictionFeatureView *)self topShelfAXElement];
  [v16 setAccessibilityDelegate:self];
}

- (void)_applyAutolayoutConstraintsWithIcon:(id)a3 text:(id)a4 detailText:(id)a5 initialFeatureState:(BOOL)a6 styleProvider:(id)a7
{
  BOOL v154 = a6;
  id v8 = a7;
  v9 = [(TimeRestrictionFeatureView *)self topShelfContainer];
  id v10 = [(GAXFeatureView *)self toggleSwitch];
  uint64_t v11 = [(GAXFeatureView_Phone *)self textContainerView];
  uint64_t v12 = [(GAXFeatureView *)self textLabel];
  objc_super v13 = [(GAXFeatureView_Phone *)self detailTextLabel];
  [(GAXFeatureView *)self iconView];
  v159 = v158 = v10;
  v155 = (void *)v12;
  v156 = v13;
  v157 = (void *)v11;
  uint64_t v14 = _NSDictionaryOfVariableBindings(@"topShelfContainer, toggleSwitch, textView, textLabel, detailTextLabel, iconView", v9, v10, v11, v12, v13, v159, 0);
  v163[0] = @"textViewLeftConstant";
  [v8 featureViewTextHorizontalPadding];
  id v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v163[1] = @"textViewRightConstant";
  v164[0] = v15;
  v16 = v8;
  [v8 featureViewTextHorizontalPadding];
  long long v18 = +[NSNumber numberWithDouble:v17 * -0.5];
  v164[1] = v18;
  long long v19 = +[NSDictionary dictionaryWithObjects:v164 forKeys:v163 count:2];

  long long v20 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topShelfContainer]" options:0 metrics:v19 views:v14];
  [(TimeRestrictionFeatureView *)self addConstraints:v20];

  objc_super v21 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topShelfContainer]|" options:0 metrics:v19 views:v14];
  [(TimeRestrictionFeatureView *)self addConstraints:v21];

  [v8 featureViewMinimumHeight];
  v23 = +[NSLayoutConstraint constraintWithItem:v9 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:0.0 constant:v22];
  [v9 addConstraint:v23];

  LODWORD(v24) = 1148846080;
  [v9 setContentHuggingPriority:0 forAxis:v24];
  LODWORD(v25) = 1148846080;
  [v9 setContentHuggingPriority:1 forAxis:v25];
  LODWORD(v26) = 1148846080;
  [v9 setContentCompressionResistancePriority:0 forAxis:v26];
  LODWORD(v27) = 1148846080;
  [v9 setContentCompressionResistancePriority:1 forAxis:v27];
  [(TimeRestrictionFeatureView *)self _setDatePickerVisible:v154 completion:0];
  v28 = +[UIApplication sharedApplication];
  v29 = [v28 preferredContentSizeCategory];
  uint64_t v30 = _UIContentSizeCategoryCompareToContentSizeCategory();

  if (v30 == -1)
  {
    v123 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[textView]|" options:0 metrics:v19 views:v14];
    [v9 addConstraints:v123];

    v124 = +[NSLayoutConstraint constraintWithItem:v10 attribute:10 relatedBy:0 toItem:v9 attribute:10 multiplier:1.0 constant:0.0];
    [v9 addConstraint:v124];

    v125 = +[NSLayoutConstraint constraintWithItem:v159 attribute:10 relatedBy:0 toItem:v9 attribute:10 multiplier:1.0 constant:0.0];
    [v9 addConstraint:v125];

    v126 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|[iconView]-textViewLeftConstant-[textView]-textViewRightConstant-[toggleSwitch]", 0, v19, v14);
    [v9 addConstraints:v126];

    v127 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[textLabel][detailTextLabel]|" options:0 metrics:v19 views:v14];
    [(TimeRestrictionFeatureView *)self addConstraints:v127];

    v128 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[textLabel]|" options:0 metrics:v19 views:v14];
    [(TimeRestrictionFeatureView *)self addConstraints:v128];

    v129 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[detailTextLabel]|" options:0 metrics:v19 views:v14];
    [(TimeRestrictionFeatureView *)self addConstraints:v129];

    v130 = [v159 widthAnchor];
    [v16 featureViewIconStandardLayoutWidth];
    v131 = objc_msgSend(v130, "constraintEqualToConstant:");
    v162 = v131;
    +[NSArray arrayWithObjects:&v162 count:1];
    v122 = (void *)v14;
    v133 = v132 = v16;
    +[NSLayoutConstraint activateConstraints:v133];

    v115 = v132;
    v120 = v159;

    v121 = v9;
    [v115 featureViewToggleOffset];
    objc_msgSend(v10, "ax_constrainLayoutAttribute:asEqualToValueOfView:withOffset:", 6, self);
    LODWORD(v134) = 1148846080;
    [v10 setContentHuggingPriority:0 forAxis:v134];
    LODWORD(v135) = 1148846080;
    [v10 setContentHuggingPriority:1 forAxis:v135];
    LODWORD(v136) = 1148846080;
    [v10 setContentCompressionResistancePriority:0 forAxis:v136];
    LODWORD(v137) = 1148846080;
    [v10 setContentCompressionResistancePriority:1 forAxis:v137];
    v61 = v155;
    LODWORD(v138) = 1132068864;
    [v155 setContentHuggingPriority:0 forAxis:v138];
    LODWORD(v139) = 1148846080;
    [v155 setContentHuggingPriority:1 forAxis:v139];
    LODWORD(v140) = 1144750080;
    [v155 setContentCompressionResistancePriority:0 forAxis:v140];
    LODWORD(v141) = 1148846080;
    [v155 setContentCompressionResistancePriority:1 forAxis:v141];
    LODWORD(v142) = 1132068864;
    [v13 setContentHuggingPriority:0 forAxis:v142];
    LODWORD(v143) = 1144750080;
    [v13 setContentCompressionResistancePriority:0 forAxis:v143];
    LODWORD(v144) = 1148846080;
    [v13 setContentCompressionResistancePriority:1 forAxis:v144];
    LODWORD(v145) = 1148846080;
    [v13 setContentHuggingPriority:1 forAxis:v145];
    v66 = v157;
  }
  else
  {
    v152 = v19;
    v153 = (void *)v14;
    LODWORD(v31) = 0.5;
    [v155 _setHyphenationFactor:v31];
    [v16 featureViewToggleOffset];
    double v33 = v32;
    [v16 featureViewTextHorizontalPadding];
    double v35 = v34;
    v36 = +[NSMutableArray array];
    [v159 topAnchor];
    v38 = v37 = v16;
    v39 = [v9 topAnchor];
    v40 = [v38 constraintGreaterThanOrEqualToAnchor:v39];
    [v36 addObject:v40];

    v41 = [v159 bottomAnchor];
    v42 = v9;
    v43 = [v9 bottomAnchor];
    v44 = [v41 constraintLessThanOrEqualToAnchor:v43];
    [v36 addObject:v44];

    v45 = [v155 font];
    [v45 capHeight];
    double v47 = v46;

    v48 = [v159 centerYAnchor];
    v49 = [v155 firstBaselineAnchor];
    v50 = [v48 constraintEqualToAnchor:v49 constant:v47 * -0.5];
    [v36 addObject:v50];

    v51 = objc_opt_new();
    [(TimeRestrictionFeatureView *)self addLayoutGuide:v51];
    v52 = [v51 leadingAnchor];
    v53 = [(TimeRestrictionFeatureView *)self leadingAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    [v36 addObject:v54];

    v55 = [v51 widthAnchor];
    [v37 featureViewIconStandardLayoutWidth];
    v57 = [v55 constraintEqualToConstant:v56 * 0.5];
    [v36 addObject:v57];

    v58 = [v159 centerXAnchor];
    v151 = v51;
    v59 = [v51 trailingAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    [v36 addObject:v60];

    v61 = v155;
    v62 = [v155 attributedText];
    v149 = [v62 attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:0];
    id v63 = [v149 mutableCopy];
    [v37 featureViewIconLargeTextLayoutTextIndent];
    objc_msgSend(v63, "setFirstLineHeadIndent:");
    v150 = v62;
    id v64 = [v62 mutableCopy];
    v147 = self;
    if ([v64 length])
    {
      NSAttributedStringKey v160 = NSParagraphStyleAttributeName;
      id v161 = v63;
      v65 = +[NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];
      objc_msgSend(v64, "setAttributes:range:", v65, 0, 1);
    }
    [v155 setAttributedText:v64];
    v66 = v157;
    v67 = [v157 topAnchor];
    v148 = v64;
    v68 = v42;
    v69 = [v42 topAnchor];
    v70 = [v67 constraintGreaterThanOrEqualToAnchor:v69];
    [v36 addObject:v70];

    v71 = [v157 trailingAnchor];
    v72 = [v42 trailingAnchor];
    v73 = [v71 constraintEqualToAnchor:v72 constant:v33];
    [v36 addObject:v73];

    v74 = [v157 leadingAnchor];
    v75 = [v42 leadingAnchor];
    v76 = [v74 constraintEqualToAnchor:v75 constant:v35];
    [v36 addObject:v76];

    v77 = [v155 topAnchor];
    v78 = [v157 topAnchor];
    v79 = [v77 constraintEqualToAnchor:v78];
    [v36 addObject:v79];

    v80 = [v155 leadingAnchor];
    v81 = [v157 leadingAnchor];
    v82 = [v80 constraintEqualToAnchor:v81];
    [v36 addObject:v82];

    v83 = [v155 widthAnchor];
    v84 = [v157 widthAnchor];
    v85 = [v83 constraintEqualToAnchor:v84];
    [v36 addObject:v85];

    v86 = [v155 bottomAnchor];
    v146 = v63;
    objc_super v13 = v156;
    v87 = [v156 topAnchor];
    v88 = [v86 constraintEqualToAnchor:v87];
    [v36 addObject:v88];

    v89 = [v156 leadingAnchor];
    v90 = [v157 leadingAnchor];
    v91 = [v89 constraintEqualToAnchor:v90];
    [v36 addObject:v91];

    v92 = [v156 widthAnchor];
    v93 = [v157 widthAnchor];
    v94 = [v92 constraintEqualToAnchor:v93];
    [v36 addObject:v94];

    v95 = [v156 bottomAnchor];
    v96 = [v157 bottomAnchor];
    v97 = [v95 constraintEqualToAnchor:v96];
    [v36 addObject:v97];

    LODWORD(v98) = AXResistAllCompressingAndStretching[0];
    LODWORD(v99) = AXResistAllCompressingAndStretching[1];
    LODWORD(v100) = AXResistAllCompressingAndStretching[2];
    LODWORD(v101) = AXResistAllCompressingAndStretching[3];
    id v10 = v158;
    objc_msgSend(v158, "ax_setContentHuggingAndCompressionResistance:", v98, v99, v100, v101);
    v102 = [v158 topAnchor];
    v103 = [v157 bottomAnchor];
    v104 = [v102 constraintEqualToAnchor:v103];
    [v36 addObject:v104];

    v105 = [v158 leadingAnchor];
    v106 = [v157 leadingAnchor];
    v107 = [v105 constraintEqualToAnchor:v106];
    [v36 addObject:v107];

    v108 = [v158 bottomAnchor];
    v109 = [v68 bottomAnchor];
    [v37 featureViewAdditionalBottomOffsetForLargeText];
    v111 = [v108 constraintEqualToAnchor:v109 constant:-v110];
    [v36 addObject:v111];

    v112 = [v68 heightAnchor];
    v113 = [(TimeRestrictionFeatureView *)v147 heightAnchor];
    v114 = [v112 constraintLessThanOrEqualToAnchor:v113];
    [v36 addObject:v114];

    v115 = v37;
    +[NSLayoutConstraint activateConstraints:v36];
    LODWORD(v116) = 1132068864;
    [v156 setContentHuggingPriority:0 forAxis:v116];
    LODWORD(v117) = 1144750080;
    [v156 setContentCompressionResistancePriority:0 forAxis:v117];
    LODWORD(v118) = 1148846080;
    [v156 setContentCompressionResistancePriority:1 forAxis:v118];
    LODWORD(v119) = 1148846080;
    [v156 setContentHuggingPriority:1 forAxis:v119];

    v120 = v159;
    v121 = v68;
    long long v19 = v152;
    v122 = v153;
  }
}

- (void)_setDatePickerVisible:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(GAXFeatureView_Phone *)self detailTextLabel];
  id v8 = [(GAXFeatureView *)self delegate];
  v9 = [v8 styleProviderForFeatureView:self];

  [v9 defaultAnimationDuration];
  double v11 = v10;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_36C44;
  v16[3] = &unk_5E550;
  BOOL v18 = a3;
  v16[4] = self;
  id v17 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_36F40;
  v14[3] = &unk_5CE38;
  id v15 = v6;
  id v12 = v6;
  id v13 = v7;
  +[UIView animateWithDuration:v16 animations:v14 completion:v11];
}

- (void)_handleDatePickerValueDidChange:(id)a3
{
  id v9 = a3;
  v4 = [(TimeRestrictionFeatureView *)self datePicker];
  -[TimeRestrictionFeatureView setDurationInMinutes:](self, "setDurationInMinutes:", [v4 selectedDurationInMinutes]);

  BOOL v5 = GAXLocalizedStringForTimeDuration((double)[(TimeRestrictionFeatureView *)self durationInMinutes] * 60.0);
  uint64_t v6 = [(GAXFeatureView_Phone *)self detailTextLabel];
  [(id)v6 setText:v5];

  id v7 = [(GAXFeatureView *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(GAXFeatureView *)self delegate];
    objc_msgSend(v8, "featureView:didChangeTimeRestrictionDuration:timeRestrictionsEnabled:", self, objc_msgSend(v9, "selectedDurationInMinutes"), objc_msgSend(v9, "isEnabled"));
  }
}

- (void)_handleValueChanged:(id)a3
{
  id v4 = a3;
  if ((int *)[(GAXFeatureView *)self type] == &dword_4)
  {
    BOOL v5 = GAXLocalizedStringForTimeDuration((double)[(TimeRestrictionFeatureView *)self durationInMinutes] * 60.0);
    uint64_t v6 = [(GAXFeatureView_Phone *)self detailTextLabel];
    [v6 setText:v5];

    id v7 = [v4 isOn];
    id v8 = [(TimeRestrictionFeatureView *)self datePicker];
    [v8 setGaxDatePickerEnabled:v7];

    objc_initWeak(&location, self);
    id v9 = [v4 isOn];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_3725C;
    v11[3] = &unk_5E578;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    [(TimeRestrictionFeatureView *)self _setDatePickerVisible:v9 completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TimeRestrictionFeatureView;
    [(GAXFeatureView *)&v10 _handleValueChanged:v4];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TimeRestrictionFeatureView;
  [(TimeRestrictionFeatureView *)&v3 layoutSubviews];
  [(TimeRestrictionFeatureView *)self resetCountDownDurationForDatePicker];
}

- (void)resetCountDownDurationForDatePicker
{
  [(UIDatePicker *)self->_datePicker countDownDuration];
  double v4 = v3;
  [(UIDatePicker *)self->_datePicker setCountDownDuration:0.0];
  datePicker = self->_datePicker;

  [(UIDatePicker *)datePicker setCountDownDuration:v4];
}

- (id)accessibilityElements
{
  double v3 = +[NSMutableArray array];
  double v4 = [(TimeRestrictionFeatureView *)self topShelfAXElement];
  [v3 addObject:v4];

  BOOL v5 = [(TimeRestrictionFeatureView *)self datePicker];
  unsigned int v6 = [v5 _accessibilityViewIsVisible];

  if (v6)
  {
    id v7 = [(TimeRestrictionFeatureView *)self datePicker];
    [v3 addObject:v7];
  }

  return v3;
}

- (id)accessibilityHint:(id)a3
{
  return 0;
}

- (id)accessibilityLabel:(id)a3
{
  double v4 = [(TimeRestrictionFeatureView *)self accessibilityLabel];
  BOOL v5 = [(GAXFeatureView_Phone *)self detailTextLabel];
  if ([v5 _accessibilityViewIsVisible])
  {
    unsigned int v6 = [(GAXFeatureView_Phone *)self detailTextLabel];
    id v9 = [v6 text];
    id v7 = __UIAXStringForVariables();
  }
  else
  {
    id v7 = __UIAXStringForVariables();
  }

  return v7;
}

- (CGRect)accessibilityFrame:(id)a3
{
  double v3 = [(TimeRestrictionFeatureView *)self topShelfContainer];
  [v3 accessibilityFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIView)topShelfContainer
{
  return self->_topShelfContainer;
}

- (void)setTopShelfContainer:(id)a3
{
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
}

- (NSLayoutConstraint)detailTextZeroHeightConstraint
{
  return self->_detailTextZeroHeightConstraint;
}

- (void)setDetailTextZeroHeightConstraint:(id)a3
{
}

- (UIAccessibilityElement)topShelfAXElement
{
  return self->_topShelfAXElement;
}

- (void)setTopShelfAXElement:(id)a3
{
}

- (int64_t)durationInMinutes
{
  return self->_durationInMinutes;
}

- (void)setDurationInMinutes:(int64_t)a3
{
  self->_durationInMinutes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topShelfAXElement, 0);
  objc_storeStrong((id *)&self->_detailTextZeroHeightConstraint, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);

  objc_storeStrong((id *)&self->_topShelfContainer, 0);
}

@end