@interface _NanoRoutePlanningSingleRequester
- (void)processRequest:(id)a3 withCompletion:(id)a4;
- (void)routePlanningSession:(id)a3 didFailWithResponse:(id)a4;
- (void)routePlanningSession:(id)a3 didUpdateWithResponse:(id)a4;
- (void)routePlanningSessionDidInvalidate:(id)a3;
@end

@implementation _NanoRoutePlanningSingleRequester

- (void)processRequest:(id)a3 withCompletion:(id)a4
{
  id v11 = a3;
  id v6 = [a4 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  v8 = objc_alloc_init(NanoRoutePlanningSession);
  session = self->_session;
  self->_session = v8;
  v10 = v8;

  [(NanoRoutePlanningSession *)v10 setShouldBroadcast:0];
  [(NanoRoutePlanningSession *)v10 registerObserver:self];
  [(NanoRoutePlanningSession *)v10 processRequest:v11];
}

- (void)routePlanningSession:(id)a3 didUpdateWithResponse:(id)a4
{
  id v5 = a3;
  if ([a4 hasReceivedAllExpectedRoutes]) {
    [v5 invalidate];
  }
}

- (void)routePlanningSession:(id)a3 didFailWithResponse:(id)a4
{
}

- (void)routePlanningSessionDidInvalidate:(id)a3
{
  id v4 = a3;
  id v8 = [v4 request];
  id v5 = [v4 response];

  id v6 = (void (**)(id, id, void *))objc_retainBlock(self->_completionHandler);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  v6[2](v6, v8, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end