@interface NSDate(FBKString)
- (uint64_t)fba_toString;
@end

@implementation NSDate(FBKString)

- (uint64_t)fba_toString
{
  if (LogDateFormatter_onceToken != -1) {
    dispatch_once(&LogDateFormatter_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)LogDateFormatter_dateFormatter;

  return [v2 stringFromDate:a1];
}

@end