@interface HKInteractiveChartsMonthViewController
- (HKHealthStore)healthStore;
- (HKInteractiveChartsMonthViewController)initWithHealthStore:(id)a3 dateCache:(id)a4 date:(id)a5;
- (HKSampleType)sampleType;
- (HKWeekdayHeaderPaletteView)weekdayHeaderPaletteView;
- (NSPredicate)additionalSamplePredicate;
- (UIColor)sampleColor;
- (_UINavigationControllerPalette)containingPalette;
- (void)calendarScrollViewController:(id)a3 accessoryViewForDate:(id)a4 accessoryViewCompletion:(id)a5;
- (void)didTapTodayButton;
- (void)dismissViewController:(id)a3;
- (void)setAdditionalSamplePredicate:(id)a3;
- (void)setContainingPalette:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setSampleColor:(id)a3;
- (void)setSampleType:(id)a3;
- (void)setWeekdayHeaderPaletteView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HKInteractiveChartsMonthViewController

- (HKInteractiveChartsMonthViewController)initWithHealthStore:(id)a3 dateCache:(id)a4 date:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKInteractiveChartsMonthViewController;
  v9 = [(HKMonthViewController *)&v12 initWithDateCache:a4 date:a5];
  v10 = v9;
  if (v9)
  {
    [(HKInteractiveChartsMonthViewController *)v9 setHealthStore:v8];
    [(HKMonthViewController *)v10 setTitleAlignment:1];
  }

  return v10;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)HKInteractiveChartsMonthViewController;
  [(HKMonthViewController *)&v19 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissViewController_];
  v4 = [(HKInteractiveChartsMonthViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"TODAY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v8 = (void *)[v5 initWithTitle:v7 style:2 target:self action:sel_didTapTodayButton];
  v9 = [(HKInteractiveChartsMonthViewController *)self navigationItem];
  [v9 setLeftBarButtonItem:v8];

  v10 = [HKWeekdayHeaderPaletteView alloc];
  v11 = -[HKWeekdayHeaderPaletteView initWithFrame:shouldSupportRTL:](v10, "initWithFrame:shouldSupportRTL:", HKUICalendarLocaleIsRightToLeft(), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HKInteractiveChartsMonthViewController *)self setWeekdayHeaderPaletteView:v11];

  objc_super v12 = [(HKInteractiveChartsMonthViewController *)self navigationController];
  +[HKWeekdayHeaderPaletteView preferredHeight];
  v14 = objc_msgSend(v12, "paletteForEdge:size:", 2, 0.0, v13);
  [(HKInteractiveChartsMonthViewController *)self setContainingPalette:v14];

  v15 = [(HKInteractiveChartsMonthViewController *)self containingPalette];
  v16 = [(HKInteractiveChartsMonthViewController *)self weekdayHeaderPaletteView];
  [v15 addSubview:v16];

  v17 = [(HKInteractiveChartsMonthViewController *)self navigationController];
  v18 = [(HKInteractiveChartsMonthViewController *)self containingPalette];
  [v17 attachPalette:v18 isPinned:1];
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)HKInteractiveChartsMonthViewController;
  [(HKMonthViewController *)&v8 viewWillLayoutSubviews];
  v3 = [(HKInteractiveChartsMonthViewController *)self containingPalette];
  [v3 bounds];
  double Width = CGRectGetWidth(v9);
  +[HKWeekdayHeaderPaletteView preferredHeight];
  double v6 = v5;
  v7 = [(HKInteractiveChartsMonthViewController *)self weekdayHeaderPaletteView];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, Width, v6);
}

- (void)dismissViewController:(id)a3
{
  id v5 = [(HKMonthViewController *)self delegate];
  v4 = [(HKMonthViewController *)self currentDate];
  [v5 monthViewController:self didSelectDate:v4];
}

- (void)calendarScrollViewController:(id)a3 accessoryViewForDate:(id)a4 accessoryViewCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  CGRect v9 = [(HKInteractiveChartsMonthViewController *)self sampleType];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v11 = [MEMORY[0x1E4F2B3C0] predicateForSamplesForDayFromDate:v7 calendar:v10 options:0];
    objc_super v12 = [(HKInteractiveChartsMonthViewController *)self additionalSamplePredicate];

    if (v12)
    {
      double v13 = [(HKInteractiveChartsMonthViewController *)self additionalSamplePredicate];
      uint64_t v14 = HKUIPredicateMatchingPredicates(v11, v13);

      v11 = (void *)v14;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F2B440]);
    v16 = [(HKInteractiveChartsMonthViewController *)self sampleType];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __116__HKInteractiveChartsMonthViewController_calendarScrollViewController_accessoryViewForDate_accessoryViewCompletion___block_invoke;
    v19[3] = &unk_1E6D51368;
    id v20 = v7;
    v21 = self;
    id v22 = v8;
    v17 = (void *)[v15 initWithSampleType:v16 predicate:v11 limit:1 sortDescriptors:0 resultsHandler:v19];

    v18 = [(HKInteractiveChartsMonthViewController *)self healthStore];
    [v18 executeQuery:v17];
  }
}

void __116__HKInteractiveChartsMonthViewController_calendarScrollViewController_accessoryViewForDate_accessoryViewCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 count])
  {
    v4 = [MEMORY[0x1E4F28F08] mainQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __116__HKInteractiveChartsMonthViewController_calendarScrollViewController_accessoryViewForDate_accessoryViewCompletion___block_invoke_2;
    v8[3] = &unk_1E6D51340;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    [v4 addOperationWithBlock:v8];
  }
}

void __116__HKInteractiveChartsMonthViewController_calendarScrollViewController_accessoryViewForDate_accessoryViewCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [WDInteractiveChartsMonthViewControllerIndicatorView alloc];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v20 = -[WDInteractiveChartsMonthViewControllerIndicatorView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], v4, v5, v6);
  [(WDInteractiveChartsMonthViewControllerIndicatorView *)v20 setDate:*(void *)(a1 + 32)];
  id v7 = -[WDInteractiveChartsMonthViewControllerIndicatorDotView initWithFrame:]([WDInteractiveChartsMonthViewControllerIndicatorDotView alloc], "initWithFrame:", v3, v4, v5, v6);
  [(WDInteractiveChartsMonthViewControllerIndicatorDotView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [*(id *)(a1 + 40) sampleColor];
  [(WDInteractiveChartsMonthViewControllerIndicatorDotView *)v7 setBackgroundColor:v8];

  id v9 = [(WDInteractiveChartsMonthViewControllerIndicatorDotView *)v7 layer];
  [v9 setCornerRadius:5.0];

  [(WDInteractiveChartsMonthViewControllerIndicatorView *)v20 addSubview:v7];
  uint64_t v10 = [(WDInteractiveChartsMonthViewControllerIndicatorDotView *)v7 heightAnchor];
  id v11 = [v10 constraintEqualToConstant:10.0];
  [v11 setActive:1];

  objc_super v12 = [(WDInteractiveChartsMonthViewControllerIndicatorDotView *)v7 widthAnchor];
  double v13 = [v12 constraintEqualToConstant:10.0];
  [v13 setActive:1];

  uint64_t v14 = [(WDInteractiveChartsMonthViewControllerIndicatorDotView *)v7 centerXAnchor];
  id v15 = [(WDInteractiveChartsMonthViewControllerIndicatorView *)v20 centerXAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [(WDInteractiveChartsMonthViewControllerIndicatorDotView *)v7 centerYAnchor];
  v18 = [(WDInteractiveChartsMonthViewControllerIndicatorView *)v20 centerYAnchor];
  objc_super v19 = [v17 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)didTapTodayButton
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(HKMonthViewController *)self setCurrentDate:v3 animateIfPossible:1];
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (void)setSampleType:(id)a3
{
}

- (UIColor)sampleColor
{
  return self->_sampleColor;
}

- (void)setSampleColor:(id)a3
{
}

- (NSPredicate)additionalSamplePredicate
{
  return self->_additionalSamplePredicate;
}

- (void)setAdditionalSamplePredicate:(id)a3
{
}

- (_UINavigationControllerPalette)containingPalette
{
  return self->_containingPalette;
}

- (void)setContainingPalette:(id)a3
{
}

- (HKWeekdayHeaderPaletteView)weekdayHeaderPaletteView
{
  return self->_weekdayHeaderPaletteView;
}

- (void)setWeekdayHeaderPaletteView:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_weekdayHeaderPaletteView, 0);
  objc_storeStrong((id *)&self->_containingPalette, 0);
  objc_storeStrong((id *)&self->_additionalSamplePredicate, 0);
  objc_storeStrong((id *)&self->_sampleColor, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

@end