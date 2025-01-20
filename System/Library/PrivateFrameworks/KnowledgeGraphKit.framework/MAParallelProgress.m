@interface MAParallelProgress
- (BOOL)isCancelled;
- (BOOL)isCancelledWithProgress:(double)a3 index:(unint64_t)a4;
- (MAParallelProgress)initWithProgressReporter:(id)a3 parallelOperationCount:(unint64_t)a4;
@end

@implementation MAParallelProgress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressValues, 0);
  objc_storeStrong((id *)&self->_progressReporter, 0);
}

- (BOOL)isCancelledWithProgress:(double)a3 index:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v8 = [(MAFloatVector *)self->_progressValues count];
  if (v8 <= a4)
  {
    unint64_t v11 = v8;
    v12 = KGLoggingConnection();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      int v15 = 134218240;
      unint64_t v16 = a4;
      __int16 v17 = 2048;
      unint64_t v18 = v11;
      _os_log_fault_impl(&dword_1D1654000, v12, OS_LOG_TYPE_FAULT, "Parallel progress index(%lu) out of bounds(%lu)", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    *(float *)&double v9 = a3;
    [(MAMutableFloatVector *)self->_progressValues setFloat:a4 atIndex:v9];
    [(MAFloatVector *)self->_progressValues mean];
    a3 = v10;
  }
  BOOL v13 = [(MAProgressReporter *)self->_progressReporter isCancelledWithProgress:a3];
  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (BOOL)isCancelled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(MAProgressReporter *)v2->_progressReporter isCancelled];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (MAParallelProgress)initWithProgressReporter:(id)a3 parallelOperationCount:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MAParallelProgress;
  unint64_t v8 = [(MAParallelProgress *)&v13 init];
  double v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_progressReporter, a3);
    uint64_t v10 = +[MAFloatVector zerosOfCount:a4];
    progressValues = v9->_progressValues;
    v9->_progressValues = (MAMutableFloatVector *)v10;
  }
  return v9;
}

@end