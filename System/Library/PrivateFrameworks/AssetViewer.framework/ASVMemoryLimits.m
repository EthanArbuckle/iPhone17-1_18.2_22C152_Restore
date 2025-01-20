@interface ASVMemoryLimits
+ (unint64_t)currentMemoryFootprint;
+ (unint64_t)processMemory;
+ (unint64_t)thumbnailMemoryAvailableForTextures;
+ (unint64_t)viewerMemoryAvailableForTexturesOnHighMemoryDevices;
+ (unint64_t)viewerMemoryAvailableForTexturesOnThisDevice;
@end

@implementation ASVMemoryLimits

+ (unint64_t)viewerMemoryAvailableForTexturesOnHighMemoryDevices
{
  return 838860800;
}

+ (unint64_t)processMemory
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  int v3 = [v2 processIdentifier];

  int v4 = memorystatus_control();
  if (v4)
  {
    int v5 = v4;
    v6 = AssetViewerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v9 = v3;
      __int16 v10 = 1024;
      int v11 = v5;
      _os_log_impl(&dword_1E2840000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Failed to get memory limit info for pid %d. Errorno: %d, Limits will appear as 0MB and not fatal.\n", buf, 0xEu);
    }
  }
  return 0;
}

+ (unint64_t)viewerMemoryAvailableForTexturesOnThisDevice
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [a1 processMemory];
  int v3 = AssetViewerLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = v2;
    _os_log_impl(&dword_1E2840000, v3, OS_LOG_TYPE_DEFAULT, "processMemory for textures is %lu", (uint8_t *)&v5, 0xCu);
  }

  if (v2 < 0x1F5) {
    return 52428800;
  }
  if (v2 < 0x2BD) {
    return 157286400;
  }
  if (v2 >= 0x465) {
    return +[ASVMemoryLimits viewerMemoryAvailableForTexturesOnHighMemoryDevices];
  }
  return 503316480;
}

+ (unint64_t)thumbnailMemoryAvailableForTextures
{
  return 52428800;
}

+ (unint64_t)currentMemoryFootprint
{
  int v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)task_info_out = 0u;
  long long v6 = 0u;
  mach_msg_type_number_t task_info_outCnt = 93;
  uint64_t v2 = task_info(*MEMORY[0x1E4F14960], 0x16u, task_info_out, &task_info_outCnt);
  if (!v2) {
    return (unint64_t)(float)((float)((float)(unint64_t)v14 * 0.00097656) * 0.00097656);
  }
  NSLog(&cfstr_FiledToGetMemo.isa, v2);
  return 0;
}

@end