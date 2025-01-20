CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

if (![v4 isEqualToString:*MEMORY[0x263EFAE58]]
    || !objc_msgSend(a3, "aa_isPrimaryAccount"))
  {
    return 0;
  }
  return MEMORY[0x270F9A6D0](a3, sel_aa_isManagedAppleID);
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  BOOL v8 = -[CoreLocationAccountNotificationPlugin accountIsManagedAppleID:](self, "accountIsManagedAppleID:", a6, *(void *)&a4, a5);
  if (v8 != [(CoreLocationAccountNotificationPlugin *)self accountIsManagedAppleID:a3])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.locationd.appleAccountDidChange", 0, 0, 1u);
  }
}

@end