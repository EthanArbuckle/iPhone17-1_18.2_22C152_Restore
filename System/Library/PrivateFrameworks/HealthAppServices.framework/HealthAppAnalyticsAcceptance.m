@interface HealthAppAnalyticsAcceptance
+ (BOOL)supportsSecureCoding;
- (BOOL)accepted;
- (BOOL)isEqual:(id)a3;
- (HealthAppAnalyticsAcceptance)init;
- (HealthAppAnalyticsAcceptance)initWithCoder:(id)a3;
- (NSDate)modificationDate;
- (NSString)agreement;
- (id)initForAgreement:(id)a3 version:(int64_t)a4 accepted:(BOOL)a5 modificationDate:(id)a6;
- (int64_t)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HealthAppAnalyticsAcceptance

- (HealthAppAnalyticsAcceptance)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)initForAgreement:(id)a3 version:(int64_t)a4 accepted:(BOOL)a5 modificationDate:(id)a6
{
  id v10 = a3;
  v11 = (NSDate *)a6;
  v16.receiver = self;
  v16.super_class = (Class)HealthAppAnalyticsAcceptance;
  v12 = [(HealthAppAnalyticsAcceptance *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    agreement = v12->_agreement;
    v12->_agreement = (NSString *)v13;

    v12->_accepted = a5;
    v12->_version = a4;
    v12->_modificationDate = v11;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_agreement hash];
  modificationDate = self->_modificationDate;
  int64_t v5 = self->_version ^ self->_accepted ^ v3;
  return v5 ^ [(NSDate *)modificationDate hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    agreement = self->_agreement;
    v6 = [v4 agreement];
    if ([(NSString *)agreement isEqualToString:v6]
      && (int64_t version = self->_version, version == [v4 version])
      && (int accepted = self->_accepted, accepted == [v4 accepted]))
    {
      modificationDate = self->_modificationDate;
      id v10 = [v4 modificationDate];
      BOOL v11 = [(NSDate *)modificationDate isEqualToDate:v10];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  agreement = self->_agreement;
  id v5 = a3;
  [v5 encodeObject:agreement forKey:@"agreement"];
  [v5 encodeInteger:self->_version forKey:@"version"];
  [v5 encodeBool:self->_accepted forKey:@"accepted"];
  [v5 encodeObject:self->_modificationDate forKey:@"modificationDate"];
}

- (HealthAppAnalyticsAcceptance)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"agreement"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"version"];
  uint64_t v7 = [v4 decodeBoolForKey:@"accepted"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modificationDate"];

  if (v5) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    self = (HealthAppAnalyticsAcceptance *)[(HealthAppAnalyticsAcceptance *)self initForAgreement:v5 version:v6 accepted:v7 modificationDate:v8];
    id v10 = self;
  }

  return v10;
}

- (NSString)agreement
{
  return self->_agreement;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void).cxx_destruct
{
}

@end