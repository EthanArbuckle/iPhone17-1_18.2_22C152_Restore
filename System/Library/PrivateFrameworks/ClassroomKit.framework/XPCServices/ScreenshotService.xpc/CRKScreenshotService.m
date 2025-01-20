@interface CRKScreenshotService
- (CRKScreenshotService)init;
- (CSSRequestServicer)requestServicer;
- (CSSXPCListenerDelegate)listenerDelegate;
- (void)run;
- (void)setupSignalHandler;
@end

@implementation CRKScreenshotService

- (CRKScreenshotService)init
{
  v9.receiver = self;
  v9.super_class = (Class)CRKScreenshotService;
  v2 = [(CRKScreenshotService *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(CRKScreenshotService *)v2 setupSignalHandler];
    uint64_t v4 = objc_opt_new();
    requestServicer = v3->_requestServicer;
    v3->_requestServicer = (CSSRequestServicer *)v4;

    v6 = [[CSSXPCListenerDelegate alloc] initWithExportedObject:v3->_requestServicer];
    listenerDelegate = v3->_listenerDelegate;
    v3->_listenerDelegate = v6;
  }
  return v3;
}

- (void)run
{
  id v5 = +[NSXPCListener serviceListener];
  uint64_t v4 = [(CRKScreenshotService *)self listenerDelegate];
  [v5 setDelegate:v4];

  [v5 resume];
}

- (void)setupSignalHandler
{
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  mSIGTERMSource = self->mSIGTERMSource;
  self->mSIGTERMSource = v3;

  dispatch_source_set_event_handler((dispatch_source_t)self->mSIGTERMSource, &stru_10000C5B8);
  id v5 = self->mSIGTERMSource;

  dispatch_resume(v5);
}

- (CSSRequestServicer)requestServicer
{
  return self->_requestServicer;
}

- (CSSXPCListenerDelegate)listenerDelegate
{
  return self->_listenerDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerDelegate, 0);
  objc_storeStrong((id *)&self->_requestServicer, 0);

  objc_storeStrong((id *)&self->mSIGTERMSource, 0);
}

@end