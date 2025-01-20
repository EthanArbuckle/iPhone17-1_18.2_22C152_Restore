@interface SVSCardContainerView
- (BOOL)justBeAContainer;
- (BOOL)swipeDismissible;
- (SVSCardContainerView)initWithFrame:(CGRect)a3;
- (void)_updateCornerRadius;
- (void)_updateWidthConstraints;
- (void)activateWithDimmingView:(id)a3 bottomMarginConstraint:(id)a4 dismissHandler:(id)a5;
- (void)awakeFromNib;
- (void)cancelProxCardDraggingWithCompletion:(id)a3;
- (void)reactivate;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setJustBeAContainer:(BOOL)a3;
- (void)setSwipeDismissible:(BOOL)a3;
- (void)updateScrollViewTopInset;
@end

@implementation SVSCardContainerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flickScrollview, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong(&self->_dragCancelHandler, 0);

  objc_storeStrong((id *)&self->_bottomMarginConstraint, 0);
}

- (BOOL)swipeDismissible
{
  return self->_swipeDismissible;
}

- (BOOL)justBeAContainer
{
  return self->_justBeAContainer;
}

- (void)cancelProxCardDraggingWithCompletion:(id)a3
{
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_10012FB14;
  v16 = &unk_1001A1AE8;
  id v5 = a3;
  v17 = self;
  id v18 = v5;
  v6 = objc_retainBlock(&v13);
  if ([(SVSCardContainerScrollView *)self->_flickScrollview isDragging])
  {
    v7 = objc_retainBlock(v6);
    id dragCancelHandler = self->_dragCancelHandler;
    self->_id dragCancelHandler = v7;

    id v9 = v6;
    v6 = 0;
  }
  else
  {
    id v9 = self->_dragCancelHandler;
    if (v9)
    {
      v12 = +[NSAssertionHandler currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SVSCardContainerView.m" lineNumber:240 description:@"_dragCancelHandler should always be nil here."];

      id v9 = self->_dragCancelHandler;
    }
    self->_id dragCancelHandler = 0;
  }

  double originalContentOffsetY = self->_originalContentOffsetY;
  v11 = [(SVSCardContainerScrollView *)self->_flickScrollview panGestureRecognizer];
  [v11 setEnabled:0];

  -[SVSCardContainerScrollView setContentOffset:animated:](self->_flickScrollview, "setContentOffset:animated:", 1, 0.0, originalContentOffsetY);
  if (v6) {
    ((void (*)(void ***))v6[2])(v6);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v12 = a3;
  [v12 contentOffset];
  [(NSLayoutConstraint *)self->_bottomMarginConstraint setConstant:v4 - self->_originalContentOffsetY + self->_originalBottomConstraintConstant];
  [v12 contentOffset];
  double v6 = v5;
  double originalContentOffsetY = self->_originalContentOffsetY;
  if ([(SVSCardContainerView *)self swipeDismissible])
  {
    double v8 = v6 / originalContentOffsetY;
    if (v6 / originalContentOffsetY > 1.0) {
      double v8 = 1.0;
    }
    if (v8 < 0.0) {
      double v8 = 0.0;
    }
    [(UIView *)self->_dimmingView setAlpha:v8];
  }
  [v12 contentOffset];
  if (v9 == 0.0)
  {
    dismissHandler = (void (**)(id, uint64_t))self->_dismissHandler;
    if (dismissHandler)
    {
      dismissHandler[2](dismissHandler, 19);
      id v11 = self->_dismissHandler;
      self->_dismissHandler = 0;
    }
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id dragCancelHandler = self->_dragCancelHandler;
  if (dragCancelHandler)
  {
    double v6 = (void (**)(void))objc_retainBlock(dragCancelHandler);
    id v5 = self->_dragCancelHandler;
    self->_id dragCancelHandler = 0;

    v6[2]();
  }
}

- (void)reactivate
{
}

- (void)activateWithDimmingView:(id)a3 bottomMarginConstraint:(id)a4 dismissHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[UIDevice currentDevice];
  unint64_t v13 = (unint64_t)[v12 userInterfaceIdiom];

  if (v10 && (v13 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    objc_storeStrong((id *)&self->_dimmingView, a3);
    id v14 = objc_retainBlock(v11);
    id dismissHandler = self->_dismissHandler;
    self->_id dismissHandler = v14;

    objc_storeStrong((id *)&self->_bottomMarginConstraint, a4);
    [v10 constant];
    self->_originalBottomConstraintConstant = v16;
    id location = 0;
    objc_initWeak(&location, self);
    v17 = [SVSCardContainerScrollView alloc];
    v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472;
    v39 = sub_10013009C;
    v40 = &unk_1001A1660;
    objc_copyWeak(&v41, &location);
    id v18 = [(SVSCardContainerScrollView *)v17 initWithGestureRecognizerEvaluator:&v37];
    flickScrollview = self->_flickScrollview;
    self->_flickScrollview = v18;

    v20 = [(SVSCardContainerView *)self superview];
    [v20 insertSubview:self->_flickScrollview below:self];

    [(SVSCardContainerScrollView *)self->_flickScrollview setContentInsetAdjustmentBehavior:2];
    [(SVSCardContainerView *)self frame];
    double v22 = v21;
    [(SVSCardContainerView *)self frame];
    double v24 = v23;
    [(SVSCardContainerView *)self size];
    double v26 = v25;
    [(SVSCardContainerView *)self size];
    -[SVSCardContainerScrollView setFrame:](self->_flickScrollview, "setFrame:", v22, v24, v26, v27 + 20.0);
    [(SVSCardContainerScrollView *)self->_flickScrollview setDelegate:self];
    [(SVSCardContainerScrollView *)self->_flickScrollview size];
    double v29 = v28;
    [(SVSCardContainerScrollView *)self->_flickScrollview size];
    -[SVSCardContainerScrollView setContentSize:](self->_flickScrollview, "setContentSize:", v29, v30 + v30);
    [(SVSCardContainerScrollView *)self->_flickScrollview setPagingEnabled:1];
    [(SVSCardContainerScrollView *)self->_flickScrollview setClipsToBounds:0];
    [(SVSCardContainerScrollView *)self->_flickScrollview setShowsVerticalScrollIndicator:0];
    [(SVSCardContainerScrollView *)self->_flickScrollview setShowsHorizontalScrollIndicator:0];
    [(SVSCardContainerScrollView *)self->_flickScrollview setUserInteractionEnabled:1];
    [(SVSCardContainerScrollView *)self->_flickScrollview setAlwaysBounceVertical:1];
    v31 = [(SVSCardContainerScrollView *)self->_flickScrollview panGestureRecognizer];
    v32 = [v31 view];
    v33 = [(SVSCardContainerScrollView *)self->_flickScrollview panGestureRecognizer];
    [v32 removeGestureRecognizer:v33];

    v34 = [(SVSCardContainerView *)self superview];
    v35 = [(SVSCardContainerScrollView *)self->_flickScrollview panGestureRecognizer];
    [v34 addGestureRecognizer:v35];

    [(SVSCardContainerScrollView *)self->_flickScrollview size];
    self->_double originalContentOffsetY = v36;
    [(SVSCardContainerScrollView *)self->_flickScrollview setContentOffset:0.0];
    [(SVSCardContainerView *)self updateScrollViewTopInset];
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
}

- (void)updateScrollViewTopInset
{
  if ([(SVSCardContainerView *)self swipeDismissible])
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  else
  {
    [(SVSCardContainerScrollView *)self->_flickScrollview size];
    double top = -v7;
    double left = 0.0;
    double bottom = 0.0;
    double right = 0.0;
  }
  flickScrollview = self->_flickScrollview;

  -[SVSCardContainerScrollView setContentInset:](flickScrollview, "setContentInset:", top, left, bottom, right);
}

- (void)setSwipeDismissible:(BOOL)a3
{
  self->_swipeDismissible = a3;
  [(SVSCardContainerView *)self updateScrollViewTopInset];
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)SVSCardContainerView;
  [(SVSCardContainerView *)&v3 awakeFromNib];
  [(SVSCardContainerView *)self _updateCornerRadius];
  [(SVSCardContainerView *)self _updateWidthConstraints];
}

- (void)_updateWidthConstraints
{
  objc_super v3 = [(SVSCardContainerView *)self traitCollection];
  double v4 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:1];
  unsigned int v5 = [v3 containsTraitsInCollection:v4];

  if (v5)
  {
    id v9 = [(SVSCardContainerView *)self constraints];
    double v6 = +[NSPredicate predicateWithFormat:@"firstAttribute = %d AND firstItem = %@ AND constant = 400", 7, self];
    double v7 = [v9 filteredArrayUsingPredicate:v6];
    if ((unint64_t)[v7 count] >= 2
      && dword_1001CCB88 <= 90
      && (dword_1001CCB88 != -1 || _LogCategory_Initialize()))
    {
      double v8 = v7;
      LogPrintF();
    }
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7, v8);
  }
}

- (void)_updateCornerRadius
{
  unsigned __int8 v3 = [(SVSCardContainerView *)self justBeAContainer];
  double v4 = 0.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(SVSCardContainerView *)self traitCollection];
    [v5 displayCornerRadius];
    double v7 = v6 + -6.0;

    double v4 = fmax(v7, 13.0);
  }

  [(SVSCardContainerView *)self _setContinuousCornerRadius:v4];
}

- (void)setJustBeAContainer:(BOOL)a3
{
  if (self->_justBeAContainer != a3)
  {
    self->_justBeAContainer = a3;
    [(SVSCardContainerView *)self _updateCornerRadius];
  }
}

- (SVSCardContainerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SVSCardContainerView;
  unsigned __int8 v3 = -[SVSCardContainerView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = +[UIColor systemBackgroundColor];
    [(SVSCardContainerView *)v3 setBackgroundColor:v4];

    [(SVSCardContainerView *)v3 _updateCornerRadius];
    [(SVSCardContainerView *)v3 _updateWidthConstraints];
    unsigned int v5 = v3;
  }

  return v3;
}

@end