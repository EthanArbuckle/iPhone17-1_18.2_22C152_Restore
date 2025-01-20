@interface CBSService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CBSService)init;
- (int)run;
@end

@implementation CBSService

- (CBSService)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBSService;
  v2 = [(CBSService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mRequestServicer = v2->mRequestServicer;
    v2->mRequestServicer = (CBSRequestServicer *)v3;
  }
  return v2;
}

- (int)run
{
  uint64_t v3 = +[NSXPCListener serviceListener];
  [v3 setDelegate:self];
  [v3 resume];

  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = [v5 valueForEntitlement:@"com.apple.ClassroomKit.BooksService-access"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    [v5 setExportedObject:self->mRequestServicer];
    v8 = CRKBooksServiceXPCInterface();
    [v5 setExportedInterface:v8];

    [v5 resume];
  }
  else
  {
    if (qword_1000121D8 != -1) {
      dispatch_once(&qword_1000121D8, &stru_10000C368);
    }
    v9 = (void *)qword_1000121D0;
    if (os_log_type_enabled((os_log_t)qword_1000121D0, OS_LOG_TYPE_ERROR)) {
      sub_1000085A0(v9, v5);
    }
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end