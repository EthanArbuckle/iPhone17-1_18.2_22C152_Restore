@interface HUTimerTableViewCell
+ (id)_stringForDuration:(double)a3;
- (COTimerManager)timerManager;
- (HUTimerCancelButtonView)cancelButtonView;
- (HUTimerCountdownView)timerCountdownView;
- (HUTimerTableViewCell)initWithMobileTimerObject:(id)a3 manager:(id)a4 roomName:(id)a5;
- (HUTimerTableViewCell)initWithTimer:(id)a3 manager:(id)a4;
- (MTTimer)timer;
- (NSString)roomName;
- (UILabel)timerNameLabel;
- (UILabel)timerTimeLabel;
- (UILayoutGuide)buttonGuide;
- (UIStackView)stackView;
- (double)previousRemainingTime;
- (id)_alarmBackgroundColor;
- (void)_createConstraints;
- (void)_createSubviews;
- (void)cancelTimer;
- (void)layoutSubviews;
- (void)setButtonGuide:(id)a3;
- (void)setCancelButtonView:(id)a3;
- (void)setPreviousRemainingTime:(double)a3;
- (void)setRoomName:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerCountdownView:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setTimerNameLabel:(id)a3;
- (void)setTimerTimeLabel:(id)a3;
- (void)toggleTimer;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTimerInfo;
@end

@implementation HUTimerTableViewCell

- (HUTimerTableViewCell)initWithTimer:(id)a3 manager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUTimerTableViewCell;
  v9 = [(HUTimerTableViewCell *)&v17 initWithStyle:0 reuseIdentifier:@"kHUTimerCellReuseIdentifier"];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timer, a3);
    objc_storeStrong((id *)&v10->_timerManager, a4);
    [v7 remainingTime];
    v10->_previousRemainingTime = v11;
    [(HUTimerTableViewCell *)v10 setSelectionStyle:0];
    [(HUTimerTableViewCell *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      v12 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
      [(HUTimerTableViewCell *)v10 setBackgroundView:v12];

      v13 = [(HUTimerTableViewCell *)v10 backgroundView];
      v14 = [v13 layer];
      [v14 setCornerRadius:8.0];
    }
    v15 = [(HUTimerTableViewCell *)v10 _alarmBackgroundColor];
    [(HUTimerTableViewCell *)v10 setBackgroundColor:v15];

    [(HUTimerTableViewCell *)v10 _createSubviews];
    [(HUTimerTableViewCell *)v10 _createConstraints];
  }

  return v10;
}

- (HUTimerTableViewCell)initWithMobileTimerObject:(id)a3 manager:(id)a4 roomName:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v11 timer];

  if (!v12)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"HUTimerTableViewCell.m" lineNumber:86 description:@"HUMobileTimerObject must wrap a timer"];
  }
  [(HUTimerTableViewCell *)self setRoomName:v9];
  v13 = [v11 timer];

  v14 = [(HUTimerTableViewCell *)self initWithTimer:v13 manager:v10];
  return v14;
}

+ (id)_stringForDuration:(double)a3
{
  if (qword_1EA12DF28 != -1) {
    dispatch_once(&qword_1EA12DF28, &__block_literal_global_4);
  }
  if (a3 >= 3600.0) {
    uint64_t v4 = 224;
  }
  else {
    uint64_t v4 = 192;
  }
  [(id)_MergedGlobals_3 setAllowedUnits:v4];
  v5 = (void *)_MergedGlobals_3;

  return (id)[v5 stringFromTimeInterval:a3];
}

uint64_t __43__HUTimerTableViewCell__stringForDuration___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

  [(id)_MergedGlobals_3 setUnitsStyle:0];
  v2 = (void *)_MergedGlobals_3;

  return [v2 setZeroFormattingBehavior:0x10000];
}

- (void)_createSubviews
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42B48]);
  [(HUTimerTableViewCell *)self setButtonGuide:v3];

  uint64_t v4 = [(HUTimerTableViewCell *)self contentView];
  v5 = [(HUTimerTableViewCell *)self buttonGuide];
  [v4 addLayoutGuide:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [(HUTimerTableViewCell *)self setTimerNameLabel:v6];

  id v7 = [(HUTimerTableViewCell *)self timer];
  id v8 = [v7 title];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUTimerLabelNoName", @"HUTimerLabelNoName", 1);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = v10;

  v12 = [(HUTimerTableViewCell *)self roomName];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    v14 = [(HUTimerTableViewCell *)self roomName];
    v21 = HULocalizedStringWithFormat(@"HUAlarmTextLabelAdditionalInfoFormat", @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    uint64_t v22 = [v11 stringByAppendingString:v21];

    id v11 = (void *)v22;
  }
  v23 = [(HUTimerTableViewCell *)self timerNameLabel];
  [v23 setText:v11];

  v24 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43890] variant:1024];
  v25 = [(HUTimerTableViewCell *)self timerNameLabel];
  [v25 setFont:v24];

  v26 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v27 = [(HUTimerTableViewCell *)self timerNameLabel];
  [v27 setTextColor:v26];

  id v28 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [(HUTimerTableViewCell *)self setTimerTimeLabel:v28];

  v29 = [(HUTimerTableViewCell *)self timerTimeLabel];
  v30 = [(HUTimerTableViewCell *)self timer];
  [v30 remainingTime];
  v31 = +[HUTimerTableViewCell _stringForDuration:](HUTimerTableViewCell, "_stringForDuration:");
  [v29 setText:v31];

  v32 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F438E8] variant:1024];
  v33 = (void *)MEMORY[0x1E4F6A420];
  v34 = [v32 fontDescriptor];
  v35 = [v33 fontDescriptorWithMonospacedDigitsForFontDescriptor:v34];

  v36 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v35 size:0.0];
  v37 = [(HUTimerTableViewCell *)self timerTimeLabel];
  [v37 setFont:v36];

  v38 = [MEMORY[0x1E4F428B8] labelColor];
  v39 = [(HUTimerTableViewCell *)self timerTimeLabel];
  [v39 setTextColor:v38];

  id v40 = objc_alloc(MEMORY[0x1E4F42E20]);
  v41 = [(HUTimerTableViewCell *)self timerNameLabel];
  v66[0] = v41;
  v42 = [(HUTimerTableViewCell *)self timerTimeLabel];
  v66[1] = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  v44 = (void *)[v40 initWithArrangedSubviews:v43];
  [(HUTimerTableViewCell *)self setStackView:v44];

  v45 = [(HUTimerTableViewCell *)self stackView];
  [v45 setAxis:1];

  v46 = [(HUTimerTableViewCell *)self stackView];
  [v46 setAlignment:1];

  v47 = [(HUTimerTableViewCell *)self stackView];
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];

  v48 = [(HUTimerTableViewCell *)self contentView];
  v49 = [(HUTimerTableViewCell *)self stackView];
  [v48 addSubview:v49];

  v50 = [[HUTimerCancelButtonView alloc] initWithDelegate:self];
  [(HUTimerTableViewCell *)self setCancelButtonView:v50];

  v51 = [(HUTimerTableViewCell *)self cancelButtonView];
  [v51 setTranslatesAutoresizingMaskIntoConstraints:0];

  v52 = [(HUTimerTableViewCell *)self contentView];
  v53 = [(HUTimerTableViewCell *)self cancelButtonView];
  [v52 addSubview:v53];

  v54 = [HUTimerCountdownView alloc];
  v55 = [(HUTimerTableViewCell *)self timer];
  [v55 remainingTime];
  double v57 = v56;
  v58 = [(HUTimerTableViewCell *)self timer];
  uint64_t v59 = [v58 state];
  v60 = [(HUTimerTableViewCell *)self timer];
  [v60 duration];
  v62 = [(HUTimerCountdownView *)v54 initWithRemainingTime:v59 state:self duration:v57 delegate:v61];
  [(HUTimerTableViewCell *)self setTimerCountdownView:v62];

  v63 = [(HUTimerTableViewCell *)self timerCountdownView];
  [v63 setTranslatesAutoresizingMaskIntoConstraints:0];

  v64 = [(HUTimerTableViewCell *)self contentView];
  v65 = [(HUTimerTableViewCell *)self timerCountdownView];
  [v64 addSubview:v65];
}

- (void)_createConstraints
{
  id v84 = (id)objc_opt_new();
  id v3 = [(HUTimerTableViewCell *)self buttonGuide];
  uint64_t v4 = [v3 topAnchor];
  v5 = [(HUTimerTableViewCell *)self contentView];
  id v6 = [v5 topAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6 constant:20.0];
  [v84 addObject:v7];

  id v8 = [(HUTimerTableViewCell *)self buttonGuide];
  id v9 = [v8 bottomAnchor];
  id v10 = [(HUTimerTableViewCell *)self contentView];
  id v11 = [v10 bottomAnchor];
  v12 = [v9 constraintEqualToAnchor:v11 constant:-20.0];
  [v84 addObject:v12];

  uint64_t v13 = [(HUTimerTableViewCell *)self buttonGuide];
  v14 = [v13 trailingAnchor];
  uint64_t v15 = [(HUTimerTableViewCell *)self contentView];
  uint64_t v16 = [v15 trailingAnchor];
  uint64_t v17 = [v14 constraintEqualToAnchor:v16 constant:-20.0];
  [v84 addObject:v17];

  uint64_t v18 = [(HUTimerTableViewCell *)self stackView];
  uint64_t v19 = [v18 topAnchor];
  uint64_t v20 = [(HUTimerTableViewCell *)self contentView];
  v21 = [v20 topAnchor];
  uint64_t v22 = [v19 constraintEqualToAnchor:v21 constant:20.0];
  [v84 addObject:v22];

  v23 = [(HUTimerTableViewCell *)self stackView];
  v24 = [v23 bottomAnchor];
  v25 = [(HUTimerTableViewCell *)self contentView];
  v26 = [v25 bottomAnchor];
  v27 = [v24 constraintEqualToAnchor:v26 constant:-20.0];
  [v84 addObject:v27];

  id v28 = [(HUTimerTableViewCell *)self stackView];
  v29 = [v28 leadingAnchor];
  v30 = [(HUTimerTableViewCell *)self contentView];
  v31 = [v30 leadingAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:20.0];
  [v84 addObject:v32];

  v33 = [(HUTimerTableViewCell *)self stackView];
  v34 = [v33 trailingAnchor];
  v35 = [(HUTimerTableViewCell *)self timerCountdownView];
  v36 = [v35 leadingAnchor];
  v37 = [v34 constraintEqualToAnchor:v36 constant:-20.0];
  [v84 addObject:v37];

  v38 = [(HUTimerTableViewCell *)self cancelButtonView];
  v39 = [v38 topAnchor];
  id v40 = [(HUTimerTableViewCell *)self buttonGuide];
  v41 = [v40 topAnchor];
  v42 = [v39 constraintGreaterThanOrEqualToAnchor:v41];
  [v84 addObject:v42];

  v43 = [(HUTimerTableViewCell *)self cancelButtonView];
  v44 = [v43 centerYAnchor];
  v45 = [(HUTimerTableViewCell *)self buttonGuide];
  v46 = [v45 centerYAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  [v84 addObject:v47];

  v48 = [(HUTimerTableViewCell *)self cancelButtonView];
  v49 = [v48 bottomAnchor];
  v50 = [(HUTimerTableViewCell *)self buttonGuide];
  v51 = [v50 bottomAnchor];
  v52 = [v49 constraintLessThanOrEqualToAnchor:v51];
  [v84 addObject:v52];

  v53 = [(HUTimerTableViewCell *)self cancelButtonView];
  v54 = [v53 heightAnchor];
  v55 = [v54 constraintEqualToConstant:48.0];
  [v84 addObject:v55];

  double v56 = [(HUTimerTableViewCell *)self cancelButtonView];
  double v57 = [v56 widthAnchor];
  v58 = [(HUTimerTableViewCell *)self cancelButtonView];
  uint64_t v59 = [v58 heightAnchor];
  v60 = [v57 constraintEqualToAnchor:v59];
  [v84 addObject:v60];

  double v61 = [(HUTimerTableViewCell *)self cancelButtonView];
  v62 = [v61 trailingAnchor];
  v63 = [(HUTimerTableViewCell *)self contentView];
  v64 = [v63 trailingAnchor];
  v65 = [v62 constraintEqualToAnchor:v64 constant:-20.0];
  [v84 addObject:v65];

  v66 = [(HUTimerTableViewCell *)self timerCountdownView];
  v67 = [v66 centerYAnchor];
  v68 = [(HUTimerTableViewCell *)self buttonGuide];
  v69 = [v68 centerYAnchor];
  v70 = [v67 constraintEqualToAnchor:v69];
  [v84 addObject:v70];

  v71 = [(HUTimerTableViewCell *)self timerCountdownView];
  v72 = [v71 heightAnchor];
  v73 = [v72 constraintEqualToConstant:48.0];
  [v84 addObject:v73];

  v74 = [(HUTimerTableViewCell *)self timerCountdownView];
  v75 = [v74 widthAnchor];
  v76 = [(HUTimerTableViewCell *)self cancelButtonView];
  v77 = [v76 heightAnchor];
  v78 = [v75 constraintEqualToAnchor:v77];
  [v84 addObject:v78];

  v79 = [(HUTimerTableViewCell *)self timerCountdownView];
  v80 = [v79 trailingAnchor];
  v81 = [(HUTimerTableViewCell *)self cancelButtonView];
  v82 = [v81 leadingAnchor];
  v83 = [v80 constraintEqualToAnchor:v82 constant:-10.0];
  [v84 addObject:v83];

  [MEMORY[0x1E4F28DC8] activateConstraints:v84];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [(HUTimerTableViewCell *)self _alarmBackgroundColor];
  [(HUTimerTableViewCell *)self setBackgroundColor:v4];
}

- (id)_alarmBackgroundColor
{
  if ([MEMORY[0x1E4F69758] isAMac]) {
    [(HUTimerTableViewCell *)self backgroundColor];
  }
  else {
  id v3 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_homePodControlCellBackgroundColor");
  }

  return v3;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)HUTimerTableViewCell;
  [(HUTimerTableViewCell *)&v6 layoutSubviews];
  id v3 = [(HUTimerTableViewCell *)self _alarmBackgroundColor];
  [(HUTimerTableViewCell *)self setBackgroundColor:v3];

  id v4 = [(HUTimerTableViewCell *)self layer];
  [v4 setCornerRadius:8.0];

  v5 = [(HUTimerTableViewCell *)self layer];
  [v5 setMasksToBounds:1];
}

- (void)updateTimerInfo
{
  [(HUTimerTableViewCell *)self previousRemainingTime];
  double v4 = v3;
  v5 = [(HUTimerTableViewCell *)self timer];
  [v5 remainingTime];
  double v7 = v6;

  if (v4 != v7)
  {
    id v8 = [(HUTimerTableViewCell *)self timer];
    [v8 remainingTime];
    -[HUTimerTableViewCell setPreviousRemainingTime:](self, "setPreviousRemainingTime:");

    id v9 = [(HUTimerTableViewCell *)self timerTimeLabel];
    id v10 = [(HUTimerTableViewCell *)self timer];
    [v10 remainingTime];
    id v11 = +[HUTimerTableViewCell _stringForDuration:](HUTimerTableViewCell, "_stringForDuration:");
    [v9 setText:v11];

    v12 = [(HUTimerTableViewCell *)self timerCountdownView];
    uint64_t v13 = [(HUTimerTableViewCell *)self timer];
    [v13 remainingTime];
    objc_msgSend(v12, "updateToNewTime:");
  }
  id v15 = [(HUTimerTableViewCell *)self timerCountdownView];
  v14 = [(HUTimerTableViewCell *)self timer];
  objc_msgSend(v15, "updateToNewState:", objc_msgSend(v14, "state"));
}

- (void)toggleTimer
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = [(HUTimerTableViewCell *)self timer];
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = self;
    __int16 v20 = 2080;
    v21 = "-[HUTimerTableViewCell toggleTimer]";
    __int16 v22 = 2048;
    uint64_t v23 = [v4 state];
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s toggling timer (current state = %lu)", buf, 0x20u);
  }
  v5 = [(HUTimerTableViewCell *)self timer];
  uint64_t v6 = [v5 state];

  if (v6 == 3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 3;
  }
  id v8 = [(HUTimerTableViewCell *)self timer];
  id v9 = [v8 timerByUpdatingWithState:v7];

  id v10 = [(HUTimerTableViewCell *)self timerManager];
  id v11 = [v10 updateTimer:v9];
  v12 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  uint64_t v13 = [v11 reschedule:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__HUTimerTableViewCell_toggleTimer__block_invoke;
  v16[3] = &unk_1E63852A8;
  v16[4] = self;
  id v17 = v9;
  id v14 = v9;
  id v15 = (id)[v13 addCompletionBlock:v16];
}

uint64_t __35__HUTimerTableViewCell_toggleTimer__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setTimer:*(void *)(a1 + 40)];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(void **)(a1 + 32);
    double v4 = [v3 timer];
    int v6 = 138412802;
    uint64_t v7 = v3;
    __int16 v8 = 2080;
    id v9 = "-[HUTimerTableViewCell toggleTimer]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = [v4 state];
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@:%s timer toggled (new state = %lu)", (uint8_t *)&v6, 0x20u);
  }
  return [*(id *)(a1 + 32) updateTimerInfo];
}

- (void)cancelTimer
{
  id v5 = [(HUTimerTableViewCell *)self timerManager];
  double v3 = [(HUTimerTableViewCell *)self timer];
  id v4 = (id)[v5 removeTimer:v3];
}

- (MTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (COTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (UILabel)timerNameLabel
{
  return self->_timerNameLabel;
}

- (void)setTimerNameLabel:(id)a3
{
}

- (UILabel)timerTimeLabel
{
  return self->_timerTimeLabel;
}

- (void)setTimerTimeLabel:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILayoutGuide)buttonGuide
{
  return self->_buttonGuide;
}

- (void)setButtonGuide:(id)a3
{
}

- (HUTimerCountdownView)timerCountdownView
{
  return self->_timerCountdownView;
}

- (void)setTimerCountdownView:(id)a3
{
}

- (HUTimerCancelButtonView)cancelButtonView
{
  return self->_cancelButtonView;
}

- (void)setCancelButtonView:(id)a3
{
}

- (double)previousRemainingTime
{
  return self->_previousRemainingTime;
}

- (void)setPreviousRemainingTime:(double)a3
{
  self->_previousRemainingTime = a3;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_cancelButtonView, 0);
  objc_storeStrong((id *)&self->_timerCountdownView, 0);
  objc_storeStrong((id *)&self->_buttonGuide, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_timerTimeLabel, 0);
  objc_storeStrong((id *)&self->_timerNameLabel, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end