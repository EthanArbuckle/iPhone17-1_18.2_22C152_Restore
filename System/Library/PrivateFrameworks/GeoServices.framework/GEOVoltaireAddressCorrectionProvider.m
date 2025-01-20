@interface GEOVoltaireAddressCorrectionProvider
+ (BOOL)acInitNeedsProxy;
+ (BOOL)acUpdateNeedsProxy;
+ (id)acInitURL;
+ (id)acUpdateURL;
- (GEOProtobufSession)protobufSession;
- (GEOProtobufSessionTask)initializationTask;
- (GEOProtobufSessionTask)updateTask;
- (GEOVoltaireAddressCorrectionProvider)init;
- (id)cancelError;
- (id)initErrorHandler;
- (id)initFinishedHandler;
- (id)updateErrorHandler;
- (id)updateFinishedHandler;
- (void)cancelRequest;
- (void)didCompleteInitTask;
- (void)didCompleteUpdateTask;
- (void)protobufSession:(id)a3 didCompleteTask:(id)a4;
- (void)setInitErrorHandler:(id)a3;
- (void)setInitFinishedHandler:(id)a3;
- (void)setInitializationTask:(id)a3;
- (void)setUpdateErrorHandler:(id)a3;
- (void)setUpdateFinishedHandler:(id)a3;
- (void)setUpdateTask:(id)a3;
- (void)startInitRequest:(id)a3 finished:(id)a4 error:(id)a5;
- (void)startUpdateRequest:(id)a3 finished:(id)a4 error:(id)a5;
@end

@implementation GEOVoltaireAddressCorrectionProvider

+ (id)acInitURL
{
  return GEOGetURLWithSource(19, 0);
}

+ (BOOL)acInitNeedsProxy
{
  return GEOURLNeedsAuthForURLType(19);
}

+ (id)acUpdateURL
{
  return GEOGetURLWithSource(20, 0);
}

+ (BOOL)acUpdateNeedsProxy
{
  return GEOURLNeedsAuthForURLType(20);
}

- (GEOVoltaireAddressCorrectionProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVoltaireAddressCorrectionProvider;
  v2 = [(GEOVoltaireAddressCorrectionProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[GEOProtobufSession sharedProtobufSession];
    protobufSession = v2->_protobufSession;
    v2->_protobufSession = (GEOProtobufSession *)v3;
  }
  return v2;
}

- (void)startInitRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(GEOVoltaireAddressCorrectionProvider *)self setInitFinishedHandler:a4];
  [(GEOVoltaireAddressCorrectionProvider *)self setInitErrorHandler:v8];

  v10 = +[GEORequestCounter sharedCounter];
  v11 = +[GEOApplicationAuditToken currentProcessAuditToken];
  id v19 = [v10 requestCounterTicketForType:2848 auditToken:v11 traits:0];

  v12 = [(id)objc_opt_class() acInitURL];
  LODWORD(v11) = [(id)objc_opt_class() acInitNeedsProxy];
  v13 = [(GEOVoltaireAddressCorrectionProvider *)self protobufSession];
  uint64_t v14 = +[GEOProtobufSession sharedDelegateQueue];
  v15 = (void *)v14;
  uint64_t v16 = 8;
  if (!v11) {
    uint64_t v16 = 0;
  }
  v17 = [v13 taskWithRequestKind:2848 protobufRequest:v9 URL:v12 additionalHTTPHeaders:0 auditToken:0 traits:0 delegate:self delegateQueue:v14 requestCounterTicket:v19 multipathServiceType:0 multipathAlternatePort:0 throttleToken:0 options:v16];

  [(GEOVoltaireAddressCorrectionProvider *)self setInitializationTask:v17];
  v18 = [(GEOVoltaireAddressCorrectionProvider *)self initializationTask];
  [v18 start];
}

- (void)startUpdateRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(GEOVoltaireAddressCorrectionProvider *)self setUpdateFinishedHandler:a4];
  [(GEOVoltaireAddressCorrectionProvider *)self setUpdateErrorHandler:v8];

  v10 = +[GEORequestCounter sharedCounter];
  v11 = +[GEOApplicationAuditToken currentProcessAuditToken];
  id v19 = [v10 requestCounterTicketForType:2849 auditToken:v11 traits:0];

  v12 = [(id)objc_opt_class() acUpdateURL];
  LODWORD(v11) = [(id)objc_opt_class() acUpdateNeedsProxy];
  v13 = [(GEOVoltaireAddressCorrectionProvider *)self protobufSession];
  uint64_t v14 = +[GEOProtobufSession sharedDelegateQueue];
  v15 = (void *)v14;
  uint64_t v16 = 8;
  if (!v11) {
    uint64_t v16 = 0;
  }
  v17 = [v13 taskWithRequestKind:2849 protobufRequest:v9 URL:v12 additionalHTTPHeaders:0 auditToken:0 traits:0 delegate:self delegateQueue:v14 requestCounterTicket:v19 multipathServiceType:0 multipathAlternatePort:0 throttleToken:0 options:v16];

  [(GEOVoltaireAddressCorrectionProvider *)self setUpdateTask:v17];
  v18 = [(GEOVoltaireAddressCorrectionProvider *)self updateTask];
  [v18 start];
}

- (void)cancelRequest
{
  uint64_t v3 = [(GEOVoltaireAddressCorrectionProvider *)self initializationTask];
  [v3 cancel];

  id v4 = [(GEOVoltaireAddressCorrectionProvider *)self updateTask];
  [v4 cancel];
}

- (GEOProtobufSession)protobufSession
{
  return self->_protobufSession;
}

- (GEOProtobufSessionTask)initializationTask
{
  return self->_initializationTask;
}

- (void)setInitializationTask:(id)a3
{
}

- (GEOProtobufSessionTask)updateTask
{
  return self->_updateTask;
}

- (void)setUpdateTask:(id)a3
{
}

- (id)initFinishedHandler
{
  return self->_initFinishedHandler;
}

- (void)setInitFinishedHandler:(id)a3
{
}

- (id)initErrorHandler
{
  return self->_initErrorHandler;
}

- (void)setInitErrorHandler:(id)a3
{
}

- (id)updateFinishedHandler
{
  return self->_updateFinishedHandler;
}

- (void)setUpdateFinishedHandler:(id)a3
{
}

- (id)updateErrorHandler
{
  return self->_updateErrorHandler;
}

- (void)setUpdateErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateErrorHandler, 0);
  objc_storeStrong(&self->_updateFinishedHandler, 0);
  objc_storeStrong(&self->_initFinishedHandler, 0);
  objc_storeStrong(&self->_initErrorHandler, 0);
  objc_storeStrong((id *)&self->_updateTask, 0);
  objc_storeStrong((id *)&self->_initializationTask, 0);

  objc_storeStrong((id *)&self->_protobufSession, 0);
}

- (void)protobufSession:(id)a3 didCompleteTask:(id)a4
{
  id v8 = a4;
  id v5 = [(GEOVoltaireAddressCorrectionProvider *)self initializationTask];

  if (v5 == v8)
  {
    [(GEOVoltaireAddressCorrectionProvider *)self didCompleteInitTask];
  }
  else
  {
    id v6 = [(GEOVoltaireAddressCorrectionProvider *)self updateTask];

    v7 = v8;
    if (v6 != v8) {
      goto LABEL_6;
    }
    [(GEOVoltaireAddressCorrectionProvider *)self didCompleteUpdateTask];
  }
  v7 = v8;
LABEL_6:
}

- (void)didCompleteInitTask
{
  uint64_t v3 = [(GEOVoltaireAddressCorrectionProvider *)self initializationTask];
  int v4 = [v3 completedAsCancelled];

  if (v4)
  {
    id v5 = [(GEOVoltaireAddressCorrectionProvider *)self initErrorHandler];
    id v6 = [(GEOVoltaireAddressCorrectionProvider *)self cancelError];
    v5[2](v5, v6);
  }
  else
  {
    v7 = [(GEOVoltaireAddressCorrectionProvider *)self initializationTask];
    id v5 = [v7 response];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(GEOVoltaireAddressCorrectionProvider *)self initFinishedHandler];
      v6[2](v6, v5);
    }
    else
    {
      id v6 = [(GEOVoltaireAddressCorrectionProvider *)self initErrorHandler];
      id v8 = [(GEOVoltaireAddressCorrectionProvider *)self initializationTask];
      id v9 = [v8 error];
      ((void (**)(void, void *))v6)[2](v6, v9);
    }
  }

  [(GEOVoltaireAddressCorrectionProvider *)self setInitializationTask:0];
  [(GEOVoltaireAddressCorrectionProvider *)self setInitFinishedHandler:0];

  [(GEOVoltaireAddressCorrectionProvider *)self setInitErrorHandler:0];
}

- (void)didCompleteUpdateTask
{
  uint64_t v3 = [(GEOVoltaireAddressCorrectionProvider *)self updateTask];
  int v4 = [v3 completedAsCancelled];

  if (v4)
  {
    id v5 = [(GEOVoltaireAddressCorrectionProvider *)self updateErrorHandler];
    id v6 = [(GEOVoltaireAddressCorrectionProvider *)self cancelError];
    v5[2](v5, v6);
  }
  else
  {
    v7 = [(GEOVoltaireAddressCorrectionProvider *)self updateTask];
    id v5 = [v7 response];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(GEOVoltaireAddressCorrectionProvider *)self updateFinishedHandler];
      v6[2](v6, v5);
    }
    else
    {
      id v6 = [(GEOVoltaireAddressCorrectionProvider *)self updateErrorHandler];
      id v8 = [(GEOVoltaireAddressCorrectionProvider *)self updateTask];
      id v9 = [v8 error];
      ((void (**)(void, void *))v6)[2](v6, v9);
    }
  }

  [(GEOVoltaireAddressCorrectionProvider *)self setUpdateTask:0];
  [(GEOVoltaireAddressCorrectionProvider *)self setUpdateFinishedHandler:0];

  [(GEOVoltaireAddressCorrectionProvider *)self setUpdateErrorHandler:0];
}

- (id)cancelError
{
  return (id)[MEMORY[0x1E4F28C58] GEOErrorWithCode:-2];
}

@end