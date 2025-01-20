@interface CTSubscriberAlgorithmEAPSIM
+ (BOOL)supportsSecureCoding;
- (CTSubscriberAlgorithmEAPSIM)initWithCoder:(id)a3;
- (NSData)rand;
- (void)encodeWithCoder:(id)a3;
- (void)setRand:(id)a3;
@end

@implementation CTSubscriberAlgorithmEAPSIM

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CTSubscriberAlgorithmEAPSIM *)self rand];
  [v5 encodeObject:v4 forKey:@"rand"];
}

- (CTSubscriberAlgorithmEAPSIM)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSubscriberAlgorithmEAPSIM;
  id v5 = [(CTSubscriberAlgorithmEAPSIM *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rand"];
    rand = v5->_rand;
    v5->_rand = (NSData *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)rand
{
  return self->_rand;
}

- (void)setRand:(id)a3
{
}

- (void).cxx_destruct
{
}

@end