@interface AFSiriHomeAutomationBackgroundRequest
- (AFSiriHomeAutomationBackgroundRequest)initWithRequestInfo:(id)a3;
- (AFSiriHomeAutomationBackgroundRequest)initWithRequestInfo:(id)a3 instanceContext:(id)a4;
- (void)performRequestWithCompletion:(id)a3;
@end

@implementation AFSiriHomeAutomationBackgroundRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
}

- (void)performRequestWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    requestInfo = self->_requestInfo;
    *(_DWORD *)buf = 136315394;
    v29 = "-[AFSiriHomeAutomationBackgroundRequest performRequestWithCompletion:]";
    __int16 v30 = 2112;
    v31 = requestInfo;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Performing request for HomeAutomationBackgroundRequest: %@", buf, 0x16u);
  }
  v6 = self->_requestInfo;
  if (v6)
  {
    id v25 = 0;
    v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v25];
    id v8 = v25;
    if (v8 || !v7)
    {
      v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v19 = self->_requestInfo;
        *(_DWORD *)buf = 136315650;
        v29 = "-[AFSiriHomeAutomationBackgroundRequest performRequestWithCompletion:]";
        __int16 v30 = 2112;
        v31 = v19;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_error_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_ERROR, "%s Failed to serialize asyncMessage %@: %@", buf, 0x20u);
      }
      v4[2](v4, 0);
      id v11 = 0;
      goto LABEL_22;
    }
    id v9 = v7;
    xpc_object_t v10 = xpc_data_create((const void *)[v9 bytes], objc_msgSend(v9, "length"));
    *(_OWORD *)keys = xmmword_1E592B5A0;
    values[0] = xpc_int64_create(8);
    id v11 = v10;
    values[1] = v11;
    xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    uint64_t v13 = _ExternalRequestConnectionWithContext(self->_instanceContext);
    v14 = (void *)v13;
    v15 = AFSiriLogContextConnection;
    if (v12 && v13)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v20 = self->_requestInfo;
        *(_DWORD *)buf = 136315394;
        v29 = "-[AFSiriHomeAutomationBackgroundRequest performRequestWithCompletion:]";
        __int16 v30 = 2112;
        v31 = v20;
        _os_log_debug_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_DEBUG, "%s Sending xpc message with requestInfo: %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __70__AFSiriHomeAutomationBackgroundRequest_performRequestWithCompletion___block_invoke;
      handler[3] = &unk_1E592B530;
      v24 = v4;
      v23 = v14;
      xpc_connection_send_message_with_reply(v23, v12, 0, handler);

LABEL_20:
      for (uint64_t i = 1; i != -1; --i)

LABEL_22:
      goto LABEL_23;
    }
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_requestInfo;
      *(_DWORD *)buf = 136315394;
      v29 = "-[AFSiriHomeAutomationBackgroundRequest performRequestWithCompletion:]";
      __int16 v30 = 2112;
      v31 = v21;
      _os_log_error_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for %@", buf, 0x16u);
      if (!v4)
      {
LABEL_18:
        if (v14) {
          xpc_connection_cancel((xpc_connection_t)v14);
        }
        goto LABEL_20;
      }
    }
    else if (!v4)
    {
      goto LABEL_18;
    }
    v4[2](v4, 0);
    goto LABEL_18;
  }
  v4[2](v4, 0);
LABEL_23:
}

void __70__AFSiriHomeAutomationBackgroundRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
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

- (AFSiriHomeAutomationBackgroundRequest)initWithRequestInfo:(id)a3 instanceContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[AFSiriHomeAutomationBackgroundRequest initWithRequestInfo:instanceContext:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s Initializing HomeAutomationBackgroundRequest with requestInfo: %@ and AFInstanceContext: %@", buf, 0x20u);
  }
  v13.receiver = self;
  v13.super_class = (Class)AFSiriHomeAutomationBackgroundRequest;
  id v9 = [(AFSiriHomeAutomationBackgroundRequest *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    requestInfo = v9->_requestInfo;
    v9->_requestInfo = (AFSiriHomeAutomationRequestInfo *)v10;

    objc_storeStrong((id *)&v9->_instanceContext, a4);
  }

  return v9;
}

- (AFSiriHomeAutomationBackgroundRequest)initWithRequestInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[AFInstanceContext defaultContext];
  id v6 = [(AFSiriHomeAutomationBackgroundRequest *)self initWithRequestInfo:v4 instanceContext:v5];

  return v6;
}

@end