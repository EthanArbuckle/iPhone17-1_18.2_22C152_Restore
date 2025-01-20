@interface AVMobileContentTabSelectionView
- (AVMobileChromelessControlsStyleSheet)styleSheet;
- (AVMobileContentTab)selectedTab;
- (AVMobileContentTabSelectionView)initWithStyleSheet:(id)a3;
- (AVMobileContentTabSelectionViewDelegate)delegate;
- (CGSize)intrinsicContentSize;
- (NSArray)contentTabs;
- (uint64_t)_scrollToRect:(double)a3 animated:(double)a4;
- (void)_contentTabPressed:(id)a3;
- (void)_scrollToFirstButtonIfPossibleAnimated:(uint64_t)a1;
- (void)_updateGradientFadeoutLocations;
- (void)_updateTabButtons;
- (void)didMoveToSuperview;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)resetSelection;
- (void)selectTab:(id)a3 withReason:(unint64_t)a4;
- (void)setContentTabs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStyleSheet:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation AVMobileContentTabSelectionView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedTab, 0);
  objc_storeStrong((id *)&self->_contentTabs, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_gradientFadeoutLayer, 0);
  objc_storeStrong((id *)&self->_scrollingContentView, 0);

  objc_storeStrong((id *)&self->_tabButtons, 0);
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileContentTabSelectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileContentTabSelectionViewDelegate *)WeakRetained;
}

- (AVMobileContentTab)selectedTab
{
  return self->_selectedTab;
}

- (NSArray)contentTabs
{
  return self->_contentTabs;
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)_contentTabPressed:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NSMutableArray *)self->_tabButtons indexOfObject:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v4;
LABEL_12:
      _os_log_error_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_ERROR, "Error: Could not find button %@ in tap button list.", (uint8_t *)&v10, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  unint64_t v7 = v5;
  if (v5 >= [(NSArray *)self->_contentTabs count])
  {
    v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v4;
      goto LABEL_12;
    }
LABEL_9:

    goto LABEL_10;
  }
  v8 = [(NSArray *)self->_contentTabs objectAtIndex:v7];
  v9 = [(AVMobileContentTabSelectionView *)self selectedTab];

  if (v8 == v9)
  {

    v8 = 0;
  }
  [(AVMobileContentTabSelectionView *)self selectTab:v8 withReason:0];

LABEL_10:
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AVMobileContentTabSelectionView;
  if ([(AVMobileContentTabSelectionView *)&v6 isUserInteractionEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileContentTabSelectionView;
    [(AVMobileContentTabSelectionView *)&v5 setUserInteractionEnabled:v3];
    -[AVMobileContentTabSelectionView _updateTabButtons]((id *)&self->super.super.super.isa);
  }
}

- (void)_updateTabButtons
{
  v64[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    v2 = [a1 window];

    if (v2)
    {
      BOOL v3 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;
      unint64_t v4 = [v1[51] count];
      objc_super v5 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;
      unint64_t v6 = [v1[55] count];
      if (v4 <= v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = v4;
      }
      if (v7 >= 1)
      {
        unint64_t v8 = 0;
        uint64_t v46 = *MEMORY[0x1E4F39EA8];
        uint64_t v9 = *MEMORY[0x1E4FB06F8];
        uint64_t v47 = *MEMORY[0x1E4FB27D0];
        uint64_t v48 = v7;
        uint64_t v57 = *MEMORY[0x1E4FB0700];
        uint64_t v58 = *MEMORY[0x1E4FB06F8];
        v56 = v1;
        do
        {
          if ([*(id *)((char *)v1 + v5[878]) count] <= v8)
          {
            int v10 = [*(id *)((char *)v1 + v3[877]) lastObject];
            [v10 removeFromSuperview];
            [*(id *)((char *)v1 + v3[877]) removeLastObject];
          }
          if ([*(id *)((char *)v1 + v5[878]) count] > v8)
          {
            if ([*(id *)((char *)v1 + v3[877]) count] <= v8)
            {
              id v11 = +[AVButton buttonWithAccessibilityIdentifier:&stru_1F09185C8 accessibilityLabel:0 isSecondGeneration:1];
              [v11 setPointerStyleProvider:&__block_literal_global_13034];
              uint64_t v12 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
              objc_msgSend(v12, "setContentInsets:", 5.0, 11.0, 5.0, 11.0);
              v13 = [v11 layer];
              [v13 setBorderWidth:1.0];

              v14 = [v11 layer];
              [v14 setCornerRadius:7.0];

              v15 = [v11 layer];
              [v15 setCornerCurve:v46];

              [v11 setConfiguration:v12];
              [v11 addTarget:v1 action:sel__contentTabPressed_ forControlEvents:64];
              [v1[52] addSubview:v11];
              [*(id *)((char *)v1 + v3[877]) addObject:v11];
            }
            v16 = [*(id *)((char *)v1 + v5[878]) objectAtIndex:v8];
            id v17 = [*(id *)((char *)v1 + v3[877]) objectAtIndex:v8];
            v18 = v1;
            id v19 = v16;
            v20 = [v18 styleSheet];
            uint64_t v21 = [MEMORY[0x1E4FB1618] blackColor];
            v52 = [MEMORY[0x1E4FB1618] whiteColor];
            id v22 = objc_alloc(MEMORY[0x1E4F28E48]);
            v23 = [v19 displayName];
            v63[0] = v9;
            v54 = v20;
            v24 = [v20 contentTabLabelFont];
            v63[1] = v57;
            v64[0] = v24;
            v51 = (void *)v21;
            v64[1] = v21;
            v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
            v26 = (void *)[v22 initWithString:v23 attributes:v25];

            id v27 = [MEMORY[0x1E4FB1618] whiteColor];
            uint64_t v49 = [v27 CGColor];

            v28 = [v19 displayName];
            uint64_t v29 = [v28 length];

            uint64_t v50 = v29;
            if (v18[56] == v19)
            {
              v31 = v52;
              v32 = v54;
              v35 = v51;
            }
            else
            {
              uint64_t v30 = [MEMORY[0x1E4FB1618] whiteColor];

              v31 = [MEMORY[0x1E4FB1618] clearColor];

              v61[0] = v58;
              v32 = v54;
              v33 = [v54 contentTabLabelFont];
              v61[1] = v57;
              v62[0] = v33;
              v62[1] = v30;
              v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
              objc_msgSend(v26, "setAttributes:range:", v34, 0, v29);

              v35 = (void *)v30;
            }
            [v17 setAttributedTitle:v26 forState:0];
            unsigned int v55 = [v56 isUserInteractionEnabled];
            if (v55)
            {
              BOOL v3 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;
              uint64_t v36 = v49;
            }
            else
            {
              uint64_t v37 = [MEMORY[0x1E4FB1618] systemGrayColor];

              uint64_t v53 = [MEMORY[0x1E4FB1618] clearColor];

              v59[0] = v58;
              v38 = [v32 contentTabLabelFont];
              v59[1] = v57;
              v60[0] = v38;
              v60[1] = v37;
              v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
              objc_msgSend(v26, "setAttributes:range:", v39, 0, v50);

              id v40 = [MEMORY[0x1E4FB1618] systemGrayColor];
              uint64_t v36 = [v40 CGColor];

              [v17 setAttributedTitle:v26 forState:2];
              v31 = (void *)v53;
              v35 = (void *)v37;
              BOOL v3 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;
            }
            v41 = [v17 layer];
            [v41 setBorderColor:v36];

            BOOL v42 = v56[56] == v19;
            [v17 setMaximumContentSizeCategory:v47];
            [v17 setSelected:v42];
            [v17 setBackgroundColor:v31];
            [v17 setTintColor:v31];
            [v17 setEnabled:v55];
            v43 = [v19 displayName];
            [v17 setAccessibilityLabel:v43];

            v44 = [v19 accessibilityIdentifier];
            [v17 setAccessibilityIdentifier:v44];

            [v17 setHighlighted:0];
            v1 = v56;
            objc_super v5 = &OBJC_IVAR___AVNewsWidgetPlayerBehavior__behaviorContext;
            uint64_t v7 = v48;
            uint64_t v9 = v58;
          }
          ++v8;
        }
        while (v7 != v8);
      }
      [v1 invalidateIntrinsicContentSize];
      v45 = [v1 superview];
      objc_msgSend(v45, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v1);

      [v1 setNeedsLayout];
    }
  }
}

id __69__AVMobileContentTabSelectionView__setupPointerInteractionForButton___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4FB1D48];
  id v3 = a2;
  unint64_t v4 = (void *)[[v2 alloc] initWithView:v3];

  objc_super v5 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v4];
  unint64_t v6 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v5 shape:0];

  return v6;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)AVMobileContentTabSelectionView;
  [(AVMobileContentTabSelectionView *)&v25 layoutSubviews];
  uint64_t v3 = [(AVMobileContentTabSelectionView *)self effectiveUserInterfaceLayoutDirection];
  [(AVMobileContentTabSelectionView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ([(NSMutableArray *)self->_tabButtons count])
  {
    unint64_t v14 = 0;
    do
    {
      v15 = [(NSMutableArray *)self->_tabButtons objectAtIndex:v14];
      [v15 intrinsicContentSize];
      if (v12 < v17) {
        double v12 = v17;
      }
      double v13 = v13 + v16;
      if (v14 != [(NSMutableArray *)self->_tabButtons count] - 1) {
        double v13 = v13 + 10.0;
      }

      ++v14;
    }
    while (v14 < [(NSMutableArray *)self->_tabButtons count]);
  }
  -[UIScrollView setFrame:](self->_scrollingContentView, "setFrame:", v5, v7, v9, v11);
  -[UIScrollView setContentSize:](self->_scrollingContentView, "setContentSize:", v13, v12);
  -[CAGradientLayer setFrame:](self->_gradientFadeoutLayer, "setFrame:", v5, v7, v9, v11);
  if ([(NSMutableArray *)self->_tabButtons count])
  {
    unint64_t v18 = 0;
    double v19 = 0.0;
    do
    {
      v20 = [(NSMutableArray *)self->_tabButtons objectAtIndex:v18];
      [v20 intrinsicContentSize];
      double v23 = v21;
      if (v18) {
        double v19 = v19 + 10.0;
      }
      if (v11 >= v22) {
        double v24 = v22;
      }
      else {
        double v24 = v11;
      }
      objc_msgSend(v20, "avkit_setFrame:inLayoutDirection:", v3, v19, (v11 - v24) * 0.5, v21);
      double v19 = v19 + v23;

      ++v18;
    }
    while (v18 < [(NSMutableArray *)self->_tabButtons count]);
  }
  -[AVMobileContentTabSelectionView _updateGradientFadeoutLocations]((id *)&self->super.super.super.isa);
}

- (void)_updateGradientFadeoutLocations
{
  v7[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 bounds];
    v7[0] = &unk_1F094A638;
    double v3 = (v2 + -30.0) / v2;
    double v4 = [NSNumber numberWithDouble:30.0 / v2];
    v7[1] = v4;
    double v5 = [NSNumber numberWithDouble:v3];
    v7[2] = v5;
    v7[3] = &unk_1F094A648;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];

    [a1[53] setLocations:v6];
  }
}

- (void)layoutMarginsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)AVMobileContentTabSelectionView;
  [(AVMobileContentTabSelectionView *)&v7 layoutMarginsDidChange];
  if (self)
  {
    if (self->_scrollingContentView)
    {
      double v3 = *MEMORY[0x1E4FB2848];
      double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      [(AVMobileContentTabSelectionView *)self layoutMargins];
      double v6 = v5;
      [(AVMobileContentTabSelectionView *)self layoutMargins];
      -[UIScrollView setContentInset:](self->_scrollingContentView, "setContentInset:", v3, v6, v4);
    }
  }
}

- (CGSize)intrinsicContentSize
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)AVMobileContentTabSelectionView;
  [(AVMobileContentTabSelectionView *)&v17 intrinsicContentSize];
  double v4 = v3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = self->_tabButtons;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "intrinsicContentSize", (void)v13);
        if (v4 < v10) {
          double v4 = v10;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  double v11 = v4 + 5.0;
  double v12 = *MEMORY[0x1E4FB30D8];
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)didMoveToSuperview
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)AVMobileContentTabSelectionView;
  [(AVMobileContentTabSelectionView *)&v15 didMoveToSuperview];
  if (self)
  {
    if (!self->_gradientFadeoutLayer)
    {
      id v3 = [MEMORY[0x1E4FB1618] blackColor];
      double v4 = [v3 CGColor];

      id v5 = [MEMORY[0x1E4FB1618] clearColor];
      uint64_t v6 = [v5 CGColor];

      uint64_t v7 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
      gradientFadeoutLayer = self->_gradientFadeoutLayer;
      self->_gradientFadeoutLayer = v7;

      uint64_t v9 = self->_gradientFadeoutLayer;
      v16[0] = v6;
      v16[1] = v4;
      v16[2] = v4;
      v16[3] = v6;
      double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
      [(CAGradientLayer *)v9 setColors:v10];

      -[CAGradientLayer setStartPoint:](self->_gradientFadeoutLayer, "setStartPoint:", 0.0, 0.5);
      -[CAGradientLayer setEndPoint:](self->_gradientFadeoutLayer, "setEndPoint:", 1.0, 0.5);
      -[AVMobileContentTabSelectionView _updateGradientFadeoutLocations]((id *)&self->super.super.super.isa);
    }
    if (!self->_scrollingContentView)
    {
      id v11 = objc_alloc(MEMORY[0x1E4FB1BE0]);
      double v12 = (UIScrollView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      scrollingContentView = self->_scrollingContentView;
      self->_scrollingContentView = v12;

      [(UIScrollView *)self->_scrollingContentView setShowsVerticalScrollIndicator:0];
      [(UIScrollView *)self->_scrollingContentView setShowsHorizontalScrollIndicator:0];
      -[UIScrollView setContentOffset:](self->_scrollingContentView, "setContentOffset:", -30.0, 0.0);
      long long v14 = [(AVMobileContentTabSelectionView *)self layer];
      [v14 setMask:self->_gradientFadeoutLayer];

      [(AVMobileContentTabSelectionView *)self addSubview:self->_scrollingContentView];
    }
  }
  -[AVMobileContentTabSelectionView _updateTabButtons]((id *)&self->super.super.super.isa);
  -[AVMobileContentTabSelectionView _scrollToFirstButtonIfPossibleAnimated:]((uint64_t)self);
}

- (void)_scrollToFirstButtonIfPossibleAnimated:(uint64_t)a1
{
  if (a1 && [*(id *)(a1 + 408) count])
  {
    id v6 = [*(id *)(a1 + 408) objectAtIndex:0];
    [v6 frame];
    -[AVMobileContentTabSelectionView _scrollToRect:animated:](a1, v2, v3, v4, v5);
  }
}

- (uint64_t)_scrollToRect:(double)a3 animated:(double)a4
{
  if (*(void *)(result + 416))
  {
    uint64_t v9 = result;
    CGSize result = CGRectEqualToRect(*(CGRect *)&a2, *MEMORY[0x1E4F1DB28]);
    if ((result & 1) == 0)
    {
      double v10 = *(void **)(v9 + 416);
      return objc_msgSend(v10, "scrollRectToVisible:animated:", 0, a2, a3, a4, a5);
    }
  }
  return result;
}

- (void)resetSelection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(AVMobileContentTabSelectionView *)self selectTab:0 withReason:1];
  if (self)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    double v3 = self->_tabButtons;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setHighlighted:", 0, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(AVMobileContentTabSelectionView *)self setNeedsLayout];
  }
}

- (void)selectTab:(id)a3 withReason:(unint64_t)a4
{
  uint64_t v7 = (AVMobileContentTab *)a3;
  long long v8 = v7;
  p_selectedTab = &self->_selectedTab;
  if (self->_selectedTab != v7)
  {
    v20 = v7;
    objc_storeStrong((id *)&self->_selectedTab, a3);
    long long v10 = [(AVMobileContentTabSelectionView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v10 contentTabSelectionView:self didChangeSelectedTabTo:*p_selectedTab withReason:a4];
    }

    -[AVMobileContentTabSelectionView _updateTabButtons]((id *)&self->super.super.super.isa);
    uint64_t v7 = (AVMobileContentTab *)[(NSMutableArray *)self->_tabButtons count];
    long long v8 = v20;
    if (v7 && *p_selectedTab)
    {
      long long v11 = -[NSMutableArray objectAtIndex:](self->_tabButtons, "objectAtIndex:", -[NSArray indexOfObject:](self->_contentTabs, "indexOfObject:"));
      [v11 frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      uint64_t v7 = (AVMobileContentTab *)-[AVMobileContentTabSelectionView _scrollToRect:animated:]((uint64_t)self, v13, v15, v17, v19);
      long long v8 = v20;
    }
  }

  MEMORY[0x1F41817F8](v7, v8);
}

- (void)setContentTabs:(id)a3
{
  if (self->_contentTabs != a3)
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:");
    uint64_t v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    contentTabs = self->_contentTabs;
    self->_contentTabs = v4;

    if (![(NSArray *)self->_contentTabs containsObject:self->_selectedTab]) {
      [(AVMobileContentTabSelectionView *)self selectTab:0 withReason:1];
    }
    -[AVMobileContentTabSelectionView _updateTabButtons]((id *)&self->super.super.super.isa);
    -[AVMobileContentTabSelectionView _scrollToFirstButtonIfPossibleAnimated:]((uint64_t)self);
    [(AVMobileContentTabSelectionView *)self invalidateIntrinsicContentSize];
    id v6 = [(AVMobileContentTabSelectionView *)self superview];
    objc_msgSend(v6, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);
  }
}

- (void)setStyleSheet:(id)a3
{
  uint64_t v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  p_styleSheet = &self->_styleSheet;
  if (self->_styleSheet != v5)
  {
    long long v8 = v5;
    objc_storeStrong((id *)p_styleSheet, a3);
    -[AVMobileContentTabSelectionView _updateTabButtons]((id *)&self->super.super.super.isa);
    [(AVMobileContentTabSelectionView *)self invalidateIntrinsicContentSize];
    uint64_t v7 = [(AVMobileContentTabSelectionView *)self superview];
    objc_msgSend(v7, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

    uint64_t v5 = v8;
  }

  MEMORY[0x1F41817F8](p_styleSheet, v5);
}

- (AVMobileContentTabSelectionView)initWithStyleSheet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileContentTabSelectionView;
  id v6 = [(AVMobileContentTabSelectionView *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    tabButtons = v7->_tabButtons;
    v7->_tabButtons = (NSMutableArray *)v8;

    [(AVMobileContentTabSelectionView *)v7 setInsetsLayoutMarginsFromSafeArea:0];
  }

  return v7;
}

@end