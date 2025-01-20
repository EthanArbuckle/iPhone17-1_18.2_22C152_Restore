@interface HMDHomeLocationData
+ (BOOL)supportsSecureCoding;
- (CLLocation)location;
- (HMDHomeLocationData)initWithCoder:(id)a3;
- (HMDHomeLocationData)initWithLocation:(id)a3 locationUpdateTimestamp:(id)a4 locationSource:(id)a5;
- (NSDate)locationUpdateTimestamp;
- (NSNumber)locationSource;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDHomeLocationData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSource, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (NSNumber)locationSource
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)locationUpdateTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHomeLocationData *)self location];
  [v4 encodeObject:v5 forKey:@"homeLocation"];

  v6 = [(HMDHomeLocationData *)self locationUpdateTimestamp];
  [v4 encodeObject:v6 forKey:@"homeLocationNextUpdate"];

  id v7 = [(HMDHomeLocationData *)self locationSource];
  [v4 encodeObject:v7 forKey:@"homeLocationSource"];
}

- (HMDHomeLocationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeLocation"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeLocationNextUpdate"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeLocationSource"];

  v8 = [(HMDHomeLocationData *)self initWithLocation:v5 locationUpdateTimestamp:v6 locationSource:v7];
  return v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(HMDHomeLocationData *)self location];
  v5 = locationAsString(v4);
  v6 = [(HMDHomeLocationData *)self locationUpdateTimestamp];
  id v7 = objc_msgSend(v6, "hmf_localTimeDescription");
  v8 = [(HMDHomeLocationData *)self locationSource];
  v9 = HMDHomeLocationSourceToString((int)[v8 intValue]);
  v10 = (void *)[v3 initWithFormat:@"Loc-Data: %@, Timestamp: %@, Source: %@", v5, v7, v9];

  return v10;
}

- (HMDHomeLocationData)initWithLocation:(id)a3 locationUpdateTimestamp:(id)a4 locationSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDHomeLocationData;
  v12 = [(HMDHomeLocationData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_location, a3);
    objc_storeStrong((id *)&v13->_locationUpdateTimestamp, a4);
    objc_storeStrong((id *)&v13->_locationSource, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end