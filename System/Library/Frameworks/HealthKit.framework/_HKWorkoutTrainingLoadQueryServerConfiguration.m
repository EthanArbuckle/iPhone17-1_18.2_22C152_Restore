@interface _HKWorkoutTrainingLoadQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (_HKWorkoutTrainingLoadQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setOptions:(int64_t)a3;
@end

@implementation _HKWorkoutTrainingLoadQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKWorkoutTrainingLoadQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setOptions:self->_options];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutTrainingLoadQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HKWorkoutTrainingLoadQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_options = [v4 decodeIntegerForKey:@"options"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKWorkoutTrainingLoadQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, @"options", v5.receiver, v5.super_class);
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

@end