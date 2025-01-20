@interface GKFocusHighlightingCollectionViewCell
- (GKFocusHighlightingCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)_gkFocusHighlightInsets;
- (UIView)focusHighlightView;
- (double)_gkFocusHighlightCornerRadius;
- (void)awakeFromNib;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)initFocusHighlightView;
- (void)setFocusHighlightView:(id)a3;
- (void)set_gkFocusHighlightCornerRadius:(double)a3;
- (void)set_gkFocusHighlightInsets:(UIEdgeInsets)a3;
- (void)updateFocusHighlightView;
@end

@implementation GKFocusHighlightingCollectionViewCell

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)GKFocusHighlightingCollectionViewCell;
  [(GKFocusHighlightingCollectionViewCell *)&v3 awakeFromNib];
  [(GKFocusHighlightingCollectionViewCell *)self initFocusHighlightView];
}

- (GKFocusHighlightingCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKFocusHighlightingCollectionViewCell;
  objc_super v3 = -[GKFocusHighlightingCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(GKFocusHighlightingCollectionViewCell *)v3 initFocusHighlightView];
  }
  return v4;
}

- (void)initFocusHighlightView
{
  [(GKFocusHighlightingCollectionViewCell *)self _gkDisableDefaultFocusEffect];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(GKFocusHighlightingCollectionViewCell *)self setFocusHighlightView:v3];

  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  v5 = [(GKFocusHighlightingCollectionViewCell *)self focusHighlightView];
  [v5 setBackgroundColor:v4];

  objc_super v6 = [(GKFocusHighlightingCollectionViewCell *)self focusHighlightView];
  [v6 setAlpha:0.0];

  v7 = [(GKFocusHighlightingCollectionViewCell *)self contentView];
  v8 = [(GKFocusHighlightingCollectionViewCell *)self focusHighlightView];
  [v7 insertSubview:v8 atIndex:0];

  double v9 = *MEMORY[0x1E4FB2848];
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);

  -[GKFocusHighlightingCollectionViewCell set_gkFocusHighlightInsets:](self, "set_gkFocusHighlightInsets:", v9, v10, v11, v12);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKFocusHighlightingCollectionViewCell;
  id v6 = a4;
  [(GKFocusHighlightingCollectionViewCell *)&v8 didUpdateFocusInContext:a3 withAnimationCoordinator:v6];
  [(GKFocusHighlightingCollectionViewCell *)self updateFocusHighlightView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__GKFocusHighlightingCollectionViewCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v7[3] = &unk_1E5F62EB0;
  v7[4] = self;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

uint64_t __90__GKFocusHighlightingCollectionViewCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isFocused];
  id v3 = [*(id *)(a1 + 32) focusHighlightView];
  v4 = v3;
  double v5 = 0.2;
  if (!v2) {
    double v5 = 0.0;
  }
  [v3 setAlpha:v5];

  id v6 = *(void **)(a1 + 32);

  return [v6 layoutIfNeeded];
}

- (void)updateFocusHighlightView
{
  id v3 = [(GKFocusHighlightingCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(GKFocusHighlightingCollectionViewCell *)self _gkFocusHighlightInsets];
  if (v15 != *(double *)(MEMORY[0x1E4FB2848] + 8)
    || v12 != *MEMORY[0x1E4FB2848]
    || v14 != *(double *)(MEMORY[0x1E4FB2848] + 24)
    || v13 != *(double *)(MEMORY[0x1E4FB2848] + 16))
  {
    [(GKFocusHighlightingCollectionViewCell *)self _gkFocusHighlightInsets];
    double v5 = v5 + v19;
    double v7 = v7 + v20;
    double v9 = v9 - (v19 + v21);
    double v11 = v11 - (v20 + v22);
  }
  v23 = [(GKFocusHighlightingCollectionViewCell *)self focusHighlightView];
  objc_msgSend(v23, "setFrame:", v5, v7, v9, v11);

  [(GKFocusHighlightingCollectionViewCell *)self _gkFocusHighlightCornerRadius];
  if (v24 > 0.0)
  {
    [(GKFocusHighlightingCollectionViewCell *)self _gkFocusHighlightCornerRadius];
    double v26 = v25;
    v27 = [(GKFocusHighlightingCollectionViewCell *)self focusHighlightView];
    v28 = [v27 layer];
    [v28 setCornerRadius:v26];

    uint64_t v29 = *MEMORY[0x1E4F39EA8];
    id v31 = [(GKFocusHighlightingCollectionViewCell *)self focusHighlightView];
    v30 = [v31 layer];
    [v30 setCornerCurve:v29];
  }
}

- (UIEdgeInsets)_gkFocusHighlightInsets
{
  double top = self->__gkFocusHighlightInsets.top;
  double left = self->__gkFocusHighlightInsets.left;
  double bottom = self->__gkFocusHighlightInsets.bottom;
  double right = self->__gkFocusHighlightInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)set_gkFocusHighlightInsets:(UIEdgeInsets)a3
{
  self->__gkFocusHighlightInsets = a3;
}

- (double)_gkFocusHighlightCornerRadius
{
  return self->__gkFocusHighlightCornerRadius;
}

- (void)set_gkFocusHighlightCornerRadius:(double)a3
{
  self->__gkFocusHighlightCornerRadius = a3;
}

- (UIView)focusHighlightView
{
  return self->_focusHighlightView;
}

- (void)setFocusHighlightView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end