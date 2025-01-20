@interface GEOMapRequest
- (BOOL)isFinished;
- (GEOMapRequest)initWithManager:(id)a3;
- (id)cancellationHandler;
- (id)completionHandler;
- (void)_finishAndCallHandler:(id)a3;
- (void)cancel;
- (void)complete;
- (void)dealloc;
- (void)setCancellationHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation GEOMapRequest

- (GEOMapRequest)initWithManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapRequest;
  v6 = [(GEOMapRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestManager, a3);
    [v5 trackRequest:v7];
  }

  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GEOMapRequest;
  [(GEOMapRequest *)&v2 dealloc];
}

- (void)cancel
{
}

- (void)complete
{
}

- (void)_finishAndCallHandler:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!self->_isFinished)
  {
    self->_isFinished = 1;
    if (v4) {
      (*((void (**)(id, GEOMapRequest *))v4 + 2))(v4, self);
    }
  }
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id cancellationHandler = self->_cancellationHandler;
  self->_id cancellationHandler = 0;

  requestManager = self->_requestManager;
  self->_requestManager = 0;
  v8 = requestManager;

  [(GEOMapRequestManager *)v8 requestComplete:self];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end