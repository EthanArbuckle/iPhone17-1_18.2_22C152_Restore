@interface HUQuickControlProxHandOffSummaryViewUpdater
- (BOOL)_isHomePodPhoneCallStatusUpdateTimerActive;
- (BOOL)_isHomePodTimerStatusUpdateTimerActive;
- (HUQuickControlProxHandOffSummaryViewUpdater)initWithNavigationBarTitleView:(id)a3;
- (HUQuickControlSummaryNavigationBarTitleView)titleView;
- (OS_dispatch_source)phoneCallStatusUpdateTimer;
- (OS_dispatch_source)timerStatusUpdateTimer;
- (PCActivity)lastActivity;
- (PCTelephonyActivity)homePodPhoneCallActivity;
- (PCTimerActivity)homePodTimerActivity;
- (void)_invalidateHomePodPhoneCallStatusUpdateTimer;
- (void)_invalidateHomePodTimerStatusUpdateTimer;
- (void)_setupObservableActivityForActivity:(id)a3;
- (void)_startHomePodPhoneCallStatusUpdateTimer;
- (void)_startHomePodTimerStatusUpdateTimer;
- (void)_updateSummaryViewForActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5;
- (void)dealloc;
- (void)didUpdateActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5;
- (void)setHomePodPhoneCallActivity:(id)a3;
- (void)setHomePodTimerActivity:(id)a3;
- (void)setLastActivity:(id)a3;
- (void)setPhoneCallStatusUpdateTimer:(id)a3;
- (void)setTimerStatusUpdateTimer:(id)a3;
- (void)setTitleView:(id)a3;
@end

@implementation HUQuickControlProxHandOffSummaryViewUpdater

- (HUQuickControlProxHandOffSummaryViewUpdater)initWithNavigationBarTitleView:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUQuickControlProxHandOffSummaryViewUpdater;
  v6 = [(HUQuickControlProxHandOffSummaryViewUpdater *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_titleView, a3);
    if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
    {
      v8 = [MEMORY[0x1E4F69430] sharedInstance];
      [v8 addObserver:v7];
      v9 = [v8 lastActivities];
      v10 = [v9 firstObject];
      [(HUQuickControlProxHandOffSummaryViewUpdater *)v7 _setupObservableActivityForActivity:v10];

      v11 = [v8 lastActivities];
      v12 = [v8 lastIdentifier];
      v13 = [v8 lastDisambiguationContext];
      [(HUQuickControlProxHandOffSummaryViewUpdater *)v7 _updateSummaryViewForActivities:v11 forProxControlID:v12 disambiguationContext:v13];
    }
  }

  return v7;
}

- (void)dealloc
{
  if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
  {
    [(HUQuickControlProxHandOffSummaryViewUpdater *)self _invalidateHomePodPhoneCallStatusUpdateTimer];
    [(HUQuickControlProxHandOffSummaryViewUpdater *)self _invalidateHomePodTimerStatusUpdateTimer];
  }
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlProxHandOffSummaryViewUpdater;
  [(HUQuickControlProxHandOffSummaryViewUpdater *)&v3 dealloc];
}

- (void)_updateSummaryViewForActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v57 = v7;
  if ([v7 count])
  {
    v9 = [v7 objectAtIndexedSubscript:0];
    v10 = &unk_1F1AD90F0;
    if ([v9 conformsToProtocol:v10]) {
      v11 = v9;
    }
    else {
      v11 = 0;
    }
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  v13 = [(__CFString *)v12 activityString];
  v14 = v13;
  if (v13)
  {
    objc_super v15 = v13;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUQuickControlProxHandoffSummaryNotPlaying", @"HUQuickControlProxHandoffSummaryNotPlaying", 1);
    objc_super v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  objc_opt_class();
  id v17 = v8;
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  objc_opt_class();
  id v20 = v17;
  if (objc_opt_isKindOfClass()) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  id v22 = v21;

  if (v19) {
    v23 = v19;
  }
  else {
    v23 = v22;
  }
  uint64_t v58 = [v23 assetType];
  v24 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self lastActivity];
  char v25 = [v24 isEqual:v12];

  v26 = HFLogForCategory();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      *(_DWORD *)buf = 138412290;
      v60 = v12;
      _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "NOT Updating summary view for PCActivity = [%@]", buf, 0xCu);
    }
  }
  else
  {
    if (v27)
    {
      *(_DWORD *)buf = 138412546;
      v60 = v16;
      __int16 v61 = 2112;
      v62 = v12;
      _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "Updating summary view with secondary text [%@] for activity %@", buf, 0x16u);
    }

    v28 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self titleView];
    v29 = [v28 summaryView];
    [v29 setSecondaryText:v16];

    if ([(HUQuickControlProxHandOffSummaryViewUpdater *)self _isHomePodPhoneCallStatusUpdateTimerActive]&& ([(HUQuickControlProxHandOffSummaryViewUpdater *)self homePodPhoneCallActivity], v30 = objc_claimAutoreleasedReturnValue(), v30, !v30))
    {
      [(HUQuickControlProxHandOffSummaryViewUpdater *)self _invalidateHomePodPhoneCallStatusUpdateTimer];
    }
    else if (![(HUQuickControlProxHandOffSummaryViewUpdater *)self _isHomePodPhoneCallStatusUpdateTimerActive])
    {
      v31 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self homePodPhoneCallActivity];

      if (v31) {
        [(HUQuickControlProxHandOffSummaryViewUpdater *)self _startHomePodPhoneCallStatusUpdateTimer];
      }
    }
    if ([(HUQuickControlProxHandOffSummaryViewUpdater *)self _isHomePodTimerStatusUpdateTimerActive]&& ([(HUQuickControlProxHandOffSummaryViewUpdater *)self homePodTimerActivity], v32 = objc_claimAutoreleasedReturnValue(), v32, !v32))
    {
      [(HUQuickControlProxHandOffSummaryViewUpdater *)self _invalidateHomePodTimerStatusUpdateTimer];
    }
    else if (![(HUQuickControlProxHandOffSummaryViewUpdater *)self _isHomePodTimerStatusUpdateTimerActive])
    {
      v33 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self homePodTimerActivity];

      if (v33) {
        [(HUQuickControlProxHandOffSummaryViewUpdater *)self _startHomePodTimerStatusUpdateTimer];
      }
    }
  }
  v56 = v16;
  if (v19) {
    v34 = v19;
  }
  else {
    v34 = v22;
  }
  v35 = [v34 deviceName];
  v55 = v22;
  v36 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self titleView];
  v37 = [v36 summaryView];
  v38 = [v37 primaryText];
  char v39 = [v38 isEqualToString:v35];

  if ((v39 & 1) == 0)
  {
    v40 = HFLogForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v35;
      _os_log_impl(&dword_1BE345000, v40, OS_LOG_TYPE_DEFAULT, "Updating summary view with values - Primary Text [%@]", buf, 0xCu);
    }

    v41 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self titleView];
    v42 = [v41 summaryView];
    [v42 setPrimaryText:v35];
  }
  unint64_t v43 = v58;
  if (v58)
  {
    v44 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self titleView];
    v45 = [v44 summaryView];
    uint64_t v46 = [v45 image];
    if (v46)
    {
      v47 = (void *)v46;
      v48 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self lastActivity];
      char v49 = [v48 isEqual:v12];

      unint64_t v43 = v58;
      if (v49) {
        goto LABEL_55;
      }
    }
    else
    {
    }
    v50 = [MEMORY[0x1E4F94238] composedImageFor:v12 assetType:v43];
    v51 = HFLogForCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      if (v43 >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", v43);
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v52 = off_1E6386BE0[v43 - 1];
      }
      *(_DWORD *)buf = 138413058;
      v60 = v50;
      __int16 v61 = 2112;
      v62 = v52;
      __int16 v63 = 2112;
      id v64 = v20;
      __int16 v65 = 2112;
      v66 = v12;
      _os_log_impl(&dword_1BE345000, v51, OS_LOG_TYPE_DEFAULT, "Updating summary view with Image = [%@] assetType = [%@] identifier = [%@] activity = [%@]", buf, 0x2Au);
    }
    v53 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self titleView];
    v54 = [v53 summaryView];
    [v54 setImage:v50];
  }
LABEL_55:
  [(HUQuickControlProxHandOffSummaryViewUpdater *)self setLastActivity:v12];
}

- (void)_startHomePodPhoneCallStatusUpdateTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  [(HUQuickControlProxHandOffSummaryViewUpdater *)self setPhoneCallStatusUpdateTimer:v4];

  dispatch_time_t v5 = dispatch_time(0, 0);
  objc_initWeak(&location, self);
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    objc_super v15 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@ Starting *HomePod* Phone Call Status Update Timer", buf, 0xCu);
  }
  id v8 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self phoneCallStatusUpdateTimer];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __86__HUQuickControlProxHandOffSummaryViewUpdater__startHomePodPhoneCallStatusUpdateTimer__block_invoke;
  handler[3] = &unk_1E6386BC0;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a2;
  dispatch_source_set_event_handler(v8, handler);

  v9 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self phoneCallStatusUpdateTimer];
  dispatch_source_set_timer(v9, v5, 0x3B9ACA00uLL, 0);

  v10 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self phoneCallStatusUpdateTimer];
  dispatch_resume(v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __86__HUQuickControlProxHandOffSummaryViewUpdater__startHomePodPhoneCallStatusUpdateTimer__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_source_t v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@ Now Updating *HomePod* Phone Call Status...", (uint8_t *)&v9, 0xCu);
  }
  dispatch_time_t v5 = [WeakRetained titleView];
  v6 = [v5 summaryView];
  id v7 = [WeakRetained homePodPhoneCallActivity];
  id v8 = [v7 activityString];
  [v6 setSecondaryText:v8];
}

- (void)_invalidateHomePodPhoneCallStatusUpdateTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_source_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v5 = NSStringFromSelector(a2);
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ Cancelling *HomePod* Phone Call Status Update Timer", (uint8_t *)&v7, 0xCu);
  }
  if ([(HUQuickControlProxHandOffSummaryViewUpdater *)self _isHomePodPhoneCallStatusUpdateTimerActive])
  {
    v6 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self phoneCallStatusUpdateTimer];
    dispatch_source_cancel(v6);
  }
  [(HUQuickControlProxHandOffSummaryViewUpdater *)self setPhoneCallStatusUpdateTimer:0];
}

- (BOOL)_isHomePodPhoneCallStatusUpdateTimerActive
{
  objc_super v3 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self phoneCallStatusUpdateTimer];
  if (v3)
  {
    dispatch_source_t v4 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self phoneCallStatusUpdateTimer];
    BOOL v5 = dispatch_source_testcancel(v4) == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_startHomePodTimerStatusUpdateTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  [(HUQuickControlProxHandOffSummaryViewUpdater *)self setTimerStatusUpdateTimer:v4];

  dispatch_time_t v5 = dispatch_time(0, 0);
  objc_initWeak(&location, self);
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    objc_super v15 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@ Starting *HomePod* MobileTimer Status Update Timer", buf, 0xCu);
  }
  id v8 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self timerStatusUpdateTimer];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __82__HUQuickControlProxHandOffSummaryViewUpdater__startHomePodTimerStatusUpdateTimer__block_invoke;
  handler[3] = &unk_1E6386BC0;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a2;
  dispatch_source_set_event_handler(v8, handler);

  uint64_t v9 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self timerStatusUpdateTimer];
  dispatch_source_set_timer(v9, v5, 0x3B9ACA00uLL, 0);

  v10 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self timerStatusUpdateTimer];
  dispatch_resume(v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __82__HUQuickControlProxHandOffSummaryViewUpdater__startHomePodTimerStatusUpdateTimer__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_source_t v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@ Now Updating *HomePod* MobileTimer Status...", (uint8_t *)&v9, 0xCu);
  }
  dispatch_time_t v5 = [WeakRetained titleView];
  v6 = [v5 summaryView];
  int v7 = [WeakRetained homePodTimerActivity];
  id v8 = [v7 activityString];
  [v6 setSecondaryText:v8];
}

- (void)_invalidateHomePodTimerStatusUpdateTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_source_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v5 = NSStringFromSelector(a2);
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@ Cancelling *HomePod* MobileTimer Status Update Timer", (uint8_t *)&v7, 0xCu);
  }
  if ([(HUQuickControlProxHandOffSummaryViewUpdater *)self _isHomePodTimerStatusUpdateTimerActive])
  {
    v6 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self timerStatusUpdateTimer];
    dispatch_source_cancel(v6);
  }
  [(HUQuickControlProxHandOffSummaryViewUpdater *)self setTimerStatusUpdateTimer:0];
}

- (BOOL)_isHomePodTimerStatusUpdateTimerActive
{
  objc_super v3 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self timerStatusUpdateTimer];
  if (v3)
  {
    dispatch_source_t v4 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self timerStatusUpdateTimer];
    BOOL v5 = dispatch_source_testcancel(v4) == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_setupObservableActivityForActivity:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 activityType];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F94260]];

  if (v7)
  {
    objc_opt_class();
    id v8 = v5;
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    [(HUQuickControlProxHandOffSummaryViewUpdater *)self setHomePodPhoneCallActivity:v10];
    uint64_t v11 = HFLogForCategory();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v12 = NSStringFromSelector(a2);
    v13 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self homePodPhoneCallActivity];
    int v20 = 138412546;
    v21 = v12;
    __int16 v22 = 2112;
    v23 = v13;
    v14 = "%@ Found HomePod Phone Call Activity = [%@]";
LABEL_13:
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 0x16u);

LABEL_14:
    goto LABEL_15;
  }
  objc_super v15 = [v5 activityType];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F94268]];

  if (v16)
  {
    objc_opt_class();
    id v17 = v5;
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v19 = v18;

    [(HUQuickControlProxHandOffSummaryViewUpdater *)self setHomePodTimerActivity:v19];
    uint64_t v11 = HFLogForCategory();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v12 = NSStringFromSelector(a2);
    v13 = [(HUQuickControlProxHandOffSummaryViewUpdater *)self homePodTimerActivity];
    int v20 = 138412546;
    v21 = v12;
    __int16 v22 = 2112;
    v23 = v13;
    v14 = "%@ Found HomePod MobileTimer Activity = [%@]";
    goto LABEL_13;
  }
LABEL_15:
}

- (void)didUpdateActivities:(id)a3 forProxControlID:(id)a4 disambiguationContext:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    int v15 = 138413058;
    int v16 = v13;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@ didUpdateActivities = %@ forProxControlID = %@ disambiguationContext = %@", (uint8_t *)&v15, 0x2Au);
  }
  v14 = [v9 firstObject];
  [(HUQuickControlProxHandOffSummaryViewUpdater *)self _setupObservableActivityForActivity:v14];

  [(HUQuickControlProxHandOffSummaryViewUpdater *)self _updateSummaryViewForActivities:v9 forProxControlID:v10 disambiguationContext:v11];
}

- (PCTelephonyActivity)homePodPhoneCallActivity
{
  return self->_homePodPhoneCallActivity;
}

- (void)setHomePodPhoneCallActivity:(id)a3
{
}

- (OS_dispatch_source)phoneCallStatusUpdateTimer
{
  return self->_phoneCallStatusUpdateTimer;
}

- (void)setPhoneCallStatusUpdateTimer:(id)a3
{
}

- (PCTimerActivity)homePodTimerActivity
{
  return self->_homePodTimerActivity;
}

- (void)setHomePodTimerActivity:(id)a3
{
}

- (OS_dispatch_source)timerStatusUpdateTimer
{
  return self->_timerStatusUpdateTimer;
}

- (void)setTimerStatusUpdateTimer:(id)a3
{
}

- (PCActivity)lastActivity
{
  return self->_lastActivity;
}

- (void)setLastActivity:(id)a3
{
}

- (HUQuickControlSummaryNavigationBarTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_timerStatusUpdateTimer, 0);
  objc_storeStrong((id *)&self->_homePodTimerActivity, 0);
  objc_storeStrong((id *)&self->_phoneCallStatusUpdateTimer, 0);

  objc_storeStrong((id *)&self->_homePodPhoneCallActivity, 0);
}

@end