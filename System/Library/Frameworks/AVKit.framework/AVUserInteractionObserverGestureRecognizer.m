@interface AVUserInteractionObserverGestureRecognizer
- (AVUserInteractionObserverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (void)_touchesEndedOrCancelled:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation AVUserInteractionObserverGestureRecognizer

- (void).cxx_destruct
{
}

- (void)_touchesEndedOrCancelled:(id)a3
{
  [(NSMutableSet *)self->_trackedTouches minusSet:a3];
  if (![(NSMutableSet *)self->_trackedTouches count])
  {
    [(AVUserInteractionObserverGestureRecognizer *)self setState:3];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(AVUserInteractionObserverGestureRecognizer *)self setState:1];
  [(NSMutableSet *)self->_trackedTouches unionSet:v5];
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (AVUserInteractionObserverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVUserInteractionObserverGestureRecognizer;
  v4 = [(AVUserInteractionObserverGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    trackedTouches = v4->_trackedTouches;
    v4->_trackedTouches = (NSMutableSet *)v5;

    [(AVUserInteractionObserverGestureRecognizer *)v4 setCancelsTouchesInView:0];
  }
  return v4;
}

@end