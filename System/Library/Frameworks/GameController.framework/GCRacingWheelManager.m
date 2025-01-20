@interface GCRacingWheelManager
@end

@implementation GCRacingWheelManager

void __29___GCRacingWheelManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[v3 mutableCopy];
  CFMutableDictionaryRef v5 = IOServiceMatching("IOHIDDevice");
  [v4 addEntriesFromDictionary:v5];

  io_iterator_t notification = 0;
  v6 = *(IONotificationPort **)(*(void *)(a1 + 32) + 16);
  CFDictionaryRef v7 = v4;
  if (!IOServiceAddMatchingNotification(v6, "IOServiceFirstMatch", v7, (IOServiceMatchingCallback)DeviceMatched, *(void **)(a1 + 32), &notification))
  {
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), (const void *)notification);
    v9 = *(void **)(a1 + 32);
    v10 = v9[1];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __29___GCRacingWheelManager_init__block_invoke_85;
    v11[3] = &unk_26D22BC10;
    v12 = v9;
    io_iterator_t v13 = notification;
    dispatch_async(v10, v11);
    IOObjectRelease(notification);
    v8 = v12;
LABEL_6:

    goto LABEL_7;
  }
  if (gc_isInternalBuild())
  {
    v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __29___GCRacingWheelManager_init__block_invoke_cold_1((uint64_t)v3, v8);
    }
    goto LABEL_6;
  }
LABEL_7:
}

void __29___GCRacingWheelManager_init__block_invoke_85(uint64_t a1)
{
}

void __29___GCRacingWheelManager_init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_220998000, a2, OS_LOG_TYPE_ERROR, "Failed to create notification for matching: %@", (uint8_t *)&v2, 0xCu);
}

@end