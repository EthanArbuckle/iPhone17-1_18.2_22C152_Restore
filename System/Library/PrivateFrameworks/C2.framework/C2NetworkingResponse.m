@interface C2NetworkingResponse
+ (id)responseFromRequest:(id)a3 statusCode:(int64_t)a4 headerFields:(id)a5 body:(id)a6;
+ (id)responseWithURLResponse:(id)a3 body:(id)a4;
- (NSData)body;
- (NSHTTPURLResponse)urlResponse;
@end

@implementation C2NetworkingResponse

+ (id)responseWithURLResponse:(id)a3 body:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    v10 = (void *)v8[1];
    v8[1] = v9;

    uint64_t v11 = [v7 copy];
    v12 = (void *)v8[2];
    v8[2] = v11;
  }
  return v8;
}

+ (id)responseFromRequest:(id)a3 statusCode:(int64_t)a4 headerFields:(id)a5 body:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_alloc_init((Class)a1);
  if (v13)
  {
    v14 = (void *)[v11 mutableCopy];
    v15 = v14;
    if (v14) {
      id v16 = v14;
    }
    else {
      id v16 = (id)objc_opt_new();
    }
    v17 = v16;

    v18 = [v10 valueForHTTPHeaderField:@"x-apple-request-uuid"];
    if (v18) {
      [v17 setObject:v18 forKeyedSubscript:@"x-apple-request-uuid"];
    }
    id v19 = objc_alloc(MEMORY[0x1E4F28D20]);
    v20 = [v10 URL];
    uint64_t v21 = [v19 initWithURL:v20 statusCode:a4 HTTPVersion:@"HTTP/1.1" headerFields:v17];
    v22 = (void *)v13[1];
    v13[1] = v21;

    uint64_t v23 = [v12 copy];
    v24 = (void *)v13[2];
    v13[2] = v23;
  }
  return v13;
}

- (NSHTTPURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (NSData)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
}

@end