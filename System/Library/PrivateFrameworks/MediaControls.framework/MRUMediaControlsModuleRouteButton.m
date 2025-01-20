@interface MRUMediaControlsModuleRouteButton
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)showRouteLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPAVEndpointRoute)route;
- (MPRouteLabel)routeLabel;
- (MRUMediaControlsModuleRouteButton)init;
- (double)contentScale;
- (void)layoutSubviews;
- (void)setContentScale:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setRoute:(id)a3;
- (void)setRouteLabel:(id)a3;
- (void)setShowRouteLabel:(BOOL)a3;
- (void)updateContentSizeCategory;
- (void)updateLabel;
- (void)updateVisibility;
- (void)updateVisualStyling;
@end

@implementation MRUMediaControlsModuleRouteButton

- (MRUMediaControlsModuleRouteButton)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRUMediaControlsModuleRouteButton;
  v2 = [(MRUMediaControlsModuleRouteButton *)&v7 init];
  if (v2)
  {
    v3 = (MPRouteLabel *)objc_alloc_init(MEMORY[0x1E4F31A38]);
    routeLabel = v2->_routeLabel;
    v2->_routeLabel = v3;

    [(MPRouteLabel *)v2->_routeLabel setUserInteractionEnabled:0];
    [(MPRouteLabel *)v2->_routeLabel setUsesPredictedOutputDevice:1];
    [(MRUMediaControlsModuleRouteButton *)v2 addSubview:v2->_routeLabel];
    v2->_contentScale = 1.0;
    [(MRUTransportButton *)v2 setScaleOnHighlight:0];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRUMediaControlsModuleRouteButton *)v2 updateVisibility];
    [(MRUMediaControlsModuleRouteButton *)v2 updateVisualStyling];
    [(MRUMediaControlsModuleRouteButton *)v2 updateContentSizeCategory];
  }
  return v2;
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)MRUMediaControlsModuleRouteButton;
  [(MRUTransportButton *)&v51 layoutSubviews];
  v3 = [(MRUMediaControlsModuleRouteButton *)self traitCollection];
  [v3 displayScale];

  [(MRUMediaControlsModuleRouteButton *)self bounds];
  UIRectInset();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;
  BOOL showRouteLabel = self->_showRouteLabel;
  v13 = [(MRUMediaControlsModuleRouteButton *)self imageView];
  objc_msgSend(v13, "sizeThatFits:", v9, v11);

  if (showRouteLabel)
  {
    v52.origin.x = v5;
    v52.origin.y = v7;
    v52.size.width = v9;
    v52.size.height = v11;
    CGRectGetMinX(v52);
    UIRectCenteredYInRect();
    UIRectRoundToScale();
    CGFloat v49 = v15;
    CGFloat v50 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [(MRUMediaControlsModuleRouteButton *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = [(MRUMediaControlsModuleRouteButton *)self imageView];
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    v53.size.height = v49;
    v53.origin.x = v50;
    v53.origin.y = v17;
    v53.size.width = v19;
    CGRectGetWidth(v53);
    UIRectInset();
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    p_routeLabel = &self->_routeLabel;
    -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", v33, v35);
    v54.origin.x = v30;
    v54.origin.y = v32;
    v54.size.width = v34;
    v54.size.height = v36;
    CGRectGetMinX(v54);
  }
  else
  {
    UIRectCenteredRect();
    UIRectRoundToScale();
    CGFloat v38 = v5;
    double v40 = v39;
    CGFloat v41 = v7;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    v48 = [(MRUMediaControlsModuleRouteButton *)self imageView];
    objc_msgSend(v48, "setFrame:", v40, v43, v45, v47);

    p_routeLabel = &self->_routeLabel;
    -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", v9, v11);
    v55.origin.x = v38;
    v55.origin.y = v41;
    v55.size.width = v9;
    v55.size.height = v11;
    CGRectGetMaxX(v55);
  }
  UIRectCenteredYInRect();
  UIRectIntegralWithScale();
  [(MRUMediaControlsModuleRouteButton *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MPRouteLabel setFrame:](*p_routeLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_showRouteLabel)
  {
    double height = a3.height;
    double v5 = self->_contentScale * 27.0;
    CGFloat v6 = a3.width - v5;
    CGFloat v7 = [(MRUMediaControlsModuleRouteButton *)self imageView];
    objc_msgSend(v7, "sizeThatFits:", v6, height);
    double v9 = v8;

    -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", v6 - v9, height);
    double v11 = v5 + v9 + v10;
    double v12 = self->_contentScale * 32.0;
  }
  else
  {
    double contentScale = self->_contentScale;
    double v11 = MRUCGSizeMultiply(40.0, 40.0, contentScale);
  }
  result.double height = v12;
  result.width = v11;
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUMediaControlsModuleRouteButton;
  if ([(MRUMediaControlsModuleRouteButton *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 hasPrefix:@"shadow"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 containsString:@"filters"];
  }

  return v5;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
  id v5 = a3;
  [(MPRouteLabel *)self->_routeLabel setRoute:v5];

  [(MRUMediaControlsModuleRouteButton *)self updateLabel];

  [(MRUMediaControlsModuleRouteButton *)self setNeedsLayout];
}

- (void)setShowRouteLabel:(BOOL)a3
{
  if (self->_showRouteLabel != a3)
  {
    self->_BOOL showRouteLabel = a3;
    [(MRUMediaControlsModuleRouteButton *)self updateContentSizeCategory];
    [(MRUMediaControlsModuleRouteButton *)self updateVisibility];
    [(MRUMediaControlsModuleRouteButton *)self setNeedsLayout];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MRUMediaControlsModuleRouteButton *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MRUMediaControlsModuleRouteButton;
    [(MRUTransportButton *)&v5 setEnabled:v3];
    [(MRUMediaControlsModuleRouteButton *)self updateVisualStyling];
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_double contentScale = a3;
    [(MRUMediaControlsModuleRouteButton *)self updateContentSizeCategory];
  }
}

- (void)updateLabel
{
  v18[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_route;
  id v4 = [(MPAVEndpointRoute *)v3 endpointObject];
  objc_super v5 = [v4 predictedOutputDevice];
  if ([(MPAVEndpointRoute *)v3 isSplitRoute])
  {
    CGFloat v6 = @"person.2.fill";
    goto LABEL_12;
  }
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F31830]);
    v18[0] = v5;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    double v9 = (void *)[v7 initWithOutputDevices:v8];

    CGFloat v6 = [MEMORY[0x1E4F31850] _symbolNameForRoute:v9];
    double v10 = MCLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v16 = 138543874;
      *(void *)&v16[4] = objc_opt_class();
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v6;
      *(_WORD *)&v16[22] = 2114;
      CGFloat v17 = v9;
      double v11 = "%{public}@ predicted output device symbol: %{public}@ | routes: %{public}@";
LABEL_10:
      _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, v11, v16, 0x20u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  char v12 = [(MPAVEndpointRoute *)v3 isDeviceSpeakerRoute];
  CGFloat v6 = @"airplayaudio";
  if (v4 && (v12 & 1) == 0)
  {
    v13 = [v4 outputDevices];
    double v9 = objc_msgSend(v13, "msv_map:", &__block_literal_global_34);

    CGFloat v6 = [MEMORY[0x1E4F31850] _symbolNameForRoutes:v9];
    double v10 = MCLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v16 = 138543874;
      *(void *)&v16[4] = objc_opt_class();
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v6;
      *(_WORD *)&v16[22] = 2114;
      CGFloat v17 = v9;
      double v11 = "%{public}@ output devices symbol: %{public}@ | routes: %{public}@";
      goto LABEL_10;
    }
LABEL_11:
  }
LABEL_12:
  double v14 = objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:", v6, *(_OWORD *)v16, *(void *)&v16[16], v17);
  double v15 = +[MRUAsset image:v14];
  [(MRUTransportButton *)self setAsset:v15];
}

id __48__MRUMediaControlsModuleRouteButton_updateLabel__block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)MEMORY[0x1E4F31830];
  id v3 = a2;
  id v4 = [v2 alloc];
  v8[0] = v3;
  objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  CGFloat v6 = (void *)[v4 initWithOutputDevices:v5];

  return v6;
}

- (void)updateVisibility
{
  double v2 = 1.0;
  if (!self->_showRouteLabel) {
    double v2 = 0.0;
  }
  [(MPRouteLabel *)self->_routeLabel setAlpha:v2];
}

- (void)updateVisualStyling
{
  v6.receiver = self;
  v6.super_class = (Class)MRUMediaControlsModuleRouteButton;
  [(MRUTransportButton *)&v6 updateVisualStyling];
  id v3 = [(MRUTransportButton *)self stylingProvider];
  if ([(MRUMediaControlsModuleRouteButton *)self isEnabled]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2;
  }
  objc_super v5 = [(MPRouteLabel *)self->_routeLabel contentView];
  [v3 applyStyle:v4 toView:v5];
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_controlCenterRouteButtonFontWithScale:", self->_contentScale);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MPRouteLabel setFont:](self->_routeLabel, "setFont:");
  id v3 = (void *)MEMORY[0x1E4FB1830];
  if (self->_showRouteLabel)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1830] configurationWithFont:v6 scale:3];
    [(MRUMediaControlsModuleRouteButton *)self setPreferredSymbolConfiguration:v4 forImageInState:0];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:self->_contentScale * 15.0];
    objc_super v5 = [v3 configurationWithFont:v4 scale:3];
    [(MRUMediaControlsModuleRouteButton *)self setPreferredSymbolConfiguration:v5 forImageInState:0];
  }
  [(MRUMediaControlsModuleRouteButton *)self setNeedsLayout];
}

- (MPAVEndpointRoute)route
{
  return self->_route;
}

- (BOOL)showRouteLabel
{
  return self->_showRouteLabel;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MPRouteLabel)routeLabel
{
  return self->_routeLabel;
}

- (void)setRouteLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeLabel, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end