@interface HAPCoreUtilsHTTPClient
- (HAPCoreUtilsHTTPClient)initWithQueue:(id)a3;
- (int)getPeerAddress:(void *)a3 maxLength:(unint64_t)a4 outLength:(unint64_t *)a5;
- (int)sendMessage:(HTTPMessagePrivate *)a3;
- (int)setDestination:(const char *)a3 port:(int)a4;
- (int)setProperty:(__CFString *)a3 value:(void *)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setDebugDelegate:(id *)a3;
- (void)setDelegate:(id *)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3 mask:(unsigned int)a4;
- (void)setTimeoutInSeconds:(int)a3;
- (void)setTransportDelegate:(id *)a3;
@end

@implementation HAPCoreUtilsHTTPClient

- (void)dealloc
{
  [(HAPCoreUtilsHTTPClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HAPCoreUtilsHTTPClient;
  [(HAPCoreUtilsHTTPClient *)&v3 dealloc];
}

- (int)getPeerAddress:(void *)a3 maxLength:(unint64_t)a4 outLength:(unint64_t *)a5
{
  if (self->_httpClient) {
    return MEMORY[0x1F4116418]();
  }
  else {
    return -6718;
  }
}

- (int)sendMessage:(HTTPMessagePrivate *)a3
{
  return MEMORY[0x1F4116430](self->_httpClient, a3);
}

- (void)invalidate
{
  if (self->_httpClient)
  {
    HTTPClientInvalidate();
    CFRelease(self->_httpClient);
    self->_httpClient = 0;
  }
}

- (void)setDebugDelegate:(id *)a3
{
}

- (void)setTransportDelegate:(id *)a3
{
}

- (void)setDelegate:(id *)a3
{
}

- (int)setDestination:(const char *)a3 port:(int)a4
{
  return MEMORY[0x1F4116450](self->_httpClient, a3, *(void *)&a4);
}

- (void)setTimeoutInSeconds:(int)a3
{
}

- (void)setFlags:(unsigned int)a3 mask:(unsigned int)a4
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (int)setProperty:(__CFString *)a3 value:(void *)a4
{
  return MEMORY[0x1F4116C78](self->_httpClient, a3, a4);
}

- (HAPCoreUtilsHTTPClient)initWithQueue:(id)a3
{
  id v4 = a3;
  v10 = 0;
  if (HTTPClientCreate())
  {
    v5 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HAPCoreUtilsHTTPClient;
    v6 = [(HAPCoreUtilsHTTPClient *)&v9 init];
    v7 = v6;
    if (v6)
    {
      v6->_httpClient = v10;
      [(HAPCoreUtilsHTTPClient *)v6 setDispatchQueue:v4];
    }
    self = v7;
    v5 = self;
  }

  return v5;
}

@end