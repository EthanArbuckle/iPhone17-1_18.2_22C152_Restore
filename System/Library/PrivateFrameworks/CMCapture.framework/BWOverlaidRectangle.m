@interface BWOverlaidRectangle
- (BOOL)disappeared;
- (BWOverlaidRectangle)initWithDisplayStyle:(int)a3;
- (BWRamp)rampAnimation;
- (CGRect)bounds;
- (int)animationState;
- (int)displayStyle;
- (int)numFramesFullyVisible;
- (void)dealloc;
- (void)setAnimationState:(int)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDisappeared:(BOOL)a3;
- (void)setNumFramesFullyVisible:(int)a3;
- (void)setRampAnimation:(id)a3;
@end

@implementation BWOverlaidRectangle

- (BWOverlaidRectangle)initWithDisplayStyle:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BWOverlaidRectangle;
  result = [(BWOverlaidRectangle *)&v5 init];
  if (result) {
    result->_displayStyle = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWOverlaidRectangle;
  [(BWOverlaidRectangle *)&v3 dealloc];
}

- (int)displayStyle
{
  return self->_displayStyle;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (BOOL)disappeared
{
  return self->_disappeared;
}

- (void)setDisappeared:(BOOL)a3
{
  self->_disappeared = a3;
}

- (int)animationState
{
  return self->_animationState;
}

- (void)setAnimationState:(int)a3
{
  self->_animationState = a3;
}

- (BWRamp)rampAnimation
{
  return self->_rampAnimation;
}

- (void)setRampAnimation:(id)a3
{
}

- (int)numFramesFullyVisible
{
  return self->_numFramesFullyVisible;
}

- (void)setNumFramesFullyVisible:(int)a3
{
  self->_numFramesFullyVisible = a3;
}

@end