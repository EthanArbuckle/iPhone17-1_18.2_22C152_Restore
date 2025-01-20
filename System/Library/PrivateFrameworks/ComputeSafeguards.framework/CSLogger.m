@interface CSLogger
+ (id)defaultCategory;
+ (id)logForCategory:(id)a3;
+ (void)initialize;
@end

@implementation CSLogger

+ (id)defaultCategory
{
  return (id)csLog;
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_4);
  }
}

void __22__CSLogger_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.computesafeguards", "default");
  v1 = (void *)csLog;
  csLog = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = (void *)logCategories;
  logCategories = v2;

  lock = 0;
}

+ (id)logForCategory:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  v4 = [(id)logCategories objectForKeyedSubscript:v3];
  if (!v4) {
    v4 = os_log_create("com.apple.computesafeguards", (const char *)[v3 UTF8String]);
  }
  [(id)logCategories setObject:v4 forKeyedSubscript:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);

  return v4;
}

@end