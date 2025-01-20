@interface CLKUILoggingObjectForDomain
@end

@implementation CLKUILoggingObjectForDomain

void ___CLKUILoggingObjectForDomain_block_invoke(uint64_t a1)
{
  v2 = [NSString stringWithCString:*(void *)(a1 + 40) encoding:4];
  v3 = [v2 substringFromIndex:objc_msgSend(@"CLKUILoggingDomain", "length")];

  id v7 = v3;
  os_log_t v4 = os_log_create("com.apple.ClockKitUI", (const char *)[v7 cStringUsingEncoding:4]);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = (void *)_CLKUILoggingObjectForDomain___logObjects[v5];
  _CLKUILoggingObjectForDomain___logObjects[v5] = v4;
}

@end