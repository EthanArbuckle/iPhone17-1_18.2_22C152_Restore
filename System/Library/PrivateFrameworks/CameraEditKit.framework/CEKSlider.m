@interface CEKSlider
+ (id)_integerFormatter;
- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets;
- (BOOL)_isActive;
- (BOOL)_isAnimating;
- (BOOL)_isDimmed;
- (BOOL)_isExternalScrollingAllowed;
- (BOOL)_isExternallyScrolling;
- (BOOL)_isOverscrolling;
- (BOOL)_isScrollExternallyAnimating;
- (BOOL)_isreAdjustingOffsets;
- (BOOL)_markedValueWithinRange;
- (BOOL)_snapped;
- (BOOL)interactiveWhenHidden;
- (BOOL)logarithmic;
- (BOOL)useTickMarkLegibilityShadows;
- (CEKDiscreteFloatRange)magneticRange;
- (CEKDynamicTickMarksView)_dynamicTickMarksView;
- (CEKEdgeGradientView)_edgeGradientView;
- (CEKFluidBehaviorSettings)_externalScrollSettings;
- (CEKSelectionFeedbackGenerator)_feedbackGenerator;
- (CEKSlider)initWithFrame:(CGRect)a3;
- (CEKSlider)initWithTickMarkStyle:(unint64_t)a3;
- (CEKSlider)initWithTitle:(id)a3;
- (CEKSlider)initWithTitle:(id)a3 tickMarkStyle:(unint64_t)a4;
- (CEKSliderDelegate)delegate;
- (CEKSliderDotView)_dotView;
- (CEKSliderPositionDriver)_sliderDriver;
- (CEKTickMarksConfiguration)tickMarksConfiguration;
- (CEKTickMarksContainer)_tickMarksView;
- (CGRect)frameForLevelIndicator;
- (CGRect)frameForTicksView;
- (CGRect)frameForTitleLabel;
- (CGRect)frameForValueLabel;
- (CGSize)tickMarkSize;
- (NSString)title;
- (UILabel)_titleLabel;
- (UILabel)_valueLabel;
- (UIScrollView)_contentScrollView;
- (UIView)_levelIndicatorBackgroundView;
- (UIView)_levelIndicatorView;
- (UIViewFloatAnimatableProperty)_externalScrollOffsetAnimator;
- (double)_externalOverScroll;
- (double)_snappedOffset;
- (double)_unsnappingProgress;
- (double)_valueForScrollViewXOffset:(double)a3;
- (double)_xOffsetForMarkedValue;
- (double)animationDuration;
- (double)defaultValue;
- (double)labelVerticalPadding;
- (double)levelIndicatorHeight;
- (double)markedValue;
- (double)maximumValue;
- (double)minimumValue;
- (double)sliderVerticalOffset;
- (double)value;
- (double)xOffsetForValue:(double)a3;
- (id)formattedIntegerStringFromNumber:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)feedbackScope;
- (int64_t)selectionFeedbackProfile;
- (int64_t)sliderVerticalAlignment;
- (int64_t)textOrientation;
- (int64_t)tickMarkCount;
- (int64_t)titleAlignment;
- (int64_t)valueLabelVisibility;
- (unint64_t)_tickMarkIndex;
- (unint64_t)_ticksStyle;
- (unint64_t)fontStyle;
- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4;
- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4 completion:(id)a5;
- (void)_clampValuesAndUpdateScrollPosition:(BOOL)a3;
- (void)_createExternalScrollAnimatorIfNeeded;
- (void)_createGradientIfNeeded;
- (void)_handleExternalScrollAnimated;
- (void)_resetSnapped;
- (void)_setActive:(BOOL)a3;
- (void)_setActive:(BOOL)a3 animated:(BOOL)a4;
- (void)_setAnimating:(BOOL)a3;
- (void)_setDimmed:(BOOL)a3;
- (void)_setDimmed:(BOOL)a3 animated:(BOOL)a4;
- (void)_setEdgeGradientView:(id)a3;
- (void)_setExternalOverScroll:(double)a3;
- (void)_setExternalScrollOffsetAnimator:(id)a3;
- (void)_setExternalScrollingAllowed:(BOOL)a3;
- (void)_setExternallyScrolling:(BOOL)a3;
- (void)_setOverscrolling:(BOOL)a3;
- (void)_setShowValueLabel:(BOOL)a3 animated:(BOOL)a4;
- (void)_setSnapped:(BOOL)a3;
- (void)_setSnappedOffset:(double)a3;
- (void)_setTickMarkIndex:(unint64_t)a3;
- (void)_setUnsnappingProgress:(double)a3;
- (void)_setValue:(double)a3 shouldSendActions:(BOOL)a4 shouldUpdateScrollPosition:(BOOL)a5;
- (void)_sliderDidEndScrolling;
- (void)_updateColorsAnimated:(BOOL)a3;
- (void)_updateEnableAppearanceStateAnimated:(BOOL)a3;
- (void)_updateFonts;
- (void)_updateLegibilityBackground;
- (void)_updateMagneticTickIndexes;
- (void)_updateMarkedViewAnimated:(BOOL)a3;
- (void)_updateScrollViewPosition;
- (void)_updateValueLabel;
- (void)contactBeganWithAction:(id)a3;
- (void)contactEndedWithAction:(id)a3;
- (void)contactUpdatedWithAction:(id)a3;
- (void)layoutSubviews;
- (void)performWaveAnimation;
- (void)removeGradients;
- (void)resetToDefault;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAnimationDuration:(double)a3;
- (void)setDefaultValue:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnabled:(BOOL)a3 dimmed:(BOOL)a4 animated:(BOOL)a5;
- (void)setFeedbackScope:(int64_t)a3;
- (void)setFontStyle:(unint64_t)a3;
- (void)setGradientInsets:(id)a3;
- (void)setInteractiveWhenHidden:(BOOL)a3;
- (void)setLabelVerticalPadding:(double)a3;
- (void)setLevelIndicatorHeight:(double)a3;
- (void)setLogarithmic:(BOOL)a3;
- (void)setMagneticRange:(id)a3;
- (void)setMarkedValue:(double)a3;
- (void)setMarkedValue:(double)a3 animated:(BOOL)a4;
- (void)setMaximumValue:(double)a3;
- (void)setMinimumValue:(double)a3;
- (void)setOpaqueGradientsWithColor:(id)a3;
- (void)setSelectionFeedbackProfile:(int64_t)a3;
- (void)setSliderVerticalAlignment:(int64_t)a3;
- (void)setSliderVerticalOffset:(double)a3;
- (void)setTextOrientation:(int64_t)a3;
- (void)setTextOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setTickMarkCount:(int64_t)a3;
- (void)setTickMarkSize:(CGSize)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAlignment:(int64_t)a3;
- (void)setTransparentGradients;
- (void)setUseTickMarkLegibilityShadows:(BOOL)a3;
- (void)setValue:(double)a3;
- (void)setValueLabelVisibility:(int64_t)a3;
- (void)set_levelIndicatorBackgroundView:(id)a3;
- (void)set_reAdjustingOffsets:(BOOL)a3;
- (void)set_titleLabel:(id)a3;
- (void)set_valueLabel:(id)a3;
- (void)tintColorDidChange;
@end

@implementation CEKSlider

- (CEKSlider)initWithTitle:(id)a3
{
  return [(CEKSlider *)self initWithTitle:a3 tickMarkStyle:0];
}

- (CEKSlider)initWithTickMarkStyle:(unint64_t)a3
{
  return [(CEKSlider *)self initWithTitle:&stru_1F1A048B0 tickMarkStyle:a3];
}

- (CEKSlider)initWithTitle:(id)a3 tickMarkStyle:(unint64_t)a4
{
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CEKSlider;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = -[CEKSlider initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    v11->_textOrientation = 0;
    v11->_fontStyle = 0;
    v11->_animationDuration = 0.25;
    v13 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(CEKSlider *)v12 setTintColor:v13];

    v14 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    contentScrollView = v12->__contentScrollView;
    v12->__contentScrollView = v14;

    [(UIScrollView *)v12->__contentScrollView setDelegate:v12];
    [(UIScrollView *)v12->__contentScrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v12->__contentScrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v12->__contentScrollView setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    [(UIScrollView *)v12->__contentScrollView _setSupportsPointerDragScrolling:1];
    v16 = [(UIScrollView *)v12->__contentScrollView panGestureRecognizer];
    [v16 _wantsGESEvents:1];

    [(CEKSlider *)v12 addSubview:v12->__contentScrollView];
    v12->__ticksStyle = a4;
    if (a4)
    {
      if (a4 == 1)
      {
        v17 = objc_alloc_init(CEKDynamicTickMarksView);
        dynamicTickMarksView = v12->__dynamicTickMarksView;
        v12->__dynamicTickMarksView = v17;

        objc_storeStrong((id *)&v12->__tickMarksView, v12->__dynamicTickMarksView);
      }
    }
    else
    {
      v19 = objc_alloc_init(CEKSliderTickMarksView);
      tickMarksView = v12->__tickMarksView;
      v12->__tickMarksView = (CEKTickMarksContainer *)v19;
    }
    [(CEKTickMarksContainer *)v12->__tickMarksView setDelegate:v12];
    v21 = [(CEKTickMarksContainer *)v12->__tickMarksView tickMarksModel];
    [v21 setTickMarkSpacing:9.0];

    v22 = [(CEKTickMarksContainer *)v12->__tickMarksView tickMarksModel];
    [v22 setTickMarkWidth:1.0];

    v23 = [(CEKTickMarksContainer *)v12->__tickMarksView tickMarksModel];
    [v23 setMainTickMarkInterval:10];

    [(UIScrollView *)v12->__contentScrollView addSubview:v12->__tickMarksView];
    v12->_tickMarkSize = (CGSize)xmmword_1BEE74AB0;
    v24 = [(CEKTickMarksContainer *)v12->__tickMarksView tickMarksModel];
    [v24 setTickMarksCount:41];

    v12->_sliderVerticalAlignment = 0;
    v12->_labelVerticalPadding = 10.0;
    v12->_valueLabelVisibility = 0;
    v12->_levelIndicatorHeight = 26.0;
    if (!v12->__dynamicTickMarksView)
    {
      v25 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      levelIndicatorView = v12->__levelIndicatorView;
      v12->__levelIndicatorView = v25;

      v27 = [MEMORY[0x1E4FB1618] labelColor];
      [(UIView *)v12->__levelIndicatorView setBackgroundColor:v27];

      v28 = [(UIView *)v12->__levelIndicatorView layer];
      objc_msgSend(v28, "setAnchorPoint:", 0.5, 0.0);

      [(CEKSlider *)v12 addSubview:v12->__levelIndicatorView];
    }
    v12->_minimumValue = -1.0;
    v12->_maximumValue = 1.0;
    v12->_markedValue = 1.79769313e308;
    if ([v6 length])
    {
      v29 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
      v30 = [MEMORY[0x1E4FB1618] clearColor];
      [(UILabel *)v29 setBackgroundColor:v30];

      [(UILabel *)v29 setTextAlignment:4];
      [(UILabel *)v29 setLineBreakMode:0];
      [(UILabel *)v29 setNumberOfLines:0];
      [(UILabel *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
      v31 = [MEMORY[0x1E4FB1618] labelColor];
      v32 = [v31 colorWithAlphaComponent:0.6];
      [(UILabel *)v29 setTextColor:v32];

      [(UILabel *)v29 setText:v6];
      titleLabel = v12->__titleLabel;
      v12->__titleLabel = v29;
      v34 = v29;

      [(CEKSlider *)v12 addSubview:v12->__titleLabel];
      [(CEKSlider *)v12 _updateFonts];
    }
    if (CEKHapticsAllowed())
    {
      v35 = objc_alloc_init(CEKSelectionFeedbackGenerator);
      feedbackGenerator = v12->__feedbackGenerator;
      v12->__feedbackGenerator = v35;
    }
    v12->_feedbackScope = 2;
  }

  return v12;
}

- (CEKSlider)initWithFrame:(CGRect)a3
{
  return -[CEKSlider initWithTitle:](self, "initWithTitle:", &stru_1F1A048B0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)_integerFormatter
{
  if (_integerFormatter_onceToken != -1) {
    dispatch_once(&_integerFormatter_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_integerFormatter_integerFormatter;
  return v2;
}

void __30__CEKSlider__integerFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_integerFormatter_integerFormatter;
  _integerFormatter_integerFormatter = (uint64_t)v0;

  [(id)_integerFormatter_integerFormatter setPositiveFormat:@"0"];
  [(id)_integerFormatter_integerFormatter setNegativeFormat:@"0"];
  [(id)_integerFormatter_integerFormatter setPositivePrefix:0];
  id v2 = [(id)_integerFormatter_integerFormatter minusSign];
  [(id)_integerFormatter_integerFormatter setNegativePrefix:v2];
}

- (id)formattedIntegerStringFromNumber:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(id)objc_opt_class() _integerFormatter];
  id v6 = [v5 stringFromNumber:v4];

  double v7 = [(id)objc_opt_class() _integerFormatter];
  double v8 = [v7 stringFromNumber:&unk_1F1A0FFE0];

  if ([v6 isEqualToString:v8])
  {
    double v9 = [(id)objc_opt_class() _integerFormatter];
    uint64_t v10 = [v9 stringFromNumber:&unk_1F1A0F7F8];

    id v6 = (void *)v10;
  }
  v11 = CEKFrameworkBundle();
  v12 = [v11 preferredLocalizations];
  v13 = [v12 firstObject];

  v14 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v13];
  v15 = [(CEKSlider *)self _valueLabel];
  v16 = [v15 font];
  [v16 pointSize];
  double v18 = v17;

  if (CEKIsCustomKerningSupportedForLocale(v14))
  {
    uint64_t v23 = *MEMORY[0x1E4FB12C0];
    v19 = [MEMORY[0x1E4F28ED0] numberWithDouble:v18 * 100.0 / 1000.0];
    v24[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  }
  else
  {
    v20 = 0;
  }
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v20];

  return v21;
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
    p_delegateFlags->respondsToDidScroll = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillEndScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidEndScrolling = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillUpdateValue = objc_opt_respondsToSelector() & 1;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v18.receiver = self;
  v18.super_class = (Class)CEKSlider;
  double v7 = -[CEKSlider hitTest:withEvent:](&v18, sel_hitTest_withEvent_, a4);
  [(CEKSlider *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  if ([(CEKSlider *)self interactiveWhenHidden])
  {
    v21.origin.CGFloat x = v9;
    v21.origin.CGFloat y = v11;
    v21.size.width = v13;
    v21.size.height = v15;
    v20.CGFloat x = x;
    v20.CGFloat y = y;
    if (CGRectContainsPoint(v21, v20))
    {
      uint64_t v16 = [(CEKSlider *)self _contentScrollView];

      double v7 = (void *)v16;
    }
  }
  return v7;
}

- (void)layoutSubviews
{
  v105.receiver = self;
  v105.super_class = (Class)CEKSlider;
  [(CEKSlider *)&v105 layoutSubviews];
  [(CEKSlider *)self tickMarkSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CEKSlider *)self _tickMarksView];
  double v8 = [v7 tickMarksModel];
  [v8 setTickMarkWidth:v4];

  CGFloat v9 = [(CEKSlider *)self _tickMarksView];
  double v10 = [v9 tickMarksModel];
  [v10 requiredWidth];
  double v12 = v11;

  [(CEKSlider *)self bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  int64_t v21 = [(CEKSlider *)self sliderVerticalAlignment];
  double v100 = v20;
  if (v21 == 2)
  {
    [(CEKSlider *)self levelIndicatorHeight];
    double v29 = v28 + 33.0 - v6;
    [(CEKSlider *)self sliderVerticalOffset];
    double v22 = v30 + v29;
LABEL_7:
    double v24 = 0.0;
    goto LABEL_8;
  }
  if (v21 == 1)
  {
    v106.origin.double x = v14;
    v106.origin.double y = v16;
    v106.size.double width = v18;
    v106.size.double height = v20;
    CGFloat v31 = CGRectGetMaxY(v106) - v6;
    [(CEKSlider *)self sliderVerticalOffset];
    double v22 = v31 - v32;
    goto LABEL_7;
  }
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  if (!v21)
  {
    uint64_t v94 = 0;
    UIRectCenteredYInRectScale();
    double v24 = v23;
    double v22 = v25;
    double v12 = v26;
    double v6 = v27;
LABEL_8:
    CGFloat v33 = v14;
    CGFloat v34 = v16;
    goto LABEL_10;
  }
  CGFloat v33 = v14;
  CGFloat v34 = v16;
  double v24 = *MEMORY[0x1E4F1DB28];
LABEL_10:
  CGFloat recta = v22;
  double v101 = v18;
  double v102 = v33;
  v35 = [(CEKSlider *)self _dynamicTickMarksView];
  [(CEKSlider *)self bounds];
  -[CEKSlider convertRect:toView:](self, "convertRect:toView:", v35);
  objc_msgSend(v35, "setVisibleBounds:");
  double v95 = CEKPixelWidthForView(self);
  v36 = [(CEKSlider *)self _tickMarksView];
  objc_msgSend(v36, "frameForAlignmentRect:", v24, v22, v12, v6);
  double v38 = v37;
  CGFloat v39 = v6;
  double v41 = v40;
  CGFloat v42 = v24;
  double v44 = v43;
  double v46 = v45;

  v47 = [(CEKSlider *)self _tickMarksView];
  objc_msgSend(v47, "setFrame:", v38, v41, v44, v46);

  [(CEKSlider *)self levelIndicatorHeight];
  double v99 = v34;
  UIRectCenteredXInRectScale();
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  v107.origin.double x = v42;
  v107.origin.double y = recta;
  double v96 = v12;
  double rect = v39;
  v107.size.double width = v12;
  v107.size.double height = v39;
  double MaxY = CGRectGetMaxY(v107);
  [(CEKSlider *)self levelIndicatorHeight];
  double v56 = MaxY - v55;
  if (![(CEKSlider *)self _isAnimating])
  {
    v57 = [(CEKSlider *)self _levelIndicatorView];
    objc_msgSend(v57, "setFrame:", v49, v56, v51, v53);
  }
  v108.origin.double x = v49;
  v108.origin.double y = v56;
  v108.size.double width = v51;
  v108.size.double height = v53;
  CGRect v109 = CGRectInset(v108, -v95, -v95);
  double x = v109.origin.x;
  double y = v109.origin.y;
  double width = v109.size.width;
  double height = v109.size.height;
  v62 = [(CEKSlider *)self _levelIndicatorBackgroundView];
  objc_msgSend(v62, "setFrame:", x, y, width, height);

  v63 = [(CEKSlider *)self _contentScrollView];
  objc_msgSend(v63, "setFrame:", v102, v99, v101, v100);

  v110.origin.double x = v49;
  v110.origin.double y = v56;
  v110.size.double width = v51;
  v110.size.double height = v53;
  double MinX = CGRectGetMinX(v110);
  v111.origin.double x = v102;
  v111.origin.double y = v99;
  v111.size.double width = v101;
  v111.size.double height = v100;
  double v65 = MinX - CGRectGetMinX(v111);
  v112.origin.double x = v102;
  v112.origin.double y = v99;
  v112.size.double width = v101;
  v112.size.double height = v100;
  double MaxX = CGRectGetMaxX(v112);
  v113.origin.double x = v49;
  v113.origin.double y = v56;
  v113.size.double width = v51;
  v113.size.double height = v53;
  double v67 = MaxX - CGRectGetMaxX(v113);
  v68 = [(CEKSlider *)self _contentScrollView];
  objc_msgSend(v68, "setContentInset:", 0.0, v65, 0.0, v67);

  v69 = [(CEKSlider *)self _contentScrollView];
  objc_msgSend(v69, "setContentSize:", v96, rect);

  if ([(CEKSlider *)self _markedValueWithinRange])
  {
    [(CEKSlider *)self _xOffsetForMarkedValue];
    double v71 = v70 + -4.0;
    v72 = [(CEKSlider *)self _dotView];
    objc_msgSend(v72, "setFrame:", v71, v56, 8.0, 8.0);
  }
  v73 = [(CEKSlider *)self _titleLabel];
  v74 = [(CEKSlider *)self _valueLabel];
  long long v75 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v104.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v104.c = v75;
  *(_OWORD *)&v104.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  int64_t v76 = [(CEKSlider *)self textOrientation];
  if (v76 == 1)
  {
    CGFloat v78 = -1.57079633;
  }
  else
  {
    double v77 = 18.0;
    if (v76 != 2) {
      goto LABEL_19;
    }
    CGFloat v78 = 1.57079633;
  }
  CGAffineTransformMakeRotation(&v104, v78);
  double v77 = 28.0;
LABEL_19:
  CGAffineTransform v103 = v104;
  [v74 setTransform:&v103];
  CGAffineTransform v103 = v104;
  [v73 setTransform:&v103];
  [(CEKSlider *)self labelVerticalPadding];
  double v80 = v79;
  objc_msgSend(v73, "setFrame:", 10.0, v79, v101 + -20.0, 18.0);
  objc_msgSend(v74, "setFrame:", 0.0, v80, v101, v77);
  v81 = [(CEKSlider *)self _edgeGradientView];
  v82 = v81;
  if (v81)
  {
    double v84 = *MEMORY[0x1E4FB2848];
    double v83 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v86 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v85 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    uint64_t v87 = [v81 edgeGradientStyle];
    if (v87 != 2)
    {
      if (v87 == 1)
      {
        v114.origin.double x = v49;
        v114.origin.double y = v56;
        v114.size.double width = v51;
        v114.size.double height = v53;
        CGFloat v90 = CGRectGetMaxY(v114);
        double v89 = v100;
        double v86 = v100 - v90;
        double v83 = 0.0;
        double v84 = v56;
        double v85 = 0.0;
        double v88 = v99;
        goto LABEL_26;
      }
      if (v87)
      {
        double v88 = v99;
        double v89 = v100;
        goto LABEL_26;
      }
    }
    double v88 = v56;
    double v89 = v53;
LABEL_26:
    objc_msgSend(v82, "setFrame:", v102, v88, v101, v89);
    objc_msgSend(v82, "setContentInsets:", v84, v83, v86, v85);
    [(CEKSlider *)self gradientInsets];
    double v92 = v91;
    [(CEKSlider *)self gradientInsets];
    objc_msgSend(v82, "setGradientDimensions:", v92, v101 * 0.1, v101 * 0.1, v93);
  }
  [(CEKSlider *)self _updateScrollViewPosition];
  [(CEKSlider *)self _updateMagneticTickIndexes];
}

- (void)resetToDefault
{
  [(CEKSlider *)self defaultValue];
  -[CEKSlider setValue:](self, "setValue:");
}

- (void)setValue:(double)a3
{
}

- (void)_clampValuesAndUpdateScrollPosition:(BOOL)a3
{
  BOOL v3 = a3;
  [(CEKSlider *)self minimumValue];
  double v6 = v5;
  [(CEKSlider *)self defaultValue];
  double v8 = v7;
  [(CEKSlider *)self maximumValue];
  if (v8 < v9) {
    double v9 = v8;
  }
  if (v6 >= v9) {
    double v9 = v6;
  }
  self->_defaultValue = v9;
  [(CEKSlider *)self minimumValue];
  double v11 = v10;
  [(CEKSlider *)self value];
  double v13 = v12;
  [(CEKSlider *)self maximumValue];
  if (v13 < v14) {
    double v14 = v13;
  }
  if (v11 >= v14) {
    double v14 = v11;
  }
  self->_value = v14;
  if (v3)
  {
    [(CEKSlider *)self _updateScrollViewPosition];
  }
}

- (void)setDefaultValue:(double)a3
{
  if (self->_defaultValue != a3)
  {
    self->_defaultValue = a3;
    [(CEKSlider *)self _clampValuesAndUpdateScrollPosition:1];
  }
}

- (void)setMinimumValue:(double)a3
{
  if (self->_minimumValue != a3)
  {
    self->_minimumValue = a3;
    [(CEKSlider *)self _clampValuesAndUpdateScrollPosition:1];
    [(CEKSlider *)self _updateMagneticTickIndexes];
  }
}

- (void)setMaximumValue:(double)a3
{
  if (self->_maximumValue != a3)
  {
    self->_maximumValue = a3;
    [(CEKSlider *)self _clampValuesAndUpdateScrollPosition:1];
    [(CEKSlider *)self _updateMagneticTickIndexes];
  }
}

- (NSString)title
{
  id v2 = [(CEKSlider *)self _titleLabel];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v8 = a3;
  double v4 = [(CEKSlider *)self _titleLabel];
  double v5 = [v4 text];
  char v6 = [v8 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    double v7 = [(CEKSlider *)self _titleLabel];
    [v7 setText:v8];

    [(CEKSlider *)self setNeedsLayout];
  }
}

- (void)setMarkedValue:(double)a3
{
}

- (void)setMarkedValue:(double)a3 animated:(BOOL)a4
{
  if (self->_markedValue != a3)
  {
    self->_markedValue = a3;
    [(CEKSlider *)self _updateMarkedViewAnimated:a4];
    [(CEKSlider *)self setNeedsLayout];
  }
}

- (BOOL)_markedValueWithinRange
{
  [(CEKSlider *)self minimumValue];
  double v4 = v3;
  [(CEKSlider *)self markedValue];
  if (v4 > v5) {
    return 0;
  }
  [(CEKSlider *)self markedValue];
  double v8 = v7;
  [(CEKSlider *)self maximumValue];
  return v8 <= v9;
}

- (void)_updateMarkedViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CEKSlider *)self _dotView];
  BOOL v6 = [(CEKSlider *)self _markedValueWithinRange];
  if (!v6 && !v5) {
    return;
  }
  [(CEKSlider *)self markedValue];
  double v8 = v7;
  [(CEKSlider *)self value];
  double v10 = 0.0;
  if (v6)
  {
    double v11 = v8 - v9;
    double v12 = v11 >= 0.0 ? v11 : -v11;
    if ([(CEKSlider *)self _isActive] || v12 > 0.01)
    {
      BOOL v13 = [(CEKSlider *)self _isDimmed];
      if (v13 || v5)
      {
        if (v13) {
          goto LABEL_14;
        }
      }
      else
      {
        double v5 = objc_alloc_init(CEKSliderDotView);
        double v14 = [(CEKSlider *)self tickMarksConfiguration];
        -[CEKSliderDotView setUseLegibilityShadow:](v5, "setUseLegibilityShadow:", [v14 useTickMarkLegibilityShadows]);

        [(CEKSliderDotView *)v5 setAlpha:0.0];
        objc_storeStrong((id *)&self->__dotView, v5);
        double v15 = [(CEKSlider *)self _contentScrollView];
        CGFloat v16 = [(CEKSlider *)self _tickMarksView];
        [v15 insertSubview:v5 aboveSubview:v16];

        [(CEKSlider *)self setNeedsLayout];
      }
      double v10 = 1.0;
    }
  }
LABEL_14:
  if (!v3 || ([(CEKSliderDotView *)v5 alpha], v17 == v10))
  {
    [(CEKSliderDotView *)v5 setAlpha:v10];
  }
  else
  {
    CGFloat v18 = (void *)MEMORY[0x1E4FB1EB0];
    [(CEKSlider *)self animationDuration];
    double v20 = v19;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __39__CEKSlider__updateMarkedViewAnimated___block_invoke;
    v22[3] = &unk_1E63CD5A0;
    double v23 = v5;
    double v24 = v10;
    int64_t v21 = v5;
    [v18 animateWithDuration:v22 animations:0 completion:v20];
  }
}

uint64_t __39__CEKSlider__updateMarkedViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (CEKTickMarksConfiguration)tickMarksConfiguration
{
  id v2 = [(CEKSlider *)self _tickMarksView];
  BOOL v3 = [v2 tickMarksModel];

  return (CEKTickMarksConfiguration *)v3;
}

- (void)_updateLegibilityBackground
{
  double v3 = 0.0;
  if ([(CEKSlider *)self useTickMarkLegibilityShadows])
  {
    double v3 = 1.0;
    if (!self->__levelIndicatorBackgroundView)
    {
      double v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      levelIndicatorBackgroundView = self->__levelIndicatorBackgroundView;
      self->__levelIndicatorBackgroundView = v4;

      BOOL v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.15];
      [(UIView *)self->__levelIndicatorBackgroundView setBackgroundColor:v6];

      double v7 = self->__levelIndicatorBackgroundView;
      double v8 = [(CEKSlider *)self _levelIndicatorView];
      [(CEKSlider *)self insertSubview:v7 belowSubview:v8];
    }
  }
  id v9 = [(CEKSlider *)self _levelIndicatorView];
  [v9 setAlpha:v3];
}

- (void)setUseTickMarkLegibilityShadows:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CEKSlider *)self _dotView];
  [v5 setUseLegibilityShadow:v3];

  BOOL v6 = [(CEKSlider *)self tickMarksConfiguration];
  [v6 setUseTickMarkLegibilityShadows:v3];

  [(CEKSlider *)self _updateLegibilityBackground];
}

- (BOOL)useTickMarkLegibilityShadows
{
  id v2 = [(CEKSlider *)self tickMarksConfiguration];
  char v3 = [v2 useTickMarkLegibilityShadows];

  return v3;
}

- (void)setTickMarkCount:(int64_t)a3
{
  id v5 = [(CEKSlider *)self _tickMarksView];
  double v4 = [v5 tickMarksModel];
  [v4 setTickMarksCount:a3];
}

- (int64_t)tickMarkCount
{
  id v2 = [(CEKSlider *)self _tickMarksView];
  char v3 = [v2 tickMarksModel];
  int64_t v4 = [v3 tickMarksCount];

  return v4;
}

- (void)setLogarithmic:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CEKSlider *)self _tickMarksView];
  int64_t v4 = [v5 tickMarksModel];
  [v4 setLogarithmic:v3];
}

- (BOOL)logarithmic
{
  id v2 = [(CEKSlider *)self _tickMarksView];
  BOOL v3 = [v2 tickMarksModel];
  char v4 = [v3 logarithmic];

  return v4;
}

- (void)setTickMarkSize:(CGSize)a3
{
  if (self->_tickMarkSize.width != a3.width || self->_tickMarkSize.height != a3.height)
  {
    self->_tickMarkSize = a3;
    [(CEKSlider *)self setNeedsLayout];
  }
}

- (void)_createGradientIfNeeded
{
  BOOL v3 = [(CEKSlider *)self _edgeGradientView];

  if (!v3)
  {
    char v4 = objc_alloc_init(CEKEdgeGradientView);
    [(CEKSlider *)self _setEdgeGradientView:v4];
  }
}

- (void)setTransparentGradients
{
  [(CEKSlider *)self _createGradientIfNeeded];
  id v6 = [(CEKSlider *)self _edgeGradientView];
  [v6 setEdgeGradientStyleBlack];
  BOOL v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
  char v4 = [v6 layer];
  [v4 setCompositingFilter:v3];

  id v5 = [(CEKSlider *)self _contentScrollView];
  [(CEKSlider *)self insertSubview:v6 aboveSubview:v5];
}

- (void)setOpaqueGradientsWithColor:(id)a3
{
  id v4 = a3;
  [(CEKSlider *)self _createGradientIfNeeded];
  id v7 = [(CEKSlider *)self _edgeGradientView];
  [v7 setCustomEdgeGradientStyleWithColor:v4];

  id v5 = [v7 layer];
  [v5 setCompositingFilter:0];

  id v6 = [(CEKSlider *)self _contentScrollView];
  [(CEKSlider *)self insertSubview:v7 aboveSubview:v6];
}

- (void)removeGradients
{
  BOOL v3 = [(CEKSlider *)self _edgeGradientView];
  [v3 removeFromSuperview];

  [(CEKSlider *)self _setEdgeGradientView:0];
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
    [(CEKSlider *)self setNeedsLayout];
  }
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setEnabled:(BOOL)a3 dimmed:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if ([(CEKSlider *)self isEnabled] != a3 || [(CEKSlider *)self _isDimmed] != v6)
  {
    [(CEKSlider *)self setEnabled:v7];
    [(CEKSlider *)self _setDimmed:v6 animated:v5];
    [(CEKSlider *)self contactEndedWithAction:0];
    id v9 = [(CEKSlider *)self _dynamicTickMarksView];
    [v9 setEnabled:v7];
  }
}

- (void)_setDimmed:(BOOL)a3
{
}

- (void)_setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__dimmed != a3)
  {
    self->__dimmed = a3;
    [(CEKSlider *)self _updateEnableAppearanceStateAnimated:a4];
  }
}

- (void)_updateEnableAppearanceStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CEKSlider *)self _isDimmed];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__CEKSlider__updateEnableAppearanceStateAnimated___block_invoke;
  aBlock[3] = &unk_1E63CDAC0;
  aBlock[4] = self;
  BOOL v10 = v5;
  BOOL v6 = _Block_copy(aBlock);
  BOOL v7 = v6;
  if (v3)
  {
    [(CEKSlider *)self _setAnimating:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__CEKSlider__updateEnableAppearanceStateAnimated___block_invoke_2;
    v8[3] = &unk_1E63CD3F0;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v8 completion:0.25];
  }
  else
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }
  [(CEKSlider *)self _updateMarkedViewAnimated:v3];
}

void __50__CEKSlider__updateEnableAppearanceStateAnimated___block_invoke(uint64_t a1)
{
  double v2 = 0.33;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  [*(id *)(a1 + 32) setAlpha:v2];
  BOOL v3 = [*(id *)(a1 + 32) _levelIndicatorView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = 0.0;
  if (!*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) levelIndicatorHeight];
    double v10 = v11;
  }
  double v12 = [*(id *)(a1 + 32) _levelIndicatorView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v10);

  if (*(unsigned char *)(a1 + 40)) {
    double v13 = 0.0;
  }
  else {
    double v13 = 1.0;
  }
  id v14 = [*(id *)(a1 + 32) _levelIndicatorView];
  [v14 setAlpha:v13];
}

uint64_t __50__CEKSlider__updateEnableAppearanceStateAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAnimating:0];
}

- (void)setMagneticRange:(id)a3
{
  double v5 = (CEKDiscreteFloatRange *)a3;
  p_magneticRange = &self->_magneticRange;
  if (self->_magneticRange != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_magneticRange, a3);
    p_magneticRange = (CEKDiscreteFloatRange **)[(CEKSlider *)self _updateMagneticTickIndexes];
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](p_magneticRange, v5);
}

- (void)_updateMagneticTickIndexes
{
  id v17 = [(CEKSlider *)self magneticRange];
  BOOL v3 = [MEMORY[0x1E4F28E60] indexSet];
  double v4 = [(CEKSlider *)self _tickMarksView];
  double v5 = [v4 tickMarksModel];

  if ([v17 count])
  {
    unint64_t v6 = 0;
    do
    {
      double v7 = [v17 valueAtIndex:v6];
      [v7 doubleValue];
      double v9 = v8;

      [(CEKSlider *)self minimumValue];
      double v11 = v10;
      [(CEKSlider *)self maximumValue];
      objc_msgSend(v5, "xOffsetForNormalizedValue:", CEKProgress(v9, v11, v12));
      uint64_t v14 = [v5 floorTickMarkIndexForXOffset:v13 + 0.001];
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v14;
      }
      [v3 addIndex:v15];
      ++v6;
    }
    while (v6 < [v17 count]);
  }
  CGFloat v16 = [(CEKSlider *)self _dynamicTickMarksView];
  [v16 setMagneticTickMarkIndexes:v3];
}

- (void)_resetSnapped
{
  [(CEKSlider *)self _setSnapped:0];
  [(CEKSlider *)self _setSnappedOffset:0.0];
  [(CEKSlider *)self _setUnsnappingProgress:0.0];
}

- (void)performWaveAnimation
{
  id v2 = [(CEKSlider *)self _dynamicTickMarksView];
  [v2 performWaveAnimation];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CEKSlider;
  [(CEKSlider *)&v3 tintColorDidChange];
  [(CEKSlider *)self _updateColorsAnimated:0];
}

- (void)_updateColorsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CEKSlider *)self _isActive]) {
    [(CEKSlider *)self tintColor];
  }
  else {
  double v5 = [MEMORY[0x1E4FB1618] labelColor];
  }
  unint64_t v6 = [(CEKSlider *)self tintColor];
  if (![(CEKSlider *)self _isActive]
    && [(CEKSlider *)self valueLabelVisibility] == 2)
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] labelColor];

    unint64_t v6 = (void *)v7;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__CEKSlider__updateColorsAnimated___block_invoke;
  aBlock[3] = &unk_1E63CDAE8;
  aBlock[4] = self;
  id v8 = v5;
  id v14 = v8;
  id v9 = v6;
  id v15 = v9;
  double v10 = _Block_copy(aBlock);
  double v11 = v10;
  if (v3)
  {
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    [(CEKSlider *)self animationDuration];
    objc_msgSend(v12, "animateWithDuration:animations:", v11);
  }
  else
  {
    (*((void (**)(void *))v10 + 2))(v10);
  }
}

void __35__CEKSlider__updateColorsAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) _levelIndicatorView];
  [v3 setBackgroundColor:v2];

  double v4 = [MEMORY[0x1E4FB1618] labelColor];
  double v5 = [v4 colorWithAlphaComponent:0.6];
  unint64_t v6 = [*(id *)(a1 + 32) _titleLabel];
  [v6 setTextColor:v5];

  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [*(id *)(a1 + 32) _valueLabel];
  [v8 setTextColor:v7];
}

- (void)_setActive:(BOOL)a3
{
}

- (void)_setActive:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__active != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->__active = a3;
    if ([(CEKSlider *)self valueLabelVisibility] == 1) {
      [(CEKSlider *)self _setShowValueLabel:v5 animated:v4];
    }
    [(CEKSlider *)self _updateColorsAnimated:v4];
    [(CEKSlider *)self _updateMarkedViewAnimated:v4];
  }
}

- (double)_xOffsetForMarkedValue
{
  [(CEKSlider *)self markedValue];
  -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
  double v4 = v3;
  BOOL v5 = [(CEKSlider *)self _contentScrollView];
  [v5 contentInset];
  double v7 = v4 + v6;

  return v7;
}

- (double)xOffsetForValue:(double)a3
{
  [(CEKSlider *)self minimumValue];
  double v6 = v5;
  [(CEKSlider *)self maximumValue];
  double v8 = CEKProgress(a3, v6, v7);
  id v9 = [(CEKSlider *)self _tickMarksView];
  double v10 = [v9 tickMarksModel];
  [v10 xOffsetForNormalizedValue:v8];
  double v11 = [(CEKSlider *)self _contentScrollView];
  [v11 contentInset];

  UIRoundToViewScale();
  return result;
}

- (void)_updateScrollViewPosition
{
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(CEKSlider *)self value];
  -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
  double v5 = v4;
  id v6 = [(CEKSlider *)self _contentScrollView];
  objc_msgSend(v6, "setContentOffset:animated:", 0, v5, v3);
}

- (void)_setValue:(double)a3 shouldSendActions:(BOOL)a4 shouldUpdateScrollPosition:(BOOL)a5
{
  if (self->_value != a3)
  {
    BOOL v5 = a4;
    self->_value = a3;
    [(CEKSlider *)self _clampValuesAndUpdateScrollPosition:a5];
    [(CEKSlider *)self _updateMarkedViewAnimated:1];
    [(CEKSlider *)self _updateValueLabel];
    if (v5)
    {
      [(CEKSlider *)self sendActionsForControlEvents:4096];
    }
  }
}

- (double)_valueForScrollViewXOffset:(double)a3
{
  BOOL v5 = [(CEKSlider *)self _contentScrollView];
  [v5 contentInset];
  double v7 = v6;
  double v8 = (v6 + a3) / CEKScrollableDistanceInScrollView(v5);
  id v9 = [(CEKSlider *)self _tickMarksView];
  double v10 = [v9 tickMarksModel];

  double v11 = [(CEKSlider *)self magneticRange];
  [(CEKSlider *)self minimumValue];
  double v13 = v12;
  [(CEKSlider *)self maximumValue];
  double v15 = v14;
  [v10 absoluteValueForNormalizedValue:v8 inAbsoluteRangeSize:v14 - v13];
  double v17 = v13 + v16;
  if ([v11 count])
  {
    CGFloat v18 = objc_msgSend(v11, "valueAtIndex:", objc_msgSend(v11, "indexOfValueClosestToValue:", v17));
    [v18 doubleValue];
    double v20 = v19;

    objc_msgSend(v10, "xOffsetForNormalizedValue:", CEKProgress(v20, v13, v15));
    double v22 = v21 - v7;
    double v23 = CEKPixelWidthForView(self) * 0.5;
    if (vabdd_f64(v22, a3) > v23)
    {
      [v10 xOffsetForNormalizedValue:1.0];
      double v20 = v17;
      if (v24 - v7 - a3 < v23)
      {
        [(CEKSlider *)self maximumValue];
        double v20 = v25;
      }
    }
  }
  else
  {
    double v20 = v17;
  }

  return v20;
}

- (void)setValueLabelVisibility:(int64_t)a3
{
  if (self->_valueLabelVisibility != a3)
  {
    self->_valueLabelVisibilitdouble y = a3;
    if (a3 == 2) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = a3 == 1 && [(CEKSlider *)self _isActive];
    }
    [(CEKSlider *)self _setShowValueLabel:v4 animated:0];
  }
}

- (void)_setShowValueLabel:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = 0.0;
  if (a3)
  {
    double v8 = [(CEKSlider *)self _valueLabel];

    double v7 = 1.0;
    if (!v8)
    {
      id v11 = objc_alloc(MEMORY[0x1E4FB1930]);
      double v12 = (UILabel *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v13 = [MEMORY[0x1E4FB1618] clearColor];
      [(UILabel *)v12 setBackgroundColor:v13];

      [(UILabel *)v12 setTextAlignment:1];
      [(UILabel *)v12 setLineBreakMode:4];
      [(UILabel *)v12 setNumberOfLines:1];
      [(UILabel *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
      valueLabel = self->__valueLabel;
      self->__valueLabel = v12;
      double v15 = v12;

      [(CEKSlider *)self addSubview:self->__valueLabel];
      [(CEKSlider *)self _updateFonts];
      if (v4) {
        goto LABEL_4;
      }
LABEL_9:
      double v16 = [(CEKSlider *)self _valueLabel];
      [v16 setAlpha:v7];

      goto LABEL_10;
    }
  }
  if (!v4) {
    goto LABEL_9;
  }
LABEL_4:
  if (v5) {
    uint64_t v9 = 0x10000;
  }
  else {
    uint64_t v9 = 0x20000;
  }
  double v10 = (void *)MEMORY[0x1E4FB1EB0];
  [(CEKSlider *)self animationDuration];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__CEKSlider__setShowValueLabel_animated___block_invoke;
  v17[3] = &unk_1E63CD5A0;
  v17[4] = self;
  *(double *)&v17[5] = v7;
  objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", v9, v17, 0);
LABEL_10:
  [(CEKSlider *)self _updateColorsAnimated:v4];
  [(CEKSlider *)self _updateValueLabel];
  [(CEKSlider *)self setNeedsLayout];
}

void __41__CEKSlider__setShowValueLabel_animated___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _valueLabel];
  [v2 setAlpha:v1];
}

- (void)_updateValueLabel
{
  double v3 = [(CEKSlider *)self _valueLabel];
  [v3 alpha];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    id v10 = [(CEKSlider *)self _valueLabel];
    [v10 setAttributedText:0];
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4F28ED0];
    [(CEKSlider *)self value];
    id v10 = [v6 numberWithDouble:v7 * 100.0];
    double v8 = -[CEKSlider formattedIntegerStringFromNumber:](self, "formattedIntegerStringFromNumber:");
    uint64_t v9 = [(CEKSlider *)self _valueLabel];
    [v9 setAttributedText:v8];
  }
}

- (void)setFontStyle:(unint64_t)a3
{
  if (self->_fontStyle != a3)
  {
    self->_fontStyle = a3;
    [(CEKSlider *)self _updateFonts];
  }
}

- (void)_updateFonts
{
  uint64_t v3 = [(CEKSlider *)self fontStyle];
  double v4 = CEKFontOfSizeAndStyle(v3, 14.0);
  double v5 = [(CEKSlider *)self _titleLabel];
  [v5 setFont:v4];

  CEKMonospacedStylisticNumeralFontOfSizeAndStyle(v3, 14.0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v6 = [(CEKSlider *)self _valueLabel];
  [v6 setFont:v7];
}

- (void)setSelectionFeedbackProfile:(int64_t)a3
{
  id v4 = [(CEKSlider *)self _feedbackGenerator];
  [v4 setProfile:a3];
}

- (int64_t)selectionFeedbackProfile
{
  id v2 = [(CEKSlider *)self _feedbackGenerator];
  int64_t v3 = [v2 profile];

  return v3;
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
      [(CEKSlider *)self layoutIfNeeded];
      self->_textOrientation = a3;
      [(CEKSlider *)self setNeedsLayout];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __41__CEKSlider_setTextOrientation_animated___block_invoke;
      v6[3] = &unk_1E63CD380;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v6 options:0 animations:0.25 completion:0.0];
    }
    else
    {
      self->_textOrientation = a3;
      [(CEKSlider *)self setNeedsLayout];
    }
  }
}

uint64_t __41__CEKSlider_setTextOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (int64_t)titleAlignment
{
  id v2 = [(CEKSlider *)self _titleLabel];
  int64_t v3 = [v2 textAlignment];

  return v3;
}

- (void)setTitleAlignment:(int64_t)a3
{
  id v4 = [(CEKSlider *)self _titleLabel];
  [v4 setTextAlignment:a3];
}

- (void)setSliderVerticalOffset:(double)a3
{
  if (self->_sliderVerticalOffset != a3)
  {
    self->_sliderVerticalOffset = a3;
    [(CEKSlider *)self setNeedsLayout];
  }
}

- (void)setLabelVerticalPadding:(double)a3
{
  if (self->_labelVerticalPadding != a3)
  {
    self->_labelVerticalPadding = a3;
    [(CEKSlider *)self setNeedsLayout];
  }
}

- (void)setSliderVerticalAlignment:(int64_t)a3
{
  if (self->_sliderVerticalAlignment != a3)
  {
    self->_sliderVerticalAlignment = a3;
    [(CEKSlider *)self setNeedsLayout];
  }
}

- (void)setLevelIndicatorHeight:(double)a3
{
  if (self->_levelIndicatorHeight != a3)
  {
    self->_levelIndicatorHeight = a3;
    [(CEKSlider *)self setNeedsLayout];
  }
}

- (CGRect)frameForTitleLabel
{
  id v2 = [(CEKSlider *)self _titleLabel];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)frameForValueLabel
{
  id v2 = [(CEKSlider *)self _valueLabel];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)frameForLevelIndicator
{
  id v2 = [(CEKSlider *)self _levelIndicatorView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)frameForTicksView
{
  double v3 = [(CEKSlider *)self _contentScrollView];
  double v4 = [(CEKSlider *)self _tickMarksView];
  [v4 frame];
  objc_msgSend(v3, "convertRect:toView:", self);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = [(CEKSlider *)self _dynamicTickMarksView];
  [(CEKSlider *)self bounds];
  -[CEKSlider convertRect:toView:](self, "convertRect:toView:", v5);
  objc_msgSend(v5, "setVisibleBounds:");
  if ([(CEKSlider *)self _isreAdjustingOffsets]) {
    goto LABEL_32;
  }
  [v4 contentOffset];
  double v45 = v6;
  double v46 = v7;
  if (self->_delegateFlags.respondsToWillUpdateValue)
  {
    double v8 = [v4 panGestureRecognizer];
    [v8 velocityInView:self];
    double v10 = v9;

    double v11 = [(CEKSlider *)self delegate];
    [v11 slider:self willUpdateValue:&v45 withVelocity:v10];

    [(CEKSlider *)self set_reAdjustingOffsets:1];
    objc_msgSend(v4, "setContentOffset:", v45, v46);
    [(CEKSlider *)self set_reAdjustingOffsets:0];
  }
  BOOL v12 = [(CEKSlider *)self _isExternallyScrolling]
     || [(CEKSlider *)self _isScrollExternallyAnimating];
  if ([v4 isTracking])
  {
    int v13 = 1;
LABEL_10:
    [v4 contentOffset];
    -[CEKSlider _valueForScrollViewXOffset:](self, "_valueForScrollViewXOffset:");
    int v14 = 1;
    -[CEKSlider _setValue:shouldSendActions:shouldUpdateScrollPosition:](self, "_setValue:shouldSendActions:shouldUpdateScrollPosition:", 1, 0);
    goto LABEL_12;
  }
  int v13 = [v4 isDecelerating];
  if ((v13 | v12) == 1) {
    goto LABEL_10;
  }
  int v14 = 0;
  int v13 = 0;
LABEL_12:
  if (self->_delegateFlags.respondsToDidScroll)
  {
    double v15 = [(CEKSlider *)self delegate];
    [v15 sliderDidScroll:self];
  }
  double v16 = [(CEKSlider *)self _tickMarksView];
  double v17 = [v16 tickMarksModel];

  [(CEKSlider *)self value];
  double v19 = v18;
  [(CEKSlider *)self minimumValue];
  double v21 = v20;
  [(CEKSlider *)self maximumValue];
  objc_msgSend(v17, "xOffsetForNormalizedValue:", CEKProgress(v19, v21, v22));
  double v24 = v23;
  double v25 = [(CEKSlider *)self _tickMarksView];
  double v26 = [v25 tickMarksModel];
  uint64_t v27 = [v26 floorTickMarkIndexForXOffset:v24 + 0.001];

  if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_26;
  }
  if ([(CEKSlider *)self _tickMarkIndex] == v27) {
    goto LABEL_26;
  }
  [(CEKSlider *)self _setTickMarkIndex:v27];
  double v28 = [(CEKSlider *)self _dynamicTickMarksView];
  [v28 setSelectedTickMarkIndex:v27 animated:1];

  if (!v14) {
    goto LABEL_26;
  }
  int64_t v29 = [(CEKSlider *)self feedbackScope];
  if ((unint64_t)(v29 - 1) > 1) {
    goto LABEL_26;
  }
  int64_t v30 = v29;
  uint64_t v44 = [v17 tickMarksCount];
  int v43 = [v17 isMainTickMarkAtIndex:v27];
  CGFloat v31 = [(CEKSlider *)self _dynamicTickMarksView];
  double v32 = [v31 magneticTickMarkIndexes];
  int v33 = [v32 containsIndex:v27];

  if (!v27 || v27 == v44 - 1)
  {
    v36 = [(CEKSlider *)self _feedbackGenerator];
    [v36 performFeedback];

    v35 = [(CEKSlider *)self _feedbackGenerator];
    [v35 playEndTickSound];
    goto LABEL_25;
  }
  if ((v43 | v33) == 1)
  {
    CGFloat v34 = [(CEKSlider *)self _feedbackGenerator];
    [v34 performFeedback];

    v35 = [(CEKSlider *)self _feedbackGenerator];
    [v35 playMajorTickSound];
LABEL_25:

    goto LABEL_26;
  }
  if (v30 == 2)
  {
    double v37 = [(CEKSlider *)self _feedbackGenerator];
    [v37 performFeedback];

    v35 = [(CEKSlider *)self _feedbackGenerator];
    [v35 playMinorTickSound];
    goto LABEL_25;
  }
LABEL_26:
  [v4 contentInset];
  double v39 = v38;
  double v40 = CEKScrollableDistanceInScrollView(v4) - v38;
  BOOL v41 = v45 > v40 + 20.0 || v45 < -20.0 - v39;
  [(CEKSlider *)self _setOverscrolling:v41];
  if (v13)
  {
    CGFloat v42 = [(CEKSlider *)self _externalScrollOffsetAnimator];
    [v42 invalidate];

    [(CEKSlider *)self _setExternalScrollOffsetAnimator:0];
    [(CEKSlider *)self contactEndedWithAction:0];
    [(CEKSlider *)self _resetSnapped];
  }

LABEL_32:
}

- (void)_setOverscrolling:(BOOL)a3
{
  if (self->__overscrolling != a3)
  {
    BOOL v3 = a3;
    self->__overscrolling = a3;
    int64_t v5 = [(CEKSlider *)self feedbackScope];
    if (v3)
    {
      if (v5)
      {
        id v6 = [(CEKSlider *)self _feedbackGenerator];
        [v6 playOverscrollTickSound];
      }
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(CEKSlider *)self _feedbackGenerator];
  [v4 prepareFeedback];

  [(CEKSlider *)self _setActive:1 animated:1];
  if (self->_delegateFlags.respondsToWillBeginScrolling)
  {
    id v5 = [(CEKSlider *)self delegate];
    [v5 sliderWillBeginScrolling:self];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (self->_delegateFlags.respondsToWillEndScrolling)
  {
    double y = a4.y;
    double x = a4.x;
    id v9 = [(CEKSlider *)self delegate];
    objc_msgSend(v9, "sliderWillEndScrolling:withVelocity:targetContentOffset:", self, a5, x, y);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(CEKSlider *)self _sliderDidEndScrolling];
  }
}

- (void)_sliderDidEndScrolling
{
  [(CEKSlider *)self _setActive:0 animated:1];
  if (self->_delegateFlags.respondsToDidEndScrolling)
  {
    id v3 = [(CEKSlider *)self delegate];
    [v3 sliderDidEndScrolling:self];
  }
}

- (CEKSliderPositionDriver)_sliderDriver
{
  sliderDriver = self->__sliderDriver;
  if (!sliderDriver)
  {
    CEKDefaultSliderPositionDriver();
    id v4 = (CEKSliderPositionDriver *)objc_claimAutoreleasedReturnValue();
    id v5 = self->__sliderDriver;
    self->__sliderDriver = v4;

    sliderDriver = self->__sliderDriver;
  }
  return sliderDriver;
}

- (void)contactBeganWithAction:(id)a3
{
  id v8 = a3;
  if (![(CEKSlider *)self _isExternalScrollingAllowed]
    && [(CEKSlider *)self isEnabled])
  {
    [(CEKSlider *)self _setExternalScrollingAllowed:1];
    [(CEKSlider *)self _setExternalOverScroll:0.0];
    id v4 = [(CEKSlider *)self _sliderDriver];
    [v4 contactBeganWithAction:v8];

    id v5 = [(CEKSlider *)self _contentScrollView];
    [v5 contentOffset];
    double v7 = v6;
    objc_msgSend(v5, "setContentOffset:animated:", 0);
    [(CEKSlider *)self _applyExternalTarget:2 mode:v7];
  }
}

- (void)contactUpdatedWithAction:(id)a3
{
  id v4 = a3;
  if ([(CEKSlider *)self _isExternalScrollingAllowed])
  {
    id v5 = [(CEKSlider *)self _contentScrollView];
    if (![(CEKSlider *)self _isExternallyScrolling])
    {
      [(CEKSlider *)self _setExternallyScrolling:1];
      [(CEKSlider *)self scrollViewWillBeginDragging:v5];
    }
    [(CEKSlider *)self _createExternalScrollAnimatorIfNeeded];
    double v6 = [(CEKSlider *)self _sliderDriver];
    [v6 distanceTraveled];
    double v8 = v7;
    [v6 contactUpdatedWithAction:v4];
    [v6 distanceTraveled];
    double v10 = v9 - v8;
    double v11 = [(CEKSlider *)self _externalScrollOffsetAnimator];
    [v11 value];
    double v13 = v12;

    double v14 = v10 + v13;
    [(CEKSlider *)self minimumValue];
    -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
    double v16 = v15;
    [(CEKSlider *)self maximumValue];
    -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
    double v18 = v17;
    [(CEKSlider *)self _externalOverScroll];
    if (v10 + v13 <= v18)
    {
      double v20 = 0.0;
      if (v14 >= v16) {
        goto LABEL_13;
      }
      if (v19 == 0.0) {
        double v20 = v14 - v16;
      }
      else {
        double v20 = v10 + v19;
      }
    }
    else if (v19 == 0.0)
    {
      double v20 = v14 - v18;
    }
    else
    {
      double v20 = v10 + v19;
    }
    [(CEKSlider *)self bounds];
    double v55 = v16;
    LOBYTE(v56) = 1;
    *(_DWORD *)((char *)&v56 + 1) = 0;
    HIDWORD(v56) = 0;
    double v57 = v18;
    LOBYTE(v58) = 1;
    *(_DWORD *)((char *)&v58 + 1) = 0;
    HIDWORD(v58) = 0;
    BSUIConstrainValueToIntervalWithRubberBand();
    double v14 = v21;
LABEL_13:
    -[CEKSlider _setExternalOverScroll:](self, "_setExternalOverScroll:", v20, *(void *)&v55, v56, *(void *)&v57, v58);
    if ([(CEKSlider *)self _snapped])
    {
      [(CEKSlider *)self _unsnappingProgress];
      if (v22 > 0.0 && v10 < 0.0 || v22 < 0.0 && v10 > 0.0) {
        double v22 = 0.0;
      }
      if (fabs(v10 + v22) <= 10.0)
      {
        -[CEKSlider _setUnsnappingProgress:](self, "_setUnsnappingProgress:");
        [(CEKSlider *)self _snappedOffset];
        double v32 = v44;
      }
      else
      {
        [(CEKSlider *)self _snappedOffset];
        -[CEKSlider _valueForScrollViewXOffset:](self, "_valueForScrollViewXOffset:");
        double v23 = os_log_create("com.apple.camera", "CameraEditKit");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[CEKSlider contactUpdatedWithAction:](v23, v24, v25, v26, v27, v28, v29, v30);
        }

        [(CEKSlider *)self _snappedOffset];
        double v32 = v10 + v31;
        [(CEKSlider *)self _resetSnapped];
      }
      goto LABEL_35;
    }
    int v33 = [(CEKSlider *)self magneticRange];
    if (!v33) {
      goto LABEL_32;
    }
    [(CEKSlider *)self value];
    uint64_t v34 = objc_msgSend(v33, "indexOfValueClosestToValue:");
    if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_32;
    }
    v35 = [v33 valueAtIndex:v34];
    [v35 doubleValue];
    double v37 = v36;

    [(CEKSlider *)self xOffsetForValue:v37];
    double v38 = [(CEKSlider *)self traitCollection];
    [v38 displayScale];
    UIRoundToScale();
    double v32 = v39;

    BOOL v41 = 0;
    if (v10 > 0.0 && v13 < v32)
    {
      double v40 = v14 + 0.3;
      BOOL v41 = v14 + 0.3 >= v32;
    }
    BOOL v42 = 1;
    if (v10 < 0.0 && v13 > v32)
    {
      double v40 = v14 + -0.3;
      BOOL v42 = v14 + -0.3 > v32;
    }
    [(CEKSlider *)self minimumValue];
    if (v37 == v43) {
      goto LABEL_32;
    }
    [(CEKSlider *)self maximumValue];
    if (v41)
    {
      if (v37 != v45)
      {
LABEL_44:
        v47 = os_log_create("com.apple.camera", "CameraEditKit");
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
          -[CEKSlider contactUpdatedWithAction:](v47, v48, v49, v50, v51, v52, v53, v54);
        }

        [(CEKSlider *)self _setSnappedOffset:v32];
        [(CEKSlider *)self _setUnsnappingProgress:dbl_1BEE74AC0[v10 > 0.0] + v14 - v32];
        [(CEKSlider *)self _setSnapped:1];
        goto LABEL_33;
      }
    }
    else
    {
      char v46 = v37 == v45 || v42;
      if ((v46 & 1) == 0) {
        goto LABEL_44;
      }
    }
LABEL_32:
    double v32 = v14;
LABEL_33:

LABEL_35:
    [(CEKSlider *)self _applyExternalTarget:5 mode:v32];
  }
}

- (void)contactEndedWithAction:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(CEKSlider *)self _isExternalScrollingAllowed]) {
    goto LABEL_27;
  }
  [(CEKSlider *)self _resetSnapped];
  [(CEKSlider *)self _setExternalScrollingAllowed:0];
  [(CEKSlider *)self _setExternallyScrolling:0];
  id v5 = [(CEKSlider *)self _sliderDriver];
  [v5 contactEndedWithAction:v4];
  [v5 velocity];
  double v7 = v6;
  [v5 distanceToDecelerate];
  double v9 = v8;
  double v10 = [(CEKSlider *)self _externalScrollOffsetAnimator];
  [v10 value];
  double v12 = v11;

  double v13 = [(CEKSlider *)self traitCollection];
  [v13 displayScale];
  UIRoundToScale();
  double v15 = v14;

  [(CEKSlider *)self minimumValue];
  -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
  double v17 = v16;
  [(CEKSlider *)self maximumValue];
  -[CEKSlider xOffsetForValue:](self, "xOffsetForValue:");
  double v19 = v18;
  double v20 = fmax(v17, fmin(v18, v15));
  double v21 = [(CEKSlider *)self magneticRange];
  if (v21)
  {
    double v22 = [(CEKSlider *)self _externalScrollOffsetAnimator];
    [v22 value];
    -[CEKSlider _valueForScrollViewXOffset:](self, "_valueForScrollViewXOffset:");
    double v24 = v23;

    uint64_t v25 = [v21 indexOfValueClosestToValue:v24];
    uint64_t v26 = [v21 indexOfValueGreaterThanValue:v24];
    uint64_t v27 = [v21 indexOfValueLessThanValue:v24];
    if (v20 != v12 || v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v7 <= 20.0 || v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v7 >= -20.0 || v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v35 = os_log_create("com.apple.camera", "CameraEditKit");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
            -[CEKSlider contactEndedWithAction:](v35, v50, v51, v52, v53, v54, v55, v56);
          }
          goto LABEL_22;
        }
        double v45 = [v21 valueAtIndex:v27];
        [v45 doubleValue];
        double v31 = v46;

        [(CEKSlider *)self xOffsetForValue:v31];
        v47 = [(CEKSlider *)self traitCollection];
        [v47 displayScale];
        UIRoundToScale();
        double v49 = v48;

        double v20 = fmax(v17, fmin(v19, v49));
        v35 = os_log_create("com.apple.camera", "CameraEditKit");
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v29 = [v21 valueAtIndex:v26];
        [v29 doubleValue];
        double v31 = v30;

        [(CEKSlider *)self xOffsetForValue:v31];
        double v32 = [(CEKSlider *)self traitCollection];
        [v32 displayScale];
        UIRoundToScale();
        double v34 = v33;

        double v20 = fmax(v17, fmin(v19, v34));
        v35 = os_log_create("com.apple.camera", "CameraEditKit");
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_22;
        }
      }
      *(_DWORD *)buf = 134218496;
      double v60 = v24;
      __int16 v61 = 2048;
      double v62 = v31;
      __int16 v63 = 2048;
      double v64 = v7;
      BOOL v42 = "ScrollDiagnostic: Decelerating from %.3f to magnetic value %.3f with velocity %.3f";
      double v43 = v35;
      uint32_t v44 = 32;
      goto LABEL_19;
    }
    double v36 = [v21 valueAtIndex:v25];
    [v36 doubleValue];
    double v38 = v37;

    if (vabdd_f64(v38, v24) < 0.1)
    {
      [(CEKSlider *)self xOffsetForValue:v38];
      double v39 = [(CEKSlider *)self traitCollection];
      [v39 displayScale];
      UIRoundToScale();
      double v41 = v40;

      double v20 = fmax(v17, fmin(v19, v41));
      v35 = os_log_create("com.apple.camera", "CameraEditKit");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        double v60 = v24;
        __int16 v61 = 2048;
        double v62 = v38;
        __int16 v63 = 2048;
        double v64 = v9;
        __int16 v65 = 2048;
        double v66 = v7;
        BOOL v42 = "ScrollDiagnostic: Decelerating from %.3f to magnetic value %.3f due to proximity and deceleration %.3f (velocity %.3f)";
        double v43 = v35;
        uint32_t v44 = 42;
LABEL_19:
        _os_log_debug_impl(&dword_1BEE2D000, v43, OS_LOG_TYPE_DEBUG, v42, buf, v44);
      }
LABEL_22:
    }
  }
  if (v20 == v12)
  {
    [(CEKSlider *)self _sliderDidEndScrolling];
  }
  else
  {
    double v57 = [(CEKSlider *)self _contentScrollView];
    [(CEKSlider *)self scrollViewDidEndDragging:v57 willDecelerate:1];

    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __36__CEKSlider_contactEndedWithAction___block_invoke;
    v58[3] = &unk_1E63CD740;
    v58[4] = self;
    [(CEKSlider *)self _applyExternalTarget:3 mode:v58 completion:v20];
  }

LABEL_27:
}

uint64_t __36__CEKSlider_contactEndedWithAction___block_invoke(uint64_t a1)
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
    id v5 = self->__externalScrollSettings;
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
  id v2 = [(CEKSlider *)self _externalScrollOffsetAnimator];
  [v2 presentationValue];
  [v2 value];
  char v3 = BSFloatEqualToFloat() ^ 1;

  return v3;
}

- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4
{
}

- (void)_applyExternalTarget:(double)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  double v8 = [(CEKSlider *)self _externalScrollOffsetAnimator];
  UIRoundToViewScale();
  double v10 = v9;
  if (!v8 || ([v8 value], v10 != v11))
  {
    [(CEKSlider *)self _createExternalScrollAnimatorIfNeeded];
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    double v13 = [(CEKSlider *)self _externalScrollSettings];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__CEKSlider__applyExternalTarget_mode_completion___block_invoke;
    v14[3] = &unk_1E63CD5A0;
    v14[4] = self;
    *(double *)&v14[5] = v10;
    objc_msgSend(v12, "cek_animateWithSettings:mode:animations:completion:", v13, a4, v14, v7);
  }
}

void __50__CEKSlider__applyExternalTarget_mode_completion___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _externalScrollOffsetAnimator];
  [v2 setValue:v1];
}

- (void)_createExternalScrollAnimatorIfNeeded
{
  v16[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(CEKSlider *)self _externalScrollOffsetAnimator];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    [(CEKSlider *)self _setExternalScrollOffsetAnimator:v4];
    objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = v4;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    double v12 = __50__CEKSlider__createExternalScrollAnimatorIfNeeded__block_invoke;
    double v13 = &unk_1E63CD768;
    objc_copyWeak(&v14, &location);
    [v5 _createTransformerWithInputAnimatableProperties:v6 presentationValueChangedCallback:&v10];

    id v7 = [(CEKSlider *)self _contentScrollView];
    [v7 contentOffset];
    double v9 = v8;

    [v4 setValue:v9];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __50__CEKSlider__createExternalScrollAnimatorIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleExternalScrollAnimated];
}

- (void)_handleExternalScrollAnimated
{
  id v4 = [(CEKSlider *)self _externalScrollOffsetAnimator];
  if (v4)
  {
    char v3 = [(CEKSlider *)self _contentScrollView];
    [v3 contentOffset];
    [v4 presentationValue];
    objc_msgSend(v3, "setContentOffset:");
  }
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

- (CEKSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEKSliderDelegate *)WeakRetained;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)value
{
  return self->_value;
}

- (double)defaultValue
{
  return self->_defaultValue;
}

- (double)markedValue
{
  return self->_markedValue;
}

- (CEKDiscreteFloatRange)magneticRange
{
  return self->_magneticRange;
}

- (CGSize)tickMarkSize
{
  double width = self->_tickMarkSize.width;
  double height = self->_tickMarkSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)valueLabelVisibility
{
  return self->_valueLabelVisibility;
}

- (UIScrollView)_contentScrollView
{
  return self->__contentScrollView;
}

- (CEKTickMarksContainer)_tickMarksView
{
  return self->__tickMarksView;
}

- (CEKDynamicTickMarksView)_dynamicTickMarksView
{
  return self->__dynamicTickMarksView;
}

- (unint64_t)_ticksStyle
{
  return self->__ticksStyle;
}

- (UIView)_levelIndicatorView
{
  return self->__levelIndicatorView;
}

- (CEKSliderDotView)_dotView
{
  return self->__dotView;
}

- (CEKEdgeGradientView)_edgeGradientView
{
  return self->__edgeGradientView;
}

- (void)_setEdgeGradientView:(id)a3
{
}

- (BOOL)_isAnimating
{
  return self->__animating;
}

- (void)_setAnimating:(BOOL)a3
{
  self->__animating = a3;
}

- (BOOL)_isOverscrolling
{
  return self->__overscrolling;
}

- (unint64_t)_tickMarkIndex
{
  return self->__tickMarkIndex;
}

- (void)_setTickMarkIndex:(unint64_t)a3
{
  self->__tickMarkIndedouble x = a3;
}

- (CEKSelectionFeedbackGenerator)_feedbackGenerator
{
  return self->__feedbackGenerator;
}

- (BOOL)_isActive
{
  return self->__active;
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

- (BOOL)_isreAdjustingOffsets
{
  return self->__reAdjustingOffsets;
}

- (void)set_reAdjustingOffsets:(BOOL)a3
{
  self->__reAdjustingOffsets = a3;
}

- (BOOL)_isDimmed
{
  return self->__dimmed;
}

- (UIView)_levelIndicatorBackgroundView
{
  return self->__levelIndicatorBackgroundView;
}

- (void)set_levelIndicatorBackgroundView:(id)a3
{
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

- (BOOL)_snapped
{
  return self->__snapped;
}

- (void)_setSnapped:(BOOL)a3
{
  self->__snapped = a3;
}

- (double)_snappedOffset
{
  return self->__snappedOffset;
}

- (void)_setSnappedOffset:(double)a3
{
  self->__snappedOffset = a3;
}

- (double)_unsnappingProgress
{
  return self->__unsnappingProgress;
}

- (void)_setUnsnappingProgress:(double)a3
{
  self->__unsnappingProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__externalScrollOffsetAnimator, 0);
  objc_storeStrong((id *)&self->__levelIndicatorBackgroundView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__feedbackGenerator, 0);
  objc_storeStrong((id *)&self->__edgeGradientView, 0);
  objc_storeStrong((id *)&self->__dotView, 0);
  objc_storeStrong((id *)&self->__levelIndicatorView, 0);
  objc_storeStrong((id *)&self->__dynamicTickMarksView, 0);
  objc_storeStrong((id *)&self->__tickMarksView, 0);
  objc_storeStrong((id *)&self->__contentScrollView, 0);
  objc_storeStrong((id *)&self->_magneticRange, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__externalScrollSettings, 0);
  objc_storeStrong((id *)&self->__sliderDriver, 0);
}

- (void)contactUpdatedWithAction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)contactUpdatedWithAction:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)contactEndedWithAction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end