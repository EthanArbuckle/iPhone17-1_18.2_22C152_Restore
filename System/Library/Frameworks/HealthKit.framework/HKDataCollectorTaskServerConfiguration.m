@interface HKDataCollectorTaskServerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)canResumeFromLastDatum;
- (HKDataCollectorTaskServerConfiguration)initWithCoder:(id)a3;
- (HKDataCollectorTaskServerConfiguration)initWithQuantityType:(id)a3 bundleIdentifier:(id)a4 canResumeFromLastDatum:(BOOL)a5;
- (HKQuantityType)quantityType;
- (NSString)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setQuantityType:(id)a3;
@end

@implementation HKDataCollectorTaskServerConfiguration

- (HKDataCollectorTaskServerConfiguration)initWithQuantityType:(id)a3 bundleIdentifier:(id)a4 canResumeFromLastDatum:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKDataCollectorTaskServerConfiguration;
  v10 = [(HKDataCollectorTaskServerConfiguration *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    quantityType = v10->_quantityType;
    v10->_quantityType = (HKQuantityType *)v11;

    uint64_t v13 = [v9 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v13;

    v10->_canResumeFromLastDatum = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HKDataCollectorTaskServerConfiguration alloc];
  quantityType = self->_quantityType;
  bundleIdentifier = self->_bundleIdentifier;
  BOOL canResumeFromLastDatum = self->_canResumeFromLastDatum;

  return [(HKDataCollectorTaskServerConfiguration *)v4 initWithQuantityType:quantityType bundleIdentifier:bundleIdentifier canResumeFromLastDatum:canResumeFromLastDatum];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKDataCollectorTaskServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKDataCollectorTaskServerConfiguration;
  v5 = [(HKTaskConfiguration *)&v12 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quantity_type"];
  quantityType = v5->_quantityType;
  v5->_quantityType = (HKQuantityType *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle_identifier"];
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v8;

  v5->_BOOL canResumeFromLastDatum = [v4 decodeBoolForKey:@"can_resume"];
  if (!v5->_quantityType) {
    goto LABEL_5;
  }
  if (v5->_bundleIdentifier) {
LABEL_4:
  }
    v10 = v5;
  else {
LABEL_5:
  }
    v10 = 0;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKDataCollectorTaskServerConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantityType, @"quantity_type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundle_identifier"];
  [v4 encodeBool:self->_canResumeFromLastDatum forKey:@"can_resume"];
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void)setQuantityType:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)canResumeFromLastDatum
{
  return self->_canResumeFromLastDatum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end