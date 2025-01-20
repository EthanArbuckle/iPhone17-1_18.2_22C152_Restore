@interface _HUScrollGestureRecognitionState
- (NACancelable)activationTimer;
- (UIGestureRecognizer)gestureRecognizer;
- (_HUScrollGestureRecognitionState)initWithGestureRecognizer:(id)a3;
- (void)setActivationTimer:(id)a3;
@end

@implementation _HUScrollGestureRecognitionState

- (_HUScrollGestureRecognitionState)initWithGestureRecognizer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HUScrollGestureRecognitionState;
  v6 = [(_HUScrollGestureRecognitionState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_gestureRecognizer, a3);
  }

  return v7;
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (NACancelable)activationTimer
{
  return self->_activationTimer;
}

- (void)setActivationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationTimer, 0);

  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end