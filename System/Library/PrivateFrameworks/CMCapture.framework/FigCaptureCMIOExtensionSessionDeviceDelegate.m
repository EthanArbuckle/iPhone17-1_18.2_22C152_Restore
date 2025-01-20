@interface FigCaptureCMIOExtensionSessionDeviceDelegate
- (void)device:(id)a3 propertiesChanged:(id)a4;
@end

@implementation FigCaptureCMIOExtensionSessionDeviceDelegate

- (void)device:(id)a3 propertiesChanged:(id)a4
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  v7 = (os_unfair_lock_s *)(DerivedStorage + 28);
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 28));
  if (*(unsigned char *)(DerivedStorage + 24))
  {
    os_unfair_lock_unlock(v7);
    id v8 = 0;
  }
  else
  {
    id v8 = *(id *)DerivedStorage;
    os_unfair_lock_unlock(v7);
    if (v8)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__FigCaptureCMIOExtensionSessionDeviceDelegate_device_propertiesChanged___block_invoke;
      block[3] = &unk_1E5C248A0;
      block[4] = a4;
      block[5] = v8;
      block[6] = self;
      dispatch_async(global_queue, block);
    }
  }
}

uint64_t __73__FigCaptureCMIOExtensionSessionDeviceDelegate_device_propertiesChanged___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t result = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v15;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * v5);
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6), "value");
        if (cmioefcd_devicePropertyChangedNotificationForCMIOExtensionProperty_onceToken == -1)
        {
          if (!v6) {
            goto LABEL_11;
          }
        }
        else
        {
          dispatch_once(&cmioefcd_devicePropertyChangedNotificationForCMIOExtensionProperty_onceToken, &__block_literal_global_86);
          if (!v6) {
            goto LABEL_11;
          }
        }
        if ([(id)cmioefcd_devicePropertyChangedNotificationForCMIOExtensionProperty_sCMIOExtensionPropertiesToDevicePropertyChangedNotifications objectForKeyedSubscript:v6])
        {
          [v7 setObject:v8 forKeyedSubscript:@"Value"];
          uint64_t v9 = [v7 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"UniqueID"];
          FigCaptureDeviceGetNotificationCenter(v9, v10);
          goto LABEL_12;
        }
LABEL_11:
        [v7 setObject:v6 forKeyedSubscript:@"CMIOExtensionPropertyName"];
        [v7 setObject:v8 forKeyedSubscript:@"CMIOExtensionPropertyValue"];
        uint64_t v11 = [v7 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"UniqueID"];
        FigCaptureDeviceGetNotificationCenter(v11, v12);
LABEL_12:
        CMNotificationCenterPostNotification();
        ++v5;
      }
      while (v3 != v5);
      uint64_t result = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

@end