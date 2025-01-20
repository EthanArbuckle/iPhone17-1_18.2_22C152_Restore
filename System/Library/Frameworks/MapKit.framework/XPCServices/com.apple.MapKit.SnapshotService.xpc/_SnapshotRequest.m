@interface _SnapshotRequest
- (MKMapSnapshotOptions)options;
- (NSXPCConnection)connection;
- (id)completionHandler;
- (int)processIdentifier;
- (unint64_t)requestId;
- (void)setCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setOptions:(id)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setRequestId:(unint64_t)a3;
@end

@implementation _SnapshotRequest

- (unint64_t)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(unint64_t)a3
{
  self->_requestId = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (MKMapSnapshotOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end