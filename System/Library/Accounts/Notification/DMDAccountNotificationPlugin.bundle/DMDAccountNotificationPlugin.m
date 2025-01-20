CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_release(id a1)
{
}

alue();

  if (!v10 || !v8)
  {
    if (!(v10 | v8)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (([(id)v10 isEqualToString:v8] & 1) == 0)
  {
LABEL_6:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F39C68], 0, 0, 1u);
  }
LABEL_7:
}

@end