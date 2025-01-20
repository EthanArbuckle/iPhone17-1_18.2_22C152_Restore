@interface BSUIRelativeDateLabel
- (BSRelativeDateTimerFireInfo)_overrideTimerFireInfo;
- (id)_timelineIdentifier;
- (id)_timelinesForDateInterval:(id)a3;
- (id)constructLabelString;
- (void)_setOverrideTimerFireInfo:(id)a3;
- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4;
- (void)_updateWithFrameSpecifier:(id)a3;
- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)prepareForReuse;
- (void)setTimeZoneRelativeStartDate:(id)a3 absoluteStartDate:(id)a4;
- (void)timerFiredWithValue:(unint64_t)a3 forResolution:(unint64_t)a4 comparedToNow:(int64_t)a5;
- (void)willMoveToWindow:(id)a3;
@end

@implementation BSUIRelativeDateLabel

- (void)setTimeZoneRelativeStartDate:(id)a3 absoluteStartDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BSUIRelativeDateLabel;
  [(BSUIDefaultDateLabel *)&v11 setTimeZoneRelativeStartDate:v6 absoluteStartDate:v7];
  relativeDateTimer = self->_relativeDateTimer;
  if (v7 && !relativeDateTimer)
  {
    v9 = (BSRelativeDateTimer *)objc_alloc_init(MEMORY[0x1E4F4F810]);
    v10 = self->_relativeDateTimer;
    self->_relativeDateTimer = v9;

    [(BSRelativeDateTimer *)self->_relativeDateTimer setDelegate:self];
    relativeDateTimer = self->_relativeDateTimer;
  }
  [(BSRelativeDateTimer *)relativeDateTimer setDate:v7];
}

- (void)dealloc
{
  [(BSRelativeDateTimer *)self->_relativeDateTimer setDelegate:0];
  [(BSRelativeDateTimer *)self->_relativeDateTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BSUIRelativeDateLabel;
  [(BSUIDefaultDateLabel *)&v3 dealloc];
}

- (void)prepareForReuse
{
  [(BSRelativeDateTimer *)self->_relativeDateTimer invalidate];
  [(BSRelativeDateTimer *)self->_relativeDateTimer setDate:0];
  self->_value = 0;
  self->_comparedToNow = 0;
  self->_resolution = 0;
  overrideTimerFireInfo = self->_overrideTimerFireInfo;
  self->_overrideTimerFireInfo = 0;

  self->_invalidateTimelineOnReuse = 1;
  v4.receiver = self;
  v4.super_class = (Class)BSUIRelativeDateLabel;
  [(BSUIDefaultDateLabel *)&v4 prepareForReuse];
}

- (id)constructLabelString
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  overrideTimerFireInfo = self->_overrideTimerFireInfo;
  if (overrideTimerFireInfo)
  {
    unint64_t value = [(BSRelativeDateTimerFireInfo *)overrideTimerFireInfo value];
    unint64_t resolution = [(BSRelativeDateTimerFireInfo *)self->_overrideTimerFireInfo resolution];
    int64_t comparedToNow = [(BSRelativeDateTimerFireInfo *)self->_overrideTimerFireInfo comparedToNow];
  }
  else
  {
    unint64_t value = self->_value;
    unint64_t resolution = self->_resolution;
    int64_t comparedToNow = self->_comparedToNow;
  }
  v8 = [(BSUIDefaultDateLabel *)self timeZoneRelativeStartDate];

  if (!v8)
  {
    v31.receiver = self;
    v31.super_class = (Class)BSUIRelativeDateLabel;
    uint64_t v9 = [(BSUIDefaultDateLabel *)&v31 constructLabelString];
LABEL_8:
    v10 = (void *)v9;
    if (!v9)
    {
LABEL_37:
      v22 = NSString;
      v23 = [(BSUIDefaultDateLabel *)self timeZoneRelativeStartDate];
      v24 = [v22 stringWithFormat:@"value=%llu resolution=%u comparedToNow=%i timeZoneRelativeStartDate=%@ isEffectiveAllDay=%{BOOL}i", value, resolution, comparedToNow, v23, -[BSUIDefaultDateLabel isEffectiveAllDay](self, "isEffectiveAllDay")];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138544642;
        id v33 = v25;
        __int16 v34 = 2114;
        v35 = v27;
        __int16 v36 = 2048;
        v37 = self;
        __int16 v38 = 2114;
        v39 = @"BSUIRelativeDateLabel.m";
        __int16 v40 = 1024;
        int v41 = 137;
        __int16 v42 = 2114;
        v43 = v24;
        _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A2B1ADFCLL);
    }
    goto LABEL_34;
  }
  if ([(BSUIDefaultDateLabel *)self isEffectiveAllDay])
  {
    v30.receiver = self;
    v30.super_class = (Class)BSUIRelativeDateLabel;
    uint64_t v9 = [(BSUIDefaultDateLabel *)&v30 constructLabelString];
    goto LABEL_8;
  }
  switch(resolution)
  {
    case 0uLL:
      objc_super v11 = NSString;
      v12 = +[NSBundle bs_baseBoardUIBundle]();
      v13 = v12;
      if (comparedToNow == 1) {
        [v12 localizedStringForKey:@"RELATIVE_DATE_FUTURE_SECONDS" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
      }
      else {
        [v12 localizedStringForKey:@"RELATIVE_DATE_PAST_SECONDS" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
      }
      goto LABEL_25;
    case 1uLL:
      objc_super v11 = NSString;
      v17 = +[NSBundle bs_baseBoardUIBundle]();
      v13 = v17;
      if (comparedToNow == 1) {
        [v17 localizedStringForKey:@"RELATIVE_DATE_FUTURE_MINUTES" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
      }
      else {
        [v17 localizedStringForKey:@"RELATIVE_DATE_PAST_MINUTES" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
      }
      goto LABEL_25;
    case 2uLL:
      BOOL v14 = comparedToNow == 1 && value > 1;
      if (v14 || (comparedToNow != 1 ? (BOOL v15 = value >= 4) : (BOOL v15 = 0), v15))
      {
        v28.receiver = self;
        v28.super_class = (Class)BSUIRelativeDateLabel;
        uint64_t v9 = [(BSUIDefaultDateLabel *)&v28 constructLabelString];
        goto LABEL_8;
      }
      objc_super v11 = NSString;
      v16 = +[NSBundle bs_baseBoardUIBundle]();
      v13 = v16;
      if (comparedToNow == 1) {
        [v16 localizedStringForKey:@"RELATIVE_DATE_FUTURE_HOURS" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
      }
      else {
        [v16 localizedStringForKey:@"RELATIVE_DATE_PAST_HOURS" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
      }
      v18 = LABEL_25:;
      uint64_t v19 = objc_msgSend(v11, "localizedStringWithFormat:", v18, value);
      goto LABEL_33;
    case 3uLL:
      if (comparedToNow == 1)
      {
        v29.receiver = self;
        v29.super_class = (Class)BSUIRelativeDateLabel;
        uint64_t v9 = [(BSUIDefaultDateLabel *)&v29 constructLabelString];
        goto LABEL_8;
      }
      v20 = NSString;
      v13 = +[NSBundle bs_baseBoardUIBundle]();
      v18 = [v13 localizedStringForKey:@"RELATIVE_DATE_PAST_DAYS" value:&stru_1EF5BC2D8 table:&stru_1EF5BC2D8];
      uint64_t v19 = objc_msgSend(v20, "localizedStringWithFormat:", v18, value);
LABEL_33:
      v10 = (void *)v19;

      if (!v10) {
        goto LABEL_37;
      }
      break;
    default:
      goto LABEL_37;
  }
LABEL_34:

  return v10;
}

- (void)timerFiredWithValue:(unint64_t)a3 forResolution:(unint64_t)a4 comparedToNow:(int64_t)a5
{
  self->_unint64_t value = a3;
  self->_unint64_t resolution = a4;
  self->_int64_t comparedToNow = a5;
  [(BSUIDefaultDateLabel *)self updateTextIfNecessary];
}

- (void)didMoveToWindow
{
  id v5 = [(BSUIRelativeDateLabel *)self window];
  objc_super v3 = [v5 windowScene];
  objc_super v4 = [v3 _alwaysOnEnvironment];
  [v4 addObserver:self];
}

- (void)willMoveToWindow:(id)a3
{
  id v11 = a3;
  objc_super v4 = [(BSUIRelativeDateLabel *)self window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _alwaysOnEnvironment];
  [v6 removeObserver:self];

  id v7 = [v11 windowScene];
  v8 = v7;
  if (self->_invalidateTimelineOnReuse && v7 != 0)
  {
    v10 = [v7 _backlightSceneEnvironment];
    [v10 invalidateAllTimelinesForReason:@"BSUIRelativeDateLabel Reuse"];

    self->_invalidateTimelineOnReuse = 0;
  }
}

- (id)_timelineIdentifier
{
  if (a1)
  {
    a1 = objc_msgSend(NSString, "stringWithFormat:", @"BSUIRelativeDateLabel: 0x%p", a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_setOverrideTimerFireInfo:(id)a3
{
  id v6 = (BSRelativeDateTimerFireInfo *)a3;
  if (self->_overrideTimerFireInfo != v6)
  {
    objc_super v4 = (BSRelativeDateTimerFireInfo *)[(BSRelativeDateTimerFireInfo *)v6 copy];
    overrideTimerFireInfo = self->_overrideTimerFireInfo;
    self->_overrideTimerFireInfo = v4;

    [(BSUIDefaultDateLabel *)self updateTextIfNecessary];
  }
}

- (id)_timelinesForDateInterval:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26 = [MEMORY[0x1E4F1CA48] array];
  relativeDateTimer = self->_relativeDateTimer;
  id v6 = [v4 startDate];
  id v7 = [(BSRelativeDateTimer *)relativeDateTimer nextFireAfterDate:v6];
  v8 = 0;
  while (1)
  {

    uint64_t v9 = [v7 fireDate];
    int v10 = [v4 containsDate:v9];

    if (!v10) {
      break;
    }
    [(BSUIRelativeDateLabel *)self _setOverrideTimerFireInfo:v7];
    id v6 = [(BSUIRelativeDateLabel *)self text];
    char v11 = [v8 isEqualToString:v6];
    uint64_t v12 = [v6 copy];

    if ((v11 & 1) == 0)
    {
      if ([v7 resolution]) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 2;
      }
      BOOL v14 = (void *)MEMORY[0x1E4F4F4B8];
      BOOL v15 = [v7 fireDate];
      v16 = (void *)[v7 copy];
      v17 = [v14 entryForPresentationTime:v15 withRequestedFidelity:v13 animated:0 userObject:v16];

      [v26 addObject:v17];
    }
    v18 = self->_relativeDateTimer;
    uint64_t v19 = [v7 fireDate];
    uint64_t v20 = [(BSRelativeDateTimer *)v18 nextFireAfterDate:v19];

    v8 = (void *)v12;
    id v7 = (void *)v20;
  }
  [(BSUIRelativeDateLabel *)self _setOverrideTimerFireInfo:0];
  v21 = (void *)MEMORY[0x1E4F4F4B0];
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"BSUIRelativeDateLabel: 0x%p", self);
  v23 = [v21 timelineWithEntries:v26 identifier:v22 configure:0];

  v27[0] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];

  return v24;
}

- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void *))a4;
  id v6 = [(BSUIRelativeDateLabel *)self _timelinesForDateInterval:a3];
  if (v7) {
    v7[2](v7, v6);
  }
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    id v4 = -[BSUIRelativeDateLabel _timelineIdentifier](self);
    id v5 = [v12 entrySpecifierForTimelineIdentifier:v4];

    id v6 = [v5 timelineEntry];
    id v7 = [v6 userObject];
    uint64_t v8 = objc_opt_class();
    id v9 = v7;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        int v10 = v9;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    id v11 = v10;

    [(BSUIRelativeDateLabel *)self _setOverrideTimerFireInfo:v11];
  }
  else
  {
    [(BSUIRelativeDateLabel *)self _setOverrideTimerFireInfo:0];
  }
}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(void))a4;
  [(BSUIRelativeDateLabel *)self _updateWithFrameSpecifier:v7];
  if (v6) {
    v6[2](v6);
  }
}

- (BSRelativeDateTimerFireInfo)_overrideTimerFireInfo
{
  return self->_overrideTimerFireInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTimerFireInfo, 0);

  objc_storeStrong((id *)&self->_relativeDateTimer, 0);
}

@end