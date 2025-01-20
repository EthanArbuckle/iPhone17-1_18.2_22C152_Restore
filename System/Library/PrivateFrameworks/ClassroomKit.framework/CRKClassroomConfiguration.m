@interface CRKClassroomConfiguration
+ (id)configurationSource;
+ (id)setOfActiveRestrictionUUIDs:(id)a3;
+ (void)fetchConfiguration:(id)a3;
+ (void)setConfiguration:(id)a3 completion:(id)a4;
@end

@implementation CRKClassroomConfiguration

+ (id)configurationSource
{
  NSStringFromClass((Class)a1);
  id v2 = objc_claimAutoreleasedReturnValue();
  v3 = (const char *)[v2 UTF8String];
  dispatch_queue_t v4 = dispatch_queue_create(v3, MEMORY[0x263EF83A8]);

  v5 = [[CRKCurrentPlatformProfileConfigurationSource alloc] initWithCallbackQueue:v4];

  return v5;
}

+ (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 configurationSource];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__CRKClassroomConfiguration_setConfiguration_completion___block_invoke;
  v10[3] = &unk_2646F34B0;
  id v11 = v6;
  id v9 = v6;
  [v8 setConfiguration:v7 completion:v10];
}

uint64_t __57__CRKClassroomConfiguration_setConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)fetchConfiguration:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 configurationSource];
    [v5 fetchConfiguration:v4];
  }
}

+ (id)setOfActiveRestrictionUUIDs:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = objc_msgSend(v4, "crk_isStudentdInstalled");

  if (v5)
  {
    id v6 = objc_opt_new();
    id v7 = [v6 setOfActiveRestrictionUUIDs:v3];
  }
  else
  {
    id v7 = objc_opt_new();
  }

  return v7;
}

@end