@interface HUQuickControlRingSliderView
+ (BOOL)requiresConstraintBasedLayout;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_getPossibleAngleRange12OClock;
- ($F24F406B2B787EFB06265DBA3D28CBD5)modelRangeValue;
- (BOOL)_areHandleViewsAnimating;
- (BOOL)_isIncreasingOrDecreasing:(unint64_t)a3;
- (BOOL)_isPoint:(CGPoint)a3 withInMarginOfRing:(double)a4;
- (BOOL)_primaryHandleViewContainsPoint:(CGPoint)a3;
- (BOOL)_secondaryHandleViewContainsPoint:(CGPoint)a3;
- (BOOL)didMaskBackgroundImageView;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isDraggingPrimaryHandleView;
- (BOOL)isDraggingSecondaryHandleView;
- (BOOL)isUserInteractionActive;
- (BOOL)showOffState;
- (CGPoint)_getCircleCenterPoint;
- (CGPoint)_getClosestPointOnMiddleCircleOfRing:(CGPoint)a3;
- (CGPoint)_getHandleCenterOnRingForValue:(double)a3;
- (CGPoint)_getPointForAngleFrom12OClock:(double)a3;
- (CGSize)_getEdgeRectSize;
- (CGSize)intrinsicContentSize;
- (HUQuickControlRingSliderHandleView)primaryHandleView;
- (HUQuickControlRingSliderHandleView)secondaryHandleView;
- (HUQuickControlRingSliderView)initWithProfile:(id)a3;
- (HUQuickControlRingSliderViewProfile)profile;
- (HUQuickControlViewInteractionDelegate)interactionDelegate;
- (NSMutableArray)currentDirectionTapticValues;
- (NSMutableArray)gradationMarkingViews;
- (NSMutableDictionary)markingValuesAndViewsDictionary;
- (UIImage)gradientRingImage;
- (UIImageView)selectedRangeImageView;
- (UIImageView)selectedRangeImageViewForEdges;
- (UIImpactFeedbackGenerator)impactFeedbackGenerator;
- (UILabel)primaryLabel;
- (UILabel)supplementaryLabel;
- (UILongPressGestureRecognizer)longPressPanGestureRecognizer;
- (UISelectionFeedbackGenerator)selectionFeedbackGenerator;
- (UIView)backgroundRingView;
- (UIView)edgesAndColoredSupplementaryValueLineView;
- (UIView)labelsBackgroundView;
- (UIView)supplementaryValueMarkingView;
- (double)_getAngleFrom12OClockForPoint:(CGPoint)a3;
- (double)_getAngleFrom12OClockForValue:(double)a3;
- (double)_getClosestMarkingValueToValue:(double)a3;
- (double)_getInnerCircleRadius;
- (double)_getMaxAngleFrom12OClock;
- (double)_getMaximumMarkingValue;
- (double)_getMiddleCircleRadius;
- (double)_getMinAngleFrom12OClock;
- (double)_getMinimumMarkingValue;
- (double)_getOneMarkerValueDifference;
- (double)_getPrimarySliderValue;
- (double)_getSecondarySliderValue;
- (double)_getSliderValueForAngleFrom12OClock:(double)a3;
- (double)_getSliderValueForPoint:(CGPoint)a3;
- (double)_getStartAngleEdgeLocationShiftForBackgroundRing:(BOOL)a3;
- (double)outerRadius;
- (double)prevSliderValue;
- (double)supplementaryValue;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)secondaryValue;
- (id)value;
- (unint64_t)_getRingSliderAreaForAngleFrom12Oclock:(double)a3;
- (unint64_t)_getRingSliderAreaForAngleFrom12Oclock:(double)a3 minAngle:(double)a4 maxAngle:(double)a5;
- (unint64_t)_getRingSliderAreaForPoint:(CGPoint)a3;
- (unint64_t)prevSlidingDirection;
- (unint64_t)prevTouchArea;
- (unint64_t)reachabilityState;
- (void)_actuateImpactTapticFeedback;
- (void)_actuateSelectionTapticFeedback;
- (void)_animateToEnlargeHandleView:(id)a3;
- (void)_maskBackgroundImageViewToRingShape;
- (void)_prepareForTapticFeedback;
- (void)_redrawGradationMarkingViews;
- (void)_touchEnded;
- (void)_updateLabelsSize;
- (void)_updateModelValue:(id)a3 roundValue:(BOOL)a4 notifyInteractionDelegate:(BOOL)a5;
- (void)_updateModelValueWithNewPrimarySliderValue:(double)a3 roundValue:(BOOL)a4 notifyInteractionDelegate:(BOOL)a5;
- (void)_updateModelValueWithNewSecondarySliderValue:(double)a3 roundValue:(BOOL)a4 notifyInteractionDelegate:(BOOL)a5;
- (void)_updateModelValueWithSlidersPositions;
- (void)_updatePrimaryHandleViewPositionToSliderValue;
- (void)_updateRingViewAndHandleViews;
- (void)_updateSecondaryHandleViewPositionToSliderValue;
- (void)_updateSelectedRangeImageView;
- (void)_updateSupplementaryValueMarkingView;
- (void)_updateSupplementaryValueMarkingViewColor;
- (void)_updateTransform;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)_updateUIForThresholdModeForPrimaryHandleViewWithTouchPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4;
- (void)_updateUIForThresholdModeForSecondaryHandleViewWithTouchPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4;
- (void)_updateUIForTouchPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4 forHandleView:(id)a5 minValue:(double)a6 maxValue:(double)a7;
- (void)_updateUIWithTouchAtPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4;
- (void)handlePanGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundRingView:(id)a3;
- (void)setCurrentDirectionTapticValues:(id)a3;
- (void)setDidMaskBackgroundImageView:(BOOL)a3;
- (void)setEdgesAndColoredSupplementaryValueLineView:(id)a3;
- (void)setGradationMarkingViews:(id)a3;
- (void)setGradientRingImage:(id)a3;
- (void)setImpactFeedbackGenerator:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setIsDraggingPrimaryHandleView:(BOOL)a3;
- (void)setIsDraggingSecondaryHandleView:(BOOL)a3;
- (void)setLabelsBackgroundView:(id)a3;
- (void)setLongPressPanGestureRecognizer:(id)a3;
- (void)setMarkingValuesAndViewsDictionary:(id)a3;
- (void)setModelRangeValue:(id)a3;
- (void)setOuterRadius:(double)a3;
- (void)setPrevSliderValue:(double)a3;
- (void)setPrevSlidingDirection:(unint64_t)a3;
- (void)setPrevTouchArea:(unint64_t)a3;
- (void)setPrimaryHandleView:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setProfile:(id)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setSecondaryHandleView:(id)a3;
- (void)setSecondaryValue:(id)a3;
- (void)setSelectedRangeImageView:(id)a3;
- (void)setSelectedRangeImageViewForEdges:(id)a3;
- (void)setSelectionFeedbackGenerator:(id)a3;
- (void)setShowOffState:(BOOL)a3;
- (void)setSupplementaryLabel:(id)a3;
- (void)setSupplementaryValue:(double)a3;
- (void)setSupplementaryValueMarkingView:(id)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)updatePrimaryLabelWithString:(id)a3 fontSize:(double)a4;
- (void)updateSupplementaryLabelWithString:(id)a3;
@end

@implementation HUQuickControlRingSliderView

- (NSMutableArray)currentDirectionTapticValues
{
  currentDirectionTapticValues = self->_currentDirectionTapticValues;
  if (!currentDirectionTapticValues)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_currentDirectionTapticValues;
    self->_currentDirectionTapticValues = v4;

    currentDirectionTapticValues = self->_currentDirectionTapticValues;
  }

  return currentDirectionTapticValues;
}

- (NSMutableDictionary)markingValuesAndViewsDictionary
{
  markingValuesAndViewsDictionary = self->_markingValuesAndViewsDictionary;
  if (!markingValuesAndViewsDictionary)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_markingValuesAndViewsDictionary;
    self->_markingValuesAndViewsDictionary = v4;

    markingValuesAndViewsDictionary = self->_markingValuesAndViewsDictionary;
  }

  return markingValuesAndViewsDictionary;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (NSMutableArray)gradationMarkingViews
{
  gradationMarkingViews = self->_gradationMarkingViews;
  if (!gradationMarkingViews)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_gradationMarkingViews;
    self->_gradationMarkingViews = v4;

    gradationMarkingViews = self->_gradationMarkingViews;
  }

  return gradationMarkingViews;
}

- (HUQuickControlRingSliderView)initWithProfile:(id)a3
{
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)HUQuickControlRingSliderView;
  v6 = [(HUQuickControlRingSliderView *)&v47 init];
  v7 = v6;
  if (v6)
  {
    v6->_userInteractionActive = 0;
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v7->_modelRangeValue = ($888842945EE2C7AB0ACD33E179C69952)HUFloatRangeNormal;
    v7->_supplementaryValue = 1.79769313e308;
    [(HUQuickControlRingSliderView *)v7 frame];
    double v9 = v8;
    [(HUQuickControlRingSliderView *)v7 frame];
    if (v9 >= v10) {
      double v11 = v10;
    }
    else {
      double v11 = v9;
    }
    v7->_outerRadius = v11 * 0.5;
    uint64_t v12 = HUImageNamed(@"thermostat_gradient");
    gradientRingImage = v7->_gradientRingImage;
    v7->_gradientRingImage = (UIImage *)v12;

    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      v14 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
    }
    else
    {
      v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    }
    backgroundRingView = v7->_backgroundRingView;
    v7->_backgroundRingView = v14;

    v16 = [MEMORY[0x1E4F428B8] quaternarySystemFillColor];
    [(UIView *)v7->_backgroundRingView setBackgroundColor:v16];

    [(HUQuickControlRingSliderView *)v7 addSubview:v7->_backgroundRingView];
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      v17 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
    }
    else
    {
      v17 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    }
    edgesAndColoredSupplementaryValueLineView = v7->_edgesAndColoredSupplementaryValueLineView;
    v7->_edgesAndColoredSupplementaryValueLineView = v17;

    v19 = [MEMORY[0x1E4F428B8] quaternarySystemFillColor];
    [(UIView *)v7->_edgesAndColoredSupplementaryValueLineView setBackgroundColor:v19];

    [(HUQuickControlRingSliderView *)v7 addSubview:v7->_edgesAndColoredSupplementaryValueLineView];
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v7->_gradientRingImage];
    selectedRangeImageView = v7->_selectedRangeImageView;
    v7->_selectedRangeImageView = (UIImageView *)v20;

    [(UIImageView *)v7->_selectedRangeImageView setContentMode:1];
    [(UIImageView *)v7->_selectedRangeImageView setUserInteractionEnabled:0];
    [(HUQuickControlRingSliderView *)v7 addSubview:v7->_selectedRangeImageView];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v7->_gradientRingImage];
    selectedRangeImageViewForEdges = v7->_selectedRangeImageViewForEdges;
    v7->_selectedRangeImageViewForEdges = (UIImageView *)v22;

    [(UIImageView *)v7->_selectedRangeImageViewForEdges setContentMode:1];
    [(UIImageView *)v7->_selectedRangeImageViewForEdges setUserInteractionEnabled:0];
    [(HUQuickControlRingSliderView *)v7 addSubview:v7->_selectedRangeImageViewForEdges];
    double v24 = *(double *)&ringWidthToHanldeViewRatio * 35.0;
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, 4.0, 19.0);
    supplementaryValueMarkingView = v7->_supplementaryValueMarkingView;
    v7->_supplementaryValueMarkingView = (UIView *)v25;

    v27 = [(UIView *)v7->_supplementaryValueMarkingView layer];
    [v27 setCornerRadius:2.0];

    v28 = [MEMORY[0x1E4F428B8] systemBlackColor];
    v29 = [v28 colorWithAlphaComponent:0.2];
    [(UIView *)v7->_supplementaryValueMarkingView setBackgroundColor:v29];

    [(HUQuickControlRingSliderView *)v7 addSubview:v7->_supplementaryValueMarkingView];
    v30 = -[HUQuickControlRingSliderHandleView initWithFrame:style:]([HUQuickControlRingSliderHandleView alloc], "initWithFrame:style:", [v5 handleViewStyle], 0.0, 0.0, v24, v24);
    primaryHandleView = v7->_primaryHandleView;
    v7->_primaryHandleView = v30;

    [(HUQuickControlRingSliderView *)v7 addSubview:v7->_primaryHandleView];
    v32 = -[HUQuickControlRingSliderHandleView initWithFrame:style:]([HUQuickControlRingSliderHandleView alloc], "initWithFrame:style:", [v5 handleViewStyle], 0.0, 0.0, v24, v24);
    secondaryHandleView = v7->_secondaryHandleView;
    v7->_secondaryHandleView = v32;

    [(HUQuickControlRingSliderView *)v7 addSubview:v7->_secondaryHandleView];
    -[HUQuickControlRingSliderHandleView setHidden:](v7->_secondaryHandleView, "setHidden:", [v5 hasSecondaryValue] ^ 1);
    v34 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    if (([v5 isHandleViewVisible] & 1) == 0)
    {
      uint64_t v35 = [MEMORY[0x1E4F428B8] clearColor];

      v34 = (void *)v35;
    }
    [(HUQuickControlRingSliderHandleView *)v7->_primaryHandleView _setColor:v34];
    [(HUQuickControlRingSliderHandleView *)v7->_secondaryHandleView _setColor:v34];
    v36 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    supplementaryLabel = v7->_supplementaryLabel;
    v7->_supplementaryLabel = v36;

    [(UILabel *)v7->_supplementaryLabel setTextAlignment:1];
    [(UILabel *)v7->_supplementaryLabel setNumberOfLines:1];
    [(UILabel *)v7->_supplementaryLabel setAdjustsFontSizeToFitWidth:1];
    v38 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    [(UILabel *)v7->_supplementaryLabel setTextColor:v38];

    v39 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43870] variant:1024];
    [(UILabel *)v7->_supplementaryLabel setFont:v39];

    v40 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    primaryLabel = v7->_primaryLabel;
    v7->_primaryLabel = v40;

    [(UILabel *)v7->_primaryLabel setTextAlignment:1];
    [(UILabel *)v7->_primaryLabel setNumberOfLines:1];
    [(UILabel *)v7->_primaryLabel setAdjustsFontSizeToFitWidth:1];
    v42 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    labelsBackgroundView = v7->_labelsBackgroundView;
    v7->_labelsBackgroundView = v42;

    [(UIView *)v7->_labelsBackgroundView addSubview:v7->_supplementaryLabel];
    [(UIView *)v7->_labelsBackgroundView addSubview:v7->_primaryLabel];
    [(HUQuickControlRingSliderView *)v7 addSubview:v7->_labelsBackgroundView];
    uint64_t v44 = [objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v7 action:sel_handlePanGestureRecognizer_];
    longPressPanGestureRecognizer = v7->_longPressPanGestureRecognizer;
    v7->_longPressPanGestureRecognizer = (UILongPressGestureRecognizer *)v44;

    [(UILongPressGestureRecognizer *)v7->_longPressPanGestureRecognizer setMinimumPressDuration:0.0];
    [(UILongPressGestureRecognizer *)v7->_longPressPanGestureRecognizer setDelaysTouchesBegan:1];
    [(HUQuickControlRingSliderView *)v7 addGestureRecognizer:v7->_longPressPanGestureRecognizer];
    [(UILongPressGestureRecognizer *)v7->_longPressPanGestureRecognizer setDelegate:v7];
    [(HUQuickControlRingSliderView *)v7 _prepareForTapticFeedback];
  }
  return v7;
}

- (double)_getPrimarySliderValue
{
  [(HUQuickControlRingSliderView *)self modelRangeValue];
  return v2;
}

- (double)_getSecondarySliderValue
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(HUQuickControlRingSliderView *)self profile];
  char v4 = [v3 hasSecondaryValue];

  if ((v4 & 1) == 0)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      double v8 = "-[HUQuickControlRingSliderView _getSecondarySliderValue]";
      _os_log_debug_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEBUG, "(%s) requesting secondary slider value when hasSecondaryValue is NO", (uint8_t *)&v7, 0xCu);
    }
  }
  [(HUQuickControlRingSliderView *)self modelRangeValue];
  return result;
}

- (id)value
{
  v3 = [(HUQuickControlRingSliderView *)self profile];
  char v4 = [v3 hasSecondaryValue];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F69368];
    [(HUQuickControlRingSliderView *)self modelRangeValue];
    objc_msgSend(v5, "rangeWithFloatRange:");
  }
  else
  {
    int v7 = NSNumber;
    [(HUQuickControlRingSliderView *)self modelRangeValue];
    [v7 numberWithDouble:v8];
  v6 = };

  return v6;
}

- (void)setValue:(id)a3
{
  id v22 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v4 = v22;
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    if ([v6 type] == 1)
    {
      [v6 floatRangeValue];
      double v8 = v7;
      [v6 floatRangeValue];
      if (v8 < v9) {
        double v8 = v9;
      }
      [v6 floatRangeValue];
      double v11 = v10;
      [v6 floatRangeValue];
      if (v11 >= v12) {
        double v11 = v12;
      }
      [(HUQuickControlRingSliderView *)self _getClosestMarkingValueToValue:v8];
      double v14 = v13;
      [(HUQuickControlRingSliderView *)self _getClosestMarkingValueToValue:v11];
      double v16 = v15;
    }
    else
    {
      v18 = [v6 midValue];
      [v18 doubleValue];
      double v20 = v19;

      [(HUQuickControlRingSliderView *)self _getClosestMarkingValueToValue:v20];
      double v14 = v21;
      double v16 = 0.0;
    }
  }
  else
  {
    [v22 doubleValue];
    -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
    double v14 = v17;
    double v16 = 0.0;
  }
  -[HUQuickControlRingSliderView setModelRangeValue:](self, "setModelRangeValue:", v16, v14);
  [(HUQuickControlRingSliderView *)self _updateRingViewAndHandleViews];
}

- (id)secondaryValue
{
  double v2 = NSNumber;
  [(HUQuickControlRingSliderView *)self modelRangeValue];

  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (void)setSecondaryValue:(id)a3
{
  id v13 = a3;
  if (v13)
  {
    objc_opt_class();
    id v4 = v13;
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    [v6 doubleValue];
    double v8 = v7;
    [(HUQuickControlRingSliderView *)self modelRangeValue];
    if (v8 >= v9) {
      double v8 = v9;
    }
    [v6 doubleValue];
    double v11 = v10;
    [(HUQuickControlRingSliderView *)self modelRangeValue];
    if (v11 >= v12) {
      double v12 = v11;
    }
    -[HUQuickControlRingSliderView setModelRangeValue:](self, "setModelRangeValue:", v8, v12);
  }
  else
  {
    [(HUQuickControlRingSliderView *)self modelRangeValue];
    [(HUQuickControlRingSliderView *)self setModelRangeValue:0.0];
  }
}

- (void)setProfile:(id)a3
{
  id v4 = (HUQuickControlRingSliderViewProfile *)a3;
  unint64_t v5 = [(HUQuickControlViewProfile *)self->_profile controlSize];
  uint64_t v6 = [(HUQuickControlViewProfile *)v4 controlSize];
  profile = self->_profile;
  self->_profile = v4;

  [(HUQuickControlRingSliderView *)self setNeedsLayout];
  if (v5 != v6)
  {
    [(HUQuickControlRingSliderView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlRingSliderView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      [(HUQuickControlRingSliderView *)self setAlpha:1.0];
      double v7 = [(HUQuickControlRingSliderView *)self primaryHandleView];
      objc_msgSend(v7, "setHidden:", -[HUQuickControlRingSliderView showOffState](self, "showOffState"));

      double v8 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
      double v9 = [(HUQuickControlRingSliderView *)self profile];
      if ([v9 hasSecondaryValue]) {
        BOOL v10 = [(HUQuickControlRingSliderView *)self showOffState];
      }
      else {
        BOOL v10 = 1;
      }
      [v8 setHidden:v10];

      double v11 = [(HUQuickControlRingSliderView *)self labelsBackgroundView];
      [v11 setHidden:0];

      [(HUQuickControlRingSliderView *)self _updateSupplementaryValueMarkingView];
    }
  }
  else
  {
    [(HUQuickControlRingSliderView *)self setAlpha:0.5];
    id v4 = [(HUQuickControlRingSliderView *)self primaryHandleView];
    [v4 setHidden:1];

    unint64_t v5 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
    [v5 setHidden:1];

    uint64_t v6 = [(HUQuickControlRingSliderView *)self labelsBackgroundView];
    [v6 setHidden:1];

    id v12 = [(HUQuickControlRingSliderView *)self supplementaryValueMarkingView];
    [v12 setHidden:1];
  }
}

- (CGSize)intrinsicContentSize
{
  v3 = [(HUQuickControlRingSliderView *)self profile];
  id v4 = -[HUQuickControlRingSliderView intrinsicSizeDescriptorForControlSize:](self, "intrinsicSizeDescriptorForControlSize:", [v3 controlSize]);
  [v4 intrinsicSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  v3 = HUQuickControlRingSliderMetricsForControlSize(a3);
  id v4 = [v3 sizeDescriptor];

  return v4;
}

- (void)_updateModelValueWithNewPrimarySliderValue:(double)a3 roundValue:(BOOL)a4 notifyInteractionDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(HUQuickControlRingSliderView *)self modelRangeValue];

  -[HUQuickControlRingSliderView _updateModelValue:roundValue:notifyInteractionDelegate:](self, "_updateModelValue:roundValue:notifyInteractionDelegate:", v6, v5);
}

- (void)_updateModelValueWithNewSecondarySliderValue:(double)a3 roundValue:(BOOL)a4 notifyInteractionDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v9 = [(HUQuickControlRingSliderView *)self profile];
  char v10 = [v9 hasSecondaryValue];

  if ((v10 & 1) == 0)
  {
    double v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315138;
      id v13 = "-[HUQuickControlRingSliderView _updateModelValueWithNewSecondarySliderValue:roundValue:notifyInteractionDelegate:]";
      _os_log_debug_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEBUG, "(%s) This method is being called when hasSecondaryValue is NO. 0 will be used instead.", (uint8_t *)&v12, 0xCu);
    }
  }
  [(HUQuickControlRingSliderView *)self modelRangeValue];
  [(HUQuickControlRingSliderView *)self _updateModelValue:v6 roundValue:v5 notifyInteractionDelegate:a3];
}

- (void)_updateModelValue:(id)a3 roundValue:(BOOL)a4 notifyInteractionDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  -[HUQuickControlRingSliderView setModelRangeValue:](self, "setModelRangeValue:", a4, a3.var0, a3.var1);
  if (v5 && [(HUQuickControlRingSliderView *)self isUserInteractionActive])
  {
    id v8 = [(HUQuickControlRingSliderView *)self interactionDelegate];
    double v7 = [(HUQuickControlRingSliderView *)self value];
    [v8 controlView:self valueDidChange:v7];
  }
}

- (void)setSupplementaryValue:(double)a3
{
  self->_supplementaryValue = a3;
  [(HUQuickControlRingSliderView *)self _updateSupplementaryValueMarkingView];
}

- (void)layoutSubviews
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)HUQuickControlRingSliderView;
  [(HUQuickControlRingSliderView *)&v36 layoutSubviews];
  [(HUQuickControlRingSliderView *)self frame];
  double v4 = v3;
  [(HUQuickControlRingSliderView *)self frame];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  [(HUQuickControlRingSliderView *)self setOuterRadius:v6 * 0.5];
  double v7 = [(HUQuickControlRingSliderView *)self gradationMarkingViews];
  uint64_t v8 = [v7 count];
  double v9 = [(HUQuickControlRingSliderView *)self profile];
  char v10 = [v9 gradationMarkingValues];
  uint64_t v11 = [v10 count];

  if (v8 != v11) {
    [(HUQuickControlRingSliderView *)self _redrawGradationMarkingViews];
  }
  [(HUQuickControlRingSliderView *)self _updateRingViewAndHandleViews];
  [(HUQuickControlRingSliderView *)self _updateSupplementaryValueMarkingView];
  [(HUQuickControlRingSliderView *)self _updateUIForReachabilityState:[(HUQuickControlRingSliderView *)self reachabilityState]];
  if ([(HUQuickControlRingSliderView *)self showOffState]
    || ![(HUQuickControlRingSliderView *)self reachabilityState]
    || [(HUQuickControlRingSliderView *)self reachabilityState] == 1)
  {
    int v12 = [(HUQuickControlRingSliderView *)self selectedRangeImageView];
    [(HUQuickControlRingSliderView *)self bringSubviewToFront:v12];

    id v13 = [(HUQuickControlRingSliderView *)self selectedRangeImageViewForEdges];
    [(HUQuickControlRingSliderView *)self bringSubviewToFront:v13];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v14 = [(HUQuickControlRingSliderView *)self gradationMarkingViews];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          [(HUQuickControlRingSliderView *)self bringSubviewToFront:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v16);
    }
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v19 = [(HUQuickControlRingSliderView *)self gradationMarkingViews];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          [(HUQuickControlRingSliderView *)self bringSubviewToFront:*(void *)(*((void *)&v28 + 1) + 8 * j)];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v21);
    }

    double v24 = [(HUQuickControlRingSliderView *)self selectedRangeImageView];
    [(HUQuickControlRingSliderView *)self bringSubviewToFront:v24];

    uint64_t v14 = [(HUQuickControlRingSliderView *)self selectedRangeImageViewForEdges];
    [(HUQuickControlRingSliderView *)self bringSubviewToFront:v14];
  }

  uint64_t v25 = [(HUQuickControlRingSliderView *)self supplementaryValueMarkingView];
  [(HUQuickControlRingSliderView *)self bringSubviewToFront:v25];

  v26 = [(HUQuickControlRingSliderView *)self primaryHandleView];
  [(HUQuickControlRingSliderView *)self bringSubviewToFront:v26];

  v27 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
  [(HUQuickControlRingSliderView *)self bringSubviewToFront:v27];
}

- (void)_redrawGradationMarkingViews
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  double v3 = [(HUQuickControlRingSliderView *)self gradationMarkingViews];
  double v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        [v9 removeFromSuperview];
        char v10 = [(HUQuickControlRingSliderView *)self gradationMarkingViews];
        [v10 removeObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v6);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v11 = [(HUQuickControlRingSliderView *)self profile];
  int v12 = [v11 gradationMarkingValues];

  obuint64_t j = v12;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    char v15 = 0;
    uint64_t v16 = *(void *)v46;
    long long v40 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v41 = *MEMORY[0x1E4F1DAB8];
    long long v39 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        double v19 = [(HUQuickControlRingSliderView *)self profile];
        unint64_t v20 = [v19 gradationMarkingViewStyle];

        if (v20 < 2)
        {
          double v22 = 2.0;
          double v21 = 19.0;
        }
        else
        {
          if (v20 == 2)
          {
            if ((v15 + (_BYTE)j)) {
              double v21 = 6.33333333;
            }
            else {
              double v21 = 19.0;
            }
          }
          else
          {
            double v21 = 0.0;
            double v22 = 0.0;
            if (v20 != 3) {
              goto LABEL_24;
            }
            if ((v15 + (_BYTE)j)) {
              double v21 = 19.0;
            }
            else {
              double v21 = 6.33333333;
            }
          }
          double v22 = 2.0;
        }
LABEL_24:
        v23 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
        objc_msgSend(v23, "setFrame:", 0.0, 0.0, v22, v21);
        double v24 = [v23 layer];
        [v24 setCornerRadius:1.0];

        [v23 setClipsToBounds:1];
        if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
        {
          uint64_t v25 = [MEMORY[0x1E4F42FE8] controlCenterKeyLineOnLightVibrancyEffect];
          [v23 setEffect:v25];
        }
        v26 = [(HUQuickControlRingSliderView *)self traitCollection];
        if ([v26 userInterfaceStyle] == 1)
        {

LABEL_29:
          long long v28 = [MEMORY[0x1E4F428B8] systemBlackColor];
          long long v29 = v28;
          double v30 = 0.1;
          goto LABEL_34;
        }
        BOOL v27 = [(HUQuickControlRingSliderView *)self showOffState];

        if (v27) {
          goto LABEL_29;
        }
        if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]) {
          double v31 = 0.3;
        }
        else {
          double v31 = 0.1;
        }
        long long v28 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
        long long v29 = v28;
        double v30 = v31;
LABEL_34:
        long long v32 = [v28 colorWithAlphaComponent:v30];
        [v23 setBackgroundColor:v32];

        [v18 floatValue];
        [(HUQuickControlRingSliderView *)self _getHandleCenterOnRingForValue:v33];
        objc_msgSend(v23, "setCenter:");
        [v18 floatValue];
        [(HUQuickControlRingSliderView *)self _getAngleFrom12OClockForValue:v34];
        *(_OWORD *)&v43.a = v41;
        *(_OWORD *)&v43.c = v40;
        *(_OWORD *)&v43.tx = v39;
        CGAffineTransformRotate(&v44, &v43, v35);
        CGAffineTransform v42 = v44;
        [v23 setTransform:&v42];
        [(HUQuickControlRingSliderView *)self addSubview:v23];
        objc_super v36 = [(HUQuickControlRingSliderView *)self gradationMarkingViews];
        [v36 addObject:v23];

        v37 = [(HUQuickControlRingSliderView *)self markingValuesAndViewsDictionary];
        [v37 setObject:v23 forKey:v18];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      v15 += j;
    }
    while (v14);
  }
}

- (void)_updateSupplementaryValueMarkingView
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  double v3 = [(HUQuickControlRingSliderView *)self profile];
  if (![v3 shouldShowSupplementaryValue]
    || ([(HUQuickControlRingSliderView *)self supplementaryValue], v4 > 1.0))
  {

LABEL_4:
    id v30 = [(HUQuickControlRingSliderView *)self supplementaryValueMarkingView];
    [v30 setHidden:1];

    return;
  }
  BOOL v5 = [(HUQuickControlRingSliderView *)self showOffState];

  if (v5) {
    goto LABEL_4;
  }
  [(HUQuickControlRingSliderView *)self supplementaryValue];
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:");
  CGFloat v7 = v6;
  -[HUQuickControlRingSliderView _getPointForAngleFrom12OClock:](self, "_getPointForAngleFrom12OClock:");
  uint64_t v8 = [(HUQuickControlRingSliderView *)self gradationMarkingViews];
  double v9 = [v8 firstObject];

  char v10 = [(HUQuickControlRingSliderView *)self gradationMarkingViews];
  uint64_t v11 = [v10 firstObject];
  [v11 center];
  UIDistanceBetweenPoints();
  double v13 = v12;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v14 = [(HUQuickControlRingSliderView *)self gradationMarkingViews];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v19 center];
        UIDistanceBetweenPoints();
        if (v13 > v20)
        {
          double v21 = v20;
          id v22 = v19;

          double v13 = v21;
          double v9 = v22;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v16);
  }

  if (v9)
  {
    [v9 center];
    double v24 = v23;
    double v26 = v25;
    BOOL v27 = [(HUQuickControlRingSliderView *)self supplementaryValueMarkingView];
    objc_msgSend(v27, "setCenter:", v24, v26);
  }
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v32.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v32.c = v28;
  *(_OWORD *)&v32.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformRotate(&v33, &v32, v7);
  long long v29 = [(HUQuickControlRingSliderView *)self supplementaryValueMarkingView];
  CGAffineTransform v31 = v33;
  [v29 setTransform:&v31];

  [(HUQuickControlRingSliderView *)self _updateSupplementaryValueMarkingViewColor];
}

- (void)_updateSupplementaryValueMarkingViewColor
{
  if ([(HUQuickControlRingSliderView *)self showOffState]) {
    goto LABEL_10;
  }
  double v3 = [(HUQuickControlRingSliderView *)self profile];
  if (([v3 shouldShowSupplementaryValue] & 1) == 0)
  {

    goto LABEL_10;
  }
  [(HUQuickControlRingSliderView *)self supplementaryValue];
  double v5 = v4;

  if (v5 > 1.0)
  {
LABEL_10:
    double v21 = [(HUQuickControlRingSliderView *)self supplementaryValueMarkingView];
    id v24 = v21;
    goto LABEL_11;
  }
  [(HUQuickControlRingSliderView *)self _getEdgeRectSize];
  double v7 = v6;
  [(HUQuickControlRingSliderView *)self _getMiddleCircleRadius];
  double v9 = v7 / v8;
  [(HUQuickControlRingSliderView *)self _getMaxAngleFrom12OClock];
  double v11 = v10;
  [(HUQuickControlRingSliderView *)self _getMinAngleFrom12OClock];
  double v13 = v9 / (v11 - v12);
  [(HUQuickControlRingSliderView *)self _getPrimarySliderValue];
  double v15 = v14;
  [(HUQuickControlRingSliderView *)self _getSecondarySliderValue];
  double v17 = v16 - v13;
  [(HUQuickControlRingSliderView *)self supplementaryValue];
  -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
  double v19 = v18;
  double v20 = v15 + v13;
  double v21 = [(HUQuickControlRingSliderView *)self supplementaryValueMarkingView];
  BOOL v22 = v19 < v17 || v19 > v20;
  id v24 = v21;
  if (!v22)
  {
    uint64_t v23 = 0;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v23 = 1;
LABEL_12:
  [v21 setHidden:v23];
}

- (void)_updateRingViewAndHandleViews
{
  double v3 = [(HUQuickControlRingSliderView *)self backgroundRingView];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(HUQuickControlRingSliderView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [(HUQuickControlRingSliderView *)self backgroundRingView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  [(HUQuickControlRingSliderView *)self bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  long long v29 = [(HUQuickControlRingSliderView *)self edgesAndColoredSupplementaryValueLineView];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  [(HUQuickControlRingSliderView *)self bounds];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  v38 = [(HUQuickControlRingSliderView *)self selectedRangeImageView];
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  [(HUQuickControlRingSliderView *)self bounds];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  long long v47 = [(HUQuickControlRingSliderView *)self selectedRangeImageViewForEdges];
  objc_msgSend(v47, "setFrame:", v40, v42, v44, v46);

  long long v48 = [(HUQuickControlRingSliderView *)self backgroundRingView];
  [v48 frame];
  v66.origin.x = v49;
  v66.origin.y = v50;
  v66.size.width = v51;
  v66.size.height = v52;
  v65.origin.x = v5;
  v65.origin.y = v7;
  v65.size.width = v9;
  v65.size.height = v11;
  BOOL v53 = CGRectEqualToRect(v65, v66);

  if (!v53 || ![(HUQuickControlRingSliderView *)self didMaskBackgroundImageView]) {
    [(HUQuickControlRingSliderView *)self _maskBackgroundImageViewToRingShape];
  }
  [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
  double v55 = v54;
  double v57 = v56;
  v58 = [(HUQuickControlRingSliderView *)self labelsBackgroundView];
  objc_msgSend(v58, "setCenter:", v55, v57);

  [(HUQuickControlRingSliderView *)self _updatePrimaryHandleViewPositionToSliderValue];
  v59 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
  v60 = [(HUQuickControlRingSliderView *)self profile];
  if ([v60 hasSecondaryValue]) {
    BOOL v61 = [(HUQuickControlRingSliderView *)self showOffState];
  }
  else {
    BOOL v61 = 1;
  }
  [v59 setHidden:v61];

  v62 = [(HUQuickControlRingSliderView *)self profile];
  int v63 = [v62 hasSecondaryValue];

  if (v63) {
    [(HUQuickControlRingSliderView *)self _updateSecondaryHandleViewPositionToSliderValue];
  }
  [(HUQuickControlRingSliderView *)self _updateSelectedRangeImageView];

  [(HUQuickControlRingSliderView *)self _updateTransform];
}

- (void)_updateTransform
{
  double v3 = [(HUQuickControlRingSliderView *)self profile];
  uint64_t v4 = [v3 style];

  if (v4)
  {
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v12[0] = *MEMORY[0x1E4F1DAB8];
    long long v9 = v12[0];
    v12[1] = v10;
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v8 = v13;
    [(HUQuickControlRingSliderView *)self setTransform:v12];
    CGFloat v5 = [(HUQuickControlRingSliderView *)self labelsBackgroundView];
    double v6 = v5;
    v11[0] = v9;
    v11[1] = v10;
    v11[2] = v8;
    CGFloat v7 = (CGAffineTransform *)v11;
  }
  else
  {
    CGAffineTransformMakeScale(&v17, -1.0, -1.0);
    CGAffineTransform v16 = v17;
    [(HUQuickControlRingSliderView *)self setTransform:&v16];
    CGAffineTransformMakeScale(&v15, -1.0, -1.0);
    CGFloat v5 = [(HUQuickControlRingSliderView *)self labelsBackgroundView];
    double v6 = v5;
    CGAffineTransform v14 = v15;
    CGFloat v7 = &v14;
  }
  [v5 setTransform:v7];
}

- (void)_updatePrimaryHandleViewPositionToSliderValue
{
  [(HUQuickControlRingSliderView *)self _getPrimarySliderValue];
  double v4 = v3;
  -[HUQuickControlRingSliderView _getHandleCenterOnRingForValue:](self, "_getHandleCenterOnRingForValue:");
  double v6 = v5;
  double v8 = v7;
  long long v9 = [(HUQuickControlRingSliderView *)self primaryHandleView];
  objc_msgSend(v9, "setCenter:", v6, v8);

  [(HUQuickControlRingSliderView *)self _getAngleFrom12OClockForValue:v4];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v14.c = v10;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformRotate(&v15, &v14, v11);
  double v12 = [(HUQuickControlRingSliderView *)self primaryHandleView];
  CGAffineTransform v13 = v15;
  [v12 setTransform:&v13];
}

- (void)_updateSecondaryHandleViewPositionToSliderValue
{
  double v3 = [(HUQuickControlRingSliderView *)self profile];
  char v4 = [v3 hasSecondaryValue];

  if ((v4 & 1) == 0) {
    NSLog(&cfstr_SProfileHassec.isa, "-[HUQuickControlRingSliderView _updateSecondaryHandleViewPositionToSliderValue]");
  }
  [(HUQuickControlRingSliderView *)self _getSecondarySliderValue];
  double v6 = v5;
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:");
  CGFloat v8 = v7;
  [(HUQuickControlRingSliderView *)self _getHandleCenterOnRingForValue:v6];
  double v10 = v9;
  double v12 = v11;
  CGAffineTransform v13 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
  objc_msgSend(v13, "setCenter:", v10, v12);

  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v17.c = v14;
  *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformRotate(&v18, &v17, v8);
  CGAffineTransform v15 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
  CGAffineTransform v16 = v18;
  [v15 setTransform:&v16];
}

- (void)_maskBackgroundImageViewToRingShape
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  [(HUQuickControlRingSliderView *)self setDidMaskBackgroundImageView:1];
  [(HUQuickControlRingSliderView *)self _getMinAngleFrom12OClock];
  *(float *)&double v3 = v3 + 4.71238898;
  double v4 = fmodf(*(float *)&v3, 6.2832);
  [(HUQuickControlRingSliderView *)self _getMaxAngleFrom12OClock];
  *(float *)&double v5 = v5 + 4.71238898;
  double v6 = fmodf(*(float *)&v5, 6.2832);
  double v7 = (void *)MEMORY[0x1E4F427D0];
  [(HUQuickControlRingSliderView *)self _getMiddleCircleRadius];
  double v9 = objc_msgSend(v7, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v8, v4, v6);
  double v10 = [MEMORY[0x1E4F39C88] layer];
  id v11 = v9;
  objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
  id v12 = [MEMORY[0x1E4F428B8] clearColor];
  objc_msgSend(v10, "setFillColor:", objc_msgSend(v12, "CGColor"));

  id v13 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  [v10 setLineWidth:35.0];
  [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
  objc_msgSend(v10, "setPosition:");
  long long v14 = [(HUQuickControlRingSliderView *)self backgroundRingView];
  CGAffineTransform v15 = [v14 layer];
  [v15 setMask:v10];

  [(HUQuickControlRingSliderView *)self _getInnerCircleRadius];
  double v17 = v16;
  CGAffineTransform v18 = [(HUQuickControlRingSliderView *)self profile];
  double v19 = [v18 gradationMarkingValues];
  double v20 = [v19 firstObject];
  [v20 floatValue];
  double v22 = v21;

  double v23 = [(HUQuickControlRingSliderView *)self profile];
  double v24 = [v23 gradationMarkingValues];
  double v25 = [v24 lastObject];
  [v25 floatValue];
  double v27 = v26;

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  double v28 = [(HUQuickControlRingSliderView *)self profile];
  long long v29 = [v28 gradationMarkingValues];

  uint64_t v30 = [v29 countByEnumeratingWithState:&v71 objects:v75 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v72 != v32) {
          objc_enumerationMutation(v29);
        }
        double v34 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        [v34 floatValue];
        if (v22 > v35)
        {
          [v34 floatValue];
          double v22 = v36;
        }
        [v34 floatValue];
        if (v27 < v37)
        {
          [v34 floatValue];
          double v27 = v38;
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v71 objects:v75 count:16];
    }
    while (v31);
  }

  [(HUQuickControlRingSliderView *)self _getAngleFrom12OClockForValue:v22];
  *(float *)&double v39 = v39 + 4.71238898;
  double v61 = fmodf(*(float *)&v39, 6.2832);
  [(HUQuickControlRingSliderView *)self _getEdgeRectSize];
  double v41 = v40;
  double v62 = v40;
  double v43 = v42;
  [(HUQuickControlRingSliderView *)self _getStartAngleEdgeLocationShiftForBackgroundRing:1];
  double v45 = v44;
  [(HUQuickControlRingSliderView *)self outerRadius];
  double v47 = v61 - v43 / v46;
  [(HUQuickControlRingSliderView *)self outerRadius];
  __double2 v49 = __sincos_stret(v47 + -2.0 / v48 - v45);
  CGFloat v50 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, v17 * v49.__cosval, v17 * v49.__sinval, v41, v43, 8.0, 8.0);
  CGAffineTransformMakeTranslation(&v70, -(v17 * v49.__cosval), -(v17 * v49.__sinval));
  [v50 applyTransform:&v70];
  CGAffineTransformMakeScale(&v68, -1.0, -1.0);
  CGAffineTransformRotate(&v69, &v68, v61 + 3.14159265);
  [v50 applyTransform:&v69];
  CGAffineTransformMakeTranslation(&v67, v17 * v49.__cosval, v17 * v49.__sinval);
  [v50 applyTransform:&v67];
  [(HUQuickControlRingSliderView *)self _getAngleFrom12OClockForValue:v27];
  *(float *)&double v51 = v51 + 4.71238898;
  double v52 = fmodf(*(float *)&v51, 6.2832);
  __double2 v53 = __sincos_stret(v52);
  double v54 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12, v17 * v53.__cosval, v17 * v53.__sinval, v62, v43, 8.0, 8.0);
  CGAffineTransformMakeTranslation(&v66, -(v17 * v53.__cosval), -(v17 * v53.__sinval));
  [v54 applyTransform:&v66];
  long long v55 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v64.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v64.c = v55;
  *(_OWORD *)&v64.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformRotate(&v65, &v64, v52);
  [v54 applyTransform:&v65];
  CGAffineTransformMakeTranslation(&v63, v17 * v53.__cosval, v17 * v53.__sinval);
  [v54 applyTransform:&v63];
  [v50 appendPath:v54];
  double v56 = [MEMORY[0x1E4F39C88] layer];
  id v57 = v50;
  objc_msgSend(v56, "setPath:", objc_msgSend(v57, "CGPath"));
  id v58 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  objc_msgSend(v56, "setFillColor:", objc_msgSend(v58, "CGColor"));

  [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
  objc_msgSend(v56, "setPosition:");
  v59 = [(HUQuickControlRingSliderView *)self edgesAndColoredSupplementaryValueLineView];
  v60 = [v59 layer];
  [v60 setMask:v56];
}

- (void)_updateUIWithTouchAtPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v8 = [(HUQuickControlRingSliderView *)self profile];
  char v9 = [v8 hasSecondaryValue];

  if (v9)
  {
    if ([(HUQuickControlRingSliderView *)self isDraggingPrimaryHandleView])
    {
      -[HUQuickControlRingSliderView _updateUIForThresholdModeForPrimaryHandleViewWithTouchPoint:didTouchBegin:](self, "_updateUIForThresholdModeForPrimaryHandleViewWithTouchPoint:didTouchBegin:", v4, x, y);
    }
    else if ([(HUQuickControlRingSliderView *)self isDraggingSecondaryHandleView])
    {
      -[HUQuickControlRingSliderView _updateUIForThresholdModeForSecondaryHandleViewWithTouchPoint:didTouchBegin:](self, "_updateUIForThresholdModeForSecondaryHandleViewWithTouchPoint:didTouchBegin:", v4, x, y);
    }
  }
  else
  {
    [(HUQuickControlRingSliderView *)self _getMinimumMarkingValue];
    double v11 = v10;
    [(HUQuickControlRingSliderView *)self _getMaximumMarkingValue];
    double v13 = v12;
    long long v14 = [(HUQuickControlRingSliderView *)self primaryHandleView];
    -[HUQuickControlRingSliderView _updateUIForTouchPoint:didTouchBegin:forHandleView:minValue:maxValue:](self, "_updateUIForTouchPoint:didTouchBegin:forHandleView:minValue:maxValue:", v4, v14, x, y, v11, v13);
  }

  [(HUQuickControlRingSliderView *)self _updateSelectedRangeImageView];
}

- (void)_updateUIForTouchPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4 forHandleView:(id)a5 minValue:(double)a6 maxValue:(double)a7
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  [(HUQuickControlRingSliderView *)self _getAngleFrom12OClockForValue:a6];
  double v14 = v13;
  double v62 = a7;
  [(HUQuickControlRingSliderView *)self _getAngleFrom12OClockForValue:a7];
  double v16 = v15;
  -[HUQuickControlRingSliderView _getClosestPointOnMiddleCircleOfRing:](self, "_getClosestPointOnMiddleCircleOfRing:", x, y);
  double v18 = v17;
  double v20 = v19;
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:");
  double v22 = v21;
  unint64_t v23 = -[HUQuickControlRingSliderView _getRingSliderAreaForAngleFrom12Oclock:minAngle:maxAngle:](self, "_getRingSliderAreaForAngleFrom12Oclock:minAngle:maxAngle:");
  [v12 center];
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:");
  unint64_t v24 = -[HUQuickControlRingSliderView _getRingSliderAreaForAngleFrom12Oclock:minAngle:maxAngle:](self, "_getRingSliderAreaForAngleFrom12Oclock:minAngle:maxAngle:");
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  double v25 = [(HUQuickControlRingSliderView *)self gradationMarkingViews];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    double v28 = 0;
    uint64_t v29 = *(void *)v73;
    double v30 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v73 != v29) {
          objc_enumerationMutation(v25);
        }
        uint64_t v32 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        [v32 center];
        UIDistanceBetweenPoints();
        if (v30 > v33)
        {
          double v34 = v33;
          id v35 = v32;

          double v30 = v34;
          double v28 = v35;
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v27);

    BOOL v36 = v23 == 2;
    if (v24 == 3 && v23 == 2)
    {
      if (!v28)
      {
        double v37 = v18;
        double v38 = v20;
        goto LABEL_36;
      }
      goto LABEL_13;
    }
    if (v24 == 2 && v23 == 2)
    {
      if (v28)
      {
LABEL_13:
        [v28 center];
LABEL_36:
        objc_msgSend(v12, "setCenter:", v37, v38);
        goto LABEL_37;
      }
LABEL_34:
      double v37 = v18;
      double v38 = v20;
      goto LABEL_36;
    }
    if (v24 != 2) {
      goto LABEL_29;
    }
LABEL_17:
    if ([(HUQuickControlRingSliderView *)self prevTouchArea] == 2 && (v23 == 1 || v22 < v14))
    {
      double v39 = self;
      double v40 = v14;
    }
    else
    {
      if ([(HUQuickControlRingSliderView *)self prevTouchArea] != 2 || v23 != 3 && v22 <= v16) {
        goto LABEL_37;
      }
      double v39 = self;
      double v40 = v16;
    }
    [(HUQuickControlRingSliderView *)v39 _getPointForAngleFrom12OClock:v40];
    goto LABEL_36;
  }

  double v28 = 0;
  BOOL v36 = v23 == 2;
  if ((v24 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    double v37 = v18;
    double v38 = v20;
    if (v23 == 2) {
      goto LABEL_36;
    }
  }
  if (v24 == 2) {
    goto LABEL_17;
  }
LABEL_29:
  if (v24 == 1 && v36)
  {
    if (v28) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_37:
  double v42 = [(HUQuickControlRingSliderView *)self profile];
  uint64_t v43 = [v42 handleViewStyle];

  if (v43 == 2)
  {
    [v12 center];
    -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:");
    long long v44 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v70.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v70.c = v44;
    *(_OWORD *)&v70.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformRotate(&v71, &v70, v45);
    CGAffineTransform v69 = v71;
    [v12 setTransform:&v69];
  }
  [(HUQuickControlRingSliderView *)self setPrevTouchArea:v23];
  [(HUQuickControlRingSliderView *)self _animateToEnlargeHandleView:v12];
  -[HUQuickControlRingSliderView _getSliderValueForPoint:](self, "_getSliderValueForPoint:", v18, v20);
  double v47 = v46;
  [(HUQuickControlRingSliderView *)self prevSliderValue];
  -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
  [(HUQuickControlRingSliderView *)self _getClosestMarkingValueToValue:v47];
  if (NACGFloatLessThanFloat())
  {
    uint64_t v48 = 1;
  }
  else if (NACGFloatEqualToFloat())
  {
    uint64_t v48 = 3;
  }
  else if (NACGFloatLessThanFloat())
  {
    uint64_t v48 = 2;
  }
  else
  {
    uint64_t v48 = 0;
  }
  if ([(HUQuickControlRingSliderView *)self _isIncreasingOrDecreasing:[(HUQuickControlRingSliderView *)self prevSlidingDirection]]&& [(HUQuickControlRingSliderView *)self _isIncreasingOrDecreasing:v48]&& [(HUQuickControlRingSliderView *)self prevSlidingDirection] != v48)
  {
    __double2 v49 = [(HUQuickControlRingSliderView *)self currentDirectionTapticValues];
    [v49 removeAllObjects];
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  CGFloat v50 = [(HUQuickControlRingSliderView *)self profile];
  double v51 = [v50 gradationMarkingValues];

  id v52 = (id)[v51 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v52)
  {
    uint64_t v53 = *(void *)v66;
    while (2)
    {
      for (uint64_t j = 0; j != v52; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v66 != v53) {
          objc_enumerationMutation(v51);
        }
        long long v55 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
        [v55 floatValue];
        if (v56 + -0.005 < v47)
        {
          [v55 floatValue];
          if (v47 < v57 + 0.005)
          {
            id v52 = v55;
            goto LABEL_61;
          }
        }
      }
      id v52 = (id)[v51 countByEnumeratingWithState:&v65 objects:v76 count:16];
      if (v52) {
        continue;
      }
      break;
    }
  }
LABEL_61:

  if (v52 && v47 >= a6 && v47 <= v62)
  {
    id v58 = [(HUQuickControlRingSliderView *)self currentDirectionTapticValues];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __101__HUQuickControlRingSliderView__updateUIForTouchPoint_didTouchBegin_forHandleView_minValue_maxValue___block_invoke;
    v63[3] = &unk_1E638C658;
    id v59 = v52;
    id v64 = v59;
    char v60 = objc_msgSend(v58, "na_any:", v63);

    if ((v60 & 1) == 0)
    {
      [(HUQuickControlRingSliderView *)self _prepareForTapticFeedback];
      [(HUQuickControlRingSliderView *)self _actuateSelectionTapticFeedback];
      double v61 = [(HUQuickControlRingSliderView *)self currentDirectionTapticValues];
      [v61 addObject:v59];
    }
  }
  [(HUQuickControlRingSliderView *)self setPrevSliderValue:v47];
  if ([(HUQuickControlRingSliderView *)self _isIncreasingOrDecreasing:v48]) {
    [(HUQuickControlRingSliderView *)self setPrevSlidingDirection:v48];
  }
}

uint64_t __101__HUQuickControlRingSliderView__updateUIForTouchPoint_didTouchBegin_forHandleView_minValue_maxValue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToNumber:*(void *)(a1 + 32)];
}

- (BOOL)_isIncreasingOrDecreasing:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (void)_updateUIForThresholdModeForPrimaryHandleViewWithTouchPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  double v8 = [(HUQuickControlRingSliderView *)self profile];
  char v9 = [v8 hasSecondaryValue];

  if (v9)
  {
    [(HUQuickControlRingSliderView *)self _getSecondarySliderValue];
    double v11 = v10;
    id v12 = [(HUQuickControlRingSliderView *)self profile];
    uint64_t v13 = [v12 handleViewStyle];

    if (v13 == 1)
    {
      [(HUQuickControlRingSliderView *)self _getSecondarySliderValue];
      double v15 = v14;
      double v16 = [(HUQuickControlRingSliderView *)self primaryHandleView];
      [v16 outerRadius];
      double v18 = v17 * 3.14159265;
      [(HUQuickControlRingSliderView *)self outerRadius];
      double v11 = v15 + v18 / (v19 * 3.14159265 + v19 * 3.14159265);
    }
    else
    {
      double v21 = [(HUQuickControlRingSliderView *)self profile];
      uint64_t v22 = [v21 handleViewStyle];

      if (v22 == 2)
      {
        [(HUQuickControlRingSliderView *)self modelRangeValue];
        -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
        double v24 = v23;
        [(HUQuickControlRingSliderView *)self modelRangeValue];
        [(HUQuickControlRingSliderView *)self _getClosestMarkingValueToValue:v25];
        if (v24 != v26)
        {
          [(HUQuickControlRingSliderView *)self _getSecondarySliderValue];
          double v28 = v27;
          [(HUQuickControlRingSliderView *)self _getOneMarkerValueDifference];
          double v11 = v28 + v29;
        }
      }
    }
    [(HUQuickControlRingSliderView *)self _getMinimumMarkingValue];
    double v31 = v30;
    [(HUQuickControlRingSliderView *)self _getMaximumMarkingValue];
    double v33 = v32;
    double v34 = [(HUQuickControlRingSliderView *)self profile];
    id v35 = [v34 primaryValueConstraints];
    BOOL v36 = [v35 minValue];
    [v36 floatValue];
    double v38 = fmax(fmax(v31, v11), v37);

    id v39 = [(HUQuickControlRingSliderView *)self primaryHandleView];
    [(HUQuickControlRingSliderView *)self _updateUIForTouchPoint:v4 didTouchBegin:x forHandleView:y minValue:v38 maxValue:v33];
  }
  else
  {
    double v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      double v41 = "-[HUQuickControlRingSliderView _updateUIForThresholdModeForPrimaryHandleViewWithTouchPoint:didTouchBegin:]";
      __int16 v42 = 2048;
      uint64_t v43 = 959;
      _os_log_fault_impl(&dword_1BE345000, v20, OS_LOG_TYPE_FAULT, "%s (Line: %ld) This method should only be called for threshold mode.", buf, 0x16u);
    }
  }
}

- (void)_updateUIForThresholdModeForSecondaryHandleViewWithTouchPoint:(CGPoint)a3 didTouchBegin:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  double v8 = [(HUQuickControlRingSliderView *)self profile];
  char v9 = [v8 hasSecondaryValue];

  if (v9)
  {
    [(HUQuickControlRingSliderView *)self _getPrimarySliderValue];
    double v11 = v10;
    id v12 = [(HUQuickControlRingSliderView *)self profile];
    uint64_t v13 = [v12 handleViewStyle];

    if (v13 == 1)
    {
      [(HUQuickControlRingSliderView *)self _getPrimarySliderValue];
      double v15 = v14;
      double v16 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
      [v16 outerRadius];
      double v18 = v17 * 3.14159265;
      [(HUQuickControlRingSliderView *)self outerRadius];
      double v11 = v15 - v18 / (v19 * 3.14159265 + v19 * 3.14159265);
    }
    else
    {
      double v21 = [(HUQuickControlRingSliderView *)self profile];
      uint64_t v22 = [v21 handleViewStyle];

      if (v22 == 2)
      {
        [(HUQuickControlRingSliderView *)self modelRangeValue];
        -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
        double v24 = v23;
        [(HUQuickControlRingSliderView *)self modelRangeValue];
        [(HUQuickControlRingSliderView *)self _getClosestMarkingValueToValue:v25];
        if (v24 != v26)
        {
          [(HUQuickControlRingSliderView *)self _getPrimarySliderValue];
          double v28 = v27;
          [(HUQuickControlRingSliderView *)self _getOneMarkerValueDifference];
          double v11 = v28 - v29;
        }
      }
    }
    [(HUQuickControlRingSliderView *)self _getMinimumMarkingValue];
    double v31 = v30;
    [(HUQuickControlRingSliderView *)self _getMaximumMarkingValue];
    double v33 = v32;
    double v34 = [(HUQuickControlRingSliderView *)self profile];
    id v35 = [v34 secondaryValueConstraints];
    BOOL v36 = [v35 maxValue];
    [v36 floatValue];
    [(HUQuickControlRingSliderView *)self _getClosestMarkingValueToValue:v37];
    double v39 = fmin(fmin(v38, v11), v33);

    id v40 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
    [(HUQuickControlRingSliderView *)self _updateUIForTouchPoint:v4 didTouchBegin:x forHandleView:y minValue:v31 maxValue:v39];
  }
  else
  {
    double v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v42 = "-[HUQuickControlRingSliderView _updateUIForThresholdModeForSecondaryHandleViewWithTouchPoint:didTouchBegin:]";
      __int16 v43 = 2048;
      uint64_t v44 = 992;
      _os_log_fault_impl(&dword_1BE345000, v20, OS_LOG_TYPE_FAULT, "%s (Line: %ld) This method should only be called for threshold mode.", buf, 0x16u);
    }
  }
}

- (void)_animateToEnlargeHandleView:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3) {
    [v3 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v9 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&t2.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&t2.c = v8;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&t2.tdouble x = v7;
  if (CGAffineTransformEqualToTransform(&t1, &t2) && [v4 handleViewStyle] == 1)
  {
    [v4 frame];
    *(_OWORD *)&t2.a = v9;
    *(_OWORD *)&t2.c = v8;
    *(_OWORD *)&t2.tdouble x = v7;
    CGAffineTransformTranslate(&v13, &t2, v5 * 0.3 * -0.5, v5 * 0.3 * -0.5);
    CGAffineTransform v12 = v13;
    [v4 setTransform:&v12];
    double v6 = (void *)MEMORY[0x1E4F42FF0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__HUQuickControlRingSliderView__animateToEnlargeHandleView___block_invoke;
    v10[3] = &unk_1E6386018;
    id v11 = v4;
    [v6 animateWithDuration:v10 animations:0.15];
  }
}

uint64_t __60__HUQuickControlRingSliderView__animateToEnlargeHandleView___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 transform];
    id v3 = *(void **)(a1 + 32);
  }
  else
  {
    id v3 = 0;
    memset(&v6, 0, sizeof(v6));
  }
  CGAffineTransformScale(&v7, &v6, 1.3, 1.3);
  CGAffineTransform v5 = v7;
  return [v3 setTransform:&v5];
}

- (CGSize)_getEdgeRectSize
{
  id v3 = [(HUQuickControlRingSliderView *)self profile];
  BOOL v4 = [v3 gradationMarkingValues];
  unint64_t v5 = [v4 count];

  double v6 = 0.0;
  if (v5 >= 2)
  {
    CGAffineTransform v7 = [(HUQuickControlRingSliderView *)self profile];
    long long v8 = [v7 gradationMarkingValues];
    long long v9 = [v8 objectAtIndexedSubscript:1];
    [v9 floatValue];
    float v11 = v10;
    CGAffineTransform v12 = [(HUQuickControlRingSliderView *)self profile];
    CGAffineTransform v13 = [v12 gradationMarkingValues];
    double v14 = [v13 firstObject];
    [v14 floatValue];
    double v6 = (float)(v11 - v15);
  }
  [(HUQuickControlRingSliderView *)self _getInnerCircleRadius];
  double v17 = v6 * ((v16 + v16) * 3.14159265) * 0.5;
  double v18 = 13.0;
  if (v17 <= 13.0) {
    double v18 = v17;
  }
  double v19 = 35.0;
  result.height = v18;
  result.width = v19;
  return result;
}

- (double)_getStartAngleEdgeLocationShiftForBackgroundRing:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(HUQuickControlRingSliderView *)self profile];
  unint64_t v5 = [v4 controlSize];

  if (v5 - 2 < 2) {
    return -0.004;
  }
  if (v5 > 1) {
    return 0.0;
  }
  double result = -0.005;
  if (v3) {
    return -0.001;
  }
  return result;
}

- (double)_getOneMarkerValueDifference
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUQuickControlRingSliderView *)self profile];
  BOOL v4 = [v3 gradationMarkingValues];
  unint64_t v5 = [v4 count];

  if (v5 < 2)
  {
    double v21 = HFLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [(HUQuickControlRingSliderView *)self profile];
      double v23 = [v22 gradationMarkingValues];
      int v25 = 136315394;
      double v26 = "-[HUQuickControlRingSliderView _getOneMarkerValueDifference]";
      __int16 v27 = 2048;
      uint64_t v28 = [v23 count];
      _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%s. profile gradation marking values count is %lu, not above 2", (uint8_t *)&v25, 0x16u);
    }
    return 0.0;
  }
  else
  {
    double v6 = [(HUQuickControlRingSliderView *)self profile];
    CGAffineTransform v7 = [v6 gradationMarkingValues];
    long long v8 = [v7 objectAtIndexedSubscript:0];

    long long v9 = [(HUQuickControlRingSliderView *)self profile];
    float v10 = [v9 gradationMarkingValues];
    float v11 = [v10 objectAtIndexedSubscript:1];

    [v8 floatValue];
    float v13 = v12;
    [v11 floatValue];
    if (v13 >= v14) {
      float v15 = v8;
    }
    else {
      float v15 = v11;
    }
    if (v13 >= v14) {
      double v16 = v11;
    }
    else {
      double v16 = v8;
    }
    [v15 floatValue];
    float v18 = v17;
    [v16 floatValue];
    double v20 = (float)(v18 - v19);
  }
  return v20;
}

- (void)_updateSelectedRangeImageView
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  [(HUQuickControlRingSliderView *)self _getEdgeRectSize];
  double v68 = v4;
  double v69 = v3;
  unint64_t v5 = [(HUQuickControlRingSliderView *)self profile];
  double v6 = [v5 gradationMarkingValues];
  CGAffineTransform v7 = [v6 firstObject];
  [v7 floatValue];
  double v9 = v8;

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  float v10 = [(HUQuickControlRingSliderView *)self profile];
  float v11 = [v10 gradationMarkingValues];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v81 objects:v85 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v82 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        [v16 floatValue];
        if (v9 > v17)
        {
          [v16 floatValue];
          double v9 = v18;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v81 objects:v85 count:16];
    }
    while (v13);
  }

  float v19 = [(HUQuickControlRingSliderView *)self profile];
  if ([v19 hasSecondaryValue])
  {
    [(HUQuickControlRingSliderView *)self _getSecondarySliderValue];
    double v9 = v20;
  }
  [(HUQuickControlRingSliderView *)self _getAngleFrom12OClockForValue:v9];
  double v22 = v21;

  if ([(HUQuickControlRingSliderView *)self showOffState]
    || ![(HUQuickControlRingSliderView *)self reachabilityState]
    || [(HUQuickControlRingSliderView *)self reachabilityState] == 1)
  {
    [(HUQuickControlRingSliderView *)self _getMaxAngleFrom12OClock];
    double v24 = v23;
    [(HUQuickControlRingSliderView *)self _getMinAngleFrom12OClock];
    double v22 = v25;
  }
  else
  {
    double v61 = [(HUQuickControlRingSliderView *)self primaryHandleView];
    [v61 center];
    -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:");
    double v24 = v62;
  }
  float v26 = v24 + 4.71238898;
  double v27 = fmodf(v26, 6.2832);
  float v28 = v22 + 4.71238898;
  double v67 = fmodf(v28, 6.2832);
  uint64_t v29 = [MEMORY[0x1E4F39C88] layer];
  [(HUQuickControlRingSliderView *)self _getMiddleCircleRadius];
  double v66 = v30;
  double v31 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [v29 setLineWidth:35.0];
  [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
  objc_msgSend(v29, "setPosition:");
  id v32 = [MEMORY[0x1E4F428B8] clearColor];
  objc_msgSend(v29, "setFillColor:", objc_msgSend(v32, "CGColor"));

  id v33 = v31;
  objc_msgSend(v29, "setPath:", objc_msgSend(v33, "CGPath"));
  id v34 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
  objc_msgSend(v29, "setStrokeColor:", objc_msgSend(v34, "CGColor"));

  id v35 = [(HUQuickControlRingSliderView *)self selectedRangeImageView];
  BOOL v36 = [v35 layer];
  [v36 setMask:v29];

  [(HUQuickControlRingSliderView *)self _updateSupplementaryValueMarkingViewColor];
  [(HUQuickControlRingSliderView *)self _getInnerCircleRadius];
  double v38 = v37;
  double v39 = v27 + -0.001;
  __double2 v40 = __sincos_stret(v39);
  double v41 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12, v40.__cosval * v38, v40.__sinval * v38, v69, v68, 8.0, 8.0);
  [v41 setUsesEvenOddFillRule:1];
  CGAffineTransformMakeTranslation(&v80, -(v40.__cosval * v38), -(v40.__sinval * v38));
  [v41 applyTransform:&v80];
  long long v64 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v65 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v78.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v78.c = v64;
  long long v63 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v78.tdouble x = v63;
  CGAffineTransformRotate(&v79, &v78, v39);
  [v41 applyTransform:&v79];
  CGAffineTransformMakeTranslation(&v77, v40.__cosval * v38, v40.__sinval * v38);
  [v41 applyTransform:&v77];
  [(HUQuickControlRingSliderView *)self _getStartAngleEdgeLocationShiftForBackgroundRing:0];
  double v43 = v42;
  [(HUQuickControlRingSliderView *)self outerRadius];
  double v45 = v67 - v68 / v44;
  [(HUQuickControlRingSliderView *)self outerRadius];
  __double2 v47 = __sincos_stret(v45 + -2.0 / v46 - v43);
  uint64_t v48 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, v38 * v47.__cosval, v38 * v47.__sinval, v69, v68, 8.0, 8.0);
  [v48 setUsesEvenOddFillRule:1];
  CGAffineTransformMakeTranslation(&v76, -(v38 * v47.__cosval), -(v38 * v47.__sinval));
  [v48 applyTransform:&v76];
  CGAffineTransformMakeScale(&v74, -1.0, -1.0);
  CGAffineTransformRotate(&v75, &v74, v67 + 3.14159265);
  [v48 applyTransform:&v75];
  CGAffineTransformMakeTranslation(&v73, v38 * v47.__cosval, v38 * v47.__sinval);
  [v48 applyTransform:&v73];
  [v41 appendPath:v48];
  if ([(HUQuickControlRingSliderView *)self reachabilityState] != 1
    && [(HUQuickControlRingSliderView *)self reachabilityState])
  {
    [(HUQuickControlRingSliderView *)self supplementaryValue];
    -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
    -[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:](self, "_getAngleFrom12OClockForValue:");
    double v50 = v49;
    [(HUQuickControlRingSliderView *)self _getMiddleCircleRadius];
    *(float *)&double v51 = v50 - 2.0 / v51 + 4.71238898;
    double v52 = fmodf(*(float *)&v51, 6.2832);
    double v53 = (v66 + v38) * 0.5;
    __double2 v54 = __sincos_stret(v52);
    long long v55 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", v53 * v54.__cosval, v53 * v54.__sinval, 19.0, 4.0, 2.0);
    CGAffineTransformMakeTranslation(&v72, -(v53 * v54.__cosval), -(v53 * v54.__sinval));
    [v55 applyTransform:&v72];
    *(_OWORD *)&v78.a = v65;
    *(_OWORD *)&v78.c = v64;
    *(_OWORD *)&v78.tdouble x = v63;
    CGAffineTransformRotate(&v71, &v78, v52);
    [v55 applyTransform:&v71];
    CGAffineTransformMakeTranslation(&v70, v53 * v54.__cosval, v53 * v54.__sinval);
    [v55 applyTransform:&v70];
    [v41 appendPath:v55];
  }
  float v56 = objc_msgSend(MEMORY[0x1E4F39C88], "layer", v63, v64, v65);
  id v57 = v41;
  objc_msgSend(v56, "setPath:", objc_msgSend(v57, "CGPath"));
  id v58 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  objc_msgSend(v56, "setFillColor:", objc_msgSend(v58, "CGColor"));

  [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
  objc_msgSend(v56, "setPosition:");
  id v59 = [(HUQuickControlRingSliderView *)self selectedRangeImageViewForEdges];
  char v60 = [v59 layer];
  [v60 setMask:v56];
}

- (double)_getClosestMarkingValueToValue:(double)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(HUQuickControlRingSliderView *)self profile];
  double v6 = [v5 gradationMarkingValues];
  CGAffineTransform v7 = [v6 firstObject];
  [v7 floatValue];
  double v9 = v8;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  float v10 = [(HUQuickControlRingSliderView *)self profile];
  float v11 = [v10 gradationMarkingValues];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    if (v9 >= a3) {
      double v14 = v9 - a3;
    }
    else {
      double v14 = a3 - v9;
    }
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v11);
        }
        float v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v17 floatValue];
        double v19 = v18;
        [v17 floatValue];
        double v21 = v20;
        double v22 = a3 - v21;
        double v23 = v21 - a3;
        if (v19 >= a3) {
          double v24 = v23;
        }
        else {
          double v24 = v22;
        }
        if (v24 < v14)
        {
          [v17 floatValue];
          double v9 = v25;
          double v14 = v24;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }

  return v9;
}

- (BOOL)_areHandleViewsAnimating
{
  double v3 = [(HUQuickControlRingSliderView *)self primaryHandleView];
  double v4 = [v3 layer];
  unint64_t v5 = [v4 animationKeys];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    CGAffineTransform v7 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
    float v8 = [v7 layer];
    double v9 = [v8 animationKeys];
    BOOL v6 = v9 != 0;
  }
  return v6;
}

- (void)_updateModelValueWithSlidersPositions
{
  double v3 = [(HUQuickControlRingSliderView *)self primaryHandleView];
  [v3 center];
  -[HUQuickControlRingSliderView _getSliderValueForPoint:](self, "_getSliderValueForPoint:");
  double v5 = v4;

  BOOL v6 = [(HUQuickControlRingSliderView *)self profile];
  int v7 = [v6 hasSecondaryValue];

  double v8 = 0.0;
  if (v7)
  {
    double v9 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
    [v9 center];
    -[HUQuickControlRingSliderView _getSliderValueForPoint:](self, "_getSliderValueForPoint:");
    double v8 = v10;
  }

  -[HUQuickControlRingSliderView _updateModelValue:roundValue:notifyInteractionDelegate:](self, "_updateModelValue:roundValue:notifyInteractionDelegate:", 1, 1, v8, v5);
}

- (void)_touchEnded
{
  if ((_MergedGlobals_1_2 & 1) != 0 || (_MergedGlobals_1_2 & 0x100) != 0) {
    return;
  }
  if ([(HUQuickControlRingSliderView *)self isDraggingPrimaryHandleView])
  {
    double v3 = [(HUQuickControlRingSliderView *)self primaryHandleView];
    double v4 = v3;
    if (v3) {
      [v3 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&t2.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&t2.c = v5;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    BOOL v6 = CGAffineTransformEqualToTransform(&t1, &t2);

    if (!v6)
    {
      double v9 = [(HUQuickControlRingSliderView *)self primaryHandleView];
      double v10 = &_MergedGlobals_1_2;
LABEL_16:
      *(unsigned char *)double v10 = 1;
      goto LABEL_17;
    }
  }
  if ([(HUQuickControlRingSliderView *)self isDraggingSecondaryHandleView])
  {
    int v7 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
    double v8 = v7;
    if (v7) {
      [v7 transform];
    }
    else {
      memset(&v26, 0, sizeof(v26));
    }
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&t2.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&t2.c = v11;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    BOOL v12 = CGAffineTransformEqualToTransform(&v26, &t2);

    if (!v12)
    {
      double v9 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
      double v10 = (__int16 *)((char *)&_MergedGlobals_1_2 + 1);
      goto LABEL_16;
    }
  }
  double v9 = 0;
LABEL_17:
  [(HUQuickControlRingSliderView *)self _actuateImpactTapticFeedback];
  uint64_t v13 = [(HUQuickControlRingSliderView *)self profile];
  uint64_t v14 = [v13 handleViewStyle];

  if (v14 == 1)
  {
    if (v9)
    {
      [v9 frame];
      CGFloat v16 = v15 * 0.3 * 0.5;
      [v9 transform];
      CGAffineTransformTranslate(&v25, &v24, v16, v16);
      CGAffineTransform v23 = v25;
      [v9 setTransform:&v23];
      float v17 = (void *)MEMORY[0x1E4F42FF0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __43__HUQuickControlRingSliderView__touchEnded__block_invoke;
      v21[3] = &unk_1E6386018;
      id v22 = v9;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __43__HUQuickControlRingSliderView__touchEnded__block_invoke_2;
      v20[3] = &unk_1E6386730;
      v20[4] = self;
      [v17 animateWithDuration:v21 animations:v20 completion:0.15];
    }
  }
  else
  {
    [(HUQuickControlRingSliderView *)self setIsDraggingPrimaryHandleView:0];
    [(HUQuickControlRingSliderView *)self setIsDraggingSecondaryHandleView:0];
    _MergedGlobals_1_2 = 0;
  }
  [(HUQuickControlRingSliderView *)self setPrevTouchArea:0];
  float v18 = [(HUQuickControlRingSliderView *)self interactionDelegate];
  [v18 controlView:self interactionStateDidChange:0 forFirstTouch:0];

  [(HUQuickControlRingSliderView *)self setUserInteractionActive:0];
  double v19 = [(HUQuickControlRingSliderView *)self currentDirectionTapticValues];
  [v19 removeAllObjects];
}

uint64_t __43__HUQuickControlRingSliderView__touchEnded__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __43__HUQuickControlRingSliderView__touchEnded__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsDraggingPrimaryHandleView:0];
  uint64_t result = [*(id *)(a1 + 32) setIsDraggingSecondaryHandleView:0];
  _MergedGlobals_1_2 = 0;
  return result;
}

- (void)updateSupplementaryLabelWithString:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    double v4 = [(HUQuickControlRingSliderView *)self supplementaryLabel];
    [v4 setText:v5];

    [(HUQuickControlRingSliderView *)self _updateLabelsSize];
  }
}

- (void)updatePrimaryLabelWithString:(id)a3 fontSize:(double)a4
{
  id v9 = a3;
  if ([v9 length])
  {
    BOOL v6 = [(HUQuickControlRingSliderView *)self primaryLabel];
    [v6 setText:v9];

    int v7 = [MEMORY[0x1E4F42A30] monospacedDigitSystemFontOfSize:a4 weight:*MEMORY[0x1E4F43908]];
    double v8 = [(HUQuickControlRingSliderView *)self primaryLabel];
    [v8 setFont:v7];

    [(HUQuickControlRingSliderView *)self _updateLabelsSize];
  }
}

- (void)_updateLabelsSize
{
  double v3 = [(HUQuickControlRingSliderView *)self supplementaryLabel];
  [v3 sizeToFit];

  double v4 = [(HUQuickControlRingSliderView *)self primaryLabel];
  [v4 sizeToFit];

  [(HUQuickControlRingSliderView *)self frame];
  double v6 = v5 + -70.0;
  [(HUQuickControlRingSliderView *)self frame];
  double v8 = v6 + v7 * -0.1 * 2.0;
  id v9 = [(HUQuickControlRingSliderView *)self supplementaryLabel];
  [v9 frame];
  if (v10 > v8)
  {
    [(HUQuickControlRingSliderView *)self frame];
    double v12 = v11;

    if (v12 <= 0.0) {
      goto LABEL_5;
    }
    uint64_t v13 = [(HUQuickControlRingSliderView *)self supplementaryLabel];
    [v13 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    id v9 = [(HUQuickControlRingSliderView *)self supplementaryLabel];
    objc_msgSend(v9, "setFrame:", v15, v17, v8, v19);
  }

LABEL_5:
  float v20 = [(HUQuickControlRingSliderView *)self primaryLabel];
  [v20 frame];
  if (v21 > v8)
  {
    [(HUQuickControlRingSliderView *)self frame];
    double v23 = v22;

    if (v23 <= 0.0) {
      goto LABEL_9;
    }
    CGAffineTransform v24 = [(HUQuickControlRingSliderView *)self primaryLabel];
    [v24 frame];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;

    float v20 = [(HUQuickControlRingSliderView *)self primaryLabel];
    objc_msgSend(v20, "setFrame:", v26, v28, v8, v30);
  }

LABEL_9:
  double v31 = [(HUQuickControlRingSliderView *)self supplementaryLabel];
  [v31 frame];
  double v33 = v32;

  id v34 = [(HUQuickControlRingSliderView *)self primaryLabel];
  [v34 frame];
  double v36 = v35 + 3.0;

  if (v33 < v36) {
    double v33 = v36;
  }
  double v37 = [(HUQuickControlRingSliderView *)self supplementaryLabel];
  [v37 frame];
  double v39 = v38;
  __double2 v40 = [(HUQuickControlRingSliderView *)self primaryLabel];
  [v40 frame];
  double v42 = v39 + v41;

  [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
  double v43 = v33 * 0.5;
  double v45 = v44 - v33 * 0.5;
  [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
  double v47 = v46 - v42 * 0.5;
  uint64_t v48 = [(HUQuickControlRingSliderView *)self labelsBackgroundView];
  objc_msgSend(v48, "setFrame:", v45, v47, v33, v42);

  double v49 = [(HUQuickControlRingSliderView *)self supplementaryLabel];
  [v49 frame];
  double v51 = v33 * 0.5 - v50 * 0.5;

  double v52 = [(HUQuickControlRingSliderView *)self supplementaryLabel];
  [v52 frame];
  double v54 = v53;
  double v56 = v55;

  id v57 = [(HUQuickControlRingSliderView *)self supplementaryLabel];
  objc_msgSend(v57, "setFrame:", v51, 0.0, v54, v56);

  id v58 = [(HUQuickControlRingSliderView *)self primaryLabel];
  [v58 frame];
  double v60 = v43 - v59 * 0.5 + 3.0;

  double v61 = [(HUQuickControlRingSliderView *)self primaryLabel];
  [v61 frame];
  double v63 = v62;

  long long v64 = [(HUQuickControlRingSliderView *)self primaryLabel];
  [v64 frame];
  double v66 = v65;

  id v67 = [(HUQuickControlRingSliderView *)self primaryLabel];
  objc_msgSend(v67, "setFrame:", v60, v56, v63, v66);
}

- (void)_prepareForTapticFeedback
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42DD8]);
  [(HUQuickControlRingSliderView *)self setSelectionFeedbackGenerator:v3];

  double v4 = [(HUQuickControlRingSliderView *)self selectionFeedbackGenerator];
  [v4 prepare];

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:1];
  [(HUQuickControlRingSliderView *)self setImpactFeedbackGenerator:v5];

  id v6 = [(HUQuickControlRingSliderView *)self impactFeedbackGenerator];
  [v6 prepare];
}

- (void)_actuateSelectionTapticFeedback
{
  id v3 = [(HUQuickControlRingSliderView *)self selectionFeedbackGenerator];
  [v3 selectionChanged];

  id v4 = [(HUQuickControlRingSliderView *)self selectionFeedbackGenerator];
  [v4 prepare];
}

- (void)_actuateImpactTapticFeedback
{
  id v3 = [(HUQuickControlRingSliderView *)self impactFeedbackGenerator];
  [v3 impactOccurred];

  id v4 = [(HUQuickControlRingSliderView *)self impactFeedbackGenerator];
  [v4 prepare];
}

- (double)_getSliderValueForAngleFrom12OClock:(double)a3
{
  [(HUQuickControlRingSliderView *)self _getPointForAngleFrom12OClock:a3];

  -[HUQuickControlRingSliderView _getSliderValueForPoint:](self, "_getSliderValueForPoint:");
  return result;
}

- (double)_getSliderValueForPoint:(CGPoint)a3
{
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:", a3.x, a3.y);
  double v5 = v4;
  [(HUQuickControlRingSliderView *)self _getPossibleAngleRange12OClock];
  return (v5 - v6) / (v7 - v6);
}

- (double)_getAngleFrom12OClockForValue:(double)a3
{
  double v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0)
  {
    double v5 = HFLogForCategory();
    double v6 = 0.0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)double v11 = 136315394;
      *(void *)&v11[4] = "-[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:]";
      *(_WORD *)&v11[12] = 2048;
      *(double *)&v11[14] = v3;
      double v7 = "(%s) value = %f when expected to be between 0.0 and 1.0. Adjusting it to 0.0";
LABEL_9:
      _os_log_debug_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEBUG, v7, v11, 0x16u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  double v6 = 1.0;
  if (a3 > 1.0)
  {
    double v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)double v11 = 136315394;
      *(void *)&v11[4] = "-[HUQuickControlRingSliderView _getAngleFrom12OClockForValue:]";
      *(_WORD *)&v11[12] = 2048;
      *(double *)&v11[14] = v3;
      double v7 = "(%s) value = %f when expected to be between 0.0 and 1.0. Adjusting it to 1.0";
      goto LABEL_9;
    }
LABEL_6:

    double v3 = v6;
  }
  [(HUQuickControlRingSliderView *)self _getPossibleAngleRange12OClock];
  return v9 + (v8 - v9) * v3;
}

- (CGPoint)_getHandleCenterOnRingForValue:(double)a3
{
  [(HUQuickControlRingSliderView *)self _getAngleFrom12OClockForValue:a3];
  double v5 = v4;
  [(HUQuickControlRingSliderView *)self _getMiddleCircleRadius];
  double v7 = v6;
  [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
  double v9 = v8;
  double v11 = v10;
  __double2 v12 = __sincos_stret(v5);
  double v13 = v9 + v7 * v12.__sinval;
  double v14 = v11 - v7 * v12.__cosval;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (double)_getAngleFrom12OClockForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HUQuickControlRingSliderView *)self bounds];
  if (v6 != 0.0 || ([(HUQuickControlRingSliderView *)self bounds], double result = 0.0, v8 != 0.0))
  {
    [(HUQuickControlRingSliderView *)self _getMiddleCircleRadius];
    double v10 = v9;
    [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
    double v12 = v11;
    double v14 = v13;
    -[HUQuickControlRingSliderView _getClosestPointOnMiddleCircleOfRing:](self, "_getClosestPointOnMiddleCircleOfRing:", x, y);
    double v16 = v15;
    double v18 = v17;
    UIDistanceBetweenPoints();
    if (v10 > 0.0 && vabdd_f64(v19, v10) >= 0.05) {
      NSLog(&cfstr_TheDistanceBet.isa, *(void *)&v10);
    }
    if (v16 < v12 || v18 >= v14)
    {
      if (v16 <= v12 || v18 < v14)
      {
        double v22 = (v12 - v16) / v10;
        if (v16 > v12 || v18 <= v14)
        {
          double v20 = acos(v22);
          double v21 = 4.71238898;
        }
        else
        {
          double v20 = asin(v22);
          double v21 = 3.14159265;
        }
      }
      else
      {
        double v20 = acos((v16 - v12) / v10);
        double v21 = 1.57079633;
      }
      return v20 + v21;
    }
    else
    {
      return asin((v16 - v12) / v10);
    }
  }
  return result;
}

- (CGPoint)_getPointForAngleFrom12OClock:(double)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  float v5 = a3;
  float v6 = fmodf(v5, 6.2832);
  [(HUQuickControlRingSliderView *)self _getMiddleCircleRadius];
  if (v7 <= 0.0)
  {
    double v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = (objc_class *)objc_opt_class();
      double v19 = NSStringFromClass(v18);
      double v20 = NSStringFromSelector(a2);
      int v25 = 138412546;
      double v26 = v19;
      __int16 v27 = 2112;
      double v28 = v20;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "(%@/%@) middleCircleRadius should be > 0", (uint8_t *)&v25, 0x16u);
    }
    double v15 = *MEMORY[0x1E4F1DAD8];
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    double v8 = v7;
    double v9 = v6;
    [(HUQuickControlRingSliderView *)self frame];
    double v11 = v10 * 0.5;
    [(HUQuickControlRingSliderView *)self frame];
    double v13 = v12 * 0.5;
    if (v6 < 0.0 || v9 >= 1.57079633)
    {
      if (v9 < 1.57079633 || v9 >= 3.14159265)
      {
        double v22 = -v8;
        if (v9 < 3.14159265 || v9 >= 4.71238898)
        {
          __double2 v24 = __sincos_stret(v9 + -4.71238898);
          double v15 = v11 + v22 * v24.__cosval;
          double v16 = v13 + v22 * v24.__sinval;
        }
        else
        {
          __double2 v23 = __sincos_stret(v9 + -3.14159265);
          double v15 = v11 + v22 * v23.__sinval;
          double v16 = v13 + v8 * v23.__cosval;
        }
      }
      else
      {
        __double2 v21 = __sincos_stret(v9 + -1.57079633);
        double v15 = v11 + v8 * v21.__cosval;
        double v16 = v13 + v8 * v21.__sinval;
      }
    }
    else
    {
      __double2 v14 = __sincos_stret(v6);
      double v15 = v11 + v8 * v14.__sinval;
      double v16 = v13 - v8 * v14.__cosval;
    }
  }
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)_getClosestPointOnMiddleCircleOfRing:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HUQuickControlRingSliderView *)self outerRadius];
  double v7 = v6 + -17.5;
  [(HUQuickControlRingSliderView *)self frame];
  double v9 = v8 * 0.5;
  [(HUQuickControlRingSliderView *)self frame];
  double v11 = v10 * 0.5;
  UIDistanceBetweenPoints();
  double v13 = v11 + v7 * (y - v11) / v12;
  double v14 = v9 + v7 * (x - v9) / v12;
  result.double y = v13;
  result.double x = v14;
  return result;
}

- (BOOL)_primaryHandleViewContainsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(HUQuickControlRingSliderView *)self primaryHandleView];
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  double v11 = [(HUQuickControlRingSliderView *)self primaryHandleView];
  [v11 bounds];
  v13.double x = v8;
  v13.double y = v10;
  LOBYTE(v6) = CGRectContainsPoint(v14, v13);

  return (char)v6;
}

- (BOOL)_secondaryHandleViewContainsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(HUQuickControlRingSliderView *)self profile];
  int v7 = [v6 hasSecondaryValue];

  if (!v7) {
    return 0;
  }
  CGFloat v8 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  CGPoint v13 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
  [v13 bounds];
  v15.double x = v10;
  v15.double y = v12;
  LOBYTE(v8) = CGRectContainsPoint(v16, v15);

  return (char)v8;
}

- (BOOL)_isPoint:(CGPoint)a3 withInMarginOfRing:(double)a4
{
  [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
  UIDistanceBetweenPoints();
  double v7 = v6;
  [(HUQuickControlRingSliderView *)self outerRadius];
  if (v7 > v8 + a4) {
    return 0;
  }
  [(HUQuickControlRingSliderView *)self outerRadius];
  return v7 >= v10 + -35.0 - a4;
}

- (double)_getMiddleCircleRadius
{
  [(HUQuickControlRingSliderView *)self outerRadius];
  return v2 + -17.5;
}

- (double)_getInnerCircleRadius
{
  [(HUQuickControlRingSliderView *)self outerRadius];
  return v2 + -35.0;
}

- (CGPoint)_getCircleCenterPoint
{
  [(HUQuickControlRingSliderView *)self frame];
  double v4 = v3 * 0.5;
  [(HUQuickControlRingSliderView *)self frame];
  double v6 = v5 * 0.5;
  double v7 = v4;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_getPossibleAngleRange12OClock
{
  [(HUQuickControlRingSliderView *)self _getMinAngleFrom12OClock];
  double v4 = v3;
  [(HUQuickControlRingSliderView *)self _getMaxAngleFrom12OClock];
  double v6 = v5;
  double v7 = v4;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (double)_getMinAngleFrom12OClock
{
  double v2 = [(HUQuickControlRingSliderView *)self profile];
  unint64_t v3 = [v2 style];

  double result = 0.0;
  if (v3 <= 2) {
    return dbl_1BEA1A1D8[v3];
  }
  return result;
}

- (double)_getMaxAngleFrom12OClock
{
  unint64_t v3 = [(HUQuickControlRingSliderView *)self profile];
  unint64_t v4 = [v3 style];

  if (v4 > 2) {
    return 6.28318531;
  }
  [(HUQuickControlRingSliderView *)self _getMinAngleFrom12OClock];
  return 6.28318531 - v5;
}

- (unint64_t)_getRingSliderAreaForAngleFrom12Oclock:(double)a3 minAngle:(double)a4 maxAngle:(double)a5
{
  double v5 = a4 + -0.05;
  if (a3 >= 0.0)
  {
    BOOL v6 = v5 == a3;
    BOOL v7 = v5 < a3;
  }
  else
  {
    BOOL v6 = 1;
    BOOL v7 = 0;
  }
  if (!v7 && !v6) {
    return 4;
  }
  double v8 = a4 + 0.05;
  if (v5 <= a3)
  {
    BOOL v9 = v8 == a3;
    BOOL v10 = v8 < a3;
  }
  else
  {
    BOOL v9 = 1;
    BOOL v10 = 0;
  }
  if (!v10 && !v9) {
    return 1;
  }
  double v11 = a5 + -0.05;
  if (v8 <= a3)
  {
    BOOL v12 = v11 == a3;
    BOOL v13 = v11 < a3;
  }
  else
  {
    BOOL v12 = 1;
    BOOL v13 = 0;
  }
  if (!v13 && !v12) {
    return 2;
  }
  if (a5 + 0.05 >= a3)
  {
    BOOL v15 = v11 == a3;
    BOOL v14 = v11 >= a3;
  }
  else
  {
    BOOL v14 = 1;
    BOOL v15 = 0;
  }
  if (!v15 && v14) {
    return 4;
  }
  else {
    return 3;
  }
}

- (unint64_t)_getRingSliderAreaForPoint:(CGPoint)a3
{
  -[HUQuickControlRingSliderView _getAngleFrom12OClockForPoint:](self, "_getAngleFrom12OClockForPoint:", a3.x, a3.y);

  return -[HUQuickControlRingSliderView _getRingSliderAreaForAngleFrom12Oclock:](self, "_getRingSliderAreaForAngleFrom12Oclock:");
}

- (unint64_t)_getRingSliderAreaForAngleFrom12Oclock:(double)a3
{
  [(HUQuickControlRingSliderView *)self _getMinAngleFrom12OClock];
  double v6 = v5;
  [(HUQuickControlRingSliderView *)self _getMaxAngleFrom12OClock];

  return [(HUQuickControlRingSliderView *)self _getRingSliderAreaForAngleFrom12Oclock:a3 minAngle:v6 maxAngle:v7];
}

- (void)handlePanGestureRecognizer:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HUQuickControlRingSliderView *)self conformsToProtocol:&unk_1F1A161E8]
    && (objc_opt_respondsToSelector() & 1) != 0
    && (![(HUQuickControlRingSliderView *)self reachabilityState]
     || [(HUQuickControlRingSliderView *)self reachabilityState] == 1))
  {
    double v5 = HUQuickControlReachabilityString([(HUQuickControlRingSliderView *)self reachabilityState]);
    double v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412802;
      double v33 = self;
      __int16 v34 = 2112;
      double v35 = v5;
      __int16 v36 = 2080;
      double v37 = "-[HUQuickControlRingSliderView handlePanGestureRecognizer:]";
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Control view %@ is in state %@. Ignoring tap gesture in %s", (uint8_t *)&v32, 0x20u);
    }
  }
  else if (![(HUQuickControlRingSliderView *)self showOffState])
  {
    [v4 locationInView:self];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = [v4 state];
    if ((unint64_t)(v11 - 3) >= 3)
    {
      if (v11 == 2)
      {
        if (![(HUQuickControlRingSliderView *)self isUserInteractionActive]) {
          goto LABEL_31;
        }
        [(HUQuickControlRingSliderView *)self setUserInteractionActive:1];
        __int16 v27 = self;
        double v28 = v8;
        double v29 = v10;
        uint64_t v30 = 0;
      }
      else
      {
        if (v11 != 1) {
          goto LABEL_31;
        }
        -[HUQuickControlRingSliderView setIsDraggingPrimaryHandleView:](self, "setIsDraggingPrimaryHandleView:", -[HUQuickControlRingSliderView _primaryHandleViewContainsPoint:](self, "_primaryHandleViewContainsPoint:", v8, v10));
        -[HUQuickControlRingSliderView setIsDraggingSecondaryHandleView:](self, "setIsDraggingSecondaryHandleView:", -[HUQuickControlRingSliderView _secondaryHandleViewContainsPoint:](self, "_secondaryHandleViewContainsPoint:", v8, v10));
        if ([(HUQuickControlRingSliderView *)self isDraggingPrimaryHandleView]
          || [(HUQuickControlRingSliderView *)self isDraggingSecondaryHandleView])
        {
          [(HUQuickControlRingSliderView *)self _prepareForTapticFeedback];
          [(HUQuickControlRingSliderView *)self _actuateImpactTapticFeedback];
        }
        if ([(HUQuickControlRingSliderView *)self isDraggingPrimaryHandleView]
          && [(HUQuickControlRingSliderView *)self isDraggingSecondaryHandleView])
        {
          BOOL v12 = [(HUQuickControlRingSliderView *)self primaryHandleView];
          [v12 center];
          UIDistanceBetweenPoints();
          double v14 = v13;

          BOOL v15 = [(HUQuickControlRingSliderView *)self secondaryHandleView];
          [v15 center];
          UIDistanceBetweenPoints();
          double v17 = v16;

          [(HUQuickControlRingSliderView *)self setIsDraggingPrimaryHandleView:v14 <= v17];
          [(HUQuickControlRingSliderView *)self setIsDraggingSecondaryHandleView:[(HUQuickControlRingSliderView *)self isDraggingPrimaryHandleView] ^ 1];
        }
        [(HUQuickControlRingSliderView *)self modelRangeValue];
        -[HUQuickControlRingSliderView _getClosestMarkingValueToValue:](self, "_getClosestMarkingValueToValue:");
        double v19 = v18;
        [(HUQuickControlRingSliderView *)self modelRangeValue];
        [(HUQuickControlRingSliderView *)self _getClosestMarkingValueToValue:v20];
        if (v19 == v21)
        {
          double v22 = [(HUQuickControlRingSliderView *)self profile];
          int v23 = [v22 hasSecondaryValue];

          if (v23)
          {
            [(HUQuickControlRingSliderView *)self _getMinimumMarkingValue];
            double v25 = v24;
            if (v19 == v24
              || ([(HUQuickControlRingSliderView *)self _getMaximumMarkingValue], v19 == v26))
            {
              [(HUQuickControlRingSliderView *)self setIsDraggingPrimaryHandleView:v19 == v25];
              [(HUQuickControlRingSliderView *)self setIsDraggingSecondaryHandleView:v19 != v25];
            }
          }
        }
        if (![(HUQuickControlRingSliderView *)self isDraggingPrimaryHandleView]
          && ![(HUQuickControlRingSliderView *)self isDraggingSecondaryHandleView])
        {
          double v31 = [(HUQuickControlRingSliderView *)self interactionDelegate];
          [v31 controlView:self interactionStateDidChange:0 forFirstTouch:1];

          [(HUQuickControlRingSliderView *)self setUserInteractionActive:0];
          goto LABEL_31;
        }
        [(HUQuickControlRingSliderView *)self setUserInteractionActive:1];
        __int16 v27 = self;
        double v28 = v8;
        double v29 = v10;
        uint64_t v30 = 1;
      }
      -[HUQuickControlRingSliderView _updateUIWithTouchAtPoint:didTouchBegin:](v27, "_updateUIWithTouchAtPoint:didTouchBegin:", v30, v28, v29);
      [(HUQuickControlRingSliderView *)self _updateModelValueWithSlidersPositions];
      goto LABEL_31;
    }
    if ([(HUQuickControlRingSliderView *)self isUserInteractionActive])
    {
      -[HUQuickControlRingSliderView _updateUIWithTouchAtPoint:didTouchBegin:](self, "_updateUIWithTouchAtPoint:didTouchBegin:", 0, v8, v10);
      [(HUQuickControlRingSliderView *)self _updateModelValueWithSlidersPositions];
      [(HUQuickControlRingSliderView *)self _touchEnded];
    }
  }
LABEL_31:
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  double v6 = [(HUQuickControlRingSliderView *)self longPressPanGestureRecognizer];
  int v7 = [v5 isEqual:v6];

  if (!v7) {
    return 1;
  }
  double v8 = [(HUQuickControlRingSliderView *)self longPressPanGestureRecognizer];
  [v8 locationInView:self];

  [(HUQuickControlRingSliderView *)self _getCircleCenterPoint];
  UIDistanceBetweenPoints();
  double v10 = v9;
  [(HUQuickControlRingSliderView *)self _getMiddleCircleRadius];
  if (v10 < v11 + -35.0) {
    return 1;
  }
  [(HUQuickControlRingSliderView *)self _getMiddleCircleRadius];
  return v10 > v13 + 35.0;
}

- (double)_getMinimumMarkingValue
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HUQuickControlRingSliderView *)self profile];
  id v4 = [v3 gradationMarkingValues];
  id v5 = [v4 firstObject];
  [v5 floatValue];
  double v7 = v6;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v8 = [(HUQuickControlRingSliderView *)self profile];
  double v9 = [v8 gradationMarkingValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v14 floatValue];
        if (v7 > v15)
        {
          [v14 floatValue];
          double v7 = v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v7;
}

- (double)_getMaximumMarkingValue
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HUQuickControlRingSliderView *)self profile];
  id v4 = [v3 gradationMarkingValues];
  id v5 = [v4 firstObject];
  [v5 floatValue];
  double v7 = v6;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v8 = [(HUQuickControlRingSliderView *)self profile];
  double v9 = [v8 gradationMarkingValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v14 floatValue];
        if (v7 < v15)
        {
          [v14 floatValue];
          double v7 = v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v7;
}

- (HUQuickControlRingSliderViewProfile)profile
{
  return self->_profile;
}

- (HUQuickControlViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (HUQuickControlViewInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (double)supplementaryValue
{
  return self->_supplementaryValue;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)modelRangeValue
{
  double minimum = self->_modelRangeValue.minimum;
  double maximum = self->_modelRangeValue.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (void)setModelRangeValue:(id)a3
{
  self->_modelRangeValue = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (BOOL)isDraggingPrimaryHandleView
{
  return self->_isDraggingPrimaryHandleView;
}

- (void)setIsDraggingPrimaryHandleView:(BOOL)a3
{
  self->_isDraggingPrimaryHandleView = a3;
}

- (BOOL)isDraggingSecondaryHandleView
{
  return self->_isDraggingSecondaryHandleView;
}

- (void)setIsDraggingSecondaryHandleView:(BOOL)a3
{
  self->_isDraggingSecondaryHandleView = a3;
}

- (HUQuickControlRingSliderHandleView)primaryHandleView
{
  return self->_primaryHandleView;
}

- (void)setPrimaryHandleView:(id)a3
{
}

- (HUQuickControlRingSliderHandleView)secondaryHandleView
{
  return self->_secondaryHandleView;
}

- (void)setSecondaryHandleView:(id)a3
{
}

- (UIView)backgroundRingView
{
  return self->_backgroundRingView;
}

- (void)setBackgroundRingView:(id)a3
{
}

- (UIView)edgesAndColoredSupplementaryValueLineView
{
  return self->_edgesAndColoredSupplementaryValueLineView;
}

- (void)setEdgesAndColoredSupplementaryValueLineView:(id)a3
{
}

- (UIImage)gradientRingImage
{
  return self->_gradientRingImage;
}

- (void)setGradientRingImage:(id)a3
{
}

- (UIImageView)selectedRangeImageView
{
  return self->_selectedRangeImageView;
}

- (void)setSelectedRangeImageView:(id)a3
{
}

- (UIImageView)selectedRangeImageViewForEdges
{
  return self->_selectedRangeImageViewForEdges;
}

- (void)setSelectedRangeImageViewForEdges:(id)a3
{
}

- (BOOL)didMaskBackgroundImageView
{
  return self->_didMaskBackgroundImageView;
}

- (void)setDidMaskBackgroundImageView:(BOOL)a3
{
  self->_didMaskBackgroundImageView = a3;
}

- (double)outerRadius
{
  return self->_outerRadius;
}

- (void)setOuterRadius:(double)a3
{
  self->_outerRadius = a3;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (unint64_t)prevTouchArea
{
  return self->_prevTouchArea;
}

- (void)setPrevTouchArea:(unint64_t)a3
{
  self->_prevTouchArea = a3;
}

- (UILabel)supplementaryLabel
{
  return self->_supplementaryLabel;
}

- (void)setSupplementaryLabel:(id)a3
{
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UIView)labelsBackgroundView
{
  return self->_labelsBackgroundView;
}

- (void)setLabelsBackgroundView:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressPanGestureRecognizer
{
  return self->_longPressPanGestureRecognizer;
}

- (void)setLongPressPanGestureRecognizer:(id)a3
{
}

- (UIView)supplementaryValueMarkingView
{
  return self->_supplementaryValueMarkingView;
}

- (void)setSupplementaryValueMarkingView:(id)a3
{
}

- (void)setGradationMarkingViews:(id)a3
{
}

- (void)setMarkingValuesAndViewsDictionary:(id)a3
{
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
}

- (double)prevSliderValue
{
  return self->_prevSliderValue;
}

- (void)setPrevSliderValue:(double)a3
{
  self->_prevSliderValue = a3;
}

- (unint64_t)prevSlidingDirection
{
  return self->_prevSlidingDirection;
}

- (void)setPrevSlidingDirection:(unint64_t)a3
{
  self->_prevSlidingDirection = a3;
}

- (void)setCurrentDirectionTapticValues:(id)a3
{
}

- (BOOL)showOffState
{
  return self->_showOffState;
}

- (void)setShowOffState:(BOOL)a3
{
  self->_showOffState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDirectionTapticValues, 0);
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_markingValuesAndViewsDictionary, 0);
  objc_storeStrong((id *)&self->_gradationMarkingViews, 0);
  objc_storeStrong((id *)&self->_supplementaryValueMarkingView, 0);
  objc_storeStrong((id *)&self->_longPressPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_labelsBackgroundView, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_supplementaryLabel, 0);
  objc_storeStrong((id *)&self->_selectedRangeImageViewForEdges, 0);
  objc_storeStrong((id *)&self->_selectedRangeImageView, 0);
  objc_storeStrong((id *)&self->_gradientRingImage, 0);
  objc_storeStrong((id *)&self->_edgesAndColoredSupplementaryValueLineView, 0);
  objc_storeStrong((id *)&self->_backgroundRingView, 0);
  objc_storeStrong((id *)&self->_secondaryHandleView, 0);
  objc_storeStrong((id *)&self->_primaryHandleView, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end