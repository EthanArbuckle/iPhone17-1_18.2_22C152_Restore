@interface NSLocale
@end

@implementation NSLocale

void __43__NSLocale_CKUtilities____ck_currentLocale__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  v1 = (void *)__ck_currentLocale_sLocale;
  __ck_currentLocale_sLocale = v0;
}

@end