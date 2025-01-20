@interface ShowUserNotice
@end

@implementation ShowUserNotice

void ___ShowUserNotice_block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  SInt32 error = 0;
  v2 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 2uLL, &error, *(CFDictionaryRef *)(a1 + 32));
  if (v2)
  {
    v3 = v2;
    CFOptionFlags v13 = 0;
    if (CFUserNotificationReceiveResponse(v2, 0.0, &v13))
    {
      v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v16 = "_ShowUserNotice_block_invoke";
        __int16 v17 = 2112;
        uint64_t v18 = v5;
        __int16 v19 = 1024;
        SInt32 v20 = error;
        v6 = "%s: Failed to recieve notification response for error presentation alert for app with bundle ID %@, error code %d";
        v7 = v4;
        uint32_t v8 = 28;
LABEL_5:
        _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
    else
    {
      if (v13 != 2)
      {
        if (v13 == 1)
        {
          uint64_t v11 = *(void *)(a1 + 56);
          if (!v11) {
            goto LABEL_7;
          }
        }
        else
        {
          if (v13) {
            goto LABEL_7;
          }
          uint64_t v11 = *(void *)(a1 + 48);
          if (!v11) {
            goto LABEL_7;
          }
        }
        (*(void (**)(void))(v11 + 16))();
        goto LABEL_7;
      }
      v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        v16 = "_ShowUserNotice_block_invoke";
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        v6 = "%s: Received an invalid response (kCFUserNotificationOtherResponse) from the error presentation alert for a"
             "pp with bundleID %@";
        v7 = v4;
        uint32_t v8 = 22;
        goto LABEL_5;
      }
    }

LABEL_7:
    CFRelease(v3);
    return;
  }
  v9 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v16 = "_ShowUserNotice_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    SInt32 v20 = error;
    _os_log_impl(&dword_1A7B2D000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to create error presentation alert for app with bundle ID %@, error code %d", buf, 0x1Cu);
  }
}

@end