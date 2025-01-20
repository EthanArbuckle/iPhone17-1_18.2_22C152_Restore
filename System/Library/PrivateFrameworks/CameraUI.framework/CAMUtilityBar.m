@interface CAMUtilityBar
- (CEKApertureSlider)apertureSlider;
- (CEKSlider)intensitySlider;
- (CEKWheelScrubberView)filterScrubberView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)visibleContent;
- (void)_layoutFilterScrubberView;
- (void)_layoutPortraitApertureSlider;
- (void)_layoutSliderView:(id)a3;
- (void)_updateVisibilityForUpdatedContent:(unint64_t)a3 contentView:(id)a4;
- (void)_updateVisibleViewAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setApertureSlider:(id)a3;
- (void)setFilterScrubberView:(id)a3;
- (void)setIntensitySlider:(id)a3;
- (void)setVisibleContent:(unint64_t)a3;
- (void)setVisibleContent:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMUtilityBar

- (void)setFilterScrubberView:(id)a3
{
  v5 = (CEKWheelScrubberView *)a3;
  filterScrubberView = self->_filterScrubberView;
  v12 = v5;
  if (filterScrubberView != v5)
  {
    [(CEKWheelScrubberView *)filterScrubberView removeFromSuperview];
    objc_storeStrong((id *)&self->_filterScrubberView, a3);
    double v7 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v8 = *(double *)(MEMORY[0x263F834E8] + 24);
    int v9 = CAMIsSmallPhone();
    double v10 = 14.0;
    if (v9) {
      double v10 = 12.5;
    }
    double v11 = 15.0;
    if (v9) {
      double v11 = 12.5;
    }
    -[CEKWheelScrubberView setThumbnailEdgeInsets:](self->_filterScrubberView, "setThumbnailEdgeInsets:", v10, v7, v11, v8);
    [(CAMUtilityBar *)self addSubview:v12];
    [(CAMUtilityBar *)self _updateVisibilityForUpdatedContent:1 contentView:v12];
  }
}

- (void)setApertureSlider:(id)a3
{
  v5 = (CEKApertureSlider *)a3;
  apertureSlider = self->_apertureSlider;
  if (apertureSlider != v5)
  {
    double v8 = v5;
    double v7 = [(CEKApertureSlider *)apertureSlider superview];

    if (v7 == self) {
      [(CEKApertureSlider *)self->_apertureSlider removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_apertureSlider, a3);
    [(CAMUtilityBar *)self addSubview:v8];
    apertureSlider = (CEKApertureSlider *)[(CAMUtilityBar *)self _updateVisibilityForUpdatedContent:2 contentView:v8];
    v5 = v8;
  }
  MEMORY[0x270F9A758](apertureSlider, v5);
}

- (void)setIntensitySlider:(id)a3
{
  v5 = (CEKSlider *)a3;
  intensitySlider = self->_intensitySlider;
  if (intensitySlider != v5)
  {
    double v8 = v5;
    double v7 = [(CEKSlider *)intensitySlider superview];

    if (v7 == self) {
      [(CEKSlider *)self->_intensitySlider removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_intensitySlider, a3);
    [(CAMUtilityBar *)self addSubview:v8];
    intensitySlider = (CEKSlider *)[(CAMUtilityBar *)self _updateVisibilityForUpdatedContent:3 contentView:v8];
    v5 = v8;
  }
  MEMORY[0x270F9A758](intensitySlider, v5);
}

- (void)_updateVisibilityForUpdatedContent:(unint64_t)a3 contentView:(id)a4
{
  unint64_t v7 = [(CAMUtilityBar *)self visibleContent];
  if (a4)
  {
    if (v7)
    {
      [(CAMUtilityBar *)self _updateVisibleViewAnimated:0];
      return;
    }
    double v8 = self;
    unint64_t v9 = a3;
  }
  else
  {
    double v8 = self;
    unint64_t v9 = 0;
  }
  [(CAMUtilityBar *)v8 setVisibleContent:v9];
}

- (void)setVisibleContent:(unint64_t)a3
{
}

- (void)setVisibleContent:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_visibleContent != a3)
  {
    self->_visibleContent = a3;
    [(CAMUtilityBar *)self _updateVisibleViewAnimated:a4];
  }
}

- (void)_updateVisibleViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(CAMUtilityBar *)self visibleContent];
  switch(v5)
  {
    case 1uLL:
      v6 = [(CAMUtilityBar *)self filterScrubberView];
      break;
    case 3uLL:
      v6 = [(CAMUtilityBar *)self intensitySlider];
      break;
    case 2uLL:
      v6 = [(CAMUtilityBar *)self apertureSlider];
      break;
    default:
      v6 = 0;
      break;
  }
  v9[1] = 3221225472;
  v9[0] = MEMORY[0x263EF8330];
  v9[2] = __44__CAMUtilityBar__updateVisibleViewAnimated___block_invoke;
  v9[3] = &unk_263FA0408;
  if (v3) {
    double v7 = 0.25;
  }
  else {
    double v7 = 0.0;
  }
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  +[CAMView animateIfNeededWithDuration:v9 animations:v7];
}

void __44__CAMUtilityBar__updateVisibleViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (v7 == *(void **)(a1 + 40)) {
          double v8 = 1.0;
        }
        else {
          double v8 = 0.0;
        }
        [v7 setAlpha:v8];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CAMUtilityBar;
  [(CAMUtilityBar *)&v4 layoutSubviews];
  [(CAMUtilityBar *)self _layoutFilterScrubberView];
  [(CAMUtilityBar *)self _layoutPortraitApertureSlider];
  uint64_t v3 = [(CAMUtilityBar *)self intensitySlider];
  [(CAMUtilityBar *)self _layoutSliderView:v3];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CAMUtilityBar;
  -[CAMUtilityBar hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (CAMUtilityBar *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5 == self) {
    double v7 = 0;
  }
  else {
    double v7 = v5;
  }

  return v7;
}

- (void)_layoutFilterScrubberView
{
  [(CAMUtilityBar *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  id v14 = [(CAMUtilityBar *)self filterScrubberView];
  [v14 thumbnailSize];
  double v12 = v11;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  CGRectGetMaxY(v16);
  UIRoundToViewScale();
  objc_msgSend(v14, "frameForAlignmentRect:", 0.0, v13, v8, v12);
  objc_msgSend(v14, "setFrame:");
  [v14 selectedThumbnailBorderWidth];
  UIFloorToViewScale();
  objc_msgSend(v14, "setSelectionDotCenterTopSpacing:");
}

- (void)_layoutPortraitApertureSlider
{
  double v3 = [(CAMUtilityBar *)self apertureSlider];
  [(CAMUtilityBar *)self _layoutSliderView:v3];

  [(CAMUtilityBar *)self bounds];
  uint64_t v6 = 2 * (v4 < v5);
  id v7 = [(CAMUtilityBar *)self apertureSlider];
  [v7 setTextOrientation:v6];
}

- (void)_layoutSliderView:(id)a3
{
  id v4 = a3;
  [(CAMUtilityBar *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v16.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v16.c = v11;
  *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  double v13 = v12;
  double v14 = v9;
  if (v9 < v12)
  {
    CGAffineTransformMakeRotation(&v16, -1.57079633);
    double v14 = 360.0;
    double v13 = v10;
  }
  UIRectGetCenter();
  objc_msgSend(v4, "setCenter:");
  objc_msgSend(v4, "setBounds:", v6, v8, v14, v13);
  CGAffineTransform v15 = v16;
  [v4 setTransform:&v15];
}

- (CEKWheelScrubberView)filterScrubberView
{
  return self->_filterScrubberView;
}

- (CEKApertureSlider)apertureSlider
{
  return self->_apertureSlider;
}

- (CEKSlider)intensitySlider
{
  return self->_intensitySlider;
}

- (unint64_t)visibleContent
{
  return self->_visibleContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intensitySlider, 0);
  objc_storeStrong((id *)&self->_apertureSlider, 0);
  objc_storeStrong((id *)&self->_filterScrubberView, 0);
}

@end