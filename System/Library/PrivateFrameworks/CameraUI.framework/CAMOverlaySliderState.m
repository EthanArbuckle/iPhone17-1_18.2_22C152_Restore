@interface CAMOverlaySliderState
+ (id)hiddenState;
+ (id)hintWithNormalizedButtonOffset:(double)a3;
+ (id)presentedState;
- (BOOL)_presented;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToState:(id)a3;
- (CAMOverlaySliderState)init;
- (double)_effectiveNormalizedButtonOffsetFromState:(id)a3;
- (double)_normalizedButtonOffset;
- (id)_modeDescription;
- (id)description;
- (int64_t)_sliderMode;
@end

@implementation CAMOverlaySliderState

- (CAMOverlaySliderState)init
{
  v3.receiver = self;
  v3.super_class = (Class)CAMOverlaySliderState;
  result = [(CAMOverlaySliderState *)&v3 init];
  if (result) {
    result->__sliderMode = 0;
  }
  return result;
}

+ (id)hiddenState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)presentedState
{
  id v2 = objc_alloc_init((Class)a1);
  v2[1] = 2;
  v2[2] = 0x3FE0000000000000;
  return v2;
}

+ (id)hintWithNormalizedButtonOffset:(double)a3
{
  v4 = (double *)objc_alloc_init((Class)a1);
  *((void *)v4 + 1) = 1;
  v4[2] = a3;
  return v4;
}

- (BOOL)_presented
{
  return [(CAMOverlaySliderState *)self _sliderMode] == 2;
}

- (double)_effectiveNormalizedButtonOffsetFromState:(id)a3
{
  v5 = (CAMOverlaySliderState *)a3;
  int64_t v6 = [(CAMOverlaySliderState *)self _sliderMode];
  if ((unint64_t)(v6 - 1) < 2 || (self = v5, !v6))
  {
    [(CAMOverlaySliderState *)self _normalizedButtonOffset];
    double v3 = v7;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CAMOverlaySliderState *)self isEqualToState:v4];

  return v5;
}

- (BOOL)isEqualToState:(id)a3
{
  id v4 = (CAMOverlaySliderState *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else if (v4 {
         && (uint64_t v6 = [(CAMOverlaySliderState *)v4 _sliderMode],
  }
             v6 == [(CAMOverlaySliderState *)self _sliderMode]))
  {
    [(CAMOverlaySliderState *)v5 _normalizedButtonOffset];
    double v8 = v7;
    [(CAMOverlaySliderState *)self _normalizedButtonOffset];
    BOOL v10 = v8 == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_modeDescription
{
  int64_t v3 = [(CAMOverlaySliderState *)self _sliderMode];
  if (v3 == 2)
  {
    id v4 = @"Presented";
  }
  else if (v3 == 1)
  {
    BOOL v5 = NSString;
    [(CAMOverlaySliderState *)self _normalizedButtonOffset];
    objc_msgSend(v5, "stringWithFormat:", @"Hinting (pos %.3f)", v6);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = @"Hidden";
  }
  return v4;
}

- (id)description
{
  int64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CAMOverlaySliderState *)self _modeDescription];
  double v7 = [v3 stringWithFormat:@"<%@ %p: %@>", v5, self, v6];

  return v7;
}

- (int64_t)_sliderMode
{
  return self->__sliderMode;
}

- (double)_normalizedButtonOffset
{
  return self->__normalizedButtonOffset;
}

@end