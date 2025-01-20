@interface HandleNotificationMessage
@end

@implementation HandleNotificationMessage

void __figXPCConnection_HandleNotificationMessage_block_invoke(uint64_t a1)
{
  v7 = 0;
  CFTypeRef cf = 0;
  FigXPCMessageCopyCFDictionary(*(void **)(a1 + 32), ".payload", &cf);
  v2 = *(uint64_t (**)(void, void, void, CFTypeRef, const void **))(a1 + 40);
  if (v2)
  {
    int v3 = v2(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 32), cf, &v7);
    if (v3 == 1) {
      goto LABEL_8;
    }
    if (v3 == 4)
    {
      if (cf) {
        CFRelease(cf);
      }
      CFTypeRef cf = v7;
    }
  }
  DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification(DefaultLocalCenter, *(const __CFString **)(a1 + 56), *(const void **)(a1 + 48), (const __CFDictionary *)cf);
LABEL_8:
  v5 = *(const void **)(a1 + 48);
  if (v5) {
    CFRelease(v5);
  }
  if (cf) {
    CFRelease(cf);
  }
  FigXPCRelease(*(xpc_object_t *)(a1 + 32));
  v6 = *(const void **)(a1 + 56);
  if (v6) {
    CFRelease(v6);
  }
}

void __figXPCConnection_HandleNotificationMessage_block_invoke_2(uint64_t a1)
{
  CFTypeRef v3 = 0;
  CFTypeRef cf = 0;
  FigXPCMessageCopyCFDictionary(*(void **)(a1 + 32), ".payload", &cf);
  (*(void (**)(void, void, void, CFTypeRef, CFTypeRef *))(a1 + 40))(0, *(void *)(a1 + 48), *(void *)(a1 + 32), cf, &v3);
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    CFRelease(v3);
  }
  FigXPCRelease(*(xpc_object_t *)(a1 + 32));
  v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
}

@end