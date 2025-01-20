@interface NSURLResponseInternal
- (NSURLResponseInternal)init;
- (URLResponse)_inner;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NSURLResponseInternal

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  self->_response._vptr$CoreLoggable = (void **)&unk_1ECF9B3C0;
  self->_response.fMIMEType = 0;
  self->_response.fPeerAddress = 0;
  self->_response.fHTTP = 0;
  self->_response.fExpectedContentLength = -1;
  self->_response.fCreationTime = CFAbsoluteTimeGetCurrent();
  self->_response.fExpiration = 1.79769313e308;
  self->_response.fRecommendedPolicy = 0;
  *(_WORD *)&self->_response.fConnectionDidFallback = 0;
  return self;
}

- (URLResponse)_inner
{
  return &self->_response;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NSURLResponseInternal;
  [(NSURLResponseInternal *)&v2 dealloc];
}

- (NSURLResponseInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLResponseInternal;
  return [(NSURLResponseInternal *)&v3 init];
}

@end