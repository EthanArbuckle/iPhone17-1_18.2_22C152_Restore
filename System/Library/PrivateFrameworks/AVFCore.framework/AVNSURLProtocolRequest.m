@interface AVNSURLProtocolRequest
- (AVAssetCustomURLBridgeForNSURLProtocol)bridge;
- (_CFURLConnection)connection;
- (void)dealloc;
- (void)setBridge:(id)a3;
- (void)setConnection:(_CFURLConnection *)a3;
@end

@implementation AVNSURLProtocolRequest

- (void)dealloc
{
  connection = self->_connection;
  if (connection) {
    CFRelease(connection);
  }
  error = self->_error;
  if (error) {
    CFRelease(error);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVNSURLProtocolRequest;
  [(AVAssetCustomURLRequest *)&v5 dealloc];
}

- (_CFURLConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(_CFURLConnection *)a3
{
  connection = self->_connection;
  self->_connection = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (connection)
  {
    CFRelease(connection);
  }
}

- (AVAssetCustomURLBridgeForNSURLProtocol)bridge
{
  return (AVAssetCustomURLBridgeForNSURLProtocol *)objc_loadWeak((id *)&self->_bridge);
}

- (void)setBridge:(id)a3
{
}

- (void).cxx_destruct
{
}

@end