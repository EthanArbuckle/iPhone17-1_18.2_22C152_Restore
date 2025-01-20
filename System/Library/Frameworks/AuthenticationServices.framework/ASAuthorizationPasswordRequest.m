@interface ASAuthorizationPasswordRequest
- (BOOL)supportsStyle:(int64_t)a3;
@end

@implementation ASAuthorizationPasswordRequest

- (BOOL)supportsStyle:(int64_t)a3
{
  return (a3 & 7) == 0 && (unint64_t)a3 < 3;
}

@end