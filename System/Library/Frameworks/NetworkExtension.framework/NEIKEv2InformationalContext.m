@interface NEIKEv2InformationalContext
- (id)description;
- (id)initWithPrivateNotifies:(int)a3 maxRetries:(void *)a4 retryIntervalMilliseconds:(void *)a5 callbackQueue:(void *)a6 callback:;
- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4;
@end

@implementation NEIKEv2InformationalContext

- (id)initWithPrivateNotifies:(int)a3 maxRetries:(void *)a4 retryIntervalMilliseconds:(void *)a5 callbackQueue:(void *)a6 callback:
{
  id v12 = a2;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)NEIKEv2InformationalContext;
    v15 = (id *)objc_msgSendSuper2(&v18, sel_initWithRequestType_, 3);
    a1 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 4, a2);
      *((_DWORD *)a1 + 6) = a3;
      a1[5] = a4;
      objc_storeStrong(a1 + 6, a5);
      objc_setProperty_nonatomic_copy(a1, v16, v14, 56);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_privateNotifies, 0);
}

- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4
{
  BOOL v4 = a3;
  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NEIKEv2InformationalContext;
  [(NEIKEv2RequestContext *)&v18 sendCallbackSuccess:v4 session:v6];
  if (self)
  {
    id v7 = self->_callback;
    if (v7)
    {
      id v8 = v7;
      v9 = self->_callbackQueue;
      if (!v9)
      {
LABEL_7:

        goto LABEL_8;
      }
      if (!v6)
      {

        goto LABEL_6;
      }
      char v10 = v6[12];

      if ((v10 & 1) == 0)
      {
LABEL_6:
        id v11 = self->_callback;
        objc_setProperty_nonatomic_copy(self, v12, 0, 56);
        callbackQueue = self->_callbackQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __59__NEIKEv2InformationalContext_sendCallbackSuccess_session___block_invoke;
        block[3] = &unk_1E59922D8;
        v15 = v6;
        id v16 = v11;
        BOOL v17 = v4;
        id v8 = v11;
        dispatch_async(callbackQueue, block);

        goto LABEL_7;
      }
    }
  }
LABEL_8:
}

uint64_t __59__NEIKEv2InformationalContext_sendCallbackSuccess_session___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!v1 || (*(unsigned char *)(v1 + 12) & 1) == 0) {
    return (*(uint64_t (**)(void, void))(*(void *)(result + 40) + 16))(*(void *)(result + 40), *(unsigned __int8 *)(result + 48));
  }
  return result;
}

- (id)description
{
  v2 = self;
  if (self) {
    self = (NEIKEv2InformationalContext *)self->_privateNotifies;
  }
  uint64_t v3 = [(NEIKEv2InformationalContext *)self count];
  id v4 = [NSString alloc];
  if (v3)
  {
    if (v2)
    {
      uint64_t v5 = [(NSArray *)v2->_privateNotifies count];
      uint64_t maxRetries = v2->_maxRetries;
      unint64_t retryIntervalInMilliseconds = v2->_retryIntervalInMilliseconds;
    }
    else
    {
      uint64_t v5 = [0 count];
      uint64_t maxRetries = 0;
      unint64_t retryIntervalInMilliseconds = 0;
    }
    id v8 = objc_msgSend(v4, "initWithFormat:", @"%llu private notifies with %u retries at %llums", v5, maxRetries, retryIntervalInMilliseconds);
  }
  else
  {
    if (v2)
    {
      uint64_t v9 = v2->_maxRetries;
      unint64_t v10 = v2->_retryIntervalInMilliseconds;
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v10 = 0;
    }
    id v8 = objc_msgSend(v4, "initWithFormat:", @"keepalive with %u retries at %llums", v9, v10, v12);
  }

  return v8;
}

@end