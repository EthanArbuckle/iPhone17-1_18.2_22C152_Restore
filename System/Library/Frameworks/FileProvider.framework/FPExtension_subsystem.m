@interface FPExtension_subsystem
+ (id)sharedInstance;
- (void)beginUsing:(id)a3 withBundle:(id)a4;
@end

@implementation FPExtension_subsystem

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__FPExtension_subsystem_beginUsing_withBundle___block_invoke;
  block[3] = &unk_1E5AF21B8;
  v11 = self;
  SEL v12 = a2;
  id v10 = v6;
  uint64_t v7 = beginUsing_withBundle__onceToken;
  id v8 = v6;
  if (v7 != -1) {
    dispatch_once(&beginUsing_withBundle__onceToken, block);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__FPExtension_subsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_once_2 != -1) {
    dispatch_once(&sharedInstance_once_2, block);
  }
  v2 = (void *)sharedInstance___instance;

  return v2;
}

@end