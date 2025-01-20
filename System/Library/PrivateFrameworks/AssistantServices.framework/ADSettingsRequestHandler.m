@interface ADSettingsRequestHandler
- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation ADSettingsRequestHandler

- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  v9 = (void (**)(void))a4;
  id v10 = a5;
  if (v12)
  {
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v11 = +[NSAssertionHandler currentHandler];
  [v11 handleFailureInMethod:a2, self, @"ADSettingsRequestHandler.m", 43, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

  if (v9) {
LABEL_3:
  }
    v9[2](v9);
LABEL_4:
  objc_msgSend(v12, "_ad_handleSettingsRequestWithCompletionHandler:", v10);
}

@end