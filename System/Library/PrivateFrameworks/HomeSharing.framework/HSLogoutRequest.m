@interface HSLogoutRequest
- (HSLogoutRequest)init;
@end

@implementation HSLogoutRequest

- (HSLogoutRequest)init
{
  return [(HSRequest *)self initWithAction:@"logout"];
}

@end