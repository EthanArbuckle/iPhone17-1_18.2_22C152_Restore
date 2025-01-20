@interface IDSOffGridDeliveryHandlesDonationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isInitialDonation;
- (IDSOffGridDeliveryHandlesDonationOptions)init;
- (IDSOffGridDeliveryHandlesDonationOptions)initWithCoder:(id)a3;
- (id)description;
- (int64_t)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setIsInitialDonation:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation IDSOffGridDeliveryHandlesDonationOptions

- (IDSOffGridDeliveryHandlesDonationOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridDeliveryHandlesDonationOptions;
  return [(IDSOffGridDeliveryHandlesDonationOptions *)&v3 init];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(IDSOffGridDeliveryHandlesDonationOptions *)self priority];
  BOOL v6 = [(IDSOffGridDeliveryHandlesDonationOptions *)self isInitialDonation];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p priority: %ld, isInitialDonation: %@>", v4, self, v5, v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridDeliveryHandlesDonationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_alloc_init(IDSOffGridDeliveryHandlesDonationOptions);
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priority"];
  -[IDSOffGridDeliveryHandlesDonationOptions setPriority:](v5, "setPriority:", (int)[v6 intValue]);

  uint64_t v7 = [v4 decodeBoolForKey:@"isInitialDonation"];
  [(IDSOffGridDeliveryHandlesDonationOptions *)v5 setIsInitialDonation:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t priority = self->_priority;
  id v7 = a3;
  BOOL v6 = [v4 numberWithInteger:priority];
  [v7 encodeObject:v6 forKey:@"priority"];

  [v7 encodeBool:self->_isInitialDonation forKey:@"isInitialDonation"];
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_int64_t priority = a3;
}

- (BOOL)isInitialDonation
{
  return self->_isInitialDonation;
}

- (void)setIsInitialDonation:(BOOL)a3
{
  self->_isInitialDonation = a3;
}

@end