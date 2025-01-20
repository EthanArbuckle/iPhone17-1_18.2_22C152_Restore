@interface CCUIFlickGestureRecognizer
- (BOOL)_validateFlickWithTouch:(id)a3;
- (CCUIFlickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)maximumFlickTime;
- (double)minimumFlickVelocity;
- (unint64_t)allowedFlickDirections;
- (void)_beginFlickWithTouch:(id)a3;
- (void)_evaluateFlickAtTimeout;
- (void)reset;
- (void)setAllowedFlickDirections:(unint64_t)a3;
- (void)setMaximumFlickTime:(double)a3;
- (void)setMinimumFlickVelocity:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CCUIFlickGestureRecognizer

- (CCUIFlickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIFlickGestureRecognizer;
  result = [(CCUIFlickGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
  if (result)
  {
    result->_maximumFlickTime = 0.1;
    result->_minimumFlickVelocity = 500.0;
    result->_allowedFlickDirections = 15;
  }
  return result;
}

- (void)reset
{
  touch = self->_touch;
  self->_touch = 0;

  [(NSTimer *)self->_timeoutTimer invalidate];
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

  self->_latched = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CCUIFlickGestureRecognizer;
  [(CCUIFlickGestureRecognizer *)&v17 touchesBegan:v6 withEvent:v7];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        if (self->_touch)
        {
          if (self->_touch != *(UITouch **)(*((void *)&v13 + 1) + 8 * i)) {
            -[CCUIFlickGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:");
          }
        }
        else
        {
          objc_storeStrong((id *)&self->_touch, *(id *)(*((void *)&v13 + 1) + 8 * i));
          -[CCUIFlickGestureRecognizer _beginFlickWithTouch:](self, "_beginFlickWithTouch:", self->_touch, (void)v13);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIFlickGestureRecognizer;
  [(CCUIFlickGestureRecognizer *)&v5 touchesMoved:a3 withEvent:a4];
  if (self->_latched
    || [(CCUIFlickGestureRecognizer *)self _validateFlickWithTouch:self->_touch])
  {
    self->_latched = 1;
  }
  else
  {
    [(CCUIFlickGestureRecognizer *)self setState:5];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIFlickGestureRecognizer;
  [(CCUIFlickGestureRecognizer *)&v6 touchesEnded:a3 withEvent:a4];
  if (self->_latched)
  {
    uint64_t v5 = 3;
  }
  else if ([(CCUIFlickGestureRecognizer *)self _validateFlickWithTouch:self->_touch])
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 5;
  }
  [(CCUIFlickGestureRecognizer *)self setState:v5];
}

- (void)_beginFlickWithTouch:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  self->_initialTouchTimestamp = v5;
  objc_super v6 = [(CCUIFlickGestureRecognizer *)self view];
  [v4 locationInView:v6];
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  self->_initialTouchLocation.x = v8;
  self->_initialTouchLocation.y = v10;

  uint64_t v11 = (void *)MEMORY[0x1E4F1CB00];
  [(CCUIFlickGestureRecognizer *)self maximumFlickTime];
  objc_msgSend(v11, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__evaluateFlickAtTimeout, 0, 0);
  self->_timeoutTimer = (NSTimer *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (BOOL)_validateFlickWithTouch:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  double v6 = v5 - self->_initialTouchTimestamp;
  double v7 = [(CCUIFlickGestureRecognizer *)self view];
  [v4 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  double v12 = (v9 - self->_initialTouchLocation.x) / v6;
  double v13 = (v11 - self->_initialTouchLocation.y) / v6;
  if (v12 >= 0.0) {
    double v14 = v12;
  }
  else {
    double v14 = -v12;
  }
  if (v13 >= 0.0) {
    double v15 = v13;
  }
  else {
    double v15 = -v13;
  }
  hypot(v14, v15);
  int v16 = BSFloatGreaterThanOrEqualToFloat();
  if (v16)
  {
    if (BSFloatGreaterThanFloat())
    {
      if (BSFloatLessThanFloat()) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 8;
      }
    }
    else if (BSFloatLessThanFloat())
    {
      uint64_t v17 = 1;
    }
    else
    {
      uint64_t v17 = 4;
    }
    LOBYTE(v16) = ([(CCUIFlickGestureRecognizer *)self allowedFlickDirections] & v17) != 0;
  }
  return v16;
}

- (void)_evaluateFlickAtTimeout
{
}

- (double)maximumFlickTime
{
  return self->_maximumFlickTime;
}

- (void)setMaximumFlickTime:(double)a3
{
  self->_maximumFlickTime = a3;
}

- (double)minimumFlickVelocity
{
  return self->_minimumFlickVelocity;
}

- (void)setMinimumFlickVelocity:(double)a3
{
  self->_minimumFlickVelocity = a3;
}

- (unint64_t)allowedFlickDirections
{
  return self->_allowedFlickDirections;
}

- (void)setAllowedFlickDirections:(unint64_t)a3
{
  self->_allowedFlickDirections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);

  objc_storeStrong((id *)&self->_touch, 0);
}

@end