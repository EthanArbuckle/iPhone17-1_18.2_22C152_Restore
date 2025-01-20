@interface HUCalendarScrubberViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (HUCalendarScrubberDataSource)dataSource;
- (HUCalendarScrubberViewController)initWithCoder:(id)a3;
- (HUCalendarScrubberViewController)initWithCollectionViewLayout:(id)a3;
- (HUCalendarScrubberViewController)initWithDataSource:(id)a3;
- (HUCalendarScrubberViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HUCalendarScrubberViewDelegate)scrubberDelegate;
- (double)lastBoundsWidth;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)scrollCompletionBlock;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)currentSection;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)nextSection;
- (unint64_t)previousSection;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)jumpToSection:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrubberDataSourceDidReload:(id)a3;
- (void)setCurrentSection:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setLastBoundsWidth:(double)a3;
- (void)setScrollCompletionBlock:(id)a3;
- (void)setScrubberDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUCalendarScrubberViewController

- (HUCalendarScrubberViewController)initWithDataSource:(id)a3
{
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setScrollDirection:1];
  objc_msgSend(v6, "setSectionInset:", 0.0, 20.0, 0.0, 20.0);
  [v6 setMinimumLineSpacing:16.0];
  v10.receiver = self;
  v10.super_class = (Class)HUCalendarScrubberViewController;
  v7 = [(HUCalendarScrubberViewController *)&v10 initWithCollectionViewLayout:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataSource, a3);
    [(HUCalendarScrubberDataSource *)v8->_dataSource addChangeObserver:v8];
  }

  return v8;
}

- (HUCalendarScrubberViewController)initWithCoder:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithDataSource_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCalendarScrubberViewController.m", 54, @"%s is unavailable; use %@ instead",
    "-[HUCalendarScrubberViewController initWithCoder:]",
    v6);

  return 0;
}

- (HUCalendarScrubberViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDataSource_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCalendarScrubberViewController.m", 58, @"%s is unavailable; use %@ instead",
    "-[HUCalendarScrubberViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUCalendarScrubberViewController)initWithCollectionViewLayout:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithDataSource_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCalendarScrubberViewController.m", 62, @"%s is unavailable; use %@ instead",
    "-[HUCalendarScrubberViewController initWithCollectionViewLayout:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)HUCalendarScrubberViewController;
  [(HUCalendarScrubberViewController *)&v9 viewDidLoad];
  [(HUCalendarScrubberViewController *)self setCurrentSection:0];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  v4 = [(HUCalendarScrubberViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  id v5 = [(HUCalendarScrubberViewController *)self collectionView];
  [v5 setPagingEnabled:1];

  v6 = [(HUCalendarScrubberViewController *)self collectionView];
  [v6 setShowsHorizontalScrollIndicator:0];

  v7 = [(HUCalendarScrubberViewController *)self collectionView];
  [v7 setSemanticContentAttribute:3];

  v8 = [(HUCalendarScrubberViewController *)self collectionView];
  [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CalendarScrubberCell"];
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)HUCalendarScrubberViewController;
  [(HUCalendarScrubberViewController *)&v15 viewDidLayoutSubviews];
  [(HUCalendarScrubberViewController *)self lastBoundsWidth];
  v3 = [(HUCalendarScrubberViewController *)self collectionView];
  [v3 bounds];
  char v4 = NACGFloatEqualToFloat();

  if ((v4 & 1) == 0)
  {
    id v5 = [(HUCalendarScrubberViewController *)self collectionView];
    [v5 bounds];
    [(HUCalendarScrubberViewController *)self setLastBoundsWidth:v6];

    v7 = [(HUCalendarScrubberViewController *)self collectionView];
    [v7 bounds];
    double v9 = (v8 + -168.0) * 0.125;

    double v10 = fmax(v9, 0.0);
    v11 = [(HUCalendarScrubberViewController *)self collectionViewLayout];
    [v11 setMinimumLineSpacing:v10];

    v12 = [(HUCalendarScrubberViewController *)self collectionViewLayout];
    objc_msgSend(v12, "setSectionInset:", 0.0, v10, 0.0, v10);

    v13 = [(HUCalendarScrubberViewController *)self collectionView];
    [v13 reloadData];

    v14 = [(HUCalendarScrubberViewController *)self collectionViewLayout];
    [v14 invalidateLayout];
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)HUCalendarScrubberViewController;
  [(HUCalendarScrubberViewController *)&v2 didReceiveMemoryWarning];
}

- (unint64_t)nextSection
{
  uint64_t v3 = [(HUCalendarScrubberViewController *)self currentSection];
  char v4 = [(HUCalendarScrubberViewController *)self collectionView];
  if (v3 >= [v4 numberOfSections] - 1) {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v5 = [(HUCalendarScrubberViewController *)self currentSection] + 1;
  }

  return v5;
}

- (unint64_t)previousSection
{
  if ([(HUCalendarScrubberViewController *)self currentSection] < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return [(HUCalendarScrubberViewController *)self currentSection] - 1;
  }
}

- (void)jumpToSection:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v20 = a5;
  double v8 = [(HUCalendarScrubberViewController *)self collectionView];
  unint64_t v9 = [v8 numberOfSections];

  double v10 = v20;
  if (v9 > a3)
  {
    v11 = [(HUCalendarScrubberViewController *)self collectionView];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;

    v16 = [(HUCalendarScrubberViewController *)self collectionView];
    [v16 contentOffset];
    double v18 = v17;

    v19 = [(HUCalendarScrubberViewController *)self collectionView];
    objc_msgSend(v19, "scrollRectToVisible:animated:", v5, v13 * (double)a3, 0.0, v13, v15);

    if (v5 && vabdd_f64(v13 * (double)a3, v18) > 0.00000011920929)
    {
      [(HUCalendarScrubberViewController *)self setScrollCompletionBlock:v20];
    }
    else if (v20)
    {
      (*((void (**)(id, uint64_t))v20 + 2))(v20, 1);
    }
    [(HUCalendarScrubberViewController *)self setCurrentSection:a3];
    double v10 = v20;
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v3 = [(HUCalendarScrubberViewController *)self dataSource];
  int64_t v4 = [v3 totalNumberOfWeeks];

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"CalendarScrubberCell" forIndexPath:v6];
  double v8 = [(HUCalendarScrubberViewController *)self dataSource];
  uint64_t v9 = [v8 dayOfMonthForItemAtIndexPath:v6];
  double v10 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%li", v9);
  [v7 setDateString:v10];

  if (v9 == 1) {
    [v8 shortMonthNameForItemAtIndexPath:v6];
  }
  else {
  v11 = [v8 dayOfWeekForItemAtIndexPath:v6];
  }
  [v7 setDayOfWeekString:v11];

  objc_msgSend(v7, "setEnabled:", objc_msgSend(v8, "eventExistsForItemAtIndexPath:", v6));

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUCalendarScrubberViewController *)self scrubberDelegate];
  [v6 scrubberViewController:self didSelectItemAtIndex:v5];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HUCalendarScrubberViewController;
  id v7 = a4;
  -[HUCalendarScrubberViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__HUCalendarScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6385548;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __87__HUCalendarScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionViewLayout];
  [v1 invalidateLayout];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v5 = [(HUCalendarScrubberViewController *)self collectionView];
  [v5 bounds];
  double v7 = v6;

  double v8 = 24.0;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  int64_t v4 = [(HUCalendarScrubberViewController *)self collectionView];
  uint64_t v5 = [(HUCalendarScrubberViewController *)self collectionView];
  [(id)v5 bounds];
  double MidX = CGRectGetMidX(v12);
  double v7 = [(HUCalendarScrubberViewController *)self collectionView];
  [v7 bounds];
  objc_msgSend(v4, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v13));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  -[HUCalendarScrubberViewController setCurrentSection:](self, "setCurrentSection:", [v10 section]);
  double v8 = [(HUCalendarScrubberViewController *)self scrubberDelegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    double v9 = [(HUCalendarScrubberViewController *)self scrubberDelegate];
    objc_msgSend(v9, "scrubberViewController:didMoveToSection:", self, -[HUCalendarScrubberViewController currentSection](self, "currentSection"));
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  int64_t v4 = [(HUCalendarScrubberViewController *)self scrollCompletionBlock];

  if (v4)
  {
    uint64_t v5 = [(HUCalendarScrubberViewController *)self scrollCompletionBlock];
    v5[2](v5, 1);

    [(HUCalendarScrubberViewController *)self setScrollCompletionBlock:0];
  }
}

- (void)scrubberDataSourceDidReload:(id)a3
{
  id v3 = [(HUCalendarScrubberViewController *)self collectionView];
  [v3 reloadData];
}

- (HUCalendarScrubberDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (HUCalendarScrubberViewDelegate)scrubberDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubberDelegate);

  return (HUCalendarScrubberViewDelegate *)WeakRetained;
}

- (void)setScrubberDelegate:(id)a3
{
}

- (int64_t)currentSection
{
  return self->_currentSection;
}

- (void)setCurrentSection:(int64_t)a3
{
  self->_currentSection = a3;
}

- (id)scrollCompletionBlock
{
  return self->_scrollCompletionBlock;
}

- (void)setScrollCompletionBlock:(id)a3
{
}

- (double)lastBoundsWidth
{
  return self->_lastBoundsWidth;
}

- (void)setLastBoundsWidth:(double)a3
{
  self->_lastBoundsWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scrollCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_scrubberDelegate);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end