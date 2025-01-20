@interface AVOutputDeviceCommunicationChannel
- (AVOutputDeviceCommunicationChannel)initWithOutputDeviceCommunicationChannelImpl:(id)a3;
- (AVOutputDeviceCommunicationChannelDelegate)delegate;
- (void)close;
- (void)communicationChannelImpl:(id)a3 didReceiveData:(id)a4;
- (void)communicationChannelImplDidClose:(id)a3;
- (void)dealloc;
- (void)sendData:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AVOutputDeviceCommunicationChannel

- (AVOutputDeviceCommunicationChannel)initWithOutputDeviceCommunicationChannelImpl:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceCommunicationChannel;
  v4 = [(AVOutputDeviceCommunicationChannel *)&v8 init];
  if (v4 && (id v5 = a3, (v4->_impl = (AVOutputDeviceCommunicationChannelImpl *)v5) != 0))
  {
    [v5 setParentChannel:v4];
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceCommunicationChannel;
  [(AVOutputDeviceCommunicationChannel *)&v3 dealloc];
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
}

- (void)close
{
}

- (void)setDelegate:(id)a3
{
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVOutputDeviceCommunicationChannelDelegate)delegate
{
  return (AVOutputDeviceCommunicationChannelDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)communicationChannelImpl:(id)a3 didReceiveData:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(Weak, "communicationChannel:didReceiveData:", self, a4, v9, v10);
  }
  else if (dword_1EB2D3A40)
  {
    objc_super v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)communicationChannelImplDidClose:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(Weak, "communicationChannelDidClose:", self, v7, v8);
  }
  else if (dword_1EB2D3A40)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void).cxx_destruct
{
}

@end