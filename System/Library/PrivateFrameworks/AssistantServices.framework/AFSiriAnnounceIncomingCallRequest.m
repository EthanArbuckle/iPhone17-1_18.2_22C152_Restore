@interface AFSiriAnnounceIncomingCallRequest
- (AFSiriAnnounceIncomingCallRequest)initWithIncomingCall:(id)a3;
- (void)performRequestWithCompletion:(id)a3;
@end

@implementation AFSiriAnnounceIncomingCallRequest

- (void).cxx_destruct
{
}

- (void)performRequestWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    call = self->_call;
    *(_DWORD *)buf = 136315394;
    v30 = "-[AFSiriAnnounceIncomingCallRequest performRequestWithCompletion:]";
    __int16 v31 = 2112;
    v32 = call;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    if (!v4) {
      goto LABEL_24;
    }
  }
  else if (!v4)
  {
    goto LABEL_24;
  }
  if (+[AFFeatureFlags isAnnounceTelephonyEnabled])
  {
    v6 = self->_call;
    id v26 = 0;
    v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v26];
    id v8 = v26;
    if (v8 || !v7)
    {
      v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v20 = self->_call;
        *(_DWORD *)buf = 136315650;
        v30 = "-[AFSiriAnnounceIncomingCallRequest performRequestWithCompletion:]";
        __int16 v31 = 2112;
        v32 = v20;
        __int16 v33 = 2112;
        id v34 = v8;
        _os_log_error_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_ERROR, "%s Failed to serialize call %@: %@", buf, 0x20u);
      }
      v4[2](v4, 0);
      id v11 = 0;
    }
    else
    {
      id v9 = v7;
      xpc_object_t v10 = xpc_data_create((const void *)[v9 bytes], objc_msgSend(v9, "length"));
      keys[0] = "type";
      keys[1] = "incoming_call";
      values[0] = xpc_int64_create(7);
      id v11 = v10;
      values[1] = v11;
      xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
      uint64_t v13 = _ExternalRequestConnectionWithContext(0);
      v14 = (void *)v13;
      v15 = AFSiriLogContextConnection;
      if (v12 && v13)
      {
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          v21 = self->_call;
          *(_DWORD *)buf = 136315394;
          v30 = "-[AFSiriAnnounceIncomingCallRequest performRequestWithCompletion:]";
          __int16 v31 = 2112;
          v32 = v21;
          _os_log_debug_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_DEBUG, "%s Sending xpc message for %@", buf, 0x16u);
        }
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __66__AFSiriAnnounceIncomingCallRequest_performRequestWithCompletion___block_invoke;
        handler[3] = &unk_1E592B530;
        v25 = v4;
        v24 = v14;
        xpc_connection_send_message_with_reply(v24, v12, 0, handler);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          v22 = self->_call;
          *(_DWORD *)buf = 136315394;
          v30 = "-[AFSiriAnnounceIncomingCallRequest performRequestWithCompletion:]";
          __int16 v31 = 2112;
          v32 = v22;
          _os_log_error_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for %@", buf, 0x16u);
        }
        v4[2](v4, 0);
        if (v14) {
          xpc_connection_cancel((xpc_connection_t)v14);
        }
      }

      for (uint64_t i = 1; i != -1; --i)
    }
  }
  else
  {
    v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[AFSiriAnnounceIncomingCallRequest performRequestWithCompletion:]";
      _os_log_error_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_ERROR, "%s Announce Telephony is not enabled, rejecting request", buf, 0xCu);
    }
    v4[2](v4, 0);
  }
LABEL_24:
}

void __66__AFSiriAnnounceIncomingCallRequest_performRequestWithCompletion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (xdict) {
    xpc_dictionary_get_BOOL(xdict, "result");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3 = *(_xpc_connection_s **)(a1 + 32);
  xpc_connection_cancel(v3);
}

- (AFSiriAnnounceIncomingCallRequest)initWithIncomingCall:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriAnnounceIncomingCallRequest;
  v5 = [(AFSiriAnnounceIncomingCallRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    call = v5->_call;
    v5->_call = (AFSiriIncomingCall *)v6;
  }
  return v5;
}

@end