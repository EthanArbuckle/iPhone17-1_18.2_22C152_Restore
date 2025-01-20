@interface NSNumber(CKUtilities)
- (uint64_t)__ck_localizedString;
@end

@implementation NSNumber(CKUtilities)

- (uint64_t)__ck_localizedString
{
  if (__ck_localizedString_once != -1) {
    dispatch_once(&__ck_localizedString_once, &__block_literal_global_764);
  }
  v2 = (void *)__ck_localizedString_sNumberFormatter;

  return [v2 stringFromNumber:a1];
}

@end