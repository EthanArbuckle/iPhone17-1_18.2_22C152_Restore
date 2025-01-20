@interface MUScrollableSegmentedPickerContentView
- (MUScrollableSegmentedPickerContentView)initWithFrame:(CGRect)a3;
- (MUScrollableSegmentedPickerContentViewDelegate)delegate;
- (NSArray)viewModels;
- (double)idealWidthForProposedSize:(CGSize)a3;
- (unint64_t)selectedIndex;
- (void)_handleTapWithSegmentView:(id)a3;
- (void)_setSelectedIndex:(unint64_t)a3 animated:(BOOL)a4 invokeDelegate:(BOOL)a5;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateForContentSizeCategoryChange;
- (void)_updateGradientColors;
- (void)_updateGradientVisibility;
- (void)_updateSelectedIndexAnimated:(BOOL)a3 invokeDelegate:(BOOL)a4;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setSelectedIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setViewModels:(id)a3;
@end

@implementation MUScrollableSegmentedPickerContentView

- (MUScrollableSegmentedPickerContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUScrollableSegmentedPickerContentView;
  v3 = -[MUScrollableSegmentedPickerContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MUScrollableSegmentedPickerContentView *)v3 _setupSubviews];
  }
  return v4;
}

- (void)_setupSubviews
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
  v5 = (UIVisualEffectView *)[v3 initWithEffect:v4];
  backgroundBlurView = self->_backgroundBlurView;
  self->_backgroundBlurView = v5;

  [(UIVisualEffectView *)self->_backgroundBlurView setClipsToBounds:1];
  [(MUScrollableSegmentedPickerContentView *)self addSubview:self->_backgroundBlurView];
  v7 = [MUScrollableStackView alloc];
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v12 = -[MUScrollableStackView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
  contentStackView = self->_contentStackView;
  self->_contentStackView = v12;

  [(MUScrollableStackView *)self->_contentStackView setAxis:0];
  [(MUScrollableStackView *)self->_contentStackView setDelegate:self];
  v14 = [(UIVisualEffectView *)self->_backgroundBlurView contentView];
  [v14 addSubview:self->_contentStackView];

  v15 = [MUEdgeLayout alloc];
  v16 = self->_contentStackView;
  v17 = [(UIVisualEffectView *)self->_backgroundBlurView contentView];
  v50 = [(MUEdgeLayout *)v15 initWithItem:v16 container:v17];

  [(MUConstraintLayout *)v50 activate];
  v49 = [[MUEdgeLayout alloc] initWithItem:self->_backgroundBlurView container:self];
  [(MUConstraintLayout *)v49 activate];
  id v18 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v19 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
  v20 = (UIVisualEffectView *)[v18 initWithEffect:v19];
  selectedPillView = self->_selectedPillView;
  self->_selectedPillView = v20;

  [(UIVisualEffectView *)self->_selectedPillView setClipsToBounds:1];
  v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:0.45];
  v23 = [(UIVisualEffectView *)self->_selectedPillView contentView];
  [v23 setBackgroundColor:v22];

  [(MUScrollableStackView *)self->_contentStackView addSubview:self->_selectedPillView];
  [(MUScrollableStackView *)self->_contentStackView sendSubviewToBack:self->_selectedPillView];
  v24 = -[_MKGradientView initWithFrame:]([MUGradientView alloc], "initWithFrame:", v8, v9, v10, v11);
  leadingGradientOverlayView = self->_leadingGradientOverlayView;
  self->_leadingGradientOverlayView = v24;

  [(MUGradientView *)self->_leadingGradientOverlayView setUserInteractionEnabled:0];
  [(_MKGradientView *)self->_leadingGradientOverlayView setLocations:&unk_1EE4050F0];
  -[_MKGradientView setStartPoint:](self->_leadingGradientOverlayView, "setStartPoint:", 0.0, 0.5);
  -[_MKGradientView setEndPoint:](self->_leadingGradientOverlayView, "setEndPoint:", 1.0, 0.5);
  [(MUScrollableSegmentedPickerContentView *)self addSubview:self->_leadingGradientOverlayView];
  v26 = [MUSizeLayout alloc];
  v27 = self->_leadingGradientOverlayView;
  +[MUSizeLayout useIntrinsicContentSize];
  v29 = -[MUSizeLayout initWithItem:size:](v26, "initWithItem:size:", v27, 32.0, v28);
  v30 = [[MUEdgeLayout alloc] initWithItem:self->_leadingGradientOverlayView container:self];
  [(MUEdgeLayout *)v30 setEdges:7];
  v31 = (void *)MEMORY[0x1E4F28DC8];
  v54[0] = v29;
  v54[1] = v30;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  objc_msgSend(v31, "_mapsui_activateLayouts:", v32);

  v33 = -[_MKGradientView initWithFrame:]([MUGradientView alloc], "initWithFrame:", v8, v9, v10, v11);
  trailingGradientOverlayView = self->_trailingGradientOverlayView;
  self->_trailingGradientOverlayView = v33;

  [(MUGradientView *)self->_trailingGradientOverlayView setUserInteractionEnabled:0];
  [(_MKGradientView *)self->_trailingGradientOverlayView setLocations:&unk_1EE4050F0];
  -[_MKGradientView setStartPoint:](self->_trailingGradientOverlayView, "setStartPoint:", 1.0, 0.5);
  -[_MKGradientView setEndPoint:](self->_trailingGradientOverlayView, "setEndPoint:", 0.0, 0.5);
  [(MUScrollableSegmentedPickerContentView *)self addSubview:self->_trailingGradientOverlayView];
  v35 = [MUSizeLayout alloc];
  v36 = self->_trailingGradientOverlayView;
  +[MUSizeLayout useIntrinsicContentSize];
  v38 = -[MUSizeLayout initWithItem:size:](v35, "initWithItem:size:", v36, 32.0, v37);
  v39 = [[MUEdgeLayout alloc] initWithItem:self->_trailingGradientOverlayView container:self];
  [(MUEdgeLayout *)v39 setEdges:13];
  v40 = (void *)MEMORY[0x1E4F28DC8];
  v53[0] = v38;
  v53[1] = v39;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  objc_msgSend(v40, "_mapsui_activateLayouts:", v41);

  [(MUScrollableSegmentedPickerContentView *)self _updateGradientColors];
  v42 = [(MUScrollableSegmentedPickerContentView *)self layer];
  [v42 setAllowsGroupOpacity:0];

  v43 = self;
  v52 = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  id v45 = (id)[(MUScrollableSegmentedPickerContentView *)self registerForTraitChanges:v44 withAction:sel__updateForContentSizeCategoryChange];

  v46 = self;
  v51 = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  id v48 = (id)[(MUScrollableSegmentedPickerContentView *)self registerForTraitChanges:v47 withAction:sel__updateGradientColors];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MUScrollableSegmentedPickerContentView;
  [(MUScrollableSegmentedPickerContentView *)&v13 layoutSubviews];
  [(MUScrollableSegmentedPickerContentView *)self bounds];
  double Height = CGRectGetHeight(v14);
  v4 = [(MUScrollableSegmentedPickerContentView *)self traitCollection];
  uint64_t v5 = [v4 layoutDirection];

  uint64_t v6 = v5 + 1;
  if ((unint64_t)(v5 + 1) > 2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = qword_19335B808[v6];
    uint64_t v8 = qword_19335B820[v6];
  }
  double v9 = Height * 0.5;
  [(UIVisualEffectView *)self->_backgroundBlurView _setCornerRadius:1 continuous:15 maskedCorners:v9];
  [(MUGradientView *)self->_leadingGradientOverlayView _setContinuousCornerRadius:v9];
  double v10 = [(MUGradientView *)self->_leadingGradientOverlayView layer];
  [v10 setMaskedCorners:v8];

  [(MUGradientView *)self->_trailingGradientOverlayView _setContinuousCornerRadius:v9];
  double v11 = [(MUGradientView *)self->_trailingGradientOverlayView layer];
  [v11 setMaskedCorners:v7];

  [(MUScrollableSegmentedPickerContentView *)self _updateSelectedIndexAnimated:0 invokeDelegate:0];
  selectedPillView = self->_selectedPillView;
  [(UIVisualEffectView *)selectedPillView bounds];
  [(UIVisualEffectView *)selectedPillView _setCornerRadius:1 continuous:15 maskedCorners:CGRectGetHeight(v15) * 0.5];
}

- (double)idealWidthForProposedSize:(CGSize)a3
{
  double width = a3.width;
  -[MUScrollableStackView systemLayoutSizeFittingSize:](self->_contentStackView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  if (width < result) {
    return width;
  }
  return result;
}

- (void)setSelectedIndex:(unint64_t)a3
{
}

- (void)setSelectedIndex:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)_setSelectedIndex:(unint64_t)a3 animated:(BOOL)a4 invokeDelegate:(BOOL)a5
{
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    [(MUScrollableSegmentedPickerContentView *)self _updateSelectedIndexAnimated:a4 invokeDelegate:a5];
  }
}

- (void)_updateSelectedIndexAnimated:(BOOL)a3 invokeDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unint64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex >= [(NSArray *)self->_viewModels count]) {
    self->_unint64_t selectedIndex = 0;
  }
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained segmentedPickerContentViewDidUpdateSelection:self];
  }
  double v9 = [(MUScrollableStackView *)self->_contentStackView arrangedSubviews];
  double v10 = [v9 objectAtIndexedSubscript:self->_selectedIndex];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__MUScrollableSegmentedPickerContentView__updateSelectedIndexAnimated_invokeDelegate___block_invoke;
  aBlock[3] = &unk_1E574F110;
  objc_copyWeak(&v21, &location);
  id v11 = v10;
  id v20 = v11;
  v12 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __86__MUScrollableSegmentedPickerContentView__updateSelectedIndexAnimated_invokeDelegate___block_invoke_2;
  v17 = &unk_1E574F3A8;
  objc_copyWeak(&v18, &location);
  objc_super v13 = (void (**)(void))_Block_copy(&v14);
  if (v5) {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 0, v12, 0, 0.300000012, 0.0, v14, v15, v16, v17);
  }
  else {
    v12[2](v12);
  }
  v13[2](v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __86__MUScrollableSegmentedPickerContentView__updateSelectedIndexAnimated_invokeDelegate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) frame];
    CGRect v15 = CGRectInset(v14, 4.0, 4.0);
    objc_msgSend(WeakRetained[53], "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    [*(id *)(a1 + 32) center];
    objc_msgSend(WeakRetained[53], "setCenter:");
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = objc_msgSend(WeakRetained[51], "arrangedSubviews", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
          [*(id *)(*((void *)&v8 + 1) + 8 * v7) setSelected:*(void *)(*((void *)&v8 + 1) + 8 * v7) == *(void *)(a1 + 32)];
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

void __86__MUScrollableSegmentedPickerContentView__updateSelectedIndexAnimated_invokeDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateGradientVisibility];
    id WeakRetained = v2;
  }
}

- (void)setViewModels:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_viewModels, "isEqual:") & 1) == 0)
  {
    uint64_t v4 = (NSArray *)[v6 copy];
    viewModels = self->_viewModels;
    self->_viewModels = v4;

    [(MUScrollableSegmentedPickerContentView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  objc_initWeak(&location, self);
  viewModels = self->_viewModels;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __59__MUScrollableSegmentedPickerContentView__updateAppearance__block_invoke;
  long long v8 = &unk_1E57500F0;
  objc_copyWeak(&v9, &location);
  uint64_t v4 = MUMap(viewModels, &v5);
  -[MUScrollableStackView setArrangedSubviews:](self->_contentStackView, "setArrangedSubviews:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

MUScrollableSegmentedPickerSegmentView *__59__MUScrollableSegmentedPickerContentView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MUScrollableSegmentedPickerSegmentView alloc];
  uint64_t v5 = -[MUScrollableSegmentedPickerSegmentView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MUScrollableSegmentedPickerSegmentView *)v5 setViewModel:v3];
  [(MUScrollableSegmentedPickerSegmentView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __59__MUScrollableSegmentedPickerContentView__updateAppearance__block_invoke_2;
  uint64_t v13 = &unk_1E574EC08;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  uint64_t v7 = v5;
  CGRect v14 = v7;
  long long v8 = [v6 actionWithHandler:&v10];
  -[MUScrollableSegmentedPickerSegmentView addAction:forControlEvents:](v7, "addAction:forControlEvents:", v8, 64, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
  return v7;
}

void __59__MUScrollableSegmentedPickerContentView__updateAppearance__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleTapWithSegmentView:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_updateGradientVisibility
{
  id v3 = [(MUScrollableSegmentedPickerContentView *)self traitCollection];
  uint64_t v4 = [v3 layoutDirection];

  if ((unint64_t)(v4 + 1) >= 2)
  {
    if (v4 == 1)
    {
      [(MUScrollableStackView *)self->_contentStackView contentOffset];
      double v13 = v12;
      [(MUScrollableStackView *)self->_contentStackView frame];
      double v14 = v13 + CGRectGetWidth(v20);
      [(MUScrollableStackView *)self->_contentStackView contentSize];
      BOOL v6 = v14 >= v15;
      [(MUScrollableStackView *)self->_contentStackView contentOffset];
      BOOL v11 = v16 <= 0.0;
    }
    else
    {
      BOOL v11 = 0;
      BOOL v6 = 0;
    }
  }
  else
  {
    [(MUScrollableStackView *)self->_contentStackView contentOffset];
    BOOL v6 = v5 <= 0.0;
    [(MUScrollableStackView *)self->_contentStackView contentOffset];
    double v8 = v7;
    [(MUScrollableStackView *)self->_contentStackView frame];
    double v9 = v8 + CGRectGetWidth(v19);
    [(MUScrollableStackView *)self->_contentStackView contentSize];
    BOOL v11 = v9 >= v10;
  }
  [(MUGradientView *)self->_leadingGradientOverlayView setHidden:v6];
  trailingGradientOverlayView = self->_trailingGradientOverlayView;
  [(MUGradientView *)trailingGradientOverlayView setHidden:v11];
}

- (void)_handleTapWithSegmentView:(id)a3
{
  contentStackView = self->_contentStackView;
  id v5 = a3;
  BOOL v6 = [(MUScrollableStackView *)contentStackView arrangedSubviews];
  uint64_t v7 = [v6 indexOfObject:v5];

  [(MUScrollableSegmentedPickerContentView *)self _setSelectedIndex:v7 animated:1 invokeDelegate:1];
}

- (void)_updateForContentSizeCategoryChange
{
}

- (void)_updateGradientColors
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(MUScrollableSegmentedPickerContentView *)self traitCollection];
  if ([v3 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  uint64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];
  }

  id v5 = [v4 colorWithAlphaComponent:0.300000012];
  BOOL v6 = objc_msgSend(v4, "colorWithAlphaComponent:", 0.200000003, v5);
  v13[1] = v6;
  uint64_t v7 = [v4 colorWithAlphaComponent:0.0];
  v13[2] = v7;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];

  double v9 = [(MUScrollableSegmentedPickerContentView *)self traitCollection];
  uint64_t v10 = [v9 layoutDirection];

  if (v10 == 1)
  {
    BOOL v11 = [v8 reverseObjectEnumerator];
    uint64_t v12 = [v11 allObjects];

    double v8 = (void *)v12;
  }
  [(_MKGradientView *)self->_leadingGradientOverlayView setColors:v8];
  [(_MKGradientView *)self->_trailingGradientOverlayView setColors:v8];
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (MUScrollableSegmentedPickerContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUScrollableSegmentedPickerContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_trailingGradientOverlayView, 0);
  objc_storeStrong((id *)&self->_leadingGradientOverlayView, 0);
  objc_storeStrong((id *)&self->_selectedPillView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end