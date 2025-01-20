@interface CAMPendingRemotePersistenceWrapper
- (CAMCaptureRequest)request;
- (CAMPendingRemotePersistenceWrapper)initWithRequest:(id)a3 creationDate:(id)a4 job:(id)a5 loggingIdentifier:(id)a6 completionHandler:(id)a7;
- (NSDate)creationDate;
- (NSMutableDictionary)job;
- (NSString)loggingIdentifier;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
@end

@implementation CAMPendingRemotePersistenceWrapper

- (CAMPendingRemotePersistenceWrapper)initWithRequest:(id)a3 creationDate:(id)a4 job:(id)a5 loggingIdentifier:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CAMPendingRemotePersistenceWrapper;
  v18 = [(CAMPendingRemotePersistenceWrapper *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_request, a3);
    objc_storeStrong((id *)&v19->_creationDate, a4);
    objc_storeStrong((id *)&v19->_job, a5);
    uint64_t v20 = [v16 copy];
    loggingIdentifier = v19->_loggingIdentifier;
    v19->_loggingIdentifier = (NSString *)v20;

    uint64_t v22 = [v17 copy];
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = (id)v22;

    v24 = v19;
  }

  return v19;
}

- (CAMCaptureRequest)request
{
  return self->_request;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSMutableDictionary)job
{
  return self->_job;
}

- (NSString)loggingIdentifier
{
  return self->_loggingIdentifier;
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
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_job, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end