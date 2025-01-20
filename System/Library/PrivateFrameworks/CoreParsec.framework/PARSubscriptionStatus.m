@interface PARSubscriptionStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isSubscribed;
- (PARSubscriptionStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsSubscribed:(BOOL)a3;
@end

@implementation PARSubscriptionStatus

- (void)setIsSubscribed:(BOOL)a3
{
  self->isSubscribed = a3;
}

- (BOOL)isSubscribed
{
  return self->isSubscribed;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[PARSubscriptionStatus isSubscribed](self, "isSubscribed"), @"isSubscribed");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsSubscribed:", -[PARSubscriptionStatus isSubscribed](self, "isSubscribed"));
  return v4;
}

- (PARSubscriptionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PARSubscriptionStatus;
  v5 = [(PARSubscriptionStatus *)&v7 init];
  if (v5) {
    -[PARSubscriptionStatus setIsSubscribed:](v5, "setIsSubscribed:", [v4 decodeBoolForKey:@"isSubscribed"]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end