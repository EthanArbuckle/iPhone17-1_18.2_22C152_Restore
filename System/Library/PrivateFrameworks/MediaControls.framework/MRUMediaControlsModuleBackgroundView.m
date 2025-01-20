@interface MRUMediaControlsModuleBackgroundView
- (BOOL)showMaterialOnly;
- (MRUCrossfadeImageView)gradientView;
- (MRUMediaControlsModuleBackgroundView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (UIEdgeInsets)contentEdgeInsets;
- (UIImage)backdropImage;
- (UIView)clippingView;
- (UIView)materialView;
- (double)contentScale;
- (double)cornerRadius;
- (int64_t)layout;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackdropImage:(id)a3;
- (void)setClippingView:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setContentScale:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setGradientView:(id)a3;
- (void)setLayout:(int64_t)a3;
- (void)setMaterialView:(id)a3;
- (void)setShowMaterialOnly:(BOOL)a3;
- (void)updateVisibilty;
@end

@implementation MRUMediaControlsModuleBackgroundView

- (MRUMediaControlsModuleBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)MRUMediaControlsModuleBackgroundView;
  v7 = -[MRUMediaControlsModuleBackgroundView initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F5AE08] controlCenterModuleBackgroundMaterial];
    materialView = v7->_materialView;
    v7->_materialView = (UIView *)v8;

    [(MRUMediaControlsModuleBackgroundView *)v7 addSubview:v7->_materialView];
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    clippingView = v7->_clippingView;
    v7->_clippingView = (UIView *)v10;

    [(UIView *)v7->_clippingView setClipsToBounds:1];
    [(MRUMediaControlsModuleBackgroundView *)v7 addSubview:v7->_clippingView];
    v12 = objc_alloc_init(MRUCrossfadeImageView);
    gradientView = v7->_gradientView;
    v7->_gradientView = v12;

    [(MRUCrossfadeImageView *)v7->_gradientView setClipsToBounds:1];
    [(UIView *)v7->_clippingView addSubview:v7->_gradientView];
    v7->_contentScale = 1.0;
    [(MRUMediaControlsModuleBackgroundView *)v7 updateVisibilty];
  }
  return v7;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)MRUMediaControlsModuleBackgroundView;
  [(MRUMediaControlsModuleBackgroundView *)&v26 layoutSubviews];
  [(MRUMediaControlsModuleBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_materialView, "setFrame:");
  -[UIView setFrame:](self->_clippingView, "setFrame:", v4, v6, v8, v10);
  double v11 = MRUUIEdgeInsetsMultiply(self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.right, self->_contentScale);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(UIView *)self->_clippingView bounds];
  double v19 = v13 + v18;
  double v21 = v11 + v20;
  double v23 = v22 - (v13 + v17);
  double v25 = v24 - (v11 + v15);
  switch(self->_layout)
  {
    case 0:
    case 1:
    case 2:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
      v27.origin.double x = v19;
      v27.origin.double y = v21;
      v27.size.double width = v23;
      v27.size.double height = v25;
      CGRectGetWidth(v27);
      v28.origin.double x = v19;
      v28.origin.double y = v21;
      v28.size.double width = v23;
      v28.size.double height = v25;
      CGRectGetHeight(v28);
      v29.origin.double x = v19;
      v29.origin.double y = v21;
      v29.size.double width = v23;
      v29.size.double height = v25;
      CGRectGetWidth(v29);
      v30.origin.double x = v19;
      v30.origin.double y = v21;
      v30.size.double width = v23;
      v30.size.double height = v25;
      CGRectGetHeight(v30);
      goto LABEL_3;
    case 3:
    case 5:
LABEL_3:
      v31.origin.double x = v19;
      v31.origin.double y = v21;
      v31.size.double width = v23;
      v31.size.double height = v25;
      CGRectGetMinX(v31);
      v32.origin.double x = v19;
      v32.origin.double y = v21;
      v32.size.double width = v23;
      v32.size.double height = v25;
      CGRectGetMinY(v32);
      UIRectCenteredRect();
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MRUCrossfadeImageView setFrame:](self->_gradientView, "setFrame:");
      break;
    default:
      return;
  }
}

- (UIImage)backdropImage
{
  return [(MRUCrossfadeImageView *)self->_gradientView image];
}

- (void)setBackdropImage:(id)a3
{
  id v6 = a3;
  id v4 = [(MRUMediaControlsModuleBackgroundView *)self backdropImage];

  double v5 = v6;
  if (v4 != v6)
  {
    [(MRUCrossfadeImageView *)self->_gradientView transitionTo:v6];
    double v5 = v6;
  }
}

- (MRUVisualStylingProvider)stylingProvider
{
  if (!self->_stylingProvider && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v3 = [(UIView *)self->_materialView visualStylingProviderForCategory:1];
    id v4 = [[MRUVisualStylingProvider alloc] initWithVisualStylingProvider:v3];
    stylingProvider = self->_stylingProvider;
    self->_stylingProvider = v4;
  }
  id v6 = self->_stylingProvider;

  return v6;
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    [(MRUMediaControlsModuleBackgroundView *)self setNeedsLayout];
    [(MRUMediaControlsModuleBackgroundView *)self updateVisibilty];
  }
}

- (void)setShowMaterialOnly:(BOOL)a3
{
  if (self->_showMaterialOnly != a3)
  {
    self->_showMaterialOnldouble y = a3;
    double v3 = 1.0;
    if (a3) {
      double v3 = 0.0;
    }
    [(UIView *)self->_clippingView setAlpha:v3];
  }
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[UIView _setContinuousCornerRadius:](self->_materialView, "_setContinuousCornerRadius:");
  clippingView = self->_clippingView;

  [(UIView *)clippingView _setContinuousCornerRadius:a3];
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    [(MRUMediaControlsModuleBackgroundView *)self updateVisibilty];
    [(MRUMediaControlsModuleBackgroundView *)self setNeedsLayout];
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    [(MRUMediaControlsModuleBackgroundView *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
}

- (void)updateVisibilty
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MRUMediaModuleArtworkForLayout(self->_layout);
  id v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  unint64_t layout = self->_layout;
  if (layout <= 9)
  {
    double v6 = dbl_1AE963BE0[layout];
    uint64_t v7 = qword_1E5F0E600[layout];
    [(MRUCrossfadeImageView *)self->_gradientView _setContinuousCornerRadius:MRUArtworkCornerRadius(v3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8))* dbl_1AE963B90[layout]* self->_contentScale];
    [(UIView *)self->_clippingView setAlpha:v6];
    [v4 setValue:v7 forKey:*MEMORY[0x1E4F3A1D8]];
  }
  v10[0] = v4;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  double v9 = [(UIView *)self->_clippingView layer];
  [v9 setFilters:v8];
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)showMaterialOnly
{
  return self->_showMaterialOnly;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (UIView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (MRUCrossfadeImageView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);

  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end