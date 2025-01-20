@interface DDRProgress
- (BOOL)allResetTasksCompleted;
- (BSTimer)tickTimer;
- (DDRProgress)initWithTotalDuration:(double)a3 totalTaskCount:(int64_t)a4 progressTickInterval:(double)a5;
- (DDRProgressDelegate)delegate;
- (NSString)currentResetTask;
- (double)completedProgress;
- (double)currentTaskEstimate;
- (double)currentTaskProgress;
- (double)tickInterval;
- (double)totalEstimateTimeOfCompletion;
- (int64_t)numberOfTaskRemaining;
- (int64_t)numberOfTotalTask;
- (os_unfair_lock_s)lock;
- (void)_incrementCurrentResetTaskProgress;
- (void)_lock_noteTaskCompleted;
- (void)_lock_resetTaskTimer;
- (void)noteTaskBeginningWithName:(id)a3 duration:(double)a4;
- (void)noteTaskCompleted;
- (void)setAllResetTasksCompleted:(BOOL)a3;
- (void)setCompletedProgress:(double)a3;
- (void)setCurrentResetTask:(id)a3;
- (void)setCurrentTaskEstimate:(double)a3;
- (void)setCurrentTaskProgress:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setNumberOfTaskRemaining:(int64_t)a3;
- (void)setNumberOfTotalTask:(int64_t)a3;
- (void)setTickInterval:(double)a3;
- (void)setTickTimer:(id)a3;
- (void)setTotalEstimateTimeOfCompletion:(double)a3;
@end

@implementation DDRProgress

- (DDRProgress)initWithTotalDuration:(double)a3 totalTaskCount:(int64_t)a4 progressTickInterval:(double)a5
{
  v11.receiver = self;
  v11.super_class = (Class)DDRProgress;
  v8 = [(DDRProgress *)&v11 init];
  if (v8)
  {
    v9 = DDRLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      double v13 = a3;
      __int16 v14 = 2048;
      int64_t v15 = a4;
      __int16 v16 = 2048;
      double v17 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initialize DDRProgress with totalDuration: %lf, totalTaskCount: %ld and tick interval of %lf", buf, 0x20u);
    }

    [(DDRProgress *)v8 setTotalEstimateTimeOfCompletion:a3];
    [(DDRProgress *)v8 setCompletedProgress:0.0];
    [(DDRProgress *)v8 setCurrentTaskEstimate:0.0];
    [(DDRProgress *)v8 setCurrentTaskProgress:0.0];
    [(DDRProgress *)v8 setAllResetTasksCompleted:0];
    [(DDRProgress *)v8 setNumberOfTaskRemaining:a4];
    [(DDRProgress *)v8 setNumberOfTotalTask:a4];
    [(DDRProgress *)v8 setTickInterval:a5];
    [(DDRProgress *)v8 setLock:0];
  }
  return v8;
}

- (void)noteTaskBeginningWithName:(id)a3 duration:(double)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = DDRLogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting reset task:%@", buf, 0xCu);
  }

  if (![(DDRProgress *)self allResetTasksCompleted])
  {
    v9 = DDRLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2048;
      double v23 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting currrent reset task:%@, estimate time:%lf, have not complete all tasks", buf, 0x16u);
    }

    [(DDRProgress *)self setCurrentResetTask:v6];
    [(DDRProgress *)self setCurrentTaskEstimate:a4];
    objc_initWeak((id *)buf, self);
    id v10 = objc_alloc((Class)BSTimer);
    [(DDRProgress *)self tickInterval];
    double v12 = v11;
    [(DDRProgress *)self tickInterval];
    double v14 = v13;
    int64_t v15 = dispatch_get_global_queue(2, 0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000330C;
    v18[3] = &unk_100010670;
    objc_copyWeak(&v19, (id *)buf);
    id v16 = [v10 initWithFireInterval:v15 repeatInterval:v18 leewayInterval:v12 queue:v14 handler:0.0];
    [(DDRProgress *)self setTickTimer:v16];

    double v17 = [(DDRProgress *)self tickTimer];
    [v17 schedule];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)noteTaskCompleted
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(DDRProgress *)self _lock_noteTaskCompleted];
  os_unfair_lock_unlock(p_lock);
}

- (void)_incrementCurrentResetTaskProgress
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = DDRLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(DDRProgress *)self currentResetTask];
    *(_DWORD *)v46 = 138412290;
    *(void *)&v46[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Increment task progress for: %@", v46, 0xCu);
  }
  if (![(DDRProgress *)self allResetTasksCompleted])
  {
    v8 = [(DDRProgress *)self currentResetTask];
    id v9 = [v8 length];

    if (v9)
    {
      [(DDRProgress *)self currentTaskEstimate];
      if (v10 == 0.0)
      {
        double v11 = DDRLogForCategory(1uLL);
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
LABEL_12:

LABEL_22:
          [(DDRProgress *)self _lock_noteTaskCompleted];
          goto LABEL_33;
        }
        double v12 = [(DDRProgress *)self currentResetTask];
        *(_DWORD *)v46 = 138412290;
        *(void *)&v46[4] = v12;
        double v13 = "In Increment task progress for: %@, the estimate time of completion is 0";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, v46, 0xCu);

        goto LABEL_12;
      }
      [(DDRProgress *)self currentTaskProgress];
      double v16 = v15;
      [(DDRProgress *)self currentTaskEstimate];
      if (v16 >= v17) {
        goto LABEL_22;
      }
      v18 = DDRLogForCategory(1uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [(DDRProgress *)self currentResetTask];
        [(DDRProgress *)self currentTaskProgress];
        uint64_t v21 = v20;
        [(DDRProgress *)self currentTaskEstimate];
        *(_DWORD *)v46 = 138412802;
        *(void *)&v46[4] = v19;
        *(_WORD *)&v46[12] = 2048;
        *(void *)&v46[14] = v21;
        __int16 v47 = 2048;
        uint64_t v48 = v22;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Current task %@ progress is %lf, smaller than current estimate progress: %lf", v46, 0x20u);
      }
      [(DDRProgress *)self currentTaskProgress];
      double v24 = v23;
      [(DDRProgress *)self tickInterval];
      double v26 = v24 + v25;
      [(DDRProgress *)self currentTaskEstimate];
      if (v26 >= v27)
      {
        [(DDRProgress *)self currentTaskEstimate];
        double v31 = v30;
        [(DDRProgress *)self currentTaskProgress];
        double v33 = v31 - v32;
        double v11 = DDRLogForCategory(1uLL);
        BOOL v34 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v33 < 0.003)
        {
          if (!v34) {
            goto LABEL_12;
          }
          double v12 = [(DDRProgress *)self currentResetTask];
          *(_DWORD *)v46 = 138412290;
          *(void *)&v46[4] = v12;
          double v13 = "Not enough time to increment progress of task: %@, just complete it. Consider increase the estimate time of completion";
          goto LABEL_11;
        }
        if (v34)
        {
          v35 = [(DDRProgress *)self currentResetTask];
          *(_DWORD *)v46 = 138412290;
          *(void *)&v46[4] = v35;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "We are slowing down the progress increment to be 1/3 of the time left of current reset task: %@", v46, 0xCu);
        }
        [(DDRProgress *)self currentTaskProgress];
        double v26 = v33 / 3.0 + v36;
      }
      else
      {
        v28 = DDRLogForCategory(1uLL);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = [(DDRProgress *)self currentResetTask];
          *(_DWORD *)v46 = 138412290;
          *(void *)&v46[4] = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Current task %@ progress increment as normal", v46, 0xCu);
        }
      }
      [(DDRProgress *)self setCurrentTaskProgress:v26];
      v37 = DDRLogForCategory(1uLL);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = [(DDRProgress *)self currentResetTask];
        *(_DWORD *)v46 = 138412290;
        *(void *)&v46[4] = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Update the current task progress: %@", v46, 0xCu);
      }
      [(DDRProgress *)self completedProgress];
      double v40 = v39;
      [(DDRProgress *)self currentTaskProgress];
      double v42 = v40 + v41;
      [(DDRProgress *)self totalEstimateTimeOfCompletion];
      double v44 = v42 / v43;
      v45 = DDRLogForCategory(1uLL);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v46 = 134217984;
        *(double *)&v46[4] = v44;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Compute total progress percentage: %lf", v46, 0xCu);
      }

      double v14 = [(DDRProgress *)self delegate];
      [v14 progressDidUpdateWithPercentage:v44];
    }
    else
    {
      double v14 = DDRLogForCategory(1uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v46 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "In Increment task progress, the current task already completed, might need to adjust the task estimate time of completion", v46, 2u);
      }
    }

    goto LABEL_33;
  }
  id v6 = DDRLogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(DDRProgress *)self currentResetTask];
    *(_DWORD *)v46 = 138412290;
    *(void *)&v46[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "In Increment task progress for: %@, all task have completed", v46, 0xCu);
  }
LABEL_33:
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_resetTaskTimer
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(DDRProgress *)self tickTimer];
  [v3 cancel];

  [(DDRProgress *)self setTickTimer:0];
}

- (void)_lock_noteTaskCompleted
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = DDRLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Completing current reset task", v36, 2u);
  }

  v4 = [(DDRProgress *)self currentResetTask];
  id v5 = [v4 length];

  if (v5)
  {
    [(DDRProgress *)self _lock_resetTaskTimer];
    [(DDRProgress *)self currentTaskEstimate];
    double v7 = v6;
    [(DDRProgress *)self completedProgress];
    [(DDRProgress *)self setCompletedProgress:v7 + v8];
    id v9 = DDRLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [(DDRProgress *)self currentResetTask];
      [(DDRProgress *)self currentTaskEstimate];
      uint64_t v12 = v11;
      [(DDRProgress *)self completedProgress];
      uint64_t v14 = v13;
      [(DDRProgress *)self totalEstimateTimeOfCompletion];
      *(_DWORD *)double v36 = 138413058;
      *(void *)&v36[4] = v10;
      *(_WORD *)&v36[12] = 2048;
      *(void *)&v36[14] = v12;
      __int16 v37 = 2048;
      uint64_t v38 = v14;
      __int16 v39 = 2048;
      uint64_t v40 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Current reset task: %@ is completed, currentTaskEstimate is: %lf, completed progress is: %lf, totalEstimate is: %lf", v36, 0x2Au);
    }
    [(DDRProgress *)self completedProgress];
    double v17 = v16;
    [(DDRProgress *)self totalEstimateTimeOfCompletion];
    double v19 = v17 / v18;
    uint64_t v20 = DDRLogForCategory(1uLL);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)double v36 = 134217984;
    *(double *)&v36[4] = v19;
    uint64_t v21 = "Total percentage in complete current reset task is: %lf";
    goto LABEL_8;
  }
  [(DDRProgress *)self totalEstimateTimeOfCompletion];
  if (v31 == 0.0)
  {
    double v32 = [(DDRProgress *)self currentResetTask];
    id v33 = [v32 length];

    if (v33)
    {
      [(DDRProgress *)self _lock_resetTaskTimer];
      int64_t v34 = [(DDRProgress *)self numberOfTotalTask];
      double v35 = (double)(v34 - [(DDRProgress *)self numberOfTaskRemaining]);
      double v19 = v35 / (double)[(DDRProgress *)self numberOfTotalTask];
      uint64_t v20 = DDRLogForCategory(1uLL);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      *(_DWORD *)double v36 = 134217984;
      *(double *)&v36[4] = v19;
      uint64_t v21 = "Total percentage in complete current reset task is(estimate time 0): %lf";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, v36, 0xCu);
LABEL_9:

      uint64_t v22 = [(DDRProgress *)self delegate];
      [v22 progressDidUpdateWithPercentage:v19];

      [(DDRProgress *)self setCurrentTaskProgress:0.0];
      [(DDRProgress *)self setCurrentTaskEstimate:0.0];
      [(DDRProgress *)self setCurrentResetTask:0];
      [(DDRProgress *)self setNumberOfTaskRemaining:(char *)[(DDRProgress *)self numberOfTaskRemaining] - 1];
    }
  }
  [(DDRProgress *)self completedProgress];
  double v24 = v23;
  [(DDRProgress *)self totalEstimateTimeOfCompletion];
  double v26 = v24 - v25;
  double v27 = DDRLogForCategory(0);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v28 = [(DDRProgress *)self numberOfTaskRemaining];
    *(_DWORD *)double v36 = 134218240;
    *(double *)&v36[4] = v26;
    *(_WORD *)&v36[12] = 2048;
    *(void *)&v36[14] = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Difference is %lf, remaining task is %ld", v36, 0x16u);
  }

  if (v26 == 0.0 && ![(DDRProgress *)self numberOfTaskRemaining])
  {
    [(DDRProgress *)self _lock_resetTaskTimer];
    v29 = DDRLogForCategory(1uLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "All tasks have completed", v36, 2u);
    }

    [(DDRProgress *)self setAllResetTasksCompleted:1];
    double v30 = [(DDRProgress *)self delegate];
    [v30 didCompleteAllTasks];
  }
}

- (DDRProgressDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDRProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (double)totalEstimateTimeOfCompletion
{
  return self->_totalEstimateTimeOfCompletion;
}

- (void)setTotalEstimateTimeOfCompletion:(double)a3
{
  self->_totalEstimateTimeOfCompletion = a3;
}

- (double)completedProgress
{
  return self->_completedProgress;
}

- (void)setCompletedProgress:(double)a3
{
  self->_completedProgress = a3;
}

- (double)currentTaskEstimate
{
  return self->_currentTaskEstimate;
}

- (void)setCurrentTaskEstimate:(double)a3
{
  self->_currentTaskEstimate = a3;
}

- (double)currentTaskProgress
{
  return self->_currentTaskProgress;
}

- (void)setCurrentTaskProgress:(double)a3
{
  self->_currentTaskProgress = a3;
}

- (NSString)currentResetTask
{
  return self->_currentResetTask;
}

- (void)setCurrentResetTask:(id)a3
{
}

- (BOOL)allResetTasksCompleted
{
  return self->_allResetTasksCompleted;
}

- (void)setAllResetTasksCompleted:(BOOL)a3
{
  self->_allResetTasksCompleted = a3;
}

- (int64_t)numberOfTaskRemaining
{
  return self->_numberOfTaskRemaining;
}

- (void)setNumberOfTaskRemaining:(int64_t)a3
{
  self->_numberOfTaskRemaining = a3;
}

- (int64_t)numberOfTotalTask
{
  return self->_numberOfTotalTask;
}

- (void)setNumberOfTotalTask:(int64_t)a3
{
  self->_numberOfTotalTask = a3;
}

- (BSTimer)tickTimer
{
  return self->_tickTimer;
}

- (void)setTickTimer:(id)a3
{
}

- (double)tickInterval
{
  return self->_tickInterval;
}

- (void)setTickInterval:(double)a3
{
  self->_tickInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickTimer, 0);
  objc_storeStrong((id *)&self->_currentResetTask, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end