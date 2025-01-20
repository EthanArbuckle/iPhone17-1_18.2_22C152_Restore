@interface CurrentBootSessionUUID
@end

@implementation CurrentBootSessionUUID

void ___CurrentBootSessionUUID_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  size_t v4 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v5, &v4, 0, 0))
  {
    v0 = (void *)_CurrentBootSessionUUID_bootSessionUUID;
    _CurrentBootSessionUUID_bootSessionUUID = 0;
  }
  else
  {
    id v1 = objc_alloc(MEMORY[0x1E4F29128]);
    v0 = (void *)[[NSString alloc] initWithUTF8String:v5];
    uint64_t v2 = [v1 initWithUUIDString:v0];
    v3 = (void *)_CurrentBootSessionUUID_bootSessionUUID;
    _CurrentBootSessionUUID_bootSessionUUID = v2;
  }
}

@end