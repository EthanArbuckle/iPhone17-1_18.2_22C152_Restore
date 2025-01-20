@interface HMFMutableMessage(HMXPC)
- (void)hm_setXPCTimeoutDisabled:()HMXPC;
@end

@implementation HMFMutableMessage(HMXPC)

- (void)hm_setXPCTimeoutDisabled:()HMXPC
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setHeaderValue:v2 forKey:@"HMXPCMessageHeaderKeyIsXPCTimeoutDisabled"];
}

@end