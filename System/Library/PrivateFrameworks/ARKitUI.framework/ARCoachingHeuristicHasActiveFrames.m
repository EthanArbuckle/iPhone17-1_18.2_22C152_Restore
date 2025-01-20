@interface ARCoachingHeuristicHasActiveFrames
- (void)updateWithFrame:(id)a3 cache:(id)a4;
@end

@implementation ARCoachingHeuristicHasActiveFrames

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [a3 timestamp];
  double v6 = v5;
  if (self->_frameCount && v5 - self->_lastFrameTimestamp > 1.0)
  {
    v7 = _ARLogCoaching_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)v20 = 138543618;
      *(void *)&v20[4] = v9;
      *(_WORD *)&v20[12] = 2048;
      *(void *)&v20[14] = self;
      _os_log_impl(&dword_20B202000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Active frame updates are too old, resetting frame count", v20, 0x16u);
    }
    self->_int frameCount = 0;
  }
  self->_lastFrameTimestamp = v6;
  BOOL v10 = [(ARCoachingHeuristic *)self satisfied];
  int frameCount = self->_frameCount;
  self->_int frameCount = frameCount + 1;
  if (!v10 && frameCount >= 4)
  {
    v12 = _ARLogCoaching_3();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      int v15 = self->_frameCount;
      *(_DWORD *)v20 = 138543874;
      *(void *)&v20[4] = v14;
      *(_WORD *)&v20[12] = 2048;
      *(void *)&v20[14] = self;
      *(_WORD *)&v20[22] = 1024;
      LODWORD(v21) = v15;
      v16 = "%{public}@ <%p>: Frames are considered active after seeing %d recent frames";
      v17 = v12;
      uint32_t v18 = 28;
LABEL_14:
      _os_log_impl(&dword_20B202000, v17, OS_LOG_TYPE_INFO, v16, v20, v18);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (v10 && frameCount <= 3)
  {
    v12 = _ARLogCoaching_3();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v19 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v19);
      *(_DWORD *)v20 = 138543618;
      *(void *)&v20[4] = v14;
      *(_WORD *)&v20[12] = 2048;
      *(void *)&v20[14] = self;
      v16 = "%{public}@ <%p>: Frames are no longer considered active";
      v17 = v12;
      uint32_t v18 = 22;
      goto LABEL_14;
    }
LABEL_15:
  }
  -[ARCoachingHeuristic setSatisfied:](self, "setSatisfied:", frameCount > 3, *(_OWORD *)v20, *(void *)&v20[16], v21);
}

@end