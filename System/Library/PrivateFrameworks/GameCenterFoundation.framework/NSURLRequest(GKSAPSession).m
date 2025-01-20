@interface NSURLRequest(GKSAPSession)
- (id)_gkSAPSession;
- (void)_gkSetSAPSession:()GKSAPSession;
@end

@implementation NSURLRequest(GKSAPSession)

- (id)_gkSAPSession
{
  return objc_getAssociatedObject(a1, @"SAPSession");
}

- (void)_gkSetSAPSession:()GKSAPSession
{
}

@end