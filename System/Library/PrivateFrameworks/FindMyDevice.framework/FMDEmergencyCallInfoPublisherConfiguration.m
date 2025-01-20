@interface FMDEmergencyCallInfoPublisherConfiguration
+ (BOOL)supportsSecureCoding;
- (FMDEmergencyCallInfoPublisherConfiguration)initWithCoder:(id)a3;
- (NSString)serverHost;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setServerHost:(id)a3;
@end

@implementation FMDEmergencyCallInfoPublisherConfiguration

- (FMDEmergencyCallInfoPublisherConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDEmergencyCallInfoPublisherConfiguration;
  v5 = [(FMDEmergencyCallInfoPublisherConfiguration *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverHost"];
    [(FMDEmergencyCallInfoPublisherConfiguration *)v5 setServerHost:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDEmergencyCallInfoPublisherConfiguration *)self serverHost];
  [v4 encodeObject:v5 forKey:@"serverHost"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FMDEmergencyCallInfoPublisherConfiguration *)self serverHost];
  v6 = [v3 stringWithFormat:@"%@(0x%lx) %@", v4, self, v5];

  return v6;
}

- (NSString)serverHost
{
  return self->_serverHost;
}

- (void)setServerHost:(id)a3
{
}

- (void).cxx_destruct
{
}

@end