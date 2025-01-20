@interface NWURLLoaderAbout
- (BOOL)allowsWrite;
- (BOOL)requestComplete;
- (NSString)multipartMixedReplaceBoundary;
- (OS_nw_connection)underlyingConnection;
- (OS_nw_http_fields)trailerFields;
- (OS_sec_trust)peerTrust;
- (id)initWithURL:(id *)a1;
- (id)takeCachedResponse;
- (void)notifyRequestCompletion:(id)a3;
- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)readResponse:(id)a3;
- (void)start:(id)a3;
- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation NWURLLoaderAbout

- (void).cxx_destruct
{
}

- (OS_nw_connection)underlyingConnection
{
  result = (OS_nw_connection *)_os_crash();
  __break(1u);
  return result;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  _os_crash();
  __break(1u);
}

- (BOOL)allowsWrite
{
  return 0;
}

- (OS_nw_http_fields)trailerFields
{
  return 0;
}

- (id)takeCachedResponse
{
  return 0;
}

- (void)notifyRequestCompletion:(id)a3
{
}

- (BOOL)requestComplete
{
  return 1;
}

- (OS_sec_trust)peerTrust
{
  return 0;
}

- (NSString)multipartMixedReplaceBoundary
{
  return 0;
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)readResponse:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F18DB0];
  v5 = (void (**)(id, id, void))a3;
  id v6 = [v4 alloc];
  if (self) {
    URL = self->_URL;
  }
  else {
    URL = 0;
  }
  id v8 = (id)[v6 initWithURL:URL MIMEType:@"text/html" expectedContentLength:0 textEncodingName:0];
  v5[2](v5, v8, 0);
}

- (void)start:(id)a3
{
}

- (id)initWithURL:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NWURLLoaderAbout;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

@end