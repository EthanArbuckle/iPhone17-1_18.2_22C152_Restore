@interface CKBusinessMacToolbarView
- (BOOL)showingInStandAloneWindow;
- (CGRect)detailsPopoverFrame;
- (CGSize)_maxSizeForImage:(id)a3;
- (NSData)bannerImageData;
- (UIImage)bannerImage;
- (UILabel)fallbackTitleLabel;
- (UIView)leftItemView;
- (double)preferredHeight;
- (id)_generateScaledImageFromBannerData;
- (void)_updateBannerImage:(id)a3;
- (void)layoutSubviews;
- (void)setBannerImage:(id)a3;
- (void)setBannerImageData:(id)a3;
- (void)setDetailsPopoverFrame:(CGRect)a3;
- (void)setFallbackTitle:(id)a3;
- (void)setFallbackTitleColor:(id)a3;
- (void)setFallbackTitleLabel:(id)a3;
- (void)setLeftItemView:(id)a3;
- (void)setPreferredHeight:(double)a3;
- (void)setShowingInStandAloneWindow:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKBusinessMacToolbarView

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)CKBusinessMacToolbarView;
  [(CKBusinessMacToolbarView *)&v46 layoutSubviews];
  int v3 = [(CKBusinessMacToolbarView *)self _shouldReverseLayoutDirection];
  v4 = [(CKBusinessMacToolbarView *)self leftItemView];
  [v4 frame];

  v5 = [(CKBusinessMacToolbarView *)self bannerImage];
  [(CKBusinessMacToolbarView *)self _maxSizeForImage:v5];
  double v7 = v6;
  double v9 = v8;

  v10 = [(CKBusinessMacToolbarView *)self bannerImage];
  [v10 size];
  double v12 = v11;
  double v14 = v13;

  if (v12 <= 0.0 || v14 <= 0.0)
  {
    if (v3)
    {
      [(CKBusinessMacToolbarView *)self detailsPopoverFrame];
      double v18 = v17;
      [(CKBusinessMacToolbarView *)self detailsPopoverFrame];
      double v20 = v18 + v19;
    }
    else
    {
      [(CKBusinessMacToolbarView *)self frame];
      double v22 = v21;
      [(CKBusinessMacToolbarView *)self detailsPopoverFrame];
      double v20 = v22 - v23;
    }
    [(CKBusinessMacToolbarView *)self frame];
    double v25 = v24;
    v26 = +[CKUIBehavior sharedBehaviors];
    [v26 macNavbarLeftMargin];
    double v16 = v25 - v27 + -8.0 - v20;
  }
  else
  {
    double v15 = v7 / v12;
    if (v7 / v12 >= v9 / v14) {
      double v15 = v9 / v14;
    }
    double v16 = v12 * v15;
    double v9 = v14 * v15;
  }
  [(CKBusinessMacToolbarView *)self preferredHeight];
  double v29 = v28;
  if (v3)
  {
    [(CKBusinessMacToolbarView *)self frame];
    double v31 = v30;
    v32 = +[CKUIBehavior sharedBehaviors];
    [v32 macNavbarLeftMargin];
    double v34 = v31 - v33 - v16;

    BOOL v35 = [(CKBusinessMacToolbarView *)self showingInStandAloneWindow];
    double v36 = -73.0;
  }
  else
  {
    v37 = +[CKUIBehavior sharedBehaviors];
    [v37 macNavbarLeftMargin];
    double v34 = v38;

    BOOL v35 = [(CKBusinessMacToolbarView *)self showingInStandAloneWindow];
    double v36 = 73.0;
  }
  double v39 = v34 + v36;
  if (v35) {
    double v34 = v39;
  }
  double v40 = (v29 - v9) * 0.5;
  v41 = [(CKBusinessMacToolbarView *)self traitCollection];
  [v41 displayScale];
  double v43 = round(v34 * v42) / v42;
  double v44 = round(v40 * v42) / v42;

  v45 = [(CKBusinessMacToolbarView *)self leftItemView];
  objc_msgSend(v45, "setFrame:", v43, v44, v16, v9);
}

- (void)setBannerImageData:(id)a3
{
  id v8 = a3;
  char v5 = [v8 isEqualToData:self->_bannerImageData];
  double v6 = v8;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bannerImageData, a3);
    double v7 = [(CKBusinessMacToolbarView *)self _generateScaledImageFromBannerData];
    if (v7) {
      [(CKBusinessMacToolbarView *)self _updateBannerImage:v7];
    }

    double v6 = v8;
  }
}

- (void)setFallbackTitle:(id)a3
{
  id v4 = a3;
  char v5 = [(CKBusinessMacToolbarView *)self fallbackTitleLabel];
  [v5 setText:v4];

  double v6 = [(CKBusinessMacToolbarView *)self bannerImage];

  if (!v6)
  {
    double v7 = [(CKBusinessMacToolbarView *)self leftItemView];
    id v8 = [v7 superview];

    if (v8)
    {
      double v9 = [(CKBusinessMacToolbarView *)self leftItemView];
      [v9 removeFromSuperview];
    }
    if (v4)
    {
      v10 = [(CKBusinessMacToolbarView *)self fallbackTitleLabel];
      [(CKBusinessMacToolbarView *)self setLeftItemView:v10];

      double v11 = [(CKBusinessMacToolbarView *)self leftItemView];
      [(CKBusinessMacToolbarView *)self addSubview:v11];

      [(CKBusinessMacToolbarView *)self setNeedsLayout];
    }
  }
}

- (void)setFallbackTitleColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBusinessMacToolbarView *)self fallbackTitleLabel];
  [v5 setTextColor:v4];
}

- (void)setPreferredHeight:(double)a3
{
  if (self->_preferredHeight != a3)
  {
    self->_preferredHeight = a3;
    [(CKBusinessMacToolbarView *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  [a3 displayScale];
  double v5 = v4;
  double v6 = [(CKBusinessMacToolbarView *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;

  if (v5 != v8)
  {
    double v9 = [(CKBusinessMacToolbarView *)self _generateScaledImageFromBannerData];
    if (v9)
    {
      v10 = v9;
      [(CKBusinessMacToolbarView *)self _updateBannerImage:v9];
      double v9 = v10;
    }
  }
}

- (UILabel)fallbackTitleLabel
{
  fallbackTitleLabel = self->_fallbackTitleLabel;
  if (!fallbackTitleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->_fallbackTitleLabel;
    self->_fallbackTitleLabel = v5;

    fallbackTitleLabel = self->_fallbackTitleLabel;
  }

  return fallbackTitleLabel;
}

- (id)_generateScaledImageFromBannerData
{
  int v3 = [(CKBusinessMacToolbarView *)self bannerImageData];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F42A80];
    double v5 = [(CKBusinessMacToolbarView *)self bannerImageData];
    double v6 = [(CKBusinessMacToolbarView *)self traitCollection];
    [v6 displayScale];
    double v7 = objc_msgSend(v4, "imageWithData:scale:", v5);

    double v8 = [MEMORY[0x1E4F42A60] preferredFormat];
    double v9 = [(CKBusinessMacToolbarView *)self traitCollection];
    [v9 displayScale];
    objc_msgSend(v8, "setScale:");

    [v8 setPreferredRange:0];
    [v8 setOpaque:0];
    [(CKBusinessMacToolbarView *)self _maxSizeForImage:v7];
    double v11 = v10;
    double v13 = v12;
    [v7 size];
    double v16 = v11 / v14;
    if (v11 / v14 >= v13 / v15) {
      double v16 = v13 / v15;
    }
    double v17 = v14 * v16;
    double v18 = v15 * v16;
    double v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithBounds:format:", v8, 0.0, 0.0, v14 * v16, v15 * v16);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__CKBusinessMacToolbarView__generateScaledImageFromBannerData__block_invoke;
    v23[3] = &unk_1E5626FF0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    id v24 = v7;
    double v27 = v17;
    double v28 = v18;
    id v20 = v7;
    double v21 = [v19 imageWithActions:v23];
  }
  else
  {
    double v21 = 0;
  }

  return v21;
}

uint64_t __62__CKBusinessMacToolbarView__generateScaledImageFromBannerData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_updateBannerImage:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(CKBusinessMacToolbarView *)self setBannerImage:v4];
    double v5 = [(CKBusinessMacToolbarView *)self leftItemView];
    double v6 = [v5 superview];

    if (v6)
    {
      double v7 = [(CKBusinessMacToolbarView *)self leftItemView];
      [v7 removeFromSuperview];
    }
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v4];

    [v9 setClipsToBounds:1];
    [(CKBusinessMacToolbarView *)self setLeftItemView:v9];
    double v8 = [(CKBusinessMacToolbarView *)self leftItemView];
    [(CKBusinessMacToolbarView *)self addSubview:v8];

    [(CKBusinessMacToolbarView *)self setNeedsLayout];
  }
}

- (CGSize)_maxSizeForImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  if (v4 > 0.0
    && ([v3 size], v5 > 0.0)
    && ([v3 size], double v7 = v6, objc_msgSend(v3, "size"), v7 == v8))
  {
    id v9 = +[CKUIBehavior sharedBehaviors];
    [v9 businessSquareToolbarLogoHeight];
    double v11 = v10;
    double v12 = v10;
  }
  else
  {
    double v13 = +[CKUIBehavior sharedBehaviors];
    [v13 businessBannerSize];
    double v12 = v14;

    id v9 = +[CKUIBehavior sharedBehaviors];
    [v9 businessBannerSize];
    double v11 = v15;
  }

  double v16 = v12;
  double v17 = v11;
  result.height = v17;
  result.width = v16;
  return result;
}

- (NSData)bannerImageData
{
  return self->_bannerImageData;
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (BOOL)showingInStandAloneWindow
{
  return self->_showingInStandAloneWindow;
}

- (void)setShowingInStandAloneWindow:(BOOL)a3
{
  self->_showingInStandAloneWindow = a3;
}

- (CGRect)detailsPopoverFrame
{
  double x = self->_detailsPopoverFrame.origin.x;
  double y = self->_detailsPopoverFrame.origin.y;
  double width = self->_detailsPopoverFrame.size.width;
  double height = self->_detailsPopoverFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDetailsPopoverFrame:(CGRect)a3
{
  self->_detailsPopoverFrame = a3;
}

- (UIView)leftItemView
{
  return self->_leftItemView;
}

- (void)setLeftItemView:(id)a3
{
}

- (UIImage)bannerImage
{
  return self->_bannerImage;
}

- (void)setBannerImage:(id)a3
{
}

- (void)setFallbackTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTitleLabel, 0);
  objc_storeStrong((id *)&self->_bannerImage, 0);
  objc_storeStrong((id *)&self->_leftItemView, 0);

  objc_storeStrong((id *)&self->_bannerImageData, 0);
}

@end