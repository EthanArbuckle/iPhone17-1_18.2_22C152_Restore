@interface FedStatsPluginDnUConsentChecker
- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4;
@end

@implementation FedStatsPluginDnUConsentChecker

- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4
{
  if (objc_msgSend(&unk_2700127E0, "containsObject:", a3, a4))
  {
    v4 = (void *)MEMORY[0x263EFFA88];
  }
  else
  {
    v5 = NSNumber;
    v6 = [MEMORY[0x263F53C50] sharedConnection];
    v4 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "isDiagnosticSubmissionAllowed"));
  }
  return v4;
}

@end