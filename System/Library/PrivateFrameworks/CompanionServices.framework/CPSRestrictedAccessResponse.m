@interface CPSRestrictedAccessResponse
+ (BOOL)supportsSecureCoding;
- (CPSRestrictedAccessResponse)initWithCoder:(id)a3;
@end

@implementation CPSRestrictedAccessResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSRestrictedAccessResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPSRestrictedAccessResponse;
  return [(CPSRestrictedAccessResponse *)&v4 init];
}

@end