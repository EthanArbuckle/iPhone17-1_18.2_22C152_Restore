@interface CPRequestEndpointAction
- (BOOL)canSendResponse;
@end

@implementation CPRequestEndpointAction

- (BOOL)canSendResponse
{
  return 1;
}

@end