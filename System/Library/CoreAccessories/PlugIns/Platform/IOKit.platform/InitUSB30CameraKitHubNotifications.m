@interface InitUSB30CameraKitHubNotifications
@end

@implementation InitUSB30CameraKitHubNotifications

void ___InitUSB30CameraKitHubNotifications_block_invoke(uint64_t a1)
{
  kern_return_t v5;
  NSObject *v6;
  id v7;
  int v8;
  kern_return_t v9;
  NSObject *v10;
  id v11;
  int v12;
  io_iterator_t notification;
  uint8_t buf[4];
  kern_return_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x263EF8340];
  __CameraKitHubClassReset(3);
  if ([*(id *)(a1 + 32) ioUSB30CameraKitHubMatchIterator])
  {
    IOObjectRelease([*(id *)(a1 + 32) ioUSB30CameraKitHubMatchIterator]);
    [*(id *)(a1 + 32) setIoUSB30CameraKitHubMatchIterator:0];
  }
  if ([*(id *)(a1 + 32) ioUSB30CameraKitHubTerminateIterator])
  {
    IOObjectRelease([*(id *)(a1 + 32) ioUSB30CameraKitHubTerminateIterator]);
    [*(id *)(a1 + 32) setIoUSB30CameraKitHubTerminateIterator:0];
  }
  [*(id *)(a1 + 32) setIoUSB30CameraKitHubNotifyPort:IONotificationPortCreate(*MEMORY[0x263F0EC90])];
  if ([*(id *)(a1 + 32) ioUSB30CameraKitHubNotifyPort])
  {
    notification = -1431655766;
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)[*(id *)(a1 + 32) ioUSB30CameraKitHubNotifyPort]);
    CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    CFMutableDictionaryRef v4 = IOServiceMatching("AppleUSB30CameraKitHub");
    CFRetain(v4);
    v5 = IOServiceAddMatchingNotification((IONotificationPortRef)[*(id *)(a1 + 32) ioUSB30CameraKitHubNotifyPort], "IOServicePublish", v4, (IOServiceMatchingCallback)__CameraKitHubClassMatch, (void *)3, &notification);
    [*(id *)(a1 + 32) setIoUSB30CameraKitHubMatchIterator:notification];
    if (v5 || ![*(id *)(a1 + 32) ioUSB30CameraKitHubMatchIterator])
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          __29__SleepAssertionManager_init__block_invoke_cold_1();
        }
        v6 = MEMORY[0x263EF8438];
        v7 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [*(id *)(a1 + 32) ioUSB30CameraKitHubMatchIterator];
        *(_DWORD *)buf = 67109376;
        v15 = v5;
        v16 = 1024;
        v17 = v8;
        _os_log_impl(&dword_222C9E000, v6, OS_LOG_TYPE_DEFAULT, "_InitUSB30CameraKitHubNotifications: IOServiceAddMatchingNotification publish fail status:%02X, ioIter:%04X", buf, 0xEu);
      }

      CFRelease(v4);
    }
    else
    {
      __CameraKitHubClassMatch(3, [*(id *)(a1 + 32) ioUSB30CameraKitHubMatchIterator]);
      v9 = IOServiceAddMatchingNotification((IONotificationPortRef)[*(id *)(a1 + 32) ioUSB30CameraKitHubNotifyPort], "IOServiceTerminate", v4, (IOServiceMatchingCallback)__CameraKitHubClassTerminate, (void *)3, &notification);
      [*(id *)(a1 + 32) setIoUSB30CameraKitHubTerminateIterator:notification];
      if (v9 || ![*(id *)(a1 + 32) ioUSB30CameraKitHubTerminateIterator])
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v10 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            __29__SleepAssertionManager_init__block_invoke_cold_1();
          }
          v10 = MEMORY[0x263EF8438];
          v11 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = [*(id *)(a1 + 32) ioUSB30CameraKitHubTerminateIterator];
          *(_DWORD *)buf = 67109376;
          v15 = v9;
          v16 = 1024;
          v17 = v12;
          _os_log_impl(&dword_222C9E000, v10, OS_LOG_TYPE_DEFAULT, "_InitUSB30CameraKitHubNotifications: IOServiceAddMatchingNotification terminate fail status:%02X, ioIter:%04X", buf, 0xEu);
        }
      }
      else
      {
        __CameraKitHubClassTerminate(3, [*(id *)(a1 + 32) ioUSB30CameraKitHubTerminateIterator]);
      }
    }
  }
}

@end