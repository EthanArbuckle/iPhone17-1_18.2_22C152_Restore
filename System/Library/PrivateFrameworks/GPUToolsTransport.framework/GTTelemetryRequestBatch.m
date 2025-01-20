@interface GTTelemetryRequestBatch
- (GTTelemetryRequestBatch)init;
- (NSArray)requests;
- (id)completionHandler;
- (id)initNoRequestID;
- (unint64_t)requestID;
- (void)setCompletionHandler:(id)a3;
- (void)setRequestID:(unint64_t)a3;
- (void)setRequests:(id)a3;
@end

@implementation GTTelemetryRequestBatch

- (GTTelemetryRequestBatch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryRequestBatch;
  v2 = [(GTTelemetryRequestBatch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_requestID = atomic_fetch_add(globalRequestID_0, 1u);
    v4 = v2;
  }

  return v3;
}

- (id)initNoRequestID
{
  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryRequestBatch;
  v2 = [(GTTelemetryRequestBatch *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
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
  objc_storeStrong((id *)&self->_requests, 0);
}

@end