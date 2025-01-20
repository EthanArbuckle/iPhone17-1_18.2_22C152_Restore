@interface MSXPCEndpoint
- (MSXPCEndpoint)init;
- (void)connectionForProtocol:(id)a3 completionHandler:(id)a4;
@end

@implementation MSXPCEndpoint

void __57__MSXPCEndpoint_connectionForProtocol_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  xpc_object_t xdict = a2;
  id v5 = a3;
  if (xdict)
  {
    v6 = xpc_dictionary_get_value(xdict, "endpoint");
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x263F08D98]);
      [v7 _setEndpoint:v6];
      v8 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v7];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MSXPCEndpoint)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSXPCEndpoint;
  v2 = [(MSMailDefaultService *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MSMailDefaultService *)v2 setShouldLaunchMobileMail:1];
    v4 = v3;
  }

  return v3;
}

- (void)connectionForProtocol:(id)a3 completionHandler:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  objc_super v6 = (Protocol *)a3;
  id v7 = a4;
  v13 = @"protocol";
  v8 = NSStringFromProtocol(v6);
  v14[0] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__MSXPCEndpoint_connectionForProtocol_completionHandler___block_invoke;
  v11[3] = &unk_264243528;
  id v10 = v7;
  id v12 = v10;
  [(MSService *)self _callServicesMethod:@"xpc-endpoint" arguments:v9 replyHandler:v11];
}

@end