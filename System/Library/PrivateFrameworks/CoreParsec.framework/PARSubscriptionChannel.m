@interface PARSubscriptionChannel
+ (BOOL)supportsSecureCoding;
- (PARSubscriptionChannel)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PARSubscriptionChannel

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (PARSubscriptionChannel)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PARSubscriptionChannel;
  return [(PARSubscriptionChannel *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end