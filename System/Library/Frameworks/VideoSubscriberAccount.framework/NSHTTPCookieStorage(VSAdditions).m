@interface NSHTTPCookieStorage(VSAdditions)
+ (id)vs_sharedCookieStorage;
- (void)vs_saveCookies;
@end

@implementation NSHTTPCookieStorage(VSAdditions)

+ (id)vs_sharedCookieStorage
{
  if (vs_sharedCookieStorage___vs_lazy_init_predicate != -1) {
    dispatch_once(&vs_sharedCookieStorage___vs_lazy_init_predicate, &__block_literal_global_19);
  }
  v0 = (void *)vs_sharedCookieStorage___vs_lazy_init_variable;

  return v0;
}

- (void)vs_saveCookies
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [a1 cookies];
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Will save %@ cookies.", (uint8_t *)&v5, 0xCu);
  }
  [a1 _saveCookies];
  v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Did save cookies.", (uint8_t *)&v5, 2u);
  }
}

@end