@interface HDKeyValueDomain(HKMCSyncedButNotToWatchProtected)
+ (id)hdmc_appProtectedSyncedMenstrualCyclesDefaultsDomainWithProfile:()HKMCSyncedButNotToWatchProtected;
@end

@implementation HDKeyValueDomain(HKMCSyncedButNotToWatchProtected)

+ (id)hdmc_appProtectedSyncedMenstrualCyclesDefaultsDomainWithProfile:()HKMCSyncedButNotToWatchProtected
{
  v3 = (objc_class *)MEMORY[0x263F43218];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithCategory:102 domainName:*MEMORY[0x263F44FE8] profile:v4];

  return v6;
}

@end