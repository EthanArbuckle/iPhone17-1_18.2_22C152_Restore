@interface LACSecureFaceIDUIUtilities
+ (id)sharedInstance;
- (BOOL)isEnabled;
- (BOOL)isSupported;
@end

@implementation LACSecureFaceIDUIUtilities

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_sharedInstance_6;
  return v2;
}

uint64_t __44__LACSecureFaceIDUIUtilities_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_6 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BOOL)isSupported
{
  return +[LACMobileGestalt deviceSupportsExclaves];
}

- (BOOL)isEnabled
{
  v2 = +[LACFlags sharedInstance];
  char v3 = [v2 featureFlagSecureUIEnabled];

  return v3;
}

@end