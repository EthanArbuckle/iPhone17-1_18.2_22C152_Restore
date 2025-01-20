@interface BKSDefaults
+ (id)externalDefaults;
+ (id)localDefaults;
@end

@implementation BKSDefaults

+ (id)localDefaults
{
  if (localDefaults___once != -1) {
    dispatch_once(&localDefaults___once, &__block_literal_global_10755);
  }
  v2 = (void *)localDefaults___instance;
  return v2;
}

+ (id)externalDefaults
{
  if (externalDefaults___once != -1) {
    dispatch_once(&externalDefaults___once, &__block_literal_global_2_10752);
  }
  v2 = (void *)externalDefaults___instance;
  return v2;
}

uint64_t __31__BKSDefaults_externalDefaults__block_invoke()
{
  v0 = objc_alloc_init(BKSExternalDefaults);
  uint64_t v1 = externalDefaults___instance;
  externalDefaults___instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __28__BKSDefaults_localDefaults__block_invoke()
{
  v0 = objc_alloc_init(BKSLocalDefaults);
  uint64_t v1 = localDefaults___instance;
  localDefaults___instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end