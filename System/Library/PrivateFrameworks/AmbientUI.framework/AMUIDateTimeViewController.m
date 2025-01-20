@interface AMUIDateTimeViewController
- (AMUIDateProviding)dateProvider;
- (AMUIDateTimeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (UIView)viewForOpacityAdjustment;
- (id)_dateTimeViewIfExists;
- (void)_startUpdateTimer;
- (void)_stopUpdateTimer;
- (void)_updateViewWithDate:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setDateProvider:(id)a3;
- (void)setVibrancyConfiguration:(id)a3;
@end

@implementation AMUIDateTimeViewController

- (AMUIDateTimeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AMUIDateTimeViewController;
  v4 = [(AMUIDateTimeViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(AMUIDateTimeViewController *)v4 setDateProvider:0];
  }
  return v5;
}

- (void)dealloc
{
  [(AMUIDateTimeViewController *)self _stopUpdateTimer];
  v3.receiver = self;
  v3.super_class = (Class)AMUIDateTimeViewController;
  [(AMUIDateTimeViewController *)&v3 dealloc];
}

- (void)loadView
{
  v43[8] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F29D68]);
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  objc_super v7 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], v4, v5, v6);
  v8 = -[AMUIDateTimeView initWithFrame:]([AMUIDateTimeView alloc], "initWithFrame:", v3, v4, v5, v6);
  v9 = [(AMUIDateTimeView *)v8 layer];
  [v9 setAllowsGroupOpacity:1];

  v10 = [v7 contentView];
  [v10 addSubview:v8];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AMUIDateTimeView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = (void *)MEMORY[0x263F08938];
  v41 = [v10 leadingAnchor];
  v40 = [(AMUIDateTimeView *)v8 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v43[0] = v39;
  v38 = [v10 trailingAnchor];
  v37 = [(AMUIDateTimeView *)v8 trailingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v43[1] = v36;
  v35 = [v10 topAnchor];
  v34 = [(AMUIDateTimeView *)v8 topAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v43[2] = v33;
  v32 = [v10 bottomAnchor];
  v30 = [(AMUIDateTimeView *)v8 bottomAnchor];
  v29 = [v32 constraintEqualToAnchor:v30];
  v43[3] = v29;
  v27 = [v7 leadingAnchor];
  v26 = [v10 leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v43[4] = v25;
  v24 = [v7 trailingAnchor];
  v23 = [v10 trailingAnchor];
  v11 = [v24 constraintEqualToAnchor:v23];
  v43[5] = v11;
  v28 = (BSUIVibrancyEffectView *)v7;
  v12 = [v7 topAnchor];
  v13 = [v10 topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v43[6] = v14;
  v15 = [v7 bottomAnchor];
  v16 = [v10 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v43[7] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:8];
  [v31 activateConstraints:v18];

  vibrancyView = self->_vibrancyView;
  self->_vibrancyView = v28;
  v20 = v28;

  dateTimeView = self->_dateTimeView;
  self->_dateTimeView = v8;
  v22 = v8;

  [(AMUIDateTimeViewController *)self setView:self->_vibrancyView];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDateProvider:(id)a3
{
  double v4 = (AMUIDefaultDateProvider *)a3;
  if (!v4) {
    double v4 = objc_alloc_init(AMUIDefaultDateProvider);
  }
  if ((AMUIDefaultDateProvider *)self->_dateProvider != v4)
  {
    obj = v4;
    [(AMUIDateTimeViewController *)self _stopUpdateTimer];
    objc_storeStrong((id *)&self->_dateProvider, obj);
    double v5 = [(AMUIDateProviding *)self->_dateProvider date];
    [(AMUIDateTimeViewController *)self _updateViewWithDate:v5];

    double v4 = obj;
    if (!self->_disablesUpdates)
    {
      [(AMUIDateTimeViewController *)self _startUpdateTimer];
      double v4 = obj;
    }
  }
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  [(AMUIDateTimeViewController *)self loadViewIfNeeded];
  vibrancyView = self->_vibrancyView;

  return (BSUIVibrancyConfiguration *)[(BSUIVibrancyEffectView *)vibrancyView configuration];
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v4 = a3;
  [(AMUIDateTimeViewController *)self loadViewIfNeeded];
  [(BSUIVibrancyEffectView *)self->_vibrancyView setConfiguration:v4];
  dateTimeView = self->_dateTimeView;
  id v6 = [v4 color];

  [(AMUIDateTimeView *)dateTimeView setTextColor:v6];
}

- (UIView)viewForOpacityAdjustment
{
  return (UIView *)self->_dateTimeView;
}

- (id)_dateTimeViewIfExists
{
  return self->_dateTimeView;
}

- (void)_updateViewWithDate:(id)a3
{
  id v5 = a3;
  if (self->_disablesUpdates)
  {
    [(AMUIDateTimeViewController *)self _stopUpdateTimer];
  }
  else
  {
    id v4 = [(AMUIDateTimeViewController *)self _dateTimeViewIfExists];
    [v4 setDate:v5];

    [(AMUIDateTimeViewController *)self _startUpdateTimer];
  }
}

- (void)_startUpdateTimer
{
  if (!self->_dateProviderToken)
  {
    objc_initWeak(&location, self);
    dateProvider = self->_dateProvider;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__AMUIDateTimeViewController__startUpdateTimer__block_invoke;
    v6[3] = &unk_265224BD8;
    objc_copyWeak(&v7, &location);
    id v4 = [(AMUIDateProviding *)dateProvider observeMinuteUpdatesWithHandler:v6];
    id dateProviderToken = self->_dateProviderToken;
    self->_id dateProviderToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __47__AMUIDateTimeViewController__startUpdateTimer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateViewWithDate:v3];
}

- (void)_stopUpdateTimer
{
  if (self->_dateProviderToken)
  {
    -[AMUIDateProviding removeMinuteUpdateHandler:](self->_dateProvider, "removeMinuteUpdateHandler:");
    id dateProviderToken = self->_dateProviderToken;
    self->_id dateProviderToken = 0;
  }
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_dateTimeView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);

  objc_storeStrong(&self->_dateProviderToken, 0);
}

@end