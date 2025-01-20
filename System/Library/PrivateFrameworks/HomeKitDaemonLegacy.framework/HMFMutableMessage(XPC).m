@interface HMFMutableMessage(XPC)
- (uint64_t)setRequiresCameraClipsEntitlement;
- (uint64_t)setRequiresMatterSetupPayloadEntitlement;
- (uint64_t)setRequiresMultiUserSetupEntitlement;
- (uint64_t)setRequiresNoSPIEntitlement;
- (uint64_t)setRequiresPersonManagerEntitlement;
- (uint64_t)setRequiresSPIEntitlement;
- (uint64_t)setRequiresSetupPayloadEntitlement;
- (uint64_t)setRequiresWalletKeyEntitlement;
- (uint64_t)setSendPolicy:()XPC;
- (void)setRequiresNoSPIEntitlement:()XPC;
- (void)setRequiresSPIEntitlement:()XPC;
@end

@implementation HMFMutableMessage(XPC)

- (uint64_t)setSendPolicy:()XPC
{
  return [a1 setUserInfoValue:a3 forKey:@"sendPolicy"];
}

- (void)setRequiresSPIEntitlement:()XPC
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoValue:v2 forKey:@"requiresSPIEntitlement"];
}

- (uint64_t)setRequiresWalletKeyEntitlement
{
  return [a1 setUserInfoValue:MEMORY[0x1E4F1CC38] forKey:@"requiresWalletKeyEntitlement"];
}

- (uint64_t)setRequiresPersonManagerEntitlement
{
  return [a1 setUserInfoValue:MEMORY[0x1E4F1CC38] forKey:@"requiresPersonManagerEntitlement"];
}

- (uint64_t)setRequiresMultiUserSetupEntitlement
{
  return [a1 setUserInfoValue:MEMORY[0x1E4F1CC38] forKey:@"requiresMultiUserSetupEntitlement"];
}

- (uint64_t)setRequiresCameraClipsEntitlement
{
  return [a1 setUserInfoValue:MEMORY[0x1E4F1CC38] forKey:@"requiresCameraClipsEntitlement"];
}

- (uint64_t)setRequiresMatterSetupPayloadEntitlement
{
  return [a1 setUserInfoValue:MEMORY[0x1E4F1CC38] forKey:@"requiresMatterSetupPayloadEntitlement"];
}

- (uint64_t)setRequiresSetupPayloadEntitlement
{
  return [a1 setUserInfoValue:MEMORY[0x1E4F1CC38] forKey:@"requiresSetupPayloadEntitlement"];
}

- (void)setRequiresNoSPIEntitlement:()XPC
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoValue:v2 forKey:@"requiresNoSPIEntitlement"];
}

- (uint64_t)setRequiresNoSPIEntitlement
{
  return [a1 setRequiresNoSPIEntitlement:1];
}

- (uint64_t)setRequiresSPIEntitlement
{
  return [a1 setRequiresSPIEntitlement:1];
}

@end