@interface MLUpdateProgressHandlers
- (MLUpdateProgressHandlers)initForEvents:(MLUpdateProgressEvent)interestedEvents progressHandler:(void *)progressHandler completionHandler:(void *)completionHandler;
- (id)completionHandler;
- (id)description;
- (id)progressHandler;
- (int64_t)interestedEvents;
- (void)_dispatchUpdateProgressHandlerForEvent:(int64_t)a3 metrics:(id)a4 parameters:(id)a5 error:(id)a6 onQueue:(id)a7;
- (void)dispatchEpochEndProgressHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5;
- (void)dispatchMiniBatchEndProgressHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5;
- (void)dispatchTrainingBeginProgressHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5;
- (void)dispatchTrainingCompletionHandlerWithError:(id)a3 onQueue:(id)a4;
- (void)dispatchTrainingCompletionHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5;
- (void)setCompletionHandler:(id)a3;
- (void)setInterestedEvents:(int64_t)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation MLUpdateProgressHandlers

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong(&self->_progressHandler, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInterestedEvents:(int64_t)a3
{
  self->_interestedEvents = a3;
}

- (int64_t)interestedEvents
{
  return self->_interestedEvents;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  if ([(MLUpdateProgressHandlers *)self interestedEvents])
  {
    v4 = +[MLUpdateProgressHandlersUtils progressEventsToString:[(MLUpdateProgressHandlers *)self interestedEvents]];
  }
  else
  {
    v4 = @"interestedEvents: ()";
  }
  v5 = [NSString stringWithFormat:@"\ninterestedEvents: %@", v4];
  [v3 appendString:v5];

  v6 = [(MLUpdateProgressHandlers *)self progressHandler];

  if (v6) {
    v7 = @"Supplied";
  }
  else {
    v7 = @"Not Supplied";
  }
  v8 = [NSString stringWithFormat:@"\nprogressHandler: %@", v7];
  [v3 appendString:v8];

  v9 = [(MLUpdateProgressHandlers *)self completionHandler];

  if (v9) {
    v10 = @"Supplied";
  }
  else {
    v10 = @"Not Supplied";
  }
  v11 = [NSString stringWithFormat:@"\ncompletionHandler: %@", v10];
  [v3 appendString:v11];

  return v3;
}

- (void)dispatchTrainingCompletionHandlerWithError:(id)a3 onQueue:(id)a4
{
}

- (void)dispatchTrainingCompletionHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5
{
}

- (void)dispatchMiniBatchEndProgressHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5
{
}

- (void)dispatchEpochEndProgressHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5
{
}

- (void)dispatchTrainingBeginProgressHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5
{
}

- (void)_dispatchUpdateProgressHandlerForEvent:(int64_t)a3 metrics:(id)a4 parameters:(id)a5 error:(id)a6 onQueue:(id)a7
{
  +[MLUpdateContext updateContextForEvent:metrics:parameters:error:](MLUpdateContext, "updateContextForEvent:metrics:parameters:error:", a3, a4, a5, a6, a7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (a3) {
    [(MLUpdateProgressHandlers *)self progressHandler];
  }
  else {
  v9 = [(MLUpdateProgressHandlers *)self completionHandler];
  }
  ((void (**)(void, id))v9)[2](v9, v10);
}

- (MLUpdateProgressHandlers)initForEvents:(MLUpdateProgressEvent)interestedEvents progressHandler:(void *)progressHandler completionHandler:(void *)completionHandler
{
  v8 = progressHandler;
  v9 = completionHandler;
  v17.receiver = self;
  v17.super_class = (Class)MLUpdateProgressHandlers;
  id v10 = [(MLUpdateProgressHandlers *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_interestedEvents = interestedEvents;
    v12 = _Block_copy(v8);
    id v13 = v11->_progressHandler;
    v11->_progressHandler = v12;

    v14 = _Block_copy(v9);
    id v15 = v11->_completionHandler;
    v11->_completionHandler = v14;
  }
  return v11;
}

@end