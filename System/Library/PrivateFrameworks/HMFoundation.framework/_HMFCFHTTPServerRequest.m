@interface _HMFCFHTTPServerRequest
- (NSMutableData)bodyData;
- (_CFHTTPServerRequest)requestRef;
- (_HMFCFHTTPServerConnection)connection;
- (_HMFCFHTTPServerRequest)init;
- (_HMFCFHTTPServerRequest)initWithConnection:(id)a3 requestRef:(_CFHTTPServerRequest *)a4;
- (__CFReadStream)bodyStream;
- (id)URL;
- (id)attributeDescriptions;
- (id)body;
- (id)headerFields;
- (id)method;
- (id)responseWithStatusCode:(int64_t)a3;
- (void)appendBodyData:(id)a3;
- (void)dealloc;
- (void)setBody:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setMethod:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation _HMFCFHTTPServerRequest

- (_HMFCFHTTPServerRequest)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (_HMFCFHTTPServerRequest)initWithConnection:(id)a3 requestRef:(_CFHTTPServerRequest *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HMFCFHTTPServerRequest;
  id v7 = [(HMFHTTPRequestInternal *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_connection, v6);
    v8->_requestRef = (_CFHTTPServerRequest *)CFRetain(a4);
    v8->_bodyStream = (__CFReadStream *)_CFHTTPServerRequestCopyBodyStream();
    uint64_t v9 = [MEMORY[0x1E4F1CA58] data];
    bodyData = v8->_bodyData;
    v8->_bodyData = (NSMutableData *)v9;
  }
  return v8;
}

- (void)dealloc
{
  requestRef = self->_requestRef;
  if (requestRef)
  {
    CFRelease(requestRef);
    self->_requestRef = 0;
  }
  bodyStream = self->_bodyStream;
  if (bodyStream)
  {
    CFReadStreamClose(bodyStream);
    CFRelease(self->_bodyStream);
    self->_bodyStream = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_HMFCFHTTPServerRequest;
  [(_HMFCFHTTPServerRequest *)&v5 dealloc];
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [HMFAttributeDescription alloc];
  v4 = [NSString stringWithFormat:@"%@", -[_HMFCFHTTPServerRequest requestRef](self, "requestRef")];
  objc_super v5 = [(HMFAttributeDescription *)v3 initWithName:@"Request" value:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)responseWithStatusCode:(int64_t)a3
{
  uint64_t v3 = [[_HMFCFHTTPServerResponse alloc] initWithRequest:self statusCode:a3];
  return v3;
}

- (void)appendBodyData:(id)a3
{
}

- (id)URL
{
  [(_HMFCFHTTPServerRequest *)self requestRef];
  v2 = (void *)_CFHTTPServerRequestCopyProperty();
  return v2;
}

- (id)method
{
  [(_HMFCFHTTPServerRequest *)self requestRef];
  v2 = (void *)_CFHTTPServerRequestCopyProperty();
  return v2;
}

- (id)headerFields
{
  [(_HMFCFHTTPServerRequest *)self requestRef];
  v2 = (void *)_CFHTTPServerRequestCopyProperty();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F18EA0]];
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v3;
}

- (id)body
{
  uint64_t v3 = [(_HMFCFHTTPServerRequest *)self bodyData];
  uint64_t v4 = [v3 length];

  if (v4) {
    objc_super v5 = (void *)[(NSMutableData *)self->_bodyData copy];
  }
  else {
    objc_super v5 = 0;
  }
  return v5;
}

- (void)setURL:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setMethod:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setHeaders:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setBody:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (_CFHTTPServerRequest)requestRef
{
  return self->_requestRef;
}

- (__CFReadStream)bodyStream
{
  return self->_bodyStream;
}

- (_HMFCFHTTPServerConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (_HMFCFHTTPServerConnection *)WeakRetained;
}

- (NSMutableData)bodyData
{
  return self->_bodyData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_destroyWeak((id *)&self->_connection);
}

@end