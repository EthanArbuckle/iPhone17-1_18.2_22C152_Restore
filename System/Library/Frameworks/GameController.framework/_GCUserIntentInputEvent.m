@interface _GCUserIntentInputEvent
- (_GCUserIntentInputEvent)initWithXValue:(float)a3 yValue:(float)a4 timestamp:(unint64_t)a5 deadzoneSquared:(double)a6;
- (double)timestampInSeconds;
- (int64_t)octant;
@end

@implementation _GCUserIntentInputEvent

- (_GCUserIntentInputEvent)initWithXValue:(float)a3 yValue:(float)a4 timestamp:(unint64_t)a5 deadzoneSquared:(double)a6
{
  v17.receiver = self;
  v17.super_class = (Class)_GCUserIntentInputEvent;
  v10 = [(_GCUserIntentInputEvent *)&v17 init];
  if (v10)
  {
    if ((float)((float)(a4 * a4) + (float)(a3 * a3)) >= a6)
    {
      float v12 = a4 * 0.0 + a3;
      float v13 = a4 - a3 * 0.0;
      float v14 = atan2(v13, v12);
      double v15 = v14;
      if (v14 >= -2.35619449)
      {
        if (v15 >= -1.57079633)
        {
          if (v15 >= -0.785398163)
          {
            if (v14 >= 0.0)
            {
              if (v15 <= 2.35619449)
              {
                if (v15 <= 1.57079633) {
                  uint64_t v11 = v15 > 0.785398163;
                }
                else {
                  uint64_t v11 = 2;
                }
              }
              else
              {
                uint64_t v11 = 3;
              }
            }
            else
            {
              uint64_t v11 = 7;
            }
          }
          else
          {
            uint64_t v11 = 6;
          }
        }
        else
        {
          uint64_t v11 = 5;
        }
      }
      else
      {
        uint64_t v11 = 4;
      }
    }
    else
    {
      uint64_t v11 = -1;
    }
    v10->_octant = v11;
    if (timestampToSecondsMultiplier_onceToken != -1) {
      dispatch_once(&timestampToSecondsMultiplier_onceToken, &__block_literal_global_30);
    }
    v10->_timestampInSeconds = *(double *)&timestampToSecondsMultiplier_multiplier * (double)a5;
  }
  return v10;
}

- (int64_t)octant
{
  return self->_octant;
}

- (double)timestampInSeconds
{
  return self->_timestampInSeconds;
}

@end