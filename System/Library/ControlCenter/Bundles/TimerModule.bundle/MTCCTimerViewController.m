@interface MTCCTimerViewController
- (BOOL)_canShowWhileLocked;
- (CADisplayLink)displayLink;
- (MTCCTimer)internalTimer;
- (MTCCTimer)timer;
- (MTCCTimerViewController)init;
- (MTCCTimerViewControllerDelegate)delegate;
- (double)sliderValueFromRemainingTime:(double)a3;
- (id)createSliderView;
- (id)sliderView;
- (void)_reloadForCurrentStateAnimated:(BOOL)a3;
- (void)_updateGlyphPackageDescription;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)dealloc;
- (void)displayLinkTick:(id)a3;
- (void)setContentRenderingMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setInternalTimer:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimer:(id)a3 animated:(BOOL)a4;
- (void)sliderDidBeginEditing:(id)a3;
- (void)sliderEditingEnded:(id)a3;
- (void)sliderValueChanged:(id)a3;
- (void)startDisplayLinkUpdates;
- (void)stopDisplayLinkUpdates;
- (void)viewDidLoad;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation MTCCTimerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTCCTimerViewController)init
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)MTCCTimerViewController;
  v2 = [(MTCCTimerViewController *)&v5 init];
  if (v2)
  {
    v3 = MTLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v2;
      _os_log_impl(&dword_2406B2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized", buf, 0xCu);
    }
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
    v11 = self;
    _os_log_impl(&dword_2406B2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocating", buf, 0xCu);
  }

  v6 = objc_msgSend_displayLink(self, v4, v5);
  objc_msgSend_invalidate(v6, v7, v8);

  v9.receiver = self;
  v9.super_class = (Class)MTCCTimerViewController;
  [(MTCCTimerViewController *)&v9 dealloc];
}

- (MTCCTimer)timer
{
  return self->_internalTimer;
}

- (void)setTimer:(id)a3
{
}

- (void)setTimer:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if ((objc_msgSend_isEqual_(self->_internalTimer, v6, (uint64_t)v12) & 1) == 0)
  {
    objc_super v9 = (MTCCTimer *)objc_msgSend_copy(v12, v7, v8);
    internalTimer = self->_internalTimer;
    self->_internalTimer = v9;

    objc_msgSend__reloadForCurrentStateAnimated_(self, v11, v4);
  }
}

- (void)viewDidLoad
{
  v36[1] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)MTCCTimerViewController;
  [(CCUISliderButtonModuleViewController *)&v35 viewDidLoad];
  v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  uint64_t v8 = objc_msgSend_localizedStringForKey_value_table_(v6, v7, @"TIMER", &stru_26F4D28F8, @"TimerModule");
  objc_msgSend_setTitle_(self, v9, (uint64_t)v8);

  objc_msgSend_setValueText_(self, v10, 0);
  objc_msgSend_setSelectedValueText_(self, v11, 0);
  objc_msgSend__updateGlyphPackageDescription(self, v12, v13);
  v36[0] = objc_opt_class();
  v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)v36, 1);
  id v17 = (id)objc_msgSend_registerForTraitChanges_withAction_(self, v16, (uint64_t)v15, sel__updateGlyphPackageDescription);

  v20 = objc_msgSend_sliderView(self, v18, v19);
  objc_msgSend_setNumberOfSteps_(v20, v21, 12);

  v24 = objc_msgSend_sliderView(self, v22, v23);
  objc_msgSend_addTarget_action_forControlEvents_(v24, v25, (uint64_t)self, sel_sliderDidBeginEditing_, 0x10000);

  v28 = objc_msgSend_sliderView(self, v26, v27);
  objc_msgSend_addTarget_action_forControlEvents_(v28, v29, (uint64_t)self, sel_sliderValueChanged_, 4096);

  v32 = objc_msgSend_sliderView(self, v30, v31);
  objc_msgSend_addTarget_action_forControlEvents_(v32, v33, (uint64_t)self, sel_sliderEditingEnded_, 0x40000);

  objc_msgSend__reloadForCurrentStateAnimated_(self, v34, 0);
}

- (id)sliderView
{
  v4.receiver = self;
  v4.super_class = (Class)MTCCTimerViewController;
  v2 = [(CCUISliderButtonModuleViewController *)&v4 sliderView];

  return v2;
}

- (id)createSliderView
{
  id v3 = objc_alloc(MEMORY[0x263F33CE0]);
  v6 = objc_msgSend_view(self, v4, v5);
  objc_msgSend_bounds(v6, v7, v8);
  v11 = objc_msgSend_initWithFrame_(v3, v9, v10);

  return v11;
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTCCTimerViewController;
  if ([(CCUIButtonModuleViewController *)&v7 contentRenderingMode] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)MTCCTimerViewController;
    [(CCUIButtonModuleViewController *)&v6 setContentRenderingMode:a3];
    objc_msgSend__reloadForCurrentStateAnimated_(self, v5, 0);
  }
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_super v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = self;
    _os_log_impl(&dword_2406B2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ button tapped, relaying to delegate", (uint8_t *)&v11, 0xCu);
  }

  objc_super v9 = objc_msgSend_delegate(self, v7, v8);
  objc_msgSend_timerViewControllerButtonTapped_withEvent_(v9, v10, (uint64_t)self, v5);
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTCCTimerViewController;
  -[CCUISliderButtonModuleViewController willTransitionToExpandedContentMode:](&v9, sel_willTransitionToExpandedContentMode_);
  objc_super v7 = objc_msgSend_delegate(self, v5, v6);
  objc_msgSend_timerViewController_didExpand_(v7, v8, (uint64_t)self, v3);
}

- (void)sliderDidBeginEditing:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  objc_super v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138543362;
    v34 = self;
    _os_log_impl(&dword_2406B2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ slider began editing", (uint8_t *)&v33, 0xCu);
  }

  objc_msgSend_stopDisplayLinkUpdates(self, v5, v6);
  objc_super v9 = objc_msgSend_timer(self, v7, v8);
  id v12 = objc_msgSend_timerID(v9, v10, v11);

  if (v12)
  {
    uint64_t v13 = [MTCCTimer alloc];
    v16 = objc_msgSend_timer(self, v14, v15);
    objc_msgSend_remainingTime(v16, v17, v18);
    v20 = objc_msgSend_initWithState_duration_(v13, v19, 1);

    uint64_t v23 = objc_msgSend_timer(self, v21, v22);
    v26 = objc_msgSend_timerLabel(v23, v24, v25);
    objc_msgSend_setTimerLabel_(v20, v27, (uint64_t)v26);

    v30 = objc_msgSend_timer(self, v28, v29);
    objc_msgSend_setEditingTimer_(v20, v31, (uint64_t)v30);

    objc_msgSend_setTimer_(self, v32, (uint64_t)v20);
  }
}

- (void)sliderEditingEnded:(id)a3
{
  objc_super v4 = objc_msgSend_timer(self, a2, (uint64_t)a3);
  objc_super v7 = objc_msgSend_editingTimer(v4, v5, v6);

  if (v7)
  {
    uint64_t v10 = objc_msgSend_timer(self, v8, v9);
    objc_msgSend_setState_(v10, v11, 3);

    objc_msgSend_delegate(self, v12, v13);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_timer(self, v14, v15);
    objc_msgSend_timerViewController_timerDidChange_(v18, v17, (uint64_t)self, v16);
  }
}

- (void)sliderValueChanged:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v4 = objc_msgSend_step(a3, a2, (uint64_t)a3);
  unint64_t v5 = v4;
  if (v4 >= 0xD) {
    NSLog(&cfstr_UnexpectedStep.isa, v4);
  }
  if (v5 >= 0xC) {
    uint64_t v6 = 12;
  }
  else {
    uint64_t v6 = v5;
  }
  objc_super v7 = MTLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = self;
    __int16 v28 = 2050;
    uint64_t v29 = v6;
    _os_log_impl(&dword_2406B2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ slider value changed to step: %{public}lu", buf, 0x16u);
  }

  double v8 = (double)qword_2406BBB98[v6] * 60.0;
  uint64_t v11 = objc_msgSend_timer(self, v9, v10);
  objc_msgSend_setDuration_(v11, v12, v13, v8);

  v16 = objc_msgSend_timer(self, v14, v15);
  objc_msgSend_setRemainingTime_(v16, v17, v18, v8);

  v21 = objc_msgSend_delegate(self, v19, v20);
  v24 = objc_msgSend_timer(self, v22, v23);
  objc_msgSend_timerViewController_timerDidChange_(v21, v25, (uint64_t)self, v24);
}

- (void)_updateGlyphPackageDescription
{
  unint64_t v4 = objc_msgSend_traitCollection(self, a2, v2);
  uint64_t v7 = objc_msgSend_accessibilityContrast(v4, v5, v6);
  double v8 = @"Timer";
  if (v7 == 1) {
    double v8 = @"Timer_IC";
  }
  uint64_t v9 = v8;

  uint64_t v10 = (void *)MEMORY[0x263F33C68];
  uint64_t v11 = (void *)MEMORY[0x263F086E0];
  uint64_t v12 = objc_opt_class();
  objc_msgSend_bundleForClass_(v11, v13, v12);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend_descriptionForPackageNamed_inBundle_(v10, v14, (uint64_t)v9, v17);

  objc_msgSend_setGlyphPackageDescription_(self, v16, (uint64_t)v15);
}

- (void)_reloadForCurrentStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = objc_msgSend_timer(self, a2, a3);
  uint64_t v8 = objc_msgSend_state(v5, v6, v7);

  switch(v8)
  {
    case 3:
      uint64_t v11 = objc_msgSend_timer(self, v9, v10);
      id v17 = objc_msgSend_fireDate(v11, v15, v16);
      objc_msgSend_timeIntervalSinceNow(v17, v18, v19);
      uint64_t v21 = v20;

      uint64_t v22 = 1;
LABEL_8:

      goto LABEL_10;
    case 2:
      uint64_t v11 = objc_msgSend_timer(self, v9, v10);
      objc_msgSend_remainingTime(v11, v23, v24);
      goto LABEL_7;
    case 1:
      uint64_t v11 = objc_msgSend_timer(self, v9, v10);
      objc_msgSend_duration(v11, v12, v13);
LABEL_7:
      uint64_t v21 = v14;
      uint64_t v22 = 0;
      goto LABEL_8;
  }
  uint64_t v22 = 0;
  uint64_t v21 = 0;
LABEL_10:
  objc_msgSend_setSelected_(self, v9, v22);
  int v27 = objc_msgSend_appearsSelected(self, v25, v26);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_2406BAC70;
  v35[3] = &unk_2650CFC48;
  v35[4] = self;
  v35[5] = v21;
  BOOL v36 = v3;
  char v37 = v27;
  uint64_t v28 = MEMORY[0x2455F4C20](v35);
  uint64_t v30 = (void *)v28;
  if (v3) {
    objc_msgSend_animateWithDuration_animations_(MEMORY[0x263F1CB60], v29, v28, 0.25);
  }
  else {
    (*(void (**)(uint64_t))(v28 + 16))(v28);
  }
  objc_msgSend_stopDisplayLinkUpdates(self, v31, v32);
  if (v27) {
    objc_msgSend_startDisplayLinkUpdates(self, v33, v34);
  }
}

- (void)startDisplayLinkUpdates
{
  BOOL v3 = objc_msgSend_displayLinkWithTarget_selector_(MEMORY[0x263F15780], a2, (uint64_t)self, sel_displayLinkTick_);
  objc_msgSend_setDisplayLink_(self, v4, (uint64_t)v3);

  uint64_t v7 = objc_msgSend_displayLink(self, v5, v6);
  objc_msgSend_setPreferredFramesPerSecond_(v7, v8, 4);

  objc_msgSend_displayLink(self, v9, v10);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_mainRunLoop(MEMORY[0x263EFF9F0], v11, v12);
  objc_msgSend_addToRunLoop_forMode_(v15, v14, (uint64_t)v13, *MEMORY[0x263EFF588]);
}

- (void)stopDisplayLinkUpdates
{
  unint64_t v4 = objc_msgSend_displayLink(self, a2, v2);
  objc_msgSend_invalidate(v4, v5, v6);

  objc_msgSend_setDisplayLink_(self, v7, 0);
}

- (void)displayLinkTick:(id)a3
{
  unint64_t v4 = objc_msgSend_timer(self, a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_fireDate(v4, v5, v6);
  objc_msgSend_timeIntervalSinceNow(v7, v8, v9);
  double v11 = v10;

  objc_msgSend_sliderView(self, v12, v13);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sliderValueFromRemainingTime_(self, v14, v15, v11);
  *(float *)&double v16 = v16;
  objc_msgSend_setValue_animated_(v18, v17, 0, v16);
}

- (double)sliderValueFromRemainingTime:(double)a3
{
  unint64_t v3 = 0;
  double v4 = round(a3);
  while ((double)qword_2406BBB98[v3] * 60.0 < v4)
  {
    if (++v3 == 13) {
      goto LABEL_6;
    }
  }
  if (!v3) {
    return 0.0;
  }
LABEL_6:
  if (v3 >= 0xC) {
    unint64_t v3 = 12;
  }
  unint64_t v5 = v3 - 1;
  float64x2_t v6 = vmulq_f64(vcvtq_f64_u64(*(uint64x2_t *)&qword_2406BBB98[v5]), (float64x2_t)vdupq_n_s64(0x404E000000000000uLL));
  return ((v4 - v6.f64[0]) / vsubq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1), v6).f64[0] + (double)v5) / 12.0;
}

- (MTCCTimerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTCCTimerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTCCTimer)internalTimer
{
  return self->_internalTimer;
}

- (void)setInternalTimer:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_internalTimer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end