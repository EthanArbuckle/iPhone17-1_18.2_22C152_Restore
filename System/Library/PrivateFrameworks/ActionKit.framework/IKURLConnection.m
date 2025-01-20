@interface IKURLConnection
- (IKURLConnection)initWithRequest:(id)a3 delegate:(id)a4 startImmediately:(BOOL)a5;
- (NSData)data;
- (NSHTTPURLResponse)response;
- (NSURLRequest)request;
- (id)_context;
- (id)userInfo;
- (int)type;
- (void)_appendData:(id)a3;
- (void)_setContext:(id)a3;
- (void)_setResponse:(id)a3;
- (void)_setType:(int)a3;
- (void)_setUserInfo:(id)a3;
- (void)dealloc;
@end

@implementation IKURLConnection

- (int)type
{
  return self->_type;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (id)_context
{
  return self->_context;
}

- (void)_setContext:(id)a3
{
  id context = self->_context;
  if (context != a3)
  {

    self->_id context = a3;
  }
}

- (void)_setType:(int)a3
{
  if (self->_type != a3) {
    self->_type = a3;
  }
}

- (void)_setResponse:(id)a3
{
  response = self->_response;
  if (response != a3)
  {

    self->_response = (NSHTTPURLResponse *)a3;
  }
}

- (void)_setUserInfo:(id)a3
{
  id userInfo = self->_userInfo;
  if (userInfo != a3)
  {

    self->_id userInfo = a3;
  }
}

- (void)_appendData:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IKURLConnection;
  [(NSURLConnection *)&v3 dealloc];
}

- (NSData)data
{
  return (NSData *)[MEMORY[0x263EFF8F8] dataWithData:self->_data];
}

- (IKURLConnection)initWithRequest:(id)a3 delegate:(id)a4 startImmediately:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)IKURLConnection;
  v6 = [(NSURLConnection *)&v8 initWithRequest:a3 delegate:a4 startImmediately:a5];
  if (v6)
  {
    v6->_request = (NSURLRequest *)a3;
    v6->_response = 0;
    v6->_data = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    v6->_id userInfo = 0;
    v6->_type = -1;
    v6->_id context = 0;
  }
  return v6;
}

@end