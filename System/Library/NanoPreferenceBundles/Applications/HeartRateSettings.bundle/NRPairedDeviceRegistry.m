@interface NRPairedDeviceRegistry
+ (BOOL)hprf_activeDeviceIsSatelliteDevice;
+ (id)hprf_activeDevice;
+ (id)hprf_activePrimaryOrSatelliteDevice;
+ (id)hprf_activeSatelliteDevice;
@end

@implementation NRPairedDeviceRegistry

+ (id)hprf_activeDevice
{
  v2 = [(id)objc_opt_class() sharedInstance];
  v3 = [v2 getActivePairedDevice];

  return v3;
}

+ (id)hprf_activePrimaryOrSatelliteDevice
{
  v2 = objc_msgSend(a1, "hprf_activeSatelliteDevice");
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [(id)objc_opt_class() sharedInstance];
    id v4 = [v5 getActivePairedDevice];
  }

  return v4;
}

+ (id)hprf_activeSatelliteDevice
{
  v2 = [(id)objc_opt_class() sharedInstance];
  v3 = [(id)objc_opt_class() activeDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  v5 = [v4 firstObject];

  v6 = [v5 valueForProperty:NRDevicePropertyIsAltAccount];
  LODWORD(v3) = [v6 BOOLValue];

  if (v3) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (BOOL)hprf_activeDeviceIsSatelliteDevice
{
  v2 = objc_msgSend(a1, "hprf_activePrimaryOrSatelliteDevice");
  v3 = [v2 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

@end