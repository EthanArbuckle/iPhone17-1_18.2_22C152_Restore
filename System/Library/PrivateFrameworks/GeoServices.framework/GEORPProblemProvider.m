@interface GEORPProblemProvider
- (GEOProtobufSession)protobufSession;
- (GEOProtobufSessionTask)statusTask;
- (GEOProtobufSessionTask)submissionTask;
- (GEORPProblemProvider)init;
- (id)cancelError;
- (id)statusErrorHandler;
- (id)statusFinishedHandler;
- (id)submissionErrorHandler;
- (id)submissionFinishedHandler;
- (void)cancelRequest;
- (void)didCompleteStatusTask;
- (void)didCompleteSubmissionTask;
- (void)protobufSession:(id)a3 didCompleteTask:(id)a4;
- (void)setStatusErrorHandler:(id)a3;
- (void)setStatusFinishedHandler:(id)a3;
- (void)setStatusTask:(id)a3;
- (void)setSubmissionErrorHandler:(id)a3;
- (void)setSubmissionFinishedHandler:(id)a3;
- (void)setSubmissionTask:(id)a3;
- (void)startStatusRequest:(id)a3 finished:(id)a4 error:(id)a5;
- (void)startSubmissionRequest:(id)a3 finished:(id)a4 error:(id)a5;
@end

@implementation GEORPProblemProvider

- (GEORPProblemProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemProvider;
  v2 = [(GEORPProblemProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[GEOProtobufSession sharedProtobufSession];
    protobufSession = v2->_protobufSession;
    v2->_protobufSession = (GEOProtobufSession *)v3;
  }
  return v2;
}

- (void)startSubmissionRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(GEORPProblemProvider *)self setSubmissionFinishedHandler:a4];
  [(GEORPProblemProvider *)self setSubmissionErrorHandler:v8];

  v10 = +[GEORequestCounter sharedCounter];
  v11 = +[GEOApplicationAuditToken currentProcessAuditToken];
  id v19 = [v10 requestCounterTicketForType:2816 auditToken:v11 traits:0];

  v12 = [(GEORPProblemProvider *)self protobufSession];
  v13 = GEOGetURLWithSource(10, 0);
  v14 = +[GEOProtobufSession sharedDelegateQueue];
  int v15 = GEOURLNeedsAuthForURLType(10);
  uint64_t v16 = 8;
  if (!v15) {
    uint64_t v16 = 0;
  }
  v17 = [v12 taskWithRequestKind:2816 protobufRequest:v9 URL:v13 additionalHTTPHeaders:0 auditToken:0 traits:0 delegate:self delegateQueue:v14 requestCounterTicket:v19 multipathServiceType:0 multipathAlternatePort:0 throttleToken:0 options:v16];

  [(GEORPProblemProvider *)self setSubmissionTask:v17];
  v18 = [(GEORPProblemProvider *)self submissionTask];
  [v18 start];
}

- (void)startStatusRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(GEORPProblemProvider *)self setStatusFinishedHandler:a4];
  [(GEORPProblemProvider *)self setStatusErrorHandler:v8];

  v10 = +[GEORequestCounter sharedCounter];
  v11 = +[GEOApplicationAuditToken currentProcessAuditToken];
  id v19 = [v10 requestCounterTicketForType:2817 auditToken:v11 traits:0];

  v12 = [(GEORPProblemProvider *)self protobufSession];
  v13 = GEOGetURLWithSource(11, 0);
  v14 = +[GEOProtobufSession sharedDelegateQueue];
  int v15 = GEOURLNeedsAuthForURLType(11);
  uint64_t v16 = 8;
  if (!v15) {
    uint64_t v16 = 0;
  }
  v17 = [v12 taskWithRequestKind:2817 protobufRequest:v9 URL:v13 additionalHTTPHeaders:0 auditToken:0 traits:0 delegate:self delegateQueue:v14 requestCounterTicket:v19 multipathServiceType:0 multipathAlternatePort:0 throttleToken:0 options:v16];

  [(GEORPProblemProvider *)self setStatusTask:v17];
  v18 = [(GEORPProblemProvider *)self statusTask];
  [v18 start];
}

- (void)cancelRequest
{
  uint64_t v3 = [(GEORPProblemProvider *)self submissionTask];
  [v3 cancel];

  id v4 = [(GEORPProblemProvider *)self statusTask];
  [v4 cancel];
}

- (GEOProtobufSession)protobufSession
{
  return self->_protobufSession;
}

- (GEOProtobufSessionTask)submissionTask
{
  return self->_submissionTask;
}

- (void)setSubmissionTask:(id)a3
{
}

- (GEOProtobufSessionTask)statusTask
{
  return self->_statusTask;
}

- (void)setStatusTask:(id)a3
{
}

- (id)submissionErrorHandler
{
  return self->_submissionErrorHandler;
}

- (void)setSubmissionErrorHandler:(id)a3
{
}

- (id)submissionFinishedHandler
{
  return self->_submissionFinishedHandler;
}

- (void)setSubmissionFinishedHandler:(id)a3
{
}

- (id)statusErrorHandler
{
  return self->_statusErrorHandler;
}

- (void)setStatusErrorHandler:(id)a3
{
}

- (id)statusFinishedHandler
{
  return self->_statusFinishedHandler;
}

- (void)setStatusFinishedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusFinishedHandler, 0);
  objc_storeStrong(&self->_statusErrorHandler, 0);
  objc_storeStrong(&self->_submissionFinishedHandler, 0);
  objc_storeStrong(&self->_submissionErrorHandler, 0);
  objc_storeStrong((id *)&self->_statusTask, 0);
  objc_storeStrong((id *)&self->_submissionTask, 0);

  objc_storeStrong((id *)&self->_protobufSession, 0);
}

- (void)protobufSession:(id)a3 didCompleteTask:(id)a4
{
  id v8 = a4;
  id v5 = [(GEORPProblemProvider *)self submissionTask];

  if (v5 == v8)
  {
    [(GEORPProblemProvider *)self didCompleteSubmissionTask];
  }
  else
  {
    id v6 = [(GEORPProblemProvider *)self statusTask];

    v7 = v8;
    if (v6 != v8) {
      goto LABEL_6;
    }
    [(GEORPProblemProvider *)self didCompleteStatusTask];
  }
  v7 = v8;
LABEL_6:
}

- (void)didCompleteSubmissionTask
{
  uint64_t v3 = [(GEORPProblemProvider *)self submissionTask];
  int v4 = [v3 completedAsCancelled];

  if (v4)
  {
    id v5 = [(GEORPProblemProvider *)self submissionErrorHandler];
    id v6 = [(GEORPProblemProvider *)self cancelError];
    v5[2](v5, v6);
  }
  else
  {
    v7 = [(GEORPProblemProvider *)self submissionTask];
    id v5 = [v7 response];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(GEORPProblemProvider *)self submissionFinishedHandler];
      v6[2](v6, v5);
    }
    else
    {
      id v6 = [(GEORPProblemProvider *)self submissionErrorHandler];
      id v8 = [(GEORPProblemProvider *)self submissionTask];
      id v9 = [v8 error];
      ((void (**)(void, void *))v6)[2](v6, v9);
    }
  }

  [(GEORPProblemProvider *)self setSubmissionTask:0];
  [(GEORPProblemProvider *)self setSubmissionFinishedHandler:0];

  [(GEORPProblemProvider *)self setSubmissionErrorHandler:0];
}

- (void)didCompleteStatusTask
{
  uint64_t v3 = [(GEORPProblemProvider *)self statusTask];
  int v4 = [v3 completedAsCancelled];

  if (v4)
  {
    id v5 = [(GEORPProblemProvider *)self statusErrorHandler];
    id v6 = [(GEORPProblemProvider *)self cancelError];
    v5[2](v5, v6);
  }
  else
  {
    v7 = [(GEORPProblemProvider *)self statusTask];
    id v5 = [v7 response];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(GEORPProblemProvider *)self statusFinishedHandler];
      v6[2](v6, v5);
    }
    else
    {
      id v6 = [(GEORPProblemProvider *)self statusErrorHandler];
      id v8 = [(GEORPProblemProvider *)self statusTask];
      id v9 = [v8 error];
      ((void (**)(void, void *))v6)[2](v6, v9);
    }
  }

  [(GEORPProblemProvider *)self setStatusTask:0];
  [(GEORPProblemProvider *)self setStatusFinishedHandler:0];

  [(GEORPProblemProvider *)self setStatusErrorHandler:0];
}

- (id)cancelError
{
  return (id)[MEMORY[0x1E4F28C58] GEOErrorWithCode:-2];
}

@end