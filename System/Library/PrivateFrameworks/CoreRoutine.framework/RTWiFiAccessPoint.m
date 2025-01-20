@interface RTWiFiAccessPoint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)mac;
- (RTWiFiAccessPoint)init;
- (RTWiFiAccessPoint)initWithCoder:(id)a3;
- (RTWiFiAccessPoint)initWithMac:(id)a3 rssi:(int64_t)a4 channel:(int64_t)a5 age:(double)a6 date:(id)a7;
- (double)age;
- (id)description;
- (int64_t)channel;
- (int64_t)rssi;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTWiFiAccessPoint

- (RTWiFiAccessPoint)initWithMac:(id)a3 rssi:(int64_t)a4 channel:(int64_t)a5 age:(double)a6 date:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v14 = v13;
  if (!v12)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v18 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: mac";
LABEL_12:
    _os_log_error_impl(&dword_1A8FEF000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_9;
  }
  if (!v13)
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: date";
    goto LABEL_12;
  }
  v22.receiver = self;
  v22.super_class = (Class)RTWiFiAccessPoint;
  v15 = [(RTWiFiAccessPoint *)&v22 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    mac = v15->_mac;
    v15->_mac = (NSString *)v16;

    v15->_rssi = a4;
    v15->_channel = a5;
    v15->_age = a6;
    objc_storeStrong((id *)&v15->_date, a7);
  }
  self = v15;
  v18 = self;
LABEL_10:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTWiFiAccessPoint)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMac_rssi_channel_age_date_);
}

- (RTWiFiAccessPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mac"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"rssi"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"channel"];
  [v4 decodeDoubleForKey:@"age"];
  double v9 = v8;
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];

  v11 = [(RTWiFiAccessPoint *)self initWithMac:v5 rssi:v6 channel:v7 age:v10 date:v9];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  mac = self->_mac;
  id v5 = a3;
  [v5 encodeObject:mac forKey:@"mac"];
  [v5 encodeInteger:self->_rssi forKey:@"rssi"];
  [v5 encodeInteger:self->_channel forKey:@"channel"];
  [v5 encodeDouble:@"age" forKey:self->_age];
  [v5 encodeObject:self->_date forKey:@"date"];
}

- (id)description
{
  uint64_t v2 = NSString;
  long long v8 = *(_OWORD *)&self->_mac;
  int64_t channel = self->_channel;
  double age = self->_age;
  id v5 = [(NSDate *)self->_date stringFromDate];
  uint64_t v6 = [v2 stringWithFormat:@"mac, %@, rssi, %ld, channel, %ld, age, %.2f, date, %@", v8, channel, *(void *)&age, v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_mac hash];
  id v4 = [NSNumber numberWithInteger:self->_rssi];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [NSNumber numberWithInteger:self->_channel];
  uint64_t v7 = [v6 hash];
  long long v8 = [NSNumber numberWithDouble:self->_age];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  unint64_t v10 = v9 ^ [(NSDate *)self->_date hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RTWiFiAccessPoint *)a3;
  if (self == v5)
  {
    char v11 = 1;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v11 = 0;
    goto LABEL_25;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(RTWiFiAccessPoint *)self mac];
  if (!v7)
  {
    NSUInteger v3 = [(RTWiFiAccessPoint *)v6 mac];
    if (!v3)
    {
      char v10 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  long long v8 = [(RTWiFiAccessPoint *)self mac];
  uint64_t v9 = [(RTWiFiAccessPoint *)v6 mac];
  char v10 = [v8 isEqualToString:v9];

  if (!v7) {
    goto LABEL_10;
  }
LABEL_11:

  int64_t v12 = [(RTWiFiAccessPoint *)self rssi];
  uint64_t v13 = [(RTWiFiAccessPoint *)v6 rssi];
  int64_t v14 = [(RTWiFiAccessPoint *)self channel];
  uint64_t v15 = [(RTWiFiAccessPoint *)v6 channel];
  [(RTWiFiAccessPoint *)self age];
  double v17 = v16;
  [(RTWiFiAccessPoint *)v6 age];
  double v19 = v18;
  v20 = [(RTWiFiAccessPoint *)self date];
  v32 = v6;
  if (!v20)
  {
    uint64_t v30 = [(RTWiFiAccessPoint *)v6 date];
    if (!v30)
    {
      v31 = 0;
      char v27 = 1;
LABEL_16:

      goto LABEL_17;
    }
  }
  [(RTWiFiAccessPoint *)self date];
  objc_super v22 = v21 = v10;
  [(RTWiFiAccessPoint *)v6 date];
  uint64_t v23 = v15;
  int64_t v24 = v14;
  v26 = int64_t v25 = v12;
  char v27 = [v22 isEqualToDate:v26];

  int64_t v12 = v25;
  int64_t v14 = v24;
  uint64_t v15 = v23;

  char v10 = v21;
  if (!v20) {
    goto LABEL_16;
  }
LABEL_17:

  if (v12 == v13) {
    char v28 = v10;
  }
  else {
    char v28 = 0;
  }
  if (v14 != v15) {
    char v28 = 0;
  }
  if (v17 != v19) {
    char v28 = 0;
  }
  char v11 = v28 & v27;

LABEL_25:
  return v11;
}

- (NSString)mac
{
  return self->_mac;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (int64_t)channel
{
  return self->_channel;
}

- (double)age
{
  return self->_age;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mac, 0);
}

@end