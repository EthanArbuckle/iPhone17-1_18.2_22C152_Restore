@interface LSAppLink(Internal)
@end

@implementation LSAppLink(Internal)

+ (void)_openWithAppLink:()Internal state:completionHandler:.cold.1(int a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Process %lu (%@) is using an outdated entitlement to ignore LSAppLink.enabled. Please update.", buf, 0x16u);
}

@end