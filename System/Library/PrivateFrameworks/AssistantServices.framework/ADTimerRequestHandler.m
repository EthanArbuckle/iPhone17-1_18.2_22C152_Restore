@interface ADTimerRequestHandler
- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation ADTimerRequestHandler

- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v7 = a5;
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
  objc_msgSend(v8, "_ad_handleTimerRequestWithCompletionHandler:", v7);
}

@end