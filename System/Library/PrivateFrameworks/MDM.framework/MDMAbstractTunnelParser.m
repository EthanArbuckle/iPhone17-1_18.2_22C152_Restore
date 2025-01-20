@interface MDMAbstractTunnelParser
+ (id)responseWithError:(id)a3;
+ (id)responseWithStatus:(id)a3;
- (id)_commandDisconnect:(id)a3;
- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
@end

@implementation MDMAbstractTunnelParser

- (id)_commandDisconnect:(id)a3
{
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[MDMAbstractTunnelParser(Commands) _commandDisconnect:](v3);
  }
  v4 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  return v4;
}

+ (id)responseWithStatus:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = @"Status";
  v9[0] = a3;
  v3 = NSDictionary;
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  v6 = (void *)[v5 mutableCopy];
  return v6;
}

+ (id)responseWithError:(id)a3
{
  void v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"Status";
  v8[1] = @"ErrorObject";
  v9[0] = @"Error";
  v9[1] = a3;
  v3 = NSDictionary;
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:v8 count:2];

  v6 = (void *)[v5 mutableCopy];
  return v6;
}

- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (![v7 count])
  {
    v12 = 0;
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v9 = [v7 objectForKey:@"RequestType"];
  v10 = v9;
  if (v9 && [v9 isEqualToString:@"Disconnect"])
  {
    uint64_t v11 = [(MDMAbstractTunnelParser *)self _commandDisconnect:v7];
  }
  else
  {
    uint64_t v11 = +[MDMAbstractTunnelParser responseWithStatus:@"CommandFormatError"];
  }
  v12 = (void *)v11;

  if (v8)
  {
LABEL_7:
    v13 = dispatch_get_global_queue(0, 0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__MDMAbstractTunnelParser_processRequest_assertion_completionBlock___block_invoke;
    v14[3] = &unk_264B9D0E8;
    id v16 = v8;
    id v15 = v12;
    dispatch_async(v13, v14);
  }
LABEL_8:
}

uint64_t __68__MDMAbstractTunnelParser_processRequest_assertion_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end