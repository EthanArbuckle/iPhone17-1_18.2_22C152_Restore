@interface HUAlarmTableViewCell
+ (id)timeFormatter;
- (BOOL)enabled;
- (BOOL)isDisabled;
- (HUAlarmTableViewCell)init;
- (HUAlarmTableViewCell)initWithMobileTimerObject:(id)a3 roomName:(id)a4;
- (HUAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUAlarmTableViewCellDelegate)delegate;
- (MTAlarm)alarm;
- (NSCalendar)calendar;
- (NSDate)baseDate;
- (UILabel)nameAndDescriptionLabel;
- (UILabel)timeLabel;
- (UIStackView)labelsStackView;
- (UISwitch)enabledSwitch;
- (id)_alarmBackgroundColor;
- (void)_alarmActiveChanged:(id)a3;
- (void)_createSubviews;
- (void)_setTimeLabelToHour:(int64_t)a3 minute:(int64_t)a4;
- (void)_setupConstraints;
- (void)layoutSubviews;
- (void)refreshUI:(id)a3 roomName:(id)a4 animated:(BOOL)a5;
- (void)setAlarm:(id)a3;
- (void)setBaseDate:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabledSwitch:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLabelsStackView:(id)a3;
- (void)setNameAndDescriptionLabel:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setTimeLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation HUAlarmTableViewCell

- (HUAlarmTableViewCell)initWithMobileTimerObject:(id)a3 roomName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 alarm];

  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HUAlarmTableViewCell.m" lineNumber:70 description:@"HUMobileTimerObject must wrap an alarm"];
  }
  v10 = [(HUAlarmTableViewCell *)self init];
  if (v10)
  {
    uint64_t v11 = [v7 alarm];
    alarm = v10->_alarm;
    v10->_alarm = (MTAlarm *)v11;

    v13 = [v7 alarm];
    [(HUAlarmTableViewCell *)v10 refreshUI:v13 roomName:v8 animated:1];
  }
  return v10;
}

+ (id)timeFormatter
{
  if (qword_1EBA46940 != -1) {
    dispatch_once(&qword_1EBA46940, &__block_literal_global_196);
  }
  v2 = (void *)_MergedGlobals_1_5;

  return v2;
}

void __37__HUAlarmTableViewCell_timeFormatter__block_invoke()
{
  id v2 = objc_alloc(MEMORY[0x1E4F69160]);
  uint64_t v0 = [v2 timeFormatter];
  v1 = (void *)_MergedGlobals_1_5;
  _MergedGlobals_1_5 = v0;
}

- (HUAlarmTableViewCell)init
{
  return [(HUAlarmTableViewCell *)self initWithStyle:0 reuseIdentifier:@"kHUAlarmTableViewCellReuseIdentifier"];
}

- (HUAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)HUAlarmTableViewCell;
  v4 = [(HUAlarmTableViewCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      v5 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
      [(HUAlarmTableViewCell *)v4 setBackgroundView:v5];

      v6 = [(HUAlarmTableViewCell *)v4 backgroundView];
      id v7 = [v6 layer];
      [v7 setCornerRadius:8.0];
    }
    [(HUAlarmTableViewCell *)v4 setAccessoryType:1];
    id v8 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v9 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.forward"];
    v10 = (void *)[v8 initWithImage:v9];
    [(HUAlarmTableViewCell *)v4 setEditingAccessoryView:v10];

    uint64_t v11 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    calendar = v4->_calendar;
    v4->_calendar = (NSCalendar *)v11;

    v13 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [(NSCalendar *)v4->_calendar setTimeZone:v13];

    uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
    baseDate = v4->_baseDate;
    v4->_baseDate = (NSDate *)v14;

    [(HUAlarmTableViewCell *)v4 _createSubviews];
    v16 = v4;
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [(HUAlarmTableViewCell *)self _alarmBackgroundColor];
  [(HUAlarmTableViewCell *)self setBackgroundColor:v4];
}

- (id)_alarmBackgroundColor
{
  if ([MEMORY[0x1E4F69758] isAMac]) {
    [(HUAlarmTableViewCell *)self backgroundColor];
  }
  else {
  v3 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_homePodControlCellBackgroundColor");
  }

  return v3;
}

- (void)_createSubviews
{
  v38[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(HUAlarmTableViewCell *)self setEnabledSwitch:v3];

  id v4 = [MEMORY[0x1E4F428B8] systemGreenColor];
  v5 = [(HUAlarmTableViewCell *)self enabledSwitch];
  [v5 setOnTintColor:v4];

  v6 = [(HUAlarmTableViewCell *)self enabledSwitch];
  [v6 addTarget:self action:sel__alarmActiveChanged_ forControlEvents:4096];

  id v7 = [(HUAlarmTableViewCell *)self enabledSwitch];
  [v7 sizeToFit];

  id v8 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [(HUAlarmTableViewCell *)self setNameAndDescriptionLabel:v8];

  v9 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43890] variant:1024];
  v10 = [(HUAlarmTableViewCell *)self nameAndDescriptionLabel];
  [v10 setFont:v9];

  uint64_t v11 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v12 = [(HUAlarmTableViewCell *)self nameAndDescriptionLabel];
  [v12 setTextColor:v11];

  v13 = [(HUAlarmTableViewCell *)self nameAndDescriptionLabel];
  [v13 setNumberOfLines:0];

  id v14 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [(HUAlarmTableViewCell *)self setTimeLabel:v14];

  v15 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F438E8] variant:1024];
  v16 = (void *)MEMORY[0x1E4F6A420];
  v17 = [v15 fontDescriptor];
  objc_super v18 = [v16 fontDescriptorWithMonospacedDigitsForFontDescriptor:v17];

  v19 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v18 size:0.0];
  v20 = [(HUAlarmTableViewCell *)self timeLabel];
  [v20 setFont:v19];

  v21 = [MEMORY[0x1E4F428B8] labelColor];
  v22 = [(HUAlarmTableViewCell *)self timeLabel];
  [v22 setTextColor:v21];

  id v23 = objc_alloc(MEMORY[0x1E4F42E20]);
  v24 = [(HUAlarmTableViewCell *)self timeLabel];
  v38[0] = v24;
  v25 = [(HUAlarmTableViewCell *)self nameAndDescriptionLabel];
  v38[1] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v27 = (void *)[v23 initWithArrangedSubviews:v26];
  [(HUAlarmTableViewCell *)self setLabelsStackView:v27];

  v28 = [(HUAlarmTableViewCell *)self labelsStackView];
  [v28 setAxis:1];

  v29 = [(HUAlarmTableViewCell *)self labelsStackView];
  [v29 setAlignment:1];

  v30 = [(HUAlarmTableViewCell *)self labelsStackView];
  [v30 setDistribution:4];

  v31 = [(HUAlarmTableViewCell *)self labelsStackView];
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

  v32 = [(HUAlarmTableViewCell *)self contentView];
  v33 = [(HUAlarmTableViewCell *)self labelsStackView];
  [v32 addSubview:v33];

  v34 = [(HUAlarmTableViewCell *)self _alarmBackgroundColor];
  [(HUAlarmTableViewCell *)self setBackgroundColor:v34];

  v35 = [(HUAlarmTableViewCell *)self enabledSwitch];
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

  v36 = [(HUAlarmTableViewCell *)self contentView];
  v37 = [(HUAlarmTableViewCell *)self enabledSwitch];
  [v36 addSubview:v37];

  [(HUAlarmTableViewCell *)self _setupConstraints];
}

- (void)refreshUI:(id)a3 roomName:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  self->_enabled = [v9 isEnabled];
  [v9 repeatSchedule];
  v10 = DetailDateMaskToString();
  -[HUAlarmTableViewCell _setTimeLabelToHour:minute:](self, "_setTimeLabelToHour:minute:", [v9 hour], objc_msgSend(v9, "minute"));
  uint64_t v11 = [v9 displayTitle];

  if ([v8 length])
  {
    objc_super v18 = HULocalizedStringWithFormat(@"HUAlarmTextLabelAdditionalInfoFormat", @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v8);
    uint64_t v19 = [v11 stringByAppendingString:v18];

    uint64_t v11 = (void *)v19;
  }
  if ([v10 length])
  {
    v26 = HULocalizedStringWithFormat(@"HUAlarmTextLabelAdditionalInfoFormat", @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v10);
    uint64_t v27 = [v11 stringByAppendingString:v26];

    uint64_t v11 = (void *)v27;
  }
  v28 = [(HUAlarmTableViewCell *)self nameAndDescriptionLabel];
  [v28 setText:v11];

  v29 = [(HUAlarmTableViewCell *)self nameAndDescriptionLabel];
  [v29 sizeToFit];

  v30 = [(HUAlarmTableViewCell *)self timeLabel];
  [v30 sizeToFit];

  v31 = [(HUAlarmTableViewCell *)self enabledSwitch];
  [v31 setOn:self->_enabled animated:0];

  if (self->_enabled) {
    objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsPrimaryTextColor");
  }
  else {
  v32 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsDisabledTextColor");
  }
  if (self->_enabled) {
    [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }
  else {
  v33 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsDisabledTextColor");
  }
  v34 = (void *)MEMORY[0x1E4F42FF0];
  v38[1] = 3221225472;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[2] = __52__HUAlarmTableViewCell_refreshUI_roomName_animated___block_invoke;
  void v38[3] = &unk_1E6386340;
  if (v5) {
    double v35 = 0.2;
  }
  else {
    double v35 = 0.0;
  }
  v38[4] = self;
  id v39 = v32;
  id v40 = v33;
  id v36 = v33;
  id v37 = v32;
  [v34 animateWithDuration:v38 animations:v35];
}

void __52__HUAlarmTableViewCell_refreshUI_roomName_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) timeLabel];
  [v3 setTextColor:v2];

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) nameAndDescriptionLabel];
  [v5 setTextColor:v4];
}

- (void)_setupConstraints
{
  id v33 = (id)objc_opt_new();
  v3 = [(HUAlarmTableViewCell *)self labelsStackView];
  uint64_t v4 = [v3 topAnchor];
  id v5 = [(HUAlarmTableViewCell *)self contentView];
  v6 = [v5 topAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6 constant:20.0];
  [v33 addObject:v7];

  id v8 = [(HUAlarmTableViewCell *)self labelsStackView];
  id v9 = [v8 bottomAnchor];
  v10 = [(HUAlarmTableViewCell *)self contentView];
  uint64_t v11 = [v10 bottomAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11 constant:-10.0];
  [v33 addObject:v12];

  uint64_t v13 = [(HUAlarmTableViewCell *)self labelsStackView];
  uint64_t v14 = [v13 leadingAnchor];
  uint64_t v15 = [(HUAlarmTableViewCell *)self contentView];
  uint64_t v16 = [v15 leadingAnchor];
  uint64_t v17 = [v14 constraintEqualToAnchor:v16 constant:20.0];
  [v33 addObject:v17];

  objc_super v18 = [(HUAlarmTableViewCell *)self labelsStackView];
  uint64_t v19 = [v18 trailingAnchor];
  uint64_t v20 = [(HUAlarmTableViewCell *)self enabledSwitch];
  uint64_t v21 = [v20 leadingAnchor];
  uint64_t v22 = [v19 constraintEqualToAnchor:v21 constant:-20.0];
  [v33 addObject:v22];

  uint64_t v23 = [(HUAlarmTableViewCell *)self enabledSwitch];
  uint64_t v24 = [v23 trailingAnchor];
  uint64_t v25 = [(HUAlarmTableViewCell *)self contentView];
  v26 = [v25 trailingAnchor];
  uint64_t v27 = [v24 constraintEqualToAnchor:v26 constant:-12.0];
  [v33 addObject:v27];

  v28 = [(HUAlarmTableViewCell *)self enabledSwitch];
  v29 = [v28 centerYAnchor];
  v30 = [(HUAlarmTableViewCell *)self contentView];
  v31 = [v30 centerYAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  [v33 addObject:v32];

  [MEMORY[0x1E4F28DC8] activateConstraints:v33];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    BOOL v4 = !a3;
    id v5 = [(HUAlarmTableViewCell *)self enabledSwitch];
    [v5 setEnabled:v4];

    id v6 = [(HUAlarmTableViewCell *)self timeLabel];
    [v6 setEnabled:v4];
  }
}

- (void)_alarmActiveChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAlarmTableViewCell *)self window];
  [v5 setUserInteractionEnabled:0];

  [MEMORY[0x1E4F39CF8] animationDuration];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__HUAlarmTableViewCell__alarmActiveChanged___block_invoke;
  v9[3] = &unk_1E63850E0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_after(v7, MEMORY[0x1E4F14428], v9);
}

void __44__HUAlarmTableViewCell__alarmActiveChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) isOn];
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2080;
    id v10 = "-[HUAlarmTableViewCell _alarmActiveChanged:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@:%s alarm toggled to %{BOOL}d", (uint8_t *)&v7, 0x1Cu);
  }

  id v5 = [*(id *)(a1 + 32) window];
  [v5 setUserInteractionEnabled:1];

  double v6 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v6, "setAlarmEnabled:forCell:", objc_msgSend(*(id *)(a1 + 40), "isOn"), *(void *)(a1 + 32));
}

- (void)willTransitionToState:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUAlarmTableViewCell;
  [(HUAlarmTableViewCell *)&v4 willTransitionToState:a3];
  [(HUAlarmTableViewCell *)self setNeedsLayout];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUAlarmTableViewCell;
  [(HUAlarmTableViewCell *)&v5 setSelected:a3 animated:a4];
  [(HUAlarmTableViewCell *)self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HUAlarmTableViewCell;
  [(HUAlarmTableViewCell *)&v5 setHighlighted:a3 animated:a4];
  [(HUAlarmTableViewCell *)self setNeedsLayout];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = 0.2;
  v9[1] = 3221225472;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[2] = __44__HUAlarmTableViewCell_setEditing_animated___block_invoke;
  v9[3] = &unk_1E6385A70;
  if (!a4) {
    double v7 = 0.0;
  }
  v9[4] = self;
  BOOL v10 = a3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v9 animations:v7];
  v8.receiver = self;
  v8.super_class = (Class)HUAlarmTableViewCell;
  [(HUAlarmTableViewCell *)&v8 setEditing:v5 animated:v4];
}

uint64_t __44__HUAlarmTableViewCell_setEditing_animated___block_invoke(uint64_t a1)
{
  double v1 = 15.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 45.0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setSeparatorInset:", 0.0, v1, 0.0, 0.0);
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)HUAlarmTableViewCell;
  [(HUAlarmTableViewCell *)&v6 layoutSubviews];
  uint64_t v3 = [(HUAlarmTableViewCell *)self _alarmBackgroundColor];
  [(HUAlarmTableViewCell *)self setBackgroundColor:v3];

  BOOL v4 = [(HUAlarmTableViewCell *)self layer];
  [v4 setCornerRadius:8.0];

  BOOL v5 = [(HUAlarmTableViewCell *)self layer];
  [v5 setMasksToBounds:1];
}

- (void)_setTimeLabelToHour:(int64_t)a3 minute:(int64_t)a4
{
  id v13 = [(id)objc_opt_class() timeFormatter];
  double v7 = [(HUAlarmTableViewCell *)self calendar];
  objc_super v8 = [v7 components:1644 fromDate:self->_baseDate];

  [v8 setHour:a3];
  [v8 setMinute:a4];
  __int16 v9 = [(HUAlarmTableViewCell *)self calendar];
  BOOL v10 = [v9 dateFromComponents:v8];

  __int16 v11 = [v13 stringFromDate:v10];
  int v12 = [(HUAlarmTableViewCell *)self timeLabel];
  [v12 setText:v11];
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
}

- (HUAlarmTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAlarmTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (NSDate)baseDate
{
  return self->_baseDate;
}

- (void)setBaseDate:(id)a3
{
}

- (UILabel)nameAndDescriptionLabel
{
  return self->_nameAndDescriptionLabel;
}

- (void)setNameAndDescriptionLabel:(id)a3
{
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (UIStackView)labelsStackView
{
  return self->_labelsStackView;
}

- (void)setLabelsStackView:(id)a3
{
}

- (UISwitch)enabledSwitch
{
  return self->_enabledSwitch;
}

- (void)setEnabledSwitch:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSwitch, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_nameAndDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_baseDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_alarm, 0);
}

@end