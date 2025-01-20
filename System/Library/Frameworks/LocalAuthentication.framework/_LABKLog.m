@interface _LABKLog
+ (OS_os_log)log;
+ (void)logClass:(Class)a3 selector:(SEL)a4 message:(id)a5;
@end

@implementation _LABKLog

+ (OS_os_log)log
{
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)log_log_0;

  return (OS_os_log *)v2;
}

+ (void)logClass:(Class)a3 selector:(SEL)a4 message:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v8 = (objc_class *)NSString;
  id v9 = a5;
  v10 = (void *)[[v8 alloc] initWithFormat:v9 arguments:&v21];

  v11 = [a1 log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = NSStringFromClass(a3);
    v13 = NSStringFromSelector(a4);
    *(_DWORD *)buf = 138412802;
    v15 = v12;
    __int16 v16 = 2112;
    v17 = v13;
    __int16 v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1BED06000, v11, OS_LOG_TYPE_INFO, "%@:%@: %@", buf, 0x20u);
  }
}

@end