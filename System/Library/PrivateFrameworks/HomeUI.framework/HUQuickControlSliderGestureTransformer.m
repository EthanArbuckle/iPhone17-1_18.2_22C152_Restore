@interface HUQuickControlSliderGestureTransformer
- (BOOL)hasRecognizedSignificantSliderValueChange;
- (BOOL)ignoreTouches;
- (CGPoint)lastTouchLocation;
- (CGPoint)referenceTouchLocation;
- (HUQuickControlPanningContext)context;
- (HUQuickControlSliderGestureTransformer)initWithGestureRecognizer:(id)a3 context:(id)a4;
- (HUQuickControlSliderGestureTransformerDelegate)delegate;
- (UIGestureRecognizer)gestureRecognizer;
- (double)_rawSliderValueForLocation:(CGPoint)a3;
- (double)accumulatedDragDistance;
- (double)currentSliderValue;
- (double)referenceSliderValue;
- (void)_handleGesturePan:(id)a3;
- (void)_handleSliderValuePan:(CGPoint)a3;
- (void)dealloc;
- (void)setAccumulatedDragDistance:(double)a3;
- (void)setCurrentSliderValue:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setHasRecognizedSignificantSliderValueChange:(BOOL)a3;
- (void)setIgnoreTouches:(BOOL)a3;
- (void)setLastTouchLocation:(CGPoint)a3;
- (void)setReferenceSliderValue:(double)a3;
- (void)setReferenceTouchLocation:(CGPoint)a3;
@end

@implementation HUQuickControlSliderGestureTransformer

- (HUQuickControlSliderGestureTransformer)initWithGestureRecognizer:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlSliderGestureTransformer;
  v9 = [(HUQuickControlSliderGestureTransformer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_gestureRecognizer, a3);
    [v8 assertConfigurationIsValid];
    objc_storeStrong((id *)&v10->_context, a4);
    objc_msgSend(v7, "hu_locationInGlobalCoordinateSpace");
    -[HUQuickControlSliderGestureTransformer setReferenceTouchLocation:](v10, "setReferenceTouchLocation:");
    [v8 initialSliderValue];
    -[HUQuickControlSliderGestureTransformer setReferenceSliderValue:](v10, "setReferenceSliderValue:");
    [v8 initialSliderValue];
    -[HUQuickControlSliderGestureTransformer setCurrentSliderValue:](v10, "setCurrentSliderValue:");
    [(HUQuickControlSliderGestureTransformer *)v10 setGestureRecognizer:v7];
    [v7 addTarget:v10 action:sel__handleGesturePan_];
  }

  return v10;
}

- (void)dealloc
{
  v3 = [(HUQuickControlSliderGestureTransformer *)self gestureRecognizer];
  [v3 removeTarget:self action:0];

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlSliderGestureTransformer;
  [(HUQuickControlSliderGestureTransformer *)&v4 dealloc];
}

- (void)_handleGesturePan:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 state];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if ((unint64_t)(v4 - 1) < 2)
    {
      objc_msgSend(v10, "hu_locationInGlobalCoordinateSpace");
      double v7 = v6;
      double v9 = v8;
      if ([(HUQuickControlSliderGestureTransformer *)self _shouldIgnoreAllGestures])
      {
        -[HUQuickControlSliderGestureTransformer setLastTouchLocation:](self, "setLastTouchLocation:", v7, v9);
        -[HUQuickControlSliderGestureTransformer setReferenceTouchLocation:](self, "setReferenceTouchLocation:", v7, v9);
      }
      else
      {
        -[HUQuickControlSliderGestureTransformer _handleSliderValuePan:](self, "_handleSliderValuePan:", v7, v9);
      }
    }
  }
  else
  {
    v5 = [(HUQuickControlSliderGestureTransformer *)self delegate];
    [v5 gestureDidEndForGestureTransformer:self];
  }
}

- (void)_handleSliderValuePan:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HUQuickControlSliderGestureTransformer *)self lastTouchLocation];
  if (v7 != *MEMORY[0x1E4F1DAD8] || v6 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    [(HUQuickControlSliderGestureTransformer *)self lastTouchLocation];
    UIDistanceBetweenPoints();
    double v10 = v9;
    [(HUQuickControlSliderGestureTransformer *)self accumulatedDragDistance];
    [(HUQuickControlSliderGestureTransformer *)self setAccumulatedDragDistance:v10 + v11];
  }
  -[HUQuickControlSliderGestureTransformer setLastTouchLocation:](self, "setLastTouchLocation:", x, y);
  objc_super v12 = [(HUQuickControlSliderGestureTransformer *)self context];
  if ([v12 requiresSomeMovementBeforeActivation])
  {
    [(HUQuickControlSliderGestureTransformer *)self accumulatedDragDistance];
    double v14 = v13;

    if (v14 < 25.0)
    {
      -[HUQuickControlSliderGestureTransformer setReferenceTouchLocation:](self, "setReferenceTouchLocation:", x, y);
      return;
    }
  }
  else
  {
  }
  -[HUQuickControlSliderGestureTransformer _rawSliderValueForLocation:](self, "_rawSliderValueForLocation:", x, y);
  double v16 = v15;
  [(HUQuickControlSliderGestureTransformer *)self currentSliderValue];
  double v18 = v17;
  if (![(HUQuickControlSliderGestureTransformer *)self hasRecognizedSignificantSliderValueChange])
  {
    [(HUQuickControlSliderGestureTransformer *)self referenceSliderValue];
    if (vabdd_f64(v19, v16) >= 0.15) {
      [(HUQuickControlSliderGestureTransformer *)self setHasRecognizedSignificantSliderValueChange:1];
    }
  }
  double v20 = v16 - v18;
  [(HUQuickControlSliderGestureTransformer *)self referenceTouchLocation];
  if (v16 > 1.0 && v20 < 0.0 || v16 < 0.0 && v20 > 0.0)
  {
    double v16 = fmin(fmax(v16, 0.0), 1.0);
    [(HUQuickControlSliderGestureTransformer *)self setReferenceSliderValue:v16];
    double v21 = y;
  }
  -[HUQuickControlSliderGestureTransformer setReferenceTouchLocation:](self, "setReferenceTouchLocation:", x, v21);
  [(HUQuickControlSliderGestureTransformer *)self setCurrentSliderValue:v16];
  id v22 = [(HUQuickControlSliderGestureTransformer *)self delegate];
  [v22 gestureTransformer:self sliderValueDidChange:v16];
}

- (double)_rawSliderValueForLocation:(CGPoint)a3
{
  double y = a3.y;
  [(HUQuickControlSliderGestureTransformer *)self referenceTouchLocation];
  double v6 = v5;
  double v7 = [(HUQuickControlSliderGestureTransformer *)self context];
  [v7 controlFrame];
  double Height = CGRectGetHeight(v14);
  double v9 = [(HUQuickControlSliderGestureTransformer *)self context];
  [v9 verticalDragCoefficient];
  double v11 = Height * v10;

  [(HUQuickControlSliderGestureTransformer *)self referenceSliderValue];
  return v12 - (y - v6) / v11;
}

- (HUQuickControlSliderGestureTransformerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUQuickControlSliderGestureTransformerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (HUQuickControlPanningContext)context
{
  return self->_context;
}

- (BOOL)ignoreTouches
{
  return self->_ignoreTouches;
}

- (void)setIgnoreTouches:(BOOL)a3
{
  self->_ignoreTouches = a3;
}

- (BOOL)hasRecognizedSignificantSliderValueChange
{
  return self->_hasRecognizedSignificantSliderValueChange;
}

- (void)setHasRecognizedSignificantSliderValueChange:(BOOL)a3
{
  self->_hasRecognizedSignificantSliderValueChange = a3;
}

- (double)referenceSliderValue
{
  return self->_referenceSliderValue;
}

- (void)setReferenceSliderValue:(double)a3
{
  self->_referenceSliderValue = a3;
}

- (double)currentSliderValue
{
  return self->_currentSliderValue;
}

- (void)setCurrentSliderValue:(double)a3
{
  self->_currentSliderValue = a3;
}

- (CGPoint)referenceTouchLocation
{
  double x = self->_referenceTouchLocation.x;
  double y = self->_referenceTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setReferenceTouchLocation:(CGPoint)a3
{
  self->_referenceTouchLocation = a3;
}

- (CGPoint)lastTouchLocation
{
  double x = self->_lastTouchLocation.x;
  double y = self->_lastTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastTouchLocation:(CGPoint)a3
{
  self->_lastTouchLocation = a3;
}

- (double)accumulatedDragDistance
{
  return self->_accumulatedDragDistance;
}

- (void)setAccumulatedDragDistance:(double)a3
{
  self->_accumulatedDragDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end