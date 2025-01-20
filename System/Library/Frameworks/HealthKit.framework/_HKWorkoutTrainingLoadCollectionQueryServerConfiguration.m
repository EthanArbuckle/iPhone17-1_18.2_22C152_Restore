@interface _HKWorkoutTrainingLoadCollectionQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (NSDate)anchorDate;
- (NSDateComponents)intervalComponents;
- (_HKWorkoutTrainingLoadCollectionQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorDate:(id)a3;
- (void)setIntervalComponents:(id)a3;
- (void)setOptions:(int64_t)a3;
@end

@implementation _HKWorkoutTrainingLoadCollectionQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKWorkoutTrainingLoadCollectionQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setAnchorDate:self->_anchorDate];
  [v4 setOptions:self->_options];
  [v4 setIntervalComponents:self->_intervalComponents];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutTrainingLoadCollectionQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HKWorkoutTrainingLoadCollectionQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_options = [v4 decodeIntegerForKey:@"options"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchor"];
    anchorDate = v5->_anchorDate;
    v5->_anchorDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intervals"];
    intervalComponents = v5->_intervalComponents;
    v5->_intervalComponents = (NSDateComponents *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKWorkoutTrainingLoadCollectionQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, @"options", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_anchorDate forKey:@"anchor"];
  [v4 encodeObject:self->_intervalComponents forKey:@"intervals"];
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (void)setAnchorDate:(id)a3
{
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (void)setIntervalComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalComponents, 0);

  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end