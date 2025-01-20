@interface CSTimerViewController
- (BOOL)isEnabled;
- (BOOL)isEndDateValid;
- (BOOL)isTimerActive;
- (CSTimerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CSTimerViewControllerDelegate)delegate;
- (NSString)timerText;
- (void)_nextTimerChanged:(id)a3;
- (void)_startTimer;
- (void)_stopTimer;
- (void)_stopTimerNotifyingDelegate:(BOOL)a3;
- (void)_updateNextTimer;
- (void)_updateTimerFired;
- (void)_updateTimerLabelView;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEndDate:(id)a3;
@end

@implementation CSTimerViewController

- (CSTimerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CSTimerViewController;
  v4 = [(CSCoverSheetViewControllerBase *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (MTTimerManager *)objc_alloc_init(MEMORY[0x1E4F78BA8]);
    timerManager = v4->_timerManager;
    v4->_timerManager = v5;

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v4 selector:sel__nextTimerChanged_ name:*MEMORY[0x1E4F78B10] object:0];

    [(CSTimerViewController *)v4 _updateNextTimer];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CSTimerViewController *)self _stopTimer];
  v4.receiver = self;
  v4.super_class = (Class)CSTimerViewController;
  [(CSCoverSheetViewControllerBase *)&v4 dealloc];
}

- (void)loadView
{
  v3 = objc_alloc_init(CSTimerView);
  [(CSTimerViewController *)self setView:v3];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3) {
      [(CSTimerViewController *)self _startTimer];
    }
    else {
      [(CSTimerViewController *)self _stopTimer];
    }
  }
}

- (BOOL)isTimerActive
{
  return [(NSTimer *)self->_updateTimer isValid];
}

- (void)setEndDate:(id)a3
{
  v5 = (NSDate *)a3;
  p_endDate = &self->_endDate;
  if (self->_endDate != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_endDate, a3);
    v7 = [(CSTimerViewController *)self timerView];
    [v7 setEndDate:v8];

    if (v8) {
      p_endDate = (NSDate **)[(CSTimerViewController *)self _startTimer];
    }
    else {
      p_endDate = (NSDate **)[(CSTimerViewController *)self _stopTimer];
    }
  }

  MEMORY[0x1F4181820](p_endDate);
}

- (NSString)timerText
{
  v2 = [(CSTimerViewController *)self timerView];
  v3 = [v2 timerText];

  return (NSString *)v3;
}

- (BOOL)isEndDateValid
{
  endDate = self->_endDate;
  if (endDate)
  {
    [(NSDate *)endDate timeIntervalSinceNow];
    LOBYTE(endDate) = v3 > 0.0;
  }
  return (char)endDate;
}

- (void)_stopTimer
{
}

- (void)_stopTimerNotifyingDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    updateTimer = self->_updateTimer;
    int v10 = 138412290;
    v11 = updateTimer;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Stopping update timer: %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = self->_updateTimer;
  if (v7)
  {
    [(NSTimer *)v7 invalidate];
    v8 = self->_updateTimer;
    self->_updateTimer = 0;

    if (v3)
    {
      objc_super v9 = [(CSTimerViewController *)self delegate];
      [v9 timerControllerDidStopTimer:self];
    }
    [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  }
}

- (void)_startTimer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(CSTimerViewController *)self _stopTimerNotifyingDelegate:0];
  BOOL v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "Starting update timer...", (uint8_t *)&v12, 2u);
  }

  if (self->_enabled && [(CSTimerViewController *)self isEndDateValid])
  {
    objc_super v4 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__updateTimerFired selector:0 userInfo:1 repeats:1.0];
    updateTimer = self->_updateTimer;
    self->_updateTimer = v4;

    v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v6 addTimer:self->_updateTimer forMode:*MEMORY[0x1E4F1C4B0]];

    v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_updateTimer;
      int v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Started update timer: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    [(CSTimerViewController *)self _updateTimerLabelView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained timerControllerDidStartTimer:self];

    [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  }
  else
  {
    int v10 = SBLogDashBoard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      endDate = self->_endDate;
      int v12 = 138543362;
      v13 = endDate;
      _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "Unable to start update timer with end date: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_updateTimerFired
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    endDate = self->_endDate;
    int v6 = 138543362;
    v7 = endDate;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "Update timer fired with end date: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained timerControllerDidUpdateTimer:self];

  [(CSTimerViewController *)self _updateTimerLabelView];
  if (![(CSTimerViewController *)self isEndDateValid]) {
    [(CSTimerViewController *)self setEndDate:0];
  }
}

- (void)_updateTimerLabelView
{
  BOOL v3 = [(CSTimerViewController *)self timerView];
  [v3 updateTimerLabel];

  id v4 = [(CSTimerViewController *)self timerView];
  [v4 sizeToFit];
}

- (void)_nextTimerChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Received next timer changed notification: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(CSTimerViewController *)self _updateNextTimer];
}

- (void)_updateNextTimer
{
  BOOL v3 = [(MTTimerManager *)self->_timerManager nextTimer];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__CSTimerViewController__updateNextTimer__block_invoke;
  v5[3] = &unk_1E6ADA4C0;
  v5[4] = self;
  id v4 = (id)[v3 addCompletionBlock:v5];
}

void __41__CSTimerViewController__updateNextTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CSTimerViewController__updateNextTimer__block_invoke_2;
  v6[3] = &unk_1E6AD88C0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __41__CSTimerViewController__updateNextTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 nextTrigger];
  uint64_t v8 = SBLogDashBoard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "Setting next timer: %{public}@ with trigger: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  objc_super v9 = *(void **)(a1 + 40);
  int v10 = [v7 triggerDate];
  [v9 setEndDate:v10];
}

- (CSTimerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSTimerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_updateTimer, 0);
}

@end