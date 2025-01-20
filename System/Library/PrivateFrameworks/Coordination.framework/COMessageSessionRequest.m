@interface COMessageSessionRequest
+ (BOOL)supportsSecureCoding;
- (COMessageSessionRequest)init;
@end

@implementation COMessageSessionRequest

- (COMessageSessionRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)COMessageSessionRequest;
  return [(COMessageSessionRequest *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end