@interface SHMatcherController
- (NSUUID)taskID;
- (NSUUID)workerID;
- (SHMatchResultNotificationScheduler)notificationScheduler;
- (SHMatcher)matcher;
- (SHMatcherController)associatedMatcherController;
- (SHMatcherController)initWithMatcher:(id)a3 notificationScheduler:(id)a4;
- (SHMatcherDelegate)delegate;
- (SHMatcherDelegate)matcherDelegateForResponse;
- (SHMatcherRequest)matcherRequest;
- (SHWorkerDelegate)workerDelegate;
- (_SHDownstreamMatcherDelegate)downstreamMatcherDelegate;
- (id)completionHandler;
- (int64_t)executionScope;
- (void)downstreamMatcher:(id)a3 didProduceResponse:(id)a4;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)setAssociatedMatcherController:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownstreamMatcherDelegate:(id)a3;
- (void)setMatcher:(id)a3;
- (void)setMatcherDelegateForResponse:(id)a3;
- (void)setMatcherRequest:(id)a3;
- (void)setNotificationScheduler:(id)a3;
- (void)setWorkerDelegate:(id)a3;
- (void)shutdownWorker;
- (void)shutdownWorkerForRequestID:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHMatcherController

- (SHMatcherController)initWithMatcher:(id)a3 notificationScheduler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SHMatcherController;
  v9 = [(SHMatcherController *)&v13 init];
  if (v9)
  {
    v10 = objc_alloc_init(_SHDownstreamMatcherDelegate);
    downstreamMatcherDelegate = v9->_downstreamMatcherDelegate;
    v9->_downstreamMatcherDelegate = v10;

    [(_SHDownstreamMatcherDelegate *)v9->_downstreamMatcherDelegate setWorker:v9];
    objc_storeStrong((id *)&v9->_matcher, a3);
    [(SHMatcher *)v9->_matcher setDelegate:v9->_downstreamMatcherDelegate];
    objc_storeStrong((id *)&v9->_notificationScheduler, a4);
  }

  return v9;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  [(SHMatcherController *)self setMatcherRequest:v4];
  id v5 = [(SHMatcherController *)self matcher];
  [v5 startRecognitionForRequest:v4];
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHMatcherController *)self matcherDelegateForResponse];
  [v8 matcher:v7 didProduceResponse:v6];

  [(SHMatcherController *)self setMatcherDelegateForResponse:0];
}

- (void)downstreamMatcher:(id)a3 didProduceResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHMatcherController *)self associatedMatcherController];
  v9 = [v8 matcher];
  unsigned int v10 = [v6 isEqual:v9];

  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___SHMatcherDelegate]) {
    [(SHMatcherController *)self setMatcherDelegateForResponse:v6];
  }
  v11 = [(SHMatcherController *)self delegate];
  [v11 matcher:v6 didProduceResponse:v7];

  if ((v10 & 1) == 0)
  {
    if (([v7 isStillRunningAssociatedRequest] & 1) == 0)
    {
      v12 = [(SHMatcherController *)self associatedMatcherController];
      [v12 setAssociatedMatcherController:0];
    }
    objc_super v13 = [(SHMatcherController *)self associatedMatcherController];
    v14 = [v13 delegate];
    v15 = [(SHMatcherController *)self associatedMatcherController];
    v16 = [v15 matcher];
    [v14 matcher:v16 didProduceResponse:v7];
  }
  if (([v7 isStillRunningAssociatedRequest] & 1) == 0)
  {
    v17 = [v7 error];
    unsigned __int8 v18 = objc_msgSend(v17, "sh_isMatchAttemptCancelledError");

    v19 = [(SHMatcherController *)self matcherRequest];
    unsigned int v20 = [v19 sendNotifications];

    if (!v20 || (v18 & 1) != 0)
    {
      if (v10) {
        [(SHMatcherController *)self setAssociatedMatcherController:0];
      }
      [(SHMatcherController *)self stopRecognition];
    }
    else
    {
      objc_initWeak(&location, self);
      v21 = [(SHMatcherController *)self notificationScheduler];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100046F84;
      v22[3] = &unk_1000760B0;
      char v24 = v10;
      objc_copyWeak(&v23, &location);
      [v21 sendNotificationForResponse:v7 completionHandler:v22];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

- (NSUUID)workerID
{
  if (!self->_workerID)
  {
    v3 = [(SHMatcherController *)self matcher];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v5 = objc_alloc((Class)NSUUID);
      id v6 = SHAppIntentMatcherUUID;
LABEL_9:
      v9 = (NSUUID *)[v5 initWithUUIDString:*v6];
LABEL_10:
      workerID = self->_workerID;
      self->_workerID = v9;

      goto LABEL_11;
    }
    id v7 = [(SHMatcherController *)self matcher];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = [(SHMatcherController *)self matcher];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_super v13 = [(SHMatcherController *)self matcher];
        objc_opt_class();
        char v14 = objc_opt_isKindOfClass();

        if ((v14 & 1) == 0)
        {
          v9 = +[NSUUID UUID];
          goto LABEL_10;
        }
        goto LABEL_8;
      }
    }
LABEL_8:
    id v5 = objc_alloc((Class)NSUUID);
    id v6 = &SHRecordingMatcherUUID;
    goto LABEL_9;
  }
LABEL_11:
  v11 = self->_workerID;

  return v11;
}

- (NSUUID)taskID
{
  v2 = [(SHMatcherController *)self matcherRequest];
  v3 = [v2 requestID];

  return (NSUUID *)v3;
}

- (int64_t)executionScope
{
  v3 = [(SHMatcherController *)self matcher];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  id v4 = [(SHMatcherController *)self matcher];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_5:

LABEL_6:
    return 1;
  }
  id v5 = [(SHMatcherController *)self matcher];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    goto LABEL_5;
  }
  id v7 = [(SHMatcherController *)self matcher];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) != 0;
}

- (void)shutdownWorker
{
  id v4 = [(SHMatcherController *)self matcherRequest];
  v3 = [v4 requestID];
  [(SHMatcherController *)self shutdownWorkerForRequestID:v3];
}

- (void)shutdownWorkerForRequestID:(id)a3
{
  id v18 = a3;
  id v4 = [(SHMatcherController *)self matcherRequest];
  id v5 = [v4 requestID];
  unsigned int v6 = [v5 isEqual:v18];

  if (v6)
  {
    [(SHMatcherController *)self setMatcherRequest:0];
    id v7 = [(SHMatcherController *)self matcher];
    [v7 stopRecognitionForRequestID:v18];

    id v8 = [(SHMatcherController *)self completionHandler];

    if (v8)
    {
      v9 = [(SHMatcherController *)self completionHandler];
      v9[2]();

      [(SHMatcherController *)self setCompletionHandler:0];
    }
    unsigned int v10 = [(SHMatcherController *)self workerDelegate];
    [v10 finishedWorker:self];

    [(SHMatcherController *)self setWorkerDelegate:0];
    v11 = [(SHMatcherController *)self associatedMatcherController];

    if (v11)
    {
      v12 = +[SHError privateErrorWithCode:203 underlyingError:0];
      objc_super v13 = objc_opt_new();
      char v14 = +[SHMatcherResponse errorResponseForSignature:v13 error:v12];

      v15 = [(SHMatcherController *)self associatedMatcherController];
      v16 = [v15 downstreamMatcherDelegate];
      v17 = [(SHMatcherController *)self matcher];
      [v16 matcher:v17 didProduceResponse:v14];
    }
  }
}

- (void)stopRecognition
{
  id v4 = [(SHMatcherController *)self matcherRequest];
  v3 = [v4 requestID];
  [(SHMatcherController *)self stopRecognitionForRequestID:v3];
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v5 = a3;
  id v4 = [(SHMatcherController *)self matcher];
  [v4 setDelegate:0];

  [(SHMatcherController *)self shutdownWorkerForRequestID:v5];
}

- (SHWorkerDelegate)workerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workerDelegate);

  return (SHWorkerDelegate *)WeakRetained;
}

- (void)setWorkerDelegate:(id)a3
{
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHMatcher)matcher
{
  return self->_matcher;
}

- (void)setMatcher:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (SHMatcherController)associatedMatcherController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedMatcherController);

  return (SHMatcherController *)WeakRetained;
}

- (void)setAssociatedMatcherController:(id)a3
{
}

- (SHMatcherDelegate)matcherDelegateForResponse
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_matcherDelegateForResponse);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setMatcherDelegateForResponse:(id)a3
{
}

- (SHMatcherRequest)matcherRequest
{
  return self->_matcherRequest;
}

- (void)setMatcherRequest:(id)a3
{
}

- (_SHDownstreamMatcherDelegate)downstreamMatcherDelegate
{
  return self->_downstreamMatcherDelegate;
}

- (void)setDownstreamMatcherDelegate:(id)a3
{
}

- (SHMatchResultNotificationScheduler)notificationScheduler
{
  return self->_notificationScheduler;
}

- (void)setNotificationScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationScheduler, 0);
  objc_storeStrong((id *)&self->_downstreamMatcherDelegate, 0);
  objc_storeStrong((id *)&self->_matcherRequest, 0);
  objc_destroyWeak((id *)&self->_matcherDelegateForResponse);
  objc_destroyWeak((id *)&self->_associatedMatcherController);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_matcher, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_workerID, 0);

  objc_destroyWeak((id *)&self->_workerDelegate);
}

@end