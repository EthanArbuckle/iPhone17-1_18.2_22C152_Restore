@interface AFSiriAceRequest
- (AFSiriAceRequest)initWithStartLocalRequest:(id)a3 requestOptions:(unint64_t)a4;
- (AFSiriAceRequest)initWithStartRequest:(id)a3;
- (AFSiriAceRequest)initWithStartRequest:(id)a3 requestOptions:(unint64_t)a4;
- (void)performRequestWithCompletion:(id)a3;
@end

@implementation AFSiriAceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startLocalRequestData, 0);
  objc_storeStrong((id *)&self->_startRequestData, 0);
}

- (void)performRequestWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  if (self->_startRequestData)
  {
    *(_OWORD *)keys = xmmword_1E592B570;
    v18 = "request_options";
    xpc_object_t values = xpc_int64_create(4);
    v15 = self->_startRequestData;
    xpc_object_t v16 = xpc_uint64_create(self->_requestOptions);
    xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, &values, 3uLL);
    for (uint64_t i = 16; i != -8; i -= 8)
  }
  else
  {
    if (!self->_startLocalRequestData)
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
      goto LABEL_16;
    }
    *(_OWORD *)keys = xmmword_1E592B588;
    v18 = "request_options";
    xpc_object_t values = xpc_int64_create(5);
    v15 = self->_startLocalRequestData;
    xpc_object_t v16 = xpc_uint64_create(self->_requestOptions);
    xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, &values, 3uLL);
    for (uint64_t j = 16; j != -8; j -= 8)
  }
  uint64_t v9 = _ExternalRequestConnectionWithContext(0);
  v10 = (void *)v9;
  if (v6 && v9)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__AFSiriAceRequest_performRequestWithCompletion___block_invoke;
    handler[3] = &unk_1E592B530;
    v13 = v5;
    v12 = v10;
    xpc_connection_send_message_with_reply(v12, v6, 0, handler);
  }
  else
  {
    if (v5) {
      v5[2](v5, 0);
    }
    if (v10) {
      xpc_connection_cancel((xpc_connection_t)v10);
    }
  }

LABEL_16:
}

void __49__AFSiriAceRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3) {
    BOOL v4 = xpc_dictionary_get_BOOL(v3, "result");
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v4);
  }
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

- (AFSiriAceRequest)initWithStartLocalRequest:(id)a3 requestOptions:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSiriAceRequest;
  v7 = [(AFSiriAceRequest *)&v15 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v11 = (OS_xpc_object *)xpc_data_create((const void *)[v10 bytes], objc_msgSend(v10, "length"));
      startLocalRequestData = v7->_startLocalRequestData;
      v7->_startLocalRequestData = v11;
    }
    else
    {
      startLocalRequestData = v7->_startLocalRequestData;
      v7->_startLocalRequestData = 0;
    }

    startRequestData = v7->_startRequestData;
    v7->_startRequestData = 0;

    v7->_requestOptions = a4;
  }

  return v7;
}

- (AFSiriAceRequest)initWithStartRequest:(id)a3
{
  return [(AFSiriAceRequest *)self initWithStartRequest:a3 requestOptions:0];
}

- (AFSiriAceRequest)initWithStartRequest:(id)a3 requestOptions:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSiriAceRequest;
  v7 = [(AFSiriAceRequest *)&v15 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v11 = (OS_xpc_object *)xpc_data_create((const void *)[v10 bytes], objc_msgSend(v10, "length"));
      startRequestData = v7->_startRequestData;
      v7->_startRequestData = v11;
    }
    else
    {
      startRequestData = v7->_startRequestData;
      v7->_startRequestData = 0;
    }

    startLocalRequestData = v7->_startLocalRequestData;
    v7->_startLocalRequestData = 0;

    v7->_requestOptions = a4;
  }

  return v7;
}

@end