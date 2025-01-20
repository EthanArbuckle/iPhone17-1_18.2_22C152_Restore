@interface NSNumber
@end

@implementation NSNumber

uint64_t __45__NSNumber_CKUtilities____ck_localizedString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)__ck_localizedString_sNumberFormatter;
  __ck_localizedString_sNumberFormatter = (uint64_t)v0;

  v2 = (void *)__ck_localizedString_sNumberFormatter;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "__ck_currentLocale");
  [v2 setLocale:v3];

  v4 = (void *)__ck_localizedString_sNumberFormatter;

  return [v4 setNumberStyle:0];
}

@end