@interface AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl
- (AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl)initWithRemoteControlSession:(OpaqueFigEndpointRemoteControlSession *)a3;
- (AVOutputDeviceCommunicationChannel)parentChannel;
- (void)_didCloseCommunicationChannel;
- (void)_didReceiveData:(id)a3;
- (void)close;
- (void)dealloc;
- (void)sendData:(id)a3 completionHandler:(id)a4;
- (void)setParentChannel:(id)a3;
@end

@implementation AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl

- (AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl)initWithRemoteControlSession:(OpaqueFigEndpointRemoteControlSession *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl;
  v4 = [(AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *)&v10 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  if (a3)
  {
    a3 = (OpaqueFigEndpointRemoteControlSession *)CFRetain(a3);
    v5->_remoteControlSession = a3;
    if (a3)
    {
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      v8 = *(unsigned int (**)(OpaqueFigEndpointRemoteControlSession *, void (*)(uint64_t, uint64_t, uint64_t, void *), AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *))(v7 + 16);
      if (v8 && !v8(a3, AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImplHandleEvent, v5))
      {
        a3 = v5;
        goto LABEL_12;
      }
LABEL_11:
      a3 = 0;
    }
  }
  else
  {
    v4->_remoteControlSession = 0;
  }
LABEL_12:

  return (AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *)a3;
}

- (void)dealloc
{
  [(AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *)self close];
  remoteControlSession = self->_remoteControlSession;
  if (remoteControlSession) {
    CFRelease(remoteControlSession);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl;
  [(AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *)&v4 dealloc];
}

- (void)_didReceiveData:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVOutputDeviceCommunicationChannel *)[(AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *)self parentChannel] communicationChannelImpl:self didReceiveData:a3];
}

- (void)_didCloseCommunicationChannel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(AVOutputDeviceCommunicationChannel *)[(AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImpl *)self parentChannel] communicationChannelImplDidClose:self];
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = [a4 copy];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  remoteControlSession = self->_remoteControlSession;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(void (**)(OpaqueFigEndpointRemoteControlSession *, id, void (*)(signed int, uint64_t, void (**)(void, void)), uint64_t))(v10 + 8);
  if (v11) {
    v11(remoteControlSession, a3, AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImplSendDataCompletion, v6);
  }
}

- (void)close
{
  remoteControlSession = self->_remoteControlSession;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(OpaqueFigEndpointRemoteControlSession *, void, void))(v5 + 16);
  if (v6) {
    v6(remoteControlSession, 0, 0);
  }
  uint64_t v7 = self->_remoteControlSession;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigEndpointRemoteControlSession *))(v9 + 24);
  if (v10)
  {
    v10(v7);
  }
}

- (AVOutputDeviceCommunicationChannel)parentChannel
{
  return (AVOutputDeviceCommunicationChannel *)objc_loadWeak((id *)&self->_parentChannel);
}

- (void)setParentChannel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end