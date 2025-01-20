@interface HUQuickControlElasticSliderInteractionCoordinator
- ($F24F406B2B787EFB06265DBA3D28CBD5)_rawViewValueRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)modelValue;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasSecondaryValue;
- (BOOL)isFirstTouchDown;
- (BOOL)isUserInteractionActive;
- (HUDisplayLinkApplier)controlVerticalStretchingApplier;
- (HUElasticApplier)controlHorizontalCompressionApplier;
- (HUElasticApplier)primaryValueSmoothingApplier;
- (HUElasticApplier)secondaryValueSmoothingApplier;
- (HUQuickControlElasticSliderInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4;
- (HUQuickControlIncrementalConvertibleProfile)viewProfile;
- (HUQuickControlSliderGestureTransformer)gestureTransformer;
- (NSDate)interactableStartTime;
- (UILongPressGestureRecognizer)panGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)_rubberBandedStretchProgress;
- (double)_sliderValueForLocation:(CGPoint)a3;
- (double)activeGestureValue;
- (id)_allAppliers;
- (id)_rubberBandingValueNormalizer;
- (id)_setupValueApplierForValueType:(unint64_t)a3;
- (id)_valueNormalizerWithOptions:(id)a3;
- (id)value;
- (unint64_t)_findClosestValueFromTouchLocation:(CGPoint)a3;
- (unint64_t)activeGestureValueType;
- (void)_beginReceivingTouchesWithGestureRecognizer:(id)a3 isTouchContinuation:(BOOL)a4;
- (void)_handleControlPanGesture:(id)a3;
- (void)_handleControlTapGesture:(id)a3;
- (void)_setupAllValueAppliersIfNecessary;
- (void)_setupStretchingAppliers;
- (void)_updateControlViewValueOfType:(unint64_t)a3 withValue:(double)a4;
- (void)_updateModelValue:(id)a3 roundValue:(BOOL)a4 notifyDelegate:(BOOL)a5;
- (void)_updatePropertiesForControlValueSmoothingApplier:(id)a3 ofType:(unint64_t)a4;
- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3;
- (void)dealloc;
- (void)gestureDidEndForGestureTransformer:(id)a3;
- (void)gestureTransformer:(id)a3 sliderValueDidChange:(double)a4;
- (void)recordInteractionStart;
- (void)setActiveGestureValue:(double)a3;
- (void)setActiveGestureValueType:(unint64_t)a3;
- (void)setControlHorizontalCompressionApplier:(id)a3;
- (void)setControlVerticalStretchingApplier:(id)a3;
- (void)setFirstTouchDown:(BOOL)a3;
- (void)setGestureTransformer:(id)a3;
- (void)setHasSecondaryValue:(BOOL)a3;
- (void)setInteractableStartTime:(id)a3;
- (void)setModelValue:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPrimaryValueSmoothingApplier:(id)a3;
- (void)setSecondaryValueSmoothingApplier:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setViewVisible:(BOOL)a3;
@end

@implementation HUQuickControlElasticSliderInteractionCoordinator

- (HUQuickControlElasticSliderInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlElasticSliderInteractionCoordinator;
  v7 = [(HUQuickControlInteractionCoordinator *)&v19 initWithControlView:v6 delegate:a4];
  v8 = v7;
  if (v7)
  {
    -[HUQuickControlElasticSliderInteractionCoordinator setModelValue:](v7, "setModelValue:", 0.0, 1.0);
    id v9 = objc_alloc_init(MEMORY[0x1E4F42B70]);
    [(HUQuickControlElasticSliderInteractionCoordinator *)v8 setPanGestureRecognizer:v9];

    v10 = [(HUQuickControlElasticSliderInteractionCoordinator *)v8 panGestureRecognizer];
    [v10 setDelegate:v8];

    v11 = [(HUQuickControlElasticSliderInteractionCoordinator *)v8 panGestureRecognizer];
    [v11 setMinimumPressDuration:0.0];

    v12 = [(HUQuickControlElasticSliderInteractionCoordinator *)v8 panGestureRecognizer];
    [v12 addTarget:v8 action:sel__handleControlPanGesture_];

    v13 = [(HUQuickControlElasticSliderInteractionCoordinator *)v8 panGestureRecognizer];
    [v6 addGestureRecognizer:v13];

    id v14 = objc_alloc_init(MEMORY[0x1E4F42EC8]);
    [(HUQuickControlElasticSliderInteractionCoordinator *)v8 setTapGestureRecognizer:v14];

    v15 = [(HUQuickControlElasticSliderInteractionCoordinator *)v8 tapGestureRecognizer];
    [v15 setAllowableMovement:5.0];

    v16 = [(HUQuickControlElasticSliderInteractionCoordinator *)v8 tapGestureRecognizer];
    [v16 addTarget:v8 action:sel__handleControlTapGesture_];

    v17 = [(HUQuickControlElasticSliderInteractionCoordinator *)v8 tapGestureRecognizer];
    [v6 addGestureRecognizer:v17];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(HUQuickControlElasticSliderInteractionCoordinator *)self _allAppliers];
  objc_msgSend(v3, "na_each:", &__block_literal_global_195);

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlElasticSliderInteractionCoordinator;
  [(HUQuickControlElasticSliderInteractionCoordinator *)&v4 dealloc];
}

uint64_t __60__HUQuickControlElasticSliderInteractionCoordinator_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (HUQuickControlIncrementalConvertibleProfile)viewProfile
{
  v2 = [(HUQuickControlInteractionCoordinator *)self controlView];
  v3 = [v2 profile];
  objc_super v4 = &unk_1F1AA32D8;
  id v5 = v3;
  id v6 = v5;
  if (v5)
  {
    if ([v5 conformsToProtocol:v4]) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    v8 = v6;
    if (v7) {
      goto LABEL_8;
    }
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v11 = NSStringFromProtocol((Protocol *)v4);
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v11 file lineNumber description];
  }
  v8 = 0;
LABEL_8:

  return (HUQuickControlIncrementalConvertibleProfile *)v8;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  id v4 = a3;
  if (![(HUQuickControlElasticSliderInteractionCoordinator *)self hasSecondaryValue]) {
    [(HUQuickControlElasticSliderInteractionCoordinator *)self _beginReceivingTouchesWithGestureRecognizer:v4 isTouchContinuation:1];
  }
}

- (void)recordInteractionStart
{
  if (![(HUQuickControlElasticSliderInteractionCoordinator *)self hasSecondaryValue])
  {
    id v3 = (id)objc_opt_new();
    [(HUQuickControlElasticSliderInteractionCoordinator *)self setInteractableStartTime:v3];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlElasticSliderInteractionCoordinator;
  -[HUQuickControlInteractionCoordinator setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  id v5 = [(HUQuickControlElasticSliderInteractionCoordinator *)self gestureTransformer];
  [v5 setIgnoreTouches:!v3];

  if (!v3) {
    [(HUQuickControlElasticSliderInteractionCoordinator *)self setUserInteractionActive:0];
  }
}

- (id)value
{
  BOOL v3 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
  [(HUElasticSliderValueNormalizationOptions *)v3 setBoundingStrategy:1];
  [(HUElasticSliderValueNormalizationOptions *)v3 setApplyStepValue:1];
  id v4 = [(HUQuickControlElasticSliderInteractionCoordinator *)self _valueNormalizerWithOptions:v3];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self modelValue];
  objc_msgSend(v4, "normalizeRange:");
  double v6 = v5;
  double v8 = v7;
  if ([(HUQuickControlElasticSliderInteractionCoordinator *)self hasSecondaryValue]) {
    objc_msgSend(MEMORY[0x1E4F69368], "rangeWithFloatRange:", v6, v8);
  }
  else {
  id v9 = [NSNumber numberWithDouble:v8];
  }

  return v9;
}

- (void)setValue:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v4 = v14;
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
    id v6 = v5;

    -[HUQuickControlElasticSliderInteractionCoordinator setHasSecondaryValue:](self, "setHasSecondaryValue:", [v6 type] == 1);
    if ([(HUQuickControlElasticSliderInteractionCoordinator *)self hasSecondaryValue])
    {
      [v6 floatRangeValue];
      double v8 = v7;
      double v10 = v9;
    }
    else
    {
      v12 = [v6 midValue];
      [v12 doubleValue];
      double v10 = v13;
      double v8 = 0.0;
    }
  }
  else
  {
    [(HUQuickControlElasticSliderInteractionCoordinator *)self setHasSecondaryValue:0];
    [v14 doubleValue];
    double v10 = v11;
    double v8 = 0.0;
  }
  -[HUQuickControlElasticSliderInteractionCoordinator _updateModelValue:roundValue:notifyDelegate:](self, "_updateModelValue:roundValue:notifyDelegate:", 1, 0, v8, v10);
  [(HUQuickControlElasticSliderInteractionCoordinator *)self _setupAllValueAppliersIfNecessary];
}

- (void)setHasSecondaryValue:(BOOL)a3
{
  self->_hasSecondaryValue = a3;
  if (!a3)
  {
    id v4 = [(HUQuickControlElasticSliderInteractionCoordinator *)self secondaryValueSmoothingApplier];
    [v4 cancel];

    [(HUQuickControlElasticSliderInteractionCoordinator *)self setSecondaryValueSmoothingApplier:0];
  }
}

- (void)setUserInteractionActive:(BOOL)a3
{
  if (self->_userInteractionActive != a3)
  {
    BOOL v3 = a3;
    self->_userInteractionActive = a3;
    id v5 = [(HUQuickControlInteractionCoordinator *)self delegate];
    [v5 interactionCoordinator:self interactionStateDidChange:v3];
  }
}

- (void)setViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUQuickControlInteractionCoordinator *)self viewVisible] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)HUQuickControlElasticSliderInteractionCoordinator;
    [(HUQuickControlInteractionCoordinator *)&v6 setViewVisible:v3];
    if (!v3)
    {
      id v5 = [(HUQuickControlElasticSliderInteractionCoordinator *)self _allAppliers];
      objc_msgSend(v5, "na_each:", &__block_literal_global_67_1);
    }
  }
}

uint64_t __68__HUQuickControlElasticSliderInteractionCoordinator_setViewVisible___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)setActiveGestureValue:(double)a3
{
  if (self->_activeGestureValue != a3)
  {
    self->_activeGestureValue = a3;
    id v4 = [(HUQuickControlElasticSliderInteractionCoordinator *)self primaryValueSmoothingApplier];
    [(HUQuickControlElasticSliderInteractionCoordinator *)self _updatePropertiesForControlValueSmoothingApplier:v4 ofType:2];

    id v5 = [(HUQuickControlElasticSliderInteractionCoordinator *)self secondaryValueSmoothingApplier];
    [(HUQuickControlElasticSliderInteractionCoordinator *)self _updatePropertiesForControlValueSmoothingApplier:v5 ofType:1];
  }
}

- (void)_updateControlViewValueOfType:(unint64_t)a3 withValue:(double)a4
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v7 = [NSNumber numberWithDouble:a4];
      id v5 = [(HUQuickControlInteractionCoordinator *)self controlView];
      [v5 setSecondaryValue:v7];
    }
    else
    {
      if (a3 != 2) {
        return;
      }
      id v7 = [NSNumber numberWithDouble:a4];
      id v5 = [(HUQuickControlInteractionCoordinator *)self controlView];
      [v5 setValue:v7];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2 object:self file:@"HUQuickControlElasticSliderInteractionCoordinator.m" lineNumber:212 description:@"Invalid control view value type!"];
  }
}

- (void)_updateModelValue:(id)a3 roundValue:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  double v13 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
  [(HUElasticSliderValueNormalizationOptions *)v13 setBoundingStrategy:1];
  [(HUElasticSliderValueNormalizationOptions *)v13 setApplyStepValue:v6];
  double v10 = [(HUQuickControlElasticSliderInteractionCoordinator *)self _valueNormalizerWithOptions:v13];
  objc_msgSend(v10, "normalizeRange:", var0, var1);
  -[HUQuickControlElasticSliderInteractionCoordinator setModelValue:](self, "setModelValue:");
  if (v5)
  {
    double v11 = [(HUQuickControlInteractionCoordinator *)self delegate];
    v12 = [(HUQuickControlElasticSliderInteractionCoordinator *)self value];
    [v11 interactionCoordinator:self viewValueDidChange:v12];
  }
}

- (void)_handleControlPanGesture:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HUQuickControlInteractionCoordinator *)self controlView];
  if ([v5 conformsToProtocol:&unk_1F1A161E8])
  {
    BOOL v6 = [(HUQuickControlInteractionCoordinator *)self controlView];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(HUQuickControlInteractionCoordinator *)self controlView];
      if (![v8 reachabilityState])
      {

LABEL_13:
        id v14 = [(HUQuickControlInteractionCoordinator *)self controlView];
        v15 = HUQuickControlReachabilityString([v14 reachabilityState]);

        v16 = HFLogForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [(HUQuickControlInteractionCoordinator *)self controlView];
          int v18 = 138412802;
          objc_super v19 = v17;
          __int16 v20 = 2112;
          v21 = v15;
          __int16 v22 = 2080;
          v23 = "-[HUQuickControlElasticSliderInteractionCoordinator _handleControlPanGesture:]";
          _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "Control view %@ is in state %@. Ignoring pan gesture in %s.", (uint8_t *)&v18, 0x20u);
        }
        goto LABEL_16;
      }
      double v9 = [(HUQuickControlInteractionCoordinator *)self controlView];
      uint64_t v10 = [v9 reachabilityState];

      if (v10 == 1) {
        goto LABEL_13;
      }
    }
  }
  else
  {
  }
  if ([v4 state] == 1)
  {
    interactableStartTime = self->_interactableStartTime;
    if (interactableStartTime)
    {
      [(NSDate *)interactableStartTime timeIntervalSinceNow];
      BOOL v13 = fabs(v12) < 0.05;
    }
    else
    {
      BOOL v13 = 0;
    }
    [(HUQuickControlElasticSliderInteractionCoordinator *)self _beginReceivingTouchesWithGestureRecognizer:v4 isTouchContinuation:v13];
  }
LABEL_16:
}

- (void)_handleControlTapGesture:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HUQuickControlInteractionCoordinator *)self controlView];
  if ([v5 conformsToProtocol:&unk_1F1A161E8])
  {
    BOOL v6 = [(HUQuickControlInteractionCoordinator *)self controlView];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(HUQuickControlInteractionCoordinator *)self controlView];
      if (![v8 reachabilityState])
      {

LABEL_16:
        v21 = [(HUQuickControlInteractionCoordinator *)self controlView];
        __int16 v22 = HUQuickControlReachabilityString([v21 reachabilityState]);

        v23 = HFLogForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [(HUQuickControlInteractionCoordinator *)self controlView];
          int v25 = 138412802;
          v26 = v24;
          __int16 v27 = 2112;
          v28 = v22;
          __int16 v29 = 2080;
          v30 = "-[HUQuickControlElasticSliderInteractionCoordinator _handleControlTapGesture:]";
          _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "Control view %@ is in state %@. Ignoring tap gesture in %s.", (uint8_t *)&v25, 0x20u);
        }
        goto LABEL_19;
      }
      double v9 = [(HUQuickControlInteractionCoordinator *)self controlView];
      uint64_t v10 = [v9 reachabilityState];

      if (v10 == 1) {
        goto LABEL_16;
      }
    }
  }
  else
  {
  }
  if ([v4 state] == 3)
  {
    [(HUQuickControlElasticSliderInteractionCoordinator *)self setUserInteractionActive:1];
    objc_msgSend(v4, "hu_locationInGlobalCoordinateSpace");
    double v12 = v11;
    double v14 = v13;
    unint64_t v15 = -[HUQuickControlElasticSliderInteractionCoordinator _findClosestValueFromTouchLocation:](self, "_findClosestValueFromTouchLocation:");
    -[HUQuickControlElasticSliderInteractionCoordinator _sliderValueForLocation:](self, "_sliderValueForLocation:", v12, v14);
    double v17 = v16;
    [(HUQuickControlElasticSliderInteractionCoordinator *)self modelValue];
    if (v15 == 1) {
      double v20 = v17;
    }
    else {
      double v20 = v18;
    }
    if (v15 == 2) {
      double v19 = v17;
    }
    else {
      double v18 = v20;
    }
    -[HUQuickControlElasticSliderInteractionCoordinator _updateModelValue:roundValue:notifyDelegate:](self, "_updateModelValue:roundValue:notifyDelegate:", 1, 1, v18, v19, v20);
    [(HUQuickControlElasticSliderInteractionCoordinator *)self setUserInteractionActive:0];
  }
LABEL_19:
}

- (void)_beginReceivingTouchesWithGestureRecognizer:(id)a3 isTouchContinuation:(BOOL)a4
{
  BOOL v4 = a4;
  id v29 = a3;
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setUserInteractionActive:1];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setFirstTouchDown:v4];
  objc_msgSend(v29, "hu_locationInGlobalCoordinateSpace");
  -[HUQuickControlElasticSliderInteractionCoordinator setActiveGestureValueType:](self, "setActiveGestureValueType:", -[HUQuickControlElasticSliderInteractionCoordinator _findClosestValueFromTouchLocation:](self, "_findClosestValueFromTouchLocation:"));
  [(HUQuickControlElasticSliderInteractionCoordinator *)self modelValue];
  double v7 = v6;
  double v9 = v8;
  unint64_t v10 = [(HUQuickControlElasticSliderInteractionCoordinator *)self activeGestureValueType];
  if (v10 != 2)
  {
    if (v10 == 1)
    {
      double v9 = v7;
    }
    else
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      double v12 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat HURangeValueOfType(UIFloatRange, HUQuickControlRangeValueType)");
      [v11 handleFailureInFunction:v12 file:@"HUQuickControlRangeValueUtilities.h" lineNumber:31 description:@"Invalid range value type"];

      double v9 = 1.79769313e308;
    }
  }
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setActiveGestureValue:v9];
  double v13 = objc_opt_new();
  double v14 = [(HUQuickControlInteractionCoordinator *)self controlView];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(HUQuickControlInteractionCoordinator *)self controlView];
  objc_msgSend(v13, "setControlFrame:", HUConvertRectToGlobalCoordinateSpace(v23, v16, v18, v20, v22));

  [(HUQuickControlElasticSliderInteractionCoordinator *)self activeGestureValue];
  objc_msgSend(v13, "setInitialSliderValue:");
  uint64_t v24 = [(HUQuickControlElasticSliderInteractionCoordinator *)self viewProfile];
  [v24 gestureDragCoefficient];
  objc_msgSend(v13, "setVerticalDragCoefficient:");

  [v13 setRequiresSomeMovementBeforeActivation:v4];
  int v25 = [[HUQuickControlSliderGestureTransformer alloc] initWithGestureRecognizer:v29 context:v13];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setGestureTransformer:v25];

  uint64_t v26 = [(HUQuickControlInteractionCoordinator *)self isUserInteractionEnabled] ^ 1;
  __int16 v27 = [(HUQuickControlElasticSliderInteractionCoordinator *)self gestureTransformer];
  [v27 setIgnoreTouches:v26];

  v28 = [(HUQuickControlElasticSliderInteractionCoordinator *)self gestureTransformer];
  [v28 setDelegate:self];

  [(HUQuickControlElasticSliderInteractionCoordinator *)self _setupAllValueAppliersIfNecessary];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_rawViewValueRange
{
  BOOL v3 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
  [(HUElasticSliderValueNormalizationOptions *)v3 setApplyMinimumVisualRangeSpan:1];
  BOOL v4 = [(HUQuickControlElasticSliderInteractionCoordinator *)self _valueNormalizerWithOptions:v3];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self modelValue];
  objc_msgSend(v4, "normalizeRange:");
  double v6 = v5;
  double v8 = v7;

  unint64_t v9 = [(HUQuickControlElasticSliderInteractionCoordinator *)self activeGestureValueType];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self activeGestureValue];
  if (v9 == 1) {
    double v11 = v10;
  }
  else {
    double v11 = v6;
  }
  if (v9 == 2) {
    double v8 = v10;
  }
  else {
    double v6 = v11;
  }

  double v12 = v6;
  double v13 = v8;
  result.double var1 = v13;
  result.double var0 = v12;
  return result;
}

- (double)_sliderValueForLocation:(CGPoint)a3
{
  double y = a3.y;
  double v5 = [(HUQuickControlInteractionCoordinator *)self controlView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(HUQuickControlInteractionCoordinator *)self controlView];
  double v15 = HUConvertRectToGlobalCoordinateSpace(v14, v7, v9, v11, v13);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v24.origin.x = v15;
  v24.origin.double y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  double Height = CGRectGetHeight(v24);
  v25.origin.x = v15;
  v25.origin.double y = v17;
  v25.size.width = v19;
  v25.size.height = v21;
  return (CGRectGetMaxY(v25) - y) / Height;
}

- (unint64_t)_findClosestValueFromTouchLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(HUQuickControlElasticSliderInteractionCoordinator *)self hasSecondaryValue]) {
    return 2;
  }
  -[HUQuickControlElasticSliderInteractionCoordinator _sliderValueForLocation:](self, "_sliderValueForLocation:", x, y);
  double v7 = v6;
  [(HUQuickControlElasticSliderInteractionCoordinator *)self modelValue];
  double v9 = vabdd_f64(v7, v8);
  [(HUQuickControlElasticSliderInteractionCoordinator *)self modelValue];
  if (v9 < vabdd_f64(v7, v10)) {
    return 1;
  }
  [(HUQuickControlElasticSliderInteractionCoordinator *)self modelValue];
  if (v7 < v12) {
    return 1;
  }
  else {
    return 2;
  }
}

- (double)_rubberBandedStretchProgress
{
  BOOL v3 = [(HUQuickControlElasticSliderInteractionCoordinator *)self primaryValueSmoothingApplier];
  [v3 progress];
  double v5 = v4;

  double v6 = [(HUQuickControlElasticSliderInteractionCoordinator *)self secondaryValueSmoothingApplier];
  double v7 = 0.0;
  double v8 = 0.0;
  if (v6)
  {
    double v9 = [(HUQuickControlElasticSliderInteractionCoordinator *)self secondaryValueSmoothingApplier];
    [v9 progress];
    double v8 = v10;
  }
  unint64_t v11 = [(HUQuickControlElasticSliderInteractionCoordinator *)self activeGestureValueType];
  unint64_t v12 = [(HUQuickControlElasticSliderInteractionCoordinator *)self activeGestureValueType];
  switch(v12)
  {
    case 2uLL:
      double v7 = v5;
      break;
    case 1uLL:
      double v7 = v8;
      break;
    case 0uLL:
      double v13 = fabs(v5 + -0.5);
      double v14 = fabs(v8 + -0.5);
      if (v13 <= v14) {
        double v7 = v8;
      }
      else {
        double v7 = v5;
      }
      if (v13 <= v14) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = 2;
      }
      break;
  }
  double v15 = [(HUQuickControlElasticSliderInteractionCoordinator *)self _rubberBandingValueNormalizer];
  [v15 normalizeValue:v11 ofType:v7];
  double v17 = v16;

  return v17;
}

- (id)_rubberBandingValueNormalizer
{
  BOOL v3 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
  [(HUElasticSliderValueNormalizationOptions *)v3 setBoundingStrategy:2];
  [(HUElasticSliderValueNormalizationOptions *)v3 setApplyMinimumVisualRangeSpan:1];
  double v4 = [(HUQuickControlElasticSliderInteractionCoordinator *)self _valueNormalizerWithOptions:v3];

  return v4;
}

- (id)_valueNormalizerWithOptions:(id)a3
{
  id v4 = a3;
  double v5 = [HUElasticSliderValueNormalizer alloc];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self modelValue];
  double v8 = -[HUElasticSliderValueNormalizer initWithCurrentValueRange:hasSecondaryValue:](v5, "initWithCurrentValueRange:hasSecondaryValue:", [(HUQuickControlElasticSliderInteractionCoordinator *)self hasSecondaryValue], v6, v7);
  double v9 = [(HUQuickControlElasticSliderInteractionCoordinator *)self viewProfile];
  double v10 = [v9 primaryValueConstraints];
  [(HUElasticSliderValueNormalizer *)v8 setMaxValueConstraints:v10];

  unint64_t v11 = [(HUQuickControlElasticSliderInteractionCoordinator *)self viewProfile];
  unint64_t v12 = [v11 secondaryValueConstraints];
  [(HUElasticSliderValueNormalizer *)v8 setMinValueConstraints:v12];

  [(HUElasticSliderValueNormalizer *)v8 setOptions:v4];

  return v8;
}

- (id)_allAppliers
{
  BOOL v3 = objc_opt_new();
  id v4 = [(HUQuickControlElasticSliderInteractionCoordinator *)self primaryValueSmoothingApplier];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  double v5 = [(HUQuickControlElasticSliderInteractionCoordinator *)self secondaryValueSmoothingApplier];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  double v6 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlHorizontalCompressionApplier];
  objc_msgSend(v3, "na_safeAddObject:", v6);

  double v7 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlVerticalStretchingApplier];
  objc_msgSend(v3, "na_safeAddObject:", v7);

  return v3;
}

- (void)_setupAllValueAppliersIfNecessary
{
  BOOL v3 = [(HUQuickControlElasticSliderInteractionCoordinator *)self primaryValueSmoothingApplier];
  BOOL v4 = __86__HUQuickControlElasticSliderInteractionCoordinator__setupAllValueAppliersIfNecessary__block_invoke(v3);

  if (v4)
  {
    double v5 = [(HUQuickControlElasticSliderInteractionCoordinator *)self _setupValueApplierForValueType:2];
    [(HUQuickControlElasticSliderInteractionCoordinator *)self setPrimaryValueSmoothingApplier:v5];
  }
  double v6 = [(HUQuickControlElasticSliderInteractionCoordinator *)self secondaryValueSmoothingApplier];
  if (__86__HUQuickControlElasticSliderInteractionCoordinator__setupAllValueAppliersIfNecessary__block_invoke(v6))
  {
    BOOL v7 = [(HUQuickControlElasticSliderInteractionCoordinator *)self hasSecondaryValue];

    if (!v7) {
      goto LABEL_7;
    }
    double v6 = [(HUQuickControlElasticSliderInteractionCoordinator *)self _setupValueApplierForValueType:1];
    [(HUQuickControlElasticSliderInteractionCoordinator *)self setSecondaryValueSmoothingApplier:v6];
  }

LABEL_7:
  double v8 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlHorizontalCompressionApplier];
  BOOL v9 = __86__HUQuickControlElasticSliderInteractionCoordinator__setupAllValueAppliersIfNecessary__block_invoke(v8);

  if (v9)
  {
    [(HUQuickControlElasticSliderInteractionCoordinator *)self _setupStretchingAppliers];
  }
}

BOOL __86__HUQuickControlElasticSliderInteractionCoordinator__setupAllValueAppliersIfNecessary__block_invoke(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ([v1 state]) {
      BOOL v3 = [v2 state] != 1;
    }
    else {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (id)_setupValueApplierForValueType:(unint64_t)a3
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke;
  v13[3] = &unk_1E6385738;
  v13[4] = self;
  v13[5] = a3;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v13];
  objc_initWeak(&location, self);
  double v5 = [HUElasticApplier alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke_2;
  v10[3] = &unk_1E638E7E0;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  double v6 = [(HUElasticApplier *)v5 initWithProgressInputBlock:v10];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self _updatePropertiesForControlValueSmoothingApplier:v6 ofType:a3];
  [(HUElasticApplier *)v6 setProgressBeginsFromInitialInputProgress:1];
  [(HUElasticApplier *)v6 setCompletesWhenAtRest:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke_3;
  v8[3] = &unk_1E638E808;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  [(HUApplier *)v6 addApplierBlock:v8];
  [(HUElasticApplier *)v6 start];
  objc_destroyWeak(v9);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

  return v6;
}

uint64_t __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _rawViewValueRange];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == 2)
  {
    double v2 = v3;
  }
  else if (v4 != 1)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat HURangeValueOfType(UIFloatRange, HUQuickControlRangeValueType)");
    [v5 handleFailureInFunction:v6 file:@"HUQuickControlRangeValueUtilities.h" lineNumber:31 description:@"Invalid range value type"];

    uint64_t v4 = *(void *)(a1 + 40);
    double v2 = 1.79769313e308;
  }
  BOOL v7 = *(void **)(a1 + 32);

  return [v7 _updateControlViewValueOfType:v4 withValue:v2];
}

double __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rawViewValueRange];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5 == 2)
  {
    double v6 = v4;
  }
  else if (v5 == 1)
  {
    double v6 = v3;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    double v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat HURangeValueOfType(UIFloatRange, HUQuickControlRangeValueType)");
    [v7 handleFailureInFunction:v8 file:@"HUQuickControlRangeValueUtilities.h" lineNumber:31 description:@"Invalid range value type"];

    double v6 = 1.79769313e308;
  }

  return v6;
}

void __84__HUQuickControlElasticSliderInteractionCoordinator__setupValueApplierForValueType___block_invoke_3(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = [WeakRetained _rubberBandingValueNormalizer];
  [v4 normalizeValue:*(void *)(a1 + 40) ofType:a2];
  double v6 = v5;

  [WeakRetained _updateControlViewValueOfType:*(void *)(a1 + 40) withValue:v6];
}

- (void)_setupStretchingAppliers
{
  objc_initWeak(&location, self);
  double v3 = [HUElasticApplier alloc];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke;
  v22[3] = &unk_1E638E830;
  objc_copyWeak(&v23, &location);
  double v4 = [(HUElasticApplier *)v3 initWithProgressInputBlock:v22];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setControlHorizontalCompressionApplier:v4];

  double v5 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlHorizontalCompressionApplier];
  [v5 setProgressBeginsFromInitialInputProgress:1];

  double v6 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlHorizontalCompressionApplier];
  [v6 setTension:300.0];

  BOOL v7 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlHorizontalCompressionApplier];
  [v7 setFriction:100.0];

  double v8 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlHorizontalCompressionApplier];
  [v8 setCompletesWhenAtRest:0];

  BOOL v9 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlHorizontalCompressionApplier];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_2;
  v20[3] = &unk_1E63854F8;
  objc_copyWeak(&v21, &location);
  [v9 addApplierBlock:v20];

  double v10 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlHorizontalCompressionApplier];
  [v10 start];

  unint64_t v11 = [HUDisplayLinkApplier alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_3;
  v18[3] = &unk_1E638E858;
  objc_copyWeak(&v19, &location);
  unint64_t v12 = [(HUDisplayLinkApplier *)v11 initWithProgressInputBlock:v18];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setControlVerticalStretchingApplier:v12];

  double v13 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlVerticalStretchingApplier];
  [v13 setCompletesWhenAtRest:0];

  double v14 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlVerticalStretchingApplier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_4;
  v16[3] = &unk_1E63854F8;
  objc_copyWeak(&v17, &location);
  [v14 addApplierBlock:v16];

  double v15 = [(HUQuickControlElasticSliderInteractionCoordinator *)self controlVerticalStretchingApplier];
  [v15 start];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

double __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rubberBandedStretchProgress];
  double v3 = v2;

  return v3;
}

void __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_2(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  double v4 = fabs(a2);
  if (a2 >= 0.0) {
    double v4 = 0.0;
  }
  if (a2 > 1.0) {
    double v5 = a2 + -1.0;
  }
  else {
    double v5 = v4;
  }
  double v6 = v5 / 0.16 * 0.08 + 0.0;
  BOOL v7 = [WeakRetained delegate];
  [v7 interactionCoordinator:v8 updateControlHorizontalCompressionFactor:v6];
}

double __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rubberBandedStretchProgress];
  double v3 = v2;

  return v3;
}

void __77__HUQuickControlElasticSliderInteractionCoordinator__setupStretchingAppliers__block_invoke_4(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  double v4 = 0.0;
  if (a2 < 0.0) {
    double v4 = a2;
  }
  if (a2 > 1.0) {
    double v5 = a2 + -1.0;
  }
  else {
    double v5 = v4;
  }
  double v6 = objc_msgSend(WeakRetained, "delegate", 1.0);
  [v6 interactionCoordinator:v7 updateControlVerticalStretchFactor:v5];
}

- (void)_updatePropertiesForControlValueSmoothingApplier:(id)a3 ofType:(unint64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    [v6 progress];
    double v8 = v7;
    double v16 = objc_alloc_init(HUElasticSliderValueNormalizationOptions);
    [(HUElasticSliderValueNormalizationOptions *)v16 setApplyMinimumVisualRangeSpan:1];
    BOOL v9 = [(HUQuickControlElasticSliderInteractionCoordinator *)self _valueNormalizerWithOptions:v16];
    [v9 normalizeValue:a4 ofType:v8];
    double v11 = v10;

    BOOL v12 = [(HUQuickControlElasticSliderInteractionCoordinator *)self isUserInteractionActive];
    int v13 = vabdd_f64(v11, v8) >= 0.00000011920929 || v12;
    double v14 = 40.0;
    if (v13)
    {
      double v15 = 700.0;
    }
    else
    {
      double v14 = 20.0;
      double v15 = 180.0;
    }
    [v6 setFriction:v14];
    [v6 setTension:v15];
  }
}

- (void)gestureTransformer:(id)a3 sliderValueDidChange:(double)a4
{
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setActiveGestureValue:a3];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self modelValue];
  double v7 = v6;
  double v9 = v8;
  unint64_t v10 = [(HUQuickControlElasticSliderInteractionCoordinator *)self activeGestureValueType];
  if (v10 == 1) {
    double v11 = a4;
  }
  else {
    double v11 = v7;
  }
  if (v10 == 2)
  {
    double v11 = v7;
    double v12 = a4;
  }
  else
  {
    double v12 = v9;
  }

  -[HUQuickControlElasticSliderInteractionCoordinator _updateModelValue:roundValue:notifyDelegate:](self, "_updateModelValue:roundValue:notifyDelegate:", 0, 1, v11, v12);
}

- (void)gestureDidEndForGestureTransformer:(id)a3
{
  id v4 = a3;
  [(HUQuickControlElasticSliderInteractionCoordinator *)self modelValue];
  -[HUQuickControlElasticSliderInteractionCoordinator _updateModelValue:roundValue:notifyDelegate:](self, "_updateModelValue:roundValue:notifyDelegate:", 1, 1);
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setUserInteractionActive:0];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setGestureTransformer:0];
  int v5 = [v4 hasRecognizedSignificantSliderValueChange];

  if (v5)
  {
    double v6 = [(HUQuickControlInteractionCoordinator *)self delegate];
    if ([v6 hasModelValueChangedForInteractionCoordinator:self])
    {
      BOOL v7 = [(HUQuickControlElasticSliderInteractionCoordinator *)self isFirstTouchDown];

      if (!v7) {
        goto LABEL_6;
      }
      double v6 = [(HUQuickControlInteractionCoordinator *)self delegate];
      [v6 interactionCoordinatorWantsDismissal:self];
    }
  }
LABEL_6:
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setFirstTouchDown:0];
  [(HUQuickControlElasticSliderInteractionCoordinator *)self setActiveGestureValueType:0];

  [(HUQuickControlElasticSliderInteractionCoordinator *)self setActiveGestureValue:0.0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUQuickControlElasticSliderInteractionCoordinator *)self panGestureRecognizer];

  if (v8 == v7)
  {
    id v10 = [(HUQuickControlElasticSliderInteractionCoordinator *)self tapGestureRecognizer];
    BOOL v9 = v10 == v6;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (BOOL)hasSecondaryValue
{
  return self->_hasSecondaryValue;
}

- (HUQuickControlSliderGestureTransformer)gestureTransformer
{
  return self->_gestureTransformer;
}

- (void)setGestureTransformer:(id)a3
{
}

- (UILongPressGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (HUElasticApplier)primaryValueSmoothingApplier
{
  return self->_primaryValueSmoothingApplier;
}

- (void)setPrimaryValueSmoothingApplier:(id)a3
{
}

- (HUElasticApplier)secondaryValueSmoothingApplier
{
  return self->_secondaryValueSmoothingApplier;
}

- (void)setSecondaryValueSmoothingApplier:(id)a3
{
}

- (HUDisplayLinkApplier)controlVerticalStretchingApplier
{
  return self->_controlVerticalStretchingApplier;
}

- (void)setControlVerticalStretchingApplier:(id)a3
{
}

- (HUElasticApplier)controlHorizontalCompressionApplier
{
  return self->_controlHorizontalCompressionApplier;
}

- (void)setControlHorizontalCompressionApplier:(id)a3
{
}

- (double)activeGestureValue
{
  return self->_activeGestureValue;
}

- (unint64_t)activeGestureValueType
{
  return self->_activeGestureValueType;
}

- (void)setActiveGestureValueType:(unint64_t)a3
{
  self->_activeGestureValueType = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)modelValue
{
  double minimum = self->_modelValue.minimum;
  double maximum = self->_modelValue.maximum;
  result.double var1 = maximum;
  result.double var0 = minimum;
  return result;
}

- (void)setModelValue:(id)a3
{
  self->_modelValue = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (BOOL)isFirstTouchDown
{
  return self->_firstTouchDown;
}

- (void)setFirstTouchDown:(BOOL)a3
{
  self->_firstTouchDown = a3;
}

- (NSDate)interactableStartTime
{
  return self->_interactableStartTime;
}

- (void)setInteractableStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactableStartTime, 0);
  objc_storeStrong((id *)&self->_controlHorizontalCompressionApplier, 0);
  objc_storeStrong((id *)&self->_controlVerticalStretchingApplier, 0);
  objc_storeStrong((id *)&self->_secondaryValueSmoothingApplier, 0);
  objc_storeStrong((id *)&self->_primaryValueSmoothingApplier, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_gestureTransformer, 0);
}

@end