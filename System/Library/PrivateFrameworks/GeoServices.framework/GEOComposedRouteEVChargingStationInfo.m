@interface GEOComposedRouteEVChargingStationInfo
+ (BOOL)supportsSecureCoding;
- (GEOComposedRouteEVChargingStationInfo)init;
- (GEOComposedRouteEVChargingStationInfo)initWithCoder:(id)a3;
- (GEOComposedRouteEVChargingStationInfo)initWithGeoEVChargingInfo:(id)a3 muid:(unint64_t)a4 name:(id)a5;
- (NSArray)suggestedChargerPlugs;
- (NSArray)supportedChargerPlugs;
- (NSString)name;
- (double)batteryChargeAfterCharging;
- (double)batteryPercentageAfterCharging;
- (double)chargingTime;
- (id)description;
- (unint64_t)muid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteEVChargingStationInfo

- (GEOComposedRouteEVChargingStationInfo)init
{
  result = (GEOComposedRouteEVChargingStationInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOComposedRouteEVChargingStationInfo)initWithGeoEVChargingInfo:(id)a3 muid:(unint64_t)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)GEOComposedRouteEVChargingStationInfo;
  v10 = [(GEOComposedRouteEVChargingStationInfo *)&v23 init];
  v11 = v10;
  if (v10)
  {
    v10->_muid = a4;
    uint64_t v12 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v11->_chargingTime = (double)[v8 chargingTime];
    v11->_batteryChargeAfterCharging = (double)[v8 batteryChargeAfterCharging];
    v11->_batteryPercentageAfterCharging = (double)[v8 batteryPercentageAfterCharging];
    v14 = [v8 chargerPlugsInfo];
    v15 = [v14 suggestedChargerPlugs];
    uint64_t v16 = objc_msgSend(v15, "_geo_map:", &__block_literal_global_68);
    suggestedChargerPlugs = v11->_suggestedChargerPlugs;
    v11->_suggestedChargerPlugs = (NSArray *)v16;

    v18 = [v8 chargerPlugsInfo];
    v19 = [v18 supportedChargerPlugs];
    uint64_t v20 = objc_msgSend(v19, "_geo_map:", &__block_literal_global_68);
    supportedChargerPlugs = v11->_supportedChargerPlugs;
    v11->_supportedChargerPlugs = (NSArray *)v20;
  }
  return v11;
}

GEOComposedRouteEVChargerPlugInfo *__77__GEOComposedRouteEVChargingStationInfo_initWithGeoEVChargingInfo_muid_name___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOComposedRouteEVChargerPlugInfo alloc] initWithGeoChargerPlug:v2];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"muid: %llu, chargingTime: %gs, batteryChargeAfterCharging: %g, batteryPercentageAfterCharging: %g%%", self->_muid, *(void *)&self->_chargingTime, *(void *)&self->_batteryChargeAfterCharging, *(void *)&self->_batteryPercentageAfterCharging];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteEVChargingStationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOComposedRouteEVChargingStationInfo;
  v5 = [(GEOComposedRouteEVChargingStationInfo *)&v17 init];
  if (v5)
  {
    v5->_muid = [v4 decodeInt64ForKey:@"_muid"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    [v4 decodeDoubleForKey:@"_chargingTime"];
    v5->_chargingTime = v8;
    [v4 decodeDoubleForKey:@"_batteryChargeAfterCharging"];
    v5->_batteryChargeAfterCharging = v9;
    [v4 decodeDoubleForKey:@"_batteryPercentageAfterCharging"];
    v5->_batteryPercentageAfterCharging = v10;
    uint64_t v11 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_suggestedChargerPlugs"];
    suggestedChargerPlugs = v5->_suggestedChargerPlugs;
    v5->_suggestedChargerPlugs = (NSArray *)v11;

    uint64_t v13 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_supportedChargerPlugs"];
    supportedChargerPlugs = v5->_supportedChargerPlugs;
    v5->_supportedChargerPlugs = (NSArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t muid = self->_muid;
  id v5 = a3;
  [v5 encodeInt64:muid forKey:@"_muid"];
  [v5 encodeObject:self->_name forKey:@"_name"];
  [v5 encodeDouble:@"_chargingTime" forKey:self->_chargingTime];
  [v5 encodeDouble:@"_batteryChargeAfterCharging" forKey:self->_batteryChargeAfterCharging];
  [v5 encodeDouble:@"_batteryPercentageAfterCharging" forKey:self->_batteryPercentageAfterCharging];
  [v5 encodeObject:self->_suggestedChargerPlugs forKey:@"_suggestedChargerPlugs"];
  [v5 encodeObject:self->_supportedChargerPlugs forKey:@"_supportedChargerPlugs"];
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)name
{
  return self->_name;
}

- (double)chargingTime
{
  return self->_chargingTime;
}

- (double)batteryChargeAfterCharging
{
  return self->_batteryChargeAfterCharging;
}

- (double)batteryPercentageAfterCharging
{
  return self->_batteryPercentageAfterCharging;
}

- (NSArray)suggestedChargerPlugs
{
  return self->_suggestedChargerPlugs;
}

- (NSArray)supportedChargerPlugs
{
  return self->_supportedChargerPlugs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedChargerPlugs, 0);
  objc_storeStrong((id *)&self->_suggestedChargerPlugs, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end