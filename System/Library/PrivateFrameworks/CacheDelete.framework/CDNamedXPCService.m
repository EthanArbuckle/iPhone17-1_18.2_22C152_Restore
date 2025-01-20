@interface CDNamedXPCService
- (CDNamedXPCService)initWithInfo:(id)a3;
- (NSString)xpcServiceName;
- (unint64_t)options;
- (void)obtainXPCConnection:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setXpcServiceName:(id)a3;
@end

@implementation CDNamedXPCService

- (void)obtainXPCConnection:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  v5 = [(CDXPCService *)self xpcConnection];

  if (v5)
  {
    v6 = [(CDNamedXPCService *)self xpcServiceName];
    +[NSException raise:@"com.apple.cache_delete.CDNamedXPCService.duplicate_connection", @"Asked to build a connection to %@ but we already have a perfectly good one!", v6 format];
  }
  else
  {
    id v7 = objc_alloc((Class)NSXPCConnection);
    v8 = [(CDNamedXPCService *)self xpcServiceName];
    id v9 = objc_msgSend(v7, "initWithMachServiceName:options:", v8, -[CDNamedXPCService options](self, "options"));

    if (v9)
    {
      [(CDXPCService *)self setXpcConnection:v9];
      id v10 = [(CDXPCService *)self xpcConnection];
      v4[2](v4, v10, 0);
    }
    else
    {
      uint64_t v11 = *__error();
      v12 = CDGetLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = [(CDNamedXPCService *)self xpcServiceName];
        *(_DWORD *)buf = 138412546;
        v20 = v16;
        __int16 v21 = 2080;
        v22 = strerror(v11);
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to create an XPC Connection to service %@: %s", buf, 0x16u);
      }
      id v10 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:v11 userInfo:0];
      id v13 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
      id v18 = v10;
      v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      id v15 = [v13 initWithDomain:@"CacheDeleteErrorDomain" code:6 userInfo:v14];

      ((void (**)(id, id, id))v4)[2](v4, 0, v15);
    }
  }
}

- (NSString)xpcServiceName
{
  return self->_xpcServiceName;
}

- (unint64_t)options
{
  return self->_options;
}

- (CDNamedXPCService)initWithInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CDNamedXPCService;
  v3 = [(CDXPCService *)&v11 initWithInfo:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CDService *)v3 ID];

    if (v5)
    {
      v6 = [(CDService *)v4 ID];
      [(CDNamedXPCService *)v4 setXpcServiceName:v6];
    }
    if (qword_10006A8A8 != -1) {
      dispatch_once(&qword_10006A8A8, &__block_literal_global_8);
    }
    id v7 = (id)_MergedGlobals_15;
    v8 = [(CDNamedXPCService *)v4 xpcServiceName];
    id v9 = [v7 objectForKeyedSubscript:v8];

    LODWORD(v7) = [v9 isEqual:&__kCFBooleanTrue];
    if (v7) {
      [(CDNamedXPCService *)v4 setOptions:[(CDNamedXPCService *)v4 options] | 0x1000];
    }
  }
  return v4;
}

- (void)setXpcServiceName:(id)a3
{
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
}

@end