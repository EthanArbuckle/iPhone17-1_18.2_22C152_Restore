@interface VKWalkAssistHeadingManager
- (BOOL)_isFacingLocation;
- (BOOL)isLocationInView;
- (VKWalkAssistHapticEngineDelegate)hapticEngineDelegate;
- (VKWalkAssistHeadingManager)initWithHapticEngineDelegate:(id)a3;
- (double)_getDegrees:(double)result;
- (double)bearing;
- (double)heading;
- (void)setBearing:(double)a3;
- (void)setHeading:(double)a3;
- (void)setIsLocationInView:(BOOL)a3;
- (void)updateHeading:(double)a3 bearing:(double)a4;
@end

@implementation VKWalkAssistHeadingManager

- (VKWalkAssistHeadingManager)initWithHapticEngineDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKWalkAssistHeadingManager;
  v5 = [(VKWalkAssistHeadingManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_heading = _Q0;
    v5->_isLocationInView = 0;
    objc_storeWeak((id *)&v5->_hapticEngineDelegate, v4);
    v12 = v6;
  }

  return v6;
}

- (void)updateHeading:(double)a3 bearing:(double)a4
{
  if (a3 >= 0.0)
  {
    -[VKWalkAssistHeadingManager setHeading:](self, "setHeading:");
    [(VKWalkAssistHeadingManager *)self setBearing:a4];
    BOOL v6 = [(VKWalkAssistHeadingManager *)self _isFacingLocation];
    if (self->_isLocationInView != v6)
    {
      BOOL v7 = v6;
      BOOL v8 = [(VKWalkAssistHeadingManager *)self _isFacingLocation];
      v9 = [(VKWalkAssistHeadingManager *)self hapticEngineDelegate];
      v10 = v9;
      if (v8) {
        [v9 playEnterHaptic];
      }
      else {
        [v9 playExitHaptic];
      }

      [(VKWalkAssistHeadingManager *)self setIsLocationInView:v7];
    }
  }
}

- (BOOL)_isFacingLocation
{
  [(VKWalkAssistHeadingManager *)self bearing];
  [(VKWalkAssistHeadingManager *)self _getDegrees:v3 + 30.0];
  double v5 = v4;
  [(VKWalkAssistHeadingManager *)self bearing];
  [(VKWalkAssistHeadingManager *)self _getDegrees:v6 + -30.0];
  double v8 = v7;
  if (v5 < v7)
  {
    [(VKWalkAssistHeadingManager *)self heading];
    if (v9 >= v8 || ([(VKWalkAssistHeadingManager *)self heading], v10 >= v5))
    {
      [(VKWalkAssistHeadingManager *)self heading];
      if (v11 > v5)
      {
        [(VKWalkAssistHeadingManager *)self heading];
        if (v12 > v8) {
          double v5 = v5 + 360.0;
        }
      }
    }
    else
    {
      double v8 = v8 + -360.0;
    }
  }
  [(VKWalkAssistHeadingManager *)self heading];
  BOOL result = 0;
  if (v13 <= v5)
  {
    [(VKWalkAssistHeadingManager *)self heading];
    if (v14 >= v8) {
      return 1;
    }
  }
  return result;
}

- (double)_getDegrees:(double)result
{
  for (; result > 360.0; BOOL result = result + -360.0)
    ;
  while (result < 0.0)
    BOOL result = result + 360.0;
  return result;
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
}

- (double)bearing
{
  return self->_bearing;
}

- (void)setBearing:(double)a3
{
  self->_bearing = a3;
}

- (BOOL)isLocationInView
{
  return self->_isLocationInView;
}

- (void)setIsLocationInView:(BOOL)a3
{
  self->_isLocationInView = a3;
}

- (VKWalkAssistHapticEngineDelegate)hapticEngineDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapticEngineDelegate);

  return (VKWalkAssistHapticEngineDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end