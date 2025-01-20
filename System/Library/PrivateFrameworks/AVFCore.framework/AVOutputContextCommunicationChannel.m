@interface AVOutputContextCommunicationChannel
- (AVOutputContextCommunicationChannel)init;
- (AVOutputContextCommunicationChannel)initWithOutputContextCommunicationChannelImpl:(id)a3;
- (AVOutputContextCommunicationChannelImpl)impl;
- (__CFString)commChannelUUID;
- (void)dealloc;
- (void)sendData:(id)a3 completionHandler:(id)a4;
@end

@implementation AVOutputContextCommunicationChannel

- (AVOutputContextCommunicationChannel)init
{
  v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available", v2, v3, v4, v5, v6, v8), 0 reason userInfo];
  objc_exception_throw(v7);
}

- (AVOutputContextCommunicationChannel)initWithOutputContextCommunicationChannelImpl:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVOutputContextCommunicationChannel;
  uint64_t v4 = [(AVOutputContextCommunicationChannel *)&v9 init];
  if (v4
    && (uint64_t v5 = objc_alloc_init(AVOutputContextCommunicationChannelInternal), (v4->_ivars = v5) != 0)
    && (v4->_ivars->impl = (AVOutputContextCommunicationChannelImpl *)a3, (impl = v4->_ivars->impl) != 0))
  {
    [(AVOutputContextCommunicationChannelImpl *)impl setParentCommunicationChannel:v4];
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  ivars = self->_ivars;
  if (ivars)
  {

    ivars = self->_ivars;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVOutputContextCommunicationChannel;
  [(AVOutputContextCommunicationChannel *)&v4 dealloc];
}

- (AVOutputContextCommunicationChannelImpl)impl
{
  return self->_ivars->impl;
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVOutputContextCommunicationChannelImpl *)[(AVOutputContextCommunicationChannel *)self impl] sendData:a3 completionHandler:a4];
}

- (__CFString)commChannelUUID
{
  uint64_t v2 = [(AVOutputContextCommunicationChannel *)self impl];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return (__CFString *)[(AVOutputContextCommunicationChannelImpl *)v2 commChannelUUID];
}

@end