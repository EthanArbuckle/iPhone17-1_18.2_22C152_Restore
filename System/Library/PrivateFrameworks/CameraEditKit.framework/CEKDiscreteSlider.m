@interface CEKDiscreteSlider
- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets;
- (BOOL)_isExternalScrollingAllowed;
- (BOOL)_isExternallyScrolling;
- (BOOL)_isOverscrolling;
- (BOOL)_isScrollActive;
- (BOOL)_isScrollExternallyAnimating;
- (BOOL)_needsUpdateContentOffset;
- (BOOL)_shouldUseHighlightColor;
- (BOOL)biasScrollingToCurrentSelection;
- (BOOL)highlightSelectedIndex;
- (BOOL)interactiveWhenHidden;
- (BOOL)useTextLegibilityBackgrounds;
- (BOOL)useTextLegibilityShadows;
- (BOOL)useTickMarkLegibilityShadows;
- (CEKAnimationGenerator)_animationGenerator;
- (CEKDiscreteSlider)initWithCoder:(id)a3;
- (CEKDiscreteSlider)initWithFrame:(CGRect)a3;
- (CEKDiscreteSlider)initWithTickMarkStyle:(unint64_t)a3;
- (CEKDiscreteSliderDelegate)delegate;
- (CEKDynamicTickMarksView)_dynamicTickMarksView;
- (CEKEdgeGradientView)_edgeGradientView;
- (CEKFluidBehaviorSettings)_externalScrollSettings;
- (CEKSelectionFeedbackGenerator)_feedbackGenerator;
- (CEKSliderDotView)_dotView;
- (CEKSliderPositionDriver)_sliderDriver;
- (CEKTickMarksConfiguration)tickMarksConfiguration;
- (CEKTickMarksContainer)_tickMarksView;
- (CGPoint)_contentOffsetForIndex:(unint64_t)a3;
- (CGSize)intrinsicContentSize;
- (NSArray)magneticIndexes;
- (NSArray)protectedIndexes;
- (NSString)titleText;
- (UIImageView)_titleBackground;
- (UIImageView)_valueBackground;
- (UILabel)_titleLabel;
- (UILabel)_valueLabel;
- (UIScrollView)_contentScrollView;
- (UIView)_indicatorBackground;
- (UIView)_levelIndicatorView;
- (UIViewFloatAnimatableProperty)_externalScrollOffsetAnimator;
- (double)_externalOverScroll;
- (double)_interpolatedIndexForContentOffset:(CGPoint)a3;
- (double)horizontalValueLabelOffset;
- (double)labelVerticalPadding;
- (double)levelIndicatorHeight;
- (double)sliderVerticalOffset;
- (double)tickMarksHeight;
- (id)_createLegibilityImage;
- (id)valueText;
- (int64_t)feedbackScope;
- (int64_t)selectionFeedbackProfile;
- (int64_t)sliderVerticalAlignment;
- (int64_t)textOrientation;
- (int64_t)titleAlignment;
- (unint64_t)_biasedIndexForContentOffset:(CGPoint)a3;
- (unint64_t)_indexForContentOffset:(CGPoint)a3;
- (unint64_t)_nearestIndexForContentOffset:(CGPoint)a3;
- (unint64_t)_tickMarkIndexForIndex:(unint64_t)a3;
- (unint64_t)colorHighlight;
- (unint64_t)fontStyle;
- (unint64_t)indexCount;
- (unint64_t)indexForTickMarkAtPoint:(CGPoint)a3 in:(id)a4;
- (unint64_t)markedIndex;
- (unint64_t)selectedIndex;
- (unint64_t)tickMarkCountBetweenIndexes;
- (unint64_t)ticksStyle;
- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4;
- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4 completion:(id)a5;
- (void)_createExternalScrollAnimatorIfNeeded;
- (void)_createGradientIfNeeded;
- (void)_handleExternalScrollAnimated;
- (void)_layoutSliderContentAtY:(double)a3 withHorizontalPadding:(double)a4;
- (void)_layoutSubviewsWithLabelRotation:(double)a3;
- (void)_layoutSubviewsWithNoRotation;
- (void)_setAnimationGenerator:(id)a3;
- (void)_setExternalOverScroll:(double)a3;
- (void)_setExternalScrollOffsetAnimator:(id)a3;
- (void)_setExternalScrollingAllowed:(BOOL)a3;
- (void)_setExternallyScrolling:(BOOL)a3;
- (void)_setNeedsUpdateContentOffset:(BOOL)a3;
- (void)_setOverscrolling:(BOOL)a3;
- (void)_setSelectedIndex:(unint64_t)a3 shouldDelegate:(BOOL)a4 wantsFeedbackEmitted:(BOOL)a5 shouldScroll:(BOOL)a6 scrollDuration:(double)a7 scrollCurve:(id)a8 scrollCompletion:(id)a9;
- (void)_sliderDidEndScrolling;
- (void)_updateAppearanceForActiveScrolling;
- (void)_updateColorsAnimated:(BOOL)a3;
- (void)_updateFonts;
- (void)_updateMarkedIndexViewAnimated:(BOOL)a3;
- (void)_updateScrollViewContentOffset;
- (void)_updateTextLegibilityBackground;
- (void)_updateTickMarkCount;
- (void)contactBeganWithAction:(id)a3;
- (void)contactEndedWithAction:(id)a3;
- (void)contactUpdatedWithAction:(id)a3;
- (void)layoutSubviews;
- (void)performWaveAnimation;
- (void)removeGradients;
- (void)removeMarkedIndex;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBiasScrollingToCurrentSelection:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setColorHighlight:(unint64_t)a3;
- (void)setColorHighlight:(unint64_t)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFeedbackScope:(int64_t)a3;
- (void)setFontStyle:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGradientInsets:(id)a3;
- (void)setHighlightSelectedIndex:(BOOL)a3;
- (void)setHighlightSelectedIndex:(BOOL)a3 animated:(BOOL)a4;
- (void)setIndexCount:(unint64_t)a3;
- (void)setInteractiveWhenHidden:(BOOL)a3;
- (void)setLabelVerticalPadding:(double)a3;
- (void)setLevelIndicatorHeight:(double)a3;
- (void)setMagneticIndexes:(id)a3;
- (void)setMarkedIndex:(unint64_t)a3;
- (void)setMarkedIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setOpaqueGradientsWithColor:(id)a3;
- (void)setProtectedIndexes:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setSelectedIndex:(unint64_t)a3 animatedDuration:(double)a4 animatedCurve:(id)a5 completion:(id)a6;
- (void)setSelectionFeedbackProfile:(int64_t)a3;
- (void)setSliderVerticalAlignment:(int64_t)a3;
- (void)setSliderVerticalOffset:(double)a3;
- (void)setTextOrientation:(int64_t)a3;
- (void)setTextOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setTickMarkCountBetweenIndexes:(unint64_t)a3;
- (void)setTickMarksHeight:(double)a3;
- (void)setTickMarksHeight:(double)a3 animated:(BOOL)a4;
- (void)setTitleAlignment:(int64_t)a3;
- (void)setTitleText:(id)a3;
- (void)setTransparentGradients;
- (void)setUseTextLegibilityBackgrounds:(BOOL)a3;
- (void)setUseTextLegibilityShadows:(BOOL)a3;
- (void)setUseTickMarkLegibilityShadows:(BOOL)a3;
- (void)set_dotView:(id)a3;
- (void)set_edgeGradientView:(id)a3;
- (void)set_indicatorBackground:(id)a3;
- (void)set_titleBackground:(id)a3;
- (void)set_titleLabel:(id)a3;
- (void)set_valueBackground:(id)a3;
- (void)set_valueLabel:(id)a3;
- (void)tickMarksViewDidChangeWidthForTickMarkCount:(id)a3;
- (void)updateValueLabel;
@end

@implementation CEKDiscreteSlider

- (CEKDiscreteSlider)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(CEKDiscreteSlider *)self initWithTickMarkStyle:0];
  v8 = v7;
  if (v7) {
    -[CEKDiscreteSlider setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (CEKDiscreteSlider)initWithCoder:(id)a3
{
  return [(CEKDiscreteSlider *)self initWithTickMarkStyle:0];
}

- (CEKDiscreteSlider)initWithTickMarkStyle:(unint64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEKDiscreteSlider;
  v4 = -[CEKDiscreteSlider initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(CEKDiscreteSlider *)v4 setTintColor:v5];

    v4->_textOrientation = 0;
    v4->_fontStyle = 0;
    v4->_colorHighlight = 1;
    v4->_markedIndedouble x = -1;
    v4->_tickMarksHeight = 10.0;
    v4->_labelVerticalPadding = 10.0;
    v4->_sliderVerticalAlignment = 2;
    v4->_levelIndicatorHeight = 26.0;
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    [v6 setDelegate:v4];
    [v6 setShowsVerticalScrollIndicator:0];
    [v6 setShowsHorizontalScrollIndicator:0];
    [v6 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    v7 = [v6 panGestureRecognizer];
    [v7 _wantsGESEvents:1];

    objc_storeStrong((id *)&v4->__contentScrollView, v6);
    if (a3)
    {
      if (a3 == 1)
      {
        v8 = objc_alloc_init(CEKDynamicTickMarksView);
        dynamicTickMarksView = v4->__dynamicTickMarksView;
        v4->__dynamicTickMarksView = v8;

        objc_storeStrong((id *)&v4->__tickMarksView, v4->__dynamicTickMarksView);
      }
    }
    else
    {
      v10 = objc_alloc_init(CEKSliderTickMarksView);
      tickMarksView = v4->__tickMarksView;
      v4->__tickMarksView = (CEKTickMarksContainer *)v10;
    }
    [(CEKTickMarksContainer *)v4->__tickMarksView setDelegate:v4];
    v4->_ticksStyle = a3;
    [v6 addSubview:v4->__tickMarksView];
    [(CEKDiscreteSlider *)v4 addSubview:v6];
    if (!v4->__dynamicTickMarksView)
    {
      v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      [(UIView *)v12 setUserInteractionEnabled:0];
      levelIndicatorView = v4->__levelIndicatorView;
      v4->__levelIndicatorView = v12;
      v14 = v12;

      [(CEKDiscreteSlider *)v4 addSubview:v14];
    }
    [(CEKDiscreteSlider *)v4 _updateColorsAnimated:0];
    [(CEKDiscreteSlider *)v4 updateValueLabel];
    v15 = objc_alloc_init(CEKSelectionFeedbackGenerator);
    feedbackGenerator = v4->__feedbackGenerator;
    v4->__feedbackGenerator = v15;

    v4->_biasScrollingToCurrentSelection = 1;
    v4->_feedbackScope = 2;
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToWillBeginScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidEndScrolling = objc_opt_respondsToSelector() & 1;
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CEKDiscreteSlider;
  [(CEKDiscreteSlider *)&v6 layoutSubviews];
  [(CEKDiscreteSlider *)self bounds];
  if (!CGRectIsEmpty(v7))
  {
    int64_t v3 = [(CEKDiscreteSlider *)self textOrientation];
    if (v3)
    {
      if (v3 == 2)
      {
        double v4 = 1.57079633;
        goto LABEL_8;
      }
      if (v3 == 1)
      {
        double v4 = -1.57079633;
LABEL_8:
        [(CEKDiscreteSlider *)self _layoutSubviewsWithLabelRotation:v4];
      }
    }
    else
    {
      [(CEKDiscreteSlider *)self _layoutSubviewsWithNoRotation];
    }
    v5 = [(CEKDiscreteSlider *)self _dynamicTickMarksView];
    [(CEKDiscreteSlider *)self bounds];
    -[CEKDiscreteSlider convertRect:toView:](self, "convertRect:toView:", v5);
    objc_msgSend(v5, "setVisibleBounds:");
  }
}

- (CGSize)intrinsicContentSize
{
  int64_t v3 = [(CEKDiscreteSlider *)self _contentScrollView];
  [v3 contentSize];
  double v5 = v4;

  [(CEKDiscreteSlider *)self labelVerticalPadding];
  double v7 = v6;
  if ([(CEKDiscreteSlider *)self textOrientation])
  {
    double v8 = v7 + 40.0 + 5.0 + 10.0;
    [(CEKDiscreteSlider *)self levelIndicatorHeight];
    double v10 = v9 + 5.0 + v9 + 5.0;
    [(CEKDiscreteSlider *)self tickMarksHeight];
    double v12 = v8 + (v10 - v11) * 0.5 + 10.0;
  }
  else
  {
    [(CEKDiscreteSlider *)self levelIndicatorHeight];
    double v12 = v7 + 18.0 + 5.0 + v13 + 10.0;
  }
  double v14 = v5;
  result.double height = v12;
  result.double width = v14;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CEKDiscreteSlider;
  -[CEKDiscreteSlider setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CEKDiscreteSlider *)self _setNeedsUpdateContentOffset:1];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CEKDiscreteSlider;
  -[CEKDiscreteSlider setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CEKDiscreteSlider *)self _setNeedsUpdateContentOffset:1];
}

- (void)setUseTextLegibilityBackgrounds:(BOOL)a3
{
  if (self->_useTextLegibilityBackgrounds != a3)
  {
    self->_useTextLegibilityBackgrounds = a3;
    [(CEKDiscreteSlider *)self _updateTextLegibilityBackground];
    [(CEKDiscreteSlider *)self _updateColorsAnimated:0];
  }
}

- (void)setUseTextLegibilityShadows:(BOOL)a3
{
  if (self->_useTextLegibilityShadows != a3)
  {
    self->_useTextLegibilityShadows = a3;
    [(CEKDiscreteSlider *)self _updateColorsAnimated:0];
  }
}

- (void)setUseTickMarkLegibilityShadows:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CEKDiscreteSlider *)self _dotView];
  [v5 setUseLegibilityShadow:v3];

  id v6 = [(CEKDiscreteSlider *)self tickMarksConfiguration];
  [v6 setUseTickMarkLegibilityShadows:v3];
}

- (BOOL)useTickMarkLegibilityShadows
{
  v2 = [(CEKDiscreteSlider *)self tickMarksConfiguration];
  char v3 = [v2 useTickMarkLegibilityShadows];

  return v3;
}

- (void)_createGradientIfNeeded
{
  char v3 = [(CEKDiscreteSlider *)self _edgeGradientView];

  if (!v3)
  {
    objc_super v4 = objc_alloc_init(CEKEdgeGradientView);
    [(CEKDiscreteSlider *)self set_edgeGradientView:v4];
  }
}

- (void)setTransparentGradients
{
  [(CEKDiscreteSlider *)self _createGradientIfNeeded];
  id v6 = [(CEKDiscreteSlider *)self _edgeGradientView];
  [v6 setEdgeGradientStyleBlack];
  char v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
  objc_super v4 = [v6 layer];
  [v4 setCompositingFilter:v3];

  double v5 = [(CEKDiscreteSlider *)self _contentScrollView];
  [(CEKDiscreteSlider *)self insertSubview:v6 aboveSubview:v5];
}

- (void)setOpaqueGradientsWithColor:(id)a3
{
  id v4 = a3;
  [(CEKDiscreteSlider *)self _createGradientIfNeeded];
  id v7 = [(CEKDiscreteSlider *)self _edgeGradientView];
  [v7 setCustomEdgeGradientStyleWithColor:v4];

  double v5 = [v7 layer];
  [v5 setCompositingFilter:0];

  id v6 = [(CEKDiscreteSlider *)self _contentScrollView];
  [(CEKDiscreteSlider *)self insertSubview:v7 aboveSubview:v6];
}

- (void)removeGradients
{
  char v3 = [(CEKDiscreteSlider *)self _edgeGradientView];
  [v3 removeFromSuperview];

  [(CEKDiscreteSlider *)self set_edgeGradientView:0];
}

- (void)setGradientInsets:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_gradientInsets = &self->_gradientInsets;
  if (!CEKEdgeInsetsEqualToInsets(a3.var0, a3.var1, self->_gradientInsets.startInset, self->_gradientInsets.endInset))
  {
    p_gradientInsets->startInset = var0;
    p_gradientInsets->endInset = var1;
    [(CEKDiscreteSlider *)self setNeedsLayout];
  }
}

- (void)setTitleAlignment:(int64_t)a3
{
  self->_titleAlignment = a3;
  id v4 = [(CEKDiscreteSlider *)self _titleLabel];
  [v4 setTextAlignment:a3];
}

- (void)setSliderVerticalOffset:(double)a3
{
  if (self->_sliderVerticalOffset != a3)
  {
    self->_sliderVerticalOffset = a3;
    [(CEKDiscreteSlider *)self setNeedsLayout];
  }
}

- (void)setLabelVerticalPadding:(double)a3
{
  if (self->_labelVerticalPadding != a3)
  {
    self->_labelVerticalPadding = a3;
    [(CEKDiscreteSlider *)self setNeedsLayout];
  }
}

- (void)setSliderVerticalAlignment:(int64_t)a3
{
  if (self->_sliderVerticalAlignment != a3)
  {
    self->_sliderVerticalAlignment = a3;
    [(CEKDiscreteSlider *)self setNeedsLayout];
  }
}

- (void)setLevelIndicatorHeight:(double)a3
{
  if (self->_levelIndicatorHeight != a3)
  {
    self->_levelIndicatorHeight = a3;
    [(CEKDiscreteSlider *)self setNeedsLayout];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CEKDiscreteSlider *)self isEnabled];
  v10.receiver = self;
  v10.super_class = (Class)CEKDiscreteSlider;
  [(CEKDiscreteSlider *)&v10 setEnabled:v3];
  if (v5 != v3)
  {
    [(CEKDiscreteSlider *)self contactEndedWithAction:0];
    id v6 = [(CEKDiscreteSlider *)self _contentScrollView];
    [v6 setUserInteractionEnabled:v3];

    id v7 = [(CEKDiscreteSlider *)self _dynamicTickMarksView];
    [v7 setEnabled:v3];

    double v8 = 0.3;
    v9[1] = 3221225472;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[2] = __32__CEKDiscreteSlider_setEnabled___block_invoke;
    v9[3] = &unk_1E63CD5A0;
    if (v3) {
      double v8 = 1.0;
    }
    v9[4] = self;
    *(double *)&v9[5] = v8;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:0.25];
  }
}

void __32__CEKDiscreteSlider_setEnabled___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) _contentScrollView];
  [v3 setAlpha:v2];

  double v4 = *(double *)(a1 + 40);
  int v5 = [*(id *)(a1 + 32) _titleLabel];
  [v5 setAlpha:v4];

  double v6 = *(double *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) _valueLabel];
  [v7 setAlpha:v6];

  double v8 = *(double *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) _levelIndicatorView];
  [v9 setAlpha:v8];
}

- (BOOL)highlightSelectedIndex
{
  double v2 = [(CEKDiscreteSlider *)self _dynamicTickMarksView];
  char v3 = [v2 highlightSelectedIndex];

  return v3;
}

- (void)setHighlightSelectedIndex:(BOOL)a3
{
}

- (void)setHighlightSelectedIndex:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(CEKDiscreteSlider *)self _dynamicTickMarksView];
  [v6 setHighlightSelectedIndex:v5 animated:v4];
}

- (void)setMagneticIndexes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (NSArray *)a3;
  id v6 = v5;
  if (self->_magneticIndexes != v5 && !-[NSArray isEqualToArray:](v5, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_magneticIndexes, a3);
    id v7 = [MEMORY[0x1E4F28E60] indexSet];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v8 = v6;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "addIndex:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "unsignedLongValue", (void)v14));
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    double v13 = [(CEKDiscreteSlider *)self _dynamicTickMarksView];
    [v13 setMagneticTickMarkIndexes:v7];
  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
}

- (void)setSelectedIndex:(unint64_t)a3 animatedDuration:(double)a4 animatedCurve:(id)a5 completion:(id)a6
{
  id v14 = a5;
  id v10 = a6;
  unint64_t v11 = [(CEKDiscreteSlider *)self indexCount];
  if (!a3 || v11)
  {
    unint64_t v12 = [(CEKDiscreteSlider *)self indexCount];
    if (v12 - 1 >= a3) {
      unint64_t v13 = a3;
    }
    else {
      unint64_t v13 = v12 - 1;
    }
    [(CEKDiscreteSlider *)self _setSelectedIndex:v13 shouldDelegate:0 wantsFeedbackEmitted:0 shouldScroll:1 scrollDuration:v14 scrollCurve:v10 scrollCompletion:a4];
  }
}

- (void)setIndexCount:(unint64_t)a3
{
  if (self->_indexCount == a3) {
    return;
  }
  self->_indexCount = a3;
  [(CEKDiscreteSlider *)self _updateTickMarkCount];
  if (a3)
  {
    unint64_t v5 = [(CEKDiscreteSlider *)self selectedIndex];
    unint64_t v6 = a3 - 1;
    if (v5 <= a3 - 1) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  [(CEKDiscreteSlider *)self setSelectedIndex:v6];
LABEL_7:
  [(CEKDiscreteSlider *)self _setNeedsUpdateContentOffset:1];
  [(CEKDiscreteSlider *)self setNeedsLayout];
}

- (void)setMarkedIndex:(unint64_t)a3
{
}

- (void)setMarkedIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_markedIndex != a3)
  {
    self->_markedIndedouble x = a3;
    [(CEKDiscreteSlider *)self _updateMarkedIndexViewAnimated:a4];
    [(CEKDiscreteSlider *)self setNeedsLayout];
  }
}

- (void)removeMarkedIndex
{
}

- (void)setTitleText:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 isEqualToString:self->_titleText];
  id v5 = v11;
  if ((v4 & 1) == 0)
  {
    unint64_t v6 = (NSString *)[v11 copy];
    titleText = self->_titleText;
    self->_titleText = v6;

    double v8 = [(CEKDiscreteSlider *)self _titleLabel];
    if (!v8)
    {
      if ([(NSString *)self->_titleText length])
      {
        id v9 = objc_alloc(MEMORY[0x1E4FB1930]);
        double v8 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        id v10 = [MEMORY[0x1E4FB1618] clearColor];
        [v8 setBackgroundColor:v10];

        objc_msgSend(v8, "setTextAlignment:", -[CEKDiscreteSlider titleAlignment](self, "titleAlignment"));
        [v8 setNumberOfLines:0];
        [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(CEKDiscreteSlider *)self addSubview:v8];
        [(CEKDiscreteSlider *)self set_titleLabel:v8];
        [(CEKDiscreteSlider *)self _updateColorsAnimated:0];
        [(CEKDiscreteSlider *)self _updateFonts];
      }
      else
      {
        double v8 = 0;
      }
    }
    [v8 setText:self->_titleText];

    id v5 = v11;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (id)valueText
{
  return 0;
}

- (void)updateValueLabel
{
  v19[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(CEKDiscreteSlider *)self _valueLabel];
  uint64_t v4 = [(CEKDiscreteSlider *)self valueText];
  uint64_t v5 = [v4 length];
  if (v3 || !v5)
  {
    if (!v5)
    {
      [v3 setAttributedText:0];
      goto LABEL_9;
    }
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    char v3 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v7 = [MEMORY[0x1E4FB1618] clearColor];
    [v3 setBackgroundColor:v7];

    [v3 setTextAlignment:1];
    [(CEKDiscreteSlider *)self addSubview:v3];
    [(CEKDiscreteSlider *)self set_valueLabel:v3];
    [(CEKDiscreteSlider *)self _updateColorsAnimated:0];
    [(CEKDiscreteSlider *)self _updateFonts];
  }
  double v8 = CEKFrameworkBundle();
  id v9 = [v8 preferredLocalizations];
  id v10 = [v9 firstObject];

  id v11 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v10];
  unint64_t v12 = [v3 font];
  [v12 pointSize];
  double v14 = v13;

  if (CEKIsCustomKerningSupportedForLocale(v11))
  {
    uint64_t v18 = *MEMORY[0x1E4FB12C0];
    long long v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14 * 100.0 / 1000.0];
    v19[0] = v15;
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  }
  else
  {
    long long v16 = 0;
  }
  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v16];
  [v3 setAttributedText:v17];

LABEL_9:
}

- (CEKTickMarksConfiguration)tickMarksConfiguration
{
  double v2 = [(CEKDiscreteSlider *)self _tickMarksView];
  char v3 = [v2 tickMarksModel];

  return (CEKTickMarksConfiguration *)v3;
}

- (void)setTickMarkCountBetweenIndexes:(unint64_t)a3
{
  if (self->_tickMarkCountBetweenIndexes != a3)
  {
    self->_tickMarkCountBetweenIndexes = a3;
    [(CEKDiscreteSlider *)self _updateTickMarkCount];
  }
}

- (void)_updateTickMarkCount
{
  unint64_t v3 = [(CEKDiscreteSlider *)self indexCount];
  unint64_t v4 = [(CEKDiscreteSlider *)self tickMarkCountBetweenIndexes];
  if (v3) {
    unint64_t v5 = v3 + (v3 - 1) * v4;
  }
  else {
    unint64_t v5 = 0;
  }
  id v7 = [(CEKDiscreteSlider *)self _tickMarksView];
  id v6 = [v7 tickMarksModel];
  [v6 setTickMarksCount:v5];
}

- (void)setFontStyle:(unint64_t)a3
{
  if (self->_fontStyle != a3)
  {
    self->_fontStyle = a3;
    [(CEKDiscreteSlider *)self _updateFonts];
  }
}

- (void)setSelectionFeedbackProfile:(int64_t)a3
{
  id v4 = [(CEKDiscreteSlider *)self _feedbackGenerator];
  [v4 setProfile:a3];
}

- (int64_t)selectionFeedbackProfile
{
  double v2 = [(CEKDiscreteSlider *)self _feedbackGenerator];
  int64_t v3 = [v2 profile];

  return v3;
}

- (void)setTickMarksHeight:(double)a3
{
}

- (void)setTickMarksHeight:(double)a3 animated:(BOOL)a4
{
  if (self->_tickMarksHeight != a3)
  {
    if (a4)
    {
      [(CEKDiscreteSlider *)self layoutIfNeeded];
      self->_tickMarksHeight = a3;
      [(CEKDiscreteSlider *)self setNeedsLayout];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __49__CEKDiscreteSlider_setTickMarksHeight_animated___block_invoke;
      v6[3] = &unk_1E63CD380;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
    }
    else
    {
      self->_tickMarksHeight = a3;
      [(CEKDiscreteSlider *)self setNeedsLayout];
    }
  }
}

uint64_t __49__CEKDiscreteSlider_setTickMarksHeight_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setColorHighlight:(unint64_t)a3
{
}

- (void)setColorHighlight:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_colorHighlight != a3)
  {
    self->_colorHighlight = a3;
    [(CEKDiscreteSlider *)self _updateColorsAnimated:a4];
  }
}

- (void)_layoutSubviewsWithNoRotation
{
  [(CEKDiscreteSlider *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  int64_t v11 = [(CEKDiscreteSlider *)self sliderVerticalAlignment];
  if (v11 == 2)
  {
    [(CEKDiscreteSlider *)self sliderVerticalOffset];
    double v12 = v14 + 33.0;
  }
  else if (v11 == 1)
  {
    v44.origin.double x = v4;
    v44.origin.double y = v6;
    v44.size.double width = v8;
    v44.size.double height = v10;
    double MaxY = CGRectGetMaxY(v44);
    [(CEKDiscreteSlider *)self levelIndicatorHeight];
    double v17 = MaxY - v16;
    [(CEKDiscreteSlider *)self sliderVerticalOffset];
    double v12 = v17 - v18;
  }
  else
  {
    double v12 = 0.0;
    if (!v11)
    {
      [(CEKDiscreteSlider *)self levelIndicatorHeight];
      uint64_t v33 = 0;
      UIRectCenteredYInRectScale();
      double v12 = v13;
    }
  }
  -[CEKDiscreteSlider _layoutSliderContentAtY:withHorizontalPadding:](self, "_layoutSliderContentAtY:withHorizontalPadding:", v12, 0.0, v33);
  uint64_t v19 = [(CEKDiscreteSlider *)self _valueLabel];
  v20 = [(CEKDiscreteSlider *)self _titleLabel];
  long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v42[0] = *MEMORY[0x1E4F1DAB8];
  long long v35 = v42[0];
  v42[1] = v36;
  long long v43 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v34 = v43;
  [v19 setTransform:v42];
  v41[0] = v35;
  v41[1] = v36;
  v41[2] = v34;
  [v20 setTransform:v41];
  [(CEKDiscreteSlider *)self labelVerticalPadding];
  double v22 = v21;
  [(CEKDiscreteSlider *)self horizontalValueLabelOffset];
  double v24 = v23;
  objc_msgSend(v20, "setFrame:", 10.0, v22, v8 + -20.0, 18.0);
  objc_msgSend(v19, "setFrame:", v24, v22, v8, 18.0);
  [v19 setTextAlignment:1];
  if ([(CEKDiscreteSlider *)self useTextLegibilityBackgrounds])
  {
    v25 = [(CEKDiscreteSlider *)self _valueBackground];
    double v26 = *MEMORY[0x1E4F1DB28];
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    v28 = [v25 image];
    [v28 size];
    double v30 = v29;

    objc_msgSend(v25, "setBounds:", v26, v27, 52.0, v30);
    [v19 center];
    [v25 setCenter:v8 * 0.5];
    if (v19)
    {
      [v19 transform];
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v38 = 0u;
    }
    v37[0] = v38;
    v37[1] = v39;
    v37[2] = v40;
    [v25 setTransform:v37];
    v31 = [(CEKDiscreteSlider *)self _valueBackground];
    [v31 setAlpha:1.0];

    v32 = [(CEKDiscreteSlider *)self _titleBackground];
    [v32 setAlpha:0.0];
  }
}

- (void)_layoutSubviewsWithLabelRotation:(double)a3
{
  double v5 = 18.0;
  if ([(CEKDiscreteSlider *)self useTextLegibilityBackgrounds])
  {
    CGFloat v6 = [(CEKDiscreteSlider *)self _titleBackground];
    double v7 = [v6 image];
    [v7 size];
    double v5 = v8 * 0.5 + 10.0;
  }
  [(CEKDiscreteSlider *)self _layoutSliderContentAtY:55.0 withHorizontalPadding:v5];
  double v9 = [(CEKDiscreteSlider *)self _valueLabel];
  CGFloat v10 = [(CEKDiscreteSlider *)self _titleLabel];
  [v10 intrinsicContentSize];
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v11, 18.0);
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, 40.0, 18.0);
  double v12 = [(CEKDiscreteSlider *)self _levelIndicatorView];
  double v13 = [(CEKDiscreteSlider *)self _tickMarksView];
  if (a3 <= 0.0)
  {
    uint64_t v16 = 0;
    double v15 = 10.0;
  }
  else
  {
    [(CEKDiscreteSlider *)self bounds];
    double v15 = v14 + -10.0;
    uint64_t v16 = 2;
  }
  [v13 center];
  [v10 setCenter:v15];
  [v12 center];
  objc_msgSend(v9, "setCenter:");
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeRotation(&v41, a3);
  CGAffineTransform v39 = v41;
  UIIntegralTransform();
  CGAffineTransform v41 = v40;
  [v9 setTransform:&v40];
  CGAffineTransform v40 = v41;
  [v10 setTransform:&v40];
  [v9 setTextAlignment:v16];
  double v17 = [(CEKDiscreteSlider *)self _valueBackground];
  double v18 = [(CEKDiscreteSlider *)self _titleBackground];
  if ([(CEKDiscreteSlider *)self useTextLegibilityBackgrounds])
  {
    double v19 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v21 = [v18 image];
    [v21 size];
    double v23 = v22;

    [v10 bounds];
    objc_msgSend(v18, "setBounds:", v19, v20, v24 + 20.0, v23);
    [v10 center];
    objc_msgSend(v18, "setCenter:");
    if (v10)
    {
      [v10 transform];
    }
    else
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v36 = 0u;
    }
    v35[0] = v36;
    v35[1] = v37;
    v35[2] = v38;
    [v18 setTransform:v35];
    v25 = [v17 image];
    [v25 size];
    double v27 = v26;

    [v9 bounds];
    objc_msgSend(v17, "setBounds:", v19, v20, v28 + 12.0, v27);
    [v9 center];
    objc_msgSend(v17, "setCenter:");
    if (v9)
    {
      [v9 transform];
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
    }
    v31[0] = v32;
    v31[1] = v33;
    v31[2] = v34;
    [v17 setTransform:v31];
    [v9 setTextAlignment:1];
    double v29 = [(CEKDiscreteSlider *)self _valueBackground];
    [v29 setAlpha:1.0];

    double v30 = [(CEKDiscreteSlider *)self _titleBackground];
    [v30 setAlpha:1.0];
  }
}

- (void)_layoutSliderContentAtY:(double)a3 withHorizontalPadding:(double)a4
{
  [(CEKDiscreteSlider *)self bounds];
  CGFloat v61 = v7;
  CGFloat v62 = v6;
  double v9 = v8;
  CGFloat v59 = v10;
  id v67 = [(CEKDiscreteSlider *)self _contentScrollView];
  double v11 = [(CEKDiscreteSlider *)self _levelIndicatorView];
  double v12 = [(CEKDiscreteSlider *)self _tickMarksView];
  [(CEKDiscreteSlider *)self levelIndicatorHeight];
  double v14 = v13;
  CGFloat v60 = v9;
  UIRoundToViewScale();
  CGFloat v16 = v15;
  objc_msgSend(v11, "setFrame:", v15, a3, 1.0, v14);
  CGFloat v17 = -CEKPixelWidthForView(self);
  v69.size.double width = 1.0;
  CGFloat v66 = v16;
  v69.origin.double x = v16;
  v69.origin.double y = a3;
  v69.size.double height = v14;
  CGRect v70 = CGRectInset(v69, v17, v17);
  double x = v70.origin.x;
  double y = v70.origin.y;
  double width = v70.size.width;
  double height = v70.size.height;
  double v22 = [(CEKDiscreteSlider *)self _indicatorBackground];
  objc_msgSend(v22, "setFrame:", x, y, width, height);

  CGFloat v65 = v14;
  if (v11)
  {
    [(CEKDiscreteSlider *)self tickMarksHeight];
    double v24 = v23;
  }
  else
  {
    double v24 = v14;
  }
  v25 = [v12 tickMarksModel];
  [v25 requiredWidth];
  double v56 = v26;

  double v27 = *MEMORY[0x1E4F1DB28];
  CGFloat v58 = *MEMORY[0x1E4F1DB28];
  [(CEKDiscreteSlider *)self levelIndicatorHeight];
  double v57 = v28 - v24 + a3;
  [v12 frameForAlignmentRect:v27];
  objc_msgSend(v12, "setFrame:");
  objc_msgSend(v12, "frameForTickMarkAtIndex:", -[CEKDiscreteSlider markedIndex](self, "markedIndex"));
  objc_msgSend(v12, "convertRect:toView:", v67);
  double v29 = [(CEKDiscreteSlider *)self traitCollection];
  [v29 displayScale];
  uint64_t v55 = v30;
  UIRectCenteredXInRectScale();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  CGAffineTransform v39 = [(CEKDiscreteSlider *)self _dotView];
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  v71.origin.double y = v61;
  v71.origin.double x = v62;
  v71.size.double height = v59;
  v71.size.double width = v60;
  CGRect v72 = CGRectInset(v71, a4, 0.0);
  double v40 = v72.origin.x;
  double v41 = v72.origin.y;
  double v42 = v72.size.width;
  double dxa = v72.size.height;
  long long v43 = [(CEKDiscreteSlider *)self _edgeGradientView];
  unint64_t v44 = [(CEKDiscreteSlider *)self ticksStyle];
  if (v44 == 1) {
    double v45 = 0.0;
  }
  else {
    double v45 = v41;
  }
  if (v44) {
    double v46 = v45;
  }
  else {
    double v46 = a3;
  }
  v73.origin.double y = v57;
  v73.origin.double x = v58;
  v73.size.double width = v56;
  v73.size.double height = v24;
  objc_msgSend(v43, "setFrame:", v40, v46, v42, CGRectGetMaxY(v73) - v46);
  [(CEKDiscreteSlider *)self gradientInsets];
  double v48 = v47;
  [(CEKDiscreteSlider *)self gradientInsets];
  objc_msgSend(v43, "setGradientDimensions:", v48, v42 * 0.1, v42 * 0.1, v49);
  UIRoundToViewScale();
  double v51 = v50;
  objc_msgSend(v67, "setFrame:", v40, v41, v42, dxa);
  objc_msgSend(v67, "setContentSize:", v56 + v51 * -2.0, dxa);
  v74.size.double width = 1.0;
  v74.origin.double y = a3;
  v74.origin.double x = v66;
  v74.size.double height = v65;
  double MinX = CGRectGetMinX(v74);
  v75.origin.double x = v40;
  v75.origin.double y = v41;
  v75.size.double width = v42;
  v75.size.double height = dxa;
  double v53 = MinX - CGRectGetMinX(v75) - v51;
  v76.origin.double x = v40;
  v76.origin.double y = v41;
  v76.size.double width = v42;
  v76.size.double height = dxa;
  double MaxX = CGRectGetMaxX(v76);
  v77.size.double width = 1.0;
  v77.origin.double x = v66;
  v77.origin.double y = a3;
  v77.size.double height = v65;
  objc_msgSend(v67, "setContentInset:", 0.0, v53, 0.0, v51 + MaxX - CGRectGetMaxX(v77));
  if ([(CEKDiscreteSlider *)self _needsUpdateContentOffset])
  {
    [(CEKDiscreteSlider *)self _setNeedsUpdateContentOffset:0];
    [(CEKDiscreteSlider *)self _updateScrollViewContentOffset];
  }
}

- (double)horizontalValueLabelOffset
{
  return 0.0;
}

- (void)_updateAppearanceForActiveScrolling
{
  [(CEKDiscreteSlider *)self _updateColorsAnimated:1];
  [(CEKDiscreteSlider *)self _updateMarkedIndexViewAnimated:1];
}

- (BOOL)_isScrollActive
{
  double v3 = [(CEKDiscreteSlider *)self _contentScrollView];
  BOOL v4 = ([v3 isTracking] & 1) != 0
    || ([v3 isDecelerating] & 1) != 0
    || [(CEKDiscreteSlider *)self _isExternallyScrolling]
    || [(CEKDiscreteSlider *)self _isScrollExternallyAnimating];

  return v4;
}

- (BOOL)_shouldUseHighlightColor
{
  unint64_t v3 = [(CEKDiscreteSlider *)self colorHighlight];
  if (v3 != 1) {
    return v3 == 2;
  }
  if ([(CEKDiscreteSlider *)self _isScrollActive]) {
    return 1;
  }
  double v5 = [(CEKDiscreteSlider *)self _animationGenerator];
  char v6 = [v5 isAnimatingForIdentifier:@"CEKSelectionScrollingAnimationKey"];

  return v6;
}

- (void)_updateColorsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v25 = [(CEKDiscreteSlider *)self _levelIndicatorView];
  double v5 = [(CEKDiscreteSlider *)self _valueLabel];
  char v6 = [(CEKDiscreteSlider *)self _titleLabel];
  BOOL v7 = [(CEKDiscreteSlider *)self useTextLegibilityShadows];
  BOOL v8 = [(CEKDiscreteSlider *)self _shouldUseHighlightColor];
  if (v8) {
    [(CEKDiscreteSlider *)self tintColor];
  }
  else {
  double v9 = [MEMORY[0x1E4FB1618] labelColor];
  }
  char v10 = [(CEKDiscreteSlider *)self useTextLegibilityBackgrounds] || v7;
  double v11 = [MEMORY[0x1E4FB1618] labelColor];
  double v12 = v11;
  if ((v10 & 1) == 0)
  {
    uint64_t v13 = [v11 colorWithAlphaComponent:0.6];

    double v12 = (void *)v13;
  }
  if (v8)
  {
    id v14 = [(CEKDiscreteSlider *)self tintColor];
  }
  else
  {
    id v14 = v12;
  }
  objc_msgSend(v6, "setTextColor:", v12, v14);
  if (v7)
  {
    double v15 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    CGFloat v16 = [v15 colorWithAlphaComponent:0.15];

    double v17 = CEKPixelWidthForView(self);
    double v18 = 0.0;
  }
  else
  {
    CGFloat v16 = 0;
    double v18 = *MEMORY[0x1E4F1DB30];
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  [v6 setShadowColor:v16];
  [v5 setShadowColor:v16];
  objc_msgSend(v6, "setShadowOffset:", v18, v17);
  objc_msgSend(v5, "setShadowOffset:", v18, v17);
  if (v3)
  {
    double v19 = (void *)MEMORY[0x1E4FB1EB0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __43__CEKDiscreteSlider__updateColorsAnimated___block_invoke;
    v29[3] = &unk_1E63CD6C8;
    double v20 = v25;
    id v30 = v25;
    id v31 = v9;
    [v19 animateWithDuration:v29 animations:0.15];
    double v21 = (void *)MEMORY[0x1E4FB1EB0];
    double v22 = [(CEKDiscreteSlider *)self _valueLabel];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __43__CEKDiscreteSlider__updateColorsAnimated___block_invoke_2;
    v26[3] = &unk_1E63CD6C8;
    id v27 = v5;
    double v23 = v24;
    id v28 = v24;
    [v21 transitionWithView:v22 duration:5242880 options:v26 animations:0 completion:0.15];
  }
  else
  {
    double v20 = v25;
    [v25 setBackgroundColor:v9];
    double v23 = v24;
    [v5 setTextColor:v24];
  }
}

uint64_t __43__CEKDiscreteSlider__updateColorsAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

uint64_t __43__CEKDiscreteSlider__updateColorsAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTextColor:*(void *)(a1 + 40)];
}

- (void)_updateScrollViewContentOffset
{
  [(CEKDiscreteSlider *)self _contentOffsetForIndex:[(CEKDiscreteSlider *)self selectedIndex]];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(CEKDiscreteSlider *)self _contentScrollView];
  objc_msgSend(v7, "setContentOffset:animated:", 0, v4, v6);
}

- (void)_updateMarkedIndexViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CEKDiscreteSlider *)self _dotView];
  unint64_t v6 = [(CEKDiscreteSlider *)self markedIndex];
  unint64_t v7 = [(CEKDiscreteSlider *)self markedIndex];
  if (v7 >= [(CEKDiscreteSlider *)self indexCount])
  {
    BOOL v9 = 0;
  }
  else
  {
    if ([(CEKDiscreteSlider *)self _isScrollActive])
    {
      BOOL v8 = v5 != 0;
      BOOL v9 = 1;
      goto LABEL_8;
    }
    BOOL v9 = v6 != [(CEKDiscreteSlider *)self selectedIndex];
  }
  BOOL v8 = v5 != 0;
  if (v9 || v5)
  {
LABEL_8:
    if (!v9 || v8)
    {
      if (v9) {
        double v12 = 1.0;
      }
      else {
        double v12 = 0.0;
      }
      if (!v3) {
        goto LABEL_19;
      }
    }
    else
    {
      double v5 = objc_alloc_init(CEKSliderDotView);
      char v10 = [(CEKDiscreteSlider *)self tickMarksConfiguration];
      -[CEKSliderDotView setUseLegibilityShadow:](v5, "setUseLegibilityShadow:", [v10 useTickMarkLegibilityShadows]);

      double v11 = [(CEKDiscreteSlider *)self _contentScrollView];
      [v11 addSubview:v5];

      [(CEKDiscreteSlider *)self set_dotView:v5];
      [(CEKDiscreteSlider *)self setNeedsLayout];
      if (!v3)
      {
        double v12 = 1.0;
        goto LABEL_19;
      }
      [(CEKSliderDotView *)v5 setAlpha:0.0];
      double v12 = 1.0;
    }
    [(CEKSliderDotView *)v5 alpha];
    if (v13 != v12)
    {
      id v14 = (void *)MEMORY[0x1E4FB1EB0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __52__CEKDiscreteSlider__updateMarkedIndexViewAnimated___block_invoke;
      v15[3] = &unk_1E63CD5A0;
      CGFloat v16 = v5;
      double v17 = v12;
      double v5 = v5;
      [v14 animateWithDuration:v15 animations:0 completion:0.25];

LABEL_20:
      return;
    }
LABEL_19:
    [(CEKSliderDotView *)v5 setAlpha:v12];
    goto LABEL_20;
  }
}

uint64_t __52__CEKDiscreteSlider__updateMarkedIndexViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_setOverscrolling:(BOOL)a3
{
  if (self->__overscrolling != a3)
  {
    BOOL v3 = a3;
    self->__overscrolling = a3;
    int64_t v5 = [(CEKDiscreteSlider *)self feedbackScope];
    if (v3)
    {
      if (v5)
      {
        unint64_t v6 = [(CEKDiscreteSlider *)self _feedbackGenerator];
        [v6 playOverscrollTickSound];

        id v7 = [(CEKDiscreteSlider *)self _feedbackGenerator];
        [v7 performFeedback];
      }
    }
  }
}

- (void)_updateTextLegibilityBackground
{
  BOOL v3 = [(CEKDiscreteSlider *)self useTextLegibilityBackgrounds];
  id v15 = [(CEKDiscreteSlider *)self _valueBackground];
  double v4 = [(CEKDiscreteSlider *)self _titleBackground];
  int64_t v5 = [(CEKDiscreteSlider *)self _indicatorBackground];
  if (v3)
  {
    unint64_t v6 = v15;
    if (!v15 && !v4)
    {
      id v7 = [(CEKDiscreteSlider *)self _createLegibilityImage];
      id v16 = (id)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
      double v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
      id v8 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);

      BOOL v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      char v10 = [v9 colorWithAlphaComponent:0.15];
      [v8 setBackgroundColor:v10];

      double v11 = [(CEKDiscreteSlider *)self _valueLabel];
      [(CEKDiscreteSlider *)self insertSubview:v16 belowSubview:v11];

      double v12 = [(CEKDiscreteSlider *)self _titleLabel];
      [(CEKDiscreteSlider *)self insertSubview:v4 belowSubview:v12];

      double v13 = [(CEKDiscreteSlider *)self _levelIndicatorView];
      [(CEKDiscreteSlider *)self insertSubview:v8 belowSubview:v13];

      [(CEKDiscreteSlider *)self set_valueBackground:v16];
      [(CEKDiscreteSlider *)self set_titleBackground:v4];
      [(CEKDiscreteSlider *)self set_indicatorBackground:v8];

      unint64_t v6 = v16;
      int64_t v5 = v8;
    }
  }
  else
  {
    unint64_t v6 = v15;
  }
  if (v3) {
    double v14 = 1.0;
  }
  else {
    double v14 = 0.0;
  }
  id v17 = v6;
  [v6 setAlpha:v14];
  [v4 setAlpha:v14];
  [v5 setAlpha:v14];
  [(CEKDiscreteSlider *)self setNeedsLayout];
}

- (id)_createLegibilityImage
{
  CGFloat v2 = *MEMORY[0x1E4F1DAD8];
  CGFloat v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v4 = [(CEKDiscreteSlider *)self traitCollection];
  [v4 displayScale];
  CGFloat v6 = v5;
  v14.double width = 25.0;
  v14.double height = 25.0;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v6);

  CurrentContext = UIGraphicsGetCurrentContext();
  id v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v9 = [v8 colorWithAlphaComponent:0.3];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v9 CGColor]);

  v15.size.double width = 25.0;
  v15.size.double height = 25.0;
  v15.origin.double x = v2;
  v15.origin.double y = v3;
  CGContextFillEllipseInRect(CurrentContext, v15);
  char v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  double v11 = objc_msgSend(v10, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x1E4FB2848], 12.5, *(double *)(MEMORY[0x1E4FB2848] + 16), 12.5);

  return v11;
}

- (void)_updateFonts
{
  uint64_t v3 = [(CEKDiscreteSlider *)self fontStyle];
  double v4 = CEKFontOfSizeAndStyle(v3, 14.0);
  double v5 = [(CEKDiscreteSlider *)self _titleLabel];
  [v5 setFont:v4];

  CEKMonospacedStylisticNumeralFontOfSizeAndStyle(v3, 14.0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  CGFloat v6 = [(CEKDiscreteSlider *)self _valueLabel];
  [v6 setFont:v7];
}

- (void)performWaveAnimation
{
  id v2 = [(CEKDiscreteSlider *)self _dynamicTickMarksView];
  [v2 performWaveAnimation];
}

- (void)_setSelectedIndex:(unint64_t)a3 shouldDelegate:(BOOL)a4 wantsFeedbackEmitted:(BOOL)a5 shouldScroll:(BOOL)a6 scrollDuration:(double)a7 scrollCurve:(id)a8 scrollCompletion:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  id v16 = a8;
  id v17 = a9;
  if (self->_selectedIndex == a3) {
    goto LABEL_24;
  }
  self->_selectedIndedouble x = a3;
  [(CEKDiscreteSlider *)self updateValueLabel];
  [(CEKDiscreteSlider *)self _updateMarkedIndexViewAnimated:1];
  double v18 = [(CEKDiscreteSlider *)self _dynamicTickMarksView];
  [v18 setSelectedTickMarkIndex:a3 animated:v13];

  if (v13) {
    [(CEKDiscreteSlider *)self sendActionsForControlEvents:4096];
  }
  if (v12)
  {
    int64_t v19 = [(CEKDiscreteSlider *)self feedbackScope];
    if ((unint64_t)(v19 - 1) <= 1)
    {
      int64_t v20 = v19;
      if (a3) {
        BOOL v21 = [(CEKDiscreteSlider *)self indexCount] - 1 == a3;
      }
      else {
        BOOL v21 = 1;
      }
      unint64_t v22 = [(CEKDiscreteSlider *)self _tickMarkIndexForIndex:a3];
      double v23 = [(CEKDiscreteSlider *)self _tickMarksView];
      double v24 = [v23 tickMarksModel];
      int v25 = [v24 isMainTickMarkAtIndex:v22];

      if (v21)
      {
        double v26 = [(CEKDiscreteSlider *)self _feedbackGenerator];
        [v26 performFeedback];

        id v27 = [(CEKDiscreteSlider *)self _feedbackGenerator];
        [v27 playEndTickSound];
LABEL_15:

        goto LABEL_16;
      }
      if (v25)
      {
        id v28 = [(CEKDiscreteSlider *)self _feedbackGenerator];
        [v28 performFeedback];

        id v27 = [(CEKDiscreteSlider *)self _feedbackGenerator];
        [v27 playMajorTickSound];
        goto LABEL_15;
      }
      if (v20 == 2)
      {
        double v29 = [(CEKDiscreteSlider *)self _feedbackGenerator];
        [v29 performFeedback];

        id v27 = [(CEKDiscreteSlider *)self _feedbackGenerator];
        [v27 playMinorTickSound];
        goto LABEL_15;
      }
    }
  }
LABEL_16:
  if (a7 > 0.0 && v11)
  {
    id v30 = [(CEKDiscreteSlider *)self _animationGenerator];

    if (!v30)
    {
      id v31 = objc_alloc_init(CEKAnimationGenerator);
      [(CEKDiscreteSlider *)self _setAnimationGenerator:v31];
    }
    double v32 = [(CEKDiscreteSlider *)self _contentScrollView];
    [v32 contentOffset];
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    [(CEKDiscreteSlider *)self _contentOffsetForIndex:a3];
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    double v41 = [(CEKDiscreteSlider *)self _animationGenerator];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __132__CEKDiscreteSlider__setSelectedIndex_shouldDelegate_wantsFeedbackEmitted_shouldScroll_scrollDuration_scrollCurve_scrollCompletion___block_invoke;
    v51[3] = &unk_1E63CD6F0;
    id v52 = v16;
    uint64_t v54 = v34;
    uint64_t v55 = v36;
    uint64_t v56 = v38;
    uint64_t v57 = v40;
    id v53 = v32;
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    double v46 = __132__CEKDiscreteSlider__setSelectedIndex_shouldDelegate_wantsFeedbackEmitted_shouldScroll_scrollDuration_scrollCurve_scrollCompletion___block_invoke_2;
    double v47 = &unk_1E63CD718;
    id v48 = v53;
    double v49 = self;
    id v50 = v17;
    id v42 = v53;
    [v41 startAnimationForIdentifier:@"CEKSelectionScrollingAnimationKey" duration:v51 updateHandler:&v44 completionHandler:a7];

    objc_msgSend(v42, "setScrollEnabled:", 0, v44, v45, v46, v47);
    [(CEKDiscreteSlider *)self _updateColorsAnimated:1];
  }
  else if (v11)
  {
    long long v43 = [(CEKDiscreteSlider *)self _animationGenerator];
    [v43 stopAnimationForIdentifier:@"CEKSelectionScrollingAnimationKey"];

    [(CEKDiscreteSlider *)self _updateScrollViewContentOffset];
    if (v17) {
      (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
    }
  }
LABEL_24:
}

uint64_t __132__CEKDiscreteSlider__setSelectedIndex_shouldDelegate_wantsFeedbackEmitted_shouldScroll_scrollDuration_scrollCurve_scrollCompletion___block_invoke(uint64_t a1, double a2)
{
  double v2 = a2;
  double v4 = *(void **)(a1 + 32);
  if (v4)
  {
    *(float *)&a2 = a2;
    [v4 _solveForInput:a2];
    double v2 = v5;
  }
  double v6 = *(double *)(a1 + 56);
  double v7 = CEKInterpolate(*(double *)(a1 + 48), *(double *)(a1 + 64), v2);
  id v8 = *(void **)(a1 + 40);
  return objc_msgSend(v8, "setContentOffset:", v7, v6);
}

uint64_t __132__CEKDiscreteSlider__setSelectedIndex_shouldDelegate_wantsFeedbackEmitted_shouldScroll_scrollDuration_scrollCurve_scrollCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setScrollEnabled:1];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  float v5 = *(void **)(a1 + 40);
  return [v5 _updateColorsAnimated:1];
}

- (double)_interpolatedIndexForContentOffset:(CGPoint)a3
{
  double x = a3.x;
  if (![(CEKDiscreteSlider *)self indexCount]) {
    return 0.0;
  }
  float v5 = [(CEKDiscreteSlider *)self _contentScrollView];
  [v5 contentInset];
  double v7 = (x + v6) / CEKScrollableDistanceInScrollView(v5);
  double v8 = v7 * (double)([(CEKDiscreteSlider *)self indexCount] - 1);

  return v8;
}

- (unint64_t)_biasedIndexForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t result = [(CEKDiscreteSlider *)self indexCount];
  if (result)
  {
    -[CEKDiscreteSlider _interpolatedIndexForContentOffset:](self, "_interpolatedIndexForContentOffset:", x, y);
    double v8 = v7;
    unint64_t v9 = [(CEKDiscreteSlider *)self selectedIndex];
    double v10 = floor(v8);
    double v11 = ceil(v8);
    if (v8 <= (double)v9) {
      double v12 = v11;
    }
    else {
      double v12 = v10;
    }
    unint64_t v13 = (unint64_t)v12;
    if (v9 == (unint64_t)v12)
    {
      unint64_t v14 = v9;
      unint64_t v15 = vcvtad_u64_f64(v8);
      [(CEKDiscreteSlider *)self _contentOffsetForIndex:v15];
      if (vabdd_f64(v16, x) <= 1.0) {
        unint64_t v13 = v15;
      }
      else {
        unint64_t v13 = v14;
      }
    }
    return (unint64_t)CEKClamp((double)v13, 0.0, (double)([(CEKDiscreteSlider *)self indexCount] - 1));
  }
  return result;
}

- (unint64_t)_nearestIndexForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t result = [(CEKDiscreteSlider *)self indexCount];
  if (result)
  {
    -[CEKDiscreteSlider _interpolatedIndexForContentOffset:](self, "_interpolatedIndexForContentOffset:", x, y);
    return (unint64_t)CEKClamp((double)(unint64_t)round(v7), 0.0, (double)([(CEKDiscreteSlider *)self indexCount] - 1));
  }
  return result;
}

- (unint64_t)_indexForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(CEKDiscreteSlider *)self biasScrollingToCurrentSelection])
  {
    return -[CEKDiscreteSlider _biasedIndexForContentOffset:](self, "_biasedIndexForContentOffset:", x, y);
  }
  else
  {
    return -[CEKDiscreteSlider _nearestIndexForContentOffset:](self, "_nearestIndexForContentOffset:", x, y);
  }
}

- (CGPoint)_contentOffsetForIndex:(unint64_t)a3
{
  if ([(CEKDiscreteSlider *)self indexCount])
  {
    CEKProgress((double)a3, 0.0, (double)([(CEKDiscreteSlider *)self indexCount] - 1));
    float v5 = [(CEKDiscreteSlider *)self _contentScrollView];
    [v5 contentOffset];
    double v7 = v6;
    CEKScrollableDistanceInScrollView(v5);
    [v5 contentInset];
    UIRoundToViewScale();
    double v9 = v8;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v10 = v9;
  double v11 = v7;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (unint64_t)_tickMarkIndexForIndex:(unint64_t)a3
{
  return a3 + a3 * [(CEKDiscreteSlider *)self tickMarkCountBetweenIndexes];
}

- (unint64_t)indexForTickMarkAtPoint:(CGPoint)a3 in:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(CEKDiscreteSlider *)self _contentScrollView];
  objc_msgSend(v8, "convertPoint:fromView:", v7, x, y);
  double v10 = v9;

  double v11 = [(CEKDiscreteSlider *)self _contentScrollView];
  [v11 contentInset];
  double v13 = v10 - v12;
  unint64_t v14 = [(CEKDiscreteSlider *)self _contentScrollView];
  [v14 contentOffset];
  double v16 = v15;

  return -[CEKDiscreteSlider _nearestIndexForContentOffset:](self, "_nearestIndexForContentOffset:", v13, v16);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  uint64_t v4 = [(CEKDiscreteSlider *)self _feedbackGenerator];
  [v4 prepareFeedback];

  [(CEKDiscreteSlider *)self _updateAppearanceForActiveScrolling];
  if (self->_delegateFlags.respondsToWillBeginScrolling)
  {
    id v5 = [(CEKDiscreteSlider *)self delegate];
    [v5 sliderWillBeginScrolling:self];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  [(CEKDiscreteSlider *)self _updateAppearanceForActiveScrolling];
  if (!a4)
  {
    [(CEKDiscreteSlider *)self _sliderDidEndScrolling];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(CEKDiscreteSlider *)self _updateAppearanceForActiveScrolling];
  [(CEKDiscreteSlider *)self _sliderDidEndScrolling];
}

- (void)_sliderDidEndScrolling
{
  if (self->_delegateFlags.respondsToDidEndScrolling)
  {
    id v3 = [(CEKDiscreteSlider *)self delegate];
    [v3 sliderDidEndScrolling:self];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(CEKDiscreteSlider *)self _dynamicTickMarksView];
  [(CEKDiscreteSlider *)self bounds];
  -[CEKDiscreteSlider convertRect:toView:](self, "convertRect:toView:", v4);
  objc_msgSend(v4, "setVisibleBounds:");
  if ([(CEKDiscreteSlider *)self _isScrollActive])
  {
    id v5 = [(CEKDiscreteSlider *)self _animationGenerator];
    char v6 = [v5 isAnimatingForIdentifier:@"CEKSelectionScrollingAnimationKey"];

    if ((v6 & 1) == 0)
    {
      [v13 contentOffset];
      -[CEKDiscreteSlider _setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:](self, "_setSelectedIndex:shouldDelegate:wantsFeedbackEmitted:shouldScroll:scrollDuration:scrollCurve:scrollCompletion:", -[CEKDiscreteSlider _indexForContentOffset:](self, "_indexForContentOffset:"), 1, 1, 0, 0, 0, 0.0);
      [v13 contentOffset];
      double v8 = v7;
      [v13 contentInset];
      double v10 = v9;
      BOOL v11 = v8 > CEKScrollableDistanceInScrollView(v13) - v9 + 20.0 || v8 < -20.0 - v10;
      [(CEKDiscreteSlider *)self _setOverscrolling:v11];
    }
  }
  if (([v13 isTracking] & 1) != 0 || objc_msgSend(v13, "isDecelerating"))
  {
    double v12 = [(CEKDiscreteSlider *)self _externalScrollOffsetAnimator];
    [v12 invalidate];

    [(CEKDiscreteSlider *)self _setExternalScrollOffsetAnimator:0];
    [(CEKDiscreteSlider *)self contactEndedWithAction:0];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[CEKDiscreteSlider _contentOffsetForIndex:](self, "_contentOffsetForIndex:", -[CEKDiscreteSlider _nearestIndexForContentOffset:](self, "_nearestIndexForContentOffset:", a3, a5->x, a5->y));
  a5->double x = v6;
  a5->double y = v7;
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  [(CEKDiscreteSlider *)self _sliderDidEndScrolling];
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;

  unint64_t v9 = -[CEKDiscreteSlider _nearestIndexForContentOffset:](self, "_nearestIndexForContentOffset:", v6, v8);
  [(CEKDiscreteSlider *)self _setSelectedIndex:v9 shouldDelegate:1 wantsFeedbackEmitted:1 shouldScroll:0 scrollDuration:0 scrollCurve:0 scrollCompletion:0.0];
}

- (CEKSliderPositionDriver)_sliderDriver
{
  sliderDriver = self->__sliderDriver;
  if (!sliderDriver)
  {
    CEKDefaultSliderPositionDriver();
    id v4 = (CEKSliderPositionDriver *)objc_claimAutoreleasedReturnValue();
    double v5 = self->__sliderDriver;
    self->__sliderDriver = v4;

    sliderDriver = self->__sliderDriver;
  }
  return sliderDriver;
}

- (void)contactBeganWithAction:(id)a3
{
  id v8 = a3;
  if (![(CEKDiscreteSlider *)self _isExternalScrollingAllowed]
    && [(CEKDiscreteSlider *)self isEnabled])
  {
    [(CEKDiscreteSlider *)self _setExternalScrollingAllowed:1];
    [(CEKDiscreteSlider *)self _setExternalOverScroll:0.0];
    id v4 = [(CEKDiscreteSlider *)self _sliderDriver];
    [v4 contactBeganWithAction:v8];

    double v5 = [(CEKDiscreteSlider *)self _contentScrollView];
    [v5 contentOffset];
    double v7 = v6;
    objc_msgSend(v5, "setContentOffset:animated:", 0);
    [(CEKDiscreteSlider *)self _applyExternalTarget:2 mode:v7];
  }
}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4 = a3;
  if ([(CEKDiscreteSlider *)self _isExternalScrollingAllowed])
  {
    double v5 = [(CEKDiscreteSlider *)self _contentScrollView];
    if (![(CEKDiscreteSlider *)self _isExternallyScrolling])
    {
      [(CEKDiscreteSlider *)self _setExternallyScrolling:1];
      [(CEKDiscreteSlider *)self scrollViewWillBeginDragging:v5];
    }
    [(CEKDiscreteSlider *)self _createExternalScrollAnimatorIfNeeded];
    double v6 = [(CEKDiscreteSlider *)self _sliderDriver];
    [v6 distanceTraveled];
    double v8 = v7;
    [v6 contactUpdatedWithAction:v4];
    [v6 distanceTraveled];
    double v10 = v9 - v8;
    BOOL v11 = [(CEKDiscreteSlider *)self _externalScrollOffsetAnimator];
    [v11 value];
    double v13 = v12;

    double v14 = v10 + v13;
    unint64_t v15 = [(CEKDiscreteSlider *)self indexCount];
    if (!v15) {
      goto LABEL_15;
    }
    unint64_t v16 = v15;
    [(CEKDiscreteSlider *)self _contentOffsetForIndex:0];
    double v18 = v17;
    [(CEKDiscreteSlider *)self _contentOffsetForIndex:v16 - 1];
    double v20 = v19;
    [(CEKDiscreteSlider *)self _externalOverScroll];
    if (v14 <= v20)
    {
      double v22 = 0.0;
      if (v14 >= v18)
      {
LABEL_14:
        -[CEKDiscreteSlider _setExternalOverScroll:](self, "_setExternalOverScroll:", v22, *(void *)&v24, v25, *(void *)&v26, v27);
LABEL_15:
        [(CEKDiscreteSlider *)self _applyExternalTarget:5 mode:v14];

        goto LABEL_16;
      }
      if (v21 == 0.0) {
        double v22 = v14 - v18;
      }
      else {
        double v22 = v10 + v21;
      }
    }
    else if (v21 == 0.0)
    {
      double v22 = v14 - v20;
    }
    else
    {
      double v22 = v10 + v21;
    }
    [(CEKDiscreteSlider *)self bounds];
    double v24 = v18;
    LOBYTE(v25) = 1;
    *(_DWORD *)((char *)&v25 + 1) = 0;
    HIDWORD(v25) = 0;
    double v26 = v20;
    LOBYTE(v27) = 1;
    *(_DWORD *)((char *)&v27 + 1) = 0;
    HIDWORD(v27) = 0;
    BSUIConstrainValueToIntervalWithRubberBand();
    double v14 = v23;
    goto LABEL_14;
  }
LABEL_16:
}

- (void)contactEndedWithAction:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(CEKDiscreteSlider *)self _isExternalScrollingAllowed]) {
    goto LABEL_80;
  }
  [(CEKDiscreteSlider *)self _setExternalScrollingAllowed:0];
  [(CEKDiscreteSlider *)self _setExternallyScrolling:0];
  double v5 = [(CEKDiscreteSlider *)self _sliderDriver];
  [v5 contactEndedWithAction:v4];
  [v5 velocity];
  double v7 = v6;
  double v8 = [(CEKDiscreteSlider *)self _externalScrollOffsetAnimator];
  [v8 value];
  double v10 = v9;

  [v5 distanceToDecelerate];
  double v12 = v10 + v11;
  unint64_t v13 = -[CEKDiscreteSlider _indexForContentOffset:](self, "_indexForContentOffset:", v10 + v11, 0.0);
  [(CEKDiscreteSlider *)self _contentOffsetForIndex:v13];
  double v15 = v14;
  uint64_t v16 = [(CEKDiscreteSlider *)self selectedIndex];
  double v17 = [(CEKDiscreteSlider *)self protectedIndexes];
  double v18 = [(CEKDiscreteSlider *)self magneticIndexes];
  if (!v18)
  {
    if (v17)
    {
      unint64_t v35 = v16 - v13;
      if ((uint64_t)(v16 - v13) < 0) {
        unint64_t v35 = v13 - v16;
      }
      if (v35 >= 2)
      {
        CGRect v73 = 0;
        if (v16 >= v13) {
          unint64_t v36 = v13;
        }
        else {
          unint64_t v36 = v16;
        }
        uint64_t v37 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", v36, v35 + 1);
        [v37 removeIndex:v16];
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v38 = v17;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v75 objects:v91 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          id v70 = v4;
          CGRect v72 = v5;
          double v41 = v17;
          uint64_t v42 = *(void *)v76;
          uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v76 != v42) {
                objc_enumerationMutation(v38);
              }
              uint64_t v45 = objc_msgSend(*(id *)(*((void *)&v75 + 1) + 8 * i), "integerValue", v70);
              if ([v37 containsIndex:v45])
              {
                unint64_t v46 = v16 - v45;
                if (v16 - v45 < 0) {
                  unint64_t v46 = v45 - v16;
                }
                unint64_t v47 = v43 - v16;
                if (v43 - v16 < 0) {
                  unint64_t v47 = v16 - v43;
                }
                if (v46 < v47) {
                  uint64_t v43 = v45;
                }
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v75 objects:v91 count:16];
          }
          while (v40);

          if (v43 == 0x7FFFFFFFFFFFFFFFLL)
          {
            double v48 = v15;
          }
          else
          {
            uint64_t v66 = v43 - 1;
            if (v43 <= v16) {
              uint64_t v66 = v43 + 1;
            }
            if (v66 == v16) {
              uint64_t v67 = v43;
            }
            else {
              uint64_t v67 = v66;
            }
            [(CEKDiscreteSlider *)self _contentOffsetForIndex:v67];
            double v48 = v68;
          }
          double v17 = v41;
          id v4 = v70;
          double v5 = v72;
        }
        else
        {

          double v48 = v15;
        }
        goto LABEL_50;
      }
    }
    double v48 = v15;
    goto LABEL_58;
  }
  id v69 = v4;
  CGRect v71 = v5;
  double v19 = v17;
  [(CEKDiscreteSlider *)self _contentOffsetForIndex:0];
  double v21 = v20;
  [(CEKDiscreteSlider *)self _contentOffsetForIndex:[(CEKDiscreteSlider *)self indexCount] - 1];
  double v23 = v22;
  double v24 = [(CEKDiscreteSlider *)self _externalScrollOffsetAnimator];
  [v24 value];
  double v26 = v25;

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  CGRect v73 = v18;
  id v27 = v18;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v79 objects:v92 count:16];
  if (!v28)
  {
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_44:

LABEL_45:
    double v17 = v19;
LABEL_46:
    double v5 = v71;
    if (v7 < -20.0 && v31 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(CEKDiscreteSlider *)self _contentOffsetForIndex:v31];
      id v52 = [(CEKDiscreteSlider *)self traitCollection];
      [v52 displayScale];
      UIRoundToScale();
      double v54 = v53;

      double v48 = fmax(v21, fmin(v23, v54));
      uint64_t v37 = os_log_create("com.apple.camera", "CameraEditKit");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        uint64_t v84 = v16;
        __int16 v85 = 2048;
        uint64_t v86 = v31;
        __int16 v87 = 2048;
        double v88 = v7;
LABEL_90:
        _os_log_debug_impl(&dword_1BEE2D000, v37, OS_LOG_TYPE_DEBUG, "ScrollDiagnostic: Decelerating from %ld to magnetic index %lu with velocity %.3f", buf, 0x20u);
      }
      goto LABEL_49;
    }
    uint64_t v37 = os_log_create("com.apple.camera", "CameraEditKit");
    BOOL v55 = os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG);
    double v18 = v73;
    if (v15 == v10)
    {
      id v4 = v69;
      if (v55) {
        -[CEKDiscreteSlider contactEndedWithAction:](v37, v7);
      }
    }
    else
    {
      id v4 = v69;
      if (v55)
      {
        *(_DWORD *)buf = 134218496;
        uint64_t v84 = v16;
        __int16 v85 = 2048;
        uint64_t v86 = v13;
        __int16 v87 = 2048;
        double v88 = v7;
        _os_log_debug_impl(&dword_1BEE2D000, v37, OS_LOG_TYPE_DEBUG, "ScrollDiagnostic: Decelerating without magnet from %ld to index %lu (velocity %.3f)", buf, 0x20u);
      }
    }
    double v48 = v15;
    goto LABEL_57;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)v80;
  uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_5:
  uint64_t v32 = 0;
  while (1)
  {
    if (*(void *)v80 != v30) {
      objc_enumerationMutation(v27);
    }
    uint64_t v33 = [*(id *)(*((void *)&v79 + 1) + 8 * v32) unsignedIntegerValue];
    [(CEKDiscreteSlider *)self _contentOffsetForIndex:v33];
    if (v34 >= v26) {
      break;
    }
    uint64_t v31 = v33;
LABEL_12:
    if (v29 == ++v32)
    {
      uint64_t v29 = [v27 countByEnumeratingWithState:&v79 objects:v92 count:16];
      if (v29) {
        goto LABEL_5;
      }
      goto LABEL_44;
    }
  }
  if (v34 <= v26) {
    goto LABEL_12;
  }

  if (v7 <= 20.0) {
    goto LABEL_45;
  }
  double v17 = v19;
  if (v33 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_46;
  }
  [(CEKDiscreteSlider *)self _contentOffsetForIndex:v33];
  double v49 = [(CEKDiscreteSlider *)self traitCollection];
  [v49 displayScale];
  UIRoundToScale();
  double v51 = v50;

  double v48 = fmax(v21, fmin(v23, v51));
  uint64_t v37 = os_log_create("com.apple.camera", "CameraEditKit");
  double v5 = v71;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v84 = v16;
    __int16 v85 = 2048;
    uint64_t v86 = v33;
    __int16 v87 = 2048;
    double v88 = v7;
    goto LABEL_90;
  }
LABEL_49:
  id v4 = v69;
LABEL_50:
  double v18 = v73;
LABEL_57:

LABEL_58:
  unint64_t v56 = [(CEKDiscreteSlider *)self indexCount];
  -[CEKDiscreteSlider _interpolatedIndexForContentOffset:](self, "_interpolatedIndexForContentOffset:", v12, 0.0);
  int64_t v58 = llround(v57);
  unint64_t v59 = v16 - v58;
  if (v16 - v58 < 0) {
    unint64_t v59 = v58 - v16;
  }
  if (v48 == v15)
  {
    BOOL v60 = v59 >= 2 && v56 >= 3;
    if (v60 && v59 <= 2)
    {
      if (v16 >= 1 && v16 > v58)
      {
        [(CEKDiscreteSlider *)self _contentOffsetForIndex:v16 - 1];
        double v48 = v62;
        v63 = os_log_create("com.apple.camera", "CameraEditKit");
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218752;
          uint64_t v84 = v16;
          __int16 v85 = 2048;
          uint64_t v86 = v16 - 1;
          __int16 v87 = 2048;
          double v88 = *(double *)&v58;
          __int16 v89 = 2048;
          double v90 = v7;
          goto LABEL_92;
        }
        goto LABEL_75;
      }
      if (v16 < v58 && v16 < v56 - 1)
      {
        [(CEKDiscreteSlider *)self _contentOffsetForIndex:v16 + 1];
        double v48 = v64;
        v63 = os_log_create("com.apple.camera", "CameraEditKit");
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218752;
          uint64_t v84 = v16;
          __int16 v85 = 2048;
          uint64_t v86 = v16 + 1;
          __int16 v87 = 2048;
          double v88 = *(double *)&v58;
          __int16 v89 = 2048;
          double v90 = v7;
LABEL_92:
          _os_log_debug_impl(&dword_1BEE2D000, v63, OS_LOG_TYPE_DEBUG, "ScrollDiagnostic: Decelerating from %ld to %lu (limited from %ld) (velocity %.3f)", buf, 0x2Au);
        }
LABEL_75:
      }
    }
  }
  if (v48 == v10)
  {
    [(CEKDiscreteSlider *)self _sliderDidEndScrolling];
  }
  else
  {
    CGFloat v65 = [(CEKDiscreteSlider *)self _contentScrollView];
    [(CEKDiscreteSlider *)self scrollViewDidEndDragging:v65 willDecelerate:1];

    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __44__CEKDiscreteSlider_contactEndedWithAction___block_invoke;
    v74[3] = &unk_1E63CD740;
    v74[4] = self;
    [(CEKDiscreteSlider *)self _applyExternalTarget:3 mode:v74 completion:v48];
  }

LABEL_80:
}

uint64_t __44__CEKDiscreteSlider_contactEndedWithAction___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isScrollExternallyAnimating];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) _isExternalScrollingAllowed];
    if ((result & 1) == 0)
    {
      id v3 = *(void **)(a1 + 32);
      return [v3 _sliderDidEndScrolling];
    }
  }
  return result;
}

- (CEKFluidBehaviorSettings)_externalScrollSettings
{
  externalScrollSettings = self->__externalScrollSettings;
  if (!externalScrollSettings)
  {
    id v4 = objc_alloc_init(CEKFluidBehaviorSettings);
    double v5 = self->__externalScrollSettings;
    self->__externalScrollSettings = v4;

    [(CEKFluidBehaviorSettings *)self->__externalScrollSettings setDefaultCriticallyDampedValues];
    [(CEKFluidBehaviorSettings *)self->__externalScrollSettings setDampingRatio:1.0];
    [(CEKFluidBehaviorSettings *)self->__externalScrollSettings setResponse:0.4];
    externalScrollSettings = self->__externalScrollSettings;
  }
  return externalScrollSettings;
}

- (BOOL)_isScrollExternallyAnimating
{
  double v2 = self;
  id v3 = [(CEKDiscreteSlider *)self _externalScrollOffsetAnimator];
  [v3 presentationValue];
  [v3 value];
  CEKPixelWidthForView(v2);
  LOBYTE(v2) = BSFloatApproximatelyEqualToFloat() ^ 1;

  return (char)v2;
}

- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4
{
}

- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  double v8 = [(CEKDiscreteSlider *)self _externalScrollOffsetAnimator];
  UIRoundToViewScale();
  double v10 = v9;
  if (!v8 || ([v8 value], v10 != v11))
  {
    [(CEKDiscreteSlider *)self _createExternalScrollAnimatorIfNeeded];
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    unint64_t v13 = [(CEKDiscreteSlider *)self _externalScrollSettings];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__CEKDiscreteSlider__applyExternalTarget_mode_completion___block_invoke;
    v14[3] = &unk_1E63CD5A0;
    v14[4] = self;
    *(double *)&v14[5] = v10;
    objc_msgSend(v12, "cek_animateWithSettings:mode:animations:completion:", v13, a4, v14, v7);
  }
}

void __58__CEKDiscreteSlider__applyExternalTarget_mode_completion___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _externalScrollOffsetAnimator];
  [v2 setValue:v1];
}

- (void)_createExternalScrollAnimatorIfNeeded
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CEKDiscreteSlider *)self _externalScrollOffsetAnimator];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    [(CEKDiscreteSlider *)self _setExternalScrollOffsetAnimator:v4];
    objc_initWeak(&location, self);
    double v5 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = v4;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    double v12 = __58__CEKDiscreteSlider__createExternalScrollAnimatorIfNeeded__block_invoke;
    unint64_t v13 = &unk_1E63CD768;
    objc_copyWeak(&v14, &location);
    [v5 _createTransformerWithInputAnimatableProperties:v6 presentationValueChangedCallback:&v10];

    id v7 = [(CEKDiscreteSlider *)self _contentScrollView];
    [v7 contentOffset];
    double v9 = v8;

    [v4 setValue:v9];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __58__CEKDiscreteSlider__createExternalScrollAnimatorIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleExternalScrollAnimated];
}

- (void)_handleExternalScrollAnimated
{
  id v4 = [(CEKDiscreteSlider *)self _externalScrollOffsetAnimator];
  if (v4)
  {
    id v3 = [(CEKDiscreteSlider *)self _contentScrollView];
    [v3 contentOffset];
    [v4 presentationValue];
    objc_msgSend(v3, "setContentOffset:");
  }
}

- (void)tickMarksViewDidChangeWidthForTickMarkCount:(id)a3
{
  [(CEKDiscreteSlider *)self _setNeedsUpdateContentOffset:1];
  [(CEKDiscreteSlider *)self setNeedsLayout];
}

- (void)setTextOrientation:(int64_t)a3
{
}

- (void)setTextOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_textOrientation != a3)
  {
    if (a4)
    {
      [(CEKDiscreteSlider *)self layoutIfNeeded];
      self->_textOrientation = a3;
      [(CEKDiscreteSlider *)self setNeedsLayout];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __49__CEKDiscreteSlider_setTextOrientation_animated___block_invoke;
      v6[3] = &unk_1E63CD380;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v6 options:0 animations:0.25 completion:0.0];
    }
    else
    {
      self->_textOrientation = a3;
      [(CEKDiscreteSlider *)self setNeedsLayout];
    }
  }
}

uint64_t __49__CEKDiscreteSlider_setTextOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (double)labelVerticalPadding
{
  return self->_labelVerticalPadding;
}

- (BOOL)interactiveWhenHidden
{
  return self->_interactiveWhenHidden;
}

- (void)setInteractiveWhenHidden:(BOOL)a3
{
  self->_interactiveWhenHidden = a3;
}

- (int64_t)sliderVerticalAlignment
{
  return self->_sliderVerticalAlignment;
}

- (double)sliderVerticalOffset
{
  return self->_sliderVerticalOffset;
}

- (double)levelIndicatorHeight
{
  return self->_levelIndicatorHeight;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets
{
  double startInset = self->_gradientInsets.startInset;
  double endInset = self->_gradientInsets.endInset;
  result.double var1 = endInset;
  result.double var0 = startInset;
  return result;
}

- (int64_t)textOrientation
{
  return self->_textOrientation;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (unint64_t)fontStyle
{
  return self->_fontStyle;
}

- (int64_t)feedbackScope
{
  return self->_feedbackScope;
}

- (void)setFeedbackScope:(int64_t)a3
{
  self->_feedbackScope = a3;
}

- (CEKDiscreteSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEKDiscreteSliderDelegate *)WeakRetained;
}

- (BOOL)useTextLegibilityBackgrounds
{
  return self->_useTextLegibilityBackgrounds;
}

- (BOOL)useTextLegibilityShadows
{
  return self->_useTextLegibilityShadows;
}

- (unint64_t)ticksStyle
{
  return self->_ticksStyle;
}

- (UIScrollView)_contentScrollView
{
  return self->__contentScrollView;
}

- (UIView)_levelIndicatorView
{
  return self->__levelIndicatorView;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void)set_titleLabel:(id)a3
{
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (void)set_valueLabel:(id)a3
{
}

- (CEKEdgeGradientView)_edgeGradientView
{
  return self->__edgeGradientView;
}

- (void)set_edgeGradientView:(id)a3
{
}

- (UIImageView)_valueBackground
{
  return self->__valueBackground;
}

- (void)set_valueBackground:(id)a3
{
}

- (UIImageView)_titleBackground
{
  return self->__titleBackground;
}

- (void)set_titleBackground:(id)a3
{
}

- (UIView)_indicatorBackground
{
  return self->__indicatorBackground;
}

- (void)set_indicatorBackground:(id)a3
{
}

- (CEKTickMarksContainer)_tickMarksView
{
  return self->__tickMarksView;
}

- (CEKDynamicTickMarksView)_dynamicTickMarksView
{
  return self->__dynamicTickMarksView;
}

- (CEKSliderDotView)_dotView
{
  return self->__dotView;
}

- (void)set_dotView:(id)a3
{
}

- (CEKSelectionFeedbackGenerator)_feedbackGenerator
{
  return self->__feedbackGenerator;
}

- (CEKAnimationGenerator)_animationGenerator
{
  return self->__animationGenerator;
}

- (void)_setAnimationGenerator:(id)a3
{
}

- (BOOL)_needsUpdateContentOffset
{
  return self->__needsUpdateContentOffset;
}

- (void)_setNeedsUpdateContentOffset:(BOOL)a3
{
  self->__needsUpdateContentOffset = a3;
}

- (BOOL)_isOverscrolling
{
  return self->__overscrolling;
}

- (BOOL)_isExternalScrollingAllowed
{
  return self->__externalScrollingAllowed;
}

- (void)_setExternalScrollingAllowed:(BOOL)a3
{
  self->__externalScrollingAllowed = a3;
}

- (BOOL)_isExternallyScrolling
{
  return self->__externallyScrolling;
}

- (void)_setExternallyScrolling:(BOOL)a3
{
  self->__externallyScrolling = a3;
}

- (double)_externalOverScroll
{
  return self->__externalOverScroll;
}

- (void)_setExternalOverScroll:(double)a3
{
  self->__externalOverScroll = a3;
}

- (UIViewFloatAnimatableProperty)_externalScrollOffsetAnimator
{
  return self->__externalScrollOffsetAnimator;
}

- (void)_setExternalScrollOffsetAnimator:(id)a3
{
}

- (unint64_t)indexCount
{
  return self->_indexCount;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (BOOL)biasScrollingToCurrentSelection
{
  return self->_biasScrollingToCurrentSelection;
}

- (void)setBiasScrollingToCurrentSelection:(BOOL)a3
{
  self->_biasScrollingToCurrentSelection = a3;
}

- (unint64_t)markedIndex
{
  return self->_markedIndex;
}

- (unint64_t)tickMarkCountBetweenIndexes
{
  return self->_tickMarkCountBetweenIndexes;
}

- (double)tickMarksHeight
{
  return self->_tickMarksHeight;
}

- (unint64_t)colorHighlight
{
  return self->_colorHighlight;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSArray)magneticIndexes
{
  return self->_magneticIndexes;
}

- (NSArray)protectedIndexes
{
  return self->_protectedIndexes;
}

- (void)setProtectedIndexes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedIndexes, 0);
  objc_storeStrong((id *)&self->_magneticIndexes, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->__externalScrollOffsetAnimator, 0);
  objc_storeStrong((id *)&self->__animationGenerator, 0);
  objc_storeStrong((id *)&self->__feedbackGenerator, 0);
  objc_storeStrong((id *)&self->__dotView, 0);
  objc_storeStrong((id *)&self->__dynamicTickMarksView, 0);
  objc_storeStrong((id *)&self->__tickMarksView, 0);
  objc_storeStrong((id *)&self->__indicatorBackground, 0);
  objc_storeStrong((id *)&self->__titleBackground, 0);
  objc_storeStrong((id *)&self->__valueBackground, 0);
  objc_storeStrong((id *)&self->__edgeGradientView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__levelIndicatorView, 0);
  objc_storeStrong((id *)&self->__contentScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__externalScrollSettings, 0);
  objc_storeStrong((id *)&self->__sliderDriver, 0);
}

- (void)contactEndedWithAction:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1BEE2D000, log, OS_LOG_TYPE_DEBUG, "ScrollDiagnostic: Not decelerating to magnetic value (velocity %.3f)", (uint8_t *)&v2, 0xCu);
}

@end