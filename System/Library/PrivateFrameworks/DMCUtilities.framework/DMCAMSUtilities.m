@interface DMCAMSUtilities
+ (id)appstoredUserAgent;
@end

@implementation DMCAMSUtilities

+ (id)appstoredUserAgent
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v2 = (void *)getAMSProcessInfoClass_softClass;
  uint64_t v17 = getAMSProcessInfoClass_softClass;
  if (!getAMSProcessInfoClass_softClass)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __getAMSProcessInfoClass_block_invoke;
    v12 = &unk_1E5CFD440;
    v13 = &v14;
    __getAMSProcessInfoClass_block_invoke((uint64_t)&v9);
    v2 = (void *)v15[3];
  }
  v3 = v2;
  _Block_object_dispose(&v14, 8);
  v4 = (void *)[[v3 alloc] initWithBundleIdentifier:@"com.apple.appstored"];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v5 = (void *)getAMSUserAgentClass_softClass;
  uint64_t v17 = getAMSUserAgentClass_softClass;
  if (!getAMSUserAgentClass_softClass)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __getAMSUserAgentClass_block_invoke;
    v12 = &unk_1E5CFD440;
    v13 = &v14;
    __getAMSUserAgentClass_block_invoke((uint64_t)&v9);
    v5 = (void *)v15[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v14, 8);
  v7 = [v6 userAgentForProcessInfo:v4];

  return v7;
}

@end