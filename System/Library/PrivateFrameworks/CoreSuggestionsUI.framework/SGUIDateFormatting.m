@interface SGUIDateFormatting
+ (id)allDayFormatter;
+ (id)birthdayFormatter;
+ (id)fullDayFormatter;
+ (id)fullDayTimeFormatter;
+ (id)mediumDateFormatter;
+ (id)multiDayDateFormatter;
+ (id)reminderAllDayDateFormatter;
+ (id)reminderDateFormatter;
+ (id)reminderDateTimeFormatter;
+ (id)singleDayDateFormatter;
+ (id)singleDayTimeFormatter;
@end

@implementation SGUIDateFormatting

+ (id)birthdayFormatter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SGUIDateFormatting_birthdayFormatter__block_invoke;
  block[3] = &unk_1E612E7E8;
  v5 = @"MMMMd";
  if (birthdayFormatter_onceToken != -1) {
    dispatch_once(&birthdayFormatter_onceToken, block);
  }
  id v2 = (id)birthdayFormatter_birthdayFormatter;

  return v2;
}

uint64_t __39__SGUIDateFormatting_birthdayFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)birthdayFormatter_birthdayFormatter;
  birthdayFormatter_birthdayFormatter = v2;

  v4 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)birthdayFormatter_birthdayFormatter setLocale:v4];

  v5 = (void *)birthdayFormatter_birthdayFormatter;
  uint64_t v6 = *(void *)(a1 + 32);
  return [v5 setLocalizedDateFormatFromTemplate:v6];
}

+ (id)reminderAllDayDateFormatter
{
  if (reminderAllDayDateFormatter_onceToken != -1) {
    dispatch_once(&reminderAllDayDateFormatter_onceToken, &__block_literal_global_18);
  }
  uint64_t v2 = (void *)reminderAllDayDateFormatter_reminderAllDayDateFormatter;
  return v2;
}

uint64_t __49__SGUIDateFormatting_reminderAllDayDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)reminderAllDayDateFormatter_reminderAllDayDateFormatter;
  reminderAllDayDateFormatter_reminderAllDayDateFormatter = v0;

  [(id)reminderAllDayDateFormatter_reminderAllDayDateFormatter setDoesRelativeDateFormatting:1];
  uint64_t v2 = (void *)reminderAllDayDateFormatter_reminderAllDayDateFormatter;
  return [v2 setDateStyle:1];
}

+ (id)reminderDateTimeFormatter
{
  if (reminderDateTimeFormatter_onceToken != -1) {
    dispatch_once(&reminderDateTimeFormatter_onceToken, &__block_literal_global_16);
  }
  uint64_t v2 = (void *)reminderDateTimeFormatter_reminderDateFormatter;
  return v2;
}

uint64_t __47__SGUIDateFormatting_reminderDateTimeFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)reminderDateTimeFormatter_reminderDateFormatter;
  reminderDateTimeFormatter_reminderDateFormatter = v0;

  [(id)reminderDateTimeFormatter_reminderDateFormatter setDoesRelativeDateFormatting:1];
  [(id)reminderDateTimeFormatter_reminderDateFormatter setDateStyle:2];
  uint64_t v2 = (void *)reminderDateTimeFormatter_reminderDateFormatter;
  return [v2 setTimeStyle:1];
}

+ (id)reminderDateFormatter
{
  if (reminderDateFormatter_onceToken != -1) {
    dispatch_once(&reminderDateFormatter_onceToken, &__block_literal_global_14);
  }
  uint64_t v2 = (void *)reminderDateFormatter_reminderDateFormatter;
  return v2;
}

uint64_t __43__SGUIDateFormatting_reminderDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)reminderDateFormatter_reminderDateFormatter;
  reminderDateFormatter_reminderDateFormatter = v0;

  [(id)reminderDateFormatter_reminderDateFormatter setDoesRelativeDateFormatting:1];
  [(id)reminderDateFormatter_reminderDateFormatter setDateStyle:1];
  uint64_t v2 = (void *)reminderDateFormatter_reminderDateFormatter;
  return [v2 setTimeStyle:1];
}

+ (id)mediumDateFormatter
{
  if (mediumDateFormatter_onceToken != -1) {
    dispatch_once(&mediumDateFormatter_onceToken, &__block_literal_global_12);
  }
  uint64_t v2 = (void *)mediumDateFormatter_formatter;
  return v2;
}

uint64_t __41__SGUIDateFormatting_mediumDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)mediumDateFormatter_formatter;
  mediumDateFormatter_formatter = v0;

  [(id)mediumDateFormatter_formatter setDateStyle:2];
  uint64_t v2 = (void *)mediumDateFormatter_formatter;
  return [v2 setTimeStyle:0];
}

+ (id)multiDayDateFormatter
{
  if (multiDayDateFormatter_onceToken != -1) {
    dispatch_once(&multiDayDateFormatter_onceToken, &__block_literal_global_10);
  }
  uint64_t v2 = (void *)multiDayDateFormatter_formatter;
  return v2;
}

uint64_t __43__SGUIDateFormatting_multiDayDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)multiDayDateFormatter_formatter;
  multiDayDateFormatter_formatter = v0;

  [(id)multiDayDateFormatter_formatter setDateStyle:3];
  uint64_t v2 = (void *)multiDayDateFormatter_formatter;
  return [v2 setTimeStyle:1];
}

+ (id)singleDayTimeFormatter
{
  if (singleDayTimeFormatter_onceToken != -1) {
    dispatch_once(&singleDayTimeFormatter_onceToken, &__block_literal_global_8);
  }
  uint64_t v2 = (void *)singleDayTimeFormatter_formatter;
  return v2;
}

uint64_t __44__SGUIDateFormatting_singleDayTimeFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)singleDayTimeFormatter_formatter;
  singleDayTimeFormatter_formatter = v0;

  [(id)singleDayTimeFormatter_formatter setDateStyle:0];
  uint64_t v2 = (void *)singleDayTimeFormatter_formatter;
  return [v2 setTimeStyle:1];
}

+ (id)singleDayDateFormatter
{
  if (singleDayDateFormatter_onceToken != -1) {
    dispatch_once(&singleDayDateFormatter_onceToken, &__block_literal_global_6);
  }
  uint64_t v2 = (void *)singleDayDateFormatter_formatter;
  return v2;
}

uint64_t __44__SGUIDateFormatting_singleDayDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)singleDayDateFormatter_formatter;
  singleDayDateFormatter_formatter = v0;

  [(id)singleDayDateFormatter_formatter setDateStyle:2];
  uint64_t v2 = (void *)singleDayDateFormatter_formatter;
  return [v2 setTimeStyle:0];
}

+ (id)fullDayTimeFormatter
{
  if (fullDayTimeFormatter_onceToken != -1) {
    dispatch_once(&fullDayTimeFormatter_onceToken, &__block_literal_global_4);
  }
  uint64_t v2 = (void *)fullDayTimeFormatter_fullDateFormatter;
  return v2;
}

uint64_t __42__SGUIDateFormatting_fullDayTimeFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)fullDayTimeFormatter_fullDateFormatter;
  fullDayTimeFormatter_fullDateFormatter = v0;

  [(id)fullDayTimeFormatter_fullDateFormatter setDateStyle:0];
  uint64_t v2 = (void *)fullDayTimeFormatter_fullDateFormatter;
  return [v2 setTimeStyle:1];
}

+ (id)fullDayFormatter
{
  if (fullDayFormatter_onceToken != -1) {
    dispatch_once(&fullDayFormatter_onceToken, &__block_literal_global_2);
  }
  uint64_t v2 = (void *)fullDayFormatter_fullDateFormatter;
  return v2;
}

uint64_t __38__SGUIDateFormatting_fullDayFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)fullDayFormatter_fullDateFormatter;
  fullDayFormatter_fullDateFormatter = v0;

  [(id)fullDayFormatter_fullDateFormatter setDateStyle:3];
  uint64_t v2 = (void *)fullDayFormatter_fullDateFormatter;
  return [v2 setTimeStyle:1];
}

+ (id)allDayFormatter
{
  if (allDayFormatter_onceToken != -1) {
    dispatch_once(&allDayFormatter_onceToken, &__block_literal_global_906);
  }
  uint64_t v2 = (void *)allDayFormatter_allDayFormatter;
  return v2;
}

uint64_t __37__SGUIDateFormatting_allDayFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)allDayFormatter_allDayFormatter;
  allDayFormatter_allDayFormatter = v0;

  [(id)allDayFormatter_allDayFormatter setDateStyle:3];
  uint64_t v2 = (void *)allDayFormatter_allDayFormatter;
  return [v2 setTimeStyle:0];
}

@end