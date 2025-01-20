@interface CKInvisibleInkEffectCoverageTracker
- (BOOL)isUncovered;
- (CGSize)size;
- (CKInvisibleInkEffectCoverageTracker)initWithSize:(CGSize)a3 touchLifetime:(double)a4;
- (CKInvisibleInkEffectCoverageTrackerDelegate)delegate;
- (double)touchLifetime;
- (void)_checkForCover:(id)a3;
- (void)dealloc;
- (void)recordTouchAtPoint:(CGPoint)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setUncovered:(BOOL)a3;
@end

@implementation CKInvisibleInkEffectCoverageTracker

- (CKInvisibleInkEffectCoverageTracker)initWithSize:(CGSize)a3 touchLifetime:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CKInvisibleInkEffectCoverageTracker;
  v7 = [(CKInvisibleInkEffectCoverageTracker *)&v10 init];
  v8 = v7;
  if (v7)
  {
    -[CKInvisibleInkEffectCoverageTracker setSize:](v7, "setSize:", width, height);
    v8->_touchLifetime = a4;
  }
  return v8;
}

- (void)dealloc
{
  [(NSTimer *)self->_recoverTimer invalidate];
  free(self->_expiryTimes);
  v3.receiver = self;
  v3.super_class = (Class)CKInvisibleInkEffectCoverageTracker;
  [(CKInvisibleInkEffectCoverageTracker *)&v3 dealloc];
}

- (void)setSize:(CGSize)a3
{
  if (a3.width != self->_size.width || a3.height != self->_size.height)
  {
    self->_size = a3;
    CGFloat height = a3.height;
    __asm { FMOV            V2.2D, #1.0 }
    uint64x2_t v10 = vcvtq_u64_f64(vmaxnmq_f64(vrndmq_f64(vdivq_f64((float64x2_t)a3, (float64x2_t)vdupq_n_s64(0x4044000000000000uLL))), _Q2));
    *(uint64x2_t *)&self->_double width = v10;
    *(float64x2_t *)&self->_cellWidth = vdivq_f64((float64x2_t)a3, vcvtq_f64_u64(v10));
    free(self->_expiryTimes);
    self->_expiryTimes = (double *)malloc_type_malloc(8 * self->_width * self->_height, 0x100004000313F17uLL);
    [(CKInvisibleInkEffectCoverageTracker *)self reset];
  }
}

- (void)reset
{
  objc_super v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v3 timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;

  unint64_t v6 = self->_height * self->_width;
  if (v6)
  {
    expiryTimes = self->_expiryTimes;
    do
    {
      *(void *)expiryTimes++ = v5;
      --v6;
    }
    while (v6);
  }
  [(CKInvisibleInkEffectCoverageTracker *)self setUncovered:0];
  recoverTimer = self->_recoverTimer;

  [(NSTimer *)recoverTimer invalidate];
}

- (void)recordTouchAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double cellWidth = self->_cellWidth;
  double cellHeight = self->_cellHeight;
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t height = self->_height;
  if (height)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    double v9 = 0.5;
    double v10 = cellHeight * 0.5;
    unint64_t width = self->_width;
    double v17 = self->_cellWidth;
    double v11 = 2.0;
    do
    {
      if (width)
      {
        double v18 = cellWidth * 0.5;
        unint64_t v19 = width;
        uint64_t v20 = v13;
        do
        {
          if ((x - v18) * (x - v18) / (v17 * v17) + (y - v10) * (y - v10) / (self->_cellHeight * self->_cellHeight) >= 2.0)
          {
            if (*(double *)((char *)self->_expiryTimes + v20) > Current) {
              ++v15;
            }
          }
          else
          {
            *(double *)((char *)self->_expiryTimes + v20) = Current + self->_touchLifetime;
            ++v15;
            double v17 = self->_cellWidth;
          }
          double v18 = v18 + v17;
          v20 += 8;
          --v19;
        }
        while (v19);
      }
      double v10 = v10 + self->_cellHeight;
      ++v14;
      v13 += 8 * width;
      double cellWidth = v17;
    }
    while (v14 != height);
  }
  else
  {
    unint64_t v15 = 0;
  }
  if (![(CKInvisibleInkEffectCoverageTracker *)self isUncovered]
    && (double)(self->_height * self->_width) * 0.75 < (double)v15)
  {
    [(CKInvisibleInkEffectCoverageTracker *)self setUncovered:1];
    if ([(NSTimer *)self->_recoverTimer isValid])
    {
      recoverTimer = self->_recoverTimer;
      v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:self->_touchLifetime];
      [(NSTimer *)recoverTimer setFireDate:v22];
    }
    else
    {
      v23 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__checkForCover_ selector:0 userInfo:0 repeats:self->_touchLifetime];
      v22 = self->_recoverTimer;
      self->_recoverTimer = v23;
    }

    v24 = [(CKInvisibleInkEffectCoverageTracker *)self delegate];
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__CKInvisibleInkEffectCoverageTracker_recordTouchAtPoint___block_invoke;
      block[3] = &unk_1E5620C40;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __58__CKInvisibleInkEffectCoverageTracker_recordTouchAtPoint___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 invisibleInkEffectCoverageTrackerDidUncover:*(void *)(a1 + 32)];
}

- (void)_checkForCover:(id)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  unint64_t v8 = self->_height * self->_width;
  if (v8)
  {
    unint64_t v9 = 0;
    expiryTimes = self->_expiryTimes;
    unint64_t v11 = self->_height * self->_width;
    do
    {
      double v12 = *expiryTimes++;
      double v13 = v12;
      if (v7 >= v12) {
        double v14 = v13;
      }
      else {
        double v14 = v7;
      }
      if (v13 > Current)
      {
        ++v9;
        double v7 = v14;
      }
      --v11;
    }
    while (v11);
    double v15 = (double)v9;
  }
  else
  {
    double v15 = 0.0;
  }
  if ((double)v8 * 0.75 >= v15)
  {
    [(CKInvisibleInkEffectCoverageTracker *)self setUncovered:0];
    double v18 = [(CKInvisibleInkEffectCoverageTracker *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) == 0) {
      return;
    }
    uint64_t v20 = [(CKInvisibleInkEffectCoverageTracker *)self delegate];
    [(NSTimer *)v20 invisibleInkEffectCoverageTrackerDidRecover:self];
    recoverTimer = v20;
  }
  else
  {
    v16 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__checkForCover_ selector:0 userInfo:0 repeats:v7 - Current];
    recoverTimer = self->_recoverTimer;
    self->_recoverTimer = v16;
  }
}

- (CKInvisibleInkEffectCoverageTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKInvisibleInkEffectCoverageTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)touchLifetime
{
  return self->_touchLifetime;
}

- (BOOL)isUncovered
{
  return self->_uncovered;
}

- (void)setUncovered:(BOOL)a3
{
  self->_uncovered = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_recoverTimer, 0);
}

@end