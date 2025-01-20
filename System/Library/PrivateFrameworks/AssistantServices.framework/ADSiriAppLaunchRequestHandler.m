@interface ADSiriAppLaunchRequestHandler
- (ADSiriAppLaunchRequestHandlerDelegate)delegate;
- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation ADSiriAppLaunchRequestHandler

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (ADSiriAppLaunchRequestHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADSiriAppLaunchRequestHandlerDelegate *)WeakRetained;
}

- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  v10 = (void (**)(void))a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"ADSiriAppLaunchRequestHandler.m", 89, @"Invalid parameter not satisfying: %@", @"[request isKindOfClass:[ADAcePassthroughSiriRequest class]]" object file lineNumber description];

    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v10) {
LABEL_3:
  }
    v10[2](v10);
LABEL_4:
  id v12 = v9;
  v13 = [v12 clientBoundCommand];
  v14 = [v12 _refId];
  id v15 = [v14 copy];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10012D79C;
  v19[3] = &unk_100502EC8;
  v19[4] = self;
  id v20 = v15;
  id v21 = v11;
  id v16 = v11;
  id v17 = v15;
  objc_msgSend(v13, "_ad_handleAppLaunchCommandWithRequest:completion:", v12, v19);
}

@end