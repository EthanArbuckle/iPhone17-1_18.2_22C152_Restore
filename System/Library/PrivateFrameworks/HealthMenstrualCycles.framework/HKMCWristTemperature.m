@interface HKMCWristTemperature
+ (BOOL)supportsSecureCoding;
+ (id)wristTemperatureFromWristTemperatureSample:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKMCWristTemperature)initWithCoder:(id)a3;
- (HKMCWristTemperature)initWithQuantity:(id)a3 watchBundleIdentifier:(id)a4;
- (HKQuantity)quantity;
- (NSString)hk_redactedDescription;
- (NSString)watchBundleIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCWristTemperature

- (HKMCWristTemperature)initWithQuantity:(id)a3 watchBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMCWristTemperature;
  v9 = [(HKMCWristTemperature *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_quantity, a3);
    objc_storeStrong((id *)&v10->_watchBundleIdentifier, a4);
  }

  return v10;
}

+ (id)wristTemperatureFromWristTemperatureSample:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 quantity];
  id v7 = [v4 sourceRevision];

  id v8 = [v7 source];
  v9 = [v8 bundleIdentifier];
  v10 = (void *)[v5 initWithQuantity:v6 watchBundleIdentifier:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  quantity = self->_quantity;
  id v5 = a3;
  [v5 encodeObject:quantity forKey:@"Quantity"];
  [v5 encodeObject:self->_watchBundleIdentifier forKey:@"WatchBundleIdentifier"];
}

- (HKMCWristTemperature)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMCWristTemperature;
  id v5 = [(HKMCWristTemperature *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Quantity"];
    quantity = v5->_quantity;
    v5->_quantity = (HKQuantity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WatchBundleIdentifier"];
    watchBundleIdentifier = v5->_watchBundleIdentifier;
    v5->_watchBundleIdentifier = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p quantity: %@, watchBundleIdentifier: %@>", objc_opt_class(), self, self->_quantity, self->_watchBundleIdentifier];
}

- (NSString)hk_redactedDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p watchBundleIdentifier: %@>", objc_opt_class(), self, self->_watchBundleIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  id v7 = (HKMCWristTemperature *)a3;
  if (self == v7)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [(HKMCWristTemperature *)self quantity];
      v9 = [(HKMCWristTemperature *)v7 quantity];
      if (v8 == v9) {
        goto LABEL_9;
      }
      uint64_t v10 = [(HKMCWristTemperature *)v7 quantity];
      if (!v10)
      {
        char v11 = 0;
        goto LABEL_12;
      }
      v3 = (void *)v10;
      id v4 = [(HKMCWristTemperature *)self quantity];
      id v5 = [(HKMCWristTemperature *)v7 quantity];
      if ([v4 isEqual:v5])
      {
LABEL_9:
        objc_super v12 = [(HKMCWristTemperature *)self watchBundleIdentifier];
        v13 = [(HKMCWristTemperature *)v7 watchBundleIdentifier];
        char v11 = [v12 isEqual:v13];

        if (v8 == v9)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        char v11 = 0;
      }

      goto LABEL_12;
    }
    char v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HKQuantity *)self->_quantity hash];
  return [(NSString *)self->_watchBundleIdentifier hash] ^ v3;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (NSString)watchBundleIdentifier
{
  return self->_watchBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
}

@end