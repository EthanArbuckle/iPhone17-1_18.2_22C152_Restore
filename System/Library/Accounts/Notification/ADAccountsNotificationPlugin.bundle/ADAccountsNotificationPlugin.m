void sub_240544158()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t vars8;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.ap.adprivacyd.iTunesActiveStorefrontDidChangeNotification", 0, 0, 0);
}

void sub_2405442A4()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.ap.adprivacyd.iTunesActiveAccountDidChangeNotification", 0, 0, 0);
}

void sub_24054444C()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.ap.adprivacyd.iTunesActiveStorefrontDidChangeNotification", 0, 0, 0);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t _ADLog()
{
  return MEMORY[0x270F0B360]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

    v26 = 0;
      if (a4 != 2) {
        goto LABEL_20;
      }
    }
    v28 = v22 & (v21 ^ 1);
    v27 = v25;
LABEL_20:
    if (v24)
    {
      [(ADAccountsNotificationPlugin *)self postNotificationForChangeWithAccount:v32 andOldAccount:v12 withType:@"iTunes account LOGGING IN"];
      v29 = [MEMORY[0x263F241C0] sharedInstance];
      v30 = [v29 purpleBuddyWillRun];

      if (v30)
      {
        v31 = [NSString stringWithFormat:@"[%@] Purple Buddy has not yet run. We will not notify the daemon.", objc_opt_class()];
        _ADLog();
      }
      else
      {
        dispatch_async((dispatch_queue_t)qword_26AFC6290, &unk_26F4A1B00);
      }
      goto LABEL_26;
    }
    if ((v26 | v28) == 1)
    {
      v17 = @"iTunes account LOGGING OUT";
      goto LABEL_25;
    }
    if (v27) {
      [(ADAccountsNotificationPlugin *)self checkForStorefrontChangeWithAccount:v32 andOldAccount:v12];
    }
    goto LABEL_26;
  }
  v18 = [v32 accountType];
  v14 = [v18 identifier];

  if (([v14 isEqualToString:*MEMORY[0x263EFAE58]] & 1) == 0) {
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    v19 = [v32 accountPropertyForKey:@"primaryAccount"];
    v20 = [v19 BOOLValue];

    if (v20)
    {
      v17 = @"iCloud account LOGGING IN";
LABEL_25:
      [(ADAccountsNotificationPlugin *)self postNotificationForChangeWithAccount:v32 andOldAccount:v12 withType:v17];
    }
  }
LABEL_26:
}

- (void)postNotificationForChangeWithAccount:(id)a3 andOldAccount:(id)a4 withType:(id)a5
{
  v5 = [NSString stringWithFormat:@"The active account was changed due to an %@.", a4, a5];
  _ADLog();

  v6 = [MEMORY[0x263F241C0] sharedInstance];
  int v7 = [v6 purpleBuddyWillRun];

  if (v7)
  {
    id v9 = [NSString stringWithFormat:@"[%@] Purple Buddy has not yet run. We will not notify the daemon.", objc_opt_class()];
    _ADLog();
  }
  else
  {
    v8 = qword_26AFC6290;
    dispatch_async(v8, &unk_26F4A1B20);
  }
}

- (void)checkForStorefrontChangeWithAccount:(id)a3 andOldAccount:(id)a4
{
  id v5 = a4;
  v6 = objc_msgSend(a3, "ams_storefront");
  int v7 = objc_msgSend(v5, "ams_storefront");

  LOBYTE(v5) = [v6 isEqualToString:v7];
  if ((v5 & 1) == 0)
  {
    v8 = [NSString stringWithFormat:@"The active account storefront was changed."];
    _ADLog();

    id v9 = [MEMORY[0x263F241C0] sharedInstance];
    int v10 = [v9 purpleBuddyWillRun];

    if (v10)
    {
      id v12 = [NSString stringWithFormat:@"[%@] Purple Buddy has not yet run. We will not notify the daemon.", objc_opt_class()];
      _ADLog();
    }
    else
    {
      v11 = qword_26AFC6290;
      dispatch_async(v11, &unk_26F4A1B40);
    }
  }
}

@end