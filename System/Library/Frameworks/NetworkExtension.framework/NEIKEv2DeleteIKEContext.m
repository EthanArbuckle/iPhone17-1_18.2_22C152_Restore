@interface NEIKEv2DeleteIKEContext
- (id)description;
- (id)initDeleteIKEWithResponse:(void *)a3 callbackQueue:(void *)a4 callback:;
- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4;
@end

@implementation NEIKEv2DeleteIKEContext

- (id)initDeleteIKEWithResponse:(void *)a3 callbackQueue:(void *)a4 callback:
{
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)NEIKEv2DeleteIKEContext;
    v10 = (id *)objc_msgSendSuper2(&v13, sel_initWithRequestType_, 7);
    a1 = v10;
    if (v10)
    {
      *((unsigned char *)v10 + 24) = a2;
      objc_storeStrong(v10 + 4, a3);
      objc_setProperty_nonatomic_copy(a1, v11, v9, 40);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)NEIKEv2DeleteIKEContext;
  [(NEIKEv2RequestContext *)&v15 sendCallbackSuccess:a3 session:a4];
  if (self)
  {
    id v6 = self->_callback;
    if (v6)
    {
      callbackQueue = self->_callbackQueue;

      if (callbackQueue)
      {
        id v8 = self->_callback;
        objc_setProperty_nonatomic_copy(self, v9, 0, 40);
        v10 = self->_callbackQueue;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __55__NEIKEv2DeleteIKEContext_sendCallbackSuccess_session___block_invoke;
        v12[3] = &unk_1E5992D40;
        id v13 = v8;
        BOOL v14 = a3;
        id v11 = v8;
        dispatch_async(v10, v12);
      }
    }
  }
}

uint64_t __55__NEIKEv2DeleteIKEContext_sendCallbackSuccess_session___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = @"NO";
  if (self && self->_responseNeeded) {
    v4 = @"YES";
  }
  v5 = (void *)[v3 initWithFormat:@"delete IKE, response %@", v4];

  return v5;
}

@end