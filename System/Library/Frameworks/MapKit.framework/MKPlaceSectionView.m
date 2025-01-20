@interface MKPlaceSectionView
- (BOOL)highlightsTouches;
- (BOOL)showsBottomHairline;
- (MKPlaceSectionItemView)footerView;
- (MKPlaceSectionItemView)headerView;
- (MKPlaceSectionView)initWithFrame:(CGRect)a3;
- (MKPlaceSectionViewDelegate)delegate;
- (NSArray)rowViews;
- (id)rowAt:(CGPoint)a3;
- (unint64_t)indexOfRowAt:(CGPoint)a3;
- (void)_tappedRow:(id)a3 at:(unint64_t)a4;
- (void)_touchesBeganForRow:(id)a3 at:(unint64_t)a4;
- (void)_touchesCancelledForRow:(id)a3 at:(unint64_t)a4;
- (void)_updateHairlineInsets;
- (void)_updateViewsAnimated:(BOOL)a3;
- (void)_updateViewsAnimated:(BOOL)a3 isNeedLayout:(BOOL)a4;
- (void)infoCardThemeChanged;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setFooterView:(id)a3 animated:(BOOL)a4;
- (void)setHeaderView:(id)a3;
- (void)setHeaderView:(id)a3 animated:(BOOL)a4;
- (void)setHighlightsTouches:(BOOL)a3;
- (void)setRowViews:(id)a3;
- (void)setRowViews:(id)a3 animated:(BOOL)a4;
- (void)setRowViews:(id)a3 animated:(BOOL)a4 isNeedLayout:(BOOL)a5;
- (void)setShowsBottomHairline:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation MKPlaceSectionView

- (MKPlaceSectionView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MKPlaceSectionView;
  v3 = -[_MKStackView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_trackingSelectForRow = 0x7FFFFFFFFFFFFFFFLL;
    v3->_showsBottomHairline = 1;
    v5 = [MKViewWithHairline alloc];
    [(MKPlaceSectionView *)v4 bounds];
    uint64_t v6 = -[MKViewWithHairline initWithFrame:](v5, "initWithFrame:");
    hairLineView = v4->_hairLineView;
    v4->_hairLineView = (MKViewWithHairline *)v6;

    [(_MKStackView *)v4 addSubview:v4->_hairLineView];
    v8 = [(UIView *)v4 mk_theme];
    v9 = [v8 separatorLineColor];
    [(MKViewWithHairline *)v4->_hairLineView setHairlineColor:v9];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceSectionView;
  [(MKPlaceSectionView *)&v3 layoutSubviews];
  [(MKPlaceSectionView *)self bounds];
  -[MKViewWithHairline setFrame:](self->_hairLineView, "setFrame:");
  [(MKPlaceSectionView *)self _updateHairlineInsets];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceSectionView;
  [(MKPlaceSectionView *)&v3 layoutMarginsDidChange];
  [(MKPlaceSectionView *)self _updateHairlineInsets];
}

- (void)infoCardThemeChanged
{
  v5.receiver = self;
  v5.super_class = (Class)MKPlaceSectionView;
  [(UIView *)&v5 infoCardThemeChanged];
  objc_super v3 = [(UIView *)self mk_theme];
  v4 = [v3 separatorLineColor];
  [(MKViewWithHairline *)self->_hairLineView setHairlineColor:v4];
}

- (void)_updateHairlineInsets
{
  int IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  [(MKPlaceSectionView *)self layoutMargins];
  if (IsRightToLeft) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  if (IsRightToLeft) {
    double v7 = v4;
  }
  else {
    double v7 = v5;
  }
  [(MKViewWithHairline *)self->_hairLineView setLeftHairlineInset:v6];
  hairLineView = self->_hairLineView;

  [(MKViewWithHairline *)hairLineView setRightHairlineInset:v7];
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  if (self->_showsBottomHairline != a3)
  {
    self->_showsBottomHairline = a3;
    [(MKViewWithHairline *)self->_hairLineView setBottomHairlineHidden:!a3];
  }
}

- (unint64_t)indexOfRowAt:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v5 = [(_MKStackView *)self stackedSubviews];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__MKPlaceSectionView_indexOfRowAt___block_invoke;
  v8[3] = &__block_descriptor_48_e23_B32__0__UIView_8Q16_B24l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  unint64_t v6 = [v5 indexOfObjectPassingTest:v8];

  return v6;
}

BOOL __35__MKPlaceSectionView_indexOfRowAt___block_invoke(CGPoint *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 frame];
  if (!CGRectContainsPoint(v7, a1[2])) {
    return *a4 != 0;
  }
  BOOL result = 1;
  *a4 = 1;
  return result;
}

- (id)rowAt:(CGPoint)a3
{
  unint64_t v4 = -[MKPlaceSectionView indexOfRowAt:](self, "indexOfRowAt:", a3.x, a3.y);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = 0;
  }
  else
  {
    unint64_t v6 = v4;
    CGRect v7 = [(_MKStackView *)self stackedSubviews];
    v8 = [v7 objectAtIndexedSubscript:v6];

    if (v8 == self->_headerView) {
      double v5 = 0;
    }
    else {
      double v5 = v8;
    }
  }

  return v5;
}

- (void)_tappedRow:(id)a3 at:(unint64_t)a4
{
  v9 = (MKPlaceSectionItemView *)a3;
  unint64_t v6 = [(MKPlaceSectionView *)self delegate];

  if (v6)
  {
    if (self->_headerView == v9)
    {
      WeakRetained = (MKPlaceSectionItemView *)objc_loadWeakRetained((id *)&self->_delegate);
      [(MKPlaceSectionItemView *)WeakRetained sectionView:self didSelectHeader:v9];
    }
    else if (self->_footerView == v9)
    {
      WeakRetained = (MKPlaceSectionItemView *)objc_loadWeakRetained((id *)&self->_delegate);
      [(MKPlaceSectionItemView *)WeakRetained sectionView:self didSelectFooter:v9];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
      WeakRetained = v9;
      if ([(MKPlaceSectionItemView *)WeakRetained isSelected])
      {
        [(MKPlaceSectionItemView *)WeakRetained setSelected:0 animated:1];
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 sectionView:self didDeselectRow:WeakRetained atIndex:a4 - (self->_headerView != 0)];
      }
      else
      {
        id v8 = objc_loadWeakRetained((id *)&self->_delegate);
        [v8 sectionView:self didSelectRow:WeakRetained atIndex:a4 - (self->_headerView != 0)];
      }
    }
  }
LABEL_12:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MKPlaceSectionItemView *)v9 setHighlighted:0];
  }
}

- (void)_touchesBeganForRow:(id)a3 at:(unint64_t)a4
{
  id v5 = a3;
  if ([(MKPlaceSectionView *)self highlightsTouches])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 setHighlighted:1];
    }
  }
}

- (void)_touchesCancelledForRow:(id)a3 at:(unint64_t)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setHighlighted:0];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(MKPlaceSectionView *)self window];
  CGRect v7 = [v5 touchesForWindow:v6];

  id v13 = [v7 anyObject];

  if ([v13 tapCount] == 1)
  {
    [v13 locationInView:self];
    unint64_t v8 = -[MKPlaceSectionView indexOfRowAt:](self, "indexOfRowAt:");
    self->_trackingSelectForRow = v8;
    v9 = [(_MKStackView *)self stackedSubviews];
    unint64_t v10 = [v9 count];

    if (v8 < v10)
    {
      objc_super v11 = [(_MKStackView *)self stackedSubviews];
      v12 = [v11 objectAtIndexedSubscript:self->_trackingSelectForRow];
      [(MKPlaceSectionView *)self _touchesBeganForRow:v12 at:self->_trackingSelectForRow];
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  unint64_t trackingSelectForRow = self->_trackingSelectForRow;
  unint64_t v6 = [(_MKStackView *)self stackedSubviews];
  unint64_t v7 = [v6 count];

  if (trackingSelectForRow < v7)
  {
    unint64_t v8 = [(_MKStackView *)self stackedSubviews];
    v9 = [v8 objectAtIndexedSubscript:self->_trackingSelectForRow];
    [(MKPlaceSectionView *)self _touchesCancelledForRow:v9 at:self->_trackingSelectForRow];
  }
  self->_unint64_t trackingSelectForRow = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (self->_trackingSelectForRow != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = a4;
    unint64_t v6 = [(MKPlaceSectionView *)self window];
    unint64_t v7 = [v5 touchesForWindow:v6];

    id v14 = [v7 anyObject];

    [v14 locationInView:self];
    unint64_t v8 = -[MKPlaceSectionView indexOfRowAt:](self, "indexOfRowAt:");
    if (v8 == self->_trackingSelectForRow)
    {
      unint64_t v9 = v8;
      unint64_t v10 = [(_MKStackView *)self stackedSubviews];
      unint64_t v11 = [v10 count];

      if (v9 < v11)
      {
        v12 = [(_MKStackView *)self stackedSubviews];
        id v13 = [v12 objectAtIndexedSubscript:self->_trackingSelectForRow];
        [(MKPlaceSectionView *)self _tappedRow:v13 at:self->_trackingSelectForRow];

        self->_unint64_t trackingSelectForRow = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
}

- (void)setHeaderView:(id)a3
{
}

- (void)setHeaderView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = (MKPlaceSectionItemView *)a3;
  if (self->_headerView != v7)
  {
    unint64_t v8 = v7;
    objc_storeStrong((id *)&self->_headerView, a3);
    [(MKPlaceSectionView *)self _updateViewsAnimated:v4 isNeedLayout:1];
    unint64_t v7 = v8;
  }
}

- (void)setRowViews:(id)a3
{
}

- (void)setRowViews:(id)a3 animated:(BOOL)a4
{
}

- (void)setRowViews:(id)a3 animated:(BOOL)a4 isNeedLayout:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v10 = a3;
  if (!-[NSArray isEqualToArray:](self->_rowViews, "isEqualToArray:"))
  {
    unint64_t v8 = (NSArray *)[v10 copy];
    rowViews = self->_rowViews;
    self->_rowViews = v8;

    [(MKPlaceSectionView *)self _updateViewsAnimated:v6 isNeedLayout:v5];
  }
}

- (void)setFooterView:(id)a3
{
}

- (void)setFooterView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = (MKPlaceSectionItemView *)a3;
  if (self->_footerView != v7)
  {
    unint64_t v8 = v7;
    objc_storeStrong((id *)&self->_footerView, a3);
    [(MKPlaceSectionView *)self _updateViewsAnimated:v4];
    unint64_t v7 = v8;
  }
}

- (void)_updateViewsAnimated:(BOOL)a3
{
}

- (void)_updateViewsAnimated:(BOOL)a3 isNeedLayout:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (self->_headerView)
  {
    unint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CBF0], "arrayByAddingObject:");
  }
  else
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (self->_rowViews)
  {
    id v10 = v7;
    uint64_t v8 = objc_msgSend(v7, "arrayByAddingObjectsFromArray:");

    unint64_t v7 = (void *)v8;
  }
  if (self->_footerView)
  {
    id v11 = v7;
    uint64_t v9 = objc_msgSend(v7, "arrayByAddingObject:");

    unint64_t v7 = (void *)v9;
  }
  id v12 = v7;
  [(_MKStackView *)self setStackedSubviews:v7 animated:v5 isNeedLayout:v4];
}

- (MKPlaceSectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKPlaceSectionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKPlaceSectionItemView)headerView
{
  return self->_headerView;
}

- (NSArray)rowViews
{
  return self->_rowViews;
}

- (BOOL)highlightsTouches
{
  return self->_highlightsTouches;
}

- (void)setHighlightsTouches:(BOOL)a3
{
  self->_highlightsTouches = a3;
}

- (MKPlaceSectionItemView)footerView
{
  return self->_footerView;
}

- (BOOL)showsBottomHairline
{
  return self->_showsBottomHairline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_rowViews, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_hairLineView, 0);
}

@end