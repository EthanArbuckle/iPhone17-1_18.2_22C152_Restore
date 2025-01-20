@interface SHPreRecordingWorker
- (NSArray)buffers;
- (NSUUID)requestID;
- (NSUUID)workerID;
- (SHAudioTapProvider)audioTapProvider;
- (SHPreRecordingWorker)initWithRequestID:(id)a3 audioTapProvider:(id)a4;
- (SHWorkerDelegate)workerDelegate;
- (id)completionHandler;
- (int64_t)executionScope;
- (void)setCompletionHandler:(id)a3;
- (void)setWorkerDelegate:(id)a3;
- (void)shutdownWorker;
- (void)startRecordingWithCompletionHandler:(id)a3;
- (void)stopAfterTransferingBuffers;
@end

@implementation SHPreRecordingWorker

- (SHPreRecordingWorker)initWithRequestID:(id)a3 audioTapProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 tapsForAvailableSources];
  id v10 = [v9 count];

  if (v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)SHPreRecordingWorker;
    v11 = [(SHPreRecordingWorker *)&v16 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_requestID, a3);
      objc_storeStrong(p_isa + 4, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v14 = sh_log_object();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to create pre recording worker, there are no recorders available", buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (void)startRecordingWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(SHPreRecordingWorker *)self buffers];

  if (v5)
  {
    v4[2](v4);
    v6 = sh_log_object();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Pre Recording should not be started twice", buf, 2u);
    }
  }
  else
  {
    v19 = v4;
    [(SHPreRecordingWorker *)self setCompletionHandler:v4];
    v6 = +[NSMutableArray array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = [(SHPreRecordingWorker *)self audioTapProvider];
    id v8 = [v7 tapsForAvailableSources];

    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v14 = [[SHRecordingBuffer alloc] initWithTap:v13];
          v15 = [(SHPreRecordingWorker *)self audioTapProvider];
          objc_super v16 = [v15 audioRecordingManager];
          [v16 attachTap:v13];

          [v6 addObject:v14];
        }
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    v17 = [v6 copy];
    buffers = self->_buffers;
    self->_buffers = v17;

    v4 = v19;
  }
}

- (NSUUID)workerID
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"9846B3A1-6769-4363-8AA2-214973BD05A0"];

  return (NSUUID *)v2;
}

- (int64_t)executionScope
{
  return 1;
}

- (void)stopAfterTransferingBuffers
{
  buffers = self->_buffers;
  self->_buffers = 0;

  v4 = [(SHPreRecordingWorker *)self completionHandler];

  if (v4)
  {
    v5 = [(SHPreRecordingWorker *)self completionHandler];
    v5[2]();

    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  id v7 = [(SHPreRecordingWorker *)self workerDelegate];
  [v7 finishedWorker:self];

  [(SHPreRecordingWorker *)self setWorkerDelegate:0];
}

- (void)shutdownWorker
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(SHPreRecordingWorker *)self buffers];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v7);
        id v9 = [(SHPreRecordingWorker *)self audioTapProvider];
        id v10 = [v9 audioRecordingManager];
        uint64_t v11 = [v8 tap];
        [v10 detachTap:v11];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  [(SHPreRecordingWorker *)self stopAfterTransferingBuffers];
}

- (SHWorkerDelegate)workerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workerDelegate);

  return (SHWorkerDelegate *)WeakRetained;
}

- (void)setWorkerDelegate:(id)a3
{
}

- (NSArray)buffers
{
  return self->_buffers;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (SHAudioTapProvider)audioTapProvider
{
  return self->_audioTapProvider;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_audioTapProvider, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_buffers, 0);

  objc_destroyWeak((id *)&self->_workerDelegate);
}

@end