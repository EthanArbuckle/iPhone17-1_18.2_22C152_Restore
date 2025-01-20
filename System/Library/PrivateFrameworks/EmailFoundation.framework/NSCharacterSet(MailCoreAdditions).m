@interface NSCharacterSet(MailCoreAdditions)
+ (id)ef_asciiAlphaNumericCharacterSet;
+ (id)ef_rfc6376WhitespaceCharacterSet;
+ (id)ef_unsafeAddressLocalPartCharacterSet;
+ (id)ef_unsafeDomainNameCharacterSet;
@end

@implementation NSCharacterSet(MailCoreAdditions)

+ (id)ef_unsafeDomainNameCharacterSet
{
  if (ef_unsafeDomainNameCharacterSet_onceToken != -1) {
    dispatch_once(&ef_unsafeDomainNameCharacterSet_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)ef_unsafeDomainNameCharacterSet_unsafeDomainNameCharacterSet;
  return v0;
}

+ (id)ef_unsafeAddressLocalPartCharacterSet
{
  if (ef_unsafeAddressLocalPartCharacterSet_onceToken != -1) {
    dispatch_once(&ef_unsafeAddressLocalPartCharacterSet_onceToken, &__block_literal_global_3_0);
  }
  v0 = (void *)ef_unsafeAddressLocalPartCharacterSet_unsafeAddressLocalPartCharacterSet;
  return v0;
}

+ (id)ef_asciiAlphaNumericCharacterSet
{
  if (ef_asciiAlphaNumericCharacterSet_onceToken != -1) {
    dispatch_once(&ef_asciiAlphaNumericCharacterSet_onceToken, &__block_literal_global_8_0);
  }
  v0 = (void *)ef_asciiAlphaNumericCharacterSet_sAsciiAlphaNumericCharacterSet;
  return v0;
}

+ (id)ef_rfc6376WhitespaceCharacterSet
{
  if (ef_rfc6376WhitespaceCharacterSet_onceToken != -1) {
    dispatch_once(&ef_rfc6376WhitespaceCharacterSet_onceToken, &__block_literal_global_10_1);
  }
  v0 = (void *)ef_rfc6376WhitespaceCharacterSet_rfc6376WhitespaceCharacterSet;
  return v0;
}

@end