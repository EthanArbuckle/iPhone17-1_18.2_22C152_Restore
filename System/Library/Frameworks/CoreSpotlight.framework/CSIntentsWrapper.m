@interface CSIntentsWrapper
+ (id)sharedInstance;
- (Class)INInteractionClass;
@end

@implementation CSIntentsWrapper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_25);
  }
  v2 = (void *)sharedInstance_sIntentsWrapper;

  return v2;
}

uint64_t __34__CSIntentsWrapper_sharedInstance__block_invoke()
{
  sharedInstance_sIntentsWrapper = objc_alloc_init(CSIntentsWrapper);

  return MEMORY[0x1F41817F8]();
}

- (Class)INInteractionClass
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getINInteractionClass_softClass;
  uint64_t v9 = getINInteractionClass_softClass;
  if (!getINInteractionClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getINInteractionClass_block_invoke;
    v5[3] = &unk_1E5548E88;
    v5[4] = &v6;
    __getINInteractionClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

@end