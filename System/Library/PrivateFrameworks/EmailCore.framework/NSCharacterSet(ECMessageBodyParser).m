@interface NSCharacterSet(ECMessageBodyParser)
+ (uint64_t)ec_ignorableCharacterSet;
+ (uint64_t)ec_whitespaceNewlineAndTagCharacterSet;
+ (uint64_t)ec_zeroWidthCharacterSet;
@end

@implementation NSCharacterSet(ECMessageBodyParser)

+ (uint64_t)ec_whitespaceNewlineAndTagCharacterSet
{
  if (ec_whitespaceNewlineAndTagCharacterSet_onceToken != -1) {
    dispatch_once(&ec_whitespaceNewlineAndTagCharacterSet_onceToken, &__block_literal_global_244);
  }
  return ec_whitespaceNewlineAndTagCharacterSet_result;
}

+ (uint64_t)ec_zeroWidthCharacterSet
{
  if (ec_zeroWidthCharacterSet_onceToken != -1) {
    dispatch_once(&ec_zeroWidthCharacterSet_onceToken, &__block_literal_global_250);
  }
  return ec_zeroWidthCharacterSet_result;
}

+ (uint64_t)ec_ignorableCharacterSet
{
  if (ec_ignorableCharacterSet_onceToken != -1) {
    dispatch_once(&ec_ignorableCharacterSet_onceToken, &__block_literal_global_271);
  }
  return ec_ignorableCharacterSet_result;
}

@end