@interface ClientRequest
- (BOOL)requiresDeduplicationAgainstOriginalWithIdenticalOutput;
- (BOOL)wantsProgress;
- (MediaConversionQueueEntry)requestQueueEntry;
- (MediaConversionRequestTracker)requestTracker;
- (NSString)cancellationReasonDebugDescription;
- (NSString)identifier;
- (NSUUID)connectionIdentifier;
- (NSXPCConnection)connection;
- (id)description;
- (id)imageClientReplyHandler;
- (id)videoClientReplyHandler;
- (unint64_t)signpostID;
- (void)setCancellationReasonDebugDescription:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionIdentifier:(id)a3;
- (void)setImageClientReplyHandler:(id)a3;
- (void)setRequestQueueEntry:(id)a3;
- (void)setRequestTracker:(id)a3;
- (void)setRequiresDeduplicationAgainstOriginalWithIdenticalOutput:(BOOL)a3;
- (void)setSignpostID:(unint64_t)a3;
- (void)setVideoClientReplyHandler:(id)a3;
- (void)setWantsProgress:(BOOL)a3;
- (void)videoConversionTask:(id)a3 didUpdateFractionCompleted:(double)a4;
@end

@implementation ClientRequest

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requestQueueEntry);
  objc_storeStrong((id *)&self->_cancellationReasonDebugDescription, 0);
  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong(&self->_imageClientReplyHandler, 0);
  objc_storeStrong(&self->_videoClientReplyHandler, 0);
  objc_storeStrong((id *)&self->_requestTracker, 0);
}

- (void)setRequestQueueEntry:(id)a3
{
}

- (MediaConversionQueueEntry)requestQueueEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestQueueEntry);
  return (MediaConversionQueueEntry *)WeakRetained;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setRequiresDeduplicationAgainstOriginalWithIdenticalOutput:(BOOL)a3
{
  self->_requiresDeduplicationAgainstOriginalWithIdenticalOutput = a3;
}

- (BOOL)requiresDeduplicationAgainstOriginalWithIdenticalOutput
{
  return self->_requiresDeduplicationAgainstOriginalWithIdenticalOutput;
}

- (void)setWantsProgress:(BOOL)a3
{
  self->_wantsProgress = a3;
}

- (BOOL)wantsProgress
{
  return self->_wantsProgress;
}

- (void)setCancellationReasonDebugDescription:(id)a3
{
}

- (NSString)cancellationReasonDebugDescription
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConnectionIdentifier:(id)a3
{
}

- (NSUUID)connectionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setImageClientReplyHandler:(id)a3
{
}

- (id)imageClientReplyHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setVideoClientReplyHandler:(id)a3
{
}

- (id)videoClientReplyHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setRequestTracker:(id)a3
{
}

- (MediaConversionRequestTracker)requestTracker
{
  return (MediaConversionRequestTracker *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  requestTracker = self->_requestTracker;
  if (!requestTracker)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:143 description:@"Unexpected nil request tracker"];

    requestTracker = self->_requestTracker;
  }
  return [(MediaConversionRequestTracker *)requestTracker requestIdentifier];
}

- (id)description
{
  unint64_t v3 = [(MediaConversionRequestTracker *)self->_requestTracker requestNumber];
  v4 = [(MediaConversionRequestTracker *)self->_requestTracker requestIdentifier];
  unint64_t v5 = [(MediaConversionRequestTracker *)self->_requestTracker effectivePriority];
  if (v5 > 4) {
    v6 = 0;
  }
  else {
    v6 = off_1000414F8[v5];
  }
  v7 = v6;
  v8 = +[NSString stringWithFormat:@"<Request #%lu (%p) %@ %@>", v3, self, v4, v7];

  return v8;
}

- (void)videoConversionTask:(id)a3 didUpdateFractionCompleted:(double)a4
{
  if ([(ClientRequest *)self wantsProgress])
  {
    v7 = [(ClientRequest *)self identifier];
    if (!v7)
    {
      v13 = +[NSAssertionHandler currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:122 description:@"Unexpected missing job identifier"];
    }
    v8 = +[NSMutableDictionary dictionary];
    [v8 setObject:v7 forKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
    if (__fpclassifyd(a4) != 1)
    {
      v9 = +[NSNumber numberWithDouble:a4];
      [v8 setObject:v9 forKeyedSubscript:@"PAMediaConversionServiceProgressKey"];
    }
    v10 = [(ClientRequest *)self connection];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000E57C;
    v14[3] = &unk_1000410F8;
    id v15 = v7;
    id v11 = v7;
    v12 = [v10 remoteObjectProxyWithErrorHandler:v14];
    [v12 updateProgress:v8];
  }
}

@end