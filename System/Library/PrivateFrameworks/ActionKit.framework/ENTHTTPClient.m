@interface ENTHTTPClient
- (ENTHTTPClient)initWithURL:(id)a3;
- (ENTHTTPClient)initWithURL:(id)a3 userAgent:(id)a4 timeout:(int)a5;
- (NSData)responseData;
- (NSMutableData)requestData;
- (NSString)userAgent;
- (NSURL)url;
- (id)newRequest;
- (int)readAll:(char *)a3 offset:(int)a4 length:(int)a5;
- (int)responseDataOffset;
- (int)timeout;
- (void)flush;
- (void)setRequestData:(id)a3;
- (void)setResponseData:(id)a3;
- (void)setResponseDataOffset:(int)a3;
- (void)setTimeout:(int)a3;
- (void)setUrl:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)write:(const char *)a3 offset:(unsigned int)a4 length:(unsigned int)a5;
@end

@implementation ENTHTTPClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setTimeout:(int)a3
{
  self->_timeout = a3;
}

- (int)timeout
{
  return self->_timeout;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setResponseDataOffset:(int)a3
{
  self->_responseDataOffset = a3;
}

- (int)responseDataOffset
{
  return self->_responseDataOffset;
}

- (void)setResponseData:(id)a3
{
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setRequestData:(id)a3
{
}

- (NSMutableData)requestData
{
  return self->_requestData;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)flush
{
  id v3 = [(ENTHTTPClient *)self newRequest];
  v4 = [(ENTHTTPClient *)self requestData];
  [v3 setHTTPBody:v4];

  id v17 = 0;
  id v18 = 0;
  v5 = [MEMORY[0x263EFC608] sendSynchronousRequest:v3 returningResponse:&v18 error:&v17];
  id v6 = v18;
  id v7 = v17;
  v8 = [(ENTHTTPClient *)self requestData];
  [v8 setLength:0];

  if (!v5)
  {
    id v10 = +[ENTException exceptionWithName:@"TTransportException" reason:@"Could not make HTTP request" error:v7];
    objc_exception_throw(v10);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [v11 stringWithFormat:@"Unexpected NSURLResponse type: %@", v13];
    id v15 = +[ENTException exceptionWithName:@"TTransportException" reason:v14];

    goto LABEL_8;
  }
  id v9 = v6;
  if ([v9 statusCode] != 200)
  {
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"Bad response from HTTP server: %ld", objc_msgSend(v9, "statusCode"));
    id v15 = +[ENTException exceptionWithName:@"TTransportException" reason:v16];

LABEL_8:
    objc_exception_throw(v15);
  }
  [(ENTHTTPClient *)self setResponseData:v5];
  [(ENTHTTPClient *)self setResponseDataOffset:0];
}

- (id)newRequest
{
  id v3 = objc_alloc(MEMORY[0x263EFC5E8]);
  v4 = [(ENTHTTPClient *)self url];
  v5 = (void *)[v3 initWithURL:v4];

  [v5 setHTTPMethod:@"POST"];
  [v5 setValue:@"application/x-thrift" forHTTPHeaderField:@"Content-Type"];
  [v5 setValue:@"application/x-thrift" forHTTPHeaderField:@"Accept"];
  uint64_t v6 = [(ENTHTTPClient *)self userAgent];
  if (v6) {
    id v7 = (__CFString *)v6;
  }
  else {
    id v7 = @"Cocoa/THTTPClient";
  }
  [v5 setValue:v7 forHTTPHeaderField:@"User-Agent"];
  [v5 setCachePolicy:1];
  if ([(ENTHTTPClient *)self timeout]) {
    objc_msgSend(v5, "setTimeoutInterval:", (double)-[ENTHTTPClient timeout](self, "timeout"));
  }

  return v5;
}

- (void)write:(const char *)a3 offset:(unsigned int)a4 length:(unsigned int)a5
{
  id v8 = [(ENTHTTPClient *)self requestData];
  [v8 appendBytes:&a3[a4] length:a5];
}

- (int)readAll:(char *)a3 offset:(int)a4 length:(int)a5
{
  uint64_t v9 = [(ENTHTTPClient *)self responseDataOffset];
  id v10 = [(ENTHTTPClient *)self responseData];
  objc_msgSend(v10, "getBytes:range:", &a3[a4], v9, a5);

  [(ENTHTTPClient *)self setResponseDataOffset:[(ENTHTTPClient *)self responseDataOffset] + a5];
  return a5;
}

- (ENTHTTPClient)initWithURL:(id)a3 userAgent:(id)a4 timeout:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENTHTTPClient;
  id v10 = [(ENTHTTPClient *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(ENTHTTPClient *)v10 setTimeout:v5];
    [(ENTHTTPClient *)v11 setUrl:v8];
    [(ENTHTTPClient *)v11 setUserAgent:v9];
    v12 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:1024];
    [(ENTHTTPClient *)v11 setRequestData:v12];
  }
  return v11;
}

- (ENTHTTPClient)initWithURL:(id)a3
{
  return [(ENTHTTPClient *)self initWithURL:a3 userAgent:0 timeout:0];
}

@end