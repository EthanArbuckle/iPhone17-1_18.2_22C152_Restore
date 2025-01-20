@interface CKBrowserSwitcherScrollPreventer
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isEngaged;
- (BOOL)isSwitching;
- (BOOL)scrollEnabled;
- (CGPoint)contentOffset;
- (CGSize)contentSize;
- (CKBrowserSwitcherScrollPreventer)initWithFrame:(CGRect)a3;
- (CKBrowserSwitcherScrollPreventerDelegate)delegate;
- (UIScrollView)horizontalScrollView;
- (UIView)horizontalScrollPreventerView;
- (void)layoutSubviews;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setEngaged:(BOOL)a3;
- (void)setHorizontalScrollPreventerView:(id)a3;
- (void)setHorizontalScrollView:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setSwitching:(BOOL)a3;
@end

@implementation CKBrowserSwitcherScrollPreventer

- (CKBrowserSwitcherScrollPreventer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)CKBrowserSwitcherScrollPreventer;
  v7 = -[CKBrowserSwitcherScrollPreventer initWithFrame:](&v20, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(CKBrowserSwitcherScrollPreventer *)v7 setBackgroundColor:0];
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42DB0]), "initWithFrame:", x, y, width, height);
    [v9 setDelegate:v8];
    [v9 setShowsVerticalScrollIndicator:0];
    [v9 setShowsHorizontalScrollIndicator:0];
    [v9 setBouncesVertically:0];
    [v9 setPagingEnabled:1];
    [(CKBrowserSwitcherScrollPreventer *)v8 setHorizontalScrollView:v9];
    [(CKBrowserSwitcherScrollPreventer *)v8 addSubview:v9];
    v10 = +[CKUIBehavior sharedBehaviors];
    [v10 browserSwitcherGutterWidth];
    double v12 = v11;

    objc_msgSend(v9, "_setInterpageSpacing:", v12, 0.0);
    double v13 = v12 * 0.5;
    if (CKMainScreenScale_once_55 != -1) {
      dispatch_once(&CKMainScreenScale_once_55, &__block_literal_global_147);
    }
    double v14 = *(double *)&CKMainScreenScale_sMainScreenScale_55;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_55 == 0.0) {
      double v14 = 1.0;
    }
    objc_msgSend(v9, "_setPagingOrigin:", round(v13 * v14) / v14, 0.0);
    v15 = +[CKUIBehavior sharedBehaviors];
    [v15 browserSwitcherEdgeGestureWidth];
    CGFloat v17 = v16;

    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    CGRect v22 = CGRectInset(v21, v17, 0.0);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
    [(CKBrowserSwitcherScrollPreventer *)v8 setHorizontalScrollPreventerView:v18];
    [(CKBrowserSwitcherScrollPreventer *)v8 addSubview:v18];
  }
  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)CKBrowserSwitcherScrollPreventer;
  [(CKBrowserSwitcherScrollPreventer *)&v24 layoutSubviews];
  BOOL v3 = [(CKBrowserSwitcherScrollPreventer *)self isEngaged];
  [(CKBrowserSwitcherScrollPreventer *)self setEngaged:0];
  [(CKBrowserSwitcherScrollPreventer *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  double v13 = +[CKUIBehavior sharedBehaviors];
  [v13 browserSwitcherEdgeGestureWidth];
  CGFloat v15 = v14;

  v25.origin.double x = v5;
  v25.origin.double y = v7;
  v25.size.double width = v9;
  v25.size.double height = v11;
  CGRect v26 = CGRectInset(v25, v15, 0.0);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  objc_super v20 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollPreventerView];
  objc_msgSend(v20, "setFrame:", x, y, width, height);

  v27.origin.double x = v5;
  v27.origin.double y = v7;
  v27.size.double width = v9;
  v27.size.double height = v11;
  double v21 = CGRectGetHeight(v27);
  CGRect v22 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollView];
  objc_msgSend(v22, "setContentSize:", 1.79769313e308, v21);

  v23 = [(CKBrowserSwitcherScrollPreventer *)self delegate];
  [v23 scrollPreventerDidLayoutSubviews:self];

  [(CKBrowserSwitcherScrollPreventer *)self setEngaged:v3];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollView];

  if (v5 == v4)
  {
    id v6 = [(CKBrowserSwitcherScrollPreventer *)self delegate];
    [v6 scrollPreventerWillBeginDragging:self];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v12 = a3;
  id v4 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollView];

  id v5 = v12;
  if (v4 == v12)
  {
    [v12 contentOffset];
    double v7 = v6;
    double v9 = v8;
    BOOL v10 = [(CKBrowserSwitcherScrollPreventer *)self isEngaged];
    id v5 = v12;
    if (v10)
    {
      double v11 = [(CKBrowserSwitcherScrollPreventer *)self delegate];
      objc_msgSend(v11, "scrollPreventer:scrolledToOffset:", self, v7, v9);

      id v5 = v12;
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v6 = a3;
  id v4 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollView];
  if (v4 == v6)
  {
    BOOL v5 = [(CKBrowserSwitcherScrollPreventer *)self isEngaged];

    if (!v5) {
      goto LABEL_5;
    }
    id v4 = [(CKBrowserSwitcherScrollPreventer *)self delegate];
    [v4 scrollPreventerDidEndDecelerating:self];
  }

LABEL_5:
}

- (CGPoint)contentOffset
{
  v2 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollView];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollView];
  objc_msgSend(v5, "setContentOffset:", x, y);
}

- (CGSize)contentSize
{
  v2 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollView];
  [v2 contentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollView];
  objc_msgSend(v5, "setContentSize:", width, height);
}

- (void)setScrollEnabled:(BOOL)a3
{
  if (self->_scrollEnabled != a3)
  {
    BOOL v3 = a3;
    self->_scrollEnabled = a3;
    id v4 = [(CKBrowserSwitcherScrollPreventer *)self horizontalScrollView];
    [v4 setScrollEnabled:v3];
  }
}

- (void)setSwitching:(BOOL)a3
{
  if (self->_switching != a3) {
    self->_switching = a3;
  }
}

- (BOOL)isEngaged
{
  return self->_engaged;
}

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
}

- (BOOL)isSwitching
{
  return self->_switching;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (CKBrowserSwitcherScrollPreventerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBrowserSwitcherScrollPreventerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIScrollView)horizontalScrollView
{
  return self->_horizontalScrollView;
}

- (void)setHorizontalScrollView:(id)a3
{
}

- (UIView)horizontalScrollPreventerView
{
  return self->_horizontalScrollPreventerView;
}

- (void)setHorizontalScrollPreventerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalScrollPreventerView, 0);
  objc_storeStrong((id *)&self->_horizontalScrollView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end