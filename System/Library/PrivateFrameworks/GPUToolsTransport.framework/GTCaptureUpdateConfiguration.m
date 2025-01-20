@interface GTCaptureUpdateConfiguration
+ (BOOL)supportsSecureCoding;
- (GTCaptureConfiguration)configuration;
- (GTCaptureUpdateConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation GTCaptureUpdateConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureUpdateConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTCaptureUpdateConfiguration;
  v5 = [(GTCaptureRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (GTCaptureConfiguration *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTCaptureUpdateConfiguration;
  id v4 = a3;
  [(GTCaptureRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, @"configuration", v5.receiver, v5.super_class);
}

- (GTCaptureConfiguration)configuration
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