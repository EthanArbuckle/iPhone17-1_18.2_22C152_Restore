@interface HKElectrocardiogramSessionTaskConfiguration
+ (BOOL)supportsSecureCoding;
- (HKElectrocardiogramSessionConfiguration)sessionConfiguration;
- (HKElectrocardiogramSessionTaskConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSessionConfiguration:(id)a3;
@end

@implementation HKElectrocardiogramSessionTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setSessionConfiguration:self->_sessionConfiguration];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKElectrocardiogramSessionTaskConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKElectrocardiogramSessionTaskConfiguration;
  v5 = [(HKTaskConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionConfiguration"];
    sessionConfiguration = v5->_sessionConfiguration;
    v5->_sessionConfiguration = (HKElectrocardiogramSessionConfiguration *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKElectrocardiogramSessionTaskConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sessionConfiguration, @"sessionConfiguration", v5.receiver, v5.super_class);
}

- (HKElectrocardiogramSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end