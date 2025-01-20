@interface MTCCTimerBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (CADisplayLink)displayLink;
- (MTCCRoundButton)addTimerButton;
- (MTCCRoundButton)startStopButton;
- (MTCCTimer)timer;
- (MTCCTimerBackgroundViewController)init;
- (MTCCTimerBackgroundViewControllerDelegate)delegate;
- (NSDateComponentsFormatter)dateComponentsFormatter;
- (NSMutableArray)currentConstraints;
- (UILabel)timeLabel;
- (UILabel)titleLabel;
- (id)accessibilityCappedFontForStyle:(id)a3;
- (id)landscapeConstraints;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)portraitConstraints;
- (void)_reloadForCurrentState;
- (void)_updateLabels;
- (void)addTimerButtonTapped:(id)a3 forEvent:(id)a4;
- (void)dealloc;
- (void)handleContentSizeChange:(id)a3;
- (void)setAddTimerButton:(id)a3;
- (void)setCurrentConstraints:(id)a3;
- (void)setDateComponentsFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setStartStopButton:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupAxFonts;
- (void)setupConstraints;
- (void)setupFonts;
- (void)setupImage;
- (void)setupRegularFonts;
- (void)startStopButtonTapped:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTCCTimerBackgroundViewController

- (void)_updateLabels
{
  objc_msgSend_dateComponentsFormatter(self, a2, v2);
  id v84 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_timer(self, v6, v7);
  uint64_t v11 = objc_msgSend_state(v8, v9, v10);

  if (v11 == 1) {
    objc_msgSend_setUnitsStyle_(v84, v12, 3);
  }
  else {
    objc_msgSend_setUnitsStyle_(v84, v12, 0);
  }
  objc_msgSend_setZeroFormattingBehavior_(v84, v13, v11 == 1);
  v16 = objc_msgSend_timer(self, v14, v15);
  uint64_t v19 = objc_msgSend_state(v16, v17, v18);

  if (v19 == 3)
  {
    v23 = objc_msgSend_timer(self, v20, v21);
    v29 = objc_msgSend_fireDate(v23, v27, v28);
    objc_msgSend_timeIntervalSinceNow(v29, v30, v31);
    double v22 = v32;
  }
  else
  {
    if (v19 == 2)
    {
      v23 = objc_msgSend_timer(self, v20, v21);
      objc_msgSend_remainingTime(v23, v33, v34);
    }
    else
    {
      double v22 = 0.0;
      if (v19 != 1) {
        goto LABEL_12;
      }
      v23 = objc_msgSend_timer(self, v20, v21);
      objc_msgSend_duration(v23, v24, v25);
    }
    double v22 = v26;
  }

LABEL_12:
  v35 = objc_msgSend_timer(self, v20, v21);
  uint64_t v38 = objc_msgSend_state(v35, v36, v37);

  double v41 = round(v22);
  double v42 = fmax(v41, 1.0);
  double v43 = fmax(v41, 0.0);
  if (v38 == 2) {
    double v43 = v42;
  }
  v44 = objc_msgSend_stringFromTimeInterval_(v84, v39, v40, v43);
  v47 = objc_msgSend_timeLabel(self, v45, v46);
  objc_msgSend_setText_(v47, v48, (uint64_t)v44);

  if (v11 == 1)
  {
    v50 = (void *)MEMORY[0x263F086E0];
    uint64_t v51 = objc_opt_class();
    v53 = objc_msgSend_bundleForClass_(v50, v52, v51);
    v55 = objc_msgSend_localizedStringForKey_value_table_(v53, v54, @"SET_TIMER_FOR", &stru_26F4D28F8, @"TimerModule");
    v58 = objc_msgSend_titleLabel(self, v56, v57);
    objc_msgSend_setText_(v58, v59, (uint64_t)v55);

    goto LABEL_22;
  }
  objc_msgSend_setUnitsStyle_(v84, v49, 3);
  objc_msgSend_setZeroFormattingBehavior_(v84, v60, 1);
  v63 = objc_msgSend_timer(self, v61, v62);
  v68 = objc_msgSend_timerLabel(v63, v64, v65);
  if (v68)
  {
    v3 = objc_msgSend_timer(self, v66, v67);
    v4 = objc_msgSend_timerLabel(v3, v69, v70);
    if (objc_msgSend_length(v4, v71, v72))
    {
      v73 = objc_msgSend_timer(self, v66, v67);
      v53 = objc_msgSend_timerLabel(v73, v74, v75);

LABEL_20:
      goto LABEL_21;
    }
  }
  v76 = objc_msgSend_timer(self, v66, v67);
  objc_msgSend_duration(v76, v77, v78);
  v53 = objc_msgSend_stringFromTimeInterval_(v84, v79, v80);

  if (v68) {
    goto LABEL_20;
  }
LABEL_21:

  v55 = objc_msgSend_titleLabel(self, v81, v82);
  objc_msgSend_setText_(v55, v83, (uint64_t)v53);
LABEL_22:
}

- (MTCCTimerBackgroundViewController)init
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)MTCCTimerBackgroundViewController;
  uint64_t v2 = [(MTCCTimerBackgroundViewController *)&v9 init];
  if (v2)
  {
    v3 = MTLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v2;
      _os_log_impl(&dword_2406B2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized", buf, 0xCu);
    }

    uint64_t v4 = objc_opt_new();
    dateComponentsFormatter = v2->_dateComponentsFormatter;
    v2->_dateComponentsFormatter = (NSDateComponentsFormatter *)v4;

    objc_msgSend_setAllowedUnits_(v2->_dateComponentsFormatter, v6, 224);
    objc_msgSend_setUnitsStyle_(v2->_dateComponentsFormatter, v7, 3);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = self;
    _os_log_impl(&dword_2406B2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing", buf, 0xCu);
  }

  v6 = objc_msgSend_displayLink(self, v4, v5);
  objc_msgSend_invalidate(v6, v7, v8);

  v9.receiver = self;
  v9.super_class = (Class)MTCCTimerBackgroundViewController;
  [(MTCCTimerBackgroundViewController *)&v9 dealloc];
}

- (void)setTimer:(id)a3
{
  id v11 = a3;
  if ((objc_msgSend_isEqual_(self->_timer, v4, (uint64_t)v11) & 1) == 0)
  {
    uint64_t v7 = (MTCCTimer *)objc_msgSend_copy(v11, v5, v6);
    timer = self->_timer;
    self->_timer = v7;

    objc_msgSend__reloadForCurrentState(self, v9, v10);
  }
}

- (void)viewDidLoad
{
  v179.receiver = self;
  v179.super_class = (Class)MTCCTimerBackgroundViewController;
  [(MTCCTimerBackgroundViewController *)&v179 viewDidLoad];
  v3 = objc_opt_new();
  objc_msgSend_setCurrentConstraints_(self, v4, (uint64_t)v3);

  uint64_t v5 = objc_opt_new();
  objc_msgSend_setTitleLabel_(self, v6, (uint64_t)v5);

  objc_super v9 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v7, v8);
  uint64_t v12 = objc_msgSend_titleLabel(self, v10, v11);
  objc_msgSend_setTextColor_(v12, v13, (uint64_t)v9);

  v16 = objc_msgSend_titleLabel(self, v14, v15);
  objc_msgSend_setText_(v16, v17, @"Set timer for:");

  v20 = objc_msgSend_titleLabel(self, v18, v19);
  objc_msgSend_setAdjustsFontSizeToFitWidth_(v20, v21, 1);

  v24 = objc_msgSend_titleLabel(self, v22, v23);
  objc_msgSend_setTextAlignment_(v24, v25, 1);

  uint64_t v28 = objc_msgSend_titleLabel(self, v26, v27);
  objc_msgSend_controlCenterApplyPrimaryContentShadow(v28, v29, v30);

  v33 = objc_msgSend_titleLabel(self, v31, v32);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v33, v34, 0);

  uint64_t v37 = objc_msgSend_view(self, v35, v36);
  uint64_t v40 = objc_msgSend_titleLabel(self, v38, v39);
  objc_msgSend_addSubview_(v37, v41, (uint64_t)v40);

  double v42 = objc_opt_new();
  objc_msgSend_setTimeLabel_(self, v43, (uint64_t)v42);

  uint64_t v46 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v44, v45);
  v49 = objc_msgSend_timeLabel(self, v47, v48);
  objc_msgSend_setTextColor_(v49, v50, (uint64_t)v46);

  v53 = objc_msgSend_timeLabel(self, v51, v52);
  objc_msgSend_controlCenterApplyPrimaryContentShadow(v53, v54, v55);

  v58 = objc_msgSend_timeLabel(self, v56, v57);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v58, v59, 0);

  uint64_t v62 = objc_msgSend_timeLabel(self, v60, v61);
  objc_msgSend_setTextAlignment_(v62, v63, 1);

  v66 = objc_msgSend_view(self, v64, v65);
  v69 = objc_msgSend_timeLabel(self, v67, v68);
  objc_msgSend_addSubview_(v66, v70, (uint64_t)v69);

  v71 = objc_alloc_init(MTCCRoundButton);
  objc_msgSend_setStartStopButton_(self, v72, (uint64_t)v71);

  uint64_t v75 = objc_msgSend_startStopButton(self, v73, v74);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v75, v76, 0);

  v79 = objc_msgSend_startStopButton(self, v77, v78);
  objc_msgSend_addTarget_action_forControlEvents_(v79, v80, (uint64_t)self, sel_startStopButtonTapped_, 64);

  v83 = objc_msgSend_startStopButton(self, v81, v82);
  id v84 = objc_alloc(MEMORY[0x263F1C878]);
  v86 = objc_msgSend_initWithDelegate_(v84, v85, (uint64_t)self);
  objc_msgSend_addInteraction_(v83, v87, (uint64_t)v86);

  v90 = objc_msgSend_startStopButton(self, v88, v89);
  v93 = objc_msgSend_systemGreenColor(MEMORY[0x263F1C550], v91, v92);
  objc_msgSend_setBackgroundColor_forState_(v90, v94, (uint64_t)v93, 0);

  v97 = objc_msgSend_startStopButton(self, v95, v96);
  v100 = objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v98, v99, 0.0, 0.2);
  objc_msgSend_setBackgroundColor_forState_(v97, v101, (uint64_t)v100, 1);

  v104 = objc_msgSend_startStopButton(self, v102, v103);
  v107 = objc_msgSend_systemOrangeColor(MEMORY[0x263F1C550], v105, v106);
  objc_msgSend_setBackgroundColor_forState_(v104, v108, (uint64_t)v107, 4);

  v111 = objc_msgSend_view(self, v109, v110);
  v114 = objc_msgSend_startStopButton(self, v112, v113);
  objc_msgSend_addSubview_(v111, v115, (uint64_t)v114);

  v116 = objc_alloc_init(MTCCRoundButton);
  objc_msgSend_setAddTimerButton_(self, v117, (uint64_t)v116);

  v120 = objc_msgSend_addTimerButton(self, v118, v119);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v120, v121, 0);

  v124 = objc_msgSend_addTimerButton(self, v122, v123);
  objc_msgSend_addTarget_action_forControlEvents_(v124, v125, (uint64_t)self, sel_addTimerButtonTapped_forEvent_, 64);

  v128 = objc_msgSend_addTimerButton(self, v126, v127);
  id v129 = objc_alloc(MEMORY[0x263F1C878]);
  v131 = objc_msgSend_initWithDelegate_(v129, v130, (uint64_t)self);
  objc_msgSend_addInteraction_(v128, v132, (uint64_t)v131);

  v135 = objc_msgSend_addTimerButton(self, v133, v134);
  v138 = objc_msgSend_controlCenterDarkMaterial(MEMORY[0x263F33CA0], v136, v137);
  objc_msgSend_setBackgroundMaterialView_forState_(v135, v139, (uint64_t)v138, 0);

  v142 = objc_msgSend_addTimerButton(self, v140, v141);
  v145 = objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v143, v144, 0.0, 0.2);
  objc_msgSend_setBackgroundColor_forState_(v142, v146, (uint64_t)v145, 1);

  v148 = objc_msgSend_configurationWithPointSize_weight_(MEMORY[0x263F1C6C8], v147, 7, 17.0);
  v150 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v149, @"plus", v148);
  v153 = objc_msgSend_addTimerButton(self, v151, v152);
  objc_msgSend_setImage_(v153, v154, (uint64_t)v150);

  v157 = objc_msgSend_systemWhiteColor(MEMORY[0x263F1C550], v155, v156);
  v160 = objc_msgSend_addTimerButton(self, v158, v159);
  objc_msgSend_setTintColor_(v160, v161, (uint64_t)v157);

  v164 = objc_msgSend_view(self, v162, v163);
  v167 = objc_msgSend_addTimerButton(self, v165, v166);
  objc_msgSend_addSubview_(v164, v168, (uint64_t)v167);

  objc_msgSend_setupFonts(self, v169, v170);
  objc_msgSend_setupImage(self, v171, v172);
  objc_msgSend__reloadForCurrentState(self, v173, v174);
  v177 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v175, v176);
  objc_msgSend_addObserver_selector_name_object_(v177, v178, (uint64_t)self, sel_handleContentSizeChange_, *MEMORY[0x263F1D158], 0);
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)MTCCTimerBackgroundViewController;
  [(MTCCTimerBackgroundViewController *)&v5 viewWillLayoutSubviews];
  objc_msgSend_setupConstraints(self, v3, v4);
}

- (void)setupFonts
{
  uint64_t v4 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], a2, v2);
  objc_msgSend_preferredContentSizeCategory(v4, v5, v6);
  lhs = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(lhs, (UIContentSizeCategory)*MEMORY[0x263F1D140]) == NSOrderedDescending) {
    objc_msgSend_setupAxFonts(self, v7, v8);
  }
  else {
    objc_msgSend_setupRegularFonts(self, v7, v8);
  }
}

- (void)setupRegularFonts
{
  v3 = objc_msgSend_preferredFontForTextStyle_(MEMORY[0x263F1C658], a2, *MEMORY[0x263F1D260]);
  uint64_t v6 = objc_msgSend_titleLabel(self, v4, v5);
  objc_msgSend_setFont_(v6, v7, (uint64_t)v3);

  objc_msgSend_preferredFontForTextStyle_(MEMORY[0x263F1C658], v8, *MEMORY[0x263F1D2F8]);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v9 = (void *)MEMORY[0x263F1C658];
  objc_msgSend_pointSize(v19, v10, v11);
  v14 = objc_msgSend_monospacedDigitSystemFontOfSize_weight_(v9, v12, v13);
  v17 = objc_msgSend_timeLabel(self, v15, v16);
  objc_msgSend_setFont_(v17, v18, (uint64_t)v14);
}

- (void)setupImage
{
  uint64_t v4 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], a2, v2);
  objc_msgSend_preferredContentSizeCategory(v4, v5, v6);
  lhs = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(lhs, (UIContentSizeCategory)*MEMORY[0x263F1D140]) == NSOrderedDescending) {
    objc_msgSend_accessibilityCappedFontForStyle_(self, v7, *MEMORY[0x263F1D298]);
  }
  else {
  uint64_t v8 = objc_msgSend_preferredFontForTextStyle_(MEMORY[0x263F1C658], v7, *MEMORY[0x263F1D298]);
  }
  objc_msgSend_pointSize(v8, v9, v10);
  double v12 = v11;

  v14 = objc_msgSend_configurationWithPointSize_weight_(MEMORY[0x263F1C6C8], v13, 7, v12);
  v17 = objc_msgSend_addTimerButton(self, v15, v16);
  id v19 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v18, @"plus", v14);
  objc_msgSend_setImage_(v17, v20, (uint64_t)v19);
}

- (void)setupAxFonts
{
  v3 = objc_msgSend_accessibilityCappedFontForStyle_(self, a2, *MEMORY[0x263F1D260]);
  uint64_t v6 = objc_msgSend_titleLabel(self, v4, v5);
  objc_msgSend_setFont_(v6, v7, (uint64_t)v3);

  objc_msgSend_accessibilityCappedFontForStyle_(self, v8, *MEMORY[0x263F1D2F8]);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v9 = (void *)MEMORY[0x263F1C658];
  objc_msgSend_pointSize(v19, v10, v11);
  v14 = objc_msgSend_monospacedDigitSystemFontOfSize_weight_(v9, v12, v13);
  v17 = objc_msgSend_timeLabel(self, v15, v16);
  objc_msgSend_setFont_(v17, v18, (uint64_t)v14);
}

- (id)accessibilityCappedFontForStyle:(id)a3
{
  v3 = (void *)MEMORY[0x263F1CB00];
  uint64_t v4 = *MEMORY[0x263F1D140];
  id v5 = a3;
  uint64_t v7 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(v3, v6, v4);
  objc_super v9 = objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(MEMORY[0x263F1C658], v8, (uint64_t)v5, v7);

  return v9;
}

- (void)setupConstraints
{
  uint64_t v4 = objc_msgSend_currentConstraints(self, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x263F08938];
    uint64_t v11 = objc_msgSend_currentConstraints(self, v8, v9);
    objc_msgSend_deactivateConstraints_(v10, v12, (uint64_t)v11);

    uint64_t v15 = objc_msgSend_currentConstraints(self, v13, v14);
    objc_msgSend_removeAllObjects(v15, v16, v17);
  }
  uint64_t v18 = objc_msgSend_view(self, v8, v9);
  objc_msgSend_bounds(v18, v19, v20);
  double Width = CGRectGetWidth(v41);
  v24 = objc_msgSend_view(self, v22, v23);
  objc_msgSend_bounds(v24, v25, v26);
  double Height = CGRectGetHeight(v42);

  if (Width > Height) {
    objc_msgSend_landscapeConstraints(self, v28, v29);
  }
  else {
    objc_msgSend_portraitConstraints(self, v28, v29);
  }
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = objc_msgSend_mutableCopy(v39, v30, v31);
  objc_msgSend_setCurrentConstraints_(self, v33, (uint64_t)v32);

  uint64_t v34 = (void *)MEMORY[0x263F08938];
  uint64_t v37 = objc_msgSend_currentConstraints(self, v35, v36);
  objc_msgSend_activateConstraints_(v34, v38, (uint64_t)v37);
}

- (id)portraitConstraints
{
  v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  uint64_t v7 = objc_msgSend_view(self, v5, v6);
  objc_msgSend_addLayoutGuide_(v7, v8, (uint64_t)v4);

  uint64_t v11 = objc_msgSend_widthAnchor(v4, v9, v10);
  CCUISliderExpandedContentModuleWidth();
  uint64_t v14 = objc_msgSend_constraintEqualToConstant_(v11, v12, v13);
  objc_msgSend_addObject_(v3, v15, (uint64_t)v14);

  uint64_t v18 = objc_msgSend_heightAnchor(v4, v16, v17);
  CCUISliderExpandedContentModuleHeight();
  uint64_t v21 = objc_msgSend_constraintEqualToConstant_(v18, v19, v20);
  objc_msgSend_addObject_(v3, v22, (uint64_t)v21);

  uint64_t v25 = objc_msgSend_centerXAnchor(v4, v23, v24);
  uint64_t v28 = objc_msgSend_view(self, v26, v27);
  uint64_t v31 = objc_msgSend_layoutMarginsGuide(v28, v29, v30);
  uint64_t v34 = objc_msgSend_centerXAnchor(v31, v32, v33);
  uint64_t v36 = objc_msgSend_constraintEqualToAnchor_(v25, v35, (uint64_t)v34);
  objc_msgSend_addObject_(v3, v37, (uint64_t)v36);

  uint64_t v40 = objc_msgSend_centerYAnchor(v4, v38, v39);
  double v43 = objc_msgSend_view(self, v41, v42);
  uint64_t v46 = objc_msgSend_layoutMarginsGuide(v43, v44, v45);
  v49 = objc_msgSend_centerYAnchor(v46, v47, v48);
  uint64_t v51 = objc_msgSend_constraintEqualToAnchor_(v40, v50, (uint64_t)v49);
  objc_msgSend_addObject_(v3, v52, (uint64_t)v51);

  v53 = objc_opt_new();
  v56 = objc_msgSend_view(self, v54, v55);
  objc_msgSend_addLayoutGuide_(v56, v57, (uint64_t)v53);

  v60 = objc_msgSend_topAnchor(v53, v58, v59);
  v63 = objc_msgSend_view(self, v61, v62);
  v66 = objc_msgSend_layoutMarginsGuide(v63, v64, v65);
  v69 = objc_msgSend_topAnchor(v66, v67, v68);
  v71 = objc_msgSend_constraintEqualToAnchor_(v60, v70, (uint64_t)v69);
  objc_msgSend_addObject_(v3, v72, (uint64_t)v71);

  uint64_t v75 = objc_msgSend_bottomAnchor(v53, v73, v74);
  uint64_t v78 = objc_msgSend_topAnchor(v4, v76, v77);
  uint64_t v80 = objc_msgSend_constraintEqualToAnchor_(v75, v79, (uint64_t)v78);
  objc_msgSend_addObject_(v3, v81, (uint64_t)v80);

  id v84 = objc_msgSend_leadingAnchor(v53, v82, v83);
  v87 = objc_msgSend_view(self, v85, v86);
  v90 = objc_msgSend_layoutMarginsGuide(v87, v88, v89);
  v93 = objc_msgSend_leadingAnchor(v90, v91, v92);
  v95 = objc_msgSend_constraintEqualToAnchor_(v84, v94, (uint64_t)v93);
  objc_msgSend_addObject_(v3, v96, (uint64_t)v95);

  uint64_t v99 = objc_msgSend_trailingAnchor(v53, v97, v98);
  v102 = objc_msgSend_view(self, v100, v101);
  v105 = objc_msgSend_layoutMarginsGuide(v102, v103, v104);
  v108 = objc_msgSend_trailingAnchor(v105, v106, v107);
  uint64_t v110 = objc_msgSend_constraintEqualToAnchor_(v99, v109, (uint64_t)v108);
  objc_msgSend_addObject_(v3, v111, (uint64_t)v110);

  v112 = objc_opt_new();
  v115 = objc_msgSend_view(self, v113, v114);
  objc_msgSend_addLayoutGuide_(v115, v116, (uint64_t)v112);

  uint64_t v119 = objc_msgSend_leadingAnchor(v112, v117, v118);
  v122 = objc_msgSend_view(self, v120, v121);
  v125 = objc_msgSend_leadingAnchor(v122, v123, v124);
  uint64_t v127 = objc_msgSend_constraintEqualToAnchor_(v119, v126, (uint64_t)v125);
  objc_msgSend_addObject_(v3, v128, (uint64_t)v127);

  v131 = objc_msgSend_trailingAnchor(v112, v129, v130);
  uint64_t v134 = objc_msgSend_view(self, v132, v133);
  uint64_t v137 = objc_msgSend_trailingAnchor(v134, v135, v136);
  v139 = objc_msgSend_constraintEqualToAnchor_(v131, v138, (uint64_t)v137);
  objc_msgSend_addObject_(v3, v140, (uint64_t)v139);

  v143 = objc_msgSend_centerYAnchor(v112, v141, v142);
  v405 = v53;
  v146 = objc_msgSend_centerYAnchor(v53, v144, v145);
  v148 = objc_msgSend_constraintEqualToAnchor_(v143, v147, (uint64_t)v146);
  objc_msgSend_addObject_(v3, v149, (uint64_t)v148);

  uint64_t v152 = objc_msgSend_titleLabel(self, v150, v151);
  v155 = objc_msgSend_topAnchor(v152, v153, v154);
  v158 = objc_msgSend_topAnchor(v112, v156, v157);
  v160 = objc_msgSend_constraintEqualToAnchor_(v155, v159, (uint64_t)v158);
  objc_msgSend_addObject_(v3, v161, (uint64_t)v160);

  v164 = objc_msgSend_titleLabel(self, v162, v163);
  v167 = objc_msgSend_bottomAnchor(v164, v165, v166);
  uint64_t v170 = objc_msgSend_timeLabel(self, v168, v169);
  v173 = objc_msgSend_topAnchor(v170, v171, v172);
  v175 = objc_msgSend_constraintEqualToAnchor_(v167, v174, (uint64_t)v173);
  objc_msgSend_addObject_(v3, v176, (uint64_t)v175);

  objc_super v179 = objc_msgSend_timeLabel(self, v177, v178);
  v182 = objc_msgSend_bottomAnchor(v179, v180, v181);
  v185 = objc_msgSend_bottomAnchor(v112, v183, v184);
  v187 = objc_msgSend_constraintEqualToAnchor_(v182, v186, (uint64_t)v185);
  objc_msgSend_addObject_(v3, v188, (uint64_t)v187);

  v191 = objc_msgSend_titleLabel(self, v189, v190);
  v194 = objc_msgSend_centerXAnchor(v191, v192, v193);
  v197 = objc_msgSend_centerXAnchor(v112, v195, v196);
  v199 = objc_msgSend_constraintEqualToAnchor_(v194, v198, (uint64_t)v197);
  objc_msgSend_addObject_(v3, v200, (uint64_t)v199);

  v203 = objc_msgSend_timeLabel(self, v201, v202);
  v206 = objc_msgSend_centerXAnchor(v203, v204, v205);
  v209 = objc_msgSend_centerXAnchor(v112, v207, v208);
  v211 = objc_msgSend_constraintEqualToAnchor_(v206, v210, (uint64_t)v209);
  objc_msgSend_addObject_(v3, v212, (uint64_t)v211);

  v213 = objc_opt_new();
  v216 = objc_msgSend_view(self, v214, v215);
  objc_msgSend_addLayoutGuide_(v216, v217, (uint64_t)v213);

  v220 = objc_msgSend_topAnchor(v213, v218, v219);
  v406 = v4;
  v223 = objc_msgSend_bottomAnchor(v4, v221, v222);
  v225 = objc_msgSend_constraintEqualToAnchor_(v220, v224, (uint64_t)v223);
  objc_msgSend_addObject_(v3, v226, (uint64_t)v225);

  v229 = objc_msgSend_leadingAnchor(v213, v227, v228);
  v232 = objc_msgSend_view(self, v230, v231);
  v235 = objc_msgSend_layoutMarginsGuide(v232, v233, v234);
  v238 = objc_msgSend_leadingAnchor(v235, v236, v237);
  v240 = objc_msgSend_constraintEqualToAnchor_(v229, v239, (uint64_t)v238);
  objc_msgSend_addObject_(v3, v241, (uint64_t)v240);

  v244 = objc_msgSend_trailingAnchor(v213, v242, v243);
  v247 = objc_msgSend_view(self, v245, v246);
  v250 = objc_msgSend_layoutMarginsGuide(v247, v248, v249);
  v253 = objc_msgSend_trailingAnchor(v250, v251, v252);
  v255 = objc_msgSend_constraintEqualToAnchor_(v244, v254, (uint64_t)v253);
  objc_msgSend_addObject_(v3, v256, (uint64_t)v255);

  v259 = objc_msgSend_bottomAnchor(v213, v257, v258);
  v262 = objc_msgSend_view(self, v260, v261);
  v265 = objc_msgSend_layoutMarginsGuide(v262, v263, v264);
  v268 = objc_msgSend_bottomAnchor(v265, v266, v267);
  v270 = objc_msgSend_constraintEqualToAnchor_(v259, v269, (uint64_t)v268);
  objc_msgSend_addObject_(v3, v271, (uint64_t)v270);

  v274 = objc_msgSend_startStopButton(self, v272, v273);
  v277 = objc_msgSend_centerXAnchor(v274, v275, v276);
  v280 = objc_msgSend_centerXAnchor(v213, v278, v279);
  v282 = objc_msgSend_constraintEqualToAnchor_(v277, v281, (uint64_t)v280);
  objc_msgSend_addObject_(v3, v283, (uint64_t)v282);

  v286 = objc_msgSend_startStopButton(self, v284, v285);
  v289 = objc_msgSend_centerYAnchor(v286, v287, v288);
  v292 = objc_msgSend_centerYAnchor(v213, v290, v291);
  v294 = objc_msgSend_constraintEqualToAnchor_(v289, v293, (uint64_t)v292);
  objc_msgSend_addObject_(v3, v295, (uint64_t)v294);

  v296 = objc_opt_new();
  v299 = objc_msgSend_view(self, v297, v298);
  objc_msgSend_addLayoutGuide_(v299, v300, (uint64_t)v296);

  v303 = objc_msgSend_topAnchor(v296, v301, v302);
  v306 = objc_msgSend_topAnchor(v213, v304, v305);
  v308 = objc_msgSend_constraintEqualToAnchor_(v303, v307, (uint64_t)v306);
  objc_msgSend_addObject_(v3, v309, (uint64_t)v308);

  v312 = objc_msgSend_leadingAnchor(v296, v310, v311);
  v315 = objc_msgSend_startStopButton(self, v313, v314);
  v318 = objc_msgSend_trailingAnchor(v315, v316, v317);
  v320 = objc_msgSend_constraintEqualToAnchor_(v312, v319, (uint64_t)v318);
  objc_msgSend_addObject_(v3, v321, (uint64_t)v320);

  v324 = objc_msgSend_trailingAnchor(v296, v322, v323);
  v327 = objc_msgSend_view(self, v325, v326);
  v330 = objc_msgSend_layoutMarginsGuide(v327, v328, v329);
  v333 = objc_msgSend_trailingAnchor(v330, v331, v332);
  v335 = objc_msgSend_constraintEqualToAnchor_(v324, v334, (uint64_t)v333);
  objc_msgSend_addObject_(v3, v336, (uint64_t)v335);

  v339 = objc_msgSend_bottomAnchor(v296, v337, v338);
  v342 = objc_msgSend_bottomAnchor(v213, v340, v341);
  v344 = objc_msgSend_constraintEqualToAnchor_(v339, v343, (uint64_t)v342);
  objc_msgSend_addObject_(v3, v345, (uint64_t)v344);

  v348 = objc_msgSend_addTimerButton(self, v346, v347);
  v351 = objc_msgSend_centerXAnchor(v348, v349, v350);
  v354 = objc_msgSend_centerXAnchor(v296, v352, v353);
  v356 = objc_msgSend_constraintEqualToAnchor_(v351, v355, (uint64_t)v354);
  objc_msgSend_addObject_(v3, v357, (uint64_t)v356);

  v360 = objc_msgSend_addTimerButton(self, v358, v359);
  v363 = objc_msgSend_centerYAnchor(v360, v361, v362);
  v366 = objc_msgSend_centerYAnchor(v296, v364, v365);
  v368 = objc_msgSend_constraintEqualToAnchor_(v363, v367, (uint64_t)v366);
  objc_msgSend_addObject_(v3, v369, (uint64_t)v368);

  v372 = objc_msgSend_traitCollection(self, v370, v371);
  objc_msgSend_preferredContentSizeCategory(v372, v373, v374);
  v375 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v366) = UIContentSizeCategoryIsAccessibilityCategory(v375);

  if (v366)
  {
    v378 = objc_msgSend_startStopButton(self, v376, v377);
    v381 = objc_msgSend_widthAnchor(v378, v379, v380);
    CCUISliderExpandedContentModuleWidth();
    objc_msgSend_constraintEqualToConstant_(v381, v382, v383, v384);
  }
  else
  {
    v385 = objc_msgSend_addTimerButton(self, v376, v377);
    v388 = objc_msgSend_widthAnchor(v385, v386, v387);
    v391 = objc_msgSend_constraintEqualToConstant_(v388, v389, v390, 50.0);
    objc_msgSend_addObject_(v3, v392, (uint64_t)v391);

    v378 = objc_msgSend_addTimerButton(self, v393, v394);
    v381 = objc_msgSend_heightAnchor(v378, v395, v396);
    objc_msgSend_constraintEqualToConstant_(v381, v397, v398, 50.0);
  v399 = };
  objc_msgSend_addObject_(v3, v400, (uint64_t)v399);

  v403 = objc_msgSend_copy(v3, v401, v402);

  return v403;
}

- (id)landscapeConstraints
{
  v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  uint64_t v7 = objc_msgSend_view(self, v5, v6);
  objc_msgSend_addLayoutGuide_(v7, v8, (uint64_t)v4);

  uint64_t v11 = objc_msgSend_widthAnchor(v4, v9, v10);
  CCUISliderExpandedContentModuleWidth();
  uint64_t v14 = objc_msgSend_constraintEqualToConstant_(v11, v12, v13);
  objc_msgSend_addObject_(v3, v15, (uint64_t)v14);

  uint64_t v18 = objc_msgSend_heightAnchor(v4, v16, v17);
  CCUISliderExpandedContentModuleHeight();
  uint64_t v21 = objc_msgSend_constraintEqualToConstant_(v18, v19, v20);
  objc_msgSend_addObject_(v3, v22, (uint64_t)v21);

  uint64_t v25 = objc_msgSend_centerXAnchor(v4, v23, v24);
  uint64_t v28 = objc_msgSend_view(self, v26, v27);
  uint64_t v31 = objc_msgSend_layoutMarginsGuide(v28, v29, v30);
  uint64_t v34 = objc_msgSend_centerXAnchor(v31, v32, v33);
  uint64_t v36 = objc_msgSend_constraintEqualToAnchor_(v25, v35, (uint64_t)v34);
  objc_msgSend_addObject_(v3, v37, (uint64_t)v36);

  uint64_t v40 = objc_msgSend_centerYAnchor(v4, v38, v39);
  double v43 = objc_msgSend_view(self, v41, v42);
  uint64_t v46 = objc_msgSend_layoutMarginsGuide(v43, v44, v45);
  v49 = objc_msgSend_centerYAnchor(v46, v47, v48);
  uint64_t v51 = objc_msgSend_constraintEqualToAnchor_(v40, v50, (uint64_t)v49);
  objc_msgSend_addObject_(v3, v52, (uint64_t)v51);

  v53 = objc_opt_new();
  v56 = objc_msgSend_view(self, v54, v55);
  objc_msgSend_addLayoutGuide_(v56, v57, (uint64_t)v53);

  v60 = objc_msgSend_topAnchor(v53, v58, v59);
  v63 = objc_msgSend_view(self, v61, v62);
  v66 = objc_msgSend_layoutMarginsGuide(v63, v64, v65);
  v69 = objc_msgSend_topAnchor(v66, v67, v68);
  v71 = objc_msgSend_constraintEqualToAnchor_(v60, v70, (uint64_t)v69);
  objc_msgSend_addObject_(v3, v72, (uint64_t)v71);

  uint64_t v75 = objc_msgSend_bottomAnchor(v53, v73, v74);
  uint64_t v78 = objc_msgSend_view(self, v76, v77);
  v81 = objc_msgSend_layoutMarginsGuide(v78, v79, v80);
  id v84 = objc_msgSend_bottomAnchor(v81, v82, v83);
  uint64_t v86 = objc_msgSend_constraintEqualToAnchor_(v75, v85, (uint64_t)v84);
  objc_msgSend_addObject_(v3, v87, (uint64_t)v86);

  v90 = objc_msgSend_leadingAnchor(v53, v88, v89);
  v93 = objc_msgSend_view(self, v91, v92);
  uint64_t v96 = objc_msgSend_layoutMarginsGuide(v93, v94, v95);
  uint64_t v99 = objc_msgSend_leadingAnchor(v96, v97, v98);
  uint64_t v101 = objc_msgSend_constraintEqualToAnchor_(v90, v100, (uint64_t)v99);
  objc_msgSend_addObject_(v3, v102, (uint64_t)v101);

  v105 = objc_msgSend_trailingAnchor(v53, v103, v104);
  v108 = objc_msgSend_leadingAnchor(v4, v106, v107);
  uint64_t v110 = objc_msgSend_constraintEqualToAnchor_(v105, v109, (uint64_t)v108);
  objc_msgSend_addObject_(v3, v111, (uint64_t)v110);

  v112 = objc_opt_new();
  v115 = objc_msgSend_view(self, v113, v114);
  objc_msgSend_addLayoutGuide_(v115, v116, (uint64_t)v112);

  uint64_t v119 = objc_msgSend_leadingAnchor(v112, v117, v118);
  v122 = objc_msgSend_leadingAnchor(v53, v120, v121);
  uint64_t v124 = objc_msgSend_constraintEqualToAnchor_(v119, v123, (uint64_t)v122);
  objc_msgSend_addObject_(v3, v125, (uint64_t)v124);

  v128 = objc_msgSend_trailingAnchor(v112, v126, v127);
  v131 = objc_msgSend_trailingAnchor(v53, v129, v130);
  uint64_t v133 = objc_msgSend_constraintEqualToAnchor_(v128, v132, (uint64_t)v131);
  objc_msgSend_addObject_(v3, v134, (uint64_t)v133);

  uint64_t v137 = objc_msgSend_centerYAnchor(v112, v135, v136);
  v429 = v53;
  v140 = objc_msgSend_centerYAnchor(v53, v138, v139);
  uint64_t v142 = objc_msgSend_constraintEqualToAnchor_(v137, v141, (uint64_t)v140);
  objc_msgSend_addObject_(v3, v143, (uint64_t)v142);

  v146 = objc_msgSend_titleLabel(self, v144, v145);
  v149 = objc_msgSend_topAnchor(v146, v147, v148);
  uint64_t v152 = objc_msgSend_topAnchor(v112, v150, v151);
  uint64_t v154 = objc_msgSend_constraintEqualToAnchor_(v149, v153, (uint64_t)v152);
  objc_msgSend_addObject_(v3, v155, (uint64_t)v154);

  v158 = objc_msgSend_titleLabel(self, v156, v157);
  v161 = objc_msgSend_bottomAnchor(v158, v159, v160);
  v164 = objc_msgSend_timeLabel(self, v162, v163);
  v167 = objc_msgSend_topAnchor(v164, v165, v166);
  uint64_t v169 = objc_msgSend_constraintEqualToAnchor_(v161, v168, (uint64_t)v167);
  objc_msgSend_addObject_(v3, v170, (uint64_t)v169);

  v173 = objc_msgSend_timeLabel(self, v171, v172);
  uint64_t v176 = objc_msgSend_bottomAnchor(v173, v174, v175);
  objc_super v179 = objc_msgSend_bottomAnchor(v112, v177, v178);
  uint64_t v181 = objc_msgSend_constraintEqualToAnchor_(v176, v180, (uint64_t)v179);
  objc_msgSend_addObject_(v3, v182, (uint64_t)v181);

  v185 = objc_msgSend_titleLabel(self, v183, v184);
  v188 = objc_msgSend_centerXAnchor(v185, v186, v187);
  v191 = objc_msgSend_centerXAnchor(v112, v189, v190);
  uint64_t v193 = objc_msgSend_constraintEqualToAnchor_(v188, v192, (uint64_t)v191);
  objc_msgSend_addObject_(v3, v194, (uint64_t)v193);

  v197 = objc_msgSend_timeLabel(self, v195, v196);
  v200 = objc_msgSend_centerXAnchor(v197, v198, v199);
  v203 = objc_msgSend_centerXAnchor(v112, v201, v202);
  uint64_t v205 = objc_msgSend_constraintEqualToAnchor_(v200, v204, (uint64_t)v203);
  objc_msgSend_addObject_(v3, v206, (uint64_t)v205);

  v207 = objc_opt_new();
  v210 = objc_msgSend_view(self, v208, v209);
  objc_msgSend_addLayoutGuide_(v210, v211, (uint64_t)v207);

  v214 = objc_msgSend_leadingAnchor(v207, v212, v213);
  v430 = v4;
  v217 = objc_msgSend_trailingAnchor(v4, v215, v216);
  uint64_t v219 = objc_msgSend_constraintEqualToAnchor_(v214, v218, (uint64_t)v217);
  objc_msgSend_addObject_(v3, v220, (uint64_t)v219);

  v223 = objc_msgSend_trailingAnchor(v207, v221, v222);
  v226 = objc_msgSend_view(self, v224, v225);
  v229 = objc_msgSend_layoutMarginsGuide(v226, v227, v228);
  v232 = objc_msgSend_trailingAnchor(v229, v230, v231);
  uint64_t v234 = objc_msgSend_constraintEqualToAnchor_(v223, v233, (uint64_t)v232);
  objc_msgSend_addObject_(v3, v235, (uint64_t)v234);

  v238 = objc_msgSend_topAnchor(v207, v236, v237);
  v241 = objc_msgSend_view(self, v239, v240);
  v244 = objc_msgSend_layoutMarginsGuide(v241, v242, v243);
  v247 = objc_msgSend_topAnchor(v244, v245, v246);
  uint64_t v249 = objc_msgSend_constraintEqualToAnchor_(v238, v248, (uint64_t)v247);
  objc_msgSend_addObject_(v3, v250, (uint64_t)v249);

  v253 = objc_msgSend_bottomAnchor(v207, v251, v252);
  v256 = objc_msgSend_view(self, v254, v255);
  v259 = objc_msgSend_layoutMarginsGuide(v256, v257, v258);
  v262 = objc_msgSend_bottomAnchor(v259, v260, v261);
  uint64_t v264 = objc_msgSend_constraintEqualToAnchor_(v253, v263, (uint64_t)v262);
  objc_msgSend_addObject_(v3, v265, (uint64_t)v264);

  v268 = objc_msgSend_startStopButton(self, v266, v267);
  v271 = objc_msgSend_centerXAnchor(v268, v269, v270);
  v274 = objc_msgSend_centerXAnchor(v207, v272, v273);
  uint64_t v276 = objc_msgSend_constraintEqualToAnchor_(v271, v275, (uint64_t)v274);
  objc_msgSend_addObject_(v3, v277, (uint64_t)v276);

  v280 = objc_msgSend_startStopButton(self, v278, v279);
  v283 = objc_msgSend_centerYAnchor(v280, v281, v282);
  v286 = objc_msgSend_centerYAnchor(v207, v284, v285);
  uint64_t v288 = objc_msgSend_constraintEqualToAnchor_(v283, v287, (uint64_t)v286);
  objc_msgSend_addObject_(v3, v289, (uint64_t)v288);

  v290 = objc_opt_new();
  v293 = objc_msgSend_view(self, v291, v292);
  objc_msgSend_addLayoutGuide_(v293, v294, (uint64_t)v290);

  v297 = objc_msgSend_topAnchor(v290, v295, v296);
  v300 = objc_msgSend_topAnchor(v207, v298, v299);
  uint64_t v302 = objc_msgSend_constraintEqualToAnchor_(v297, v301, (uint64_t)v300);
  objc_msgSend_addObject_(v3, v303, (uint64_t)v302);

  v306 = objc_msgSend_leadingAnchor(v290, v304, v305);
  v309 = objc_msgSend_startStopButton(self, v307, v308);
  v312 = objc_msgSend_trailingAnchor(v309, v310, v311);
  uint64_t v314 = objc_msgSend_constraintEqualToAnchor_(v306, v313, (uint64_t)v312);
  objc_msgSend_addObject_(v3, v315, (uint64_t)v314);

  v318 = objc_msgSend_trailingAnchor(v290, v316, v317);
  v321 = objc_msgSend_view(self, v319, v320);
  v324 = objc_msgSend_layoutMarginsGuide(v321, v322, v323);
  v327 = objc_msgSend_trailingAnchor(v324, v325, v326);
  uint64_t v329 = objc_msgSend_constraintEqualToAnchor_(v318, v328, (uint64_t)v327);
  objc_msgSend_addObject_(v3, v330, (uint64_t)v329);

  v333 = objc_msgSend_bottomAnchor(v290, v331, v332);
  v336 = objc_msgSend_bottomAnchor(v207, v334, v335);
  uint64_t v338 = objc_msgSend_constraintEqualToAnchor_(v333, v337, (uint64_t)v336);
  objc_msgSend_addObject_(v3, v339, (uint64_t)v338);

  v342 = objc_msgSend_addTimerButton(self, v340, v341);
  v345 = objc_msgSend_centerXAnchor(v342, v343, v344);
  v348 = objc_msgSend_centerXAnchor(v290, v346, v347);
  uint64_t v350 = objc_msgSend_constraintEqualToAnchor_(v345, v349, (uint64_t)v348);
  objc_msgSend_addObject_(v3, v351, (uint64_t)v350);

  v354 = objc_msgSend_addTimerButton(self, v352, v353);
  v357 = objc_msgSend_centerYAnchor(v354, v355, v356);
  v360 = objc_msgSend_centerYAnchor(v290, v358, v359);
  uint64_t v362 = objc_msgSend_constraintEqualToAnchor_(v357, v361, (uint64_t)v360);
  objc_msgSend_addObject_(v3, v363, (uint64_t)v362);

  v366 = objc_msgSend_traitCollection(self, v364, v365);
  objc_msgSend_preferredContentSizeCategory(v366, v367, v368);
  v369 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v360) = UIContentSizeCategoryIsAccessibilityCategory(v369);

  if (v360)
  {
    v372 = objc_msgSend_startStopButton(self, v370, v371);
    v375 = objc_msgSend_widthAnchor(v372, v373, v374);
    CCUISliderExpandedContentModuleWidth();
    v378 = objc_msgSend_constraintEqualToConstant_(v375, v376, v377);
    objc_msgSend_addObject_(v3, v379, (uint64_t)v378);

    v382 = objc_msgSend_trailingAnchor(v207, v380, v381);
    v385 = objc_msgSend_view(self, v383, v384);
    v388 = objc_msgSend_layoutMarginsGuide(v385, v386, v387);
    v391 = objc_msgSend_trailingAnchor(v388, v389, v390);
    v393 = objc_msgSend_constraintEqualToAnchor_constant_(v382, v392, (uint64_t)v391, -50.0);
    objc_msgSend_addObject_(v3, v394, (uint64_t)v393);
  }
  else
  {
    v395 = objc_msgSend_trailingAnchor(v207, v370, v371);
    uint64_t v398 = objc_msgSend_view(self, v396, v397);
    v401 = objc_msgSend_layoutMarginsGuide(v398, v399, v400);
    v404 = objc_msgSend_trailingAnchor(v401, v402, v403);
    v406 = objc_msgSend_constraintEqualToAnchor_(v395, v405, (uint64_t)v404);
    objc_msgSend_addObject_(v3, v407, (uint64_t)v406);

    v410 = objc_msgSend_addTimerButton(self, v408, v409);
    v413 = objc_msgSend_widthAnchor(v410, v411, v412);
    v416 = objc_msgSend_constraintEqualToConstant_(v413, v414, v415, 50.0);
    objc_msgSend_addObject_(v3, v417, (uint64_t)v416);

    v382 = objc_msgSend_addTimerButton(self, v418, v419);
    v385 = objc_msgSend_heightAnchor(v382, v420, v421);
    v388 = objc_msgSend_constraintEqualToConstant_(v385, v422, v423, 50.0);
    objc_msgSend_addObject_(v3, v424, (uint64_t)v388);
  }

  v427 = objc_msgSend_copy(v3, v425, v426);

  return v427;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MTCCTimerBackgroundViewController;
  -[MTCCTimerBackgroundViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  objc_msgSend_setupConstraints(self, v5, v6);
  uint64_t v9 = objc_msgSend_view(self, v7, v8);
  objc_msgSend_setNeedsLayout(v9, v10, v11);
}

- (void)handleContentSizeChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    uint64_t v17 = self;
    _os_log_impl(&dword_2406B2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ handling content size chaged", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_setupFonts(self, v5, v6);
  objc_msgSend_setupImage(self, v7, v8);
  objc_msgSend_setupConstraints(self, v9, v10);
  uint64_t v13 = objc_msgSend_view(self, v11, v12);
  objc_msgSend_setNeedsLayout(v13, v14, v15);
}

- (void)startStopButtonTapped:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_msgSend_timer(self, v5, v6);
    int v45 = 138543618;
    uint64_t v46 = self;
    __int16 v47 = 2050;
    uint64_t v48 = objc_msgSend_state(v7, v8, v9);
    _os_log_impl(&dword_2406B2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ button tapped, current state:%{public}lu", (uint8_t *)&v45, 0x16u);
  }
  uint64_t v12 = objc_msgSend_timer(self, v10, v11);
  uint64_t v15 = objc_msgSend_fireDate(v12, v13, v14);

  uint64_t v18 = objc_msgSend_timer(self, v16, v17);
  uint64_t v21 = objc_msgSend_state(v18, v19, v20);

  if ((unint64_t)(v21 - 1) >= 2)
  {
    if (v21 == 3) {
      uint64_t v31 = 2;
    }
    else {
      uint64_t v31 = 0;
    }
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x263EFF910];
    uint64_t v25 = objc_msgSend_timer(self, v22, v23);
    objc_msgSend_remainingTime(v25, v26, v27);
    uint64_t v30 = objc_msgSend_dateWithTimeIntervalSinceNow_(v24, v28, v29);

    uint64_t v31 = 3;
    uint64_t v15 = (void *)v30;
  }
  uint64_t v32 = objc_msgSend_timer(self, v22, v23);
  objc_msgSend_setState_(v32, v33, v31);

  uint64_t v36 = objc_msgSend_timer(self, v34, v35);
  objc_msgSend_setFireDate_(v36, v37, (uint64_t)v15);

  uint64_t v40 = objc_msgSend_delegate(self, v38, v39);
  double v43 = objc_msgSend_timer(self, v41, v42);
  objc_msgSend_timerBackgroundViewController_timerDidChange_(v40, v44, (uint64_t)self, v43);
}

- (void)addTimerButtonTapped:(id)a3 forEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend_timer(self, v7, v8);
    int v16 = 138543618;
    uint64_t v17 = self;
    __int16 v18 = 2050;
    uint64_t v19 = objc_msgSend_state(v9, v10, v11);
    _os_log_impl(&dword_2406B2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ add button tapped, current state:%{public}lu", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v14 = objc_msgSend_delegate(self, v12, v13);
  objc_msgSend_timerBackgroundViewControllerAddButtonTapped_withEvent_(v14, v15, (uint64_t)self, v5);
}

- (void)_reloadForCurrentState
{
  uint64_t v4 = objc_msgSend_timer(self, a2, v2);
  uint64_t v7 = objc_msgSend_state(v4, v5, v6);

  switch(v7)
  {
    case 3:
      uint64_t v33 = (void *)MEMORY[0x263F086E0];
      uint64_t v34 = objc_opt_class();
      uint64_t v36 = objc_msgSend_bundleForClass_(v33, v35, v34);
      objc_msgSend_localizedStringForKey_value_table_(v36, v37, @"PAUSE", &stru_26F4D28F8, @"TimerModule");
      id v86 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v24 = objc_msgSend_addTimerButton(self, v38, v39);
      objc_msgSend_setHidden_(v24, v40, 0);
      uint64_t v32 = 1;
LABEL_7:
      BOOL v21 = 1;
      goto LABEL_8;
    case 2:
      CGRect v41 = (void *)MEMORY[0x263F086E0];
      uint64_t v42 = objc_opt_class();
      v44 = objc_msgSend_bundleForClass_(v41, v43, v42);
      objc_msgSend_localizedStringForKey_value_table_(v44, v45, @"RESUME", &stru_26F4D28F8, @"TimerModule");
      id v86 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v24 = objc_msgSend_addTimerButton(self, v46, v47);
      objc_msgSend_setHidden_(v24, v48, 0);
      uint64_t v32 = 0;
      goto LABEL_7;
    case 1:
      uint64_t v10 = (void *)MEMORY[0x263F086E0];
      uint64_t v11 = objc_opt_class();
      uint64_t v13 = objc_msgSend_bundleForClass_(v10, v12, v11);
      objc_msgSend_localizedStringForKey_value_table_(v13, v14, @"START", &stru_26F4D28F8, @"TimerModule");
      id v86 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v17 = objc_msgSend_timer(self, v15, v16);
      objc_msgSend_duration(v17, v18, v19);
      BOOL v21 = v20 > 0.0;

      uint64_t v24 = objc_msgSend_timer(self, v22, v23);
      uint64_t v27 = objc_msgSend_editingTimer(v24, v25, v26);
      uint64_t v30 = objc_msgSend_addTimerButton(self, v28, v29);
      objc_msgSend_setHidden_(v30, v31, v27 == 0);

      uint64_t v32 = 0;
LABEL_8:

      goto LABEL_10;
  }
  id v86 = 0;
  uint64_t v32 = 0;
  BOOL v21 = 1;
LABEL_10:
  uint64_t v49 = objc_msgSend_startStopButton(self, v8, v9);
  objc_msgSend_setTitle_(v49, v50, (uint64_t)v86);

  v53 = objc_msgSend_startStopButton(self, v51, v52);
  objc_msgSend_setSelected_(v53, v54, v32);

  uint64_t v57 = objc_msgSend_startStopButton(self, v55, v56);
  objc_msgSend_setEnabled_(v57, v58, v21);

  objc_msgSend__updateLabels(self, v59, v60);
  v63 = objc_msgSend_displayLink(self, v61, v62);
  objc_msgSend_invalidate(v63, v64, v65);

  uint64_t v68 = objc_msgSend_timer(self, v66, v67);
  uint64_t v71 = objc_msgSend_state(v68, v69, v70);

  if (v71 == 3)
  {
    v73 = objc_msgSend_displayLinkWithTarget_selector_(MEMORY[0x263F15780], v72, (uint64_t)self, sel_displayLinkTick_);
    objc_msgSend_setDisplayLink_(self, v74, (uint64_t)v73);

    uint64_t v77 = objc_msgSend_displayLink(self, v75, v76);
    objc_msgSend_setPreferredFramesPerSecond_(v77, v78, 4);

    v81 = objc_msgSend_displayLink(self, v79, v80);
    id v84 = objc_msgSend_mainRunLoop(MEMORY[0x263EFF9F0], v82, v83);
    objc_msgSend_addToRunLoop_forMode_(v81, v85, (uint64_t)v84, *MEMORY[0x263EFF588]);
  }
  else
  {
    objc_msgSend_setDisplayLink_(self, v72, 0);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc(MEMORY[0x263F1CA80]);
  uint64_t v8 = objc_msgSend_startStopButton(self, v6, v7);
  uint64_t v11 = objc_msgSend_containerView(v8, v9, v10);
  uint64_t v13 = objc_msgSend_initWithView_(v5, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_effectWithPreview_(MEMORY[0x263F1C880], v14, (uint64_t)v13);
  uint64_t v17 = objc_msgSend_styleWithEffect_shape_(MEMORY[0x263F1C890], v16, (uint64_t)v15, 0);

  return v17;
}

- (MTCCTimerBackgroundViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTCCTimerBackgroundViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTCCTimer)timer
{
  return self->_timer;
}

- (MTCCRoundButton)startStopButton
{
  return self->_startStopButton;
}

- (void)setStartStopButton:(id)a3
{
}

- (MTCCRoundButton)addTimerButton
{
  return self->_addTimerButton;
}

- (void)setAddTimerButton:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (NSMutableArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
}

- (NSDateComponentsFormatter)dateComponentsFormatter
{
  return self->_dateComponentsFormatter;
}

- (void)setDateComponentsFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponentsFormatter, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_addTimerButton, 0);
  objc_storeStrong((id *)&self->_startStopButton, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end