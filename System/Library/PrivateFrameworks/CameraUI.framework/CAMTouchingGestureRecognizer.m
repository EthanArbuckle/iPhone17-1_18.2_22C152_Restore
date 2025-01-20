@interface CAMTouchingGestureRecognizer
- (unint64_t)_touchCount;
- (void)_decrementTouchesBy:(unint64_t)a3;
- (void)_incrementTouchesBy:(unint64_t)a3;
- (void)_setTouchCount:(unint64_t)a3;
- (void)_updateStateFromTouchCount:(unint64_t)a3 toTouchCount:(unint64_t)a4;
- (void)cancelGesture;
- (void)reset;
- (void)setEnabled:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CAMTouchingGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];
  [(CAMTouchingGestureRecognizer *)self _incrementTouchesBy:v5];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];
  [(CAMTouchingGestureRecognizer *)self _decrementTouchesBy:v5];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];
  [(CAMTouchingGestureRecognizer *)self _decrementTouchesBy:v5];
}

- (void)setEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMTouchingGestureRecognizer;
  -[CAMTouchingGestureRecognizer setEnabled:](&v5, sel_setEnabled_);
  if (!a3) {
    [(CAMTouchingGestureRecognizer *)self _setTouchCount:0];
  }
}

- (void)reset
{
}

- (void)cancelGesture
{
}

- (void)_setTouchCount:(unint64_t)a3
{
  if (self->__touchCount != a3)
  {
    self->__touchCount = a3;
    -[CAMTouchingGestureRecognizer _updateStateFromTouchCount:toTouchCount:](self, "_updateStateFromTouchCount:toTouchCount:");
  }
}

- (void)_updateStateFromTouchCount:(unint64_t)a3 toTouchCount:(unint64_t)a4
{
  if (a3 && !a4)
  {
    uint64_t v4 = 3;
LABEL_4:
    [(CAMTouchingGestureRecognizer *)self setState:v4];
    return;
  }
  if (!a3 && a4)
  {
    uint64_t v4 = 1;
    goto LABEL_4;
  }
}

- (void)_incrementTouchesBy:(unint64_t)a3
{
  unint64_t v4 = [(CAMTouchingGestureRecognizer *)self _touchCount] + a3;
  [(CAMTouchingGestureRecognizer *)self _setTouchCount:v4];
}

- (void)_decrementTouchesBy:(unint64_t)a3
{
  if ([(CAMTouchingGestureRecognizer *)self _touchCount] >= a3) {
    unint64_t v5 = [(CAMTouchingGestureRecognizer *)self _touchCount] - a3;
  }
  else {
    unint64_t v5 = 0;
  }
  [(CAMTouchingGestureRecognizer *)self _setTouchCount:v5];
}

- (unint64_t)_touchCount
{
  return self->__touchCount;
}

@end