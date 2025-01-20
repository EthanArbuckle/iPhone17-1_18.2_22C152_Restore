@interface HSRequest
+ (id)request;
- (BOOL)acceptsGzipEncoding;
- (BOOL)isConcurrent;
- (HSRequest)initWithAction:(id)a3;
- (NSData)bodyData;
- (NSString)action;
- (double)timeoutInterval;
- (id)URLRequestForBaseURL:(id)a3 sessionID:(unsigned int)a4;
- (id)canonicalResponseForResponse:(id)a3;
- (id)description;
- (id)requestURLForBaseURL:(id)a3 sessionID:(unsigned int)a4;
- (int64_t)method;
- (void)setBodyData:(id)a3;
- (void)setMethod:(int64_t)a3;
- (void)setValue:(id)a3 forArgument:(id)a4;
@end

@implementation HSRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
}

- (void)setBodyData:(id)a3
{
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setMethod:(int64_t)a3
{
  self->_method = a3;
}

- (int64_t)method
{
  return self->_method;
}

- (BOOL)isConcurrent
{
  return self->_concurrent;
}

- (NSString)action
{
  return self->_action;
}

- (BOOL)acceptsGzipEncoding
{
  return 1;
}

- (id)canonicalResponseForResponse:(id)a3
{
  return a3;
}

- (id)URLRequestForBaseURL:(id)a3 sessionID:(unsigned int)a4
{
  v5 = [(HSRequest *)self requestURLForBaseURL:a3 sessionID:*(void *)&a4];
  v6 = (void *)MEMORY[0x263F089E0];
  [(HSRequest *)self timeoutInterval];
  v7 = objc_msgSend(v6, "requestWithURL:cachePolicy:timeoutInterval:", v5, 0);
  v8 = v7;
  if (self->_method == 1) {
    v9 = @"POST";
  }
  else {
    v9 = @"GET";
  }
  [v7 setHTTPMethod:v9];
  if ([(HSRequest *)self acceptsGzipEncoding]) {
    [v8 setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
  }
  if ([(NSData *)self->_bodyData length]) {
    [v8 setHTTPBody:self->_bodyData];
  }
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d", 3, 16);
  [v8 setValue:v10 forHTTPHeaderField:@"Client-iTunes-Sharing-Version"];

  return v8;
}

- (id)requestURLForBaseURL:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[(NSString *)self->_action mutableCopy];
  if (v4)
  {
    arguments = self->_arguments;
    v9 = [NSNumber numberWithUnsignedInt:v4];
    [(NSDictionary *)arguments setValue:v9 forKey:@"session-id"];
  }
  if ([(NSDictionary *)self->_arguments count])
  {
    v10 = [MEMORY[0x263EFF980] array];
    v11 = self->_arguments;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __44__HSRequest_requestURLForBaseURL_sessionID___block_invoke;
    v16[3] = &unk_264239BE8;
    id v17 = v10;
    id v12 = v10;
    [(NSDictionary *)v11 enumerateKeysAndObjectsUsingBlock:v16];
    v13 = [v12 componentsJoinedByString:@"&"];
    [v7 appendString:@"?"];
    [v7 appendString:v13];
  }
  v14 = [NSURL URLWithString:v7 relativeToURL:v6];

  return v14;
}

void __44__HSRequest_requestURLForBaseURL_sessionID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  [NSString stringWithFormat:@"%@=%@", a2, a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

- (void)setValue:(id)a3 forArgument:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  arguments = self->_arguments;
  if (!arguments)
  {
    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v9 = self->_arguments;
    self->_arguments = v8;

    arguments = self->_arguments;
  }
  [(NSDictionary *)arguments setObject:v10 forKey:v6];
}

- (double)timeoutInterval
{
  return 60.0;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)HSRequest;
  v3 = [(HSRequest *)&v8 description];
  id v4 = v3;
  v5 = @"GET";
  if (self->_method == 1) {
    v5 = @"POST";
  }
  id v6 = [v3 stringByAppendingFormat:@" %@ [%@]", v5, self->_action];

  return v6;
}

- (HSRequest)initWithAction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HSRequest;
  v5 = [(HSRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    action = v5->_action;
    v5->_action = (NSString *)v6;
  }
  return v5;
}

+ (id)request
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"subclass must implement"];
  }
  id v3 = objc_alloc_init((Class)objc_opt_class());
  return v3;
}

@end