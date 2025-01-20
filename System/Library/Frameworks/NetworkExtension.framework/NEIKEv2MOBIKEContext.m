@interface NEIKEv2MOBIKEContext
- (id)description;
- (id)initWithMOBIKEInterface:(void *)a3 mobikeEndpoint:(char)a4 invalidateTransport:(int)a5 maxRetries:(void *)a6 retryIntervalMilliseconds:(void *)a7 callbackQueue:(void *)a8 callback:;
- (void)sendCallbackSuccess:(void *)a3 session:(void *)a4 error:;
@end

@implementation NEIKEv2MOBIKEContext

- (id)initWithMOBIKEInterface:(void *)a3 mobikeEndpoint:(char)a4 invalidateTransport:(int)a5 maxRetries:(void *)a6 retryIntervalMilliseconds:(void *)a7 callbackQueue:(void *)a8 callback:
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)NEIKEv2MOBIKEContext;
    v19 = (id *)objc_msgSendSuper2(&v24, sel_initWithRequestType_, 4);
    a1 = v19;
    if (v19)
    {
      objc_setProperty_nonatomic_copy(v19, v20, v15, 32);
      objc_setProperty_nonatomic_copy(a1, v21, v16, 40);
      *((unsigned char *)a1 + 24) = a4;
      *((_DWORD *)a1 + 7) = a5;
      a1[6] = a6;
      objc_storeStrong(a1 + 7, a7);
      objc_setProperty_nonatomic_copy(a1, v22, v18, 64);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_mobikeEndpoint, 0);

  objc_storeStrong((id *)&self->_mobikeInterface, 0);
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self)
  {
    v4 = self->_mobikeInterface;
    mobikeEndpoint = self->_mobikeEndpoint;
  }
  else
  {
    v4 = 0;
    mobikeEndpoint = 0;
  }
  v6 = (void *)[v3 initWithFormat:@"mobike request to interface %@ with endpoint %@", v4, mobikeEndpoint];

  return v6;
}

- (void)sendCallbackSuccess:(void *)a3 session:(void *)a4 error:
{
  v7 = a3;
  id v8 = a4;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)NEIKEv2MOBIKEContext;
    objc_msgSendSuper2(&v21, sel_sendCallbackSuccess_session_, a2, v7);
    id v9 = a1[8];
    if (v9)
    {
      id v10 = v9;
      id v11 = a1[7];
      if (!v11)
      {
LABEL_7:

        goto LABEL_8;
      }
      if (!v7)
      {

        goto LABEL_6;
      }
      char v12 = v7[12];

      if ((v12 & 1) == 0)
      {
LABEL_6:
        id v13 = a1[8];
        objc_setProperty_nonatomic_copy(a1, v14, 0, 64);
        id v15 = a1[7];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __58__NEIKEv2MOBIKEContext_sendCallbackSuccess_session_error___block_invoke;
        v16[3] = &unk_1E5992418;
        id v17 = v7;
        id v19 = v13;
        char v20 = a2;
        id v18 = v8;
        id v10 = v13;
        dispatch_async(v15, v16);

        goto LABEL_7;
      }
    }
  }
LABEL_8:
}

uint64_t __58__NEIKEv2MOBIKEContext_sendCallbackSuccess_session_error___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!v1 || (*(unsigned char *)(v1 + 12) & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 48) + 16))(*(void *)(result + 48));
  }
  return result;
}

@end