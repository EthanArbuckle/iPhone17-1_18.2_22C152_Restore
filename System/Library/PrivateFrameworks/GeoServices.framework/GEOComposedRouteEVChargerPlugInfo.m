@interface GEOComposedRouteEVChargerPlugInfo
+ (BOOL)supportsSecureCoding;
- (GEOComposedRouteEVChargerPlugInfo)initWithCoder:(id)a3;
- (GEOComposedRouteEVChargerPlugInfo)initWithGeoChargerPlug:(id)a3;
- (NSMeasurement)maximumPower;
- (NSMeasurement)maximumVoltage;
- (int)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteEVChargerPlugInfo

- (GEOComposedRouteEVChargerPlugInfo)initWithGeoChargerPlug:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOComposedRouteEVChargerPlugInfo;
  v5 = [(GEOComposedRouteEVChargerPlugInfo *)&v18 init];
  if (v5)
  {
    v5->_type = [v4 type];
    id v6 = objc_alloc(MEMORY[0x1E4F28E28]);
    double v7 = (double)[v4 maximumPower];
    v8 = [MEMORY[0x1E4F291F0] watts];
    uint64_t v9 = [v6 initWithDoubleValue:v8 unit:v7];
    maximumPower = v5->_maximumPower;
    v5->_maximumPower = (NSMeasurement *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F28E28]);
    double v12 = (double)[v4 maximumVoltage];
    v13 = [MEMORY[0x1E4F291A0] volts];
    uint64_t v14 = [v11 initWithDoubleValue:v13 unit:v12];
    maximumVoltage = v5->_maximumVoltage;
    v5->_maximumVoltage = (NSMeasurement *)v14;

    v16 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteEVChargerPlugInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRouteEVChargerPlugInfo;
  v5 = [(GEOComposedRouteEVChargerPlugInfo *)&v12 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maximumPower"];
    maximumPower = v5->_maximumPower;
    v5->_maximumPower = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maximumVoltage"];
    maximumVoltage = v5->_maximumVoltage;
    v5->_maximumVoltage = (NSMeasurement *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"_type"];
  [v5 encodeObject:self->_maximumPower forKey:@"_maximumPower"];
  [v5 encodeObject:self->_maximumVoltage forKey:@"_maximumVoltage"];
}

- (int)type
{
  return self->_type;
}

- (NSMeasurement)maximumPower
{
  return self->_maximumPower;
}

- (NSMeasurement)maximumVoltage
{
  return self->_maximumVoltage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumVoltage, 0);

  objc_storeStrong((id *)&self->_maximumPower, 0);
}

@end