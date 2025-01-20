@interface _CNTimeProfilingTaskOSLogger
- (NSString)description;
- (OS_os_log)os_log;
- (_CNTimeProfilingTaskOSLogger)init;
- (_CNTimeProfilingTaskOSLogger)initWithOSLog:(id)a3;
- (void)task:(id)a3 didCompleteAfter:(double)a4;
- (void)task:(id)a3 didFailWithError:(id)a4 after:(double)a5;
- (void)taskWillBegin:(id)a3;
@end

@implementation _CNTimeProfilingTaskOSLogger

- (_CNTimeProfilingTaskOSLogger)init
{
  CNInitializerUnavailableException(self, a2, sel_initWithOSLog_);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_CNTimeProfilingTaskOSLogger)initWithOSLog:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNTimeProfilingTaskOSLogger;
  v6 = [(_CNTimeProfilingTaskOSLogger *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_os_log, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"os_log" object:self->_os_log];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (void)taskWillBegin:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_CNTimeProfilingTaskOSLogger *)self os_log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 name];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19091D000, v5, OS_LOG_TYPE_DEFAULT, "Task '%{public}@' beginning", (uint8_t *)&v7, 0xCu);
  }
}

- (void)task:(id)a3 didCompleteAfter:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = +[CNTimeIntervalFormatter stringForTimeInterval:a4];
  v8 = [(_CNTimeProfilingTaskOSLogger *)self os_log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 name];
    int v10 = 138543618;
    v11 = v9;
    __int16 v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_19091D000, v8, OS_LOG_TYPE_DEFAULT, "Task '%{public}@' complete (%{public}@)", (uint8_t *)&v10, 0x16u);
  }
}

- (void)task:(id)a3 didFailWithError:(id)a4 after:(double)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = +[CNTimeIntervalFormatter stringForTimeInterval:a5];
  v11 = [(_CNTimeProfilingTaskOSLogger *)self os_log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = [v8 name];
    int v13 = 138543874;
    uint64_t v14 = v12;
    __int16 v15 = 2114;
    v16 = v10;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl(&dword_19091D000, v11, OS_LOG_TYPE_DEFAULT, "Task '%{public}@' failed (%{public}@): %{public}@", (uint8_t *)&v13, 0x20u);
  }
}

- (OS_os_log)os_log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end