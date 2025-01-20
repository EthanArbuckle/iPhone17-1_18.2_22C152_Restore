@interface FedStatsPluginIHAConsentChecker
- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4;
@end

@implementation FedStatsPluginIHAConsentChecker

- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4
{
  if (objc_msgSend(&unk_270012810, "containsObject:", a3, a4))
  {
    v4 = NSNumber;
    v5 = [MEMORY[0x263F53C50] sharedConnection];
    v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isHealthDataSubmissionAllowed"));
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA88];
  }
  return v6;
}

@end