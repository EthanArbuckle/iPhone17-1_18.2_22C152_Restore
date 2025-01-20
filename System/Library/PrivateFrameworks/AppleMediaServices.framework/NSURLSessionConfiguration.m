@interface NSURLSessionConfiguration
@end

@implementation NSURLSessionConfiguration

AMSPromise *__85__NSURLSessionConfiguration_AppleMediaServices__ams_configurationWithClientInfo_bag___block_invoke(uint64_t a1)
{
  return +[AMSPromise promiseWithResult:*(void *)(a1 + 32)];
}

uint64_t __81__NSURLSessionConfiguration_AppleMediaServices__ams_configureWithClientInfo_bag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "set_allowsTCPFastOpen:", a2);
  v3 = *(void **)(a1 + 40);
  return [v3 finishWithSuccess];
}

uint64_t __81__NSURLSessionConfiguration_AppleMediaServices__ams_configureWithClientInfo_bag___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "set_allowsTLSSessionTickets:", a2);
  v3 = *(void **)(a1 + 40);
  return [v3 finishWithSuccess];
}

void __61__NSURLSessionConfiguration_AppleMediaServices___URLBagCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F18D78] sharedURLCache];
  v3 = (void *)_MergedGlobals_163;
  _MergedGlobals_163 = v2;

  if (os_variant_has_internal_content())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v5 = *(const void **)(a1 + 32);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_handleClearCachesNotification_0, @"com.apple.AMS.ClearNSURLCache", 0, CFNotificationSuspensionBehaviorDrop);
  }
}

@end