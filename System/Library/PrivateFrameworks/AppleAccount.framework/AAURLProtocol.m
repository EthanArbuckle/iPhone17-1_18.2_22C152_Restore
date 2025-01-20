@interface AAURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)canonicalRequestForRequest:(id)a3;
- (AAURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (id)_normalizedRequestForURL:(id)a3;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation AAURLProtocol

- (AAURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"AAURLProtocol.m", 35, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)AAURLProtocol;
  v12 = [(NSURLProtocol *)&v16 initWithRequest:v9 cachedResponse:v10 client:v11];
  v13 = v12;
  if (v12) {
    v12->_state = 0;
  }

  return v13;
}

- (id)_normalizedRequestForURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"AAURLProtocol.m", 46, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  v6 = [(NSURLProtocol *)self request];
  v7 = (void *)[v6 mutableCopy];

  [v7 setURL:v5];
  v8 = (void *)[v7 copy];

  return v8;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"AAURLProtocol.m", 55, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v6 = [v5 URL];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 scheme];
    BOOL v9 = [v8 compare:@"x-appleaccount" options:1] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;

  return v3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AAURLProtocol;
  return objc_msgSendSuper2(&v5, sel_requestIsCacheEquivalent_toRequest_, a3, a4);
}

- (void)startLoading
{
  if (self->_state)
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AAURLProtocol.m", 74, @"%s Called with an active request!", "-[AAURLProtocol startLoading]");
  }
  self->_state = 1;
  id v3 = +[AARemoteServer sharedServer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__AAURLProtocol_startLoading__block_invoke;
  v6[3] = &unk_1E5A49E08;
  v6[4] = self;
  [v3 _configurationAndResponseWithCompletion:v6];
}

void __29__AAURLProtocol_startLoading__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v19 = a2;
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = *(void **)(a1 + 32);
  if (v19)
  {
    id v10 = [v9 request];
    id v11 = [v10 URL];
    v12 = objc_msgSend(v11, "aa_endpoint");
    v13 = [v19 urlForEndpoint:v12];

    v14 = *(void **)(a1 + 32);
    if (v13)
    {
      v15 = [v14 request];
      objc_super v16 = (void *)[v15 mutableCopy];

      [v16 setURL:v13];
      v17 = [*(id *)(a1 + 32) client];
      [v17 URLProtocol:*(void *)(a1 + 32) wasRedirectedToRequest:v16 redirectResponse:v7];
    }
    else
    {
      objc_super v16 = [v14 client];
      uint64_t v18 = *(void *)(a1 + 32);
      v17 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4401);
      [v16 URLProtocol:v18 didFailWithError:v17];
    }
  }
  else
  {
    v13 = [v9 client];
    [v13 URLProtocol:*(void *)(a1 + 32) didFailWithError:v8];
  }
}

- (void)stopLoading
{
  if (self->_state != 1)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AAURLProtocol.m", 96, @"%s Called without an active request!", "-[AAURLProtocol stopLoading]");
  }
  self->_state = 2;
}

@end