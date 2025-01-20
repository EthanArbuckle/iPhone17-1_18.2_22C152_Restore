@interface MGRemoteQueryServerHandlerPing
+ (id)handlerForRequest:(id)a3;
+ (id)urlPath;
- (BOOL)replied;
- (BOOL)validateRequest;
- (NSData)responsePayload;
- (NSString)description;
- (NSURLRequest)request;
- (id)_initWithRequest:(id)a3;
- (int)prepareResponse:(id)a3;
- (void)provideResponseData:(id)a3;
- (void)setReplied:(BOOL)a3;
- (void)setResponsePayload:(id)a3;
@end

@implementation MGRemoteQueryServerHandlerPing

- (id)_initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MGRemoteQueryServerHandlerPing;
  v6 = [(MGRemoteQueryServerHandlerPing *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return (NSString *)v6;
}

+ (id)urlPath
{
  return @"/ping";
}

+ (id)handlerForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) _initWithRequest:v4];

  return v5;
}

- (BOOL)validateRequest
{
  v3 = [(id)objc_opt_class() urlPath];
  id v4 = [(MGRemoteQueryServerHandlerPing *)self request];
  id v5 = [v4 URL];
  v6 = [v5 path];
  char v7 = [v3 isEqual:v6];

  return v7;
}

- (int)prepareResponse:(id)a3
{
  id v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionary];
  char v7 = (void *)MEMORY[0x263F08900];
  v8 = objc_msgSend(v6, "rq_coded");
  uint64_t v12 = 0;
  objc_super v9 = [v7 dataWithJSONObject:v8 options:0 error:&v12];

  [(MGRemoteQueryServerHandlerPing *)self setResponsePayload:v9];
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v9, "length"));
  id v10 = objc_claimAutoreleasedReturnValue();
  [v10 UTF8String];
  nw_http_fields_append();

  return 200;
}

- (void)provideResponseData:(id)a3
{
  id v5 = a3;
  if ([(MGRemoteQueryServerHandlerPing *)self replied])
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
  else
  {
    [(MGRemoteQueryServerHandlerPing *)self setReplied:1];
    id v4 = [(MGRemoteQueryServerHandlerPing *)self responsePayload];
    (*((void (**)(id, void *, void))v5 + 2))(v5, v4, 0);
  }
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSData)responsePayload
{
  return self->_responsePayload;
}

- (void)setResponsePayload:(id)a3
{
}

- (BOOL)replied
{
  return self->_replied;
}

- (void)setReplied:(BOOL)a3
{
  self->_replied = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsePayload, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end