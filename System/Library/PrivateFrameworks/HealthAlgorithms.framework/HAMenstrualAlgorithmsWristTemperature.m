@interface HAMenstrualAlgorithmsWristTemperature
+ (BOOL)supportsSecureCoding;
- (HAMenstrualAlgorithmsWristTemperature)initWithCoder:(id)a3;
- (HAMenstrualAlgorithmsWristTemperature)initWithTemperature:(double)a3 forWatchIdentifier:(id)a4;
- (NSString)watchIdentifier;
- (double)temperatureCelsius;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HAMenstrualAlgorithmsWristTemperature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsWristTemperature)initWithTemperature:(double)a3 forWatchIdentifier:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAMenstrualAlgorithmsWristTemperature;
  v8 = [(HAMenstrualAlgorithmsWristTemperature *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_temperatureCelsius = a3;
    objc_storeStrong((id *)&v8->_watchIdentifier, a4);
    v10 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  double temperatureCelsius = self->_temperatureCelsius;
  v5 = NSStringFromSelector(sel_temperatureCelsius);
  [v8 encodeDouble:v5 forKey:temperatureCelsius];

  watchIdentifier = self->_watchIdentifier;
  id v7 = NSStringFromSelector(sel_watchIdentifier);
  [v8 encodeObject:watchIdentifier forKey:v7];
}

- (HAMenstrualAlgorithmsWristTemperature)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HAMenstrualAlgorithmsWristTemperature *)self init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_temperatureCelsius);
    [v4 decodeDoubleForKey:v6];
    v5->_double temperatureCelsius = v7;

    uint64_t v8 = objc_opt_class();
    v9 = NSStringFromSelector(sel_watchIdentifier);
    uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
    watchIdentifier = v5->_watchIdentifier;
    v5->_watchIdentifier = (NSString *)v10;

    objc_super v12 = v5;
  }

  return v5;
}

- (double)temperatureCelsius
{
  return self->_temperatureCelsius;
}

- (NSString)watchIdentifier
{
  return self->_watchIdentifier;
}

- (void).cxx_destruct
{
}

@end