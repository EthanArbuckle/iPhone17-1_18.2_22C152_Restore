@interface NEIKEv2RequestContext
- (NEIKEv2RequestContext)initWithRequestType:(int)a3;
- (id)description;
- (void)dealloc;
- (void)releasePowerAssertionIfNeeded;
- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4;
@end

@implementation NEIKEv2RequestContext

- (void).cxx_destruct
{
}

- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4
{
  v5 = a4;
  -[NEIKEv2RequestContext releasePowerAssertionIfNeeded]((uint64_t)self);
  if (self && self->_requestInitiator)
  {
    if (v5)
    {
      v5[15] = 0;
      Property = objc_getProperty(v5, v6, 368, 1);
    }
    else
    {
      Property = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__NEIKEv2RequestContext_sendCallbackSuccess_session___block_invoke;
    block[3] = &unk_1E59932C0;
    v9 = v5;
    dispatch_async(Property, block);
  }
}

- (void)releasePowerAssertionIfNeeded
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a1 && *(void *)(a1 + 16))
  {
    v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 16);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating power assertion %@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 16) invalidate];
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;
  }
}

void __53__NEIKEv2RequestContext_sendCallbackSuccess_session___block_invoke(uint64_t a1, const char *a2)
{
}

- (id)description
{
  if (self) {
    LODWORD(self) = self->_requestType;
  }
  v2 = NEIKEv2RequestContextTypeString(self);

  return v2;
}

- (void)dealloc
{
  -[NEIKEv2RequestContext releasePowerAssertionIfNeeded]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2RequestContext;
  [(NEIKEv2RequestContext *)&v3 dealloc];
}

- (NEIKEv2RequestContext)initWithRequestType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NEIKEv2RequestContext;
  result = [(NEIKEv2RequestContext *)&v5 init];
  if (result) {
    result->_requestType = a3;
  }
  return result;
}

@end