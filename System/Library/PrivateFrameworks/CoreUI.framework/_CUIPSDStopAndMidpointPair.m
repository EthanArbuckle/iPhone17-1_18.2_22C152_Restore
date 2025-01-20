@interface _CUIPSDStopAndMidpointPair
- (_CUIPSDStopAndMidpointPair)initWithStop:(id)a3 midpoint:(id)a4;
- (double)midpoint;
- (id)stop;
- (int64_t)compare:(id)a3;
- (void)dealloc;
@end

@implementation _CUIPSDStopAndMidpointPair

- (_CUIPSDStopAndMidpointPair)initWithStop:(id)a3 midpoint:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_CUIPSDStopAndMidpointPair;
  v6 = [(_CUIPSDStopAndMidpointPair *)&v9 init];
  if (v6)
  {
    v6->stop = a3;
    if (a4) {
      [a4 doubleValue];
    }
    else {
      double v7 = 0.5;
    }
    v6->midpoint = v7;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUIPSDStopAndMidpointPair;
  [(_CUIPSDStopAndMidpointPair *)&v3 dealloc];
}

- (int64_t)compare:(id)a3
{
  [self->stop location];
  double v5 = v4;
  [*((id *)a3 + 1) location];
  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (id)stop
{
  return self->stop;
}

- (double)midpoint
{
  return self->midpoint;
}

@end