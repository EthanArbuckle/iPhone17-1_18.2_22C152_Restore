@interface ARCoachingHeuristicTracking
- (BOOL)satisfied;
- (int64_t)requirements;
- (void)updateWithFrame:(id)a3 cache:(id)a4;
@end

@implementation ARCoachingHeuristicTracking

- (int64_t)requirements
{
  return self->_requirements;
}

- (BOOL)satisfied
{
  return self->_requirements == 0;
}

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int64_t requirements = self->_requirements;
  v7 = [v5 camera];
  uint64_t v8 = [v7 trackingState];

  if (v8 == 2)
  {
    int64_t v9 = 0;
    goto LABEL_8;
  }
  v10 = [v5 camera];
  uint64_t v11 = [v10 trackingStateReason];

  if (v11 != 2)
  {
    int64_t v9 = 1;
LABEL_8:
    self->_int64_t requirements = v9;
    if (requirements == 32)
    {
      v12 = _ARLogCoaching_3();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v16);
        int v17 = 138543618;
        v18 = v14;
        __int16 v19 = 2048;
        v20 = self;
        v15 = "%{public}@ <%p>: Motion is no longer excessive";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  self->_int64_t requirements = 32;
  if (requirements != 32)
  {
    v12 = _ARLogCoaching_3();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      int v17 = 138543618;
      v18 = v14;
      __int16 v19 = 2048;
      v20 = self;
      v15 = "%{public}@ <%p>: Motion became excessive";
LABEL_11:
      _os_log_impl(&dword_20B202000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v17, 0x16u);
    }
LABEL_12:
  }
LABEL_13:
}

@end