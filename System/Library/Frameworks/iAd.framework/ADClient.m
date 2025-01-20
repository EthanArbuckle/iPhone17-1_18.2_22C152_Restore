@interface ADClient
+ (ADClient)sharedClient;
- (void)determineAppInstallationAttributionWithCompletionHandler:(id)a3;
- (void)lookupAdConversionDetails:(id)a3;
- (void)requestAttributionDetailsWithBlock:(void *)completionHandler;
- (void)segmentDataForSignedInUserWithBlock:(id)a3;
@end

@implementation ADClient

+ (ADClient)sharedClient
{
  return 0;
}

- (void)requestAttributionDetailsWithBlock:(void *)completionHandler
{
  if (completionHandler) {
    (*((void (**)(void *, void, void))completionHandler + 2))(completionHandler, 0, 0);
  }
}

- (void)determineAppInstallationAttributionWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)lookupAdConversionDetails:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)segmentDataForSignedInUserWithBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id, __CFString *, void, void, double))a3 + 2))(a3, @"1", 0, 0, 0.0);
  }
}

@end