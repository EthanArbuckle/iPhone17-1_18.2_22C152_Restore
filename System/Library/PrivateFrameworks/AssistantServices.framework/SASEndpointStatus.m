@interface SASEndpointStatus
- (int64_t)resultCallbackCode;
@end

@implementation SASEndpointStatus

- (int64_t)resultCallbackCode
{
  return [(SASEndpointStatus *)self confirmed] - 1;
}

@end