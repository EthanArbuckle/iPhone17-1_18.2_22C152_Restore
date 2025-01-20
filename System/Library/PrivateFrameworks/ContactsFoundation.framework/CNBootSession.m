@interface CNBootSession
+ (NSString)currentBootSessionUUID;
+ (id)readCurrentBootSessionUUID;
@end

@implementation CNBootSession

+ (NSString)currentBootSessionUUID
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CNBootSession_currentBootSessionUUID__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentBootSessionUUID_cn_once_token_0 != -1) {
    dispatch_once(&currentBootSessionUUID_cn_once_token_0, block);
  }
  v2 = (void *)currentBootSessionUUID_cn_once_object_0;

  return (NSString *)v2;
}

void __39__CNBootSession_currentBootSessionUUID__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) readCurrentBootSessionUUID];
  uint64_t v1 = [v3 copy];
  v2 = (void *)currentBootSessionUUID_cn_once_object_0;
  currentBootSessionUUID_cn_once_object_0 = v1;
}

+ (id)readCurrentBootSessionUUID
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  size_t v4 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v5, &v4, 0, 0)) {
    v2 = &stru_1EE0267A8;
  }
  else {
    v2 = (__CFString *)[[NSString alloc] initWithUTF8String:v5];
  }

  return v2;
}

@end