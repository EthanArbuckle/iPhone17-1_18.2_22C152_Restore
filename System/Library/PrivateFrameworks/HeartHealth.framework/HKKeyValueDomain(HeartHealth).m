@interface HKKeyValueDomain(HeartHealth)
+ (id)hkhr_aFibBurdenDefaultsDomainWithHealthStore:()HeartHealth;
+ (id)hkhr_aFibBurdenSyncedDefaultsDomainWithHealthStore:()HeartHealth;
@end

@implementation HKKeyValueDomain(HeartHealth)

+ (id)hkhr_aFibBurdenSyncedDefaultsDomainWithHealthStore:()HeartHealth
{
  v3 = (objc_class *)MEMORY[0x1E4F2B138];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithCategory:0 domainName:@"com.apple.private.health.afib-burden" healthStore:v4];

  return v5;
}

+ (id)hkhr_aFibBurdenDefaultsDomainWithHealthStore:()HeartHealth
{
  v3 = (objc_class *)MEMORY[0x1E4F2B138];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithCategory:1 domainName:@"com.apple.private.health.afib-burden" healthStore:v4];

  return v5;
}

@end