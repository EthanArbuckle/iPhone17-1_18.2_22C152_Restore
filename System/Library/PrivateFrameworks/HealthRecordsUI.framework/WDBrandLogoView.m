@interface WDBrandLogoView
- (BOOL)isFallback;
- (CGSize)intrinsicContentSize;
- (WDBrandLogoView)initWithFrame:(CGRect)a3;
- (WDBrandLogoView)initWithSize:(double)a3;
- (WDCancellationToken)cancellationToken;
- (double)size;
- (void)_updateStyle;
- (void)fetchBrandable:(id)a3 dataProvider:(id)a4;
- (void)prepareForReuse;
- (void)setCancellationToken:(id)a3;
- (void)setIsFallback:(BOOL)a3;
- (void)setSize:(double)a3;
@end

@implementation WDBrandLogoView

- (WDBrandLogoView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WDBrandLogoView;
  v3 = -[WDBrandLogoView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(WDBrandLogoView *)v3 setContentMode:4];
    LODWORD(v5) = 1148846080;
    [(WDBrandLogoView *)v4 setContentCompressionResistancePriority:0 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [(WDBrandLogoView *)v4 setContentCompressionResistancePriority:1 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(WDBrandLogoView *)v4 setContentHuggingPriority:0 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(WDBrandLogoView *)v4 setContentHuggingPriority:1 forAxis:v8];
    [MEMORY[0x1E4FB1838] largeLogoViewDimension];
    -[WDBrandLogoView setSize:](v4, "setSize:");
  }
  return v4;
}

- (WDBrandLogoView)initWithSize:(double)a3
{
  v4 = -[WDBrandLogoView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = v4;
  if (v4) {
    [(WDBrandLogoView *)v4 setSize:a3];
  }
  return v5;
}

- (CGSize)intrinsicContentSize
{
  [(WDBrandLogoView *)self size];
  double v4 = v3;
  [(WDBrandLogoView *)self size];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)fetchBrandable:(id)a3 dataProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WDBrandLogoView *)self prepareForReuse];
  objc_initWeak(&location, self);
  [(WDBrandLogoView *)self intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(MEMORY[0x1E4FB1838], "logoDimensionForImageViewSize:");
  v13 = v12;
  objc_msgSend(MEMORY[0x1E4FB1838], "logoInsetForImageViewSize:", v9, v11);
  v15 = v14;
  v16 = [v6 brand];
  v17 = [v6 title];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47__WDBrandLogoView_fetchBrandable_dataProvider___block_invoke;
  v19[3] = &unk_1E644AE98;
  v20[1] = v15;
  objc_copyWeak(v20, &location);
  v20[2] = v13;
  v19[4] = self;
  v18 = [v7 fetchLogoForBrand:v16 fallback:v17 size:v19 completion:*(double *)&v13];
  [(WDBrandLogoView *)self setCancellationToken:v18];

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

uint64_t __47__WDBrandLogoView_fetchBrandable_dataProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    double v6 = *(double *)(a1 + 48);
    double v5 = v6;
  }
  id v7 = objc_msgSend(a2, "scaledToTargetSize:padding:", *(double *)(a1 + 56), *(double *)(a1 + 56), v5, v6);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setImage:v7];

  [*(id *)(a1 + 32) setIsFallback:a3];
  double v9 = *(void **)(a1 + 32);
  return [v9 _updateStyle];
}

- (void)prepareForReuse
{
  double v3 = [(WDBrandLogoView *)self cancellationToken];
  [v3 cancel];

  [(WDBrandLogoView *)self setCancellationToken:0];
  [(WDBrandLogoView *)self setImage:0];
}

- (void)setSize:(double)a3
{
  self->_size = a3;
  [(WDBrandLogoView *)self invalidateIntrinsicContentSize];
  [(WDBrandLogoView *)self _updateStyle];
}

- (void)_updateStyle
{
  BOOL v3 = [(WDBrandLogoView *)self isFallback];
  [(WDBrandLogoView *)self intrinsicContentSize];
  -[UIImageView applyAccountLogoStyleForIsMonogram:imageViewSize:](self, "applyAccountLogoStyleForIsMonogram:imageViewSize:", v3);
}

- (double)size
{
  return self->_size;
}

- (WDCancellationToken)cancellationToken
{
  return self->_cancellationToken;
}

- (void)setCancellationToken:(id)a3
{
}

- (BOOL)isFallback
{
  return self->_isFallback;
}

- (void)setIsFallback:(BOOL)a3
{
  self->_isFallback = a3;
}

- (void).cxx_destruct
{
}

@end