@interface CTSubscriberAlgorithmEAPAKA
+ (BOOL)supportsSecureCoding;
- (CTSubscriberAlgorithmEAPAKA)initWithCoder:(id)a3;
- (NSData)autn;
- (NSData)rand;
- (void)encodeWithCoder:(id)a3;
- (void)setAutn:(id)a3;
- (void)setRand:(id)a3;
@end

@implementation CTSubscriberAlgorithmEAPAKA

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTSubscriberAlgorithmEAPAKA *)self rand];
  [v6 encodeObject:v4 forKey:@"rand"];

  v5 = [(CTSubscriberAlgorithmEAPAKA *)self autn];
  [v6 encodeObject:v5 forKey:@"autn"];
}

- (CTSubscriberAlgorithmEAPAKA)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTSubscriberAlgorithmEAPAKA;
  v5 = [(CTSubscriberAlgorithmEAPAKA *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rand"];
    rand = v5->_rand;
    v5->_rand = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autn"];
    autn = v5->_autn;
    v5->_autn = (NSData *)v8;
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

- (NSData)autn
{
  return self->_autn;
}

- (void)setAutn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autn, 0);

  objc_storeStrong((id *)&self->_rand, 0);
}

@end