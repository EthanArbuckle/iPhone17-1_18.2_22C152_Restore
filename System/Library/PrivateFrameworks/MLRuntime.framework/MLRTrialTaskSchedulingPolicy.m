@interface MLRTrialTaskSchedulingPolicy
- (MLRTrialTaskSchedulingPolicy)initWithMaxEvaluations:(unint64_t)a3 periodicIntervalSeconds:(double)a4 startAfterDate:(id)a5 endAtDate:(id)a6 taskID:(id)a7;
- (MLRTrialTaskSchedulingPolicy)initWithTRIMLRuntimeEvaluation:(id)a3;
- (NSDate)endAtDate;
- (NSDate)startAfterDate;
- (NSString)taskID;
- (double)minInterval;
- (id)description;
- (unint64_t)maxPerformCount;
@end

@implementation MLRTrialTaskSchedulingPolicy

- (MLRTrialTaskSchedulingPolicy)initWithTRIMLRuntimeEvaluation:(id)a3
{
  id v4 = a3;
  if [v4 hasSchedulingPolicy] && (objc_msgSend(v4, "hasEvaluationId"))
  {
    v5 = [v4 schedulingPolicy];
    uint64_t v6 = [v4 evaluationId];
    v7 = (void *)v6;
    if (v5)
    {
      if (v6)
      {
        if ([v5 hasMaxEvaluations]) {
          uint64_t v8 = [v5 maxEvaluations];
        }
        else {
          uint64_t v8 = -1;
        }
        double v32 = 0.0;
        if ([v5 hasPeriodicIntervalSeconds]) {
          double v32 = (double)[v5 periodicIntervalSeconds];
        }
        if ([v5 hasStartsAfter])
        {
          v33 = [v5 startsAfter];
          v34 = [v33 date];
        }
        else
        {
          v34 = [MEMORY[0x263EFF910] distantPast];
        }
        if ([v5 hasEndsAt])
        {
          v35 = [v5 endsAt];
          v36 = [v35 date];
        }
        else
        {
          v36 = [MEMORY[0x263EFF910] distantFuture];
        }
        self = [(MLRTrialTaskSchedulingPolicy *)self initWithMaxEvaluations:v8 periodicIntervalSeconds:v34 startAfterDate:v36 endAtDate:v7 taskID:v32];

        v16 = self;
        goto LABEL_25;
      }
      v17 = [MEMORY[0x263F3A438] coreChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MLRTrialTaskSchedulingPolicy initWithTRIMLRuntimeEvaluation:](v17, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    else
    {
      v17 = [MEMORY[0x263F3A438] coreChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MLRTrialTaskSchedulingPolicy initWithTRIMLRuntimeEvaluation:](v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }

    v16 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v5 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLRTrialTaskSchedulingPolicy initWithTRIMLRuntimeEvaluation:](v5, v9, v10, v11, v12, v13, v14, v15);
  }
  v16 = 0;
LABEL_26:

  return v16;
}

- (MLRTrialTaskSchedulingPolicy)initWithMaxEvaluations:(unint64_t)a3 periodicIntervalSeconds:(double)a4 startAfterDate:(id)a5 endAtDate:(id)a6 taskID:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MLRTrialTaskSchedulingPolicy;
  v16 = [(MLRTrialTaskSchedulingPolicy *)&v21 init];
  v17 = v16;
  if (v16)
  {
    if (a3) {
      unint64_t v18 = a3;
    }
    else {
      unint64_t v18 = -1;
    }
    v16->_maxPerformCount = v18;
    double v19 = 21600.0;
    if (a4 >= 21600.0) {
      double v19 = a4;
    }
    v16->_minInterval = v19;
    objc_storeStrong((id *)&v16->_startAfterDate, a5);
    objc_storeStrong((id *)&v17->_endAtDate, a6);
    objc_storeStrong((id *)&v17->_taskID, a7);
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@(%lu, %f, %@, %@)", v5, self->_maxPerformCount, *(void *)&self->_minInterval, self->_startAfterDate, self->_endAtDate];

  return v6;
}

- (unint64_t)maxPerformCount
{
  return self->_maxPerformCount;
}

- (double)minInterval
{
  return self->_minInterval;
}

- (NSDate)startAfterDate
{
  return self->_startAfterDate;
}

- (NSDate)endAtDate
{
  return self->_endAtDate;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_endAtDate, 0);

  objc_storeStrong((id *)&self->_startAfterDate, 0);
}

- (void)initWithTRIMLRuntimeEvaluation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTRIMLRuntimeEvaluation:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTRIMLRuntimeEvaluation:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end