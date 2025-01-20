@interface LAKeyStoreBackendBuilder
+ (id)buildBackend;
@end

@implementation LAKeyStoreBackendBuilder

+ (id)buildBackend
{
  if (LA_LOG_once_3 != -1) {
    dispatch_once(&LA_LOG_once_3, &__block_literal_global_6);
  }
  v2 = LA_LOG_log_3;
  if (os_log_type_enabled((os_log_t)LA_LOG_log_3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "Using real storage", v5, 2u);
  }
  v3 = objc_alloc_init(_LAKeyStoreBackendKeychain);

  return v3;
}

@end