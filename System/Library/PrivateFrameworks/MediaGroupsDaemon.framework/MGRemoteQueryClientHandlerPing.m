@interface MGRemoteQueryClientHandlerPing
+ (id)handler;
- (NSString)description;
- (id)handleCompleteResponse:(id)a3 jsonPayload:(id)a4;
- (void)prepareRequest:(id)a3;
- (void)prepareURL:(id)a3;
@end

@implementation MGRemoteQueryClientHandlerPing

+ (id)handler
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return (NSString *)v6;
}

- (void)prepareURL:(id)a3
{
}

- (void)prepareRequest:(id)a3
{
}

- (id)handleCompleteResponse:(id)a3 jsonPayload:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  if (!v5)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v6 = v5;
  if (![v5 count])
  {
    v7 = 0;
    v6 = v5;
    goto LABEL_10;
  }
LABEL_7:
  v8 = MGLogForCategory(6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 134217984;
    v11 = self;
    _os_log_error_impl(&dword_229257000, v8, OS_LOG_TYPE_ERROR, "%p client handler received malformed ping payload content", (uint8_t *)&v10, 0xCu);
  }

  v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:94 userInfo:0];
LABEL_10:

  return v7;
}

@end