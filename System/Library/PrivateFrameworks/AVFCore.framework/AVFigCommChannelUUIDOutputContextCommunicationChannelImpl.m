@interface AVFigCommChannelUUIDOutputContextCommunicationChannelImpl
- (AVFigCommChannelUUIDOutputContextCommunicationChannelImpl)init;
- (AVFigCommChannelUUIDOutputContextCommunicationChannelImpl)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 commChannelUUID:(__CFString *)a4;
- (AVOutputContextCommunicationChannel)parentCommunicationChannel;
- (__CFString)commChannelUUID;
- (void)dealloc;
- (void)sendData:(id)a3 completionHandler:(id)a4;
- (void)setParentCommunicationChannel:(id)a3;
@end

@implementation AVFigCommChannelUUIDOutputContextCommunicationChannelImpl

- (AVFigCommChannelUUIDOutputContextCommunicationChannelImpl)init
{
  return [(AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *)self initWithRoutingContext:0 commChannelUUID:0];
}

- (AVFigCommChannelUUIDOutputContextCommunicationChannelImpl)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 commChannelUUID:(__CFString *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AVFigCommChannelUUIDOutputContextCommunicationChannelImpl;
  v6 = [(AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *)&v11 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  if (!a3)
  {
    a4 = 0;
    v6->_routingContext = 0;
    goto LABEL_9;
  }
  v8 = (OpaqueFigRoutingContext *)CFRetain(a3);
  v7->_routingContext = v8;
  if (!v8) {
    goto LABEL_10;
  }
  if (!a4)
  {
    v7->_commChannelUUID = 0;
    goto LABEL_9;
  }
  v9 = (__CFString *)CFRetain(a4);
  v7->_commChannelUUID = v9;
  if (!v9)
  {
LABEL_10:
    a4 = 0;
    goto LABEL_9;
  }
  a4 = v7;
LABEL_9:

  return (AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *)a4;
}

- (void)dealloc
{
  routingContext = self->_routingContext;
  if (routingContext) {
    CFRelease(routingContext);
  }
  commChannelUUID = self->_commChannelUUID;
  if (commChannelUUID) {
    CFRelease(commChannelUUID);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVFigCommChannelUUIDOutputContextCommunicationChannelImpl;
  [(AVFigCommChannelUUIDOutputContextCommunicationChannelImpl *)&v5 dealloc];
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v8 = objc_msgSend(a4, "copy", v14, v15);
  routingContext = self->_routingContext;
  commChannelUUID = self->_commChannelUUID;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = *(void (**)(OpaqueFigRoutingContext *, __CFString *, id, void (*)(uint64_t, uint64_t, signed int, void (**)(void, void)), uint64_t))(v12 + 120);
  if (v13) {
    v13(routingContext, commChannelUUID, a3, AVFigRoutingContextSendDataCompletion, v8);
  }
}

- (AVOutputContextCommunicationChannel)parentCommunicationChannel
{
  return (AVOutputContextCommunicationChannel *)objc_loadWeak((id *)&self->_parentChannel);
}

- (void)setParentCommunicationChannel:(id)a3
{
}

- (__CFString)commChannelUUID
{
  return self->_commChannelUUID;
}

- (void).cxx_destruct
{
}

@end