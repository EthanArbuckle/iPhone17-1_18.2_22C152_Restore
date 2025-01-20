@interface COMessageSessionResponse
+ (BOOL)supportsSecureCoding;
- (COMessageSessionResponse)init;
@end

@implementation COMessageSessionResponse

- (COMessageSessionResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)COMessageSessionResponse;
  return [(COMessageSessionResponse *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end