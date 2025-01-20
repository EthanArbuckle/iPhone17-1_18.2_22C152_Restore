@interface DRDragContinuationSession
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DRDragContinuationSession)initWithDragSession:(id)a3;
- (DRDragSession)dragSession;
- (NSXPCConnection)continuationConnection;
- (NSXPCListener)listener;
- (id)continuationEndpoint;
- (void)setContinuationConnection:(id)a3;
- (void)setDragSession:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation DRDragContinuationSession

- (DRDragContinuationSession)initWithDragSession:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DRDragContinuationSession;
  v5 = [(DRDragContinuationSession *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dragSession, v4);
    uint64_t v7 = +[NSXPCListener anonymousListener];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v7;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    [(NSXPCListener *)v6->_listener resume];
  }

  return v6;
}

- (id)continuationEndpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [(DRDragContinuationSession *)self continuationConnection];

  if (!v6)
  {
    uint64_t v7 = [[DRDragContinuation alloc] initWithContinuationSession:self];
    [v5 setExportedObject:v7];

    v8 = _DUINewDragContinuationInterface();
    [v5 setExportedInterface:v8];

    [v5 resume];
    [(DRDragContinuationSession *)self setContinuationConnection:v5];
  }

  return v6 == 0;
}

- (DRDragSession)dragSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragSession);
  return (DRDragSession *)WeakRetained;
}

- (void)setDragSession:(id)a3
{
}

- (NSXPCConnection)continuationConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContinuationConnection:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 24, 1);
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_continuationConnection, 0);
  objc_destroyWeak((id *)&self->_dragSession);
}

@end