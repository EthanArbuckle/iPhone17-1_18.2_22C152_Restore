@interface GTTelemetryUpdateConfiguration
+ (BOOL)supportsSecureCoding;
- (GTTelemetryConfiguration)configuration;
- (GTTelemetryUpdateConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation GTTelemetryUpdateConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryUpdateConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTTelemetryUpdateConfiguration;
  v5 = [(GTTelemetryRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (GTTelemetryConfiguration *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTTelemetryUpdateConfiguration;
  id v4 = a3;
  [(GTTelemetryRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, @"configuration", v5.receiver, v5.super_class);
}

- (GTTelemetryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end