@interface NSDate(CRKAdditions)
+ (id)crk_sharedDateFormatter;
- (BOOL)crk_isInPast;
- (id)crk_JSONStringValue;
@end

@implementation NSDate(CRKAdditions)

- (BOOL)crk_isInPast
{
  v2 = objc_opt_new();
  v3 = [a1 earlierDate:v2];
  BOOL v4 = v3 == a1;

  return v4;
}

- (id)crk_JSONStringValue
{
  v2 = objc_msgSend((id)objc_opt_class(), "crk_sharedDateFormatter");
  v3 = [v2 stringFromDate:a1];

  return v3;
}

+ (id)crk_sharedDateFormatter
{
  if (crk_sharedDateFormatter_onceToken != -1) {
    dispatch_once(&crk_sharedDateFormatter_onceToken, &__block_literal_global_65);
  }
  v0 = (void *)crk_sharedDateFormatter_formatter;

  return v0;
}

@end