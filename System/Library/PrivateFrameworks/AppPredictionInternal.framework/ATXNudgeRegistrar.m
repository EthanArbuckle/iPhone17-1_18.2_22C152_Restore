@interface ATXNudgeRegistrar
+ (void)registerForNearbyAppNudgeWithBlock:(id)a3;
@end

@implementation ATXNudgeRegistrar

+ (void)registerForNearbyAppNudgeWithBlock:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4FB36C8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ATXNudgeRegistrar_registerForNearbyAppNudgeWithBlock___block_invoke;
  v7[3] = &unk_1E68AF638;
  id v8 = v3;
  id v5 = v3;
  id v6 = (id)[v4 registerForSuggestedActionNudgeOfType:5 withOptions:0 block:v7];
}

uint64_t __56__ATXNudgeRegistrar_registerForNearbyAppNudgeWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end