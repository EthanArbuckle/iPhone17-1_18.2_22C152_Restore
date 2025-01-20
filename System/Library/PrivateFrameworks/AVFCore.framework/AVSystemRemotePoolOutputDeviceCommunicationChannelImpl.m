@interface AVSystemRemotePoolOutputDeviceCommunicationChannelImpl
- (AVOutputDeviceCommunicationChannel)parentChannel;
- (AVSystemRemotePoolOutputDeviceCommunicationChannelImpl)initWithDeviceID:(id)a3 channelUUID:(__CFString *)a4 outputContext:(id)a5;
- (void)close;
- (void)dealloc;
- (void)sendData:(id)a3 completionHandler:(id)a4;
- (void)setParentChannel:(id)a3;
@end

@implementation AVSystemRemotePoolOutputDeviceCommunicationChannelImpl

- (AVSystemRemotePoolOutputDeviceCommunicationChannelImpl)initWithDeviceID:(id)a3 channelUUID:(__CFString *)a4 outputContext:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)AVSystemRemotePoolOutputDeviceCommunicationChannelImpl;
  v8 = [(AVSystemRemotePoolOutputDeviceCommunicationChannelImpl *)&v13 init];
  if (!v8) {
    goto LABEL_10;
  }
  v9 = (AVOutputContext *)a5;
  v8->_outputContext = v9;
  if (!v9) {
    goto LABEL_10;
  }
  if (![(AVOutputContext *)v9 figRoutingContext]) {
    goto LABEL_10;
  }
  uint64_t v10 = [a3 copy];
  v8->_deviceID = (NSString *)v10;
  if (!v10) {
    goto LABEL_10;
  }
  if (!a4)
  {
    v8->_commChannelUUID = 0;
    goto LABEL_9;
  }
  v11 = (__CFString *)CFRetain(a4);
  v8->_commChannelUUID = v11;
  if (!v11)
  {
LABEL_10:
    a4 = 0;
    goto LABEL_9;
  }
  a4 = v8;
LABEL_9:

  return (AVSystemRemotePoolOutputDeviceCommunicationChannelImpl *)a4;
}

- (void)dealloc
{
  commChannelUUID = self->_commChannelUUID;
  if (commChannelUUID) {
    CFRelease(commChannelUUID);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVSystemRemotePoolOutputDeviceCommunicationChannelImpl;
  [(AVSystemRemotePoolOutputDeviceCommunicationChannelImpl *)&v4 dealloc];
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a4 copy];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = [(AVOutputContext *)self->_outputContext figRoutingContext];
  deviceID = self->_deviceID;
  commChannelUUID = self->_commChannelUUID;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  objc_super v13 = *(void (**)(OpaqueFigRoutingContext *, NSString *, __CFString *, id, void (*)(uint64_t, uint64_t, signed int, void (**)(void, void)), uint64_t))(v12 + 160);
  if (v13) {
    v13(v8, deviceID, commChannelUUID, a3, AVSystemRemotePoolOutputDeviceCommunicationChannelSendDataCompletion, v6);
  }
}

- (void)close
{
  v3 = [(AVOutputContext *)self->_outputContext figRoutingContext];
  deviceID = self->_deviceID;
  commChannelUUID = self->_commChannelUUID;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(void (**)(OpaqueFigRoutingContext *, NSString *, __CFString *))(v7 + 168);
  if (v8)
  {
    v8(v3, deviceID, commChannelUUID);
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