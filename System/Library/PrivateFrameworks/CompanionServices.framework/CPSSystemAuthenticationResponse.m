@interface CPSSystemAuthenticationResponse
+ (BOOL)supportsSecureCoding;
- (CPSSystemAuthenticationResponse)initWithCoder:(id)a3;
@end

@implementation CPSSystemAuthenticationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSSystemAuthenticationResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPSSystemAuthenticationResponse;
  return [(CPSSystemAuthenticationResponse *)&v4 init];
}

@end