@interface _CNTimeProfilingTask
- (CNTask)task;
- (CNTaskTimeProfileLogging)logger;
- (CNTimeProvider)timeProvider;
- (_CNTimeProfilingTask)init;
- (_CNTimeProfilingTask)initWithName:(id)a3;
- (_CNTimeProfilingTask)initWithTask:(id)a3 timeProvider:(id)a4 logger:(id)a5;
- (_CNTimeProfilingTask)initWithTask:(id)a3 timeProvider:(id)a4 os_log:(id)a5;
- (id)run;
@end

@implementation _CNTimeProfilingTask

- (_CNTimeProfilingTask)init
{
  CNInitializerUnavailableException(self, a2, sel_initWithTask_timeProvider_logger_);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_CNTimeProfilingTask)initWithName:(id)a3
{
  id v5 = a3;
  CNInitializerUnavailableException(self, a2, sel_initWithTask_timeProvider_logger_);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (_CNTimeProfilingTask)initWithTask:(id)a3 timeProvider:(id)a4 os_log:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_CNTimeProfilingTaskOSLogger alloc] initWithOSLog:v8];

  v12 = [(_CNTimeProfilingTask *)self initWithTask:v10 timeProvider:v9 logger:v11];
  return v12;
}

- (_CNTimeProfilingTask)initWithTask:(id)a3 timeProvider:(id)a4 logger:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_3 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_30);
  }
  v12 = (void *)CNGuardOSLog_cn_once_object_0_3;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v10) {
      goto LABEL_11;
    }
  }
  else
  {
    -[_CNTimeProfilingTask initWithTask:timeProvider:logger:](v12);
    if (v10) {
      goto LABEL_11;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_3 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_30);
  }
  v13 = CNGuardOSLog_cn_once_object_0_3;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT)) {
    -[_CNTimeProfilingTask initWithTask:timeProvider:logger:](v13);
  }
LABEL_11:
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_3 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_30);
    }
    v14 = CNGuardOSLog_cn_once_object_0_3;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT)) {
      -[_CNTimeProfilingTask initWithTask:timeProvider:logger:](v14);
    }
  }
  v15 = NSString;
  v16 = [v9 name];
  v17 = [v15 stringWithFormat:@"%@.time-profile", v16];

  v22.receiver = self;
  v22.super_class = (Class)_CNTimeProfilingTask;
  v18 = [(CNTask *)&v22 initWithName:v17];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_task, a3);
    objc_storeStrong((id *)&v19->_timeProvider, a4);
    objc_storeStrong((id *)&v19->_logger, a5);
    v20 = v19;
  }

  return v19;
}

- (id)run
{
  [(CNTaskTimeProfileLogging *)self->_logger taskWillBegin:self->_task];
  [(CNTimeProvider *)self->_timeProvider timestamp];
  double v4 = v3;
  id v5 = [(CNTask *)self->_task run];
  [(CNTimeProvider *)self->_timeProvider timestamp];
  double v7 = v6 - v4;
  if ([v5 isSuccess]) {
    [(CNTaskTimeProfileLogging *)self->_logger task:self->_task didCompleteAfter:v7];
  }
  if ([v5 isFailure])
  {
    logger = self->_logger;
    task = self->_task;
    id v10 = [v5 error];
    [(CNTaskTimeProfileLogging *)logger task:task didFailWithError:v10 after:v7];
  }

  return v5;
}

- (CNTask)task
{
  return (CNTask *)objc_getProperty(self, a2, 24, 1);
}

- (CNTimeProvider)timeProvider
{
  return (CNTimeProvider *)objc_getProperty(self, a2, 32, 1);
}

- (CNTaskTimeProfileLogging)logger
{
  return (CNTaskTimeProfileLogging *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

- (void)initWithTask:(os_log_t)log timeProvider:logger:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19091D000, log, OS_LOG_TYPE_FAULT, "parameter ‘logger’ must be nonnull", v1, 2u);
}

- (void)initWithTask:(os_log_t)log timeProvider:logger:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19091D000, log, OS_LOG_TYPE_FAULT, "parameter ‘timeProvider’ must be nonnull", v1, 2u);
}

- (void)initWithTask:(void *)a1 timeProvider:logger:.cold.3(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v2 = 138543362;
  uint64_t v3 = objc_opt_class();
  _os_log_fault_impl(&dword_19091D000, v1, OS_LOG_TYPE_FAULT, "parameter ‘task’ must be nonnull and of type %{public}@", (uint8_t *)&v2, 0xCu);
}

@end