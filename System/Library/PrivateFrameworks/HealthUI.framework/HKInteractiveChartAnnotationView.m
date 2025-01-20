@interface HKInteractiveChartAnnotationView
- (BOOL)_dataSourceHasNoData;
- (BOOL)showsInfoButton;
- (CGSize)intrinsicContentSize;
- (HKInteractiveChartAnnotationView)initWithCoder:(id)a3;
- (HKInteractiveChartAnnotationView)initWithContext:(int64_t)a3;
- (HKInteractiveChartAnnotationViewDataSourceProtocol)dataSource;
- (HKInteractiveChartAnnotationViewDelegate)delegate;
- (NSLayoutConstraint)leadingMarginConstraint;
- (NSLayoutConstraint)trailingMarginConstraint;
- (NSTimer)deferredNoDataTimer;
- (UIButton)infoButton;
- (_HKAnnotationColumnLayout)columnLayout;
- (_HKBodyMarginsLayout)bodyMarginsLayout;
- (_HKDateContentLayout)dateContentLayout;
- (double)_leadingMargin;
- (int64_t)context;
- (void)_buildStandardAnnotationViews;
- (void)_cancelDeferredDataReload;
- (void)_configureLayout;
- (void)_invalidateLayout;
- (void)_removeViewsForRebuild;
- (void)_updateRightMarginViewWithInfoButton;
- (void)handleCurrentTimeGesture:(id)a3;
- (void)infoButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)reloadData;
- (void)scheduleDeferredDataReload;
- (void)setBodyMarginsLayout:(id)a3;
- (void)setColumnLayout:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDateContentLayout:(id)a3;
- (void)setDeferredNoDataTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInfoButton:(id)a3;
- (void)setLeadingMarginConstraint:(id)a3;
- (void)setShowsInfoButton:(BOOL)a3;
- (void)setTrailingMarginConstraint:(id)a3;
- (void)showNoDataStatus;
@end

@implementation HKInteractiveChartAnnotationView

- (HKInteractiveChartAnnotationView)initWithContext:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKInteractiveChartAnnotationView;
  v4 = -[HKInteractiveChartAnnotationView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    [(HKInteractiveChartAnnotationView *)v4 setContext:a3];
    [(HKInteractiveChartAnnotationView *)v5 setTranslatesAutoresizingMaskIntoConstraints:a3 == 0];
    v6 = [(HKInteractiveChartAnnotationView *)v5 layer];
    [v6 setCornerRadius:5.0];

    [(HKInteractiveChartAnnotationView *)v5 setClipsToBounds:1];
    v5->_showsInfoButton = 0;
    [(HKInteractiveChartAnnotationView *)v5 setDeferredNoDataTimer:0];
    [(HKInteractiveChartAnnotationView *)v5 setPreservesSuperviewLayoutMargins:1];
    [(HKInteractiveChartAnnotationView *)v5 _configureLayout];
  }
  return v5;
}

- (HKInteractiveChartAnnotationView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKInteractiveChartAnnotationView;
  return -[HKInteractiveChartAnnotationView initWithFrame:](&v4, sel_initWithFrame_, a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (UIButton)infoButton
{
  infoButton = self->_infoButton;
  if (!infoButton)
  {
    objc_msgSend(MEMORY[0x1E4FB14D0], "hk_currentValueViewInfoButtonWithTarget:action:", self, sel_infoButtonPressed_);
    objc_super v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_infoButton;
    self->_infoButton = v4;

    v6 = objc_msgSend(NSString, "hk_chartAccessibilityIdentifier:", @"Info");
    [(UIButton *)self->_infoButton setAccessibilityIdentifier:v6];

    [(UIButton *)self->_infoButton setHidden:1];
    infoButton = self->_infoButton;
  }
  return infoButton;
}

- (void)_configureLayout
{
  v3 = [[_HKAnnotationColumnLayout alloc] initWithContext:[(HKInteractiveChartAnnotationView *)self context]];
  [(HKInteractiveChartAnnotationView *)self setColumnLayout:v3];

  objc_super v4 = objc_msgSend(NSString, "hk_chartLollipopAccessibilityIdentifier:", @"Columns");
  v5 = [(HKInteractiveChartAnnotationView *)self columnLayout];
  [v5 setAccessibilityIdentifier:v4];

  v6 = objc_alloc_init(_HKDateContentLayout);
  [(HKInteractiveChartAnnotationView *)self setDateContentLayout:v6];

  v7 = [(HKInteractiveChartAnnotationView *)self columnLayout];
  objc_super v8 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
  [v8 setContentView:v7];

  v9 = objc_msgSend(NSString, "hk_chartLollipopAccessibilityIdentifier:", @"DateAndContent");
  v10 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
  [v10 setAccessibilityIdentifier:v9];

  v11 = objc_alloc_init(_HKBodyMarginsLayout);
  [(HKInteractiveChartAnnotationView *)self setBodyMarginsLayout:v11];

  v12 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
  v13 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  [v13 setBodyView:v12];

  v14 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:1];

  v15 = objc_msgSend(NSString, "hk_chartLollipopAccessibilityIdentifier:", @"BodyMargins");
  v16 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  [v16 setAccessibilityIdentifier:v15];

  id v17 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  [(HKInteractiveChartAnnotationView *)self addSubview:v17];
}

- (void)setShowsInfoButton:(BOOL)a3
{
  if (self->_showsInfoButton != a3)
  {
    self->_showsInfoButton = a3;
    BOOL v3 = !a3;
    id v4 = [(HKInteractiveChartAnnotationView *)self infoButton];
    [v4 setHidden:v3];
  }
}

- (void)reloadData
{
  [(HKInteractiveChartAnnotationView *)self _cancelDeferredDataReload];
  if ([(HKInteractiveChartAnnotationView *)self _dataSourceHasNoData])
  {
    [(HKInteractiveChartAnnotationView *)self showNoDataStatus];
  }
  else
  {
    [(HKInteractiveChartAnnotationView *)self _buildStandardAnnotationViews];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HKInteractiveChartAnnotationView;
  [(HKInteractiveChartAnnotationView *)&v13 layoutSubviews];
  [(HKInteractiveChartAnnotationView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  double v9 = v8;

  [(HKInteractiveChartAnnotationView *)self _leadingMargin];
  double v11 = v10;
  if (v9 + 2.0 + 2.0 > v6) {
    double v9 = v6 + -4.0;
  }
  v12 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  objc_msgSend(v12, "setFrame:", v11, v6 + -2.0 - v9, v4 + v11 * -2.0, v9);
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  double v5 = v4;
  double v7 = v6;

  [(HKInteractiveChartAnnotationView *)self _leadingMargin];
  double v9 = v5 + v8 * 2.0;
  double v10 = v7 + 2.0 + 2.0;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)_leadingMargin
{
  if (([(HKInteractiveChartAnnotationView *)self context] | 2) != 2) {
    return 10.0;
  }
  [(HKInteractiveChartAnnotationView *)self layoutMargins];
  double result = 16.0;
  if (v3 >= 16.0) {
    return v3;
  }
  return result;
}

- (void)_updateRightMarginViewWithInfoButton
{
  BOOL v3 = [(HKInteractiveChartAnnotationView *)self showsInfoButton];
  if (v3)
  {
    id v5 = [(HKInteractiveChartAnnotationView *)self infoButton];
  }
  else
  {
    id v5 = 0;
  }
  double v4 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  [v4 setRightMarginView:v5];

  if (v3)
  {
  }
}

- (void)_buildStandardAnnotationViews
{
  BOOL v3 = [(HKInteractiveChartAnnotationView *)self dataSource];
  uint64_t v4 = [v3 showSeparators];
  id v5 = [(HKInteractiveChartAnnotationView *)self columnLayout];
  [v5 setIncludeSeparators:v4];

  double v6 = [(HKInteractiveChartAnnotationView *)self dataSource];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    double v7 = [(HKInteractiveChartAnnotationView *)self dataSource];
    uint64_t v8 = [v7 reverseColumnsInRightToLeftLayoutDirection];
    double v9 = [(HKInteractiveChartAnnotationView *)self columnLayout];
    [v9 setReverseColumnsInRightToLeftLayoutDirection:v8];
  }
  double v10 = [(HKInteractiveChartAnnotationView *)self dataSource];
  uint64_t v11 = [v10 numberOfValuesForAnnotationView:self];

  if (v11 >= 1)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      objc_super v13 = [(HKInteractiveChartAnnotationView *)self dataSource];
      v14 = [v13 valueViewForColumnAtIndex:i orientation:0];

      v15 = [(HKInteractiveChartAnnotationView *)self columnLayout];
      [v15 setColumnView:v14 atIndex:i];
    }
  }
  v16 = [(HKInteractiveChartAnnotationView *)self columnLayout];
  [v16 clearViewsFromIndex:v11];

  id v17 = [(HKInteractiveChartAnnotationView *)self columnLayout];
  v18 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
  [v18 setContentView:v17];

  v19 = [(HKInteractiveChartAnnotationView *)self dataSource];
  id v28 = [v19 dateViewWithOrientation:1];

  v20 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
  v21 = v20;
  if (v28)
  {
    [v20 setDateView:v28];

    [v28 removeAllGestureRecognizers];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleCurrentTimeGesture_];
    [v28 addGestureRecognizer:v21];
    [v28 setUserInteractionEnabled:1];
    v22 = objc_msgSend(NSString, "hk_chartLollipopAccessibilityIdentifier:", @"Date");
    [v28 setAccessibilityIdentifier:v22];
  }
  else
  {
    [v20 setDateView:0];
  }

  v23 = [(HKInteractiveChartAnnotationView *)self dataSource];
  v24 = [v23 leftMarginViewWithOrientation:0];

  v25 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  [v25 setLeftMarginView:v24];

  v26 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
  v27 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  [v27 setBodyView:v26];

  [(HKInteractiveChartAnnotationView *)self _updateRightMarginViewWithInfoButton];
  [(HKInteractiveChartAnnotationView *)self _invalidateLayout];
}

- (void)_invalidateLayout
{
  [(HKInteractiveChartAnnotationView *)self invalidateIntrinsicContentSize];
  [(HKInteractiveChartAnnotationView *)self setNeedsLayout];
}

- (void)_removeViewsForRebuild
{
  BOOL v3 = [(HKInteractiveChartAnnotationView *)self columnLayout];
  [v3 clearViews];

  uint64_t v4 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
  [v4 setContentView:0];

  id v5 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
  [v5 setDateView:0];

  double v6 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  [v6 setLeftMarginView:0];

  double v7 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  [v7 setBodyView:0];

  id v8 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
  [v8 setRightMarginView:0];
}

- (void)scheduleDeferredDataReload
{
  objc_initWeak(&location, self);
  BOOL v3 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  double v7 = __62__HKInteractiveChartAnnotationView_scheduleDeferredDataReload__block_invoke;
  id v8 = &unk_1E6D51810;
  objc_copyWeak(&v9, &location);
  uint64_t v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v5 block:0.35];
  -[HKInteractiveChartAnnotationView setDeferredNoDataTimer:](self, "setDeferredNoDataTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__HKInteractiveChartAnnotationView_scheduleDeferredDataReload__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained deferredNoDataTimer];

    if (v6 == v3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__HKInteractiveChartAnnotationView_scheduleDeferredDataReload__block_invoke_2;
      block[3] = &unk_1E6D50ED8;
      block[4] = v5;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __62__HKInteractiveChartAnnotationView_scheduleDeferredDataReload__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (void)_cancelDeferredDataReload
{
  id v3 = [(HKInteractiveChartAnnotationView *)self deferredNoDataTimer];

  if (v3)
  {
    uint64_t v4 = [(HKInteractiveChartAnnotationView *)self deferredNoDataTimer];
    [v4 invalidate];

    [(HKInteractiveChartAnnotationView *)self setDeferredNoDataTimer:0];
  }
}

- (BOOL)_dataSourceHasNoData
{
  v2 = self;
  id v3 = [(HKInteractiveChartAnnotationView *)self dataSource];
  LOBYTE(v2) = [v3 numberOfValuesForAnnotationView:v2] == 0;

  return (char)v2;
}

- (void)showNoDataStatus
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HKInteractiveChartAnnotationView *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || ([(HKInteractiveChartAnnotationView *)self dataSource],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 pendingData],
        v5,
        (v6 & 1) == 0))
  {
    [(HKInteractiveChartAnnotationView *)self _removeViewsForRebuild];
    id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v26[0] = *MEMORY[0x1E4FB06F8];
    id v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueValueFont");
    v27[0] = v9;
    v26[1] = *MEMORY[0x1E4FB0700];
    double v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
    v27[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    objc_super v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = [v13 localizedStringForKey:@"CHART_NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v15 = (void *)[v12 initWithString:v14 attributes:v11];

    [v8 setAttributedText:v15];
    [v8 setAdjustsFontSizeToFitWidth:1];
    [v8 setMinimumScaleFactor:0.1];
    v16 = [(HKInteractiveChartAnnotationView *)self columnLayout];
    [v16 addColumnView:v8];

    id v17 = [(HKInteractiveChartAnnotationView *)self columnLayout];
    v18 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
    [v18 setContentView:v17];

    v19 = [(HKInteractiveChartAnnotationView *)self dataSource];
    v20 = [v19 dateViewWithOrientation:1];

    if (v20)
    {
      v21 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
      [v21 setDateView:v20];

      [v20 removeAllGestureRecognizers];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleCurrentTimeGesture_];
      [v20 addGestureRecognizer:v22];
      [v20 setUserInteractionEnabled:1];
      v23 = objc_msgSend(NSString, "hk_chartLollipopAccessibilityIdentifier:", @"Date");
      [v20 setAccessibilityIdentifier:v23];
    }
    v24 = [(HKInteractiveChartAnnotationView *)self dateContentLayout];
    v25 = [(HKInteractiveChartAnnotationView *)self bodyMarginsLayout];
    [v25 setBodyView:v24];

    [(HKInteractiveChartAnnotationView *)self _updateRightMarginViewWithInfoButton];
    [(HKInteractiveChartAnnotationView *)self _invalidateLayout];
  }
}

- (void)infoButtonPressed:(id)a3
{
  id v4 = [(HKInteractiveChartAnnotationView *)self delegate];
  [v4 didTapOnInfoButtonFromCurrentValueView:self];
}

- (void)handleCurrentTimeGesture:(id)a3
{
  id v4 = [(HKInteractiveChartAnnotationView *)self delegate];
  [v4 didTapOnDateFromCurrentValueView:self];
}

- (HKInteractiveChartAnnotationViewDataSourceProtocol)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HKInteractiveChartAnnotationViewDataSourceProtocol *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HKInteractiveChartAnnotationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKInteractiveChartAnnotationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsInfoButton
{
  return self->_showsInfoButton;
}

- (_HKAnnotationColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (void)setColumnLayout:(id)a3
{
}

- (_HKDateContentLayout)dateContentLayout
{
  return self->_dateContentLayout;
}

- (void)setDateContentLayout:(id)a3
{
}

- (_HKBodyMarginsLayout)bodyMarginsLayout
{
  return self->_bodyMarginsLayout;
}

- (void)setBodyMarginsLayout:(id)a3
{
}

- (void)setInfoButton:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)setLeadingMarginConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
}

- (NSTimer)deferredNoDataTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredNoDataTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setDeferredNoDataTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deferredNoDataTimer);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_bodyMarginsLayout, 0);
  objc_storeStrong((id *)&self->_dateContentLayout, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end