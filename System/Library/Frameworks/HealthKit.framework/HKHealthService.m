@interface HKHealthService
+ (BOOL)supportsSecureCoding;
+ (id)localizedHealthServiceType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CBPeripheral)peripheral;
- (HKHealthService)init;
- (HKHealthService)initWithCoder:(id)a3;
- (HKHealthService)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5;
- (NSData)advertisementData;
- (NSString)name;
- (NSString)serviceId;
- (NSUUID)identifier;
- (double)lastConnection;
- (id)_initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5 serviceId:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initUnknownServiceWithIdentifier:(id)a3 name:(id)a4 serviceId:(id)a5;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisementData:(id)a3;
- (void)setLastConnection:(double)a3;
- (void)setPeripheral:(id)a3;
- (void)setServiceId:(id)a3;
@end

@implementation HKHealthService

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  int64_t v6 = [(HKHealthService *)self type];
  v7 = [(HKHealthService *)self identifier];
  v8 = (void *)[v5 initWithType:v6 identifier:v7 name:0];

  if (v8)
  {
    [(HKHealthService *)self lastConnection];
    v8[4] = v9;
    v10 = [(HKHealthService *)self name];
    uint64_t v11 = [v10 copyWithZone:a3];
    v12 = (void *)v8[3];
    v8[3] = v11;

    v13 = [(HKHealthService *)self identifier];
    uint64_t v14 = [v13 copyWithZone:a3];
    v15 = (void *)v8[2];
    v8[2] = v14;

    v16 = [(HKHealthService *)self serviceId];
    uint64_t v17 = [v16 copyWithZone:a3];
    v18 = (void *)v8[5];
    v8[5] = v17;
  }
  return v8;
}

- (HKHealthService)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [(HKHealthService *)self initWithType:-1 identifier:v3 name:@"HealthService"];

  return v4;
}

- (HKHealthService)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)a3 >= 4)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = [NSNumber numberWithInteger:a3];
    [v10 raise:v11, @"Invalid HKHealthServiceType %@", v12 format];
  }
  v13 = [(HKHealthService *)self _initWithType:a3 identifier:v8 name:v9 serviceId:0];

  return v13;
}

- (id)initUnknownServiceWithIdentifier:(id)a3 name:(id)a4 serviceId:(id)a5
{
  return [(HKHealthService *)self _initWithType:-3 identifier:a3 name:a4 serviceId:a5];
}

- (id)_initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5 serviceId:(id)a6
{
  id v11 = a4;
  v12 = (__CFString *)a5;
  id v13 = a6;
  if (!v11) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid nil identifier."];
  }
  v20.receiver = self;
  v20.super_class = (Class)HKHealthService;
  uint64_t v14 = [(HKHealthService *)&v20 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_identifier, a4);
    if (v12) {
      v16 = v12;
    }
    else {
      v16 = &stru_1EEC60288;
    }
    objc_storeStrong((id *)&v15->_name, v16);
    v15->_lastConnection = 0.0;
    uint64_t v17 = [v13 copy];
    serviceId = v15->_serviceId;
    v15->_serviceId = (NSString *)v17;
  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKHealthService *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t type = self->_type;
      int64_t v7 = v5->_type;
      char v8 = [(NSUUID *)self->_identifier isEqual:v5->_identifier];
      if (type == v7) {
        char v9 = v8;
      }
      else {
        char v9 = 0;
      }
      serviceId = self->_serviceId;
      if (serviceId)
      {
        id v11 = v5->_serviceId;
        if (v11)
        {
          if (serviceId == v11) {
            char v12 = 1;
          }
          else {
            char v12 = -[NSString isEqualToString:](serviceId, "isEqualToString:");
          }
          v9 &= v12;
        }
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_type ^ [(NSUUID *)self->_identifier hash];
}

- (HKHealthService)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHealthService;
  id v5 = [(HKHealthService *)&v14 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"HealthServiceType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HealthDeviceName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HealthDeviceIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    [v4 decodeDoubleForKey:@"HealthDeviceLastConnection"];
    v5->_lastConnection = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HealthServiceId"];
    serviceId = v5->_serviceId;
    v5->_serviceId = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"HealthServiceType"];
  [v5 encodeObject:self->_name forKey:@"HealthDeviceName"];
  [v5 encodeObject:self->_identifier forKey:@"HealthDeviceIdentifier"];
  [v5 encodeDouble:@"HealthDeviceLastConnection" forKey:self->_lastConnection];
  [v5 encodeObject:self->_serviceId forKey:@"HealthServiceId"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSUUID *)self->_identifier UUIDString];
  int64_t v7 = +[HKHealthService localizedHealthServiceType:self->_type];
  uint64_t v8 = [v3 stringWithFormat:@"%@ %@: %@ (%@)", v5, v6, v7, self->_name];

  if (self->_serviceId)
  {
    uint64_t v9 = [v8 stringByAppendingFormat:@" \"%@\"", self->_serviceId];

    uint64_t v8 = (void *)v9;
  }

  return v8;
}

+ (id)localizedHealthServiceType:(int64_t)a3
{
  if (a3 <= 100)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        return @"Fitness Machine";
      }
      else if (a3 == 2)
      {
        return @"Eurotas";
      }
      else
      {
        return @"Unknown";
      }
    }
    else
    {
      return @"Heart Rate Monitor";
    }
  }
  else
  {
    switch(a3)
    {
      case 'e':
        id result = @"Blood Pressure Monitor";
        break;
      case 'f':
        id result = @"Cycling Speed and Cadence";
        break;
      case 'g':
        id result = @"Glucose Monitor";
        break;
      case 'h':
        id result = @"Health Thermometer";
        break;
      default:
        return @"Unknown";
    }
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (double)lastConnection
{
  return self->_lastConnection;
}

- (void)setLastConnection:(double)a3
{
  self->_lastConnection = a3;
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void)setAdvertisementData:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end