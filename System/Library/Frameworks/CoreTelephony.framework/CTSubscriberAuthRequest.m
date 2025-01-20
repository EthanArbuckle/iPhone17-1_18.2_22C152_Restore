@interface CTSubscriberAuthRequest
+ (BOOL)supportsSecureCoding;
- (CTSubscriberAlgorithm)algorithm;
- (CTSubscriberAuthRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlgorithm:(id)a3;
@end

@implementation CTSubscriberAuthRequest

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CTSubscriberAuthRequest *)self algorithm];
  [v5 encodeObject:v4 forKey:@"algorithm"];
}

- (CTSubscriberAuthRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSubscriberAuthRequest;
  id v5 = [(CTSubscriberAuthRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"algorithm"];
    algorithm = v5->_algorithm;
    v5->_algorithm = (CTSubscriberAlgorithm *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTSubscriberAlgorithm)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(id)a3
{
}

- (void).cxx_destruct
{
}

@end