@interface DOCDateFormatter
+ (id)longDateStringFromDate:(id)a3;
+ (id)sharedLongDateFormatter;
@end

@implementation DOCDateFormatter

+ (id)sharedLongDateFormatter
{
  if (sharedLongDateFormatter_onceToken != -1) {
    dispatch_once(&sharedLongDateFormatter_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedLongDateFormatter_shared;
  return v2;
}

uint64_t __43__DOCDateFormatter_sharedLongDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)sharedLongDateFormatter_shared;
  sharedLongDateFormatter_shared = (uint64_t)v0;

  [(id)sharedLongDateFormatter_shared setDateStyle:3];
  v2 = (void *)sharedLongDateFormatter_shared;
  return [v2 setTimeStyle:1];
}

+ (id)longDateStringFromDate:(id)a3
{
  id v4 = a3;
  v5 = [a1 sharedLongDateFormatter];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

@end