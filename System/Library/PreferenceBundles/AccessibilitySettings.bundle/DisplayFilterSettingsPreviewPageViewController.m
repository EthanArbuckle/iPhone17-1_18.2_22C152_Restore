@interface DisplayFilterSettingsPreviewPageViewController
- (DisplayFilterPageControllerDelegate)displayFilterPageDelegate;
- (DisplayFilterSettingsPreviewPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5;
- (double)pageHeight;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (id)viewControllerAtIndex:(unint64_t)a3;
- (int64_t)currentPage;
- (int64_t)indexOfViewController:(id)a3;
- (int64_t)pageCount;
- (void)_setControllers;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)setCurrentPage:(int64_t)a3;
- (void)setDisplayFilterPageDelegate:(id)a3;
- (void)setPageHeight:(double)a3;
- (void)viewDidLoad;
@end

@implementation DisplayFilterSettingsPreviewPageViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)DisplayFilterSettingsPreviewPageViewController;
  [(DisplayFilterSettingsPreviewPageViewController *)&v4 viewDidLoad];
  v3 = [(DisplayFilterSettingsPreviewPageViewController *)self view];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, 200.0, 200.0);
}

- (DisplayFilterSettingsPreviewPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)DisplayFilterSettingsPreviewPageViewController;
  v5 = [(DisplayFilterSettingsPreviewPageViewController *)&v7 initWithTransitionStyle:1 navigationOrientation:0 options:a5];
  [(DisplayFilterSettingsPreviewPageViewController *)v5 setDataSource:v5];
  [(DisplayFilterSettingsPreviewPageViewController *)v5 setDelegate:v5];
  [(DisplayFilterSettingsPreviewPageViewController *)v5 _setControllers];
  return v5;
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  objc_super v7 = [(DisplayFilterSettingsPreviewPageViewController *)self viewControllers];
  id v10 = [v7 firstObject];

  int64_t v8 = [(DisplayFilterSettingsPreviewPageViewController *)self indexOfViewController:v10];
  v9 = [(DisplayFilterSettingsPreviewPageViewController *)self displayFilterPageDelegate];
  [v9 didSelectDisplayFilterPage:v8];
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  int64_t v5 = [(DisplayFilterSettingsPreviewPageViewController *)self indexOfViewController:a4];
  if (v5) {
    uint64_t v6 = v5 - 1;
  }
  else {
    uint64_t v6 = 2;
  }
  objc_super v7 = [(DisplayFilterSettingsPreviewPageViewController *)self viewControllerAtIndex:v6];

  return v7;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  int64_t v5 = [(DisplayFilterSettingsPreviewPageViewController *)self indexOfViewController:a4];
  if (v5 == 2) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = v5 + 1;
  }
  objc_super v7 = [(DisplayFilterSettingsPreviewPageViewController *)self viewControllerAtIndex:v6];

  return v7;
}

- (void)_setControllers
{
  v3 = [(DisplayFilterSettingsPreviewPageViewController *)self viewControllerAtIndex:0];
  int64_t v5 = v3;
  objc_super v4 = +[NSArray arrayWithObjects:&v5 count:1];
  [(DisplayFilterSettingsPreviewPageViewController *)self setViewControllers:v4 direction:0 animated:0 completion:0];
}

- (int64_t)pageCount
{
  return 3;
}

- (void)setCurrentPage:(int64_t)a3
{
  objc_super v4 = [(DisplayFilterSettingsPreviewPageViewController *)self viewControllerAtIndex:a3];
  int64_t v6 = v4;
  int64_t v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [(DisplayFilterSettingsPreviewPageViewController *)self setViewControllers:v5 direction:0 animated:0 completion:0];
}

- (int64_t)currentPage
{
  v3 = [(DisplayFilterSettingsPreviewPageViewController *)self viewControllers];
  objc_super v4 = [v3 firstObject];
  int64_t v5 = [(DisplayFilterSettingsPreviewPageViewController *)self indexOfViewController:v4];

  return v5;
}

- (int64_t)indexOfViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = [v3 pageIndex];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)setPageHeight:(double)a3
{
  self->_pageHeight = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(DisplayFilterSettingsPreviewPageViewController *)self viewControllers];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      int64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 setPageHeight:a3];
        }
        int64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)viewControllerAtIndex:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v5 = [DisplayFilterPageImageViewController alloc];
    CFStringRef v6 = @"colorFilterPreview";
    uint64_t v7 = 1;
  }
  else
  {
    if (a3)
    {
      int64_t v8 = objc_alloc_init(DisplayFilterPageGridViewController);
      goto LABEL_7;
    }
    id v5 = [DisplayFilterPageImageViewController alloc];
    CFStringRef v6 = @"coloredPencils";
    uint64_t v7 = 0;
  }
  int64_t v8 = [(DisplayFilterPageImageViewController *)v5 initWithImageName:v6 stretchHorizontal:v7];
LABEL_7:
  v9 = v8;
  [(DisplayFilterPageViewController *)v8 setPageIndex:a3];
  [(DisplayFilterSettingsPreviewPageViewController *)self pageHeight];
  -[DisplayFilterPageGridViewController setPageHeight:](v9, "setPageHeight:");

  return v9;
}

- (double)pageHeight
{
  return self->_pageHeight;
}

- (DisplayFilterPageControllerDelegate)displayFilterPageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayFilterPageDelegate);

  return (DisplayFilterPageControllerDelegate *)WeakRetained;
}

- (void)setDisplayFilterPageDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end