@interface CAMSmartStylePreviewViewController
+ (double)desiredCarouselRatio;
- (CAMSmartStylePreviewViewController)initWithDelegate:(id)a3 gridLayout:(unint64_t)a4 pageIndex:(int64_t)a5;
- (CAMSmartStylePreviewViewControllerDelegate)delegate;
- (NSString)description;
- (int64_t)pageIndex;
- (unint64_t)expandedItemIndex;
- (unint64_t)gridLayout;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setExpandedItemIndex:(unint64_t)a3;
- (void)setExpandedItemIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)smartStylePreviewGridView:(id)a3 didChangeAnimatingGrid:(BOOL)a4;
- (void)smartStylePreviewGridView:(id)a3 didTapItemAtIndex:(unint64_t)a4;
- (void)updateViewsWithLoadResults;
- (void)updateWithStyle:(id)a3;
@end

@implementation CAMSmartStylePreviewViewController

- (CAMSmartStylePreviewViewController)initWithDelegate:(id)a3 gridLayout:(unint64_t)a4 pageIndex:(int64_t)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMSmartStylePreviewViewController;
  v9 = [(CAMSmartStylePreviewViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_pageIndex = a5;
    v10->_gridLayout = a4;
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CAMSmartStylePreviewViewController;
  v4 = [(CAMSmartStylePreviewViewController *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: %ld", v4, -[CAMSmartStylePreviewViewController pageIndex](self, "pageIndex")];

  return (NSString *)v5;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)CAMSmartStylePreviewViewController;
  [(CAMSmartStylePreviewViewController *)&v5 loadView];
  v3 = [[CAMSmartStylePreviewGridView alloc] initWithLayout:[(CAMSmartStylePreviewViewController *)self gridLayout]];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"page=%lu", -[CAMSmartStylePreviewViewController pageIndex](self, "pageIndex"));
  [(CAMSmartStylePreviewGridView *)v3 setLogIdentifier:v4];

  [(CAMSmartStylePreviewGridView *)v3 setDelegate:self];
  [(CAMSmartStylePreviewViewController *)self setView:v3];
  [(CAMSmartStylePreviewViewController *)self updateViewsWithLoadResults];
}

- (void)updateViewsWithLoadResults
{
  unint64_t v3 = +[CAMSmartStylePreviewGridView gridItemCountForLayout:[(CAMSmartStylePreviewViewController *)self gridLayout]];
  if (v3)
  {
    unint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [(CAMSmartStylePreviewViewController *)self delegate];
      objc_super v7 = [v6 previewViewController:self requestsLoadResultForGridIndex:i];

      id v8 = [(CAMSmartStylePreviewViewController *)self _previewView];
      [v8 updateGridIndex:i withResourceLoadResult:v7];
    }
  }
}

- (unint64_t)expandedItemIndex
{
  v2 = [(CAMSmartStylePreviewViewController *)self _previewView];
  unint64_t v3 = [v2 expandedItemIndex];

  return v3;
}

- (void)setExpandedItemIndex:(unint64_t)a3
{
}

- (void)setExpandedItemIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CAMSmartStylePreviewViewController *)self _previewView];
  [v6 setExpandedItemIndex:a3 animated:v4];
}

- (void)updateWithStyle:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMSmartStylePreviewViewController *)self _previewView];
  [v5 setStyle:v4];
}

+ (double)desiredCarouselRatio
{
  return 1.0;
}

- (void)smartStylePreviewGridView:(id)a3 didTapItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 expandedItemIndex] == a4) {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v5 = a4;
  }
  [v6 setExpandedItemIndex:v5 animated:1];
}

- (void)smartStylePreviewGridView:(id)a3 didChangeAnimatingGrid:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CAMSmartStylePreviewViewController *)self delegate];
  [v6 previewViewController:self didChangeAnimatingGrid:v4];
}

- (CAMSmartStylePreviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSmartStylePreviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)gridLayout
{
  return self->_gridLayout;
}

- (int64_t)pageIndex
{
  return self->_pageIndex;
}

- (void).cxx_destruct
{
}

@end