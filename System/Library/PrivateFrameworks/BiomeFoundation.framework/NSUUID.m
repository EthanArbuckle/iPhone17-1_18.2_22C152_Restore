@interface NSUUID
@end

@implementation NSUUID

void __41__NSUUID_BMUtilities__bm_bootSessionUUID__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(v6, 0, sizeof(v6));
  size_t v5 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v6, &v5, 0, 0))
  {
    v0 = __biome_log_for_category(0);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
      __41__NSUUID_BMUtilities__bm_bootSessionUUID__block_invoke_cold_1(v0);
    }

    uint64_t v1 = [MEMORY[0x1E4F29128] UUID];
    v2 = (void *)bm_bootSessionUUID__bootSessionUUID;
    bm_bootSessionUUID__bootSessionUUID = v1;
  }
  else
  {
    v2 = (void *)[[NSString alloc] initWithUTF8String:v6];
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
    v4 = (void *)bm_bootSessionUUID__bootSessionUUID;
    bm_bootSessionUUID__bootSessionUUID = v3;
  }
}

void __41__NSUUID_BMUtilities__bm_bootSessionUUID__block_invoke_cold_1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1B30A0000, a1, OS_LOG_TYPE_FAULT, "Failed to retrieve boot session UUID with error %{darwin.errno}d", (uint8_t *)v3, 8u);
}

@end