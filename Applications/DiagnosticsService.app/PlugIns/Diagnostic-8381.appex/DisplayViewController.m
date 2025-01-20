@interface DisplayViewController
- (BOOL)isAnimatedScrolling;
- (BOOL)prefersStatusBarHidden;
- (CGRect)frameForConfirmation;
- (DKResponder)diagnosticResponder;
- (NSMutableArray)leadingImageViews;
- (NSMutableArray)trailingImageViews;
- (OS_dispatch_queue)animatedScrollingQueue;
- (UIColor)drawColor;
- (UIImageView)currentImageView;
- (UIScrollView)scrollView;
- (_UIContentUnavailableView)confirmPageView;
- (id)imageViewForPage:(int)a3;
- (id)labelForConfirmation;
- (int)maxNumPages;
- (int)page;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadLeading;
- (void)loadTrailing;
- (void)moveLeading;
- (void)moveTrailing;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAnimatedScrollingQueue:(id)a3;
- (void)setConfirmPageView:(id)a3;
- (void)setCurrentImageView:(id)a3;
- (void)setDiagnosticResponder:(id)a3;
- (void)setDrawColor:(id)a3;
- (void)setIsAnimatedScrolling:(BOOL)a3;
- (void)setLeadingImageViews:(id)a3;
- (void)setPage:(int)a3;
- (void)setScrollView:(id)a3;
- (void)setTrailingImageViews:(id)a3;
- (void)setupView;
- (void)unloadLeading;
- (void)unloadTrailing;
@end

@implementation DisplayViewController

- (void)setupView
{
  id v3 = objc_alloc((Class)UIScrollView);
  v4 = [(DisplayViewController *)self view];
  [v4 frame];
  id v5 = [v3 initWithFrame:];
  [(DisplayViewController *)self setScrollView:v5];

  v6 = [(DisplayViewController *)self scrollView];
  [v6 setPagingEnabled:1];

  v7 = [(DisplayViewController *)self scrollView];
  [v7 setShowsHorizontalScrollIndicator:0];

  v8 = [(DisplayViewController *)self scrollView];
  [v8 setShowsVerticalScrollIndicator:0];

  v9 = [(DisplayViewController *)self scrollView];
  [v9 setScrollsToTop:0];

  v10 = [(DisplayViewController *)self scrollView];
  [v10 setDelegate:self];

  id v11 = objc_alloc((Class)_UIContentUnavailableView);
  [(DisplayViewController *)self frameForConfirmation];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(DisplayViewController *)self labelForConfirmation];
  id v21 = [v11 initWithFrame:v20 title:1 style:v13, v15, v17, v19];
  [(DisplayViewController *)self setConfirmPageView:v21];

  v22 = +[UIColor whiteColor];
  v23 = [(DisplayViewController *)self confirmPageView];
  [v23 setBackgroundColor:v22];

  v24 = [(DisplayViewController *)self scrollView];
  v25 = [(DisplayViewController *)self confirmPageView];
  [v24 addSubview:v25];

  v26 = objc_opt_new();
  [(DisplayViewController *)self setLeadingImageViews:v26];

  v27 = objc_opt_new();
  [(DisplayViewController *)self setTrailingImageViews:v27];

  if ([(DisplayViewController *)self maxNumPages] >= 1)
  {
    v28 = [(DisplayViewController *)self imageViewForPage:0];
    [(DisplayViewController *)self setCurrentImageView:v28];

    v29 = [(DisplayViewController *)self scrollView];
    v30 = [(DisplayViewController *)self currentImageView];
    [v29 addSubview:v30];

    v31 = [(DisplayViewController *)self currentImageView];
    [(DisplayViewController *)self didUpdateCurrentImageView:v31];
  }
  if ([(DisplayViewController *)self maxNumPages] > 1) {
    [(DisplayViewController *)self loadTrailing];
  }
  id v33 = [(DisplayViewController *)self view];
  v32 = [(DisplayViewController *)self scrollView];
  [v33 addSubview:v32];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(DisplayViewController *)self animatedScrollingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000031EC;
  block[3] = &unk_100008260;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  [(DisplayViewController *)self handleViewDidEndDecelerating:v4];
  objc_initWeak(&location, self);
  id v5 = [(DisplayViewController *)self animatedScrollingQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000356C;
  v6[3] = &unk_100008288;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)moveTrailing
{
  id v3 = [(DisplayViewController *)self currentImageView];

  if (v3)
  {
    id v4 = [(DisplayViewController *)self leadingImageViews];
    id v5 = [(DisplayViewController *)self currentImageView];
    [v4 addObject:v5];
  }
  if ([(DisplayViewController *)self page] < 0
    || (int v6 = [(DisplayViewController *)self page], v6 >= [(DisplayViewController *)self maxNumPages]))
  {
    [(DisplayViewController *)self setCurrentImageView:0];
  }
  else
  {
    id v7 = [(DisplayViewController *)self trailingImageViews];
    id v8 = [v7 objectAtIndexedSubscript:0];
    [(DisplayViewController *)self setCurrentImageView:v8];

    id v9 = [(DisplayViewController *)self trailingImageViews];
    [v9 removeObjectAtIndex:0];
  }
  signed int v10 = [(DisplayViewController *)self page];
  if (v10 < [(DisplayViewController *)self maxNumPages] - 1) {
    [(DisplayViewController *)self loadTrailing];
  }
  id v11 = [(DisplayViewController *)self leadingImageViews];
  id v12 = [v11 count];

  if ((unint64_t)v12 >= 2) {
    [(DisplayViewController *)self unloadLeading];
  }
  id v13 = [(DisplayViewController *)self currentImageView];
  [(DisplayViewController *)self didUpdateCurrentImageView:v13];
}

- (void)loadTrailing
{
  id v5 = [(DisplayViewController *)self imageViewForPage:[(DisplayViewController *)self page] + 1];
  id v3 = [(DisplayViewController *)self trailingImageViews];
  [v3 addObject:v5];

  id v4 = [(DisplayViewController *)self scrollView];
  [v4 addSubview:v5];
}

- (void)unloadTrailing
{
  id v3 = [(DisplayViewController *)self trailingImageViews];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(DisplayViewController *)self trailingImageViews];
    int v6 = [v5 objectAtIndexedSubscript:0];
    [v6 removeFromSuperview];

    id v7 = [(DisplayViewController *)self trailingImageViews];
    [v7 removeObjectAtIndex:0];
  }
}

- (void)moveLeading
{
  id v3 = [(DisplayViewController *)self currentImageView];

  if (v3)
  {
    id v4 = [(DisplayViewController *)self trailingImageViews];
    id v5 = [(DisplayViewController *)self currentImageView];
    [v4 addObject:v5];
  }
  if ([(DisplayViewController *)self page] < 0
    || (int v6 = [(DisplayViewController *)self page], v6 >= [(DisplayViewController *)self maxNumPages]))
  {
    [(DisplayViewController *)self setCurrentImageView:0];
  }
  else
  {
    id v7 = [(DisplayViewController *)self leadingImageViews];
    id v8 = [v7 objectAtIndexedSubscript:0];
    [(DisplayViewController *)self setCurrentImageView:v8];

    id v9 = [(DisplayViewController *)self leadingImageViews];
    [v9 removeObjectAtIndex:0];
  }
  if ([(DisplayViewController *)self page] >= 1)
  {
    unsigned int v10 = [(DisplayViewController *)self page];
    if (v10 != [(DisplayViewController *)self maxNumPages]) {
      [(DisplayViewController *)self loadLeading];
    }
  }
  id v11 = [(DisplayViewController *)self trailingImageViews];
  id v12 = [v11 count];

  if ((unint64_t)v12 >= 2) {
    [(DisplayViewController *)self unloadTrailing];
  }
  id v13 = [(DisplayViewController *)self currentImageView];
  [(DisplayViewController *)self didUpdateCurrentImageView:v13];
}

- (void)loadLeading
{
  id v5 = [(DisplayViewController *)self imageViewForPage:[(DisplayViewController *)self page] - 1];
  id v3 = [(DisplayViewController *)self leadingImageViews];
  [v3 addObject:v5];

  id v4 = [(DisplayViewController *)self scrollView];
  [v4 addSubview:v5];
}

- (void)unloadLeading
{
  id v3 = [(DisplayViewController *)self leadingImageViews];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(DisplayViewController *)self leadingImageViews];
    int v6 = [v5 objectAtIndexedSubscript:0];
    [v6 removeFromSuperview];

    id v7 = [(DisplayViewController *)self leadingImageViews];
    [v7 removeObjectAtIndex:0];
  }
}

- (CGRect)frameForConfirmation
{
  v2 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"You must override %@ in a subclass", v2 format];

  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)labelForConfirmation
{
  return @"n/a";
}

- (id)imageViewForPage:(int)a3
{
  id v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"You must override %@ in a subclass", v3 format];

  return 0;
}

- (int)maxNumPages
{
  v2 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"You must override %@ in a subclass", v2 format];

  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (int)page
{
  return self->_page;
}

- (void)setPage:(int)a3
{
  self->_page = a3;
}

- (NSMutableArray)leadingImageViews
{
  return self->_leadingImageViews;
}

- (void)setLeadingImageViews:(id)a3
{
}

- (UIImageView)currentImageView
{
  return self->_currentImageView;
}

- (void)setCurrentImageView:(id)a3
{
}

- (NSMutableArray)trailingImageViews
{
  return self->_trailingImageViews;
}

- (void)setTrailingImageViews:(id)a3
{
}

- (UIColor)drawColor
{
  return self->_drawColor;
}

- (void)setDrawColor:(id)a3
{
}

- (BOOL)isAnimatedScrolling
{
  return self->_isAnimatedScrolling;
}

- (void)setIsAnimatedScrolling:(BOOL)a3
{
  self->_isAnimatedScrolling = a3;
}

- (OS_dispatch_queue)animatedScrollingQueue
{
  return self->_animatedScrollingQueue;
}

- (void)setAnimatedScrollingQueue:(id)a3
{
}

- (_UIContentUnavailableView)confirmPageView
{
  return self->_confirmPageView;
}

- (void)setConfirmPageView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (DKResponder)diagnosticResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diagnosticResponder);

  return (DKResponder *)WeakRetained;
}

- (void)setDiagnosticResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_diagnosticResponder);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_confirmPageView, 0);
  objc_storeStrong((id *)&self->_animatedScrollingQueue, 0);
  objc_storeStrong((id *)&self->_drawColor, 0);
  objc_storeStrong((id *)&self->_trailingImageViews, 0);
  objc_storeStrong((id *)&self->_currentImageView, 0);

  objc_storeStrong((id *)&self->_leadingImageViews, 0);
}

@end