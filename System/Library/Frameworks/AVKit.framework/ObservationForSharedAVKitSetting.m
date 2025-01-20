@interface ObservationForSharedAVKitSetting
@end

@implementation ObservationForSharedAVKitSetting

void ___ObservationForSharedAVKitSetting_block_invoke(id *a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___ObservationForSharedAVKitSetting_block_invoke_2;
  v2[3] = &unk_1E5FC1E10;
  id v3 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void ___ObservationForSharedAVKitSetting_block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = AVKitUserDefaults();
  id v3 = [v2 stringForKey:*(void *)(a1 + 32)];

  uint64_t v4 = [*(id *)(a1 + 40) valueForKey:*(void *)(a1 + 48)];
  id v5 = (void *)v4;
  if (v3 != (void *)v4)
  {
    BOOL v6 = !v3 || v4 == 0;
    if (v6 || ([v3 isEqualToString:v4] & 1) == 0)
    {
      [*(id *)(a1 + 40) setValue:v3 forKey:*(void *)(a1 + 48)];
      v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v10 = 138543618;
        uint64_t v11 = v8;
        __int16 v12 = 2114;
        v13 = v3;
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "Observation: shared value of '%{public}@' changed to '%{public}@", (uint8_t *)&v10, 0x16u);
      }

      if ([*(id *)(a1 + 56) length])
      {
        v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v9 postNotificationName:*(void *)(a1 + 56) object:v3 userInfo:0];
      }
    }
  }
}

@end