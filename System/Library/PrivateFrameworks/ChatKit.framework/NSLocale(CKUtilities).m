@interface NSLocale(CKUtilities)
+ (id)__ck_currentLocale;
+ (void)__ck_setTestLocale:()CKUtilities;
@end

@implementation NSLocale(CKUtilities)

+ (id)__ck_currentLocale
{
  if (__ck_currentLocale_once != -1) {
    dispatch_once(&__ck_currentLocale_once, &__block_literal_global_759);
  }
  if (sTestLocale) {
    v0 = (void *)sTestLocale;
  }
  else {
    v0 = (void *)__ck_currentLocale_sLocale;
  }

  return v0;
}

+ (void)__ck_setTestLocale:()CKUtilities
{
  id v4 = a3;
  if ((id)sTestLocale != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&sTestLocale, a3);
    id v4 = v5;
  }
}

@end