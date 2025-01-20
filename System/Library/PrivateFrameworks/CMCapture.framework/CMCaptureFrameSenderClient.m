@interface CMCaptureFrameSenderClient
- (BOOL)connectionIsValid;
- (CMCaptureFrameSenderClient)initWithConnection:(id)a3 queue:(id)a4;
- (int)pid;
- (int)sendXCPSampleBuffer:(id)a3;
- (void)_invalidate;
- (void)dealloc;
@end

@implementation CMCaptureFrameSenderClient

- (CMCaptureFrameSenderClient)initWithConnection:(id)a3 queue:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Need a connection and a queue" userInfo:0]);
  }
  v27.receiver = self;
  v27.super_class = (Class)CMCaptureFrameSenderClient;
  v5 = [(CMCaptureFrameSenderClient *)&v27 init];
  if (v5)
  {
    memset(&v38, 0, sizeof(v38));
    xpc_connection_get_audit_token();
    pid_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    audit_token_t token = v38;
    v8 = SecTaskCreateWithAuditToken(v7, &token);
    v9 = v8;
    if (!v8)
    {
      BOOL v15 = 0;
LABEL_23:
      if (dword_1EB4C5310)
      {
        int v31 = 0;
        LOBYTE(error) = 0;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v18 = v31;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, (os_log_type_t)error)) {
          unsigned int v19 = v18;
        }
        else {
          unsigned int v19 = v18 & 0xFFFFFFFE;
        }
        if (v19)
        {
          pid_t v20 = xpc_connection_get_pid((xpc_connection_t)a3);
          v38.val[0] = 136315651;
          *(void *)&v38.val[1] = "-[CMCaptureFrameSenderClient initWithConnection:queue:]";
          if (v15) {
            unsigned int v21 = 84;
          }
          else {
            unsigned int v21 = 70;
          }
          LOWORD(v38.val[3]) = 1025;
          *(unsigned int *)((char *)&v38.val[3] + 2) = v20;
          HIWORD(v38.val[4]) = 1025;
          v38.val[5] = v21;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v15)
      {
        v22 = (OS_xpc_object *)a3;
        queue = v5->_queue;
        v5->_connection = v22;
        v5->_queue = queue;
        v5->_pid_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
        v5->_connectionIsValid = 1;
        objc_initWeak((id *)&token, v5);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __55__CMCaptureFrameSenderClient_initWithConnection_queue___block_invoke;
        handler[3] = &unk_1E5C244A8;
        objc_copyWeak(&v26, (id *)&token);
        handler[4] = a3;
        xpc_connection_set_event_handler((xpc_connection_t)a3, handler);
        xpc_connection_activate((xpc_connection_t)a3);
        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)&token);
      }
      else
      {

        return 0;
      }
      return v5;
    }
    CFErrorRef error = 0;
    CFTypeRef v10 = SecTaskCopyValueForEntitlement(v8, @"com.apple.private.cmcapture.frame-receiver", &error);
    CFErrorRef v11 = error;
    if (error)
    {
      if (dword_1EB4C5310)
      {
        unsigned int v29 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v13 = v29;
        if (os_log_type_enabled(v12, type)) {
          unsigned int v14 = v13;
        }
        else {
          unsigned int v14 = v13 & 0xFFFFFFFE;
        }
        if (v14)
        {
          int v31 = 136315651;
          v32 = "_cfs_connectionHasEntitlement";
          __int16 v33 = 1025;
          pid_t v34 = pid;
          __int16 v35 = 2112;
          CFErrorRef v36 = error;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        CFErrorRef v11 = error;
      }
      CFRelease(v11);
      BOOL v15 = 0;
      CFErrorRef error = 0;
      if (!v10) {
        goto LABEL_22;
      }
    }
    else
    {
      if (!v10)
      {
        BOOL v15 = 0;
LABEL_22:
        CFRelease(v9);
        goto LABEL_23;
      }
      CFTypeID v16 = CFGetTypeID(v10);
      BOOL v15 = v16 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v10) != 0;
    }
    CFRelease(v10);
    goto LABEL_22;
  }
  return v5;
}

void __55__CMCaptureFrameSenderClient_initWithConnection_queue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MEMORY[0x1A62739E0](a2);
  if (v5 == MEMORY[0x1E4F145A8])
  {
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    else
    {
      BOOL v7 = a2 != (void *)MEMORY[0x1E4F14528] || WeakRetained == 0;
      if (!v7 && WeakRetained[28])
      {
        if (dword_1EB4C5310)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend(WeakRetained, "_invalidate", v9, v10);
      }
    }
  }
  else if (v5 == MEMORY[0x1E4F14590])
  {
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    xpc_dictionary_set_int64(reply, "errorReturn", 0);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    xpc_release(reply);
  }
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
  }
  v4.receiver = self;
  v4.super_class = (Class)CMCaptureFrameSenderClient;
  [(CMCaptureFrameSenderClient *)&v4 dealloc];
}

- (void)_invalidate
{
  if (self->_connectionIsValid)
  {
    xpc_connection_cancel(self->_connection);
    self->_connectionIsValid = 0;
  }
}

- (int)sendXCPSampleBuffer:(id)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "call", "frame-output-notification");
  if (a3) {
    xpc_dictionary_set_value(v5, "sample-buffer", a3);
  }
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(self->_connection, v5);
  if (v6)
  {
    BOOL v7 = v6;
    uint64_t v8 = MEMORY[0x1A62739E0]();
    int int64 = 0;
    if (a3)
    {
      if (v8 == MEMORY[0x1E4F14590] && MEMORY[0x1E4F145A8] != MEMORY[0x1E4F14590]) {
        int int64 = xpc_dictionary_get_int64(v7, "errorReturn");
      }
    }
    xpc_release(v7);
  }
  else
  {
    int int64 = 0;
  }
  xpc_release(v5);
  return int64;
}

- (BOOL)connectionIsValid
{
  return self->_connectionIsValid;
}

- (int)pid
{
  return self->_pid;
}

@end