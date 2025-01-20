@interface NSAboutURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
- (void)startLoading;
@end

@implementation NSAboutURLProtocol

+ (id)canonicalRequestForRequest:(id)a3
{
  if (!a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", v5, 2u);
  }
  return a3;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  if (!a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "assertion failure", v5, 2u);
  }
  return [a3 _URLHasScheme:@"about"];
}

- (void)startLoading
{
  id v3 = [(NSURLProtocol *)self client];
  v4 = [[NSURLResponse alloc] initWithURL:[(NSURLRequest *)[(NSURLProtocol *)self request] URL] MIMEType:@"text/html" expectedContentLength:0 textEncodingName:0];
  [v3 URLProtocol:self didReceiveResponse:v4 cacheStoragePolicy:2];

  [v3 URLProtocolDidFinishLoading:self];
}

@end