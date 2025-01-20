@interface CKMNavbarCanvasView
- (BOOL)shouldLayoutForCollapsedWidth;
- (CKMNavbarCanvasView)init;
- (CKMNavbarCanvasView)initWithFrame:(CGRect)a3;
- (UIButton)composeButtonView;
- (UISearchBar)searchBarView;
- (void)_layoutForDisplayBelowToolbar;
- (void)_layoutForDisplayInNavbar;
- (void)clearAllItemViews;
- (void)layoutSubviews;
- (void)setComposeButtonView:(id)a3;
- (void)setSearchBarView:(id)a3;
- (void)setShouldLayoutForCollapsedWidth:(BOOL)a3;
@end

@implementation CKMNavbarCanvasView

- (CKMNavbarCanvasView)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKMNavbarCanvasView;
  v2 = [(CKMNavbarCanvasView *)&v7 init];
  v3 = v2;
  if (v2)
  {
    searchBarView = v2->_searchBarView;
    v2->_searchBarView = 0;

    composeButtonView = v3->_composeButtonView;
    v3->_composeButtonView = 0;
  }
  return v3;
}

- (CKMNavbarCanvasView)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v7 = +[CKUIBehavior sharedBehaviors];
  [v7 marzNavigationBarHeight];
  double v9 = v8;

  v11.receiver = self;
  v11.super_class = (Class)CKMNavbarCanvasView;
  return -[CKMNavbarCanvasView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, v9);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKMNavbarCanvasView;
  [(CKMNavbarCanvasView *)&v5 layoutSubviews];
  v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 useMacToolbar];

  if (v4) {
    [(CKMNavbarCanvasView *)self _layoutForDisplayBelowToolbar];
  }
  else {
    [(CKMNavbarCanvasView *)self _layoutForDisplayInNavbar];
  }
}

- (void)_layoutForDisplayBelowToolbar
{
  id v40 = +[CKUIBehavior sharedBehaviors];
  if ([v40 useMacToolbar])
  {
    searchBarView = self->_searchBarView;

    if (!searchBarView) {
      return;
    }
    int v4 = +[CKUIBehavior sharedBehaviors];
    [v4 searchNavbarCanvasInsets];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    [(CKMNavbarCanvasView *)self bounds];
    double v14 = v13;
    double v39 = v8 + v15;
    double v17 = v6 + v16;
    double v18 = v13 - (v8 + v12);
    double v20 = v19 - (v6 + v10);
    v21 = [(CKMNavbarCanvasView *)self composeButtonView];
    [v21 frame];
    double v23 = v22;
    double v25 = v24;

    v26 = +[CKUIBehavior sharedBehaviors];
    [v26 minConversationListWidthComposeButtonSize];
    double v28 = v27;
    double v30 = v29;

    if ([(CKMNavbarCanvasView *)self shouldLayoutForCollapsedWidth]) {
      double v23 = v14 * 0.5 - v28 * 0.5;
    }
    v31 = [(CKMNavbarCanvasView *)self searchBarView];
    objc_msgSend(v31, "setHidden:", -[CKMNavbarCanvasView shouldLayoutForCollapsedWidth](self, "shouldLayoutForCollapsedWidth"));

    v32 = [(CKMNavbarCanvasView *)self composeButtonView];
    objc_msgSend(v32, "setHidden:", -[CKMNavbarCanvasView shouldLayoutForCollapsedWidth](self, "shouldLayoutForCollapsedWidth") ^ 1);

    v33 = [(CKMNavbarCanvasView *)self composeButtonView];
    objc_msgSend(v33, "setFrame:", v23, v25, v28, v30);

    v34 = [(CKMNavbarCanvasView *)self composeButtonView];
    v35 = [(CKMNavbarCanvasView *)self composeButtonView];
    [v35 center];
    double v37 = v36;
    v38 = [(CKMNavbarCanvasView *)self searchBarView];
    [v38 center];
    [v34 setCenter:v37];

    id v40 = [(CKMNavbarCanvasView *)self searchBarView];
    objc_msgSend(v40, "setFrame:", v39, v17, v18, v20);
  }
}

- (void)_layoutForDisplayInNavbar
{
  if (self->_searchBarView && self->_composeButtonView)
  {
    v3 = +[CKUIBehavior sharedBehaviors];
    [v3 searchNavbarCanvasInsets];
    double v49 = v4;
    double v50 = v5;
    double v51 = v6;
    double v8 = v7;

    [(CKMNavbarCanvasView *)self frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = +[CKUIBehavior sharedBehaviors];
    [v15 marzNavigationBarHeight];
    double v17 = v16;

    -[CKMNavbarCanvasView setFrame:](self, "setFrame:", v10, v12, v14, v17);
    [(CKMNavbarCanvasView *)self bounds];
    double v19 = v18;
    double v21 = v20;
    double v22 = [(CKMNavbarCanvasView *)self searchBarView];
    [v22 frame];
    double v24 = v23;
    double v52 = v25;
    double v27 = v26;
    double v55 = v28;

    double v29 = [(CKMNavbarCanvasView *)self composeButtonView];
    [v29 frame];
    double v53 = v31;
    double v54 = v30;
    double v33 = v32;

    [(CKMNavbarCanvasView *)self bounds];
    double v35 = v34;
    double v36 = +[CKUIBehavior sharedBehaviors];
    [v36 snapToMinConversationListWidth];
    double v38 = v37;

    if (v35 >= v38)
    {
      [(UISearchBar *)self->_searchBarView sizeToFit];
      double v55 = v21 - v8 - v49;
      id v40 = +[CKUIBehavior sharedBehaviors];
      [v40 spaceBetweenSearchBarAndComposeButton];
      double v42 = v41;

      double v24 = v51;
      double v27 = v19 - (v33 + v50 + v42);
      double v39 = v42 + v51 + v27;
    }
    else
    {
      double v39 = v19 * 0.5 - v33 * 0.5;
    }
    v43 = [(CKMNavbarCanvasView *)self searchBarView];
    [v43 setHidden:v35 < v38];

    if (CKMainScreenScale_once_21 != -1) {
      dispatch_once(&CKMainScreenScale_once_21, &__block_literal_global_51);
    }
    v44 = [(CKMNavbarCanvasView *)self searchBarView];
    objc_msgSend(v44, "setFrame:", v24, v52, v27, v55);

    v45 = [(CKMNavbarCanvasView *)self searchBarView];
    v46 = [(CKMNavbarCanvasView *)self searchBarView];
    [v46 center];
    objc_msgSend(v45, "setCenter:");

    v47 = [(CKMNavbarCanvasView *)self composeButtonView];
    objc_msgSend(v47, "setFrame:", v39, v54, v33, v53);

    id v56 = [(CKMNavbarCanvasView *)self composeButtonView];
    v48 = [(CKMNavbarCanvasView *)self composeButtonView];
    [v48 center];
    objc_msgSend(v56, "setCenter:");
  }
}

- (void)setSearchBarView:(id)a3
{
  double v5 = (UISearchBar *)a3;
  p_searchBarView = &self->_searchBarView;
  if (self->_searchBarView != v5)
  {
    double v7 = v5;
    [(UISearchBar *)v5 setAutoresizingMask:0];
    [(UISearchBar *)*p_searchBarView removeFromSuperview];
    objc_storeStrong((id *)&self->_searchBarView, a3);
    double v5 = v7;
    if (v7)
    {
      [(UISearchBar *)*p_searchBarView sizeToFit];
      [(CKMNavbarCanvasView *)self addSubview:*p_searchBarView];
      double v5 = v7;
    }
  }
}

- (void)setComposeButtonView:(id)a3
{
  double v5 = (UIButton *)a3;
  p_composeButtonView = &self->_composeButtonView;
  if (self->_composeButtonView != v5)
  {
    double v7 = v5;
    [(UIButton *)v5 setAutoresizingMask:0];
    [(UIButton *)*p_composeButtonView removeFromSuperview];
    objc_storeStrong((id *)&self->_composeButtonView, a3);
    double v5 = v7;
    if (v7)
    {
      [(UIButton *)*p_composeButtonView sizeToFit];
      -[UIButton setBounds:](*p_composeButtonView, "setBounds:", 0.0, 0.0, 34.0, 21.0);
      [(CKMNavbarCanvasView *)self addSubview:*p_composeButtonView];
      double v5 = v7;
    }
  }
}

- (void)clearAllItemViews
{
  searchBarView = self->_searchBarView;
  self->_searchBarView = 0;

  composeButtonView = self->_composeButtonView;
  self->_composeButtonView = 0;
}

- (UISearchBar)searchBarView
{
  return self->_searchBarView;
}

- (UIButton)composeButtonView
{
  return self->_composeButtonView;
}

- (BOOL)shouldLayoutForCollapsedWidth
{
  return self->_shouldLayoutForCollapsedWidth;
}

- (void)setShouldLayoutForCollapsedWidth:(BOOL)a3
{
  self->_shouldLayoutForCollapsedWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeButtonView, 0);

  objc_storeStrong((id *)&self->_searchBarView, 0);
}

@end