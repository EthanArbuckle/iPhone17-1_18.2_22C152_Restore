@interface CalendarPreferences
+ (id)sharedPreferences;
@end

@implementation CalendarPreferences

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_63);
  }
  v2 = (void *)sharedPreferences_sharedPreferences;

  return v2;
}

void __40__CalendarPreferences_sharedPreferences__block_invoke()
{
  v0 = objc_alloc_init(CalendarPreferences);
  v1 = (void *)sharedPreferences_sharedPreferences;
  sharedPreferences_sharedPreferences = (uint64_t)v0;
}

@end