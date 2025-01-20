@interface MURealTimeEVChargerUtility
+ (id)evPlugIconWithConfiguration:(id)a3;
+ (id)getRealTimeChargerInfoWithGarage:(id)a3 charger:(id)a4;
- (MURealTimeEVChargerUtility)init;
@end

@implementation MURealTimeEVChargerUtility

+ (id)evPlugIconWithConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = _s6MapsUI24RealTimeEVChargerUtilityC10evPlugIcon13configurationSo7UIImageCSgSo0K13ConfigurationC_tFZ_0(v3);

  return v4;
}

+ (id)getRealTimeChargerInfoWithGarage:(id)a3 charger:(id)a4
{
  id v6 = a3;
  v7 = (char **)a4;
  v8 = (void *)_s6MapsUI24RealTimeEVChargerUtilityC03getcD11ChargerInfo6garage7chargerSo06MURealdE0CSo15VGVirtualGarageCSg_So24GEOEVChargerAvailabilityCtFZ_0(a3, v7);

  return v8;
}

- (MURealTimeEVChargerUtility)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MURealTimeEVChargerUtility *)&v3 init];
}

@end