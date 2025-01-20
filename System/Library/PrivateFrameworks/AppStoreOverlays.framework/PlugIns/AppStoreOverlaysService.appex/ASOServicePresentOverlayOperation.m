@interface ASOServicePresentOverlayOperation
+ (id)log;
- (ASOOverlayConfiguration)configuration;
- (ASORemoteAppOverlayDelegate)delegate;
- (ASOServicePresentOverlayOperation)initWithQueue:(id)a3 configuration:(id)a4 delegate:(id)a5;
- (ASOServicePresentationQueue)queue;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)cancel;
- (void)finishExecuting;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsExecuting:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)start;
- (void)startExecuting;
@end

@implementation ASOServicePresentOverlayOperation

+ (id)log
{
  if (qword_10002CB60 != -1) {
    dispatch_once(&qword_10002CB60, &stru_1000252A8);
  }
  v2 = (void *)qword_10002CB68;

  return v2;
}

- (ASOServicePresentOverlayOperation)initWithQueue:(id)a3 configuration:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ASOServicePresentOverlayOperation;
  v11 = [(ASOServicePresentOverlayOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_queue, v8);
    objc_storeStrong((id *)&v12->_configuration, a4);
    objc_storeStrong((id *)&v12->_delegate, a5);
  }

  return v12;
}

- (void)cancel
{
  v3 = +[ASOServicePresentOverlayOperation log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancel ASOServicePresentOverlayOperation", buf, 2u);
  }

  if (![(ASOServicePresentOverlayOperation *)self isFinished]
    && ([(ASOServicePresentOverlayOperation *)self isCancelled] & 1) == 0)
  {
    v4 = [(ASOServicePresentOverlayOperation *)self delegate];
    v5 = +[NSError errorWithDomain:@"ASOErrorDomain" code:4 userInfo:0];
    [v4 remoteStoreOverlayDidFailToLoadWithError:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)ASOServicePresentOverlayOperation;
  [(ASOServicePresentOverlayOperation *)&v6 cancel];
  if ([(ASOServicePresentOverlayOperation *)self isExecuting]) {
    [(ASOServicePresentOverlayOperation *)self finishExecuting];
  }
}

- (void)start
{
  [(ASOServicePresentOverlayOperation *)self startExecuting];
  if ([(ASOServicePresentOverlayOperation *)self isCancelled])
  {
    [(ASOServicePresentOverlayOperation *)self finishExecuting];
  }
  else
  {
    v3 = [(ASOServicePresentOverlayOperation *)self queue];
    v4 = [v3 delegate];
    v5 = [(ASOServicePresentOverlayOperation *)self queue];
    objc_super v6 = [(ASOServicePresentOverlayOperation *)self configuration];
    v7 = [(ASOServicePresentOverlayOperation *)self delegate];
    id v8 = [v4 presentationQueue:v5 presentOverlayWithConfiguration:v6 delegate:v7];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C0DC;
    v9[3] = &unk_100024D98;
    v9[4] = self;
    [v8 addFinishBlock:v9];
  }
}

- (void)startExecuting
{
  v3 = +[ASOServicePresentOverlayOperation log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Start executing present overlay operation: %@", (uint8_t *)&v4, 0xCu);
  }

  [(ASOServicePresentOverlayOperation *)self willChangeValueForKey:@"isExecuting"];
  [(ASOServicePresentOverlayOperation *)self setIsExecuting:1];
  [(ASOServicePresentOverlayOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (void)finishExecuting
{
  v3 = +[ASOServicePresentOverlayOperation log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Finish executing present overlay operation: %@", (uint8_t *)&v4, 0xCu);
  }

  [(ASOServicePresentOverlayOperation *)self willChangeValueForKey:@"isExecuting"];
  [(ASOServicePresentOverlayOperation *)self willChangeValueForKey:@"isFinished"];
  [(ASOServicePresentOverlayOperation *)self setIsExecuting:0];
  [(ASOServicePresentOverlayOperation *)self setIsFinished:1];
  [(ASOServicePresentOverlayOperation *)self didChangeValueForKey:@"isExecuting"];
  [(ASOServicePresentOverlayOperation *)self didChangeValueForKey:@"isFinished"];
}

- (ASOServicePresentationQueue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);

  return (ASOServicePresentationQueue *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (ASOOverlayConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (ASORemoteAppOverlayDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
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
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_queue);
}

@end