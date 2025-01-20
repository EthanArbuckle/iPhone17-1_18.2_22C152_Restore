@interface _HKWorkoutBuilderSampleQueryConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)deliverQuantities;
- (BOOL)needsHistoricalData;
- (NSUUID)workoutBuilderIdentifier;
- (_HKWorkoutBuilderSampleQueryConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliverQuantities:(BOOL)a3;
- (void)setNeedsHistoricalData:(BOOL)a3;
- (void)setWorkoutBuilderIdentifier:(id)a3;
@end

@implementation _HKWorkoutBuilderSampleQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKWorkoutBuilderSampleQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setNeedsHistoricalData:self->_needsHistoricalData];
  [v4 setWorkoutBuilderIdentifier:self->_workoutBuilderIdentifier];
  [v4 setDeliverQuantities:self->_deliverQuantities];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutBuilderSampleQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKWorkoutBuilderSampleQueryConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_needsHistoricalData = [v4 decodeBoolForKey:@"needs_historical"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"builder_identifier"];
    workoutBuilderIdentifier = v5->_workoutBuilderIdentifier;
    v5->_workoutBuilderIdentifier = (NSUUID *)v6;

    v5->_deliverQuantities = [v4 decodeBoolForKey:@"deliver_quantities"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKWorkoutBuilderSampleQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_needsHistoricalData, @"needs_historical", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_workoutBuilderIdentifier forKey:@"builder_identifier"];
  [v4 encodeBool:self->_deliverQuantities forKey:@"deliver_quantities"];
}

- (BOOL)needsHistoricalData
{
  return self->_needsHistoricalData;
}

- (void)setNeedsHistoricalData:(BOOL)a3
{
  self->_needsHistoricalData = a3;
}

- (NSUUID)workoutBuilderIdentifier
{
  return self->_workoutBuilderIdentifier;
}

- (void)setWorkoutBuilderIdentifier:(id)a3
{
}

- (BOOL)deliverQuantities
{
  return self->_deliverQuantities;
}

- (void)setDeliverQuantities:(BOOL)a3
{
  self->_deliverQuantities = a3;
}

- (void).cxx_destruct
{
}

@end