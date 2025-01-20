@interface ASOServiceDismissOverlayOperation
- (ASOServiceDismissOverlayOperation)initWithQueue:(id)a3;
- (ASOServicePresentationQueue)queue;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)finishExecuting;
- (void)setIsExecuting:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)start;
- (void)startExecuting;
@end

@implementation ASOServiceDismissOverlayOperation

- (ASOServiceDismissOverlayOperation)initWithQueue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASOServiceDismissOverlayOperation;
  v5 = [(ASOServiceDismissOverlayOperation *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_queue, v4);
  }

  return v6;
}

- (void)start
{
  [(ASOServiceDismissOverlayOperation *)self startExecuting];
  if ([(ASOServiceDismissOverlayOperation *)self isCancelled])
  {
    [(ASOServiceDismissOverlayOperation *)self finishExecuting];
  }
  else
  {
    v3 = [(ASOServiceDismissOverlayOperation *)self queue];
    id v4 = [v3 delegate];
    v5 = [(ASOServiceDismissOverlayOperation *)self queue];
    v6 = [v4 presentationQueueDismissOverlay:v5];

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000048A4;
    v7[3] = &unk_100024D98;
    v7[4] = self;
    [v6 addFinishBlock:v7];
  }
}

- (void)startExecuting
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100017EFC((uint64_t)self);
  }
  [(ASOServiceDismissOverlayOperation *)self willChangeValueForKey:@"isExecuting"];
  [(ASOServiceDismissOverlayOperation *)self setIsExecuting:1];
  [(ASOServiceDismissOverlayOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (void)finishExecuting
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100017F7C((uint64_t)self);
  }
  [(ASOServiceDismissOverlayOperation *)self willChangeValueForKey:@"isExecuting"];
  [(ASOServiceDismissOverlayOperation *)self willChangeValueForKey:@"isFinished"];
  [(ASOServiceDismissOverlayOperation *)self setIsExecuting:0];
  [(ASOServiceDismissOverlayOperation *)self setIsFinished:1];
  [(ASOServiceDismissOverlayOperation *)self didChangeValueForKey:@"isExecuting"];
  [(ASOServiceDismissOverlayOperation *)self didChangeValueForKey:@"isFinished"];
}

- (ASOServicePresentationQueue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);

  return (ASOServicePresentationQueue *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (void).cxx_destruct
{
}

@end