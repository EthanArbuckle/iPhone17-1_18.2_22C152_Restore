@interface HUQuickControlPanningContext
- (BOOL)requiresSomeMovementBeforeActivation;
- (CGRect)controlFrame;
- (HUQuickControlPanningContext)init;
- (double)initialSliderValue;
- (double)verticalDragCoefficient;
- (void)assertConfigurationIsValid;
- (void)setControlFrame:(CGRect)a3;
- (void)setInitialSliderValue:(double)a3;
- (void)setRequiresSomeMovementBeforeActivation:(BOOL)a3;
- (void)setVerticalDragCoefficient:(double)a3;
@end

@implementation HUQuickControlPanningContext

- (HUQuickControlPanningContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlPanningContext;
  result = [(HUQuickControlPanningContext *)&v3 init];
  if (result) {
    result->_verticalDragCoefficient = 1.0;
  }
  return result;
}

- (void)assertConfigurationIsValid
{
  [(HUQuickControlPanningContext *)self controlFrame];
  if (CGRectIsEmpty(v2)) {
    NSLog(&cfstr_EmptyInitialFr.isa);
  }
}

- (CGRect)controlFrame
{
  double x = self->_controlFrame.origin.x;
  double y = self->_controlFrame.origin.y;
  double width = self->_controlFrame.size.width;
  double height = self->_controlFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setControlFrame:(CGRect)a3
{
  self->_controlFrame = a3;
}

- (double)initialSliderValue
{
  return self->_initialSliderValue;
}

- (void)setInitialSliderValue:(double)a3
{
  self->_initialSliderValue = a3;
}

- (double)verticalDragCoefficient
{
  return self->_verticalDragCoefficient;
}

- (void)setVerticalDragCoefficient:(double)a3
{
  self->_verticalDragCoefficient = a3;
}

- (BOOL)requiresSomeMovementBeforeActivation
{
  return self->_requiresSomeMovementBeforeActivation;
}

- (void)setRequiresSomeMovementBeforeActivation:(BOOL)a3
{
  self->_requiresSomeMovementBeforeActivation = a3;
}

@end