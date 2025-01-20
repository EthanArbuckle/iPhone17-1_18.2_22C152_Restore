@interface BGSystemTaskWorkload
+ (BOOL)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 error:(id *)a5;
+ (id)logger;
@end

@implementation BGSystemTaskWorkload

+ (id)logger
{
  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global);
  }
  v2 = (void *)logger_log;
  return v2;
}

uint64_t __30__BGSystemTaskWorkload_logger__block_invoke()
{
  logger_log = (uint64_t)os_log_create("com.apple.BackgroundSystemTasks", "BGSTFramework");
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v8 = +[BGSystemTaskWorkload logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218240;
    unint64_t v15 = a3;
    __int16 v16 = 2048;
    unint64_t v17 = a4;
    _os_log_impl(&dword_1D9606000, v8, OS_LOG_TYPE_DEFAULT, "Received system workload %lu for category %lu", (uint8_t *)&v14, 0x16u);
  }

  v9 = [MEMORY[0x1E4F5FA50] sharedScheduler];
  char v10 = [v9 reportSystemWorkload:a3 ofCategory:a4 error:a5];

  if (a5)
  {
    v11 = +[BGSystemTaskWorkload logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = *a5;
      int v14 = 138412802;
      unint64_t v15 = (unint64_t)v13;
      __int16 v16 = 2048;
      unint64_t v17 = a3;
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      _os_log_error_impl(&dword_1D9606000, v11, OS_LOG_TYPE_ERROR, "Error:%@ reporting system workload %lu for category %lu", (uint8_t *)&v14, 0x20u);
    }
  }
  return v10;
}

@end