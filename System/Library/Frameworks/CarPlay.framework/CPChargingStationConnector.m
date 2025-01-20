@interface CPChargingStationConnector
+ (BOOL)supportsSecureCoding;
+ (NSArray)accNavParameters;
+ (NSDictionary)accNavParameterKeysIndexed;
+ (NSDictionary)accNavParametersIndexed;
- (CPChargingStationConnector)initWithCoder:(id)a3;
- (CPChargingStationConnector)initWithType:(unint64_t)a3 voltage:(id)a4 power:(id)a5;
- (NSMeasurement)power;
- (NSMeasurement)voltage;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (void)clearValueForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPChargingStationConnector

- (CPChargingStationConnector)initWithType:(unint64_t)a3 voltage:(id)a4 power:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CPChargingStationConnector;
  v11 = [(CPChargingStationConnector *)&v13 init];
  if (v11)
  {
    +[CPAccNavUpdate resetUpdate:v11];
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_voltage, a4);
    objc_storeStrong((id *)&v11->_power, a5);
  }

  return v11;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F08988]);
  [v3 setUnitStyle:1];
  [v3 setUnitOptions:1];
  v4 = NSString;
  unint64_t v5 = [(CPChargingStationConnector *)self type] - 1;
  if (v5 > 7) {
    v6 = @"CCS1";
  }
  else {
    v6 = off_264309C30[v5];
  }
  v7 = [(CPChargingStationConnector *)self voltage];
  v8 = [v3 stringFromMeasurement:v7];
  id v9 = [(CPChargingStationConnector *)self power];
  id v10 = [v3 stringFromMeasurement:v9];
  v11 = [v4 stringWithFormat:@"(%@ %@ %@)", v6, v8, v10];

  return (NSString *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CPChargingStationConnector alloc];
  unint64_t v5 = [(CPChargingStationConnector *)self type];
  v6 = [(CPChargingStationConnector *)self voltage];
  v7 = [(CPChargingStationConnector *)self power];
  v8 = [(CPChargingStationConnector *)v4 initWithType:v5 voltage:v6 power:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPChargingStationConnector *)self type];
  v6 = NSStringFromSelector(sel_type);
  [v4 encodeInteger:v5 forKey:v6];

  v7 = [(CPChargingStationConnector *)self voltage];
  v8 = NSStringFromSelector(sel_voltage);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(CPChargingStationConnector *)self power];
  id v9 = NSStringFromSelector(sel_power);
  [v4 encodeObject:v10 forKey:v9];
}

- (CPChargingStationConnector)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_type);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  uint64_t v7 = objc_opt_class();
  v8 = NSStringFromSelector(sel_voltage);
  id v9 = [v4 decodeObjectOfClass:v7 forKey:v8];

  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_power);
  v12 = [v4 decodeObjectOfClass:v10 forKey:v11];

  objc_super v13 = [(CPChargingStationConnector *)self initWithType:v6 voltage:v9 power:v12];
  return v13;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSMeasurement)voltage
{
  return self->_voltage;
}

- (NSMeasurement)power
{
  return self->_power;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_power, 0);

  objc_storeStrong((id *)&self->_voltage, 0);
}

+ (NSArray)accNavParameters
{
  if (accNavParameters_onceToken != -1) {
    dispatch_once(&accNavParameters_onceToken, &__block_literal_global);
  }
  v2 = (void *)accNavParameters__accNavParameters;

  return (NSArray *)v2;
}

void __62__CPChargingStationConnector_CPAccNavUpdate__accNavParameters__block_invoke()
{
  v22[3] = *MEMORY[0x263EF8340];
  v16 = NSStringFromSelector(sel_type);
  v18 = +[CPAccNavParamKey paramKey:0];
  v17 = (void *)[v18 copySettingEnumType:9];
  v21 = v17;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  v14 = +[CPAccNavParam paramWithProperty:v16 keys:v15];
  v22[0] = v14;
  v12 = NSStringFromSelector(sel_voltage);
  objc_super v13 = +[CPAccNavParamKey paramKey:1];
  v11 = [MEMORY[0x263F08CB0] volts];
  v0 = (void *)[v13 copySettingDimension:v11];
  v20 = v0;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  v2 = +[CPAccNavParam paramWithProperty:v12 keys:v1];
  v22[1] = v2;
  id v3 = NSStringFromSelector(sel_power);
  id v4 = +[CPAccNavParamKey paramKey:2];
  unint64_t v5 = [MEMORY[0x263F08D08] watts];
  uint64_t v6 = (void *)[v4 copySettingDimension:v5];
  v19 = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  v8 = +[CPAccNavParam paramWithProperty:v3 keys:v7];
  v22[2] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  uint64_t v10 = (void *)accNavParameters__accNavParameters;
  accNavParameters__accNavParameters = v9;
}

+ (NSDictionary)accNavParametersIndexed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CPChargingStationConnector_CPAccNavUpdate__accNavParametersIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParametersIndexed_onceToken != -1) {
    dispatch_once(&accNavParametersIndexed_onceToken, block);
  }
  v2 = (void *)accNavParametersIndexed__accNavParametersIndexed;

  return (NSDictionary *)v2;
}

uint64_t __69__CPChargingStationConnector_CPAccNavUpdate__accNavParametersIndexed__block_invoke(uint64_t a1)
{
  accNavParametersIndexed__accNavParametersIndexed = +[CPAccNavUpdate accNavParametersIndexedForUpdate:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

+ (NSDictionary)accNavParameterKeysIndexed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__CPChargingStationConnector_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParameterKeysIndexed_onceToken != -1) {
    dispatch_once(&accNavParameterKeysIndexed_onceToken, block);
  }
  v2 = (void *)accNavParameterKeysIndexed__accNavParameterKeysIndexed;

  return (NSDictionary *)v2;
}

uint64_t __72__CPChargingStationConnector_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke(uint64_t a1)
{
  accNavParameterKeysIndexed__accNavParameterKeysIndexed = +[CPAccNavUpdate accNavParameterKeysIndexedForUpdate:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

- (void)clearValueForKey:(id)a3
{
}

@end