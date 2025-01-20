@interface NSCharacterSet(SubjectParser)
+ (id)ec_prefixDelimiterCharacterSet;
@end

@implementation NSCharacterSet(SubjectParser)

+ (id)ec_prefixDelimiterCharacterSet
{
  if (ec_prefixDelimiterCharacterSet_onceToken != -1) {
    dispatch_once(&ec_prefixDelimiterCharacterSet_onceToken, &__block_literal_global_20);
  }
  v0 = (void *)ec_prefixDelimiterCharacterSet_prefixDelimiterCharacterSet;
  return v0;
}

@end