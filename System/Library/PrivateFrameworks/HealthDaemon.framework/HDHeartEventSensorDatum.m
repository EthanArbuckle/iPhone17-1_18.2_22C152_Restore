@interface HDHeartEventSensorDatum
+ (BOOL)supportsSecureCoding;
- (HDHeartEventSensorDatum)initWithCoder:(id)a3;
- (HDHeartEventSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 heartRateThreshold:(id)a5 associatedSampleUUIDs:(id)a6 resumeContext:(id)a7;
- (HKQuantity)heartRateThreshold;
- (NSArray)associatedSampleUUIDs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDHeartEventSensorDatum

- (HDHeartEventSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 heartRateThreshold:(id)a5 associatedSampleUUIDs:(id)a6 resumeContext:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDHeartEventSensorDatum;
  v15 = [(HDDataCollectorSensorDatum *)&v18 initWithIdentifier:a3 dateInterval:a4 resumeContext:a7];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_heartRateThreshold, a5);
    objc_storeStrong((id *)&v16->_associatedSampleUUIDs, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDHeartEventSensorDatum)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDHeartEventSensorDatum;
  v5 = [(HDDataCollectorSensorDatum *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_HeartRateThresholdKey"];
    heartRateThreshold = v5->_heartRateThreshold;
    v5->_heartRateThreshold = (HKQuantity *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_AssociatedSampleUUIDsKey"];
    associatedSampleUUIDs = v5->_associatedSampleUUIDs;
    v5->_associatedSampleUUIDs = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDHeartEventSensorDatum;
  id v4 = a3;
  [(HDDataCollectorSensorDatum *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_heartRateThreshold, @"_HeartRateThresholdKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_associatedSampleUUIDs forKey:@"_AssociatedSampleUUIDsKey"];
}

- (NSArray)associatedSampleUUIDs
{
  return self->_associatedSampleUUIDs;
}

- (HKQuantity)heartRateThreshold
{
  return self->_heartRateThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateThreshold, 0);

  objc_storeStrong((id *)&self->_associatedSampleUUIDs, 0);
}

@end