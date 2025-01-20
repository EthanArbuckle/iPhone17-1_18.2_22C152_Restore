@interface PKDrawingPowerSavingController
- (BOOL)shouldSkipFrameWithFrameStartTimestamp:(double)a3 framesAfterStart:;
- (PKDrawingPowerSavingController)init;
- (double)accumulateMovementForCurrentFrame;
- (id).cxx_construct;
@end

@implementation PKDrawingPowerSavingController

- (PKDrawingPowerSavingController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKDrawingPowerSavingController;
  v2 = [(PKDrawingPowerSavingController *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 doubleForKey:@"internalSettings.drawing.apt.minimumMovementDistanceFinger"];
    v2->_minimumMovementDistanceFinger = v4;

    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 doubleForKey:@"internalSettings.drawing.apt.minimumMovementDistancePencil"];
    v2->_minimumMovementDistancePencil = v6;

    v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v7 doubleForKey:@"internalSettings.drawing.apt.minimumMovementDistanceTimeout"];
    v2->_minimumMovementDistanceTimeout = v8;
  }
  return v2;
}

- (BOOL)shouldSkipFrameWithFrameStartTimestamp:(double)a3 framesAfterStart:
{
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  if (PKIsVisionDevice())
  {
    uint64_t v6 = 80;
  }
  else
  {
    uint64_t v6 = 80;
    if (!*(unsigned char *)(v5 + 104)) {
      uint64_t v6 = 88;
    }
  }
  double v7 = *(double *)(v5 + v6);
  if (*(double *)(v5 + 56) >= v7) {
    return 0;
  }
  double v8 = *(double **)(v5 + 8);
  v9 = *(double **)(v5 + 16);
  if (v8 == v9)
  {
    double v13 = 0.0;
  }
  else
  {
    unint64_t v10 = 0;
    double v11 = 0.0;
    do
    {
      double v12 = *v8++;
      double v11 = v11 + v12;
      ++v10;
    }
    while (v8 != v9);
    double v13 = v11 / (double)v10;
  }
  if (v13 >= v7)
  {
    kdebug_trace();
    return 0;
  }
  return a3 - *(double *)(v5 + 64) < *(double *)(v5 + 96) && a2 > 4;
}

- (double)accumulateMovementForCurrentFrame
{
  if (a1)
  {
    v3 = (double **)(a1 + 8);
    double v4 = (double *)(a1 + 48);
    std::vector<double>::insert((char **)(a1 + 8), *(char **)(a1 + 8), (char *)(a1 + 48));
    uint64_t v6 = *v3;
    uint64_t v5 = v3[1];
    if ((unint64_t)((char *)v5 - (char *)*v3) >= 0x29) {
      *(void *)(a1 + 16) = --v5;
    }
    double v7 = *v4;
    if (*v4 == 0.0)
    {
      if (v6 == v5)
      {
        double v7 = 0.0;
      }
      else
      {
        unint64_t v8 = 0;
        double v9 = 0.0;
        do
        {
          double v10 = *v6++;
          double v9 = v9 + v10;
          ++v8;
        }
        while (v6 != v5);
        double v7 = v9 / (double)v8;
      }
    }
    result = v7 + *(double *)(a1 + 56);
    *(double *)(a1 + 56) = result;
    *(void *)(a1 + 48) = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  begin = self->_movementDistanceHistoryBuffer.__begin_;
  if (begin)
  {
    self->_movementDistanceHistoryBuffer.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end