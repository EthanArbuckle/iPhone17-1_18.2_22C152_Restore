@interface ACSURLSessionTask
- (ACSURLSession)_weakSession;
- (ACSURLSessionTask)initWithNSURLTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5;
- (BOOL)_failBackToOrigin;
- (BOOL)_isUpload;
- (BOOL)_suspended;
- (BOOL)_tryCachingServer;
- (NSError)error;
- (NSProgress)progress;
- (NSString)description;
- (NSString)taskDescription;
- (NSURLRequest)currentRequest;
- (NSURLRequest)originalRequest;
- (NSURLResponse)response;
- (NSURLSessionTask)_nsurlTaskToCachingServer;
- (NSURLSessionTask)_nsurlTaskToOrigin;
- (float)priority;
- (id)_nsurlTaskCreator;
- (id)_nsurlTaskForRequest:(id)a3;
- (int64_t)_internalState;
- (int64_t)countOfBytesClientExpectsToReceive;
- (int64_t)countOfBytesClientExpectsToSend;
- (int64_t)countOfBytesExpectedToReceive;
- (int64_t)countOfBytesExpectedToSend;
- (int64_t)countOfBytesReceived;
- (int64_t)countOfBytesSent;
- (int64_t)state;
- (unint64_t)taskIdentifier;
- (void)cancel;
- (void)resume;
- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3;
- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3;
- (void)setPriority:(float)a3;
- (void)setTaskDescription:(id)a3;
- (void)set_failBackToOrigin:(BOOL)a3;
- (void)set_internalState:(int64_t)a3;
- (void)set_nsurlTaskCreator:(id)a3;
- (void)set_nsurlTaskToCachingServer:(id)a3;
- (void)set_nsurlTaskToOrigin:(id)a3;
- (void)set_suspended:(BOOL)a3;
- (void)set_tryCachingServer:(BOOL)a3;
- (void)set_weakSession:(id)a3;
- (void)suspend;
@end

@implementation ACSURLSessionTask

- (unint64_t)taskIdentifier
{
  v2 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
  unint64_t v3 = [v2 taskIdentifier];

  return v3;
}

- (NSURLRequest)originalRequest
{
  v2 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
  unint64_t v3 = [v2 originalRequest];

  return (NSURLRequest *)v3;
}

- (NSURLRequest)currentRequest
{
  unint64_t v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    v4 = [v3 currentRequest];
  }
  else
  {
    v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    v4 = [v5 currentRequest];
  }

  return (NSURLRequest *)v4;
}

- (NSURLResponse)response
{
  unint64_t v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    v4 = [v3 response];
  }
  else
  {
    v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    v4 = [v5 response];
  }

  return (NSURLResponse *)v4;
}

- (NSProgress)progress
{
  unint64_t v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    v4 = [v3 progress];
  }
  else
  {
    v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    v4 = [v5 progress];
  }

  return (NSProgress *)v4;
}

- (int64_t)countOfBytesClientExpectsToSend
{
  unint64_t v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    int64_t v4 = [v3 countOfBytesClientExpectsToSend];
  }
  else
  {
    v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    int64_t v4 = [v5 countOfBytesClientExpectsToSend];
  }
  return v4;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  id v6 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v6) {
    [v6 setCountOfBytesClientExpectsToSend:a3];
  }
  v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
  [v5 setCountOfBytesClientExpectsToSend:a3];
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  unint64_t v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    int64_t v4 = [v3 countOfBytesClientExpectsToReceive];
  }
  else
  {
    v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    int64_t v4 = [v5 countOfBytesClientExpectsToReceive];
  }
  return v4;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  id v6 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v6) {
    [v6 setCountOfBytesClientExpectsToReceive:a3];
  }
  v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
  [v5 setCountOfBytesClientExpectsToReceive:a3];
}

- (int64_t)countOfBytesReceived
{
  unint64_t v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    int64_t v4 = [v3 countOfBytesReceived];
  }
  else
  {
    v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    int64_t v4 = [v5 countOfBytesReceived];
  }
  return v4;
}

- (int64_t)countOfBytesSent
{
  unint64_t v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    int64_t v4 = [v3 countOfBytesSent];
  }
  else
  {
    v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    int64_t v4 = [v5 countOfBytesSent];
  }
  return v4;
}

- (int64_t)countOfBytesExpectedToSend
{
  unint64_t v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    int64_t v4 = [v3 countOfBytesExpectedToSend];
  }
  else
  {
    v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    int64_t v4 = [v5 countOfBytesExpectedToSend];
  }
  return v4;
}

- (int64_t)countOfBytesExpectedToReceive
{
  unint64_t v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    int64_t v4 = [v3 countOfBytesExpectedToReceive];
  }
  else
  {
    v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    int64_t v4 = [v5 countOfBytesExpectedToReceive];
  }
  return v4;
}

- (NSString)taskDescription
{
  v2 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
  unint64_t v3 = [v2 taskDescription];

  return (NSString *)v3;
}

- (void)setTaskDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
  [v5 setTaskDescription:v4];
}

- (void)cancel
{
  if ([(ACSURLSessionTask *)self _internalState] != 2)
  {
    id v3 = [(ACSURLSessionTask *)self _weakSession];
    [v3 _cancelTask:self];
  }
}

- (int64_t)state
{
  if ([(ACSURLSessionTask *)self _internalState] == 2) {
    return 3;
  }
  id v4 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v4 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    int64_t v3 = [v4 state];
  }
  else
  {
    id v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    int64_t v3 = [v5 state];
  }
  return v3;
}

- (NSError)error
{
  int64_t v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    id v4 = [v3 error];
  }
  else
  {
    id v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    id v4 = [v5 error];
  }
  id v6 = [(ACSURLSessionTask *)self _weakSession];
  v7 = [(ACSURLSessionTask *)self originalRequest];
  v8 = [(ACSURLSessionTask *)self currentRequest];
  v9 = [v6 _errorWithResumeDataFromError:v4 originalRequest:v7 currentRequest:v8];

  return (NSError *)v9;
}

- (void)suspend
{
  if ([(ACSURLSessionTask *)self _internalState] != 2)
  {
    id v3 = [(ACSURLSessionTask *)self _weakSession];
    [v3 _suspendTask:self];
  }
}

- (void)resume
{
  id v3 = [(ACSURLSessionTask *)self _weakSession];
  [v3 _resumeTask:self];
}

- (float)priority
{
  id v3 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v3 && [(ACSURLSessionTask *)self _tryCachingServer])
  {
    [v3 priority];
    float v5 = v4;
  }
  else
  {
    id v6 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
    [v6 priority];
    float v5 = v7;
  }
  return v5;
}

- (void)setPriority:(float)a3
{
  id v8 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  if (v8)
  {
    *(float *)&double v5 = a3;
    [v8 setPriority:v5];
  }
  id v6 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
  *(float *)&double v7 = a3;
  [v6 setPriority:v7];
}

- (ACSURLSessionTask)initWithNSURLTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5
{
  id v8 = (void (**)(id, id))a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACSURLSessionTask;
  v11 = [(ACSURLSessionTask *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(ACSURLSessionTask *)v11 set_nsurlTaskCreator:v8];
    v13 = v8[2](v8, v9);
    [(ACSURLSessionTask *)v12 set_nsurlTaskToOrigin:v13];

    [(ACSURLSessionTask *)v12 set_weakSession:v10];
    -[ACSURLSessionTask set_tryCachingServer:](v12, "set_tryCachingServer:", [v10 canUseCachingServer]);
    [(ACSURLSessionTask *)v12 set_failBackToOrigin:1];
    [(ACSURLSessionTask *)v12 set_internalState:0];
  }

  return v12;
}

- (NSString)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)ACSURLSessionTask;
  float v4 = [(ACSURLSessionTask *)&v11 description];
  double v5 = [(ACSURLSessionTask *)self _nsurlTaskToOrigin];
  id v6 = [v5 descriptionWithAddress];
  double v7 = [(ACSURLSessionTask *)self _nsurlTaskToCachingServer];
  id v8 = [v7 descriptionWithAddress];
  id v9 = [v3 stringWithFormat:@"%@ { taskToOrigin: %@, taskToCachingServer: %@, tryCachingServer: %d, failBackToOrigin: %d, suspended: %d }", v4, v6, v8, -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"), -[ACSURLSessionTask _failBackToOrigin](self, "_failBackToOrigin"), -[ACSURLSessionTask _suspended](self, "_suspended")];

  return (NSString *)v9;
}

- (BOOL)_isUpload
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  double v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  id v9 = [v5 stringWithFormat:@"subclass %@ must implement %@", v7, v8];
  id v10 = [v3 exceptionWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)_nsurlTaskForRequest:(id)a3
{
  id v4 = a3;
  double v5 = [(ACSURLSessionTask *)self _nsurlTaskCreator];
  id v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)_nsurlTaskCreator
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)set_nsurlTaskCreator:(id)a3
{
}

- (NSURLSessionTask)_nsurlTaskToOrigin
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_nsurlTaskToOrigin:(id)a3
{
}

- (NSURLSessionTask)_nsurlTaskToCachingServer
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_nsurlTaskToCachingServer:(id)a3
{
}

- (ACSURLSession)_weakSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__weakSession);

  return (ACSURLSession *)WeakRetained;
}

- (void)set_weakSession:(id)a3
{
}

- (BOOL)_tryCachingServer
{
  return self->__tryCachingServer;
}

- (void)set_tryCachingServer:(BOOL)a3
{
  self->__tryCachingServer = a3;
}

- (BOOL)_failBackToOrigin
{
  return self->__failBackToOrigin;
}

- (void)set_failBackToOrigin:(BOOL)a3
{
  self->__failBackToOrigin = a3;
}

- (BOOL)_suspended
{
  return self->__suspended;
}

- (void)set_suspended:(BOOL)a3
{
  self->__suspended = a3;
}

- (int64_t)_internalState
{
  return self->__internalState;
}

- (void)set_internalState:(int64_t)a3
{
  self->__internalState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__weakSession);
  objc_storeStrong((id *)&self->__nsurlTaskToCachingServer, 0);
  objc_storeStrong((id *)&self->__nsurlTaskToOrigin, 0);

  objc_storeStrong(&self->__nsurlTaskCreator, 0);
}

@end