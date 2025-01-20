@interface __NSCFURLProtocolClient_NS
- (id)challenge;
- (void)URLProtocol:(id)a3 cachedResponseIsValid:(id)a4;
- (void)URLProtocol:(id)a3 didFailWithError:(id)a4;
- (void)URLProtocol:(id)a3 didLoadData:(id)a4;
- (void)URLProtocol:(id)a3 didReceiveAuthenticationChallenge:(id)a4;
- (void)URLProtocol:(id)a3 didReceiveResponse:(id)a4 cacheStoragePolicy:(unint64_t)a5;
- (void)URLProtocol:(id)a3 wasRedirectedToRequest:(id)a4 redirectResponse:(id)a5;
- (void)URLProtocolDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)withCustomProtocolScheduling:(void *)a1;
@end

@implementation __NSCFURLProtocolClient_NS

- (void)URLProtocol:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  objc_sync_enter(self);
  self->_challenge = (NSURLAuthenticationChallenge *)a4;
  self->_cfChallenge = (_CFURLAuthChallenge *)[a4 _createCFAuthChallenge];
  objc_sync_exit(self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76____NSCFURLProtocolClient_NS_URLProtocol_didReceiveAuthenticationChallenge___block_invoke;
  v6[3] = &unk_1E5258228;
  v6[4] = self;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v6);
}

- (void)withCustomProtocolScheduling:(void *)a1
{
  if (a1)
  {
    if (-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sOnce != -1) {
      dispatch_once(&-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sOnce, &__block_literal_global);
    }
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke_2;
    v6[3] = &unk_1E5257B28;
    v6[4] = &v7;
    CoreSchedulingSet::applyBlock(-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling, v6);
    if (*((unsigned char *)v8 + 24))
    {
      (*(void (**)(uint64_t))(a2 + 16))(a2);
    }
    else
    {
      id v4 = a1;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __59____NSCFURLProtocolClient_NS_withCustomProtocolScheduling___block_invoke_3;
      v5[3] = &unk_1E5258028;
      v5[4] = a1;
      v5[5] = a2;
      (*(void (**)(uint64_t, void *))(*(void *)-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling
                                                + 96))(-[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:]::sProtocolScheduling, v5);
    }
    _Block_object_dispose(&v7, 8);
  }
}

- (void)URLProtocol:(id)a3 didFailWithError:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59____NSCFURLProtocolClient_NS_URLProtocol_didFailWithError___block_invoke;
  v4[3] = &unk_1E5257FB0;
  v4[4] = self;
  v4[5] = a4;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v4);
}

- (void)URLProtocolDidFinishLoading:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58____NSCFURLProtocolClient_NS_URLProtocolDidFinishLoading___block_invoke;
  v3[3] = &unk_1E5258228;
  v3[4] = self;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v3);
}

- (void)URLProtocol:(id)a3 didLoadData:(id)a4
{
  if (a4)
  {
    uint64_t v6 = objc_msgSend(a4, "length", a3);
    if (v6)
    {
      uint64_t v7 = v6;
      CFDataRef Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDataRef)a4);
      if (Copy)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __54____NSCFURLProtocolClient_NS_URLProtocol_didLoadData___block_invoke;
        v9[3] = &unk_1E5255EB0;
        v9[4] = self;
        v9[5] = Copy;
        v9[6] = v7;
        -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v9);
      }
    }
  }
}

- (void)URLProtocol:(id)a3 didReceiveResponse:(id)a4 cacheStoragePolicy:(unint64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80____NSCFURLProtocolClient_NS_URLProtocol_didReceiveResponse_cacheStoragePolicy___block_invoke;
  v5[3] = &unk_1E5257B78;
  v5[4] = self;
  v5[5] = a4;
  void v5[6] = a5;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v5);
}

- (void)URLProtocol:(id)a3 cachedResponseIsValid:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64____NSCFURLProtocolClient_NS_URLProtocol_cachedResponseIsValid___block_invoke;
  v4[3] = &unk_1E5257FB0;
  v4[4] = self;
  v4[5] = a4;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v4);
}

- (void)URLProtocol:(id)a3 wasRedirectedToRequest:(id)a4 redirectResponse:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82____NSCFURLProtocolClient_NS_URLProtocol_wasRedirectedToRequest_redirectResponse___block_invoke;
  v5[3] = &unk_1E52582F0;
  v5[4] = self;
  v5[5] = a4;
  void v5[6] = a5;
  -[__NSCFURLProtocolClient_NS withCustomProtocolScheduling:](self, (uint64_t)v5);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)__NSCFURLProtocolClient_NS;
  [(__NSCFURLProtocolClient_NS *)&v2 dealloc];
}

- (id)challenge
{
  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    id v2 = v1[3];
    objc_sync_exit(v1);
    return (id *)v2;
  }
  return result;
}

@end