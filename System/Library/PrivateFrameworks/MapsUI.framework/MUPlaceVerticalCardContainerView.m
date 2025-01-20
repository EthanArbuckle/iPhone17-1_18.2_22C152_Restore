@interface MUPlaceVerticalCardContainerView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isDeveloperPlaceCard;
- (BOOL)shouldInvokeCopyOnLongPress;
- (MUPlaceVerticalCardContainerView)initWithConfiguration:(id)a3;
- (MUPlaceVerticalCardContainerView)initWithShowsSeparators:(BOOL)a3;
- (MUPlaceVerticalCardContainerViewDelegate)delegate;
- (NSDirectionalEdgeInsets)_resolvedBottomSeparatorInsetsForView:(id)a3;
- (id)_rowAt:(CGPoint)a3;
- (unint64_t)_indexOfRowAt:(CGPoint)a3;
- (void)_handleLongPress:(id)a3;
- (void)_handleSelectedRowView:(id)a3 atIndex:(unint64_t)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)removeArrangedSubview:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRowViews:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation MUPlaceVerticalCardContainerView

- (MUPlaceVerticalCardContainerView)initWithConfiguration:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MUPlaceVerticalCardContainerView;
  v6 = -[MUStackView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(MUStackView *)v7 setAxis:1];
    if ([(MUPlaceVerticalCardContainerView *)v7 shouldInvokeCopyOnLongPress])
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v7 action:sel__handleLongPress_];
      longPressRecognizer = v7->_longPressRecognizer;
      v7->_longPressRecognizer = (UILongPressGestureRecognizer *)v8;

      [(UILongPressGestureRecognizer *)v7->_longPressRecognizer setDelegate:v7];
      [(MUPlaceVerticalCardContainerView *)v7 addGestureRecognizer:v7->_longPressRecognizer];
    }
    v10 = self;
    v15[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v12 = (id)[(MUPlaceVerticalCardContainerView *)v7 registerForTraitChanges:v11 withAction:sel__updateForPlatterAvailability];
  }
  return v7;
}

- (MUPlaceVerticalCardContainerView)initWithShowsSeparators:(BOOL)a3
{
  if (a3) {
    +[MUPlaceVerticalCardConfiguration separatorConfiguration];
  }
  else {
  v4 = +[MUPlaceVerticalCardConfiguration plainConfiguration];
  }
  id v5 = [(MUPlaceVerticalCardContainerView *)self initWithConfiguration:v4];

  return v5;
}

- (BOOL)isDeveloperPlaceCard
{
  return [(MUPlaceVerticalCardConfiguration *)self->_configuration isDeveloperPlaceCard];
}

- (void)setRowViews:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(UIView *)self _mapsui_isRTL];
  v6 = [(MUStackView *)self arrangedSubviews];
  char v7 = [v6 isEqualToArray:v4];

  if ((v7 & 1) == 0)
  {
    BOOL v8 = [(MUPlaceVerticalCardConfiguration *)self->_configuration showSeparators];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v9 = objc_msgSend(v4, "reverseObjectEnumerator", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v10)
    {
      id v12 = 0;
      goto LABEL_26;
    }
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v23;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(id *)(*((void *)&v22 + 1) + 8 * i);
        if (v12 || ([*(id *)(*((void *)&v22 + 1) + 8 * i) isHidden] & 1) != 0)
        {
          if (v15 != v12 && v8)
          {
            uint64_t v17 = 0;
            goto LABEL_16;
          }
        }
        else
        {
          id v12 = v15;
        }
        uint64_t v17 = 1;
LABEL_16:
        [v15 setBottomHairlineHidden:v17];
        [(MUPlaceVerticalCardContainerView *)self _resolvedBottomSeparatorInsetsForView:v15];
        if (v5) {
          double v20 = v19;
        }
        else {
          double v20 = v18;
        }
        if (v5) {
          double v21 = v18;
        }
        else {
          double v21 = v19;
        }
        [v15 setLeftHairlineInset:v20];
        [v15 setRightHairlineInset:v21];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v11)
      {
LABEL_26:

        [(MUStackView *)self setArrangedSubviews:v4];
        break;
      }
    }
  }
}

- (NSDirectionalEdgeInsets)_resolvedBottomSeparatorInsetsForView:(id)a3
{
  [(MUPlaceVerticalCardConfiguration *)self->_configuration bottomSeparatorInset];
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_longPressRecognizer == a3)
  {
    [a3 locationInView:self];
    unint64_t v5 = -[MUPlaceVerticalCardContainerView _indexOfRowAt:](self, "_indexOfRowAt:");
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v6 = 0;
    }
    else
    {
      unint64_t v7 = v5;
      BOOL v8 = [(MUStackView *)self arrangedSubviews];
      if (v7 <= [v8 count])
      {
        v9 = [(MUStackView *)self arrangedSubviews];
        double v6 = [v9 objectAtIndexedSubscript:v7];
      }
      else
      {
        double v6 = 0;
      }
    }
    char v3 = objc_opt_respondsToSelector();
  }
  else
  {
    char v3 = 1;
  }
  return v3 & 1;
}

- (void)_handleLongPress:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 1)
  {
    [v6 locationInView:self];
    double v4 = -[MUPlaceVerticalCardContainerView _rowAt:](self, "_rowAt:");
    objc_storeStrong((id *)&self->_selectedRow, v4);
    if ([(UIView *)self->_selectedRow conformsToProtocol:&unk_1EE413C78]) {
      [(UIView *)self->_selectedRow setSelected:1 animated:1];
    }
  }
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1758]) initWithDelegate:0];
  [(MUPlaceVerticalCardContainerView *)self addInteraction:v5];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(MUPlaceVerticalCardContainerView *)self window];
  unint64_t v7 = [v5 touchesForWindow:v6];

  id v8 = [v7 anyObject];

  if ([v8 tapCount] == 1)
  {
    [v8 locationInView:self];
    self->_trackingSelectForRow = -[MUPlaceVerticalCardContainerView _indexOfRowAt:](self, "_indexOfRowAt:");
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->_trackingSelectForRow = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (self->_trackingSelectForRow != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = a4;
    id v6 = [(MUPlaceVerticalCardContainerView *)self window];
    unint64_t v7 = [v5 touchesForWindow:v6];

    id v14 = [v7 anyObject];

    [v14 locationInView:self];
    unint64_t v8 = -[MUPlaceVerticalCardContainerView _indexOfRowAt:](self, "_indexOfRowAt:");
    if (v8 == self->_trackingSelectForRow)
    {
      unint64_t v9 = v8;
      uint64_t v10 = [(MUStackView *)self arrangedSubviews];
      unint64_t v11 = [v10 count];

      if (v9 < v11)
      {
        id v12 = [(MUStackView *)self arrangedSubviews];
        uint64_t v13 = [v12 objectAtIndexedSubscript:v9];
        [(MUPlaceVerticalCardContainerView *)self _handleSelectedRowView:v13 atIndex:v9];

        self->_trackingSelectForRow = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(MUPlaceVerticalCardContainerView *)self delegate];
  if (v8)
  {
    unint64_t v9 = [v6 anyObject];
    uint64_t v10 = [v9 key];
  }
  else
  {
    uint64_t v10 = 0;
  }

  if ([v10 keyCode] != 40) {
    goto LABEL_11;
  }
  unint64_t v11 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  id v12 = [v11 focusedItem];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(MUStackView *)self arrangedSubviews],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 containsObject:v12],
        v13,
        !v14))
  {
LABEL_10:

LABEL_11:
    v22.receiver = self;
    v22.super_class = (Class)MUPlaceVerticalCardContainerView;
    [(MUPlaceVerticalCardContainerView *)&v22 pressesEnded:v6 withEvent:v7];
    goto LABEL_12;
  }
  id v15 = v12;
  [v15 frame];
  double MidX = CGRectGetMidX(v23);
  [v15 frame];
  unint64_t v17 = -[MUPlaceVerticalCardContainerView _indexOfRowAt:](self, "_indexOfRowAt:", MidX, CGRectGetMidY(v24));
  double v18 = [(MUStackView *)self arrangedSubviews];
  unint64_t v19 = [v18 count];

  if (v17 >= v19)
  {

    goto LABEL_10;
  }
  double v20 = [(MUStackView *)self arrangedSubviews];
  double v21 = [v20 objectAtIndexedSubscript:v17];
  [(MUPlaceVerticalCardContainerView *)self _handleSelectedRowView:v21 atIndex:v17];

LABEL_12:
}

- (void)_handleSelectedRowView:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(MUPlaceVerticalCardContainerView *)self delegate];
  [v7 verticalCardContainerView:self didSelectRow:v6 atIndex:a4];
}

- (void)removeArrangedSubview:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MUPlaceVerticalCardContainerView;
  [(MUStackView *)&v7 removeArrangedSubview:a3];
  double v4 = [(MUStackView *)self arrangedSubviews];
  id v5 = [v4 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if ([(MUPlaceVerticalCardConfiguration *)self->_configuration showSeparators]) {
      [v6 setBottomHairlineHidden:1];
    }
  }
}

- (unint64_t)_indexOfRowAt:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v5 = [(MUStackView *)self arrangedSubviews];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__MUPlaceVerticalCardContainerView__indexOfRowAt___block_invoke;
  v8[3] = &__block_descriptor_48_e23_B32__0__UIView_8Q16_B24l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  unint64_t v6 = [v5 indexOfObjectPassingTest:v8];

  return v6;
}

uint64_t __50__MUPlaceVerticalCardContainerView__indexOfRowAt___block_invoke(CGPoint *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  [v6 frame];
  if (CGRectContainsPoint(v9, a1[2]) && ([v6 isHidden] & 1) == 0) {
    *a4 = 1;
  }
  uint64_t v7 = *a4;

  return v7;
}

- (id)_rowAt:(CGPoint)a3
{
  unint64_t v4 = -[MUPlaceVerticalCardContainerView _indexOfRowAt:](self, "_indexOfRowAt:", a3.x, a3.y);
  id v5 = [(MUStackView *)self arrangedSubviews];
  unint64_t v6 = [v5 count];

  if (v4 >= v6)
  {
    unint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(MUStackView *)self arrangedSubviews];
    unint64_t v8 = [v7 objectAtIndexedSubscript:v4];
  }
  return v8;
}

- (BOOL)shouldInvokeCopyOnLongPress
{
  return MUIdiomInTraitEnvironment(self) != 5;
}

- (MUPlaceVerticalCardContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlaceVerticalCardContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_selectedRow, 0);
}

@end