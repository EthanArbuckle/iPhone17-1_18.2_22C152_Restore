@interface HDKeyValueDomain(HKMCDeviceLocalProtected)
+ (id)hdmc_deviationDetectionAnalyticsProtectedDomainWithProfile:()HKMCDeviceLocalProtected;
@end

@implementation HDKeyValueDomain(HKMCDeviceLocalProtected)

+ (id)hdmc_deviationDetectionAnalyticsProtectedDomainWithProfile:()HKMCDeviceLocalProtected
{
  v3 = (objc_class *)MEMORY[0x263F43218];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithCategory:100 domainName:*MEMORY[0x263F44F40] profile:v4];

  return v6;
}

@end