@interface HSServerInfoRequest
- (HSServerInfoRequest)init;
@end

@implementation HSServerInfoRequest

- (HSServerInfoRequest)init
{
  return [(HSRequest *)self initWithAction:@"server-info"];
}

@end