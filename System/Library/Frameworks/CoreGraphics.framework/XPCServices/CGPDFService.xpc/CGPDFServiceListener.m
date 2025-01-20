@interface CGPDFServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CGPDFServiceListener)init;
- (CGPDFServiceListener)initWithListener:(id)a3;
- (NSXPCListener)listener;
- (id)initForLoopback;
- (id)initForXPCService;
- (void)run;
@end

@implementation CGPDFServiceListener

- (CGPDFServiceListener)init
{
}

- (CGPDFServiceListener)initWithListener:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CGPDFServiceListener;
  v6 = [(CGPDFServiceListener *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listener, a3);
    [(NSXPCListener *)v7->_listener setDelegate:v7];
  }

  return v7;
}

- (id)initForXPCService
{
  v3 = +[NSXPCListener serviceListener];
  v4 = [(CGPDFServiceListener *)self initWithListener:v3];

  return v4;
}

- (id)initForLoopback
{
  v3 = +[NSXPCListener anonymousListener];
  v4 = [(CGPDFServiceListener *)self initWithListener:v3];

  return v4;
}

- (void)run
{
  v2 = [(CGPDFServiceListener *)self listener];
  [v2 resume];

  id v3 = +[NSRunLoop currentRunLoop];
  [v3 run];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  id v5 = +[CGRemotePDFServiceProxy interface];
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new();
  [v4 setExportedObject:v6];
  [v4 resume];

  return 1;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end