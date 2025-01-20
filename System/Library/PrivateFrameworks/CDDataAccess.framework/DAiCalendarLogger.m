@interface DAiCalendarLogger
+ (id)sharedLogger;
- (void)logICSMessage:(id)a3 atLevel:(int64_t)a4;
- (void)registerWithiCalendar;
@end

@implementation DAiCalendarLogger

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1) {
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedLogger_sSharedLogger;
  return v2;
}

uint64_t __33__DAiCalendarLogger_sharedLogger__block_invoke()
{
  sharedLogger_sSharedLogger = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)registerWithiCalendar
{
}

- (void)logICSMessage:(id)a3 atLevel:(int64_t)a4
{
  int v4 = a4;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F50E48] + v4);
  if (os_log_type_enabled(v6, v7))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1C86FF000, v6, v7, "%@", (uint8_t *)&v8, 0xCu);
  }
}

@end