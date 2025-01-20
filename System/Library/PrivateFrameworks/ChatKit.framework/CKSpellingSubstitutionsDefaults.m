@interface CKSpellingSubstitutionsDefaults
+ (id)sharedInstance;
@end

@implementation CKSpellingSubstitutionsDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_37);
  }
  v2 = (void *)sharedInstance_sInstance_0;

  return v2;
}

void __49__CKSpellingSubstitutionsDefaults_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKSpellingSubstitutionsDefaults);
  v1 = (void *)sharedInstance_sInstance_0;
  sharedInstance_sInstance_0 = (uint64_t)v0;
}

@end