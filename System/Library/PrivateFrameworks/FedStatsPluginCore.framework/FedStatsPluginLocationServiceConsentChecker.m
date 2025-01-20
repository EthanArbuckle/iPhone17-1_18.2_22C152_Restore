@interface FedStatsPluginLocationServiceConsentChecker
- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4;
@end

@implementation FedStatsPluginLocationServiceConsentChecker

- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4
{
  if (objc_msgSend(&unk_2700127B0, "containsObject:", a3, a4))
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F00A60], "locationServicesEnabled"));
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFFA88];
  }
  return v4;
}

@end