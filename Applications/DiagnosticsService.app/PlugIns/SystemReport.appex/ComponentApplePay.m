@interface ComponentApplePay
- (BOOL)isPresent;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentApplePay

- (BOOL)isPresent
{
  io_service_t MatchingService = +[DASoftLinking isNearFieldFrameworkAvailable];
  if (MatchingService)
  {
    CFDictionaryRef v3 = IOServiceMatching("AppleStockholmControl");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
    if (MatchingService)
    {
      IOObjectRelease(MatchingService);
      LOBYTE(MatchingService) = 1;
    }
  }
  return MatchingService;
}

- (void)populateAttributes:(id)a3
{
  id v6 = a3;
  CFDictionaryRef v3 = [(objc_class *)+[DASoftLinking nearFieldClass:@"NFSecureElement"] embeddedSecureElement];
  v4 = [v3 serialNumber];

  if (v4)
  {
    v5 = [v3 serialNumber];
    [v6 setObject:v5 forKeyedSubscript:@"serialNumber"];
  }
}

@end