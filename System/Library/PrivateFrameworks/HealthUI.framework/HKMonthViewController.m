@interface HKMonthViewController
- (BOOL)wantsShortTitleDate;
- (HKCalendarScrollViewController)calendarScrollViewController;
- (HKDateCache)dateCache;
- (HKMonthViewController)initWithCoder:(id)a3;
- (HKMonthViewController)initWithDateCache:(id)a3 date:(id)a4;
- (HKMonthViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HKMonthViewControllerDelegate)delegate;
- (NSDate)currentDate;
- (UILabel)titleLabel;
- (id)_titleStringForDate:(id)a3;
- (int64_t)titleAlignment;
- (void)_didTapBackButton;
- (void)_setCurrentDate:(id)a3;
- (void)_updateBackButton;
- (void)_updateCurrentMonthBarButtonItemWithDate:(id)a3;
- (void)calendarScrollViewController:(id)a3 didSelectDate:(id)a4;
- (void)calendarScrollViewController:(id)a3 didUpdateCenteredMonth:(id)a4;
- (void)createCalendarScrollViewController;
- (void)createTitleLabel;
- (void)setCalendarScrollViewController:(id)a3;
- (void)setCurrentDate:(id)a3 animateIfPossible:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setTitleAlignment:(int64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)setWantsShortTitleDate:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HKMonthViewController

- (HKMonthViewController)initWithDateCache:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMonthViewController;
  v9 = [(HKMonthViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateCache, a3);
    objc_storeStrong((id *)&v10->_currentDate, a4);
    [(HKMonthViewController *)v10 _updateBackButton];
    [(HKMonthViewController *)v10 createCalendarScrollViewController];
    [(HKMonthViewController *)v10 setTitleAlignment:4];
  }

  return v10;
}

- (void)createCalendarScrollViewController
{
  v3 = [[HKCalendarScrollViewController alloc] initWithSelectedDate:self->_currentDate];
  [(HKMonthViewController *)self setCalendarScrollViewController:v3];

  v4 = [(HKMonthViewController *)self calendarScrollViewController];
  [v4 setDelegate:self];

  id v5 = [(HKMonthViewController *)self calendarScrollViewController];
  [(HKMonthViewController *)self addChildViewController:v5];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HKMonthViewController;
  [(HKMonthViewController *)&v7 viewDidLoad];
  v3 = [(HKMonthViewController *)self view];
  v4 = [(HKMonthViewController *)self calendarScrollViewController];
  id v5 = [v4 view];
  [v3 addSubview:v5];

  v6 = [(HKMonthViewController *)self calendarScrollViewController];
  [v6 didMoveToParentViewController:self];

  [(HKMonthViewController *)self createTitleLabel];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HKMonthViewController;
  [(HKMonthViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(HKMonthViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(HKMonthViewController *)self calendarScrollViewController];
  v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)createTitleLabel
{
  if ([(HKMonthViewController *)self titleAlignment] == 1)
  {
    id v11 = [(HKMonthViewController *)self currentDate];
    v3 = HKLocalizedStringForDateAndTemplate(v11, 1);
    double v4 = [(HKMonthViewController *)self navigationItem];
    [v4 setTitle:v3];
  }
  else
  {
    if ([(HKMonthViewController *)self titleAlignment] != 4) {
      return;
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(HKMonthViewController *)self setTitleLabel:v5];

    double v6 = [(HKMonthViewController *)self currentDate];
    double v7 = [(HKMonthViewController *)self _titleStringForDate:v6];
    double v8 = [(HKMonthViewController *)self titleLabel];
    [v8 setAttributedText:v7];

    double v9 = [(HKMonthViewController *)self titleLabel];
    [v9 sizeToFit];

    id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v11 = [(HKMonthViewController *)self titleLabel];
    v3 = objc_msgSend(v10, "initWithCustomView:");
    double v4 = [(HKMonthViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];
  }
}

- (HKMonthViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  double v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HKMonthViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKMonthViewController;
  return [(HKMonthViewController *)&v4 initWithCoder:a3];
}

- (void)setCurrentDate:(id)a3 animateIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(HKMonthViewController *)self _setCurrentDate:v6];
  id v7 = [(HKMonthViewController *)self calendarScrollViewController];
  [v7 scrollToDate:v6 animateIfPossible:v4];
}

- (void)_setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
  [(HKMonthViewController *)self _updateBackButton];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKMonthViewController;
  [(HKMonthViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKMonthViewController *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      double v9 = [(HKMonthViewController *)self delegate];
      [v9 monthViewController:self didSelectDate:self->_currentDate];
    }
  }
}

- (void)calendarScrollViewController:(id)a3 didSelectDate:(id)a4
{
  id v5 = a4;
  [(HKMonthViewController *)self _setCurrentDate:v5];
  id v6 = [(HKMonthViewController *)self delegate];
  [v6 monthViewController:self didSelectDate:v5];
}

- (void)calendarScrollViewController:(id)a3 didUpdateCenteredMonth:(id)a4
{
}

- (void)_updateBackButton
{
  v3 = [(HKMonthViewController *)self currentDate];
  id v4 = [(HKMonthViewController *)self dateCache];
  HKRelativeMonthYearText(v3, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v7 style:0 target:self action:sel__didTapBackButton];
  id v6 = [(HKMonthViewController *)self navigationItem];
  [v6 setBackBarButtonItem:v5];
}

- (void)_updateCurrentMonthBarButtonItemWithDate:(id)a3
{
  id v12 = a3;
  id v4 = [(HKMonthViewController *)self dateCache];
  id v5 = [v4 calendar];
  id v6 = [v5 components:12 fromDate:v12];

  p_cachedDateComponents = &self->_cachedDateComponents;
  if (([(NSDateComponents *)self->_cachedDateComponents isEqual:v6] & 1) == 0)
  {
    if ([(HKMonthViewController *)self titleAlignment] == 1)
    {
      char v8 = HKLocalizedStringForDateAndTemplate(v12, 1);
      double v9 = [(HKMonthViewController *)self navigationItem];
      [v9 setTitle:v8];
    }
    else
    {
      if ([(HKMonthViewController *)self titleAlignment] != 4)
      {
LABEL_7:
        objc_storeStrong((id *)p_cachedDateComponents, v6);
        goto LABEL_8;
      }
      objc_super v10 = [(HKMonthViewController *)self titleLabel];
      id v11 = [(HKMonthViewController *)self _titleStringForDate:v12];
      [v10 setAttributedText:v11];

      char v8 = [(HKMonthViewController *)self titleLabel];
      [v8 sizeToFit];
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (id)_titleStringForDate:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = HKLocalizedStringForDateAndTemplate(v3, 6);
  id v5 = HKLocalizedStringForDateAndTemplate(v3, 5);
  id v6 = HKLocalizedStringForDateAndTemplate(v3, 1);

  uint64_t v7 = [v4 rangeOfString:v5];
  uint64_t v9 = v8;
  uint64_t v10 = [v4 rangeOfString:v6];
  uint64_t v12 = v11;
  id v13 = objc_alloc(MEMORY[0x1E4F28E48]);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v38[0] = *MEMORY[0x1E4FB06F8];
    v26 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0 weight:*MEMORY[0x1E4FB09D8]];
    v39[0] = v26;
    v38[1] = *MEMORY[0x1E4FB0700];
    v27 = [MEMORY[0x1E4FB1618] labelColor];
    v39[1] = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    v17 = (void *)[v13 initWithString:v4 attributes:v28];
  }
  else
  {
    uint64_t v35 = v9;
    uint64_t v36 = v12;
    uint64_t v14 = *MEMORY[0x1E4FB0700];
    uint64_t v44 = *MEMORY[0x1E4FB0700];
    v15 = [MEMORY[0x1E4FB1618] labelColor];
    v45[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    v17 = (void *)[v13 initWithString:v4 attributes:v16];

    uint64_t v18 = *MEMORY[0x1E4FB2788];
    BOOL IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E4FB2788]);
    v20 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v21 = *MEMORY[0x1E4FB28C8];
    v37 = v5;
    if (IsLargerThanSizeCategory)
    {
      v22 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v18];
      v23 = [v20 preferredFontForTextStyle:v21 compatibleWithTraitCollection:v22];
      [v23 _scaledValueForValue:17.0];
      double v25 = v24;
    }
    else
    {
      v22 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v21];
      [v22 _scaledValueForValue:17.0];
      double v25 = v29;
    }

    v42[0] = *MEMORY[0x1E4FB06F8];
    uint64_t v30 = v42[0];
    v31 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v25 weight:*MEMORY[0x1E4FB09D0]];
    v42[1] = v14;
    v43[0] = v31;
    v32 = [MEMORY[0x1E4FB1618] labelColor];
    v43[1] = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
    objc_msgSend(v17, "setAttributes:range:", v33, v7, v35);

    v40[0] = v30;
    v26 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v25 weight:*MEMORY[0x1E4FB09F8]];
    v40[1] = v14;
    v41[0] = v26;
    v27 = [MEMORY[0x1E4FB1618] labelColor];
    v41[1] = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
    objc_msgSend(v17, "setAttributes:range:", v28, v10, v36);
    id v5 = v37;
  }

  return v17;
}

- (void)_didTapBackButton
{
  id v3 = [(HKMonthViewController *)self delegate];
  [v3 didTapBackButtonForMonthViewController:self];
}

- (HKMonthViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKMonthViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (BOOL)wantsShortTitleDate
{
  return self->_wantsShortTitleDate;
}

- (void)setWantsShortTitleDate:(BOOL)a3
{
  self->_wantsShortTitleDate = a3;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (void)setTitleAlignment:(int64_t)a3
{
  self->_titleAlignment = a3;
}

- (HKCalendarScrollViewController)calendarScrollViewController
{
  return self->_calendarScrollViewController;
}

- (void)setCalendarScrollViewController:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_calendarScrollViewController, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedDateComponents, 0);
}

@end