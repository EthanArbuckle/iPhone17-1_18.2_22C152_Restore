@interface MUPagingScrollControlsView
- (BOOL)automaticallyFlipsForRTL;
- (BOOL)hoverActive;
- (BOOL)shouldFlipPagingDirection;
- (MUPagingScrollControlsView)initWithHorizontalScrollView:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_adjustScrollIndexByOffset:(int64_t)a3;
- (void)_scrollNext;
- (void)_scrollPrevious;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateChevronVisibility;
- (void)handleHover:(id)a3;
- (void)setAutomaticallyFlipsForRTL:(BOOL)a3;
- (void)setHoverActive:(BOOL)a3;
@end

@implementation MUPagingScrollControlsView

- (MUPagingScrollControlsView)initWithHorizontalScrollView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPagingScrollControlsView;
  v6 = -[MUPagingScrollControlsView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollView, a3);
    [(MUPagingScrollControlsView *)v7 _setupSubviews];
    [(MUPagingScrollControlsView *)v7 _setupConstraints];
  }

  return v7;
}

- (void)_setupSubviews
{
  id v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.compact.left"];
  v3 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  previousPageButton = self->_previousPageButton;
  self->_previousPageButton = v3;

  [(UIButton *)self->_previousPageButton setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UIButton *)self->_previousPageButton setTintColor:v5];

  [(UIButton *)self->_previousPageButton setAlpha:0.0];
  [(UIButton *)self->_previousPageButton setImage:v15 forState:0];
  v6 = self->_previousPageButton;
  v7 = [MEMORY[0x1E4FB1830] configurationWithPointSize:21.0];
  [(UIButton *)v6 setPreferredSymbolConfiguration:v7 forImageInState:0];

  [(UIButton *)self->_previousPageButton addTarget:self action:sel__scrollPrevious forControlEvents:64];
  [(MUPagingScrollControlsView *)self addSubview:self->_previousPageButton];
  v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.compact.right"];
  objc_super v9 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  nextPageButton = self->_nextPageButton;
  self->_nextPageButton = v9;

  [(UIButton *)self->_nextPageButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UIButton *)self->_nextPageButton setTintColor:v11];

  [(UIButton *)self->_nextPageButton setAlpha:0.0];
  [(UIButton *)self->_nextPageButton setImage:v8 forState:0];
  v12 = self->_nextPageButton;
  v13 = [MEMORY[0x1E4FB1830] configurationWithPointSize:21.0];
  [(UIButton *)v12 setPreferredSymbolConfiguration:v13 forImageInState:0];

  [(UIButton *)self->_nextPageButton addTarget:self action:sel__scrollNext forControlEvents:64];
  [(MUPagingScrollControlsView *)self addSubview:self->_nextPageButton];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:self action:sel_handleHover_];
  [(MUPagingScrollControlsView *)self addGestureRecognizer:v14];
}

- (void)_setupConstraints
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = [(UIButton *)self->_previousPageButton centerYAnchor];
  v17 = [(MUPagingScrollControlsView *)self centerYAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  id v15 = [(UIButton *)self->_nextPageButton centerYAnchor];
  v4 = [(MUPagingScrollControlsView *)self centerYAnchor];
  id v5 = [v15 constraintEqualToAnchor:v4];
  v19[1] = v5;
  v6 = [(UIButton *)self->_previousPageButton leftAnchor];
  v7 = [(MUPagingScrollControlsView *)self leftAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v19[2] = v8;
  objc_super v9 = [(UIButton *)self->_nextPageButton rightAnchor];
  v10 = [(MUPagingScrollControlsView *)self rightAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v19[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v3 addObjectsFromArray:v12];

  v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = (void *)[v3 copy];
  [v13 activateConstraints:v14];
}

- (void)handleHover:(id)a3
{
  BOOL v4 = (unint64_t)([a3 state] - 1) < 2;
  [(MUPagingScrollControlsView *)self setHoverActive:v4];
}

- (void)setHoverActive:(BOOL)a3
{
  if (self->_hoverActive != a3)
  {
    self->_hoverActive = a3;
    [(MUPagingScrollControlsView *)self _updateChevronVisibility];
  }
}

- (BOOL)shouldFlipPagingDirection
{
  BOOL v3 = [(UIView *)self _mapsui_isRTL];
  if (v3)
  {
    LOBYTE(v3) = [(MUPagingScrollControlsView *)self automaticallyFlipsForRTL];
  }
  return v3;
}

- (void)_updateChevronVisibility
{
  [(MUScrollViewProtocol *)self->_scrollView frame];
  double Width = CGRectGetWidth(v16);
  [(MUScrollViewProtocol *)self->_scrollView contentSize];
  double v5 = v4 - Width;
  [(MUScrollViewProtocol *)self->_scrollView contentOffset];
  BOOL v7 = v6 <= 0.0;
  [(MUScrollViewProtocol *)self->_scrollView contentOffset];
  BOOL v9 = v8 >= v5;
  BOOL v10 = [(MUPagingScrollControlsView *)self shouldFlipPagingDirection];
  if (v10) {
    BOOL v11 = v7;
  }
  else {
    BOOL v11 = v9;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__MUPagingScrollControlsView__updateChevronVisibility__block_invoke;
  v13[3] = &unk_1E574FE10;
  v13[4] = self;
  if (v10) {
    BOOL v12 = v9;
  }
  else {
    BOOL v12 = v7;
  }
  BOOL v14 = v12;
  BOOL v15 = v11;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v13 animations:0.2];
}

uint64_t __54__MUPagingScrollControlsView__updateChevronVisibility__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hoverActive];
  double v3 = 0.0;
  double v4 = 0.0;
  if (v2 && !*(unsigned char *)(a1 + 40)) {
    double v4 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:v4];
  if ([*(id *)(a1 + 32) hoverActive])
  {
    if (*(unsigned char *)(a1 + 41)) {
      double v3 = 0.0;
    }
    else {
      double v3 = 1.0;
    }
  }
  double v5 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v5 setAlpha:v3];
}

- (void)_scrollPrevious
{
  if ([(MUPagingScrollControlsView *)self shouldFlipPagingDirection]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = -1;
  }
  [(MUPagingScrollControlsView *)self _adjustScrollIndexByOffset:v3];
}

- (void)_scrollNext
{
  if ([(MUPagingScrollControlsView *)self shouldFlipPagingDirection]) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = 1;
  }
  [(MUPagingScrollControlsView *)self _adjustScrollIndexByOffset:v3];
}

- (void)_adjustScrollIndexByOffset:(int64_t)a3
{
  [(MUScrollViewProtocol *)self->_scrollView frame];
  double Width = CGRectGetWidth(v12);
  [(MUScrollViewProtocol *)self->_scrollView contentOffset];
  double v7 = round(v6 / Width);
  [(MUScrollViewProtocol *)self->_scrollView contentSize];
  double v9 = v8 - Width;
  double v10 = Width * fmax(v7 + (double)a3, 0.0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__MUPagingScrollControlsView__adjustScrollIndexByOffset___block_invoke;
  v11[3] = &unk_1E574F0C0;
  if (v10 < v9) {
    double v9 = v10;
  }
  v11[4] = self;
  *(double *)&v11[5] = v9;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:0.2];
}

uint64_t __57__MUPagingScrollControlsView__adjustScrollIndexByOffset___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setContentOffset:", *(double *)(a1 + 40), 0.0);
  int v2 = *(void **)(a1 + 32);
  return [v2 _updateChevronVisibility];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)MUPagingScrollControlsView;
  id v7 = a4;
  -[MUPagingScrollControlsView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  double v8 = (MUPagingScrollControlsView *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend(v7, "type", v12.receiver, v12.super_class);

  if (v9 || v8 != self) {
    double v10 = v8;
  }
  else {
    double v10 = 0;
  }

  return v10;
}

- (BOOL)automaticallyFlipsForRTL
{
  return self->_automaticallyFlipsForRTL;
}

- (void)setAutomaticallyFlipsForRTL:(BOOL)a3
{
  self->_automaticallyFlipsForRTL = a3;
}

- (BOOL)hoverActive
{
  return self->_hoverActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_nextPageButton, 0);
  objc_storeStrong((id *)&self->_previousPageButton, 0);
}

@end