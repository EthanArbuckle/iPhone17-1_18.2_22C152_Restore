@interface CPElectricVehicleWaypoint
+ (BOOL)supportsSecureCoding;
- (CPElectricVehicleWaypoint)initWithCoder:(id)a3;
- (NSArray)connectors;
- (NSMeasurement)arrivalBatteryLevel;
- (NSMeasurement)departureBatteryLevel;
- (NSMeasurement)finalWaypointBatteryLevel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)power;
- (id)voltage;
- (void)encodeWithCoder:(id)a3;
- (void)setArrivalBatteryLevel:(id)a3;
- (void)setConnectors:(id)a3;
- (void)setDepartureBatteryLevel:(id)a3;
- (void)setFinalWaypointBatteryLevel:(id)a3;
@end

@implementation CPElectricVehicleWaypoint

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F08988]);
  [v3 setUnitStyle:1];
  [v3 setUnitOptions:1];
  v15 = NSString;
  uint64_t v14 = objc_opt_class();
  v4 = [(CPElectricVehicleWaypoint *)self connectors];
  v5 = [v4 componentsJoinedByString:@", "];
  v6 = [(CPElectricVehicleWaypoint *)self arrivalBatteryLevel];
  v7 = [v3 stringFromMeasurement:v6];
  v8 = [(CPElectricVehicleWaypoint *)self departureBatteryLevel];
  v9 = [v3 stringFromMeasurement:v8];
  v10 = [(CPElectricVehicleWaypoint *)self finalWaypointBatteryLevel];
  v11 = [v3 stringFromMeasurement:v10];
  v12 = [v15 stringWithFormat:@"<%@: %p connectors=[%@] batteryLevel(arrival=%@ departure=%@ finalWaypoint=%@)>>", v14, self, v5, v7, v9, v11];

  return v12;
}

- (id)voltage
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(CPElectricVehicleWaypoint *)self connectors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 voltage];
        v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "type"));
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)power
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(CPElectricVehicleWaypoint *)self connectors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 power];
        v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "type"));
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  uint64_t v5 = [(CPElectricVehicleWaypoint *)self connectors];
  [v4 setConnectors:v5];

  uint64_t v6 = [(CPElectricVehicleWaypoint *)self arrivalBatteryLevel];
  [v4 setArrivalBatteryLevel:v6];

  uint64_t v7 = [(CPElectricVehicleWaypoint *)self departureBatteryLevel];
  [v4 setDepartureBatteryLevel:v7];

  v8 = [(CPElectricVehicleWaypoint *)self finalWaypointBatteryLevel];
  [v4 setFinalWaypointBatteryLevel:v8];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPElectricVehicleWaypoint *)self connectors];
  uint64_t v6 = NSStringFromSelector(sel_connectors);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(CPElectricVehicleWaypoint *)self arrivalBatteryLevel];
  v8 = NSStringFromSelector(sel_arrivalBatteryLevel);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(CPElectricVehicleWaypoint *)self departureBatteryLevel];
  v10 = NSStringFromSelector(sel_departureBatteryLevel);
  [v4 encodeObject:v9 forKey:v10];

  id v12 = [(CPElectricVehicleWaypoint *)self finalWaypointBatteryLevel];
  v11 = NSStringFromSelector(sel_finalWaypointBatteryLevel);
  [v4 encodeObject:v12 forKey:v11];
}

- (CPElectricVehicleWaypoint)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (CPElectricVehicleWaypoint *)objc_opt_new();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(sel_connectors);
  v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
  [(CPElectricVehicleWaypoint *)v5 setConnectors:v8];

  uint64_t v9 = objc_opt_class();
  v10 = NSStringFromSelector(sel_arrivalBatteryLevel);
  v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
  [(CPElectricVehicleWaypoint *)v5 setArrivalBatteryLevel:v11];

  uint64_t v12 = objc_opt_class();
  long long v13 = NSStringFromSelector(sel_departureBatteryLevel);
  long long v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
  [(CPElectricVehicleWaypoint *)v5 setDepartureBatteryLevel:v14];

  uint64_t v15 = objc_opt_class();
  long long v16 = NSStringFromSelector(sel_finalWaypointBatteryLevel);
  v17 = [v4 decodeObjectOfClass:v15 forKey:v16];

  [(CPElectricVehicleWaypoint *)v5 setFinalWaypointBatteryLevel:v17];
  return v5;
}

- (NSArray)connectors
{
  return self->_connectors;
}

- (void)setConnectors:(id)a3
{
}

- (NSMeasurement)arrivalBatteryLevel
{
  return self->_arrivalBatteryLevel;
}

- (void)setArrivalBatteryLevel:(id)a3
{
}

- (NSMeasurement)departureBatteryLevel
{
  return self->_departureBatteryLevel;
}

- (void)setDepartureBatteryLevel:(id)a3
{
}

- (NSMeasurement)finalWaypointBatteryLevel
{
  return self->_finalWaypointBatteryLevel;
}

- (void)setFinalWaypointBatteryLevel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalWaypointBatteryLevel, 0);
  objc_storeStrong((id *)&self->_departureBatteryLevel, 0);
  objc_storeStrong((id *)&self->_arrivalBatteryLevel, 0);

  objc_storeStrong((id *)&self->_connectors, 0);
}

@end