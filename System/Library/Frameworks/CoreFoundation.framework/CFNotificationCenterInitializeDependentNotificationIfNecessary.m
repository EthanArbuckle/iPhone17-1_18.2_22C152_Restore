@interface CFNotificationCenterInitializeDependentNotificationIfNecessary
@end

@implementation CFNotificationCenterInitializeDependentNotificationIfNecessary

void ___CFNotificationCenterInitializeDependentNotificationIfNecessary_block_invoke(uint64_t a1)
{
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  v1 = *(uint64_t **)(a1 + 32);
  v2 = (void (*)(void))v1[2];
  if (v2)
  {
    v2();
    v1 = *(uint64_t **)(a1 + 32);
  }
  if (*((unsigned char *)v1 + 40))
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = v1[6] + v4;
      CFStringRef v7 = *(const __CFString **)v6;
      int v8 = *(char *)(v6 + 8);
      v17[0] = *(_DWORD *)(v6 + 9);
      *(_DWORD *)((char *)v17 + 3) = *(_DWORD *)(v6 + 12);
      switch(v8)
      {
        case 0:
          if (CFNotificationCenterGetLocalCenter_static_init != -1) {
            dispatch_once(&CFNotificationCenterGetLocalCenter_static_init, &__block_literal_global_7);
          }
          DistributedCenter = (__CFNotificationCenter *)__taskCenter;
          goto LABEL_11;
        case 1:
          DistributedCenter = CFNotificationCenterGetDistributedCenter();
          goto LABEL_11;
        case 2:
          DistributedCenter = CFNotificationCenterGetDarwinNotifyCenter();
LABEL_11:
          CFNotificationCenterAddObserver(DistributedCenter, (const void *)0x7B, (CFNotificationCallback)v1[3], v7, 0, (CFNotificationSuspensionBehavior)v1[4]);
          break;
        case 3:
          int out_token = 0;
          CStringPtr = CFStringGetCStringPtr(v7, 0x8000100u);
          if (CStringPtr || (CStringPtr = buffer, CFStringGetCString(v7, buffer, 1024, 0x8000100u)))
          {
            handler[0] = off_1ECE0A5A0;
            handler[1] = 3221225472;
            handler[2] = ___registerSubNotifications_block_invoke;
            handler[3] = &__block_descriptor_56_e8_v12__0i8l;
            handler[4] = v1;
            handler[5] = v7;
            char v14 = v8;
            v15[0] = v17[0];
            *(_DWORD *)((char *)v15 + 3) = *(_DWORD *)((char *)v17 + 3);
            notify_register_dispatch(CStringPtr, &out_token, (dispatch_queue_t)off_1ECE0A5E0, handler);
          }
          else
          {
            v11 = _CFOSLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              uint64_t v12 = *v1;
              *(_DWORD *)buf = 138543618;
              uint64_t v19 = v12;
              __int16 v20 = 2114;
              CFStringRef v21 = v7;
              _os_log_error_impl(&dword_182B90000, v11, OS_LOG_TYPE_ERROR, "Failed to register dependent notification %{public}@ -> %{public}@", buf, 0x16u);
            }
          }
          break;
        default:
          break;
      }
      ++v5;
      v4 += 16;
    }
    while (v5 < *((unsigned __int8 *)v1 + 40));
  }
}

@end