@interface EKNullFetchRequestToken
+ (id)sharedToken;
@end

@implementation EKNullFetchRequestToken

+ (id)sharedToken
{
  if (sharedToken_onceToken != -1) {
    dispatch_once(&sharedToken_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)sharedToken_sharedToken;

  return v2;
}

uint64_t __38__EKNullFetchRequestToken_sharedToken__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedToken_sharedToken;
  sharedToken_sharedToken = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end